# docs--kind-lunar-interop-export: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/lunar-interop-export.md
seg-d36e6d7d8a10 = Fuente: <c1/>

# text
# c1: lunar-interop-export
seg-fdf560e675f4 = <c1/> (tipo de escenario)

# text
seg-5a4dcb93a643 = Exportación de interoperabilidad lunar modelada: emite el marco de referencia lunar, la escala de tiempo lunar y las efemérides lunares en formas de intercambio alineadas con LunaNet/IOAG y basadas en CCSDS, con ajuste a la norma de ida y vuelta / de campos. REUTILIZA el emisor+analizador CCSDS OEM { "2.0" } del crate (crate::oem) reetiquetado para el contexto lunar: el REF_FRAME de OEM lleva el marco de cuerpo lunar WGCCRE de la IAU { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM la escala de tiempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON, sobre unas efemérides ilustrativas de muestra de clase LCNS (posiciones de crate::lunar_service, velocidad por diferencia finita). Emite también un descriptor de tiempo lunar alineado con LunaNet/IOAG (id de escala, tasa secular µs/día de crate::lunar_time, banda publicada, superficie de referencia) que hace ida y vuelta mediante serde_json, y envuelve los artefactos en la envoltura KIF existente (crate::interchange) con la etiqueta de honestidad MODELLED. Informa de los artefactos emitidos, el número de líneas de OEM, la superación del ajuste a la norma de campos + la lista de campos presentes/ausentes, la ida y vuelta de OEM correcta, la ida y vuelta de metadatos de tiempo correcta y el tamaño en bytes de KIF. MODELLED: la referencia independiente es la ida y vuelta determinista + el ajuste a la norma de los nombres de campo frente a la semántica de campos publicada de CCSDS OEM + LunaNet/IOAG; NO es una prueba certificada de ajuste a la norma de interoperabilidad; efemérides ilustrativas de fuente pública, sin afiliación a la ESA; sin TRL/herencia/respaldo de ninguna agencia.

# text
# c1: scenarios/lunar-interop-export.toml
seg-1726861e444f = Una ejecución de <c1/> se resume así: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } estados, OEM de { "23" } líneas | ajuste a la norma PASS ({ "9" } presentes / { "0" } ausentes) | ida y vuelta de OEM correcta | ida y vuelta de metadatos de tiempo correcta | KIF { "1640" } bytes | MODELLED

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-f8353e15aabd = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-interop-export.toml
seg-169f9446e90d = El ejemplo <c1/> establece, entre otros:

# text
seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

# text
seg-3f36bd2ec5ea = LTC

# text
seg-2ac27c1e55c0 = octeto

# attr:alt
seg-0e86ff364c17 = El gráfico que el motor escribe para scenarios/lunar-interop-export.toml, tipo de escenario lunar-interop-export

# text
# c1: oem
seg-98acb538942f = <b>MODELLED</b> Exportación de marco lunar + tiempo + efemérides alineada con LunaNet/IOAG (CCSDS OEM + KIF) con ajuste a la norma de ida y vuelta. Referencia independiente (InternalConsistency): la exportación OEM lunar de kshana vuelta a analizar con la biblioteca independiente de terceros <c1/> (R. J. Anderson): los tokens de marco/tiempo y el estado por época coinciden con la precisión de escritura ({ "1" } mm / { "1e-9" } km/s) y se rechaza una exportación sin TIME_SYSTEM; una ida y vuelta estructural de intercambio; la semántica física del marco y del tiempo lunares la validan sus propias filas, por lo que esta sigue siendo MODELLED. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): un a

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Emite también un descriptor de tiempo lunar alineado con LunaNet/IOAG (id de escala, tasa secular µs/día de crate::lunar_time, banda publicada, superficie de referencia) que hace ida y vuelta mediante serde_json, y envuelve los artefactos en la envoltura KIF existente (crate::interchange) con la etiqueta de honestidad MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED: la referencia independiente es la ida y vuelta determinista + el ajuste a la norma de los nombres de campo frente a la semántica de campos publicada de CCSDS OEM + LunaNet/IOAG; NO es una prueba certificada de ajuste a la norma de interoperabilidad; efemérides ilustrativas de fuente pública, sin afiliación a la ESA; sin TRL/herencia/respaldo de ninguna agencia. (catálogo de tipos de escenario (<c1/>))

# text
seg-254d48fe58a5 = La exportación de interoperabilidad lunar es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Anterior</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Siguiente</s1>lunar-jamming

# text
seg-11d0ccba5ee7 = LO QUE HACE src/lunar_interop.rs: * export_lunar_oem: REUTILIZA el emisor CCSDS OEM { "2.0" } del crate (crate::oem), reetiquetado para el contexto lunar: REF_FRAME = el marco de cuerpo lunar WGCCRE de la IAU { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM = la escala de tiempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON, sobre unas efemérides ILLUSTRATIVE de muestra de clase LCNS (posiciones de crate::lunar_service, velocidad por diferencia finita central). * export_ (comentario del archivo de escenario, líneas { "6" } a { "19" })

# text
seg-f730e8f789cf = HONESTIDAD: MODELLED. Los NOMBRES de campo y las unidades están alineados con estándares PUBLIC (CCSDS 502.0-B OEM, marcos lunares IAU WGCCRE { "2015" }, LunaNet Interoperability Specification / arquitectura lunar de IOAG). La ida y vuelta determinista y el ajuste a la norma de los nombres de campo son la referencia independiente. Esto NO es una prueba certificada de ajuste a la norma de interoperabilidad. Las efemérides son ilustrativas, de fuente pública, SIN afiliación a la ESA, y no implican ningún TRL (comentario del archivo de escenario, líneas { "21" } a { "26" })
