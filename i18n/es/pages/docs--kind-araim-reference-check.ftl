# docs--kind-araim-reference-check: translations (es)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Fuente: <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (tipo de escenario)

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: published
seg-06197409c717 = Vectores de referencia ARAIM publicados para la certificación: los niveles de protección horizontal y vertical ARAIM del motor, ejecutados frente a los PROPIOS ejemplos numéricos resueltos del Subgrupo Técnico ARAIM del WG-C, con la tolerancia (TOL_PL = { "5e-2" } m) que esos mismos documentos indican. Se incluyen dos vectores como datos de prueba, cada uno con su URL de obtención, fecha de obtención, SHA-256 del archivo de origen y página: el Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Apéndice D — autoconsistente, y el vector de aceptación — y el Milestone { "3" } Report ({ "2016" }), Anexo A sección A.IX, la declaración que citan las bibliografías de investigación. Cada entrada publicada (la matriz de geometría de 10 satélites y 2 constelaciones, las diagonales de varianza C_int y C_acc, b_nom, P_sat, P_const y el conjunto de constantes LPV-200) y cada salida publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 y los sigma_3, sigma_ss_3 y b_3 de los dos modos de fallo de constelación) se informa junto al número propio del motor y su diferencia absoluta. La ecuación del nivel de protección NO se resuelve de nuevo aquí: la lista de modos de la referencia se entrega a las funciones existentes del motor raim::araim_protection_level / araim_integrity_risk, de modo que la bisección y el álgebra de cola gaussiana sometidas a prueba son las propias del motor; solo se construyen para él la geometría, las subsoluciones, los umbrales de detección y el reparto de presupuesto publicado. EXTERNALLY CHECKED frente al vector de { "2019" }: VPL { "18.2926" } m frente a { "18.3" } m publicados, HPL { "13.4063" } m frente a { "13.45" } m, EMT { "7.2997" } m frente a { "7.2998" } m, sigma_v_acc { "1.3694" } m frente a { "1.3694" } m, y los seis intermedios publicados dentro de media unidad de su último decimal impreso. El vector de { "2016" } contiene dos defectos internos que el informe declara en lugar de ocultar — una errata de signo en la fila { "3" } de G, y un K_fa_3 evaluado con { "57" } modos de fallo mientras el documento indica N_fault_max = { "1" } ({ "12" } modos) — por lo que sus intermedios de geometría se reproducen exactamente mientras que sus niveles de protección se informan como discrepancias medidas y se excluyen de la cifra de aceptación; la tolerancia nunca se amplía para absorberlos. Cada campo numérico emitido lleva una unidad y una clase de procedencia, y una cifra transcrita se etiqueta <c1/> para que nunca pueda confundirse con una calculada. ALCANCE: solo se implementa N_fault_max = { "1" } (modos de fallo de un solo satélite y de una sola constelación), y un caso cuyas probabilidades a priori exijan subconjuntos de fallo simultáneos de varios eventos es REFUSED en lugar de truncarse en silencio; la detección y exclusión de fallos, la comprobación de consistencia chi-cuadrado y el paso de reasignación por doble recuento del algoritmo de referencia quedan fuera del alcance. Esto reproduce el ejemplo resuelto de un algoritmo de referencia publicado — no es una certificación, un artefacto de aeronavegabilidad ni una aprobación.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Una ejecución de <c1/> se resume así: araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

# text
# c1: vector
seg-b1be6b5632c1 = Campos opcionales: <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = El ejemplo <c1/> establece, entre otros:

# text
seg-9de6e1b3352d = Etiqueta del resultado (la del motor): EXTERNALLY CHECKED — los niveles de protección ARAIM del motor ejecutados frente a los ejemplos numéricos resueltos publicados del algoritmo aerotransportado de referencia del Subgrupo Técnico ARAIM del Grupo de Trabajo C UE-EE. UU., con la tolerancia (TOL_PL) que esos mismos documentos indican. Cada cifra publicada lleva su UR

# attr:alt
seg-693c823c85d1 = El gráfico que escribe el motor para scenarios/araim-reference-check.toml, tipo de escenario araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> La propia ecuación del nivel de protección por separación de soluciones con hipótesis múltiples: mínimos cuadrados ponderados con todos los satélites en vista y por modo de fallo sobre una geometría Este/Norte/Arriba con un estado de reloj por constelación, los sigma de las subsoluciones, la separación de soluciones Pruebas: <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> La propia ecuación del nivel de protección por separación de soluciones con hipótesis múltiples: mínimos cuadrados ponderados con todos los satélites en vista y por modo de fallo sobre una geometría Este/Norte/Arriba. Referencia independiente (ExternalDataset): Subgrupo Técnico ARAIM del Grupo de Trabajo C UE-EE. UU., Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junio de { "2019" }), ejemplo numérico resuelto del Apéndice D — ENTRADAS publicadas (matriz de geometría de 10 satélites y 2 constelaciones, diagonales C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) y SALIDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } y seis intermedios de fallo de constelación

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Página de tema: <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Anterior</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Siguiente</s1>ascent-losses
