# docs--kind-araim-reference-check: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Fonte: <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (tipo de cenário)

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: published
seg-06197409c717 = Vetores de referência de certificação do ARAIM publicados: os níveis de proteção horizontal e vertical do ARAIM do motor executados contra os PRÓPRIOS exemplos numéricos resolvidos do Subgrupo Técnico de ARAIM do WG-C, na tolerância (TOL_PL = { "5e-2" } m) que esses próprios documentos declaram. Dois vetores estão versionados como fixtures, cada um com o seu URL de obtenção, a data de obtenção, o SHA-256 do arquivo de origem e a página: o Apêndice D do Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) — autoconsistente e o vetor de aceitação — e a Seção A.IX do Anexo A do Milestone { "3" } Report ({ "2016" }), a declaração que as bibliografias de pesquisa citam. Toda entrada publicada (a matriz de geometria de 10 satélites e 2 constelações, as diagonais de variância C_int e C_acc, b_nom, P_sat, P_const e o conjunto de constantes LPV-200) e toda saída publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 e os sigma_3, sigma_ss_3 e b_3 dos dois modos de falha de constelação) é informada ao lado do número do próprio motor e da sua diferença absoluta. A equação do nível de proteção NÃO é resolvida de novo aqui: a lista de modos da referência é entregue ao raim::araim_protection_level / araim_integrity_risk já existentes do motor, de modo que a bissecção e a álgebra da cauda gaussiana sob teste são as do próprio motor; só a geometria, as subsoluções, os limiares de detecção e a divisão de orçamento publicada são construídos para ele. EXTERNALLY CHECKED contra o vetor de { "2019" }: VPL { "18.2926" } m contra { "18.3" } m publicado, HPL { "13.4063" } m contra { "13.45" } m, EMT { "7.2997" } m contra { "7.2998" } m, sigma_v_acc { "1.3694" } m contra { "1.3694" } m, e todos os seis intermediários publicados com precisão de meia unidade na última casa decimal impressa. O vetor de { "2016" } traz dois defeitos internos que o relatório declara em vez de ocultar — um erro de sinal na linha { "3" } de G e um K_fa_3 avaliado em { "57" } modos de falha enquanto o documento declara N_fault_max = { "1" } ({ "12" } modos) — de modo que os seus intermediários de geometria são reproduzidos exatamente, enquanto os seus níveis de proteção são informados como discrepâncias medidas e excluídos da figura de aceitação; a tolerância nunca é ampliada para absorvê-los. Todo campo numérico emitido traz uma unidade e uma classe de proveniência, e uma figura transcrita é rotulada <c1/> para que nunca possa ser confundida com uma calculada. ESCOPO: apenas N_fault_max = { "1" } (modos de falha de um único satélite e de uma única constelação) está implementado, e um caso cujas probabilidades a priori exigem subconjuntos de falhas simultâneas de vários eventos é REFUSED em vez de ser truncado silenciosamente; a detecção e exclusão de falhas, a verificação de consistência do qui-quadrado e a etapa de realocação de dupla contagem do algoritmo de referência estão fora do escopo. Isto reproduz o exemplo resolvido de um algoritmo de referência publicado — não é uma certificação, um artefato de aeronavegabilidade nem uma aprovação.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Uma execução de <c1/> resume-se assim: araim-reference-check: { "2" } vetor(es) de referência do WG-C publicado(s); pior concordância de VPL/HPL { "0.0437" } m contra o TOL_PL = { "0.05" } m da própria referência sobre { "1" } vetor(es) de aceitação

# text
# c1: vector
seg-b1be6b5632c1 = Campos opcionais: <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = O exemplo <c1/> define, entre outros:

# text
seg-9de6e1b3352d = Rótulo do resultado (o do motor): EXTERNALLY CHECKED — os níveis de proteção do ARAIM do motor executados contra os exemplos numéricos resolvidos publicados do algoritmo aerotransportado de referência do Subgrupo Técnico de ARAIM do Grupo de Trabalho C UE-EUA, na tolerância (TOL_PL) que esses próprios documentos declaram. Toda figura publicada traz o seu UR

# text
# attr:alt
seg-693c823c85d1 = O gráfico que o motor grava para scenarios/araim-reference-check.toml, tipo de cenário araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> A própria equação do nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos em vista e por modo de falha sobre uma geometria Leste/Norte/Cima com um estado de relógio por constelação, os sigmas das subsoluções, a separação de soluções Testes: <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> A própria equação do nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos em vista e por modo de falha sobre uma geometria Leste/Norte/Cima. Referência independente (ExternalDataset): Subgrupo Técnico de ARAIM do Grupo de Trabalho C UE-EUA, Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junho de { "2019" }), exemplo numérico resolvido do Apêndice D — ENTRADAS publicadas (matriz de geometria de 10 satélites e 2 constelações, diagonais C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) e SAÍDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } e seis intermediários de falha de constelação

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-f4cf8b629797 = Página do tópico: <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Página do tópico: <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Anterior</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Próxima</s1>ascent-losses
