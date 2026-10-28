# docs--kind-cislunar-arc-recovery: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-330cbcd04718 = fração (adimensional)

# text
# c1: docs/kinds/by-kind/cislunar-arc-recovery.md
seg-8f21a5462b09 = Fonte: <c1/>

# text
# c1: cislunar-arc-recovery
seg-e4858b0a33c9 = <c1/> (tipo de cenário)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
# c1: independence
seg-f994c81583bf = Teste MODELLED de estimador independente do limiar de observabilidade do comprimento de arco cislunar. Esse limiar é uma leitura de CARACTERÍSTICA sobre a matriz de observabilidade montada a partir das linhas ANALÍTICAS do jacobiano de distância e da matriz de transição de estado variacional ANALÍTICA, e a sua verificação cruzada por filtro de informação em raiz quadrada incorpora essas mesmas linhas — uma verificação de consistência entre duas máquinas numéricas, não uma corroboração. Este tipo de cenário fornece o árbitro que faltava: um estimador de mínimos quadrados em lote que de facto RECUPERA o estado inicial do chefe a partir de medidas simuladas, com as derivadas parciais da medida tomadas como DIFERENÇAS FINITAS CENTRAIS do modelo direto composto. Este não chama nenhuma linha de jacobiano analítico, nenhuma STM variacional, nenhuma decomposição em valores singulares ou autovalores, nenhuma tolerância de característica e nenhum filtro de informação em raiz quadrada — uma guarda de texto-fonte em tests/cislunar_arc_recovery_reference.rs torna isso verificável — enquanto a dinâmica (o mesmo fluxo RK4 do CR3BP), as condições iniciais (a mesma constelação corrigida diferencialmente), o observável escalar e a grelha de épocas são partilhados deliberadamente e nomeados no bloco <c1/> emitido, porque duas análises de um mesmo problema físico precisam concordar quanto à física para serem comparáveis. Dois critérios, cada um varrido ao longo de cinco décadas do seu próprio limite: RECUPERAÇÃO SEM RUÍDO (o erro de estado final de cada tentativa com semente no máximo recovery_factor vezes o seu deslocamento a priori — o análogo da característica, sem nenhuma tolerância de valor singular) e ESTIMABILIDADE POR MONTE CARLO (o erro RMS de posição medido sobre um conjunto de ruído com semente abaixo de um limite declarado — o análogo da estimabilidade, medido e não previsto). Suporta o caso planar de quatro estados e o espacial de seis estados, as famílias DRO / halo L2 / NRHO L2, os observáveis de distância e de taxa de distância, e uma parametrização polar centrada na Lua em que a transformação é aplicada ao ESTADO e o modelo direto é rediferenciado ali. MEASURED na grelha planar de DRO publicada: o estimador recupera o caso de quatro estados a partir de { "0.782609" } h contra os { "2.086957" } h do critério de característica em rel_tol { "1e-6" } (razão { "0.375" }) — o limiar de característica NÃO é corroborado como fronteira de recuperabilidade — enquanto a fronteira de estimabilidade medida cai na mesma célula da grelha que a formal, { "5.739130" } h, e a curva de erro medida reproduz o 1 sigma formal ao longo de { "21" } comprimentos de arco com uma razão de média geométrica de { "0.98" }. MODELLED: o projeto da constelação, a grelha de épocas, o único enlace em seguimento, a magnitude do deslocamento, o sigma da medida e os dois limites declarados. Não é um produto de desempenho de navegação certificado.

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-ada71f37b21b = Uma execução de <c1/> resume-se assim: cislunar-arc-recovery | família dro, 4 estados, { "4" } s/c, observável de distância, parametrização cartesiana | arco de { "6.0" } h, { "24" } épocas (grelha { "0.260870" } h), { "32" } tentativas, semente { "20260920" } | derivadas parciais por diferenças finitas, sem jacobiano analítico / STM / SVD / SRIF | recuperação sem ruído a partir de { "0.782609" } h (fator { "1e-2" }) contra limiar de característica do gramiano de { "2.086957" } h | estimabilidade por Monte Carlo a partir de { "5.739130" } h (RMS de pos ≤ { "1.000" } km, σ { "1.000" } m) contra estimabilidade do gramiano { "5.739130" } h | RMS de pos no fim do arco { "0.6026" } km

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-3d4a2773c32f = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-eb621f41dfbb = O exemplo <c1/> define, entre outros:

# text
seg-6d584e86deba = razão (adimensional)

# text
seg-f7f4d06e661f = cislunar-observability na mesma

# text
seg-a6cb7ed2ff6d = Rótulo do resultado (o do motor): teste MODELLED de recuperação do comprimento de arco cislunar (corroboração por estimador independente do limiar de observabilidade P6). Núcleo VALIDATED: o estimador é o corretor em lote de Gauss-Newton ponderado já existente no crate (crate::batch_ls), cuja matriz de projeto é uma DIFERENÇA FINITA CENTRAL do mo

# attr:alt
seg-2fe411ae2153 = O gráfico que o motor escreve para scenarios/cislunar-arc-recovery.toml, tipo de cenário cislunar-arc-recovery

# text
seg-99dd8cc0e3ef = <b>MODELLED</b> Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do chefe a partir de medidas intersatélites simuladas sobre prefixos crescentes da mesma grelha de épocas que a tabela de característica contra arco usa, com as derivadas parciais da medida tomadas como diferenças finitas centrais Testes: <a1>cislunar_arc_recovery_reference.rs</a1>.

# text
seg-67aab2162719 = <b>MODELLED</b> Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do chefe a partir de medidas intersatélites simuladas sobre prefixos crescentes da mesma grelha de épocas. Referência independente (ReferenceImpl): Um estimador separado nesta base de código, com um algoritmo diferente e um caminho de código disjunto: Gauss-Newton ponderado não linear com derivadas parciais por diferenças finitas, com o seu veredito lido como um erro de recuperação de estado medido em km e mm/s. Este não tem nenhuma expressão em comum com a rota de característica e covariância do gramiano, e a separação é IMPOSTA por uma guarda de texto-fonte, em vez de simplesmente afirmada. MEASURED na grelha planar de DRO publicada: o

# text
# c1: label
seg-7be582874f98 = Teste MODELLED de recuperação do comprimento de arco cislunar (corroboração por estimador independente do limiar de observabilidade P6). Núcleo VALIDATED: o estimador é o corretor em lote de Gauss-Newton ponderado já existente no crate (crate::batch_ls), cuja matriz de projeto é uma DIFERENÇA FINITA CENTRAL do modelo direto composto - ele não chama nenhuma linha de jacobiano analítico de medida, nenhuma matriz de transição de estado variacional, nenhum valor singular o (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-52fe686b1fdf = Teste MODELLED de estimador independente do limiar de observabilidade do comprimento de arco cislunar. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-48e6e57a0b40 = MODELLED: o projeto da constelação, a grelha de épocas, o único enlace em seguimento, a magnitude do deslocamento, o sigma da medida e os dois limites declarados. (catálogo de tipos de cenário (<c1/>))

# text
seg-75f275dcb2d2 = MODELLED: o projeto da constelação, a grelha de épocas, o único enlace em seguimento, a magnitude do deslocamento, o sigma da medida e os dois limites declarados. Não é um produto de desempenho de navegação certificado. (comentário do ficheiro de cenário, linhas { "33" } a { "35" })

# text
seg-ea82d9fd6506 = A corroboração por estimador independente do limiar de comprimento de arco cislunar é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-53d57e6dafa6 = <s1>Anterior</s1>campaign

# text
seg-fe3ecf4b55fe = <s1>Seguinte</s1>cislunar-observability
