# docs--kind-oem-interop: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: docs/kinds/by-kind/oem-interop.md
seg-4abcbdaddcf8 = Fuente: <c1/>

# text
# c1: oem-interop
seg-a92dcafd670e = <c1/> (tipo de escenario)

# text
seg-dbffff25b57f = Puente de interoperabilidad CCSDS OEM: importa un Orbit Ephemeris Message producido por una herramienta externa de dinámica de vuelo (GMAT/Orekit/STK emiten todas OEM) e indica sus segmentos, objetos, marcos y rango de épocas, más una comprobación de coherencia de velocidad; sin entrada, hace un recorrido de ida y vuelta de una órbita de referencia generada e indica la fidelidad entre importación y exportación. Comprobación de ingesta estructural y física MODELLED, NO una validación de la precisión orbital de la fuente.

# text
# c1: scenarios/oem-interop.toml
seg-21eb1c9d7571 = Una ejecución de <c1/> se resume así: oem-interop: ida y vuelta de { "2" } segmento(s), { "12" } estados; error máximo de ida y vuelta { "4.88e-7" } km / { "4.61e-10" } km/s (interoperabilidad MODELLED)

# text
# c1: oem_text
seg-54c35d9fbfd9 = Campos opcionales: <c1/>

# text
# c1: scenarios/oem-interop.toml
seg-d4117f615cd8 = El ejemplo <c1/> establece, entre otros:

# text
seg-d7db74d14617 = KSHANA

# text
seg-b16f858574ca = Etiqueta del resultado (la del motor): MODELLED — puente de interoperabilidad de importación y ida y vuelta de CCSDS OEM (GMAT/Orekit/STK emiten OEM); una comprobación de ingesta estructural y física, NO una validación de la precisión orbital de la fuente

# attr:alt
seg-5db5a7c812ca = El gráfico que el motor genera para scenarios/oem-interop.toml, tipo de escenario oem-interop

# text
seg-cd29f08ef235 = <b>VALIDATED</b> Importador de CCSDS { "502.0" } OEM (parse_oem), tolerante con las líneas COMMENT, las palabras clave de metadatos adicionales y los bloques de covarianza, e inverso exacto del escritor; ida y vuelta + ingesta de archivos externos con una comprobación de coherencia de velocidad. Pruebas: <a1>ccsds_oem_interop_reference.rs</a1>.

# text
# c1: oem
seg-20071a16b316 = <b>VALIDATED</b> Importador de CCSDS { "502.0" } OEM (parse_oem), tolerante con las líneas COMMENT, las palabras clave de metadatos adicionales y los bloques de covarianza, e inverso exacto del escritor; ida y vuelta + . Referencia independiente (ExternalDataset): Analizador independiente de terceros de CCSDS-502 <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>): una base de código separada que decodifica byte por byte de forma idéntica el OEM EME2000/UTC emitido por kshana ({ "24" } estados en { "2" } archivos de prueba, Δ de pos/vel = { "0" }) y cuyo lector estricto confirma los tokens de metadatos; el analizador de kshana coincide igualmente con él en un OEM externo incorporado. Dos hallazgos honestos de interoperabilidad (la biblioteca oem rechaza el mu por satélite de kshana

# text
# c1: label
seg-7ab6bb7a1b8a = MODELLED — puente de interoperabilidad de importación y ida y vuelta de CCSDS OEM (GMAT/Orekit/STK emiten OEM); una comprobación de ingesta estructural y física, NO una validación de la precisión orbital de la fuente (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-343a56c07d02 = Comprobación de ingesta estructural y física MODELLED, NO una validación de la precisión orbital de la fuente. (catálogo de tipos (<c1/>))

# text
seg-44aba1ad1d37 = ALCANCE HONESTO: comprobación de ingesta estructural y física MODELLED, NO una validación de la precisión orbital de las efemérides de origen. Ejecución: kshana scenarios/oem-interop.toml (comentario del archivo de escenario, líneas { "11" } a { "13" })

# text
seg-833df8eedc34 = <s1>Anterior</s1>ntn-positioning

# text
seg-28254e1b38d4 = <s1>Siguiente</s1>optical-atmosphere
