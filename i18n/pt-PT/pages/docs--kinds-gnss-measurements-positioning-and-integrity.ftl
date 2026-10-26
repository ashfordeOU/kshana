# docs--kinds-gnss-measurements-positioning-and-integrity: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: published
seg-06197409c717 = Vetores de referência de certificação ARAIM publicados: os níveis de proteção horizontal e vertical ARAIM do motor executados face aos PRÓPRIOS exemplos numéricos resolvidos do Subgrupo Técnico ARAIM do WG-C, com a tolerância (TOL_PL = { "5e-2" } m) que esses próprios documentos indicam. Dois vetores estão submetidos como dados de teste, cada um com o seu URL de obtenção, data de obtenção, SHA-256 do ficheiro de origem e página: o Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Apêndice D — autoconsistente, e o vetor de aceitação — e o Milestone { "3" } Report ({ "2016" }) Anexo A secção A.IX, a declaração que as bibliografias de investigação citam. Cada entrada publicada (a matriz de geometria de 10 satélites e 2 constelações, as diagonais de variância C_int e C_acc, b_nom, P_sat, P_const e o conjunto de constantes LPV-200) e cada saída publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 e os sigma_3, sigma_ss_3 e b_3 dos dois modos de falha de constelação) é comunicada junto do número do próprio motor e da sua diferença absoluta. A equação do nível de proteção NÃO é resolvida de novo aqui: a lista de modos da referência é entregue ao raim::araim_protection_level / araim_integrity_risk já existentes do motor, pelo que a bissecção e a álgebra da cauda gaussiana em teste são as do próprio motor; apenas a geometria, as subsoluções, os limiares de deteção e a divisão do orçamento publicada são construídos para ele. EXTERNALLY CHECKED face ao vetor de { "2019" }: VPL { "18.2926" } m face a { "18.3" } m publicado, HPL { "13.4063" } m face a { "13.45" } m, EMT { "7.2997" } m face a { "7.2998" } m, sigma_v_acc { "1.3694" } m face a { "1.3694" } m, e todos os seis intermédios publicados com uma diferença inferior a meia unidade na sua última casa decimal impressa. O vetor de { "2016" } contém dois defeitos internos que o relatório indica em vez de ocultar — um erro de sinal na linha { "3" } de G, e um K_fa_3 avaliado em { "57" } modos de falha enquanto o documento indica N_fault_max = { "1" } ({ "12" } modos) — pelo que os seus intermédios de geometria são reproduzidos exatamente, enquanto os seus níveis de proteção são comunicados como discrepâncias medidas e excluídos do valor de aceitação; a tolerância nunca é alargada para os absorver. Cada campo numérico emitido tem uma unidade e uma classe de proveniência, e um valor transcrito é etiquetado <c1/> para que nunca possa ser confundido com um calculado. ÂMBITO: apenas N_fault_max = { "1" } (modos de falha de um único satélite e de uma única constelação) está implementado, e um caso cujas probabilidades a priori exijam subconjuntos de falhas simultâneas de vários eventos é REFUSED em vez de truncado em silêncio; a deteção de falhas, a exclusão, a verificação de consistência do qui-quadrado e o passo de reatribuição da dupla contagem do algoritmo de referência estão fora do âmbito. Isto reproduz o exemplo resolvido de um algoritmo de referência publicado — não é uma certificação, um artefacto de aeronavegabilidade nem uma aprovação.

# attr:alt
seg-693c823c85d1 = O gráfico que o motor escreve para scenarios/araim-reference-check.toml, tipo araim-reference-check

# text
seg-2ffccc9c1eff = Simulação de pseudodistância no domínio da medição (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# attr:alt
seg-47ee40d4eb73 = O gráfico que o motor gera para scenarios/gnss-sim-raim.toml, tipo de cenário gnss-sim

# text
seg-eb7e0c2feb2b = RAIM instantâneo / de separação de soluções / ARAIM com HPL/VPL e um diagrama de Stanford.

# attr:alt
seg-ce7f6130ddee = O gráfico que o motor gera para scenarios/integrity-raim.toml, tipo de cenário integrity
