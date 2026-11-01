# docs--kind-araim-reference-check: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Fonte: <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (tipo de cenário)

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
# c1: published
seg-06197409c717 = Vetores de referência de certificação ARAIM publicados: os níveis de proteção horizontal e vertical ARAIM do motor executados face aos PRÓPRIOS exemplos numéricos resolvidos do Subgrupo Técnico ARAIM do WG-C, com a tolerância (TOL_PL = { "5e-2" } m) que esses próprios documentos indicam. Dois vetores estão submetidos como dados de teste, cada um com o seu URL de obtenção, data de obtenção, SHA-256 do ficheiro de origem e página: o Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Apêndice D — autoconsistente, e o vetor de aceitação — e o Milestone { "3" } Report ({ "2016" }) Anexo A secção A.IX, a declaração que as bibliografias de investigação citam. Cada entrada publicada (a matriz de geometria de 10 satélites e 2 constelações, as diagonais de variância C_int e C_acc, b_nom, P_sat, P_const e o conjunto de constantes LPV-200) e cada saída publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 e os sigma_3, sigma_ss_3 e b_3 dos dois modos de falha de constelação) é comunicada junto do número do próprio motor e da sua diferença absoluta. A equação do nível de proteção NÃO é resolvida de novo aqui: a lista de modos da referência é entregue ao raim::araim_protection_level / araim_integrity_risk já existentes do motor, pelo que a bissecção e a álgebra da cauda gaussiana em teste são as do próprio motor; apenas a geometria, as subsoluções, os limiares de deteção e a divisão do orçamento publicada são construídos para ele. EXTERNALLY CHECKED face ao vetor de { "2019" }: VPL { "18.2926" } m face a { "18.3" } m publicado, HPL { "13.4063" } m face a { "13.45" } m, EMT { "7.2997" } m face a { "7.2998" } m, sigma_v_acc { "1.3694" } m face a { "1.3694" } m, e todos os seis intermédios publicados com uma diferença inferior a meia unidade na sua última casa decimal impressa. O vetor de { "2016" } contém dois defeitos internos que o relatório indica em vez de ocultar — um erro de sinal na linha { "3" } de G, e um K_fa_3 avaliado em { "57" } modos de falha enquanto o documento indica N_fault_max = { "1" } ({ "12" } modos) — pelo que os seus intermédios de geometria são reproduzidos exatamente, enquanto os seus níveis de proteção são comunicados como discrepâncias medidas e excluídos do valor de aceitação; a tolerância nunca é alargada para os absorver. Cada campo numérico emitido tem uma unidade e uma classe de proveniência, e um valor transcrito é etiquetado <c1/> para que nunca possa ser confundido com um calculado. ÂMBITO: apenas N_fault_max = { "1" } (modos de falha de um único satélite e de uma única constelação) está implementado, e um caso cujas probabilidades a priori exijam subconjuntos de falhas simultâneas de vários eventos é REFUSED em vez de truncado em silêncio; a deteção de falhas, a exclusão, a verificação de consistência do qui-quadrado e o passo de reatribuição da dupla contagem do algoritmo de referência estão fora do âmbito. Isto reproduz o exemplo resolvido de um algoritmo de referência publicado — não é uma certificação, um artefacto de aeronavegabilidade nem uma aprovação.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Uma execução de <c1/> resume-se assim: araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

# text
# c1: vector
seg-b1be6b5632c1 = Campos opcionais: <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = O exemplo <c1/> define, entre outros:

# text
seg-9de6e1b3352d = Etiqueta do resultado (a do motor): EXTERNALLY CHECKED — os níveis de proteção ARAIM do motor executados face aos exemplos numéricos resolvidos publicados do algoritmo aerotransportado de referência do Subgrupo Técnico ARAIM do Grupo de Trabalho C UE-EUA, com a tolerância (TOL_PL) que esses próprios documentos indicam. Cada valor publicado tem o seu UR

# attr:alt
seg-693c823c85d1 = O gráfico que o motor escreve para scenarios/araim-reference-check.toml, tipo araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> A própria equação do nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos os satélites em vista e por modo de falha numa geometria Este/Norte/Cima com um estado de relógio por constelação, os sigmas das subsoluções, a separação de soluções Testes: <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> A própria equação do nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos os satélites em vista e por modo de falha numa geometria Este/Norte/Cima. Referência independente (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junho de { "2019" }), exemplo numérico resolvido do Apêndice D — ENTRADAS publicadas (matriz de geometria de 10 satélites e 2 constelações, diagonais C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) e SAÍDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" }, e seis intermédios de falha de constelação

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-f4cf8b629797 = Página do tema: <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Página do tema: <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Anterior</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Seguinte</s1>ascent-losses
