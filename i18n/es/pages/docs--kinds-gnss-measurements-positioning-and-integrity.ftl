# docs--kinds-gnss-measurements-positioning-and-integrity: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: published
seg-06197409c717 = Vectores de referencia ARAIM publicados para la certificación: los niveles de protección horizontal y vertical ARAIM del motor, ejecutados frente a los PROPIOS ejemplos numéricos resueltos del Subgrupo Técnico ARAIM del WG-C, con la tolerancia (TOL_PL = { "5e-2" } m) que esos mismos documentos indican. Se incluyen dos vectores como datos de prueba, cada uno con su URL de obtención, fecha de obtención, SHA-256 del archivo de origen y página: el Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Apéndice D — autoconsistente, y el vector de aceptación — y el Milestone { "3" } Report ({ "2016" }), Anexo A sección A.IX, la declaración que citan las bibliografías de investigación. Cada entrada publicada (la matriz de geometría de 10 satélites y 2 constelaciones, las diagonales de varianza C_int y C_acc, b_nom, P_sat, P_const y el conjunto de constantes LPV-200) y cada salida publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 y los sigma_3, sigma_ss_3 y b_3 de los dos modos de fallo de constelación) se informa junto al número propio del motor y su diferencia absoluta. La ecuación del nivel de protección NO se resuelve de nuevo aquí: la lista de modos de la referencia se entrega a las funciones existentes del motor raim::araim_protection_level / araim_integrity_risk, de modo que la bisección y el álgebra de cola gaussiana sometidas a prueba son las propias del motor; solo se construyen para él la geometría, las subsoluciones, los umbrales de detección y el reparto de presupuesto publicado. EXTERNALLY CHECKED frente al vector de { "2019" }: VPL { "18.2926" } m frente a { "18.3" } m publicados, HPL { "13.4063" } m frente a { "13.45" } m, EMT { "7.2997" } m frente a { "7.2998" } m, sigma_v_acc { "1.3694" } m frente a { "1.3694" } m, y los seis intermedios publicados dentro de media unidad de su último decimal impreso. El vector de { "2016" } contiene dos defectos internos que el informe declara en lugar de ocultar — una errata de signo en la fila { "3" } de G, y un K_fa_3 evaluado con { "57" } modos de fallo mientras el documento indica N_fault_max = { "1" } ({ "12" } modos) — por lo que sus intermedios de geometría se reproducen exactamente mientras que sus niveles de protección se informan como discrepancias medidas y se excluyen de la cifra de aceptación; la tolerancia nunca se amplía para absorberlos. Cada campo numérico emitido lleva una unidad y una clase de procedencia, y una cifra transcrita se etiqueta <c1/> para que nunca pueda confundirse con una calculada. ALCANCE: solo se implementa N_fault_max = { "1" } (modos de fallo de un solo satélite y de una sola constelación), y un caso cuyas probabilidades a priori exijan subconjuntos de fallo simultáneos de varios eventos es REFUSED en lugar de truncarse en silencio; la detección y exclusión de fallos, la comprobación de consistencia chi-cuadrado y el paso de reasignación por doble recuento del algoritmo de referencia quedan fuera del alcance. Esto reproduce el ejemplo resuelto de un algoritmo de referencia publicado — no es una certificación, un artefacto de aeronavegabilidad ni una aprobación.

# attr:alt
seg-693c823c85d1 = El gráfico que escribe el motor para scenarios/araim-reference-check.toml, tipo de escenario araim-reference-check

# text
seg-2ffccc9c1eff = Simulación de pseudodistancias en el dominio de la medida (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# attr:alt
seg-47ee40d4eb73 = El gráfico que escribe el motor para scenarios/gnss-sim-raim.toml, tipo de escenario gnss-sim

# text
seg-eb7e0c2feb2b = RAIM instantáneo / de separación de soluciones / ARAIM con HPL/VPL y un diagrama de Stanford.

# attr:alt
seg-ce7f6130ddee = El gráfico que el motor escribe para scenarios/integrity-raim.toml, tipo de escenario integrity
