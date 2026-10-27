# docs--kind-timetransfer: translations (es)

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
seg-5a70fcb097dc = Campos opcionales: ninguno

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidireccional/TWSTFT (Sagnac), vista común de GNSS, PPP; fluctuación del enlace→distancia. Referencia independiente (ExternalDataset): Magnitud de Sagnac comprobada frente a un VALOR PUBLICADO de autoridad: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Ec. { "1.29" }: una circunnavegación ecuatorial hacia el este acumula { "207.4" } ns (2ωA_E/c²); kshana reproduce { "207.386" } ns. Corroborado de forma independiente por geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que lleva la misma geometría 2Aω/c². El BIPM TWSTFT compuesto transponder/common-view/

# text
seg-a8beb8dfc757 = El presupuesto de errores de transferencia de tiempo es MODELLED, no validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, así que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-37a77f49f048 = ps

# text
# c1: docs/kinds/by-kind/timetransfer.md
seg-2ccebbc74d9f = Fuente: <c1/>

# text
# c1: timetransfer
seg-289a9f8dc990 = <c1/> (tipo de escenario)

# text
seg-ccb244e60d60 = Transferencia bidireccional de tiempo y frecuencia óptica frente a RF.

# text
# c1: scenarios/timetransfer.toml
seg-59347fda6c66 = Una ejecución de <c1/> se resume así: escenario 8f9c2e0e31a5 | óptico sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-890040dd3d96 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/timetransfer.toml
seg-7b887ea27a86 = El ejemplo <c1/> establece, entre otros:

# text
seg-2485eaa6dbf4 = Transferencia bidireccional de tiempo y frecuencia por satélite (TWSTFT, banda Ku

# text
seg-fa54f1a81b57 = Enlace óptico entre satélites, sincronización a nivel de picosegundos

# text
seg-a30fe2b87ee2 = mm

# attr:alt
seg-bd76bd68eab3 = El gráfico que el motor genera para scenarios/timetransfer.toml, tipo de escenario timetransfer

# text
seg-3c9d28692f9f = <b>MODELLED</b> Bidireccional/TWSTFT (Sagnac), vista común de GNSS, PPP; fluctuación del enlace→distancia Pruebas: <a1>time_transfer_error_budgeting_reference.rs</a1>.

# text
seg-84fcf20588fb = <s1>Anterior</s1>time-transfer-budget

# text
seg-149ad280a1f9 = <s1>Siguiente</s1>tracking-loop
