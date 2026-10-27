# docs--araim-reference: translations (pt-BR)

# text
# c1: docs/ARAIM_REFERENCE.md
seg-c316596d7ec8 = Fonte: <c1/>

# text
seg-4768b19aaed7 = Referência do ARAIM — níveis de proteção do RAIM avançado no Kshana

# text
# c1: src/raim.rs
seg-93c83a737a43 = Esta nota documenta a implementação aberta do Kshana do <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: o algoritmo, cada premissa, a mensagem de suporte à integridade que ele consome e o estado da validação. A implementação está em <a1><c1/></a1>; este documento é o texto de acompanhamento que um auditor (ou um revisor de aquisições) pode ler junto com o código.

# text
seg-f5a7abecc2df = O ARAIM é o sucessor de dupla constelação e multifrequência do RAIM clássico que o Grupo de Trabalho C (WG-C) GPS (Global Positioning System)–Galileo definiu para dar suporte a guiamento horizontal e vertical até o LPV-200 (LPV: desempenho do localizador com guiamento vertical). Ele responde a uma única pergunta para cada época:

# text
# c1: P_HMI
seg-252dac107a2a = Quão grande deve ser o limite do erro de posição (o <em>nível de proteção</em>) para que a probabilidade residual de <em>informação perigosamente enganosa</em> — um erro maior que o limite enquanto o limite ainda está dentro do limite de alerta — permaneça abaixo do orçamento de risco de integridade <c1/>?

# text
seg-04299e9742b7 = { "1" }. A mensagem de suporte à integridade (ISM)

# text
# c1: IntegritySupportMessage
seg-717bea7d6bc8 = A ISM é o conjunto de parâmetros por constelação que o usuário aplica. Ela é modelada explicitamente por <a1><c1/></a1>:

# text
seg-fffbeccd4266 = Símbolo

# text
seg-2247a2344710 = Significado

# text
seg-d7e49778bed2 = σ_URE / SISE (erro do sinal no espaço)

# text
seg-b1b5bca63e21 = RMS (raiz do valor quadrático médio) do erro de distância usado para <b>exatidão e continuidade</b>

# text
seg-8ff2973d7f5b = σ_URA / SISA (exatidão do sinal no espaço)

# text
seg-f993962a5c9b = limite do erro de distância usado para <b>integridade</b> (≥ σ_URE)

# text
# c1: b_k = Σ_i |s_i|·b_nom
seg-727c7fbe1b01 = viés nominal máximo de distância incorporado de um lado só ao limite de integridade (<c1/>); veja §{ "3" }

# text
seg-a79e42c29c46 = probabilidade a priori de uma falha não detectada de um único satélite

# text
seg-78c45312d2ff = probabilidade a priori de uma falha em toda a constelação

# text
# c1: IntegritySupportMessage::gps_galileo_reference()
seg-19cc5ff2e541 = <c1/> retorna os valores de referência publicados do WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> ao longo do intervalo de exposição. Esses são os valores usados para dimensionar a disponibilidade do ARAIM na literatura de referência; a ISM operacional é transmitida ou montada em solo e é configurável por constelação. A distinção entre σ_URA (integridade) e σ_URE (exatidão) é deliberada e é a característica definidora do conceito de ISM.

# text
# c1: .fault_priors()
# c2: .dual_fault_priors()
seg-0c1687628e67 = <c1/> e <c2/> entregam estes valores diretamente aos dois motores.

# text
seg-8c516e53f595 = { "2" }. Hipóteses de falha

# text
# c1: H_k
seg-b6353366ebf0 = O ARAIM é um método de <em>separação de soluções com múltiplas hipóteses</em> (MHSS). Para cada hipótese de falha <c1/>, ele forma a solução com todos os satélites em vista e a subsolução que exclui o conjunto com falha, e limita o erro de posição sob essa hipótese:

# text
# c1: H_0
# c2: ≈ 1
seg-3b340e082b84 = <c1/> (a priori <c2/>): a solução completa de mínimos quadrados com todos os satélites em vista.

# text
seg-03332e433edc = Falhas de um único satélite

# text
# c1: H_i
# c2: P_sat
# c3: araim_raim
seg-add4792e4e40 = <c1/> (a priori <c2/> cada): toda subsolução com exclusão de um satélite. Esta é a linha de base clássica do ARAIM de falha única, <a1><c3/></a1>.

# text
seg-7e20f419e670 = Falhas em toda a constelação

# text
# c1: H_c
# c2: P_const
# c3: araim_dual_raim
# c4: P_const = 0
# c5: araim_raim
seg-920bd35833ff = <c1/> (a priori <c2/> cada): a subsolução que remove de uma só vez <em>todos</em> os satélites de uma constelação, a extensão da TN (nota técnica) do ARAIM da UE (União Europeia) / DO-316 implementada em <a1><c3/></a1>. Com <c4/>, ela se reduz <b>bit a bit</b> a <c5/>.

# text
seg-323dd205d238 = { "3" }. Níveis de proteção

# text
# c1: (p_fault, threshold, σ)
# c2: K_fa = Φ⁻¹(1 − P_fa / 2N)
# c3: N
# c4: PL
seg-9ab2676d2554 = Para cada eixo (vertical, horizontal) e cada hipótese, o motor constrói um modo <c1/> em que o limiar é o limite de detecção de separação de soluções no multiplicador de alerta falso <c2/> (uma divisão de Bonferroni do orçamento de continuidade entre as <c3/> hipóteses). O nível de proteção é o menor limite <c4/> cujo risco de integridade somado

# text
seg-05c0d8fc855c = Nota de implementação.

# text
# c1: b_k = Σ_i |s_{axis,i}|·b_nom
# c2: axis_bias_sum
# c3: horiz_bias_sum
# c4: b_nom_m
# c5: b_nom = 0.75 m
# c6: b_nom = 0
# c7: integrity
# c8: sigma_ura_m
# c9: sigma_uere_m
# c10: b_nom_m
# c11: INTEGRITY.md
seg-248092fe9b94 = <c1/> é a projeção unilateral do viés nominal sobre o eixo — a soma de pior caso das magnitudes de ganho por satélite (<a1><c2/>/<c3/></a1>) — obtida do <c4/> da ISM. A ISM de referência do WG-C usa <c5/>; com <c6/>, o limite se reduz à forma MHSS de viés nominal zero. O cenário executável <c7/> expõe <c8/> (o limite de integridade usado para o nível de proteção, restrito a ≥ <c9/> e com ele como padrão) e <c10/> (padrão { "0" }), de modo que o nível de proteção é sempre dimensionado com o limite de integridade σ_URA, nunca com o σ_URE de exatidão, menor. Esta continua sendo uma implementação de ARAIM <b>modelada e não certificada</b> — veja <a2><c11/></a2>.

# text
# c1: araim_protection_level
# c2: araim_integrity_risk
# c3: ≤
seg-f6bccff61ff5 = atinge o orçamento alocado ([<c1/>] / <a1><c2/></a1>). O VPL (nível de proteção vertical) e o HPL (nível de proteção horizontal) são as respostas vertical e horizontal. O resultado também informa o risco de integridade efetivamente alcançado (<c3/> a alocação) e se alguma subsolução se separou além de seu limiar.

# text
seg-b1a868221848 = Este é o contrato explícito do ARAIM — "quão grande deve ser o limite?" — em vez do risco implícito e dependente da geometria de um RAIM clássico de multiplicador fixo.

# text
seg-c90cf313dea8 = { "4" }. Diagrama de Stanford

# text
# c1: StanfordDiagram
# c2: (error, PL)
# c3: classify_stanford
# c4: stanford_svg
# c5: PL = error
seg-b51e44c3deda = <a1><c1/></a1> acumula <c2/> por época contra um limite de alerta (AL) fixo, e <a2><c3/></a2> classifica cada uma como <em>disponível</em>, <em>sistema indisponível</em> (PL > AL, conservador), <em>informação enganosa</em> (PL < erro ≤ AL) ou <em>informação perigosamente enganosa</em> (erro > AL e > PL). <a3><c4/></a3> renderiza o gráfico de dispersão clássico — a fronteira de integridade <c5/>, as guias do limite de alerta e um marcador colorido por época — como um SVG (Scalable Vector Graphics) autocontido.

# text
seg-c902173f6acf = { "5" }. O benefício da dupla constelação

# text
# c1: raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault
seg-96e114a6981c = Dois efeitos são demonstrados em <c1/>:

# text
seg-06c7d8d62b44 = <b>Geometria / redundância</b> — reunir os satélites de uma segunda constelação aperta o HPL de falha única: mais medições e um conjunto maior de subsoluções de SV único (SV: veículo espacial, isto é, um satélite) dão um limite estritamente menor.

# text
# c1: P_const
# c2: araim_dual_raim
# c3: None
seg-f788c9e07547 = <b>Tolerância a falhas de constelação</b> — com <c1/> ativo, o usuário de dupla constelação permanece disponível quando uma constelação inteira pode falhar (os satélites da <em>outra</em> constelação sobrevivem), ao passo que um usuário de constelação única comprovadamente não pode ser protegido contra a falha de sua própria constelação (<c2/> retorna <c3/>).

# text
seg-f52a937bad94 = Uma sutileza que vale declarar com honestidade: como a hipótese de falha de constelação exige sobreviver à perda de uma constelação <em>inteira</em>, o nível de proteção de <em>instantâneo</em> da dupla constelação é limitado inferiormente pela geometria residual de constelação única — ele não é automaticamente menor que o PL só com GPS em todo instante. O resultado principal da TN do ARAIM da UE, de que GPS+Galileo dá um <b>HPL { "15" }–{ "25" } % menor</b>, é um resultado de <b>disponibilidade</b> acumulado sobre constelações e locais de usuário realistas, e não uma garantia por instantâneo.

# text
seg-b4289b877902 = { "6" }. Estado da validação

# text
# c1: P_const = 0
# c2: tests/igs_real_data.rs
seg-e553de2eee63 = <b>No repositório, automatizado:</b> a álgebra MHSS (<c1/> ⇒ falha única bit a bit; a falha de constelação alarga o PL; o orçamento nunca é excedido), os benefícios de geometria e de falha de constelação acima, e o exercício sobre <b>geometria real de órbita precisa do IGS (International GNSS Service; GNSS = sistema global de navegação por satélite) (SP3, Standard Product { "3" })</b> (<c2/>), e não apenas constelações sintéticas.

# text
# c1: src/araim_reference.rs
# c2: tests/araim_reference_vectors.rs
# c3: tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt
# c4: TOL_PL = 5 × 10⁻² m
# c5: G
# c6: K_fa,3
# c7: N_fault,max = 1
# c8: araim-reference-check
seg-633bf11af170 = <b>Referência independente externa — o exemplo resolvido publicado do WG-C:</b> os níveis de proteção são conferidos contra o próprio exemplo numérico do Subgrupo Técnico do ARAIM, em <a1><c1/></a1>, <c2/> e na fixture versionada <c3/> (cada vetor traz sua URL (endereço web) de obtenção, data de obtenção, SHA-256 (SHA: Secure Hash Algorithm) do arquivo-fonte e página). A tolerância de aceitação é o próprio <c4/> da referência. Contra o Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Apêndice D: <b>VPL { "18.2926" } m contra { "18.3" } m publicado (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m contra { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (limiar efetivo de monitor) { "7.2997" } m contra { "7.2998" } m, σ_v,acc { "1.3694" } m contra { "1.3694" } m, e todos os seis intermediários publicados de falha de constelação (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) com diferença de até meia unidade na última casa decimal impressa. O Milestone { "3" } Report de { "2016" } declara o mesmo exemplo, mas traz dois defeitos internos — um erro de sinal na linha { "3" } de <c5/> e um <c6/> avaliado em { "57" } modos de falha enquanto o documento declara <c7/> ({ "12" } modos) — de modo que seus intermediários de geometria se reproduzem exatamente, enquanto seus níveis de proteção são registrados como discrepâncias medidas (Δ do VPL { "0.0171" } m, Δ do HPL { "0.0842" } m, Δ do EMT { "0.4806" } m) e excluídos do valor de aceitação. A verificação é acessível como o tipo de cenário <c8/>.

# text
# c1: N_fault,max = 1
seg-6d79f9836abd = <b>Resíduo honesto (externo / revisão pendente):</b> o valor de disponibilidade de { "15" }–{ "25" } % contra um <b>instantâneo de TLE (conjunto de elementos de duas linhas) real do Celestrak com versão travada</b>, e o depósito das fixtures de teste do ARAIM como um registro citável no <b>Zenodo</b>. A verificação de referência acima cobre apenas <c1/> (modos de falha de um único satélite e de uma única constelação); subconjuntos de falha de múltiplos eventos simultâneos, exclusão de falhas, a verificação de consistência χ² e a etapa de realocação por contagem dupla do algoritmo de referência não estão implementados, e um caso cujas probabilidades a priori os exigiriam é recusado em vez de truncado.

# text
# c1: integrity
# c2: araim_dual_raim
# c3: araim_dual = true
# c4: p_hmi
# c5: scenarios/araim-gps-galileo.toml
# c6: tests/araim_dual_real_data.rs
seg-b57b889dc536 = <b>Alcance por arquivo de cenário:</b> o tipo de cenário <c1/> executa <c2/> em toda época quando seu arquivo TOML (Tom's Obvious Minimal Language) define <c3/> (<c4/> opcional); o <a1><c5/></a1> incluído faz isso sobre uma geometria GPS + Galileo reunida, e <c6/> executa o mesmo motor sobre TLEs reais de GPS e Galileo do Celestrak propagados para uma época comum. Sem a opção, o executor usa o RAIM clássico de separação de soluções.

# text
seg-6cb7a787ac67 = Referências

# text
seg-46ca3d3cf9df = Cooperação UE–EUA em Navegação por Satélite, Grupo de Trabalho C, Subgrupo Técnico do ARAIM, <em>Milestone { "3" } Report</em>, versão final, { "25" } de fevereiro de { "2016" } — Anexo A (algoritmo de usuário de referência) e §A.IX (exemplo numérico). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

# text
seg-e5e789005864 = Cooperação UE–EUA em Navegação por Satélite, Grupo de Trabalho C, Subgrupo Técnico do ARAIM, <em>Reference Airborne Algorithm Description Document</em>, versão { "3.1" }, { "20" } de junho de { "2019" } — Apêndice D (exemplo numérico para o LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

# text
seg-8758a6e4f6eb = Cooperação UE–EUA (Estados Unidos) em Navegação por Satélite, <em>ARAIM Technical Note</em>.

# text
seg-c4d2879b2ec4 = RTCA (antes Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (padrões mínimos de desempenho operacional); material do DO-316 ARAIM MASPS (padrões mínimos de desempenho de sistemas de aviação).

# text
seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

# text
seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (metodologia do diagrama de Stanford).

# text
seg-d4f50d307775 = <s1>Anterior</s1>Espectro e cascata

# text
seg-f05ca316fe8e = <s1>Próximo</s1>Mapa DO-316 / DO-229E
