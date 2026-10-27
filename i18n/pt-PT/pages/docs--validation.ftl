# docs--validation: translations (pt-PT)

# text
seg-70860389903a = Relógio

# text
seg-583dc9ff6178 = Biblioteca

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-619f89bf160c = Realização do referencial lunar

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-2eb6d1b0483d = RAIM / ARAIM

# text
seg-da3532b1444d = SBAS / DO-229E

# text
seg-d3af26f389f5 = IONEX / Klobuchar

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Estado

# text
seg-d12d4565b01d = VLBI geodésico lunar, percurso por kernel

# text
seg-5ed34a5b402e = OD conjunta lunar multitécnica + relógio

# text
seg-4bcec6e2dd9f = Volume de serviço de navegação lunar

# text
seg-c04a3591074c = Exportação de interoperabilidade lunar

# text
seg-20fee61b3107 = Biblioteca de modelos de erro de dispositivos quânticos

# text
seg-eaf341ff4522 = Navegação quântica sem GNSS

# text
seg-75636f9419b2 = Limitações conhecidas

# text
seg-9c0eb89a2fbe = Pacote

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-638b8d451550 = Sensor

# text
seg-04f69a0edb2f = tipo

# text
seg-b03d56f501c3 = Tipo

# text
seg-35bf9a48e566 = Termo

# text
seg-f3526b0d95f8 = Medido

# text
seg-7634c6f4b32c = Ligação

# text
seg-b966dd26caa6 = Conjunto de dados

# text
seg-4fe4920a3fa1 = Norma

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Fonte: <c1/>

# text
seg-028f26d1374e = <b>Sobre as tolerâncias.</b> "Validado" abaixo significa que um teste de calibração afirma que a estatística simulada coincide com a relação de referência dentro de um <b>gate imposto</b>, atualmente <b>{ "20" }–{ "25" }% de erro relativo</b> (média sobre seeds) para as relações de Allan/orçamento de ruído. A concordância mediana observada é muitas vezes muito mais apertada (alguns por cento), mas o limite <em>garantido</em> é o gate, não a mediana. Onde aparece um número como "~{ "2" }%", é uma observação típica, não a tolerância imposta. Ver <a1>Afirmações contra realidade</a1>.

# text
seg-94a480ed9ccb = A regra de promoção

# text
# c1: src/verification.rs
seg-a550784412a6 = Uma linha da matriz de verificação verificada por máquina (<c1/>) é VALIDATED apenas quando uma referência independente <b>do Kshana</b> concorda com a implementação <b>dentro de uma tolerância indicada antes de a comparação ser executada</b>, num teste que corre no gate. Esta secção é o único local onde a regra está escrita; a matriz, a prosa de cada linha e as notas de versão remetem para ela.

# text
seg-5e14faed9f05 = Os tipos de referência independente aceites

# text
seg-4297b6a1b385 = O que conta

# text
seg-a42c0c36b37f = Exemplos já na matriz

# text
seg-e39aeb132e03 = Dados reais medidos da grandeza que a linha afirma: uma observação do mundo físico, não uma saída de modelo.

# text
seg-e77977db9de1 = Os dois terços reservados de um registo real de relógio de césio; pontos normais arquivados de medição laser da distância à Lua; a série Circular T UTC(k) do BIPM (Bureau International des Poids et Mesures); o mosaico de terreno SRTM (Shuttle Radar Topography Mission).

# text
seg-6325fe1fafaf = Uma biblioteca ou ferramenta independente de terceiros que calcula uma grandeza <b>univocamente definida</b> sobre as mesmas entradas, em que a biblioteca implementa ela própria o cálculo do domínio. A concordância entre bibliotecas é uma verificação genuína apenas porque a grandeza tem uma única resposta certa.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, as distribuições estatísticas do SciPy.

# text
seg-056adffae706 = Vetores de referência, tabelas ou exemplos de verificação publicados: números que uma norma, uma agência ou um texto de referência imprimem para que as implementações possam ser verificadas face a eles.

# text
seg-991fb822e99c = Vetores SOFA/ERFA (Standards of Fundamental Astronomy), os vetores de verificação SGP4 da AIAA (American Institute of Aeronautics and Astronautics), os exemplos de validação da ITU-R (International Telecommunication Union, Radiocommunication Sector), o exemplo trabalhado ARAIM do Working Group C, o JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Duas normas adicionais decidem os casos-limite. Ambas são adotadas para a versão { "0.30" }.

# text
seg-f5c6cf536ba1 = <b>P1, um valor trabalhado publicado.</b> Um valor trabalhado publicado, calculado a partir da mesma forma fechada que a linha implementa, conta como vetor de referência publicado quando a publicação é independente do Kshana e a comparação fixa uma tolerância indicada. O valor tem de estar impresso como número na publicação (um valor lido de um gráfico só conta se a incerteza de leitura estiver dentro da tolerância indicada), e o teste tem de fazer o Kshana calculá-lo a partir das entradas da publicação; comparar uma constante com o documento de onde foi copiada é uma verificação de transcrição, não P1.

# text
seg-0b043b552e76 = <b>P2, uma biblioteca numérica independente.</b> Uma biblioteca numérica independente, como o numpy ou o LAPACK (Linear Algebra PACKage), que recalcule uma grandeza de álgebra linear univocamente definida sobre entradas indicadas conta como biblioteca independente. A biblioteca tem de executar o passo de decomposição, inversão, resolução ou mínimos quadrados com o seu próprio algoritmo, sobre entradas incluídas no fixture; a afirmação validada é então a álgebra linear sobre essas entradas, não as magnitudes físicas de um cenário representativo. Um script que reavalie uma forma fechada escalar com aritmética numpy é uma segunda implementação nossa, não P2.

# text
seg-b7911d589f7a = Condições que se aplicam a todos os tipos: a referência independente não é escrita, executada nem publicada por este projeto (a série de artigos do próprio repositório não é, por isso, independente dele); a tolerância está no teste e foi fixada antes da primeira comparação; um teste condicionado a dados que é saltado quando os seus dados públicos estão ausentes di-lo quando é saltado.

# text
seg-7e6057a2cad7 = O que não conta

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>A nossa própria segunda implementação</b>: um segundo caminho de código nesta crate (<c1/>), ou um script neste repositório que reavalie a mesma forma fechada.

# text
seg-d6efaf8399f9 = <b>A concordância com a nossa própria saída anterior</b>: goldens, fixações de regressão, snapshots ou uma tabela dos artigos do próprio projeto.

# text
seg-4d0365b383e5 = <b>Uma transcrição das constantes de uma citação</b>: verificar um coeficiente, uma predefinição, um valor de folha de especificações ou uma folha de parâmetros face ao documento de onde foi copiado.

# text
seg-3bf8025077fb = <b>Uma escolha de projeto</b>: uma atribuição, ponderação, limiar, limite de alerta ou cenário representativo. Não existe verdade externa para uma escolha.

# text
seg-4f0aafd7166e = <b>Uma identidade interna</b>: um integral numérico face à sua própria forma analítica, uma ida e volta, uma inversão, um teste de propriedade ou de monotonia.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Uma execução de integração face a um anfitrião real</b> (<c1/>): carregar um plugin num servidor Signal K real ou no OpenCPN, ou alimentar a saída de um gate real a um consumidor TCP, e verificar que o anfitrião aceita a entrada e mostra o estado esperado. Mostra que a infraestrutura funciona. O anfitrião não é uma referência independente para nenhum valor que a integração transporte, pelo que não há nada externo com que comparar e uma tal linha (a linha das integrações marítimas) é MODELLED, não VALIDATED. <c2/> é um tipo de referência independente próprio, permitido apenas em linhas MODELLED: <c3/> em <c4/> falha se uma linha VALIDATED o tiver, e <c5/> já exige que cada linha VALIDATED seja <c6/>.

# text
seg-a39a87c56a16 = <b>Plausibilidade sobre entradas reais</b>: dados reais usados apenas como entrada, com afirmações de escala em vez de uma comparação com um valor externo.

# text
seg-db6f5d98b4ef = Uma tolerância escolhida depois de ver a comparação.

# text
seg-f4f18b7549df = Como a regra é aplicada

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Cada linha VALIDATED declara, em <c1/> em <c2/>, em que tipo assenta (Medido, Biblioteca, Referência, P1 ou P2), a fonte independente (citada do texto de referência independente da própria linha) e o único teste que contém a comparação. Os testes unitários junto da tabela falham quando uma linha VALIDATED não está declarada ou está declarada duas vezes, quando uma declaração nomeia uma linha que não é VALIDATED, quando a fonte declarada não é a que o texto de referência independente da linha nomeia ou é o próprio Kshana, quando o teste declarado não é um que a linha cita, ou quando uma linha P2 não nomeia nenhuma biblioteca numérica independente. <c3/> exige então que o teste declarado exista em disco como um <c4/> real que não esteja ignorado. O que a máquina não consegue verificar é se o teste nomeado compara face à fonte declarada; isso continua a ser uma leitura humana. As contagens por tipo não são aqui escritas: a tabela é a fonte.

# text
seg-e8ae3e380f40 = Linhas VALIDATED existentes reexaminadas segundo a regra

# text
seg-1dd44545a67a = A regra foi aplicada às linhas existentes tal como às promoções futuras.

# text
seg-38db7b6e7053 = <b>Linhas P1 nomeadas pelo estudo de validação { "0.30" }, todas fundamentadas:</b> Balanço de ligação unidirecional (a tabela de controlo de projeto X-band do Galileo, JPL Pub 82-76, reconstruída a partir das suas linhas de detalhe até { "4.6e-3" } dB de perda no espaço livre); Formas fechadas de banda limitada para qualquer sinal de medição de distância ({ "90.3" } por cento da potência do lóbulo principal e o jitter coerente early-late publicado); Doppler máximo de um satélite de navegação em órbita terrestre baixa (os valores publicados do Xona Pulsar X1 e do Iridium); Doppler máximo que um utilizador estático vê a partir de uma órbita LEO ou MEO (Tabela { "1" } do artigo do Pulsar, { "20" } valores); Doppler que um recetor em terra tem de tratar a partir de um satélite de navegação LEO (os mesmos valores publicados a partir de uma órbita real). Cada publicação é independente do Kshana, imprime os seus números, e o teste indica a sua tolerância.

# text
seg-8e38103d05d6 = <b>Outras linhas que assentam em P1, encontradas no reexame, todas fundamentadas:</b> Compromisso de projeto de códigos de medição de distância (a correlação cruzada Gold publicada de −{ "23.9" } dB); Tempo coordenado lunar (Ashby e Patla { "2024" }, cuja verificação cruzada da velocidade da Lua face ao DE440 é uma verificação de biblioteca); Densidades espetrais de potência de sinais de banda L em forma fechada (valores Q de Kaplan e Hegarty); Atraso ionosférico de primeira ordem por banda (a razão de atraso de grupo da IS-GPS-200); Pesos do erro de distância do sinal no espaço em média global (a tabela de Montenbruck, Steigenberger e Hauschild { "2018" }).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>Linhas P2 nomeadas pelo estudo, todas fundamentadas:</b> Informação de Fisher e observabilidade de Cramér–Rao (numpy <c1/>/<c2/>); Identificabilidade do datum lunar; Calibre acoplado do referencial e da escala de tempo lunares; Pipeline autónomo de observabilidade de falhas em rede livre (SVD do numpy/SciPy, decomposição em valores singulares). Cada uma recalcula uma grandeza de álgebra linear univocamente definida sobre entradas incluídas, por um algoritmo diferente do solucionador de valores próprios de Jacobi do Kshana.

# text
# c1: expm
seg-e9d01633d002 = <b>Outras linhas que assentam em P2, encontradas no reexame, todas fundamentadas:</b> Derivação de prioridades MCDA (análise de decisão multicritério) (o vetor próprio AHP, processo analítico hierárquico, por SciPy/LAPACK; a tabela de Random Index que também reproduz é uma transcrição e não é contada); Variância de deriva em holdover do relógio (<c1/> do SciPy da matriz aumentada de Van Loan); Realização do referencial lunar (uma resolução Umeyama por SVD do numpy); Formação de feixe CRPA (antena de padrão de receção controlado) (resolução complexa LAPACK); Núcleo do nível de proteção ARAIM lunar (a inversa LU do RTKLIB com quantis do SciPy); Consistência de referencial/dinâmica lunar entre fornecedores (um ajuste de mínimos quadrados por SVD do numpy de três efemérides publicadas).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>Assinaladas na primeira passagem, reapoiadas na ronda { "2" } da execução { "0.30" }.</b> Três linhas foram assinaladas como não sustentadas pela regra escrita. Cada uma assenta agora numa comparação pré-registada antes de o seu fixture ser obtido, pelo que nenhuma linha está assinalada; um teste unitário junto de <c1/> fixa a lista (agora vazia).

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Integridade (RAIM/ARAIM/SBAS).</b> Os testes citados afirmavam apenas plausibilidade sobre geometria real do IGS (International GNSS Service). A linha assenta agora em três referências de biblioteca independentes: a solução de separação de hipóteses múltiplas do ARAIM do Airborne Design Document v4.2 face ao Stanford MAAST para o ARAIM { "2" } ({ "270" } casos reais, pior diferença de VPL { "2.2e-3" } m face a { "0.05" } m); a deteção e exclusão RAIM de snapshot face ao RTKLIB <c1/> ({ "2016" } de { "2016" } decisões idênticas) com o nível de proteção de declive; e os níveis de proteção SBAS L1 do DO-229E face ao Stanford MAAST em difusões WAAS reais ({ "2868" } pares dentro de { "1.6e-5" } m). A linha diz claramente que as funções de sigma uniforme <c2/> e <c3/> não são aderentes à norma ADD e que a comparação SBAS L5 de dupla frequência é uma constatação.

# text
seg-16a4261c77ec = <b>Posições dos planetas em todo o sistema solar a partir dos elementos keplerianos Standish do JPL.</b> O limiar post-hoc do dobro do erro nominal é substituído por um limiar pré-registado: RMS no máximo o valor da Tabela { "8.10.1" } do Explanatory Supplement por planeta e componente, face ao JPL Horizons DE441, com a divisão da Terra e a rotação ICRF cobertas.

# text
seg-8d5b51a942e0 = <b>Tempo de luz entre corpos do sistema solar.</b> O solucionador de tempo de luz é agora comparado com os tempos de luz do Horizons até { "1e-6" } s sobre posições DE441, um limiar pré-registado que não herda o limiar de posição.

# text
seg-e96900bc322f = <b>Linhas MODELLED que as duas políticas tornam promovíveis</b> (apenas através da execução { "0.30" } linha a linha, nunca por este texto): sob P1, o limite de geolocalização de emissores por TDOA/FDOA (diferença de tempo e de frequência de chegada), o acoplamento da taxa de relógio relativista ao referencial, as máscaras de sincronização da ITU-T (Telecommunication Standardization Sector) (apenas para valores de máscara que as Recomendações imprimem como números; os pontos de quebra transcritos verificados face a si próprios não contam) e o limite de posicionamento de rede não terrestre 5G (apenas se for encontrado um valor trabalhado publicado); sob P2, a cegueira de integridade de modo comum, o nível de proteção de temporização MHSS escalar (separação de soluções de hipóteses múltiplas) e o branqueamento GLS (mínimos quadrados generalizados). As duas linhas de benchmark de integridade de temporização (o classificador do diagrama de integridade de Stanford e o pontuador de cobertura de integridade) são classificação baseada em regras, não álgebra linear, pelo que o P2 não as alcança; precisam de uma ferramenta independente, e a única encontrada (gLAB) tem uma licença não comercial.

# text
seg-50a08fe5918b = <b>Coerência com recusas anteriores.</b> A verificação de Vallado da linha da janela de lançamento qualificar-se-ia agora sob P1 se o seu teste calculasse o exemplo trabalhado impresso; o plano { "0.30" } promove-a antes através do Orekit. A tabela de cruzamento de tempo lunar por classe de relógio mantém-se MODELLED: a tabela que reproduz provém do artigo do próprio projeto, que não é independente.

# text
seg-02423542480f = Termo de ruído

# text
seg-2bd49b92f14b = Paridade dos estimadores de Allan (ADEV/MDEV/TDEV/OHDEV (ADEV: desvio de Allan; MDEV: desvio de Allan modificado; OHDEV: desvio de Hadamard sobreposto))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Duas verificações de fonte primária face à <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), ambas com uma tolerância relativa de <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: os estimadores de ADEV sobreposto, ADEV modificado, desvio de tempo e Hadamard sobreposto reproduzem os desvios do conjunto canónico de 10 pontos <b>NBS14</b> (<b>SP { "1065" } Tabela 29/30, p. { "107" }</b>) em tau = { "1" }, { "2" } — a concordância é na realidade ~{ "1e-6" } (por exemplo, ADEV sobreposto (OADEV) em τ = { "2" }: { "85.952868" } contra { "85.95287" }). ({ "2" }) <c2/>: os mesmos quatro estimadores reproduzem o <b>conjunto de dados de 1000 pontos da SP { "1065" } §{ "12.4" }</b> (<b>Tabela { "31" }, p. { "108" }</b>) com fatores de média { "1" } / { "10" } / { "100" }, em que o conjunto de dados é regenerado em código a partir do LCG da SP { "1065" } (Eq. { "73" }) — hermético, sem fixture. Os mesmos dados e os números da Tabela 31 são o alvo de regressão no aewallin/allantools (<c3/>), aqui reproduzidos sem código de terceiros. Isto fixa a <em>matemática dos estimadores</em> face à referência, distinta das linhas de <em>calibração</em> do ruído abaixo.

# text
seg-79e6f7d1e7f0 = Paridade dos estimadores de Allan em <b>hardware real medido</b>

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/>: os estimadores de Allan sobreposto e de Hadamard sobreposto reproduzem os desvios de referência do <b>Stable32</b> para um <b>padrão primário de césio 5071A real medido face a um maser de hidrogénio</b> ({ "556 990" } amostras de fase a τ₀ = { "1" } s; { "1" } PPS (pulso por segundo) para um contador 53230A, fev. { "2014" }; recolhido por A. Wallin, distribuído com <c2/>). Verificado ao longo de <b>toda a escada decádica de τ ({ "16" } fatores de média, τ = { "1" } s … { "4" }×10⁴ s)</b>: fatores bem amostrados com um gate relativo de <b>{ "1e-3" }</b> (a concordância observada é na realidade ≤ { "3e-5" }, por exemplo OADEV({ "1" } s) { "3.317111e-10" } contra Stable32 { "3.3171e-10" }), fatores esparsos de τ longo obrigados a cair dentro da banda de confiança de { "1" }‑σ impressa do Stable32. Isto complementa a paridade sintética NBS14 acima com uma verificação de relógio medido. O ficheiro de fase em bruto são dados de terceiros sem licença de redistribuição, pelo que é ignorado pelo git; <c3/> reproduz-o e o teste imprime um aviso de salto (a CI (integração contínua) mantém-se verde) quando está ausente. Apenas os números de referência públicos do Stable32 estão incluídos (<c4/>); não é usado código de terceiros.

# text
seg-1a7f0e741913 = Paridade dos estimadores de Allan no <b>PHASE.DAT canónico do Stable32</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/>: os estimadores de Allan sobreposto, de Allan modificado e de desvio de tempo reproduzem os desvios de referência do <b>Stable32</b> para o <b>PHASE.DAT</b> — a série de 1001 pontos distribuída com o Stable32 que ferramentas independentes (por exemplo <c2/>) usam como alvo de regressão padrão — ao longo de <b>toda a escada de fatores de média ({ "139" } fatores)</b> com um gate relativo de <b>{ "1e-3" }</b> (observado ≤ { "5e-5" }). Uma segunda série de referência real e independente, a par da verificação do césio medido acima. O PHASE.DAT acompanha a ferramenta comercial Stable32, pelo que a série em bruto é ignorada pelo git; <c3/> reproduz-a e o teste é saltado em verde (a CI mantém-se verde) quando está ausente. Apenas os números de referência públicos do Stable32 estão incluídos (<c4/>); não é usado código de terceiros.

# text
seg-9dde9e0c8055 = Estabilidade de relógio ótico numa <b>curva real medida</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/>: a inversão de parâmetros de ruído do relógio (<c2/>) reproduz o <b>σ_y(τ) publicado do relógio de rede ótica de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), curva incluída em <c3/>): o coeficiente de frequência branca recuperado √q_wf ≈ { "4.33e-16" } coincide com a estabilidade de curto prazo do artigo de ≈4.7e-16/√τ (~{ "10" }% RMS (raiz do valor quadrático médio) ao longo da curva) e o ajuste deteta um patamar medido não nulo (q_rw > { "0" }). Isto fixa a <b>inversão de ADEV medido → parâmetros de ruído face a um relógio ótico real</b>; o benefício de holdover até ao limiar construído sobre ela continua MODELLED.

# text
seg-e1e930dcd0a1 = ROC (característica de operação do recetor) AUC (área sob a curva) de deteção de anomalias em <b>telemetria real OPS-SAT da ESA (European Space Agency)</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reproduz as etiquetas)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/>: no conjunto de dados <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — segmentos reais de housekeeping do OPS-SAT com etiquetas de anomalia de referência — a AUC ROC de Mann–Whitney do Kshana (<c2/>) reproduz a <b><c3/> do scikit-learn</b> até <b>< { "1e-9" }</b> na partição de teste reservada ({ "529" } segmentos, { "113" } anomalias), para duas pontuações determinísticas: um detetor transparente de uma única característica (contagem de picos do segmento, <b>AUC ≈ { "0.851" }</b>) e uma pontuação de Mahalanobis diagonal de 8 características ajustada aos segmentos normais de treino (AUC ≈ { "0.556" }); <c4/> delimita a estimativa pontual com o seu limite inferior acima do acaso. Isto valida o <b>cálculo da AUC em dados reais da ESA</b> e a <b>separação etiquetada</b> de um detetor transparente — <b>não</b> reproduz a melhor métrica publicada no artigo OPSSAT-AD (uma FCNN supervisionada (rede neuronal totalmente ligada), F1 ≈ { "0.95" }), que requer o modelo treinado deles. Dados CC-BY incluídos (<c5/>, herméticos); referência independente regenerada por <c6/>.

# text
seg-5f2d41617fb2 = Síntese de funcionais do campo gravítico (mapa de navegação assistida por gravidade / sem GNSS (GNSS: global navigation satellite system))

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/>: o núcleo de funcionais gravíticos em harmónicos esféricos (<c2/> / <c3/>) — o "leitor de mapa" com que um navegador assistido por gravidade faz correspondência — é validado face à <b>norma de gravidade normal GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, adotada pela IAG (IAG: International Association of Geodesy)). Construir o campo normal GRS80 a partir dos seus harmónicos zonais pares publicados J₂…J₈ e sintetizar a gravidade (gravitação + centrífuga) no elipsoide reproduz a gravidade normal de <b>Somigliana</b> em forma fechada, e os valores equatorial/polar publicados γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², até <b>{ "3.5e-12" }</b> relativo em todas as latitudes (gate { "1e-9" }). O mesmo núcleo carrega o <b>modelo terrestre real ICGEM (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> de referência (NGA (National Geospatial-Intelligence Agency), domínio público via ICGEM; o leitor <c4/> é também exercitado no campo lunar GRAIL (Gravity Recovery and Interior Laboratory) em <c5/>) e produz um mapa de perturbação gravítica fisicamente limitado (RMS ≈ { "26" } mGal, máx. ≈ { "89" } mGal a d/o { "70" }). Valida a <b>correção do código de síntese</b>; a <em>exatidão da solução de posição</em> da navegação assistida por gravidade continua MODELLED (não existe nenhuma trajetória pública de gravímetro em plataforma com referência de verdade).

# text
seg-7dc3ff4c6eea = Graus de liberdade efetivos (edf) específicos do tipo de ruído (intervalos de confiança)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/>: a banda de confiança χ² em cada ponto de ADEV sobreposto usa os graus de liberdade efetivos específicos do tipo de ruído (formas fechadas da Tabela { "5" } da NIST SP { "1065" } para modulação de fase branca e flicker, modulação de frequência branca e flicker e modulação de frequência de passeio aleatório (WPM/FPM/WFM/FFM/RWFM) — o conjunto simples do Stable32), com o tipo de lei de potência do registo identificado a partir do declive log-log do seu MDEV. Três verificações independentes: (a) as cinco fórmulas reproduzem valores avaliados à mão em N={ "64" },m={ "4" } até { "1e-12" }; (b) um <b>ensemble de Monte Carlo de FM branca (FM: modulação de frequência)</b> ({ "4 000" } registos) mede o edf qui-quadrado efetivo do estimador = { "2" }·média²/Var(σ²) e coincide com a fórmula dentro de { "20" }% (e supera de forma material a contagem conservadora não sobreposta); (c) <c2/> reproduz o edf impresso na <b>SP { "1065" } Tabela { "32" } (p. { "109" })</b> = { "146.177" } para o conjunto de dados de 1000 pontos em m={ "10" } (FM branca) até { "5e-3" }, e os limites de confiança de { "95" }% da tabela ({ "8.223942e-2" } / { "1.035201e-1" }) a <{ "0.2" }% (o pequeno resíduo é a aproximação χ² de Wilson-Hilferty face ao χ² exato do NIST). A curva ADEV exportada traz o tipo de ruído identificado, o edf e a banda de { "95" }% por τ.

# text
seg-7048ac695b99 = FM branca (curto prazo)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/>: o ADEV sobreposto simulado reproduz o sigma_y({ "1" } s) publicado — tipicamente dentro de alguns por cento, <b>gate imposto de { "20" }%</b> (CSAC e o objetivo de rede ótica) — e a curva de FM branca sigma_y(tau)=sigma_y(1s)/sqrt(tau) para tau = { "1" }, { "10" }, { "100" } s dentro de um <b>gate de { "25" }%</b> (coincide com a folha de especificações do CSAC (relógio atómico à escala de chip) { "3e-10" } / { "1e-10" } / { "3e-11" }).

# text
seg-11fc7c4b61ff = FM de passeio aleatório (longo prazo)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/>: o ADEV simulado coincide com sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) até ~{ "20" }% (média sobre seeds).

# text
seg-dcfca4041429 = Envelhecimento / deriva linear

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + calibrado e removido

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Determinístico; o estimador de holdover remove o desvio e o envelhecimento através de um preditor quadrático, pelo que o resíduo é o limite estocástico. Testado em <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Estimador de Kalman + limite de integridade

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/>: um filtro de dois estados (fase, frequência) cujo ruído de processo exato de van Loan coincide com o modelo de referência; a navegação em inércia reproduz a variância analítica de holdover <c2/> até { "1e-9" }. A atualização da covariância está na <b>forma estabilizada de Joseph</b> <c3/>, que se mantém semidefinida positiva (verificada por Cholesky) ao longo de { "500" } passos de previsão/atualização com uma razão extrema <c4/>, e concorda com a forma ingénua até { "1e-9" } onde esta última está bem condicionada. A camada de execução comunica a Integridade como a fração de amostras da interrupção dentro do limite de proteção de 3 sigma (<c5/>).

# text
seg-f332f06e80f9 = Autoconsistência do filtro (NIS (inovação normalizada ao quadrado) / NEES (erro de estimação normalizado ao quadrado))

# text
# c1: validated
seg-333e1701b6d0 = <c1/> (modelo)

# text
# c1: src/filter_health.rs
# c2: consistent=true
# c3: consistent=false
# c4: filter_health
# c5: detection::chi2_inv_cdf
seg-c1304de95180 = <c1/>: uma avaliação de consistência por Monte Carlo (Bar-Shalom §{ "5.4" }). O <b>NIS → { "1" }</b> e o <b>NEES → { "2" }</b> agregados do filtro ajustado situam-se dentro das suas bandas χ² de { "95" }% (a banda do NIS usa a contagem agregada de inovações brancas; a banda do NEES usa a contagem de execuções independentes, dado que os erros de estimação são correlacionados no tempo). Um teste de <b>varrimento de incompatibilidade Q/R</b> verifica que o monitor comunica <c2/> apenas com sintonia unitária e <c3/> com dessintonias de ×0.1/×0.5/×2/×{ "10" }, com o NIS a escalar como ≈1/q_factor, tal como derivado. Exposto como <c4/> no JSON (JavaScript Object Notation) de resultado do relógio e num cartão do playground. As bandas χ² usam o quantil de Wilson–Hilferty (<c5/>, verificado por tabela).

# text
seg-078c4009b24f = Modelo de transferência bidirecional de tempo

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/>: o atraso recíproco de modo comum cancela-se exatamente na estimativa <c2/> (derivado à mão, exato) e duas medições unidirecionais fazem a média para <c3/> (média sobre seeds); o atraso diferencial não recíproco é um processo colorido de FM branca + FM de passeio aleatório cujo desvio de Allan segue <c4/> (média sobre seeds, ~{ "20" }%, através do próprio <c5/> da ligação). Os <em>parâmetros</em> (<c6/>, <c7/> por ligação) são valores representativos de TWSTFT/ótico (TWSTFT: transferência bidirecional de tempo e frequência por satélite), não ajustados a um terminal específico.

# text
seg-6ab219622143 = Segurança (pontuação de deteção de spoofing)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/>: o patamar de 1 sigma do monitor <c2/> e o desvio mínimo detetável de <c3/> sigma resultante e a pontuação <c4/> são derivados à mão e testados unitariamente. O modelo (deteção assistida por relógio de inovação / tipo RAIM (RAIM: monitorização autónoma da integridade pelo recetor)) é sólido; os <em>parâmetros</em> (janela de monitorização <c5/>, multiplicador de deteção <c6/>, ruído de medição <c7/>) são representativos, não ajustados a um recetor específico.

# text
seg-ca51e4f1e19c = Deteção de ataques de spoofing

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/>: um spoofing de tempo falso em rampa é assinalado quando o seu desvio excede o limite de deteção do relógio; o tempo de deteção coincide com <c2/> derivado à mão até um passo da grelha, e um relógio cujo limite excede a especificação deixa o spoofing atingir o limiar sem ser detetado. Mesma ressalva <c3/> que a pontuação de Segurança.

# text
seg-3d2f6d2b7722 = FM flicker (patamar)

# text
# c1: modeled
seg-55697d598918 = <c1/> (desativado por predefinição)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Sintetizado como uma soma de processos de Ornstein-Uhlenbeck (OU) espaçados logaritmicamente, calibrados para um patamar de ADEV plano configurável; <c1/> valida que o patamar é plano ao longo do tempo de média e se situa no nível configurado (média sobre seeds). Ativado por relógio através de <c2/>. Os cenários de referência citados deixam-no desativado: o CSAC é dominado por FM branca ao longo da sua gama de folha de especificações (1-1000 s) e o patamar sistemático do relógio ótico (~{ "5e-17" }) é representado pela sua figura de exatidão.

# text
seg-e2e3de9a61a4 = Estatísticas do ensemble de Monte Carlo

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (agregação)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/>: percentis por ordem mais próxima e média sobre <c2/> realizações reproduzíveis; uma execução única colapsa a dispersão, a banda por passo de tempo está ordenada <c3/>, e as reexecuções são idênticas bit a bit. Isto é agregação estatística sobre a execução única já validada, não um novo modelo físico.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Folha de especificações Microchip SA65 / SA.45s

# text
seg-e3bde4355d78 = optical-sr-lattice (rede de Sr)

# text
seg-87793f684233 = relógio ótico de rede de estrôncio, objetivo orientado para o espaço, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Estado: FM branca e FM de passeio aleatório validadas; envelhecimento modelado e calibrado e removido; FM flicker modelada e validada (desativada por predefinição nos cenários citados).

# text
seg-c5ff448dcb88 = Maturidade: os valores do relógio ótico são o <em>objetivo orientado para o espaço</em> em hardware terrestre -- nenhum relógio ótico de estrôncio voou. Os relógios de Sr de laboratório atingem { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Os valores do CSAC provêm de um componente comercial em utilização.

# text
seg-b59a4b8e6d88 = Relações: Riley, NIST SP { "1065" }, Eq. { "67" } -- FM branca sigma_y^{ "2" }(tau)=h0/({ "2" } tau); FM de passeio aleatório sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, equivalentemente q_rw*tau/3 para um processo de Wiener de frequência de difusão q_rw.

# text
seg-dca7ee671d91 = Pacote { "2" } — navegação inercial por estima (unidade de medição inercial quântica)

# text
seg-98452a081241 = Viés constante/residual -> posição

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = erro de posição = família { "0.5" }<em>b</em>T^{ "2" } (Tutorial Groves AESS (Aerospace and Electronic Systems Society)); teste discreto derivado à mão em <c1/>.

# text
seg-c60c0b54c485 = Passeio aleatório da velocidade (aceleração branca)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/>: o DP (desvio padrão) do erro de posição simulado coincide com sigma_x(T)=sqrt(S_a*T^3/3) (Groves eq.54) até ~{ "12" }% observado (média sobre seeds; gate imposto de { "20" }%).

# text
seg-8ac776795d40 = Física do acelerómetro de interferómetro de átomos frios (CAI) (a partir de primeiros princípios)

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4pi/lambda ~ 1.611e7 rad/m
# c3: Phi = k_eff*a*T^2 ~ 1.580e4 rad
# c4: T = 10 ms
# c5: sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad
# c6: C = 0.5
# c7: N = 1e6
# c8: sigma_a ~ 1.24e-6 m/s^2
# c9: 1/T^2
# c10: 1/sqrt(N)
# c11: q_va()
# c12: AccelModel
# c13: QUANTUM.md
seg-4eafc81873ed = <c1/>: um interferómetro de átomos frios Mach-Zehnder de três impulsos. Verificado à mão face à geometria de manual — Rb-87 <c2/>; <c3/> a { "1" } g, <c4/>; ruído de projeção <c5/> com <c6/>, <c7/>; <c8/> por disparo; as leis de escala <c9/> e <c10/>; decaimento exponencial do contraste. <c11/> <b>deriva</b> a PSD (densidade espetral de potência) de aceleração branca que o <c12/> clássico consome. Âmbito honesto: apenas o <b>patamar de ruído de projeção quântica</b> (~{ "0.09" } ug/sqrtHz aqui) — muito abaixo de dispositivos reais limitados pela vibração (1-50 ug/sqrtHz); o tensor de vibração, a força de Coriolis e os sistemáticos de desvio de luz ainda não estão modelados (ver <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Viés do giroscópio + passeio aleatório angular (ARW) -> inclinação -> acoplamento da gravidade

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Um viés residual do giroscópio e o ARW conduzem um erro de atitude; a inclinação acopla a gravidade (<c1/>) no erro de força específica horizontal. <c2/> valida exatamente o crescimento cúbico da posição por viés puro e o crescimento da atitude por ARW como processo de Wiener (média sobre seeds). Ativado por sensor através de <c3/> e <c4/>; desativado nos cenários de apenas acelerómetro citados.

# text
seg-e68d093e952a = Instabilidade do viés (patamar flicker 1/f)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/>: um processo flicker 1/f (a mesma síntese OU validada para o relógio) cujo patamar plano de desvio de Allan se situa no coeficiente de instabilidade do viés; zero é uma operação nula, um patamar não nulo altera a trajetória, ambos reproduzíveis. Ativado por sensor através de <c2/>.

# text
seg-b631c1bfce05 = Passeio aleatório da aceleração (passeio aleatório da taxa)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/>: o viés é um processo de Wiener com <c2/>, verificado com média sobre seeds até ~{ "20" }%. Ativado por sensor através de <c3/>.

# text
seg-49c4a2532dca = Validação cruzada com o NaveGo (coeficientes de ruído de IMU (unidade de medição inercial))

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/>: uma verificação cruzada externa face ao <b>NaveGo</b> (R. Gonzalez, toolbox INS/GNSS (INS: sistema de navegação inercial) de código aberto, <c2/>). Reproduz o ciclo sintético de ida e volta do <c3/> do NaveGo no seu <b>perfil de referência Microstrain 3DM-GX3-35 publicado</b>: ao alimentar o nosso estimador de ADEV sobreposto (validado com NBS14/Stable32) com ruído branco do sensor aos níveis de 1-σ do NaveGo, recuperam-se os coeficientes de passeio aleatório da velocidade e do ângulo (VRW, ARW) (<c4/>) até <c5/> (real ~{ "0.4" }%), com o ramo de ruído branco no declive −1/2. Confirma que o nosso pipeline de Allan e as definições de VRW/ARW do NaveGo concordam. O registo STIM300 <c6/> gravado de { "40" } MB não é ingerido (condicionado ao formato binário).

# text
seg-171b215f0526 = Fator de escala, termos de eixo cruzado mais finos

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> neste pacote de 1-DOF (um grau de liberdade)

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = O pacote herdado de eixo único não tem erro de fator de escala nem de acoplamento cruzado. A biblioteca strapdown de três eixos e o pacote <c1/> modelam fator de escala, desalinhamento, sensibilidade a g, quantização e rampa de taxa (<c2/>; ver a tabela de afirmações abaixo).

# text
seg-ce2b3237acfe = estabilidade do viés

# text
seg-129dc6af8f10 = PSD de raiz do ruído

# text
seg-7109e60b8c9b = cold-atom-quat (quântico)

# text
seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

# text
seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

# text
seg-09b42bed82c9 = nav-grade-quartz (clássico)

# text
seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

# text
seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-8714c547449a = Honeywell QA-2000 / Tutorial Groves AESS

# text
seg-79fc524162b5 = Enquadramento honesto: a vantagem dos átomos frios é a <b>estabilidade de viés a longo prazo</b> (~2600x inferior), que domina uma longa interrupção GNSS através de { "0.5" }<em>b</em>T^{ "2" }. O ruído de curto prazo é comparável (quântico ~{ "22" } contra clássico ~{ "20" } ug/sqrtHz) — o sensor quântico ganha a maratona, não o sprint. Maturidade: os acelerómetros de átomos frios estão em fase de laboratório/inicial (JRC122785), o quartzo de grau de navegação está em utilização.

# text
seg-e02e93f4f30a = Pacote { "3" } — transferência de tempo (ótica contra radiofrequência (RF), ligação ótica entre satélites)

# text
seg-2b87e5f0ba7e = Jitter de temporização branco -> precisão de sincronização

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/>: o RMS de sincronização simulado reproduz o jitter da ligação sigma_j; a média da amostra comporta-se como sigma/sqrt(N) até <{ "20" }% (média sobre seeds).

# text
seg-4325ec478bca = Temporização -> medição de distância unidirecional

# text
seg-aa7a1f463683 = distância = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (teste exato, derivado à mão).

# text
seg-7ad8bb95bf35 = Patamar flicker/TDEV, resíduo de reciprocidade bidirecional

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (tipo de cenário <c2/>): ruído de fase flicker (Kasdin–Walter, TDEV plano), uma não reciprocidade diurna e um resíduo de reciprocidade constante na série bidirecional; o pacote <c3/> de jitter branco não se altera.

# text
seg-dae3fa0375fe = jitter de amostra única

# text
seg-4a141a45a8ff = fonte

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = alvo credível em órbita

# text
seg-9dfc1d4334a3 = ligação ótica entre satélites, alvo de sincronização de picossegundos; O-TWTFT de laboratório (TWTFT: transferência bidirecional de tempo e frequência) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = medido numa única sessão

# text
seg-b9faad47d802 = TWSTFT do BIPM/PTB/NIST (BIPM: Bureau International des Poids et Mesures; PTB: Physikalisch-Technische Bundesanstalt, o instituto nacional de metrologia alemão)

# text
seg-51e2e5782c96 = Enquadramento honesto: o valor ótico é um alvo de sincronização em órbita ao nível do picossegundo (não lançado). O patamar do laboratório ótico terrestre é ~{ "1" } fs (muito melhor); uma ligação de micro-ondas bem projetada (a ligação de micro-ondas (MWL) do ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) pode rivalizar com a ótica, pelo que a linha de base "RF = { "0.5" } ns" é especificamente o TWSTFT corrente. A conversão para distância é unidirecional (distância = c<em>dt); bidirecional/ida e volta divide-a ao meio (distância = c</em>dt/2).

# text
seg-5fa72f18f983 = Pacote { "4" } — fusão híbrida (tutorial final)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Compõe o Pacote { "1" } (relógio), o Pacote { "2" } (inercial) e o Pacote { "3" } (transferência de tempo) num único conjunto PNT (posicionamento, navegação e temporização). O conjunto tem de manter AMBOS a temporização (< especificação de temporização) e a posição (< especificação de posição) dentro dos limites; <c1/> é o tempo até um deles ser violado. A transferência de tempo opcional por ligação ótica entre satélites (ISL) ressincroniza o relógio durante a interrupção (apenas auxílio de tempo — a posição não é ressincronizada, uma vez que a transferência de tempo dá tempo, não posição).

# text
seg-4f7cd8f86565 = Aspeto

# text
seg-19deb2a3537c = Pontuação PNT combinada (temporização E posição)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/> teste <c2/> derivado à mão (pnt_holdover = o primeiro de temporização/posição a ser violado).

# text
seg-d0e39bf123d8 = Integridade + Segurança para o pacote híbrido

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/>: um estimador de temporização de Kalman disciplinado pela referência (nominal) e reancorado a cada ressincronização ótica; a Integridade é a contenção no limite de proteção (o limite inclui o patamar de jitter da ligação), a Segurança a pontuação de deteção de spoofing. Testado para ambos os conjuntos, incluindo o caso assistido por ligação.

# text
seg-c3be96b7cb41 = Estimador de fusão conjunto

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/>: um único filtro de Kalman conjunto ([fase, freq] ⊕ [pos, vel]) é o navegador, disciplinado pelo GNSS (aprendendo os desvios a partir de covariância inicial não nula) e auxiliado pela transferência de tempo; a covariância conjunta dá uma integridade conjunta que é testada como fiável (≥{ "0.9" }) para ambos os conjuntos com sensores consistentes com o ruído. O pacote observa a posição e o tempo <b>separadamente</b>, para o que o filtro ótimo é diagonal por blocos; a estimação de viés constante com estado aumentado e o auxílio cruzado dinâmico são trabalho futuro.

# text
seg-915ec766439f = Filtro acoplado relógio+posição (covariância entre blocos)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/>: um único filtro de Kalman empilhado <c2/> (atualizações em forma de Joseph) cuja medição de <b>pseudodistância</b> <c3/> acopla os blocos de posição e de relógio. Testes: uma pseudodistância partilhada leva <c4/> a ser não nulo (filtros desacoplados mantêm-no exatamente em { "0" }); duas geometrias distintas resolvem em conjunto desvios injetados de posição e de relógio que uma única distância não consegue separar; uma solução apenas de <b>relógio</b> melhora a <b>posição</b> através da covariância cruzada (o ganho que o acoplamento proporciona e os filtros desacoplados não); e um <b>NEES de Monte Carlo é consistente com χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, banda baseada em execuções). 1-DOF (a dimensionalidade do pacote); ainda não ligado ao pacote executável, e a extensão 3-D de 8 estados é trabalho futuro.

# text
seg-31ecf062b941 = Composição de submodelos validados

# text
seg-9b849cb4fe8d = herda

# text
seg-4e1c8b6791f3 = os termos de relógio/inercial/transferência de tempo são validados nos seus próprios pacotes.

# text
# c1: gnss-ins
seg-b672e5499976 = GNSS/INS de acoplamento fraco (pacote <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/>: um EKF de estados de erro de 15 estados (δp, δv, ψ, viés de acelerómetro/giroscópio; Groves §{ "14" }) conduz o navegador strapdown de três eixos com realimentação. Testes: um erro de posição injetado anula-se com auxílio de referência perfeita; a solução assistida mantém-se limitada a metros enquanto um INS em funcionamento livre diverge para além de { "100" } m; e o RMS da posição fundida ao longo de uma interrupção de { "60" } s supera a navegação por estima sem auxílio pelo limite do teste de ensemble (~{ "4" }× quando medido antes de { "0.27.3" }; a margem é maior após a correção abaixo). O acoplamento do viés do giroscópio é verificado face ao próprio strapdown: um viés residual conhecido do giroscópio tem de produzir o erro de atitude que o filtro prevê (<c2/>), e um prior largo tem de aprender um viés de giroscópio de classe de controlador de voo mantendo-se limitado; ambos falham com o sinal anterior à 0.27.3. <b>Revisto em { "0.27.3" }:</b> esse acoplamento tinha o sinal errado, pelo que as estimativas de viés do giroscópio empurravam no sentido errado e só um prior apertado mantinha o pacote estável; os valores de interrupção publicados mudaram (CHANGELOG, Fixed). Limite honesto: o viés do acelerómetro e a inclinação são fracamente separáveis no acoplamento fraco, pelo que não é afirmada calibração por viés.

# text
seg-1c9a9f76a432 = GNSS/INS de acoplamento forte (pseudodistância)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: a inovação é formada no domínio da distância (jacobiano da linha de vista em δp). Testes: quatro satélites anulam um erro horizontal injetado de { "8" } m/−{ "5" } m até < { "0.1" } m; <b>dois satélites</b> (nenhuma solução de posição, velocidade e tempo (PVT) possível) ainda reduzem o erro horizontal em > { "5" }×; um único satélite no zénite observa apenas a componente ao longo da linha de vista (vertical) e deixa a horizontal intocada; as entradas malformadas são rejeitadas. Apenas pseudodistância — a fase da portadora e um estado explícito de relógio do recetor estão no plano de desenvolvimento.

# text
seg-240b681b6021 = Fidelidade do auxílio cruzado de sensores (fusão completa Kalman/grafo de fatores)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> no pacote <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = O pacote híbrido é uma composição ao nível do sistema + auxílio de tempo, não um estimador ótimo. Existem filtros noutros locais: o EKF (filtro de Kalman estendido) de acoplamento fraco e forte do pacote <c1/> (linhas acima) e o filtro de Kalman unscented (UKF) de 17 estados do tipo de cenário <c2/>. Nenhum suavizador de grafo de fatores é modelado.

# text
seg-189758709fd2 = Resultado: o conjunto totalmente quântico mantém o PNT completo durante uma interrupção de { "1.8" } h; o conjunto totalmente clássico é <b>limitado pela posição</b> (a IMU de grau de navegação é violada primeiro). A transferência de tempo ótica por ISL mantém bloqueado até o RELÓGIO clássico, isolando o sensor inercial como o elo fraco do conjunto clássico — o argumento central a favor da inércia quântica e da temporização ótica em conjunto.

# text
seg-a4c5b45ea8a5 = Geometria — disponibilidade GNSS a partir de órbitas

# text
seg-d347bb63c1fd = Propagação circular de dois corpos

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/>: período <c2/> (mu = { "3.986004418e14" }), a posição regressa após um período, planaridade equatorial/polar — testes derivados à mão.

# text
seg-1260a2fef95f = Propagação excêntrica (kepleriana)

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/>: a equação de Kepler <c2/> resolvida por Newton (resíduo < { "1e-12" }); raios de perigeu/apogeu <c3/>; o caso circular coincide com o caminho em forma fechada até { "1e-9" }.

# text
seg-958f03424508 = Deriva secular nodal/apsidal por J2

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); o nó regride (progradas) / avança (retrógradas) / é estacionário (polares), e os apsides congelam na inclinação crítica de { "63.4" } graus — testes de sinal/zero derivados à mão. Apenas dois corpos + secular, não osculador.

# text
seg-dcba8d368326 = Visibilidade em linha de vista (ocultação pela Terra + máscara de elevação)

# text
seg-2eee9a8f894b = Satélite antipodal ocultado, satélite radialmente para fora a { "90" } graus de elevação, satélite tangencial no horizonte — testes exatos derivados à mão.

# text
seg-f251c75eb367 = Visibilidade -> estado GNSS -> cronologia

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> visíveis = nominal, 1-3 degradado, { "0" } negado; gerador Walker-delta; um teste de integração conduz uma execução de holdover de relógio a partir da cronologia derivada.

# text
seg-988d3fedb7f5 = Otimizador de projeto de constelações + geometria de streets-of-coverage

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: coverage_half_angle_rad
# c6: λ = arccos(Re/r·cos ε) − ε
# c7: street_half_width_rad
# c8: cos c = cos λ / cos(π/s)
# c9: λ < π/s ⇒ None
seg-2a636487a4e6 = <c1/>: <c2/> pesquisa a grelha <c3/> e devolve a célula que melhor satisfaz um <c4/> (mínimo de satélites para um alvo de cobertura / cobertura máxima / mínimo do pior PDOP (PDOP: diluição da precisão da posição)) — um teste afirma que a escolha é igual a uma varredura exaustiva independente da mesma pesquisa, e um exemplo trabalhado confirma que um projeto Walker 24/6/1 do GPS (Global Positioning System) cobre pelo menos tão bem como um reduzido de 18 satélites. As formas fechadas analíticas de <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) são verificadas à mão face à geometria de manual (GPS com máscara de { "5" }°: λ ≈ { "71.16" }°, meia-largura da rua de 4 satélites ≈ { "62.83" }°) e detetam a lacuna de subpovoamento (<c9/>). O solucionador completo de Rider de número mínimo de satélites para cobertura <em>global</em> (a contagem de planos sensível à junção) ainda não está implementado.

# text
seg-a1c1364cc45a = Diluição da precisão (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: diluição geométrica da precisão; HDOP: diluição horizontal da precisão; VDOP: diluição vertical da precisão; TDOP: diluição da precisão do tempo)) -> exatidão de posição

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/>: <c2/> a partir da matriz de projeto da linha de vista. <b>Referência independente externa</b> (<c3/>): os cinco fatores DOP reproduzem os calculados pelo <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — uma biblioteca GNSS independente e revista por pares, usada aqui como o ERFA (Essential Routines for Fundamental Astronomy) é usado para os referenciais) em <b>{ "8" } geometrias</b> que vão de bem condicionadas a quase singulares (DOP nas centenas), até <b>{ "1e-6" }</b> relativo; proveniência + regeneração em <c4/>. Como verificação adicional em forma fechada, uma geometria de tetraedro regular reproduz os DOP analíticos (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) até { "1e-9" }. Sigma da posição = PDOP × erro equivalente de distância do utilizador.

# text
seg-504d5aa92cbc = Erro de posição = σ_UERE × DOP para a solução de posição de mínimos quadrados do próprio motor

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/>: um Monte Carlo com seed (N = { "20,000" } épocas por geometria, σ = { "1.5" } m, seed ChaCha8 { "36" } + i) de <c3/> com pesos unitários, resolvido a partir da posição verdadeira, nas <b>{ "8" } geometrias de <c4/></b> (aquelas cujo DOP está ajustado ao gnss_lib_py), face a σ²·Q, em que Q é o fator de covariância do próprio núcleo <c5/> (<c6/>, a mesma aritmética). <b>Tolerâncias pré-registadas</b> (commit e50c88d2, antes da primeira execução, segundo a nota de projeto de geometria { "0.36" }, secção { "5.2" }), cada uma um número de erros padrão: variâncias este, norte, vertical e de relógio dentro de { "5" } %; RMS H/V/P dentro de { "2.5" } %; correlação este-norte dentro de { "0.035" }; médias dentro de { "5" } erros padrão; a fração de { "95" } % da elipse horizontal dentro de { "0.95" } ± { "0.0077" }. Primeira execução: todas as { "104" } verificações passam (pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros padrão, elipse { "0.0039" }). Os <b>controlos negativos</b> falham como exigido: um PDOP duplicado falha em todas as geometrias; erros a crescer como 1/sin(elevação) face ao Q não ponderado falham uma verificação de variância em todas as geometrias cujo satélite mais baixo está abaixo de { "20" }°. <b>Como se compõe com a linha acima:</b> essa linha valida o DOP destas geometrias face ao gnss_lib_py; esta acrescenta o passo desses fatores até metros através do solucionador do motor. <b>Mantém-se ao lado uma primeira verificação, separada</b> (<c7/>, <c8/>, executada antes do pré-registo e comunicada como tal): quatro céus escolhidos à mão (aberto, agrupado, desfiladeiro, meio céu; σ { "1" } m) com intervalos de confiança de qui-quadrado a { "1e-6" } no total sobre { "20" } verificações; razões { "0.987" } a { "1.009" }, e os seus próprios controlos negativos (um erro de { "10" } % no DOP, erros de 1/sin(elevação)) falham como exigido. <b>Porque é MODELLED:</b> nenhum conjunto de dados externo; não mostra que o erro de um recetor real segue o modelo, e σ_UERE é uma entrada.

# text
seg-94bffbd8385b = Disponibilidade multiconstelação

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/>: os <c2/> adicionais são fundidos num único conjunto de satélites para visibilidade/DOP; um teste de contagem combinada confirma a união.

# text
seg-0b905100d91c = Ionosfera de difusão (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → atraso oblíquo em L1

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/>: <c2/>, o modelo de frequência única difundido de oito coeficientes. <b>Referência independente externa</b> (<c3/>): o atraso oblíquo em L1 reproduz o <b><c4/> do RTKLIB (uma biblioteca de código aberto de posicionamento cinemático em tempo real)</b> (tomojitakasu/RTKLIB, <c5/> — a referência GNSS aberta de facto, compilada a partir do código-fonte e executada de forma independente) em <b>{ "10" } casos</b> que abrangem elevação, azimute, hora local e dois conjuntos de coeficientes (o predefinido do kshana + o do RTKLIB), até <b>< { "1e-4" } m</b>. O leitor de mapas de TEC (TEC: conteúdo total de eletrões) IONEX (IONosphere map EXchange format) para ficheiros GIM (mapa global da ionosfera) existe agora (<c6/>, <c7/> com interpolação espacial bilinear e temporal e um mapeamento oblíquo, testado unitariamente na própria crate); uma verificação cruzada dessa interpolação face a um produto GIM real do CODE (Center for Orbit Determination in Europe) continua a ser um seguimento. O próprio modelo de difusão é validado externamente.

# text
seg-39e235557ecc = Núcleo de deteção RAIM/ARAIM (ARAIM: monitorização autónoma avançada da integridade pelo recetor) (χ² / χ² não central / normal) → limiares e multiplicadores

# text
# c1: src/raim.rs
# c2: chi2_quantile
# c3: pbias=√λ
# c4: noncentral_chi2_cdf
# c5: normal_quantile
# c6: tests/raim_reference.rs
# c7: scipy.stats.chi2
# c8: .ncx2
# c9: .norm
# c10: optimize.brentq
# c11: (GᵀG)⁻¹
# c12: tests/araim_reference_vectors.rs
# c13: ARAIM_REFERENCE.md
seg-8906f922b9b9 = <c1/>: o limiar de deteção de snapshot / separação de soluções / ARAIM (<c2/>), a não centralidade de falha de deteção <c3/> (<c4/>) e os multiplicadores K_fa/K_md/K_V (<c5/>) são todos avaliados a partir de uma função gama incompleta regularizada sem dependências. <b>Referência independente externa</b> (<c6/>): <b>{ "171" } casos</b> reproduzem o <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — uma implementação independente Cephes/Boost, um algoritmo diferente) ao longo das gamas de funcionamento de P_fa / P_md / redundância, até <b>≤ { "1e-6" } relativo</b>. A geometria que envolve o núcleo (o declive/covariância de <c11/>) é o núcleo DOP validado pelo gnss_lib_py. <b>Âmbito:</b> esta linha fixa o <em>núcleo estatístico</em>. O <em>valor</em> do nível de proteção da atribuição MHSS (separação de soluções de hipóteses múltiplas) do ARAIM é fixado em separado face ao exemplo trabalhado publicado pelo Subgrupo Técnico ARAIM do WG-C (Working Group C) (<c12/>, VPL (nível de proteção vertical) { "18.2926" } m contra { "18.3" } m, HPL (nível de proteção horizontal) { "13.4063" } m contra { "13.45" } m, dentro da própria tolerância de { "0.05" } m da referência; ver a nota sobre normas abaixo e <a1><c13/></a1>).

# text
seg-b17f1501a267 = Nível de proteção SBAS (sistema de aumentação baseado em satélites) (DO-229E Apêndice J) → nível de proteção horizontal / vertical (HPL / VPL)

# text
# c1: src/sbas.rs
# c2: sbas_protection_level
# c3: D=(GᵀWG)⁻¹
# c4: tests/sbas_reference.rs
# c5: zsiki/rtklib_ws
# c6: waasprotlevels()
# c7: rnx2rtkp -ws
# c8: core/filter.c
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-abe00b67e4cb = <c1/>: <c2/>, o <c3/> de mínimos quadrados (LS) ponderados → eixo maior da elipse de erro horizontal + σ vertical, escalados pelos fatores K do DO-229E. <b>Referência independente externa</b> (<c4/>): o HPL do kshana reproduz o <b>fork SBAS-PL do RTKLIB</b> (<c5/> <c6/>, a implementação "DO-229D Appendix J" de Siki & Takács { "2017" }), executado por <c7/> em <b>dados reais do EGNOS (European Geostationary Navigation Overlay Service)</b> (mensagens de difusão do GEO (órbita geoestacionária) PRN120 + RINEX (Receiver Independent Exchange Format) real de BUTE/Budapeste, 2017-02-19), em <b>{ "6" } épocas</b> até <b>< { "2e-3" } m</b>. O σ por satélite é o orçamento SBAS completo da própria referência independente (UDRE (erro diferencial de distância do utilizador) + GIVE (erro vertical ionosférico de grelha) ionosfera + troposfera + aerotransportado). O ESA gLAB { "v6.0.0" } (<c8/>) foi compilado e confirmado como usando a convenção idêntica. <b>Nota sobre K_V:</b> ambas as referências independentes arredondam o K_V do MOPS (normas mínimas de desempenho operacional) → { "5.33" }; o kshana usa o <c9/> exato (VPL ~{ "0.06" } % menor), pelo que a vertical é validada como o <c10/> sem fator K (= VPL da referência independente / { "5.33" }). O HPL é comparado diretamente (K_H = { "6.0" } em ambos os lados).

# text
seg-fd16d642cafd = Geometria real da constelação a partir de TLE (linha 2 / kepleriana)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (análise sintática)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/>: analisa os elementos keplerianos médios da linha 2 (semieixo maior a partir do movimento médio); um conjunto de elementos conhecido da ISS (International Space Station) faz ida e volta para os elementos e o período corretos. Para um bloco apenas de linha 2, a propagação é a de dois corpos do motor (+ J2 opcional) dos elementos <em>médios</em> — sólida para um instantâneo de uma época comum, derivando do SGP4 (Simplified General Perturbations { "4" }) com o tempo.

# text
seg-26d22e76e28d = Propagação SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (TLE completos)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/>: SGP4 completo para perto da Terra + SDP4 para espaço profundo (secular/periódico lunisolar + ressonância do geopotencial de { "12" } h / { "24" } h). Validado em <c2/> face aos vetores oficiais AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 ("Revisiting Spacetrack Report #3") — todos os { "666" } estados de referência (perto da Terra, espaço profundo, ressonantes, casos de código de erro) coincidem até um erro de posição no pior caso de ≈ { "4.1" } mm. Um conjunto completo de duas linhas (linha { "1" } + linha { "2" }) é propagado com o SGP4; só a linha 2 permanece kepleriana; os dois podem ser misturados. O referencial é o TEME (equador verdadeiro, equinócio médio), usado de forma consistente para o utilizador e os satélites (sem redução TEME→ECEF (ECEF: centrado na Terra e fixo à Terra) — adequado para a geometria de disponibilidade/DOP).

# text
seg-c8fc6a49d249 = Nutação IAU (International Astronomical Union) 2000A / 2000B + redução TEME→GCRS (GCRS: Geocentric Celestial Reference System)

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_iau2000b
# c4: eraNut00a
# c5: eraNut00b
# c6: nut00a
# c7: tools/gen_nut00a.py
# c8: nutation_iau2000a_data.rs
# c9: iauNumat
# c10: teme_to_gcrs
# c11: numat
# c12: tests/frame_reference_vectors.rs
seg-b31c49596100 = <c1/>: a série <b>completa IAU 2000A</b> ({ "678" } termos lunissolares + { "687" } planetários, <c2/>) e o truncamento de 77 termos 2000B (<c3/>) são cada um validados <b>bit a bit</b> face aos vetores de referência SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) publicados em JD_TT { "2453736.5" } — <c4/> dá Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> dá Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — ambos até <b>{ "1e-13" } rad</b>. A tabela 2000A é gerada por máquina a partir da fonte ERFA <c6/> por <c7/> (reproduz o <c8/> incluído bit a bit). A matriz de nutação (<c9/>), a equação dos equinócios e a cadeia completa TEME→TOD→MOD→GCRS (TOD: verdadeiro da data; MOD: médio da data) (<c10/>, Vallado AIAA-2006-6980) são testadas quanto a propriedades de rotação própria/ida e volta/precessão mais nutação, a matriz de nutação face ao ERFA <c11/> elemento a elemento até { "1e-14" }, e toda a cadeia TEME→GCRS face ao exemplo TEME→GCRF publicado de Vallado (AIAA 2006-6753, 2004-04-06) até <b>{ "0.11" } m</b> (<c12/>); até essa verificação de ponta a ponta ser acrescentada, a matriz de nutação trazia Δψ com o sinal errado, uma rotação de { "2" }·Δψ (cerca de { "25" }″) que os testes de propriedades não conseguiam ver (ver CHANGELOG, Unreleased, Fixed); 2000A face a 2000B concordam a < { "1" } mas, como exigido. A cadeia baseia-se em equinócio/GMST (GMST: tempo sideral médio de Greenwich); a redução CIO (X,Y,s) sem equinócio e a sua verificação cruzada numérica independente ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um kit de ferramentas de geometria planetária em Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m em órbita GNSS, bem dentro do alvo de < { "10" } m) estão na linha CIO abaixo.

# text
seg-0be3c40cc81a = Modelo geomagnético do campo principal IGRF-14 (IGRF: International Geomagnetic Reference Field)

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: igrf_data.rs
# c5: (B_r,B_θ,B_φ)
# c6: < 0.02°
# c7: synthesis_matches_the_official_bgs_igrf14_values_at_2025
seg-9dbb3b1b18a1 = <c1/>: o campo em harmónicos esféricos normalizados de Schmidt da IAGA (International Association of Geomagnetism and Aeronomy) (grau/ordem { "13" }, { "2025.0" } + variação secular; coeficientes gerados por máquina a partir do <c2/> oficial por <c3/>, reproduzindo <c4/> bit a bit). Validado em cinco frentes independentes: ({ "1" }) verificações pontuais exatas de coeficientes face ao ficheiro da IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) a síntese de grau 1 reproduz o campo de <b>dipolo inclinado em forma fechada exata</b> <c5/> até { "1e-6" }; ({ "3" }) o <b>campo analítico completo de grau 13 é igual a −∇V</b> do potencial escalar (diferenças finitas, até { "1e-4" }) — exercitando as derivadas de Legendre e o termo 1/sinθ de ponta a ponta; ({ "4" }) o eixo do dipolo reproduz o <b>polo norte geomagnético</b> conhecido (~{ "80.7" }°N, −{ "72.7" }°E) e a <b>intensidade do dipolo</b> (~{ "29.7" } µT), e o campo global situa-se na banda física de { "22" }–{ "67" } µT com o sinal de inclinação correto por hemisfério; e ({ "5" }) <b>referência independente externa</b> — a síntese completa reproduz os valores do <b>serviço web IGRF-14 do British Geological Survey</b> em { "2025.0" } (altitude geodésica, WGS-84 (WGS: World Geodetic System)) até <b>< { "2" } nT</b> em X/Y/Z/F e <c6/> em D/I em quatro pontos, incluindo { "400" } km de altitude (<c7/>).

# text
seg-c1027d5ffc44 = Redução GCRS↔ITRS (ITRS: International Terrestrial Reference System) IAU 2006/2000A baseada em CIO

# text
# c1: src/cio.rs
# c2: (X, Y)
# c3: s
# c4: eraXys06a
# c5: eraC2ixys
# c6: eraEra00(2400000.5, 54388.0)
# c7: s
# c8: s06.c
# c9: tools/gen_s06.py
# c10: cio_s06_data.rs
# c11: gcrs_to_itrs_matrix
# c12: eraC2tcio
# c13: xval/anise-frames/
# c14: gcrs_to_itrs_matrix
# c15: earth_latest_high_prec.bpc
# c16: finals2000A
# c17: kshana
seg-aad81285e8cf = <c1/>: a cadeia celeste-para-terrestre sem equinócio. As coordenadas do CIP (Celestial Intermediate Pole) <c2/> e a série de 66 termos do localizador do CIO <c3/> são validadas <b>bit a bit</b> face ao vetor SOFA/ERFA <c4/> publicado em JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); a matriz GCRS→CIRS (CIRS: Celestial Intermediate Reference System) face a <c5/> (todos os nove elementos até { "1e-12" }); o ângulo de rotação da Terra (ERA) face a <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). A tabela <c7/> é gerada por máquina a partir da referência ERFA <c8/> por <c9/> (reproduz <c10/> bit a bit). A <c11/> completa (CIO <c12/> = movimento polar · ERA · GCRS→CIRS) é testada quanto a rotação própria + ida e volta, e mostra-se consistente com a redução TEME herdada baseada em equinócio/GMST-1982 dentro de { "1" } m a um raio de { "7 000" } km (as convenções diferem cerca de { "5" } cm aí). <b>Verificação cruzada independente de terceiros (<c13/>):</b> a mesma <c14/> é comparada com o <b>ANISE</b> (a reimplementação em Rust puro do NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) ao rodar GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) a partir do <c15/> do JPL (Jet Propulsion Laboratory), com <b>parâmetros de orientação da Terra <c16/> do IERS (International Earth Rotation and Reference Systems Service) idênticos fornecidos a ambos os lados</b>, ao longo de oito épocas trimestrais { "2020" }–{ "2023" }. As duas realizações independentes do referencial concordam até uma <b>rotação relativa máxima de { "0.028" }″ — ≤ { "0.86" } m no solo, ≤ { "0.93" } m em LEO (órbita terrestre baixa), ≤ { "3.6" } m em órbita GNSS</b> (ângulo médio { "0.023" }″). Esta é a verificação cruzada de referenciais de "< { "10" } m" do ROADMAP, <b>concretizada</b>; o resíduo é a diferença esperada de modelo/datum entre ITRF93 e IERS-2010-CIO, não um defeito (a âncora bit a bit continua a ser os vetores SOFA/ERFA acima). O ANISE é uma crate MPL-2.0 (MPL: Mozilla Public License) / edição 2024, pelo que a verificação reside numa sub-crate autónoma, excluída do workspace, que nunca toca no grafo de dependências publicado do <c17/> nem em qualquer gate de CI predefinido.

# text
seg-fa5889f379d2 = Ida e volta de exportação SP3 (Standard Product { "3" }, o formato de órbita precisa) (constelação → SP3-c → reanálise)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/>: o instantâneo real do Celestrak <c2/> ({ "30" } satélites GPS) é propagado com o SGP4, exportado para SP3-c (<c3/> → <c4/>), reanalisado (<c5/>), e as posições ECEF recuperadas são comparadas com a referência SGP4 em cada época ao longo de { "24" } h — pior resíduo <b>< { "0.5" } m</b> (a serialização milimétrica do escritor; a tolerância de { "10" } m de grau TLE (TLE: conjunto de elementos de duas linhas) do marco é satisfeita com grande margem). O caminho <c6/> da CLI (command-line interface) também é coberto: o cenário de órbita incluído exporta um SP3 reanalisável de 30 satélites, e um cenário que não é de órbita é rejeitado.

# text
seg-fa5ee52e59aa = Geometria real da constelação GPS a partir de TLE (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/>: um <b>instantâneo genuíno do Celestrak <c2/></b> (2021-07-28, { "30" } satélites GPS operacionais; proveniência em <c3/>) é analisado e cada satélite propagado através do núcleo SGP4 validado até um instante comum, rodado de TEME para ECEF. Afirma que a constelação completa assenta na camada MEO (órbita terrestre média) do GPS dentro de { "1" }%, e que, a partir de um local de latitude média com céu aberto, o todos-à-vista real (nove satélites) produz PDOP { "1.64" } com a diluição vertical a exceder a horizontal (como tem de acontecer para um utilizador em terra). Isto exercita o SGP4 numa constelação real, a par dos caminhos de dados reais SP3 (precisos) e RINEX (de difusão).

# text
seg-a1b7d74bbe02 = Gerador Walker de elementos médios SGP4

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/>: um padrão Walker-delta projetado é emitido como elementos médios SGP4 (movimento médio de Kozai escolhido de modo que o semieixo maior do SGP4 caia na camada alvo) e propagado através do núcleo validado. Testes: um Walker de 24 satélites do tipo GPS situa-se na camada MEO dentro de { "1" }%, os planos estão espaçados exatamente { "90" }° em RAAN (ascensão reta do nó ascendente) recuperada das normais das órbitas, e o movimento médio reproduz o período da camada GPS de ~{ "718" } min.

# text
seg-6e8c472ec9fa = Varrimento de PDOP da constelação + FoM (figuras de mérito) de cobertura/revisita

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (monotonia)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/>: <c2/> tabela a cobertura e o PDOP mediano/pior sobre uma grelha <c3/>; <c4/> comunica a fração de cobertura e as lacunas de revisita num ponto do solo. Validado pelas monotonicidades físicas a que um compromisso de projeto tem de obedecer: acrescentar satélites nunca baixa a cobertura e baixa estritamente o PDOP mediano (um projeto completo de 24 satélites cobre continuamente com PDOP ~{ "1.7" }), e densificar uma constelação reduzida diminui estritamente a pior lacuna de revisita. A lacuna média de revisita nunca excede a máxima. Estas são tabelas de compromisso geométrico, não um orçamento certificado de ligação/cobertura.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Enquadramento honesto: esta é uma camada de geometria determinística (órbitas circulares, Terra esférica de raio médio { "6371" } km, linha de vista pura). Estabelece a <em>disponibilidade</em> e a exatidão de posição <em>geométrica</em> (diluição da precisão × um orçamento representativo de erro de distância) a partir de geometria real, não uma solução de navegação de efemérides precisas. A referência <c1/> coloca uma nave espacial dentro da camada GNSS: mantém uma solução de posição apenas ~{ "59" }% do dia, o relógio quântico mantém uma solução de temporização de { "5" } ns em todas as lacunas (disponibilidade { "1.0" }) enquanto o relógio à escala de chip mantém ~{ "0.73" }.

# text
seg-e2c433c35ba8 = Propagador numérico (Cowell) e modelo de forças

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = O propagador numérico (<c1/>) integra um modelo hierárquico de forças (<c2/>) com os integradores adaptativos (<c3/>). Cada termo abaixo é validado face à verdade analítica ou a uma forma fechada derivada à mão; as perturbações estão <b>desativadas por predefinição</b>, pelo que os goldens publicados não são tocados. O modelo composto é também verificado de forma cruzada com outra ferramenta: <c4/> executa { "11" } casos LEO e GTO (órbita de transferência geoestacionária), { "275" } épocas horárias, face ao propagador DormandPrince853 do Orekit { "12.2" }, e os níveis conservativos (dois corpos → J2–J6 → Sol/Lua → SRP de bola de canhão) concordam até um pior de { "0.08" } m ao longo de { "24" } h (VALIDATED na matriz); o nível de arrasto é apenas caracterizado ({ "333" } m) e continua MODELLED.

# text
seg-ec74e57ff801 = Propagador de Cowell face à verdade kepleriana analítica

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/>: a órbita não perturbada (dois corpos) reproduz a <b>solução de Kepler exata por variáveis universais a menos de um metro ao longo de uma órbita LEO de { "24" } h</b> (um gate mais apertado do que "face a uma referência numérica < { "10" } m"); a energia específica e o momento angular conservam-se até ~{ "1e-9" } relativo; a regressão nodal por J2 reproduz o <c2/> em forma fechada segundo a teoria de primeira ordem (dentro de { "2" } %, o resíduo O(J2²)). <c3/> devolve <c4/> em vez de uma resposta silenciosamente errada quando o método de Newton não converge (perto do perigeu e = { "0.999" }). O <c5/> robusto (arranque de Markley { "1995" }, <c6/>) converge aí e em { "0" } ≤ e ≤ { "0.999999" }, dentro de { "0.9" } ε·|E| das raízes de mpmath de 50 dígitos (<c7/>).

# text
seg-549d15780f79 = Integradores adaptativos (RK4 (Runge–Kutta de quarta ordem) com duplicação de passo + o par embutido Dormand–Prince RK5({ "4" }), DP5({ "4" }) abaixo)

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/>: o RK4 integra <c2/> até < { "1e-9" }, mostra a descida de erro de ~{ "16" }× por passo reduzido a metade (convergência de 4.ª ordem), e conserva o oscilador harmónico ao longo de um período. A estimativa de erro embutida do DP5({ "4" }) é <b>O(h⁵)</b> (reduzir o passo a metade corta-a ~{ "32" }×), integra o oscilador ao longo de { "50" } períodos conservando a energia até < { "1e-6" }, e atinge o mesmo ponto final com a mesma tolerância em <b>menos avaliações de função</b> do que a duplicação de passo; <c3/> satisfaz o mesmo gate de Kepler a menos de um metro e concorda com o caminho RK4 a < { "1" } m numa órbita J2..J6. <b>DOP853</b> (<c4/>): o par { "8" }({ "5,3" }) de Hairer com saída densa reproduz o DOP853 do SciPy { "1.18.1" } passo a passo (passo único dentro de { "5.6e-15" }; contagens de passos idênticas nas execuções e = { "0.7" } e Arenstorf, uma inversão de aceitação/rejeição em { "501" } passos na execução LEO; estados finais dentro de { "1.6e-12" }) e coincide com a solução de Kepler exata tão de perto como o SciPy (<c5/>).

# text
seg-345ae1eb05ec = Campo de harmónicos zonais J2–J6

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/>: <c2/> é verificado de três formas — <b>reduz-se ao <c3/> validado com 666 vetores até à precisão de máquina</b> quando restrito a <c4/>; <b>coincide com o gradiente numérico do seu próprio potencial zonal</b> ao longo de todo o campo J2..J6 (o padrão de referência dos campos conservativos); e os termos ímpares <c5/> contra os pares <c6/>/<c7/> mostram a (anti)simetria norte–sul característica sob <c8/>. Uma órbita J2..J6 propagada conserva a energia total até ~{ "1e-8" } ao longo de um dia.

# text
seg-5536986d9c8f = Gravidade de terceiros corpos (Sol e Lua)

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>coincide com o gradiente exato do seu potencial perturbador</b>, anula-se no geocentro e atinge as magnitudes de manual em LEO (~{ "5e-7" } m/s² Sol, ~{ "1.1e-6" } m/s² Lua). As efemérides solares de baixa precisão de Montenbruck–Gill atingem âncoras J2000 derivadas à mão (distância ao periélio ≈ { "1.471e11" } m, declinação no solstício de ~−{ "23" }°, movimento de ~{ "1" }°/dia); as efemérides lunares mantêm-se dentro do seu envelope de perigeu/apogeu, recuperam a distância média de ~{ "384 400" } km, nunca excedem a inclinação de { "5.3" }° e regressam a menos de { "1" }° após um mês sideral. A ligação do membro direito (RHS) dependente da época é <b>exata ao bit</b> (o termo RHS é igual a <c4/> na posição amostrada em t = { "0" } e t = { "1" } dia), e um desvio de época de um quarto de ano produz uma trajetória diferente.

# text
seg-9c8756f9d534 = Pressão de radiação solar (SRP) + sombra cónica

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/>: <c2/> (bola de canhão <c3/>) é <b>idêntica ao bit</b> à forma fechada em pleno sol, fixa a <b>pressão de radiação a 1 UA (UA: unidade astronómica) em ≈ { "4.5398e-6" } N/m²</b>, situa-se na banda LEO de ~{ "1.36e-7" } m/s² a empurrar para longe do Sol, divide-se por quatro quando a distância ao Sol duplica (inverso do quadrado), e é <b>exatamente zero</b> no interior da umbra. <c4/> dá <c5/> em pleno sol e <c6/> em umbra total (exato), com uma penumbra suave e monótona a subir de { "0" } → { "1" } ao longo da banda <c7/> que <b>se estende para além do cilindro umbral</b>.

# text
seg-17b48db4038b = Resistência atmosférica (primeiro termo dependente da velocidade)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado Tabela 8-4, exponencial por troços) <b>ancora-se em { "1.225" } kg/m³ ao nível do mar</b>, satura abaixo da superfície, diminui monotonicamente ao longo da LEO, situa-se na banda de ~{ "1e-12" } kg/m³ a { "400" } km com uma escala de altura física recuperada de ~{ "58" } km; <c3/> opõe-se à velocidade relativa de co-rotação com a magnitude de ~{ "2e-6" } m/s² típica da LEO. A verificação característica: uma órbita de { "300" } km perde energia específica <b>monotonicamente</b> e o seu semieixo maior decai um valor limitado de ~km/dia, ao passo que a linha de base no vácuo conserva a energia a < { "1e-9" }.

# text
seg-133eed361425 = Correção relativista pós-newtoniana (Schwarzschild)

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/>: <c2/> (forma <c4/> do IERS com <c3/>) reduz-se, numa órbita circular, à forma fechada <c5/> (radial, <b>para o exterior</b>, componentes fora do eixo exatamente nulas), mostra a <b>razão de manual de <c6/> em LEO face ao problema de dois corpos</b>, coincide com a forma simplificada à mão em função da velocidade radial <c7/> a < { "1e-12" } e, no propagador, <b>perturba a órbita mantendo o semieixo maior abaixo de um metro/dia</b> — o oposto conservativo do decaimento por resistência atmosférica.

# text
# c1: ForceModel
# c2: src/gravity_sh.rs
# c3: src/tides.rs
# c4: src/precise_od.rs
# c5: ForceModel
# c6: propagator::Geopotential
# c7: HolmesFeatherstoneAttractionModel
# c8: tests/cowell_tesseral_orekit_oracle.rs
# c9: acceleration
# c10: acceleration_hf
# c11: from_gfc_file
# c12: scripts/fetch_egm2008.sh
# c13: acceleration_hf
# c14: xval/high-degree-gravity/
# c15: xval/cowell-tesseral-200-orekit/
# c16: src/nrlmsise00.rs
# c17: tests/nrlmsise00_reference.rs
# c18: forces::DensityModel
# c19: ForceModel::drag_density
# c20: ForceModel::with_ephemeris
# c21: ForceModel::srp_shadow
# c22: tests/srp_oblate_shadow_orekit_oracle.rs
# c23: tests/drag_tier_orekit_oracle.rs
seg-d39e75019595 = Âmbito honesto: as predefinições de <c1/> publicadas integram o campo zonal. O campo <b>tesseral</b> EGM2008 de grau elevado (<c2/>, grau/ordem { "70" }), as <b>marés</b> sólidas/oceânicas/atmosféricas (<c3/>) e o termo de arrastamento de referencial de <b>Lense–Thirring</b> estão agora implementados e integrados no modelo de forças preciso de ajuste de efemérides (<c4/> — ver abaixo). O campo tesseral é também um termo opcional do <c5/> de Cowell (<c6/>, desativado por predefinição), validado face ao <c7/> do Orekit { "12.2" } até ao grau/ordem { "70" } ({ "6" } casos ao longo de { "24" } h, pior |Δr| de { "0.036" } m; <c8/>). Existem dois avaliadores do campo: o histórico <c9/> (derivadas parciais esféricas; válido até ao grau ~{ "180" } longe dos polos; saídas fixadas) e <c10/> (coluna progressiva modificada de Holmes–Featherstone { "2002" }, gradiente sem 1/cos φ; válido até ao grau { "2190" } em todas as latitudes). O EGM2008 até { "2190" } é carregado em tempo de execução (<c11/>, <c12/>, não incluído). <c13/> concorda com o Orekit { "12.2" } a { "7.3e-17" } m/s² em oito pontos até ao grau { "2190" }; permanece MODELLED porque o pyshtools não atingiu o limiar fixado antecipadamente junto aos polos (uma verificação com mpmath situa o erro no pyshtools; <c14/>). Uma órbita de { "200" }×{ "200" } durante { "24" } h concorda com o Orekit a { "0.13" } m, mas o seu controlo de sensibilidade ao grau 70, fixado antecipadamente, falhou ({ "0.73" } m < { "1" } m); assim, os graus { "71" }–{ "200" } são caracterizados, e não validados, em órbita (<c15/>). A densidade termosférica NRLMSISE-00 (NRLMSISE: modelo de atmosfera Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended) está portada (<c16/>: bit a bit idêntica à portagem em C de domínio público em { "720" } pontos, a menos de { "1.9e-6" } relativo face ao pymsis, com os { "17" } casos de teste publicados reproduzidos; <c17/>) e é um nível opcional de densidade de resistência atmosférica (<c18/>, <c19/>; a predefinição continua a ser o modelo estático de Vallado). Isto valida a portagem, não a exatidão do modelo face à densidade medida. O Sol e a Lua DE440 (DE: Development Ephemeris) são um nível opcional de efemérides (<c20/>). A sombra de PSR (pressão de radiação solar) para a Terra oblata WGS-84 é opcional (<c21/>), concordando com a razão de iluminação do Orekit { "12.2" } a menos de { "7.4e-9" } em { "2400" } geometrias (<c22/>); a sua variante com escurecimento do limbo não tem referência independente externa (MODELLED). O nível de resistência atmosférica NRLMSISE-00 concorda com a resistência NRLMSISE-00 do próprio Orekit { "12.2" } ao longo de { "24" } h a { "0.03" } m, para um deslocamento por resistência de até { "142" } km (<c23/>, VALIDATED sob as convenções partilhadas). Uma verificação cruzada com o GMAT (General Mission Analysis Tool) continua a ser um trabalho posterior.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Marés no geopotencial (<c1/>)

# text
seg-81b18c4caad3 = Correções variáveis no tempo ΔC̄_nm, ΔS̄_nm aos coeficientes de Stokes (IERS Conventions { "2010" }, Capítulo { "6" }), validadas face aos números publicados pelas próprias convenções — e não face a outra ferramenta.

# text
seg-78dc5baf4d9d = Contribuição

# text
seg-7c6c910bbf89 = Maré da Terra sólida (IERS Eq. { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/>: a maré permanente (de frequência zero) ΔC̄₂₀ fica a menos de { "1" } % do valor publicado pelo IERS, −{ "4.1736" }×{ "10" }⁻⁹ (números de Love anelásticos); o <b>exemplo trabalhado K1 do passo 2 é reproduzido bit a bit</b> (amplitudes sin/cos { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² a { "0.1" }×{ "10" }⁻¹²); o percurso de Legendre normalizado é fixado por valores manuais de forma fechada, independentes da recorrência.

# text
seg-f2e2c5334721 = Maré oceânica (IERS Eq. { "6.15" }, FES2004 (atlas de marés Finite Element Solution { "2004" }), { "8" } constituintes)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = O subconjunto FES2004 incorporado (<c1/> → <c2/>, leitura de Doodson→multiplicador) reproduz exatamente os coeficientes M2 ({ "2,2" }) de origem; a fase de Doodson de K1 é igual a θ_g + π; a magnitude setorial de grau 2 é física e uma ordem de grandeza abaixo da maré sólida.

# text
seg-52a19a291a41 = Maré atmosférica S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

# text
seg-86b3d3a39bc7 = Os harmónicos de Ray incorporados convertem-se, através da relação de carga à superfície (Eq. { "6.21" }), num pico de ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % do termo M2 oceânico). Ressalva honesta: <b>não existe nenhuma referência independente publicada de coeficientes do geopotencial para a maré atmosférica</b>, pelo que é validada por integridade da fonte e por magnitude, um limiar mais fraco do que o das marés sólida/oceânica.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Manobras e projeto de trajetórias (<c1/>)

# text
seg-a2ff4b0619d4 = ΔV impulsivo + propagação da covariância

# text
seg-12f469864d28 = Uma descontinuidade de velocidade com uma covariância de { "6" }×{ "6" } propagada (queima determinística ⇒ STM (matriz de transição de estado) identidade; a covariância do erro de execução roda desde o referencial da queima — ECI (inercial centrado na Terra) ou LVLH (vertical local, horizontal local) — para o bloco da velocidade).

# text
seg-f3f0e4a7ec05 = Integração de queima finita vs Tsiolkovsky

# text
seg-f7b35b7acdba = Integração a tração constante ao longo de um arco de queima (massa como estado) cujo ΔV alcançado coincide com a equação de foguetão de <b>Tsiolkovsky</b> em forma fechada a <b>melhor do que { "0.01" } %</b>.

# text
seg-46ae334a0604 = Ida e volta do solucionador de Lambert (Izzo { "2015" })

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = A saída de Lambert de uma só revolução (<c1/>, <c2/>, tempo de voo ⇒ <c3/>, <c4/>) é <b>feita em ida e volta através do propagador de Kepler de variáveis universais exato</b> — tem de voltar a cair em <c5/>.

# text
seg-04d69337acb3 = Varrimento porkchop vs piso de Hohmann

# text
seg-fb5298b7983c = O mínimo da grelha lançamento × chegada de C3 / V∞ de chegada é verificado face ao <b>piso analítico de C3 da transferência de Hohmann</b> para duas órbitas circulares coplanares.

# text
seg-bf2eb36e3eb6 = Solucionador de Lambert vs uma biblioteca independente

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/>: { "13" } transferências de uma só revolução, de LEO a GEO e a heliocêntrica, progradas e retrógradas, face ao lamberthub { "1.0.0" } <c2/>; pior diferença de velocidade na fronteira de { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Âmbito honesto: sem otimizador de trajetórias, sem ramos de Lambert de várias revoluções e com um modelo heliocêntrico sintético circular coplanar (sem efemérides planetárias DE, pelo que não foi executada uma verificação cruzada de C3 Terra–Marte com o GMAT).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Determinação de órbita (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Corretor em lote de Gauss–Newton

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = O solucionador genérico <c1/> atinge a solução exata de mínimos quadrados ponderados num ajuste linear, recupera os parâmetros verdadeiros num ajuste não linear <c2/> e resolve uma multilateração de distâncias 3-D a partir de distâncias sem ruído.

# text
seg-b31d1ffa99b1 = Determinação de órbita em lote a partir de distâncias

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> recupera <c2/> a partir do seguimento de distâncias por estação terrestre (propagado com o modelo de forças de dois corpos + J2) com <b>exatidão sub-métrica / mm·s⁻¹ a partir de distâncias sem ruído</b> e com <b>~{ "2" } m e um resíduo pós-ajuste no piso de ruído de { "5" } m</b> — a assinatura de um ajuste de mínimos quadrados consistente.

# text
seg-fb29199bf8bd = OD sequencial (filtro unscented)

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> recupera recursivamente o estado a menos de dezenas de metros com a mesma dinâmica e o mesmo modelo de distâncias.

# text
seg-7a636cc9eef0 = OD em lote e sequencial vs um estimador independente

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/>: { "8" } cenários ({ "6" } sem ruído em LEO/MEO/excêntrica com { "3" }–{ "4" } estações, { "2" } com σ = { "5" } m) face aos estimadores de mínimos quadrados em lote e de Kalman do Orekit { "12.2" } com um modelo de forças equivalente; pior caso em lote { "1e-3" } m / { "1e-6" } m/s, sequencial { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | OD em lote de taxa de variação da distância / az-el com máscara de elevação | <c1/> (comparação externa, um limiar fixado antecipadamente não foi atingido) | <c2/>: { "8" } cenários face aos mínimos quadrados em lote do Orekit { "12.2" } com medições geométricas instantâneas personalizadas; conjuntos visíveis idênticos, valores de medição a menos de { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, matriz de transição de estado a menos de { "1.2e-14" }, estados com ruído a menos de { "1.74" } cm e RMS por tipo a menos de { "2.7e-4" }; o limiar de estado sem ruído ≤ { "1" } cm, fixado antecipadamente, não é atingido em { "2" } de { "4" } cenários ({ "1.46" } e { "1.74" } cm; a própria estimativa do Orekit fica a essa distância da sua verdade simulada, a do kshana a menos de { "1e-8" } m). Ver <c3/>. |

# text
seg-35a85fb744cd = Âmbito honesto: a OD didática usa estações inerciais fixas, um referencial topocêntrico de Terra esférica e medições geométricas instantâneas (sem tempo de luz, aberração, refração ou rotação da Terra); a matriz de transição de estado do percurso de taxa de variação da distância/ângulos é variacional (integrada por RK4 com derivadas parciais analíticas de dois corpos + J2), não de forma fechada; não existe filtro sequencial para taxa de variação da distância ou ângulos. O percurso só com distâncias mantém o seu jacobiano por diferenças finitas. (O motor de ajuste de efemérides de força total abaixo tem a sua própria matriz de transição de estado variacional.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Validação do modelo de forças por ajuste de efemérides (<c1/>)

# text
seg-9207d7139b87 = Um estimador preciso de mínimos quadrados em lote de observações de posição com força total: o geopotencial tesseral EGM2008 (avaliado no referencial fixo à Terra através da redução CIO) composto com o terceiro corpo Sol/Lua, PSR, resistência atmosférica, RG (relatividade geral) de Schwarzschild/Lense–Thirring e as marés acima, ajustado a um conjunto de posições inerciais com um jacobiano de matriz de transição de estado variacional. Validado com dados <b>sintéticos</b>, em que a verdade é o próprio integrador do Kshana, pelo que cada resíduo é do estimador e não da dinâmica.

# text
seg-fc676106563e = Composição precisa do modelo de forças

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/>: o campo de grau 0 é exatamente a massa pontual em todas as épocas (o termo central é invariante à rotação); o grau 8 acrescenta o achatamento da banda J2; o terceiro corpo Sol e o termo de marés ligam-se com fidelidade bit a bit; uma aceleração empírica radial constante é puramente radial em RTN (radial, transversal, normal).

# text
seg-98b036354077 = Matriz de transição de estado variacional

# text
seg-71787d9334db = Cada coluna de Φ ao longo de meia órbita LEO (geopotencial de grau 8 + Sol + Lua) concorda com uma repropagação independente por <b>diferenças finitas (FD) centrais em todo o arco</b> a <b>< { "1" }×{ "10" }⁻⁶ relativo</b> na resposta de posição e de velocidade — a verificação cruzada STM↔FD documentada. Φ({ "0" }) = I; os propagadores aumentado e simples concordam a menos de um milímetro.

# text
seg-0b453776136b = Autorrecuperação do ajuste LS em lote

# text
seg-c651db308332 = Um arco Kshana de 1 hora (grau 6 + Sol + Lua) observado sem ruído é recuperado, a partir de um desvio de { "150" } m / { "0.1" } m·s⁻¹, para o <b>estado de época a menos de { "1" }×{ "10" }⁻² m</b> com RMS pós-ajuste quase nulo; com ruído branco de { "5" } m, o RMS 3-D pós-ajuste estabiliza no <b>piso de ruído de ~σ</b>, sem enviesamento. O <b>C_R da PSR é recuperado de { "1.0" } a menos de { "1" } %</b> da verdade de { "1.4" }.

# text
seg-06bd2857f832 = Edição de valores atípicos e relatório RTN

# text
seg-8b9dea5c0727 = Um erro grosseiro de { "500" } m é rejeitado pela edição pós-ajuste a 5 σ (exatamente uma observação), deixando um ajuste limpo ao nível do milímetro; os resíduos são apresentados decompostos em radial/transversal/normal, além de 3-D.

# text
seg-e3969a15df96 = Nível de aceleração empírica (constante RTN + 1-CPR (CPR: ciclo por revolução))

# text
seg-c46af7926511 = Os nove parâmetros empíricos com restrição a priori mantêm-se abaixo de { "1" }×{ "10" }⁻⁸ m·s⁻² numa verdade sem componente empírica, sem perturbar o ajuste; uma aceleração constante transversal à trajetória de { "3" }×{ "10" }⁻⁸ m·s⁻² injetada na verdade é recuperada a menos de { "20" } %.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Âmbito honesto: a onda sintética usa parâmetros nominais de orientação da Terra (EOP: UT1 (Tempo Universal { "1" }, tempo de rotação da Terra) ≈ TT (Tempo Terrestre), sem movimento polar) — exatos para a autorrecuperação, uma vez que o mesmo modelo gera e ajusta o arco. As validações com conjuntos de dados de agências sobrepõem EOP finals2000A <b>reais</b> e verdade SP3/SPK (SPK: núcleo de efemérides planetárias) a este motor através da cadeia de referenciais CIO (<c1/>, <c2/>, <c3/>, <c4/>).

# text
# c1: tests/agency_galileo.rs
# c2: tests/agency_swarm.rs
# c3: tests/agency_lro.rs
seg-934f0f8e4f5f = Órbitas precisas reais de agências (<c1/>, <c2/>, <c3/>)

# text
seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

# text
# c1: ESA0MGNFIN
# c2: C_R
# c3: C_R
# c4: workflow_dispatch
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-14a2999d0739 = Motor de força total do Kshana ajustado a uma fatia textual da <b>própria órbita final da ESA/ESOC (ESOC: European Space Operations Centre)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) para o Galileo <b>E11</b> ao longo de { "8" } h, com cada posição ITRF rodada para GCRS com EOP finals2000A reais: <b>RMS 3-D pós-ajuste de { "0.133" } m</b> com força pura + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> com o nível empírico, a partir de uma sobreposição bruta de { "78.7" } km. O arco completo de { "24" } h dá <b>{ "0.611" } m</b>. Tudo bem dentro do limiar de { "5" } m. Campo gravítico convergido por d/o-8 (idêntico a d/o 8/10/12); o trabalho <c4/> executa o d/o-70 completo. Proveniência + SHA-256 (SHA: Secure Hash Algorithm) em <c5/>; registo completo em <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Motor de força total (+ resistência atmosférica) ajustado a uma fatia textual da <b>própria órbita precisa de dinâmica reduzida Swarm-A da ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) ao longo de { "3" } h a d/o-70, com EOP finals2000A reais através da cadeia CIO: nível <b>dinâmico</b> (só estado, densidade estática, <c2/>={ "1" }) com <b>RMS 3-D pós-ajuste de { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — resíduo ≈ pura resistência atmosférica ao longo da trajetória), nível <b>de dinâmica reduzida</b> (+ acelerações empíricas CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm face à órbita de ~{ "2" } cm da ESA. Proveniência + SHA-256 em <c4/>; registo completo em <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) lunar — validado, acima de { "5" } m (com honestidade)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = Ajuste de modelo de forças <b>centrado na Lua</b> (<c1/>): o campo gravítico <b>GRGM660PRIM</b> do GRAIL (d/o { "100" }) no referencial lunar de eixos principais fixo ao corpo (<c2/>, IAU { "2015" } Terra média + o desvio fixo DE421 (Development Ephemeris { "421" }) Terra média → eixos principais (ME→PA), aplicado como o SPICE o define desde { "0.36" }: até então era aplicado no sentido errado, com cerca de { "208" }″ de erro) + terceiro corpo Terra/Sol, ajustado através do <em>mesmo</em> estimador genérico de Gauss–Newton dos conjuntos de dados da Terra à órbita reconstruída real do <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } épocas, ~{ "98" } km. Pós-ajuste honesto ({ "0.36" }): <b>dinâmico { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>de dinâmica reduzida { "6.67" } m</b> (RTN 3.41/4.58/3.44, empírico de { "1" }+2 por revolução), a partir de uma sobreposição bruta de { "39.9" } m (antes da correção ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>acima</b> do limiar de < { "5" } m, sem que a causa seja o estimador (idêntico a d/o 100/150 e <c3/> 1e-6/1e-9). Uma <b>validação cruzada de nível DE</b> (<c4/>: orientação PA lunar DE440 (Development Ephemeris { "440" }) + efemérides DE440 através do ANISE) <b>corrigiu</b> a afirmação sobre o fator limitante — deu { "12.0" } m dinâmico e { "6.67" } m de dinâmica reduzida, valores com que a pilha analítica corrigida coincide agora nos dois níveis (a anterior diferença dinâmica, { "12.6" } → { "12.0" } m, era o erro do desvio ME→PA), pelo que o piso operacional <b>não</b> é a orientação/efemérides analítica, mas um resíduo irredutível do nível empírico (mais consistente com dinâmica não gravitacional do LRO não modelada ao longo do arco curto); a pilha analítica enxuta já coincide com o nível DE para a órbita de dinâmica reduzida. Proveniência + SHA-256 em <c5/>; registo completo em <c6/>. <b>Validado face à verdade real de agências: { "3" } de { "3" }; atingindo < { "5" } m: { "2" } de { "3" }.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Navegação por mapa gravítico / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Campo de anomalia gravítica em harmónicos esféricos

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/>: um campo de grau baixo, totalmente normalizado, verificado face às funções de Legendre em forma fechada (<c2/>, <c3/>, <c4/>) e a uma anomalia de termo único derivada à mão de { "1.897" } mGal.

# text
seg-f00f82b70e6e = Modelo de medição do gravímetro de átomos frios

# text
# c1: σ = ASD/√τ
seg-49090598c525 = O piso de ruído branco é derivado da ASD do acelerómetro CAI (<c1/>), injetado como uma sequência determinística com semente (o algoritmo de correspondência nunca recebe a verdade sem ruído, mas a execução é reprodutível bit a bit).

# text
seg-0556db62c45f = Filtro de partículas com reamostragem por importância sequencial

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/>: o núcleo determinístico é fixado exatamente — ESS (dimensão efetiva da amostra) a abranger { "1" }…N, reamostragem sistemática a escolher índices em proporção ao peso, a combinação convexa da média ponderada, uma verosimilhança gaussiana a puxar a estimativa para a medição e o determinismo da predição com semente.

# text
seg-7dca80b16a00 = Verosimilhança de correspondência com o mapa + recuperação

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/>: <c2/> atinge o máximo (= { "1" }) numa correspondência perfeita e cai para <c3/> a um sigma; um filtro de partículas sobre uma região de terreno sintético distintiva recupera a posição verdadeira a menos de { "0.1" }.

# text
seg-446d9f03a860 = Benchmark de 60 minutos sem GPS

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>): uma falha de ~{ "700" } km / uma hora em que a solução inercial deriva para <b>≈ { "70" } km</b> é recuperada para <b>≈ { "145" } m (< { "500" } m)</b> por um algoritmo de correspondência hierárquico do grosseiro ao fino — reprodutível bit a bit, estável entre realizações de ruído e comprovadamente limitado pelo refinamento (uma única grelha grosseira estagna em ~{ "2" } km).

# text
# c1: .hgt
seg-81a2963c26cc = Carregador de DEM (modelo digital de elevação) SRTM (Shuttle Radar Topography Mission) <c1/> + amostragem bilinear (REFERÊNCIA INDEPENDENTE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/>: um buffer <c3/> de { "2" }×{ "2" } construído à mão, com cantos [{ "100,200" };{ "300,400" }], interpola bilinearmente para <b>exatamente { "250.0" }</b> no centro da célula (referência independente em forma fechada), a ida e volta em 16 bits big-endian é exata e a inversão de linhas coloca a linha de ficheiro mais a norte na latitude armazenada mais elevada — tudo face à <b>especificação do controlador SRTMHGT (Shuttle Radar Topography Mission height-file format) da GDAL (Geospatial Data Abstraction Library)</b> (16 bits com sinal big-endian, por linhas, linha norte primeiro, vazio -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Um dado de teste de { "11" }×{ "11" } incluído no repositório (<c4/>) exercita o analisador em CI; e um <b>mosaico SRTM v3 real, de domínio público, da NASA/USGS (USGS: United States Geological Survey), incluído no repositório</b> (N36W117, Vale da Morte, decimado para 6 segundos de arco, { "722" } KB, <c5/>) é lido em CI (não ignorado, <c6/>), situando <b>Badwater Basin a ≈ −{ "78" } m, dentro da banda documentada [−{ "95" },−{ "70" }] m</b> (levantamento NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) com o máximo do mosaico a ≈ { "2161" } m — a fonte de verdade é o levantamento, o DEM é que está em teste (não circular). Altitudes publicadas de maior dimensão (Mount Whitney { "4421" } m) permanecem nos testes de mosaico completo condicionados por <c7/>.

# text
seg-80f985ea3e11 = Convergência da navegação referenciada ao terreno (TERCOM/SITAN (TERCOM: correspondência de contornos do terreno; SITAN: Sandia Inertial Terrain-Aided Navigation)) (REFERÊNCIA INDEPENDENTE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>): uma deriva do INS injetada <b>derivada à mão</b> ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km a ~{ "12" }° de latitude, calculada como deriva° × M_por_grau × cos lat) é recuperada para <b>< { "500" } m</b> (dentro do piso de resolução da grelha <c3/>), uma redução de > { "100" }× face à navegação inercial livre — verificada face ao número <em>injetado</em>, nunca face ao DEM (não circular), reprodutível bit a bit e estável entre sementes de ruído.

# text
seg-5b7c1dc72436 = Ganho de fusão combinada gravidade+magnético+terreno (REFERÊNCIA INDEPENDENTE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>): três canais escalares (Δg · anomalia crustal de |B| · elevação) fundidos como uma verosimilhança em produto dão um resíduo <b>limitado de < { "500" } m</b> ao longo da falha de 60 min que, com média de sementes, é <b>não pior do que o melhor canal individual</b> (aditividade de informação / CRLB (limite inferior de Cramér–Rao) menor). Situa-se no regime de CEP (erro circular provável) de "dezenas de metros" publicado para o TERCOM / navegação referenciada ao terreno (TRN) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: filtro de Kalman de estado de erro), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Âmbito honesto: o campo gravítico é de grau baixo + mascons sintéticos, <b>não</b> o conjunto completo de coeficientes EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); o canal magnético assenta no campo principal IGRF suave mais mascons de anomalia crustal <b>sintéticos</b> (um mapa crustal real de alta frequência é um trabalho posterior); o campo de terreno de CI para os benchmarks de <em>posição de navegação</em> é o DEM sintético autónomo, enquanto o próprio leitor de <c1/> está agora validado em CI face a um mosaico SRTM v3 real incluído no repositório (acima); os mosaicos reais de resolução completa continuam condicionados por <c2/>. Uma simulação de Monte Carlo do erro de representação do mapa continua a ser um trabalho posterior. Os três navegadores estão agora ligados ao motor de cenários por <c3/> (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = Modelo de erro de INS / IMU — validação referenciada a folhas de especificações (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = O modelo de erro estocástico da IMU é validado face a <b>especificações publicadas de folhas de especificações / conjuntos de dados de fabricantes</b> — nunca face a um valor produzido pelo próprio Kshana. A ponte entre uma especificação em unidades de campo e o modelo de ruído em SI (Sistema Internacional de Unidades) é a identificação padrão por desvio de Allan (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): o coeficiente de passeio aleatório <c1/> é o ADEV sobreposto lido em τ = { "1" } s na inclinação τ⁻¹ᐟ², e o coeficiente de instabilidade do viés é o patamar plano de Allan (<c2/>, hermético — sem descargas).

# text
seg-702de63000d2 = Evidência / referência independente

# text
seg-c3fed48b98b1 = Camada de conversão de unidades (o risco n.º 1 de não circularidade)

# text
seg-6cdc88d36bfd = Verificado à mão: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Passeio aleatório de ângulo do giroscópio

# text
seg-d5fd60857e4d = ARW do ADIS16465 de { "0.15" } deg/√hr (folha de especificações da Analog Devices) recuperado a partir de ADEV({ "1" } s) a < { "5" }%.

# text
seg-c5e2d361b83f = Passeio aleatório de velocidade do acelerómetro

# text
seg-4413d3bb39b4 = VRW do ADIS16465 de { "0.1" } m/s/√hr recuperado a < { "5" }%.

# text
seg-ebeb0bb0e0fb = Inclinação de Allan do ruído branco

# text
seg-f674ce82dc2c = Inclinação log-log do ramo branco do ADIS16460 de −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Patamar de instabilidade do viés em funcionamento

# text
seg-94acb18a94cb = Instabilidade do viés (BI) do giroscópio do ADIS16465 de { "2.0" } deg/hr recuperada como o mínimo plano de Allan a < { "15" }%.

# text
seg-b359e0e92e20 = Segundo perfil de IMU

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr), ambos recuperados a < { "5" }%.

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Âmbito honesto: isto valida o <b>modelo de erro estocástico</b> face aos coeficientes de Allan das folhas de especificações. O conjunto de dados de veículo <b>KF-GINS</b> do i2Nav-WHU (WHU: Wuhan University) é usado como uma verificação separada, condicionada pelos dados: o EKF de estado de erro em malha fechada com acoplamento fraco e modelo de braço de alavanca do GNSS é uma linha VALIDATED da <a1>matriz de verificação</a1> (<em>EKF GNSS/INS com acoplamento fraco e braço de alavanca no conjunto de dados KF-GINS</em>), comparado com a trajetória de referência em C++ do KF-GINS sob limiares registados antes da execução. Só é executado onde o conjunto de dados é fornecido (<c1/>); sem ele, são executados os testes do carregador sintético e do braço de alavanca. As variantes com acoplamento forte e de fase da portadora não são abrangidas por essa linha (a linha GNSS/INS com acoplamento forte e fase da portadora é MODELLED).

# text
# c1: src/body.rs
# c2: src/mars_frame.rs
# c3: src/ephem_provider.rs
# c4: src/radiometric.rs
# c5: src/timescales.rs
seg-f0ab98c1a79d = PNT de espaço profundo e de Marte — fundação D0 (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-bd222b27949c = O primeiro marco do motor de navegação de espaço profundo: generalizar o núcleo, fixado na Terra, para um corpo central arbitrário, acrescentando a dinâmica de Marte, uma interface de fornecedor de efemérides, tempo sub-microssegundo e as primitivas de tempo de luz / atraso relativista. <b>Todos os cenários da Terra existentes são idênticos byte a byte</b> — os valores de referência de reprodutibilidade multiplataforma (<c1/>, <c2/>) passam sem alterações e sem regeneração, verificados a cada commit.

# text
seg-e0cdbfcbb28a = Abstração de corpo central (Terra idêntica byte a byte)

# text
# c1: src/body.rs
# c2: Body{mu,re,zonals,gravity,rotation,IAU-pole}
# c3: earth()/mars()/moon()/sun()
# c4: tests/mars_dynamics.rs
# c5: two_body_accel_body(r,&Body::earth())
# c6: zonal_accel_body
# c7: assert_eq!
# c8: ForceModel
seg-7d20649189fa = <c1/>: <c2/> com <c3/>. <c4/> verifica que <c5/> e <c6/> são iguais às funções legadas da Terra com <b>igualdade bit a bit exata</b> (<c7/>), e que um arco da Terra com <c8/> predefinido é idêntico byte a byte — os valores de referência de reprodutibilidade não se alteram (mesmo SHA, sem regeneração).

# text
seg-658acc8112e3 = Gravidade de Marte (tesseral GMM-3 (GMM: Goddard Mars Model), fixa ao corpo)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/>: zonais C̄20/C̄30/C̄{ "40" } a partir de J2/J3/J4 do MRO110 (solução gravítica da Mars Reconnaissance Orbiter) (<c2/>, o J2 faz a ida e volta para { "1.9604e-3" }) + setoriais/tesserais C̄22/S̄{ "22" }, C̄32/S̄{ "32" } do MRO110B2 (Konopliv et al. { "2011" }; tabelados em Liu, Baoyin & Ma { "2012" }), avaliados no referencial de Marte fixo ao corpo da IAU. <c3/> verifica a ida e volta, o afastamento à escala de J2 face à massa pontual e que o campo é genuinamente fixo ao corpo (uma reorientação de um quarto de dia marciano altera a aceleração inercial). Graus/ordens superiores são carregados a partir de um <c4/> incorporado através de <c5/>.

# text
seg-1dcbee768418 = Referencial de Marte fixo ao corpo (polo IAU)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/>: a rotação 3-1-3 da IAU <c2/> (convenção WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), a mesma de <c3/>). Testes: ortonormal a { "1e-12" } com det +{ "1" }, identidade na ida e volta, o meridiano de referência avança a <c4/> por dia.

# text
seg-5b6355a143c7 = Propagação em torno de Marte / centrada no Sol

# text
# c1: validated
seg-4ab87f666765 = <c1/> (autoconsistência)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/>: uma órbita baixa de Marte regressa ao ponto de partida após um período kepleriano (fecho); a energia específica ε=v²/2−μ/r deriva <{ "1e-9" } ao longo do arco; a regressão nodal secular por J2 de Marte coincide com a taxa analítica de Vallado (calculada de forma independente ≈ −{ "5.15" } °/dia a { "60" }° de incl.) a { "3" }%; uma órbita heliocêntrica recupera o ano marciano de ~687 dias (vis-viva + recuperação independente do período a partir do arco). Sem dados externos.

# text
seg-acff4c016089 = Validação cruzada com a DE440 (Marte heliocêntrico)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (EXCLUÍDO do workspace; o ANISE sob MPL-2.0 fica confinado ao seu próprio Cargo.lock; espelha <c2/>): compara a propagação de Marte centrada no Sol do Kshana com a DE440 do JPL (através do ANISE), com a verdade do Horizons citada textualmente (proveniência + SHA-256). <b>Resultado reproduzido</b> (semente JD (data juliana) { "2459580.5" } TDB (Tempo Dinâmico Baricêntrico), <c3/> SHA-256 <c4/>): resíduo de posição de <b>{ "137" } m num arco de 1 dia</b> ({ "5.97" }×{ "10" }⁻¹⁰ da distância heliocêntrica de { "2.299" }×10¹¹ m), a crescer para { "3.3" } km a { "5" } d, { "87.9" } km a { "30" } d, { "1.71" } Mm a { "90" } d — o resíduo <em>cresce</em> com o comprimento do arco porque um modelo de dois corpos centrado no Sol omite deliberadamente as perturbações planetárias (sobretudo de Júpiter) e o movimento interno do sistema de Marte que as efemérides baricêntricas DE440 incluem; assim, o crescimento é a assinatura honesta da dinâmica de n corpos não modelada, e não um erro do integrador; um arco curto a manter-se uma pequena fração da distância heliocêntrica confirma que o mecanismo centrado no Sol está correto. Só é executado quando o núcleo DE440 está presente (<c5/>, ou obtido automaticamente, ~{ "32" } MB) — uma verificação manual / <c6/> de nível DE, <b>não</b> uma barreira de CI predefinida, pelo que o crate publicado e todas as barreiras predefinidas permanecem byte a byte intocados.

# text
seg-a7d79066a53b = Tempo de luz + atraso de Shapiro

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/>: a solução iterativa do tempo de luz com época retardada (converge |Δτ|<{ "1e-12" } s, com limite) e o atraso de Shapiro Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testes: Terra–Sol ≈ { "499" } s e Terra–Lua ≈ { "1.28" } s através das efemérides incorporadas; um emissor sintético de velocidade constante recupera a solução retardada analítica a <{ "1e-9" } s (solucionador comprovadamente independente de qualquer efemérides real); o atraso de Shapiro coincide exatamente com um valor calculado à mão e dá ~{ "100" }–{ "250" } µs para um raio rasante de conjunção superior Terra–Marte.

# text
seg-1bc28f6bdc8f = Interface de fornecedor de efemérides

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/>: <c2/> + <c3/> sem núcleos (Sol/Lua de Montenbruck–Gill, geocêntricos); devolve <c4/> para os corpos para os quais não tem série (por exemplo, Marte), para os quais o fornecedor ANISE de nível DE é o caminho — a mesma separação entre incorporado e ANISE que em <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Tempo em duas partes + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/>: um <c2/> com acumulação two-sum de Knuth recupera intervalos sub-microssegundo que o JD em f64 simples perde perto de J2000 (>{ "1000" }× melhor, testado); <c3/>/<c4/> usam a série periódica dominante de Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, verificada à mão em J2000). Aditivo — o percurso de tempo em f64 simples existente não se altera.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Observáveis radiométricos de espaço profundo e Mensagem de Dados de Seguimento CCSDS — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = O segundo marco do motor de navegação de espaço profundo: o <b>modelo de observáveis</b> que transforma o núcleo de tempo de luz/atraso relativista D0 nas grandezas efetivas que uma passagem de seguimento da Deep Space Network (DSN) ou da ESTRACK (European Space Tracking network) comunica — distância, Doppler a uma/duas/três vias, retransmissão coerente do transponder, medição de distância regenerativa/PN (PN: pseudo-ruído), Δ-DOR (DOR: medição de distância diferencial a uma via) e os meios de propagação — mais a entrada/saída da <b>Mensagem de Dados de Seguimento (TDM) CCSDS (Consultative Committee for Space Data Systems) 503.0-B</b>, que ingere/emite um ficheiro de seguimento padrão de agência. <b>Âmbito honesto:</b> trata-se de <b>modelos geométricos exatos</b> que seguem as convenções de Moyer / CCSDS; o <em>ruído</em> de medição é o <c1/> por observação fornecido por quem chama, não incorporado no modelo. Reproduzir uma <em>passagem de seguimento real específica</em> exige dados TDM reais e o solucionador de determinação de órbita de espaço profundo — isso é <b>D2</b>, não D1. Tudo o que se segue é aditivo (os valores de referência de reprodutibilidade não se alteram; mesmo SHA, sem regeneração).

# text
seg-d1d2dc7906c8 = Distância e Doppler a 1/2/3 vias (resolução de duas pernas de Moyer)

# text
# c1: src/radiometric.rs
# c2: one_way_range
# c3: two_way_range
# c4: ρ₂ = c·(τ_up + τ_down)
# c5: one_way_doppler
# c6: two_way_doppler
# c7: three_way_doppler
# c8: f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)
# c9: c·τ
# c10: −(f/c)·ρ̇
seg-e2176b844df8 = <c1/>: <c2/>/<c3/> compõem as soluções de tempo de luz retardado (perna descendente) e avançado (perna ascendente) de D0; a convenção completa de ida e volta é <c4/> (m), documentada e consistente. <c5/>/<c6/>/<c7/> formam o desvio da portadora <c8/> (Hz) a partir da taxa de variação da distância na linha de visada, <b>convenção de sinal: uma sonda a aproximar-se dá um desvio positivo (para o azul)</b>. Testes: distância a duas vias = soma das pernas a <{ "1" } mm (~{ "2" } UA de ida e volta Terra–Sol); distância a uma via = <c9/> exatamente; o Doppler a uma via coincide com o analítico <c10/> para um emissor radial de velocidade constante a ppt; a três vias com estações co-localizadas reduz-se byte a byte a duas vias.

# text
seg-638697be5b5b = Retransmissão coerente do transponder (razões DSN exatas)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/>: os números racionais exatos de retransmissão DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 módulo 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testado quanto à igualdade exata; um par de bandas não definido provoca <b>pânico</b> (falha ruidosa, nunca inventa uma razão). <c3/> aplica a portadora da banda + a razão de ponta a ponta e é igual ao <c4/> explícito até à precisão da máquina.

# text
seg-f24f9da1570c = Medição de distância regenerativa / PN (CCSDS { "414" }; ambiguidade)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (a distância sem ambiguidade à escala da resolução por chip) e <c4/> = isso × comprimento do código (a distância sem ambiguidade do código PN completo <c5/>), segundo o CCSDS 414.1-B. Testado: um relógio de distância de { "1" } MHz dá ~{ "149.9" } m; o código PN de votação ponderada CCSDS-414.1 ({ "1 009 470" } chips) a { "1" } Mchip/s dá a distância sem ambiguidade de projeto de ~{ "151 000" } km; duplicar a taxa de chips reduz a metade a ambiguidade por chip.

# text
seg-16b9fdd916a7 = Δ-DOR (plano do céu CCSDS { "506" })

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/>: o atraso diferencial no plano do céu <c2/> (s) para uma linha de base interferométrica <c3/> (CCSDS 506.1-B). Testado: coincide com a projeção analítica exata <c4/> para um desvio conhecido alinhado com a linha de base a { "1e-15" } s, com a magnitude para ângulos pequenos <c5/> e com o <b>nulo</b> (uma sonda co-alinhada com o quasar dá um atraso diferencial exatamente nulo).

# text
seg-4e5258bb04d5 = Calibração de plasma 1/f² em dupla frequência

# text
# c1: src/radiometric.rs
# c2: solar_plasma_delay
# c3: K_PLASMA·TEC/(c·f²)
# c4: 1/f²
# c5: K_PLASMA = 40.3 m·Hz²·TECU⁻¹
# c6: coronal_tec_from_sep
# c7: TEC ∝ 1/sin(SEP)
# c8: dual_freq_plasma_calibration
# c9: K_disp = (Δt_X−Δt_Ka)/(1/f_X²−1/f_Ka²)
# c10: d_X/d_Ka = (f_Ka/f_X)²
# c11: dual_frequency_recovers_injected_plasma
seg-e3b340103825 = <c1/>: <c2/> = <c3/> (o atraso de grupo dispersivo <c4/> de partículas carregadas, <c5/>); <c6/> a coluna de corona <c7/> do tipo Cassini (substituto analítico, não uma corona calibrada); <c8/> a inversão de dispersão <c9/> que a DSN usa para remover o plasma. Testado: a lei 1/f² <c10/>; a corona aumenta em direção à conjunção; e um <b>TEC injetado é recuperado a <{ "1" } %</b> (na verdade ≪ { "1e-9" } sem ruído) — <c11/>.

# text
seg-e1e265ab499a = Meios tropo / iono (reutiliza modelos GNSS)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/>: o segmento da estação terrestre de espaço profundo atravessa a mesma atmosfera terrestre que o pacote GNSS já modela, pelo que delegam em <c3/> (zenital de Saastamoinen + mapeamento de Niell, não dispersivo) e <c4/> (iono de difusão). Testado: ligado e fisicamente com o sinal certo: tropo positivo e maior a baixa elevação do que no zénite; iono um atraso oblíquo não negativo (a fidelidade numérica é a dos testes do próprio pacote GNSS, referenciados a folhas de especificações).

# text
seg-44ba6e0411fd = Leitura / emissão CCSDS-TDM { "503" } + ponte radiométrica

# text
# c1: src/ccsds_tdm.rs
# c2: META_START…META_STOP
# c3: DATA_START…DATA_STOP
# c4: RANGE
# c5: DOPPLER_*
# c6: ANGLE_*
# c7: *_FREQ
# c8: #[cfg(test)]
# c9: tests/fixtures/deepspace/reference.tdm
# c10: to_radiometric_obs
# c11: RANGE
# c12: DOPPLER_*
# c13: RadiometricObs
# c14: PATH
# c15: 1,2
# c16: 1,2,1
# c17: 1,2,3
# c18: TRANSMIT_BAND
# c19: sigma
# c20: 0.0
seg-18eafe936dcb = <c1/>: um leitor <b>e</b> escritor KVN (notação chave-valor) CCSDS 503.0-B-2 (cabeçalho + segmentos <c2/> / <c3/>; registos <c4/>/<c5/>/<c6/>/<c7/>). Testes (<c8/> + <c9/>): o dado de teste de referência é lido para os campos nomeados esperados; <b>ler→emitir→ler é uma estrutura igual</b> (ida e volta semântica); a ponte <c10/> mapeia os registos inequívocos <c11/>/<c12/> para <c13/> (vias a partir de <c14/> <c15/>/<c16/>/<c17/>, banda a partir de <c18/>, km→m); um ficheiro com vários segmentos repõe a máquina de estados. <b>Omissão honesta em vez de suposição:</b> ângulos/frequências, bandas desconhecidas, épocas em dia do ano e sistemas de tempo não reconhecidos são <b>omitidos</b>, nunca mapeados incorretamente, e <c19/> fica em <c20/> para quem chama o ponderar.

# text
seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (precisão do modelo ≫ piso publicado)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/>: os observáveis são cálculos geométricos exatos, pelo que o benchmark honesto é que o <b>erro numérico do próprio modelo está muito abaixo do piso de medição DSN/ESTRACK publicado</b> — o modelo não é o estrangulamento da exatidão, é o σ fornecido por quem chama. Cada teste calcula um observável de duas formas independentes (ou recupera uma verdade injetada) e verifica que o resíduo está abaixo do piso: a <b>distância</b> faz a ida e volta a <{ "1" } mm ≪ o piso de ~{ "1" } m da medição de distância PN (DSN 810-005 mód. { "214" } / CCSDS 414.1-B); o <b>Doppler</b> coincide com a taxa de variação da distância retardada exata em forma fechada <c2/> a ~{ "10" }⁻⁶ m/s, várias × abaixo do piso de ~{ "0.05" } mm/s da banda X (DSN 810-005 mód. { "203" } / Moyer) — o resíduo é o piso da diferenciação de distâncias em f64 a ~{ "1" } UA, uma característica numérica e não um erro de modelação; o <b>Δ-DOR</b> reproduz a projeção em forma fechada com um ângulo equivalente no plano do céu ≪ { "1" } nrad ≪ o piso de ~{ "1" }–{ "10" } nrad (DSN 810-005 mód. { "210" } / CCSDS 506.1-B); o <b>plasma</b> em dupla frequência recupera o atraso injetado a ≪ { "1" } %; e o atraso de <b>Shapiro</b> situa-se na banda publicada de ~{ "100" }–{ "250" } µs da conjunção Terra–Marte. Os valores publicados são apresentados e rotulados como especificações DSN de <b>ordem de grandeza</b>, e não como números exatos fabricados, e a documentação do módulo é explícita em que isto avalia a PRECISÃO DO MODELO, e não a reprodução de uma passagem real (isso é D2 + TDM real).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = OD de dinâmica reduzida de espaço profundo — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = O terceiro marco do motor de navegação de espaço profundo: o <b>estimador</b> que transforma os observáveis radiométricos D1 numa trajetória recuperada — um filtro de informação de raiz quadrada (SRIF) numericamente robusto, com acelerações empíricas de dinâmica reduzida, um relógio de bordo de três estados, um modelo de resistência atmosférica de Marte e as derivadas parciais da medição radiométrica que ligam a distância/Doppler ao estado do filtro, fechado de ponta a ponta por uma recuperação de determinação de órbita sintética em órbita baixa de Marte (LMO). <b>Âmbito honesto:</b> a recuperação é um <b>circuito fechado sintético</b> (a verdade e o filtro partilham o mesmo propagador de Marte, e as observações são o mesmo modelo de observáveis geométrico que o filtro inverte, mais ruído gaussiano injetado) — valida o <b>mecanismo do estimador</b>, não a fidelidade absoluta do modelo de forças de Marte; a verificação cruzada externa de nível DE é o crate <c1/> condicionado por núcleos (D0.8b). Tudo o que se segue é aditivo (os valores de referência de reprodutibilidade não se alteram; mesmo SHA, sem regeneração).

# text
seg-51f203291066 = Núcleo SRIF (filtro de informação de raiz quadrada)

# text
# c1: Srif
# c2: R
# c3: Λ = RᵀR
# c4: b
# c5: Vec<f64>
# c6: gauss_newton
# c7: srif_matches_batch_on_linear
# c8: P = R⁻¹R⁻ᵀ
# c9: srif_covariance_is_spd
# c10: P
seg-9d5fd8c1d37d = <c1/>: um filtro de informação de raiz quadrada de Bierman feito à mão — <c2/> triangular superior com <c3/>, vetor de informação <c4/>, atualizações de medição/tempo de Householder, aritmética <c5/> simples (sem nalgebra). Testes: o SRIF sequencial coincide com a solução de mínimos quadrados ponderados em lote (<c6/>) <b>no estado e na covariância a { "1e-9" }</b> num problema linear-gaussiano concebido para o efeito (<c7/>); a covariância recuperada <c8/> é <b>simétrica ({ "1e-12" }) e definida positiva por construção</b> após uma longa sequência de atualizações de medição/tempo (<c9/>, a decomposição de Cholesky tem êxito); e a informação acumula-se (o traço de <c10/> diminui monotonicamente à medida que se incorporam medições de geometria idêntica).

# text
seg-f9ffa1ef4688 = Acelerações empíricas de dinâmica reduzida (afinação cruzeiro↔LMO)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/>: o filtro <c2/> de nove estados com acelerações empíricas RTN como estados de processos de Gauss–Markov de primeira ordem, a técnica de dinâmica reduzida do JPL/ESOC exposta como um único botão <c3/> (quase dinâmico ⇒ suaviza o ruído num arco balístico; quase cinemático ⇒ o nível empírico absorve uma manobra/resistência atmosférica não modelada). Testes: um filtro quase cinemático acompanha uma <b>manobra em degrau (propulsor)</b> com <½ do resíduo do quase dinâmico, enquanto o filtro quase dinâmico <b>suaviza melhor um arco balístico com ruído</b> (<c4/>); variar o grau de aperto desloca o resíduo pós-ajuste <b>monotonicamente</b>, um contínuo e não um interruptor (<c5/>).

# text
seg-9d5db4d63990 = Relógio de bordo de 3 estados (fase/freq/deriva, van Loan Q, Allan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/>: estado de erro de fase + frequência fracionária + deriva de frequência com o <b>ruído de processo discreto de van Loan exato</b> e uma atualização estabilizada de Joseph. Testes: o <c2/> discretizado coincide com o polinómio de van Loan derivado à mão <b>a { "1e-12" }</b> e <b>reduz-se exatamente ao Q do KalmanClock de dois estados quando a deriva = { "0" }</b> (um superconjunto estrito); uma deriva livre em vários passos faz crescer a variância de fase até à relação de holdover analítica da NIST SP { "1065" } através do termo de passeio aleatório de <c3/>; o estado de deriva <b>recupera uma rampa de envelhecimento verdadeira a <{ "5" } %</b>; um <b>perfil de Allan de classe USO é recuperado</b> (ADEV sobreposto em τ={ "1" } s dentro do limiar de calibração) e o estimador mantém-se consistente em NEES (>{ "95" } % dentro de 3σ) e PSD ao longo de uma execução com <c4/> severo. <c5/> contém os valores CSAC/USO/DSAC (USO: oscilador ultraestável; DSAC: Deep Space Atomic Clock) citados de <c6/> e o piso de Doppler <c7/>.

# text
seg-8666d18daa2b = Resistência atmosférica de Marte (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/>: um perfil de densidade neutra de Marte exponencial por troços (superfície ~{ "0.020" } kg/m³, altura de escala junto à superfície ~{ "11" } km, a média de baixo teor de poeira Mars-GRAM { "2010" } / MCD (Mars Climate Database)) e a aceleração de resistência quadrática calculada relativamente à atmosfera de Marte em <b>co-rotação</b>, mais uma variante <c2/> que o SRIF pode multiplicar. Testes: a densidade diminui monotonicamente e de forma contínua entre bandas, a altura de escala recuperada junto à superfície é a física de ~{ "11" } km, a resistência é <b>estritamente antiparalela à velocidade relativa</b> (o produto vetorial anula-se a { "1e-12" }) com uma magnitude razoável de ~{ "3e-4" } m/s² em LMO, e é linear no termo balístico. <b>Âmbito honesto:</b> uma atmosfera de engenharia representativa, não um Mars-GRAM/MCD validado em voo com dependência de poeira/estação/hora local.

# text
seg-452f32dace80 = Derivadas parciais da medição radiométrica (distância/Doppler) para o SRIF

# text
# c1: range_observable
# c2: range_rate_observable
# c3: ρ = |r_sc − r_sta|
# c4: ρ̇ = û·(v_sc − v_sta)
# c5: ∂ρ̇_obs/∂y = c
# c6: range_partial_matches_finite_difference
# c7: range_rate_partials_match_finite_difference
# c8: radiometric_update_reduces_covariance_in_observed_direction
# c9: range_rate_update_observes_velocity
seg-6661d241cdaf = <c1/> / <c2/>: as derivadas parciais da distância na linha de visada <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) e da taxa de variação da distância <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) que ligam os observáveis D1 ao estado do filtro, mais a derivada parcial da frequência do relógio no Doppler a uma via <c5/>. Testes: ambas as derivadas parciais coincidem com uma <b>diferença finita central do observável a { "1e-6" }</b> (<c6/>, <c7/>); uma única atualização de distância <b>reduz a covariância na direção observada (linha de visada, LOS) em ≫{ "1000" }×</b> e mantém-na definida positiva (PD), e uma atualização de Doppler reduz a variância da <b>velocidade</b> na LOS (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = OD de ponta a ponta em LMO de Marte a partir de dados radiométricos

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/>: um arco de verdade em órbita baixa de Marte propagado sob a gravidade <c2/> gera <b>distância (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> a duas vias com ruído, relativos a duas estações de seguimento; o SRIF de dinâmica reduzida recupera-o a partir de um estado inicial <b>perturbado em ~{ "2.7" } km</b>. Alcançado: <b>RMS de posição convergido ≈ { "0.2" } m</b> (sub-métrico, muito dentro do critério de conclusão de metros a dezenas de metros) ao longo de um arco de 3 órbitas com cadência de { "30" } s, com a <b>covariância fatorizada definida positiva em cada época</b> (a garantia do SRIF, verificada ao longo de todo o arco). O <b>contínuo de afinação cruzeiro→LMO</b> é exercitado de ponta a ponta: com uma verdade de resistência atmosférica não modelada que o modelo do filtro não tem, o botão de dinâmica reduzida (aperto { "1" }) recupera-se a ~{ "14" } m contra ~{ "677" } m na execução quase dinâmica (aperto { "0" }) — uma melhoria de { "48" }× devida ao nível empírico que absorve a resistência atmosférica. <b>Âmbito honesto:</b> circuito fechado sintético (verdade = o mesmo propagador que o filtro usa); a verificação cruzada externa de nível DE é o <c3/> condicionado por núcleos (D0.8b), nunca executado aqui, sem rede.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Cenário PNT de espaço profundo e fusão a uma via + duas vias — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = O quarto marco do motor de navegação de espaço profundo: um <b>cenário de produto PNT de Marte</b> executável que liga o corpo / referencial de Marte D0, os observáveis radiométricos D1 e a OD de dinâmica reduzida D2 num único tipo de cenário <c1/>. Modela uma pequena <b>constelação de retransmissão ao estilo MARCONI</b> que difunde um sinal no espaço a uma via (acoplado ao relógio) e retransmite uma ligação a duas vias (coerente, sem relógio) para uma estação de espaço profundo, e navega três utilizadores de referência (transferência para Marte, orbitador em órbita baixa de Marte, ponto fixo à superfície) através do <b>estimador de fusão conjunta a uma via + duas vias D3.1</b> — um SRIF de doze estados que aumenta o bloco orbital/empírico de dinâmica reduzida D2 com um relógio de bordo de três estados. <b>Âmbito honesto:</b> cada figura de mérito é o <b>limite de covariância formal</b> do estimador (posição 1σ / 3σ por época) e o RMS alcançado face a uma verdade de <b>circuito fechado sintético</b> (a verdade e o filtro partilham a mesma dinâmica de Marte e o mesmo modelo de observáveis geométrico, mais ruído gaussiano injetado) — uma figura de mérito de navegação simulada, <b>NÃO</b> um nível de proteção certificado para aviação e <b>NÃO</b> uma alegação de voo (sem modelo de falhas certificado, sem monitor de integridade, sem dados de seguimento reais). Tudo o que se segue é aditivo (os valores de referência de reprodutibilidade não se alteram; mesmo SHA, sem regeneração).

# text
seg-b81920d2df82 = Fusão radiométrica conjunta a uma via + duas vias (a fusão supera cada uma isoladamente)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/>: o SRIF de dinâmica reduzida D2.2 aumentado com os três estados do relógio de bordo (<c2/>), que ingere uma série temporal mista de distância/Doppler a <b>duas vias</b> (sem relógio, fixa a órbita — zero colunas de relógio na derivada parcial) e a <b>uma via</b> (acoplado ao relógio — a derivada parcial de frequência <c3/>) através de <c4/>. A estrutura calibrar-e-depois-navegar-em-inércia: as passagens a duas vias fixam a órbita, os dados a uma via calibram depois o relógio e mantêm a órbita entre passagens com erro limitado pela estabilidade de Allan do relógio. Testado em <c5/> <c6/>: a solução <b>fundida</b> supera <b>cada tipo de ligação isoladamente</b>; o erro de navegação em inércia de uma execução só a uma via cresce com o intervalo entre passagens a duas vias, de forma consistente com o limite de Allan da classe do relógio; a covariância conjunta mantém-se SPD (simétrica definida positiva) ao longo de todo o processo.

# text
seg-26a4bfa8e6ad = Constelação MARCONI (raio areostacionário, ocultação)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/>: um conjunto de cinco retransmissores — três retransmissores <b>areostacionários</b> em <c2/> (o raio síncrono de Marte a partir de μ/taxa de rotação publicados; testado na banda de <b>{ "20 400" }–{ "20 500" } km</b>) igualmente espaçados em { "120" }° de longitude com { "5" }° de inclinação, mais dois retransmissores numa órbita circular mais alta ({ "1.4" }× areostacionária) com { "60" }° de inclinação para cobertura no plano do céu. Os estados dos retransmissores por época são integrados para a frente sob a gravidade <c3/>; o teste de visibilidade de <b>ocultação por Marte</b> é a geometria da corda que libera a esfera (<c4/>, testado: um retransmissor diametralmente oposto está ocultado, um retransmissor na vertical está visível). <b>Âmbito honesto:</b> uma geometria mínima representativa de difusão mais retransmissão construída a partir de constantes publicadas de Marte — não o projeto de uma constelação de voo específica.

# text
# c1: mars-pnt
seg-b53ea4dd9f7d = Cenário <c1/> acessível por CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

# text
# c1: MarsScenario
# c2: run_mars_pnt
# c3: kind = "mars-pnt"
# c4: src/api.rs
# c5: mars_pnt_kind_round_trips_through_the_dispatch
# c6: scenarios/mars-pnt-lmo.toml
# c7: scenarios/mars-pnt-surface.toml
# c8: scenarios/mars-pnt-transfer.toml
# c9: fom_note
# c10: summary
# c11: to_svg
seg-3a01d13ad2e7 = <c1/> / <c2/> está ligado como o cenário <c3/> em todas as superfícies (D3.3): o executor de CLI, a ligação Python, a versão WASM/playground e o despacho do servidor MCP encaminham todos para ele (teste de ida e volta de <c4/> <c5/>). Cenários de referência fornecidos: <c6/>, <c7/>, <c8/>. O resultado inclui uma <c9/> explícita que rotula a figura de mérito como um limite de covariância (e não como um PL certificado), e as saídas <c10/> / <c11/> repetem o rótulo de honestidade.

# text
seg-28a49a455a74 = Objetivos MARCONI / LightShip reproduzidos: <b>orbitador < { "100" } m</b>, <b>rover < { "15" } m</b>

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/>: os objetivos publicados dos programas MARCONI / LightShip (orbitador < { "100" } m, superfície/rover < { "15" } m) reproduzidos em simulação. <b>Pressupostos partilhados:</b> a constelação MARCONI predefinida de cinco retransmissores; cada retransmissor à vista dá uma distância+Doppler a uma via por época; uma passagem de estação a duas vias coerente a cada <b>{ "30" } min</b>; ruído de classe DSN (<b>σ da distância = { "1" } m, σ do Doppler = { "0.1" } mm/s</b>); o filtro de fusão conjunto de órbita de dinâmica reduzida + relógio de 3 estados iniciado a partir de um estado a priori <b>perturbado em ~{ "2.7" } km</b> (aperto { "0.1" }); figura de mérito = RMS de posição 3-D convergido na segunda metade do arco face à verdade sintética. <b>Orbitador</b> (LMO ~{ "400" } km / { "60" }° de incl., relógio <b>USO</b>, cadência de { "60" } s, ~{ "2" } h ≈ arco de uma órbita): RMS convergido alcançado <b>≈ { "0.40" } m</b> ≪ o objetivo de { "100" } m (média de { "3.1" } retransmissores à vista, covariância SPD em todo o arco). <b>Rover</b> (ponto fixo equatorial à superfície, relógio <b>USO</b>, cadência de { "30" } s, arco de ~{ "2" } h): RMS convergido alcançado <b>≈ { "5.1" } m</b> < o objetivo de { "15" } m (média de { "3.0" } retransmissores à vista, covariância SPD). <b>Ambos os objetivos foram atingidos sem afrouxar nenhuma verificação</b> — o USO é a classe <em>menos</em> capaz dos relógios de bordo realistas (um DSAC só ajudaria) e a cadência de 30 min a duas vias é conservadora para um calendário rotineiro de rede de retransmissão, pelo que os pressupostos são fisicamente justos para um sistema da classe MARCONI e não ajustados para passar. <b>Âmbito honesto:</b> reprodução simulada sob os pressupostos indicados, NÃO uma alegação de voo nem um nível de proteção certificado; a verdade de circuito fechado sintético partilha a dinâmica de Marte e o modelo de observáveis do filtro.

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Tempo coordenado lunar — taxa relativista do relógio Terra–Lua (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Uma escala de Tempo Coordenado Lunar (LTC/TCL (TCL: Temps-Coordonnée Lunaire, o nome francês do Tempo Coordenado Lunar)) requer a taxa secular a que um relógio à superfície lunar funciona relativamente a um relógio no geoide terrestre (TT). <c1/> calcula-a a partir de princípios fundamentais: uma identidade pós-newtoniana de primeira ordem que soma a <b>diferença de autopotencial</b> (o potencial geoidal convencional <c2/> da IAU <c3/> menos o autopotencial à superfície da Lua <c4/>) e o <b>termo cinético (Doppler de segunda ordem)</b> <c5/> a partir da velocidade geocêntrica da Lua (por diferenças finitas da série lunar de Montenbruck-Gill em <c6/>). O termo dominante de autopotencial dá <b>≈ { "57.5" } µs/dia</b>, o termo cinético <b>≈ −{ "0.5" } µs/dia</b>, para um total de <b>≈ { "57" } µs/dia</b>. O cenário <c7/> comunica esta taxa, o desvio LTC−TT acumulado ao longo de um horizonte e suporta um conjunto mínimo de variância inversa (um relógio de papel lunar); as conversões TT↔LTC fazem a ida e volta a < { "1" } ns/dia.

# text
seg-beeb6561ef6b = Referência independente / âmbito honesto

# text
seg-4500e65ede97 = Taxa relativista do relógio Terra–Lua (LTC/TCL)

# text
# c1: lunar_rate_breakdown
# c2: tt_to_ltc
# c3: ltc_to_tt
# c4: lunar_ensemble
# c5: LunarTimeScenario
# c6: L_G
# c7: lunar_time::tests
# c8: W0
# c9: Modelled
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Referência independente: uma identidade relativista interna em forma fechada</b> (geopotencial <c6/> da IAU / das convenções do IERS e autopotencial GM/r (GM: parâmetro gravitacional, G vezes a massa)), <b>verificada por comparação com a banda publicada da taxa do relógio lunar [{ "56" }, { "59" }] µs/dia</b>. Testes (<c7/>): o termo de autopotencial ≈ { "57.5" } µs/dia, a velocidade da Lua ≈ { "1" } km/s, o termo cinético um pequeno valor negativo, o total dentro da banda com os termos nomeados a somar esse total, o desvio LTC−TT a 1 dia ≈ { "57" } µs e uma ida e volta TT↔LTC a < { "1" } ns/dia. <b>Âmbito honesto:</b> o valor principal em µs/dia é <b>dependente da referência</b> — depende das superfícies de referência escolhidas (geoide terrestre <c8/> vs um selenoide lunar), da janela de média temporal e das correções centrífugas/J₂ desprezadas abaixo de µs/dia — razão pela qual o que se publica é uma <b>banda</b>, e não um único número certificado. Esta é uma verificação de autoconsistência <c9/>, <b>NÃO</b> uma validação externa, <b>NÃO</b> uma exatidão absoluta sub-nanossegundo e <b>NÃO</b> certificada para cronometragem operacional.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = VLBI geodésico lunar — atraso em campo próximo para uma linha de base terrestre que observa um farol lunar (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Um observável de VLBI (interferometria de linha de base muito longa) geodésico para duas estações terrestres (uma linha de base) que observam um sinal a uma via de um emissor da classe NovaMoon à superfície lunar. A Lua está em <b>campo próximo</b>, não é uma onda plana, pelo que o atraso geométrico é a diferença exata de duas distâncias <c1/> e não a projeção no plano do céu. O observável completo acrescenta a diferença de desvio de relógio das estações e um termo de Shapiro diferenciado do potencial da Terra (reutilizado de <c2/>). As estações são colocadas em coordenadas inerciais geocêntricas (GCRS) através de <c3/> + <c4/>; o farol através de <c5/> (Lua geocêntrica) + <c6/> (selenográfico→MCMF (MCMF: centrado na Lua, fixo à Lua)) + <c7/> (corpo fixo ME da IAU-2015→inercial). O cenário <c8/> amostra o atraso, a sua taxa por diferenças finitas e a correção de campo próximo ao longo de uma passagem.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = A <b>referência independente</b> é o observável de Δ-DOR de onda plana da mesma base de código <c1/> em <c2/>: no limite de campo distante (um farol sintético a { "1e15" } m) o atraso geométrico tem de se reduzir a <c3/> até à precisão da máquina; à distância lunar verdadeira, a correção de campo próximo da curvatura da frente de onda é não nula (dezenas a centenas de µs). As derivadas parciais do farol <c4/> (e as das estações) são verificadas por diferença finita central (erro relativo < { "1e-5" }).

# text
seg-107b9d328f69 = Atraso de VLBI geodésico lunar + derivadas parciais

# text
# c1: geometric_delay_s
# c2: vlbi_delay_s
# c3: delay_partials_beacon
# c4: _station1
# c5: _station2
# c6: near_field_correction_s
# c7: LunarVlbiScenario
# c8: ReferenceImpl
# c9: delta_dor
# c10: src/radiometric.rs
# c11: lunar_vlbi::tests
# c12: delta_dor
# c13: run_toml
# c14: Modelled
# c15: xp = yp = 0
# c16: jd_tdb ≈ jd_tt
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Referência independente: <c8/></b> — o <c9/> de onda plana da mesma base de código (<c10/>) no limite de campo distante, mais <b>derivadas parciais por diferenças finitas</b>. Testes (<c11/>): magnitude da estação ≈ raio da Terra, distância do farol à distância lunar ({ "356" }–{ "407" } Mm), o atraso geométrico de campo distante coincide com <c12/> a < { "1e-9" } s, uma correção de campo próximo não nula à distância lunar, derivadas parciais do farol/estação por FD a { "1e-5" } relativo, um termo de relógio exato e uma execução de cenário finita despachada através de <c13/>. <b>Âmbito honesto:</b> <c14/>, <b>NÃO</b> validado face a dados reais de VLBI. O movimento polar é desprezado (<c15/>), pelo que as posições inerciais das estações têm um erro de referencial de alguns metros; o farol mistura uma série da Lua com equador médio da data com um desvio fixo ao corpo no ICRF (International Celestial Reference Frame) (<c16/>), uma incoerência de referenciais abaixo da fidelidade do modelo, mas não rigorosa; e não há iteração do tempo de luz, rotação da Terra durante o tempo de luz, meios (tropo/iono/plasma) nem termo de aberração para além do Shapiro diferenciado. Não se alega nenhum TRL (nível de maturidade tecnológica), herança de voo nem aval de agência. { "0.30" }: face aos tempos de luz do ANISE através da DE440, nenhum atraso deste percurso analítico está a menos de { "1" } ps (maior diferença { "24" } µs); a constatação fica fixada.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (Terra e Lua da DE440, eixos principais lunares da DE440, orientação da Terra ITRF93, cada tempo de luz convergido no referencial baricêntrico), executada pelo cenário <c2/> quando os três caminhos de núcleos estão definidos. <b>Referência independente: Biblioteca</b> — tempos de luz convergidos do NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) para DSS-14/43/63, fixados antecipadamente: { "75" } atrasos a menos de { "1" } ps (pior { "0.06" } ps), derivadas parciais do farol e das estações a menos de { "1e-6" }, em { "25" } épocas perto de J2000 (uma emenda depois de as { "2024" } épocas falharem na própria época de emissão em precisão dupla do SPICE, cerca de { "6" } ps, divulgada e fixada). O termo de Shapiro diferenciado, a taxa de atraso e a correção de campo próximo do cenário não são comparados.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = OD lunar conjunta multitécnica + relógio — recuperação simulada em circuito fechado (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Um ajuste de mínimos quadrados em lote de época única (instantâneo) (<c1/>, um passo QR de Householder desde { "0.30" }) que <b>funde as técnicas de VLBI geodésico, de medição radiométrica/de distância local lunar e de medição de distância entre satélites</b> numa rede lunar SIMULADA para recuperar, <em>em conjunto</em>, a posição 3-D de uma estação à superfície lunar, as posições de cada satélite de uma pequena constelação e o desvio de relógio de cada ativo. Os observáveis são: ({ "1" }) atrasos de VLBI geodésico de linha de base terrestre até à estação lunar tratada como farol (reutilizando <c2/>, inercial geocêntrico) — a técnica principal; ({ "2" }) distâncias radiométricas geocêntricas estação terrestre→satélite (que multilateram a constelação a partir das estações terrestres bem distribuídas) e distâncias locais lunares estação↔satélite (distância euclidiana MCI (inercial centrado na Lua) mais o termo de relógio diferenciado); ({ "3" }) distâncias entre satélites (mesma forma); mais uma única pseudo-observação de sincronização do relógio da estação que ancora o desvio de relógio comum, de outro modo inobservável. O vetor de estado é <c3/>. <b>Não há propagação de modelo de forças dentro do solucionador</b> — os satélites são pontos fixos, distintos e ilustrativos numa órbita lunar representativa; trata-se de um ajuste instantâneo deliberadamente limpo. Internamente, as posições são escaladas e os relógios são estimados em metros equivalentes de distância para que a matriz normal se mantenha bem condicionada em f64; as distâncias de VLBI e à distância lunar têm a média removida em torno da geometria nominal para que o jacobiano por diferenças finitas não sofra cancelamento catastrófico. O cenário <c4/> executa a resolução com e sem as componentes de VLBI na mesma semente/verdade e comunica ambas as soluções mais o fator de melhoria da observabilidade da estação.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = O <b>resultado honesto principal</b>: a medição de distância local lunar de uma estação polar a um punhado de satélites situados todos para um lado do céu deixa a posição da estação <b>fracamente observada segundo uma direção</b>, pelo que a resolução apenas com distâncias é mal condicionada e o erro 3-D recuperado da estação é grande (ou a resolução não converge). <b>Acrescentar os atrasos de VLBI de linha de base terrestre torna observável a posição 3-D completa da estação</b>, e o erro recuperado da estação desce para o nível do metro. O teste <c1/> verifica que o erro da estação com VLBI é marcadamente (≥{ "5" }×) menor do que o erro só com distâncias na mesma verdade injetada — o VLBI repor a direção da estação, de outro modo inobservável, é o objetivo da fase.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = A <b>referência independente</b> é a consistência interna: um estado de verdade injetado (estação ~{ "50" } m/eixo, satélites ~{ "30" } m/eixo, relógios ~{ "1e-7" } s, com uma oscilação por componente com semente) é mapeado para observáveis sintéticos através do <em>mesmo</em> modelo geométrico que o solucionador inverte, é adicionado ruído gaussiano com semente (predefinições ilustrativas: σ de VLBI ≈ { "1e-11" } s, σ de distância ≈ { "0.1" } m, σ de ISL ≈ { "0.1" } m; pesos <c1/>), e o estimador tem de recuperar a verdade injetada dentro do ruído a partir de uma estimativa inicial de zeros. Um NEES médio de Monte Carlo <c2/> ao longo das sementes (<c3/>) situa-se numa banda larga em torno de <c4/>, uma verificação de realismo da covariância.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: a álgebra linear da resolução)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Referência independente de { "0.30" }: P2</b> — o numpy { "2.4.6" } (LAPACK gelsd e inv) recalcula cada passo de Gauss-Newton, a solução ponderada convergida, os sigmas formais e o erro da estação nos jacobianos incluídos no repositório de seis redes (<c4/>, passos a menos de { "2.4e-11" }, sigmas a menos de { "1.3e-11" }); os modelos físicos de observação e as magnitudes permanecem MODELLED. <b>Referência independente anterior: <c5/></b> — recuperação de uma verdade simulada injetada + consistência da covariância por NEES. Testes (<c6/>): a fusão completa recupera a verdade (estação < { "5" } m, RMS dos satélites < { "5" } m, relógios < { "1e-8" } s, convergido); o VLBI repõe a observabilidade 3-D da estação (erro da estação ≥{ "5" }× menor com VLBI do que só com distâncias na mesma verdade); determinístico (mesma semente → solução idêntica bit a bit, semente diferente → solução diferente mas recuperada); NEES médio numa banda larga em torno de <c7/>; números comunicados finitos/protegidos mesmo quando só com distâncias é mal condicionado; cenário despachado através de <c8/>. <b>Âmbito honesto:</b> esta é uma <b>recuperação simulada em circuito fechado</b> — a verdade partilha o modelo de observação — <b>NÃO</b> uma validação com dados reais; sem propagação de modelo de forças dentro do solucionador; as posições dos satélites e a geometria das estações terrestres/lunares são ilustrativas. Não se alega nenhum TRL, herança de voo nem aval de agência.

# text
# c1: src/lunar_frame_realise.rs
seg-7620f3a821f6 = Realização do referencial lunar — ajuste de datum de Helmert de 7 parâmetros (<c1/>)

# text
# c1: src/lunar_frame.rs
# c2: p_i
# c3: q_i
# c4: q_i = t + (1 + s)·R(θ)·p_i
# c5: R(θ) = rz(θz)·ry(θy)·rx(θx)
# c6: crate::precession::{rx, ry, rz, matmul, mat_vec}
# c7: [tx, ty, tz, θx, θy, θz, s]
# c8: crate::batch_ls::gauss_newton
# c9: q_i
# c10: p_i
# c11: z
# c12: 1/σ²
# c13: x0 = zeros
# c14: icrf_orientation_tie
# c15: transpose(crate::lunar_frame::icrf_to_iau_moon(jd_tdb))
seg-240271b9d7de = Enquanto <c1/> <em>aplica</em> a orientação do corpo lunar WGCCRE da IAU { "2015" } (um modelo direto), este módulo <em>estima</em> (realiza) um referencial lunar a partir de uma rede de coordenadas de pontos estimadas ligadas a um datum. O núcleo de estimação é uma clássica <b>transformação de semelhança (Helmert) de 7 parâmetros</b> — três de translação, três de rotação de ângulo pequeno e um de escala — que mapeia os pontos <c2/> (referencial estimado) para <c3/> (referencial do datum) como <c4/>, com <c5/> construída a partir de <c6/>. Os sete parâmetros <c7/> são estimados a partir de ≥ { "3" } pares de pontos não colineares por mínimos quadrados ponderados através de <c8/>: o modelo direto prevê cada <c9/> a partir do seu <c10/> e achata as três componentes de todos os pontos no vetor de observáveis, as coordenadas observadas do datum formam <c11/>, os pesos são <c12/>, e a resolução parte de <c13/>. Os ângulos de rotação são estimados em µrad e a escala em ppb para que o jacobiano por diferenças finitas se mantenha bem escalado à magnitude das coordenadas à superfície lunar (~{ "1.7e6" } m). Uma pequena <c14/> compõe a pequena rotação realizada através da orientação corpo da IAU→ICRF (<c15/>) e devolve o desvio angular pequeno residual do referencial realizado em torno dos eixos do ICRF — uma mudança de referencial de expressão deliberadamente simples, <b>não</b> uma estimativa independente do polo lunar.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = A <b>referência independente</b> é a consistência interna: uma transformação de Helmert conhecida (translação ~dezenas de m, rotação ~µrad, escala ~{ "1e-7" }) é <em>injetada</em> numa rede sintética de pontos bem distribuídos (latitude/longitude selenográficas variadas → MCMF, alguns pontos em altitude), é adicionado ruído gaussiano com semente, e o ajuste tem de recuperar os parâmetros injetados. Com dados sem ruído, a recuperação é até ~à precisão da máquina (translação < { "1e-6" } m, rotação < { "1e-9" } rad, escala < { "1e-12" }); com ruído de metros, os parâmetros recuperados ficam a poucos × o σ formal e o RMS residual pós-ajuste situa-se perto do nível de ruído. O cenário <c1/> comunica o datum recuperado, o erro de recuperação por parâmetro face à verdade injetada, o RMS residual pós-ajuste e a ligação de orientação ICRF da rotação realizada.

# text
# c1: helmert_fit
# c2: apply_helmert
# c3: realise_frame
# c4: icrf_orientation_tie
# c5: LunarFrameRealiseScenario
# c6: InternalConsistency
# c7: apply_helmert
# c8: lunar_frame_realise::tests
# c9: run_toml
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referência independente: <c6/></b> — recuperação de uma transformação de semelhança de 7 parâmetros injetada mais a identidade algébrica de ida e volta de <c7/>. Testes (<c8/>): recuperação sem ruído da transformação injetada (translação < { "1e-6" } m, rotação < { "1e-9" } rad, escala < { "1e-12" }); recuperação com ruído a poucos × σ e RMS residual perto do nível de ruído; ida e volta aplicar-e-inverter; determinístico (mesma semente → idêntico bit a bit, semente diferente → diferente mas recuperado); a ligação ICRF com rotação nula é nula e a ligação preserva a magnitude da rotação; cenário despachado através de <c9/>. <b>Âmbito honesto:</b> esta é uma verificação de <b>autoconsistência</b> — recupera uma transformação <em>injetada</em> numa rede <em>sintética</em> — <b>NÃO</b> uma realização do referencial lunar face a dados reais de seguimento / VLBI, e não alega nenhuma exatidão absoluta do referencial. A ligação de orientação ICRF é uma simples mudança de expressão, não uma estimativa independente do polo. Não se alega nenhum TRL, herança de voo nem aval de agência.

# text
# c1: src/lunar_service.rs
seg-f14930d33f47 = Volume de serviço de navegação lunar — DOP / cobertura / disponibilidade + PL ARAIM lunar generalizado (<c1/>)

# text
# c1: crate::orbit::dop
# c2: service_dop
# c3: service_dop
# c4: orbit::dop
# c5: crate::lunar::lunar_araim
# c6: P_sat
# c7: lunar_protection_level
# c8: lunar::lunar_araim
seg-9b4f13e138e4 = Este módulo <em>compõe</em> peças já construídas numa análise de <b>volume de serviço</b> de navegação lunar: varre uma grelha de latitude/longitude selenográficas ao longo de um horizonte temporal face a uma constelação de órbita lunar <b>ilustrativa, de fonte pública, da classe Moonlight / LCNS</b> (LCNS: Lunar Communications and Navigation Services) e comunica DOP / cobertura / disponibilidade mais um envelope generalizado de nível de proteção ARAIM lunar. As duas reutilizações são essenciais e explícitas. A <b>geometria DOP</b> é o núcleo <b>VALIDATED</b> (face ao gnss_lib_py) <c1/> — <c2/> é um fino filtro de máscara de elevação mais esse núcleo, e um teste verifica a identidade (<c3/> é igual a um <c4/> direto nas mesmas posições visíveis). A <b>integridade</b> reutiliza o mecanismo ARAIM lunar do LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliza o nível de proteção existente do polo sul para um ponto arbitrário da superfície, e um teste verifica que <b>se reduz ao caso do polo sul</b> (no polo sul, com a mesma geometria/orçamento, devolve exatamente o resultado existente de <c8/> a < { "1e-9" }).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Os parâmetros da constelação são uma <b>aproximação ilustrativa das descrições públicas da ESA</b> para esta classe de sistema (≈ { "4" } satélites em órbitas lunares elípticas congeladas que favorecem a cobertura do polo sul — apolúnio sobre o hemisfério sul; { "4" } é a predefinição da biblioteca, e o <c1/> incluído define { "8" } porque o nível de proteção precisa de pelo menos { "6" } à vista). <b>Não</b> são as efemérides reais do Moonlight/LCNS e não implicam <b>nenhuma</b> afiliação, aval, herança, certificação ou TRL. A composição (cobertura / disponibilidade / integridade) é <b>MODELLED</b>: um conjunto de retransmissores kepleriano circular/elíptico (não uma efeméride LCNS / NRHO (órbita de halo quase retilínea) { "9" }:{ "2" } corrigida diferencialmente), uma Lua de rotação média (sem libração física / polo em precessão) e parâmetros de integridade publicados do LunaNet LNIS. Demonstra o <em>método</em> de volume de serviço, não um número de disponibilidade operacional. Determinístico (geometria pura; sem aleatoriedade). O cenário <c2/> comunica a percentagem de cobertura, os envelopes de contagem de visíveis e de PDOP, o envelope HPL/VPL sobre o volume e a disponibilidade do nível de proteção face ao limite de alerta.

# text
# c1: LunarConstellation
# c2: visible_sats
# c3: service_dop
# c4: coverage
# c5: lunar_protection_level
# c6: LunarServiceScenario
# c7: crate::orbit::dop
# c8: crate::lunar::lunar_araim
# c9: lunar_service::tests
# c10: service_dop
# c11: lunar_protection_level
# c12: lunar::lunar_araim
# c13: run_toml
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Geometria DOP validada por reutilização</b> do núcleo <c7/> validado com o gnss_lib_py; a integridade reutiliza o ARAIM lunar publicado do LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Testes (<c9/>): <c10/> é uma identidade sobre o núcleo validado; <c11/> no polo sul é igual ao PL existente de <c12/> a < { "1e-9" } (reduz-se ao caso do polo sul); a cobertura não decresce com a dimensão da constelação; a visibilidade respeita a máscara de elevação; o cenário é determinístico e despacha através de <c13/>. <b>Âmbito honesto:</b> a constelação é <b>ilustrativa, de fonte pública, NÃO afiliada à ESA</b> — não são as efemérides reais do Moonlight/LCNS; a composição de cobertura/disponibilidade/integridade é <b>MODELLED</b> (retransmissores keplerianos circulares/elípticos, Lua de rotação média, parâmetros LNIS publicados), <b>NÃO</b> um número operacional de disponibilidade do Moonlight. Não se alega nenhum TRL, herança de voo nem aval de agência.

# text
# c1: src/lunar_dpnt.rs
seg-4ff4929f71df = PNT diferencial lunar — cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS (<c1/>)

# text
# c1: i
# c2: e_i
# c3: c_i
# c4: −e_i · û_ref,i + c_i
# c5: −e_i · û_user,i + c_i
# c6: −e_i · (û_user,i − û_ref,i)
# c7: c_i
# c8: [x, y, z, clock]
# c9: crate::orbit::invert4
# c10: crate::sbas::sbas_protection_level
seg-8f94c4bf3fe6 = Um análogo lunar de DGNSS (navegação por satélite diferencial) / SBAS: uma <b>estação de referência da classe NovaMoon</b> numa localização selenográfica <em>conhecida</em> calcula correções diferenciais por satélite a partir de uma constelação <b>ilustrativa, de fonte pública, da classe Moonlight / LCNS</b>, e um utilizador móvel afastado dela por uma linha de base aplica-as, de modo que os erros de efemérides de difusão de <b>modo comum</b> se cancelem. Cada satélite <c1/> tem um vetor de erro orbital 3-D comum injetado <c2/> e um erro de relógio comum <c3/>. O resíduo de pseudodistância da estação de referência é a correção <c4/>; o erro bruto do utilizador é <c5/>; o erro corrigido do utilizador é a sua diferença <c6/>. O <b>termo de relógio <c7/> cancela-se exatamente</b> (é idêntico nas duas observações), e o <b>termo orbital reduz-se à projeção na diferença dos dois vetores unitários da linha de visada</b>, que → { "0" } quando a linha de base → { "0" } (o piso de descorrelação espacial) e cresce ≈ linearmente com a linha de base. Os erros de distância corrigidos por satélite são mapeados através da geometria do utilizador por uma pequena resolução instantânea de mínimos quadrados ponderados com poucas dependências (estado <c8/> através de <c9/>; um desvio constante de distância é absorvido pela incógnita do relógio em vez de corromper a solução) para dar o erro de <b>posição</b> do utilizador. O <b>nível de proteção do utilizador reutiliza o mecanismo de nível de proteção SBAS DO-229E</b> (<c10/>, fatores K de Aproximação de Precisão) com o σ residual diferencial como orçamento de erro a 1 σ de cada satélite.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = O NovaMoon é referido <b>apenas como classe de sistema</b> (uma descrição pública de uma estação de referência lunar); a constelação reutiliza o <c1/> ilustrativo de fonte pública. Estes são parâmetros ilustrativos para exercitar o <em>método</em> diferencial, <b>não</b> uma efeméride real, e não implicam <b>nenhuma</b> afiliação, aval, herança, certificação ou TRL. O cenário <c2/> comunica o erro de posição do utilizador com e sem correções, o fator de redução, a curva de erro em função da linha de base e o nível de proteção. Na configuração predefinida, o erro corrigido do utilizador a uma linha de base de { "50" } km é ≈ { "0.008" } m contra ≈ { "24" } m sem correção (uma redução de ~{ "3000" }×), e ≈ { "0" } com linha de base nula.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = A <b>referência independente</b> é a consistência interna: o cancelamento de modo comum é uma <b>identidade algébrica exata</b> (com <c1/>, erro corrigido < { "1e-6" } m com linha de base nula; o termo de relógio cancela-se até à precisão da máquina com qualquer linha de base), o resíduo <b>cresce monotonicamente com a linha de base</b>, e o nível de proteção é o <b>mesmo algoritmo DO-229E</b> face ao qual a pilha SBAS está fixada. O resíduo de descorrelação espacial é um modelo geométrico de <b>primeira ordem</b>, <b>não</b> um modelo de descorrelação ajustado a partir de seguimento lunar real.

# text
# c1: differential_corrections
# c2: corrected_user_range_errors
# c3: user_position_error_m
# c4: lunar_dgnss_protection_level
# c5: LunarDpntScenario
# c6: InternalConsistency
# c7: crate::sbas
# c8: lunar_dpnt::tests
# c9: sbas::sbas_protection_level
# c10: None
# c11: run_toml
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referência independente: <c6/></b> — a identidade de cancelamento diferencial de erros mais a reutilização do mecanismo de nível de proteção SBAS DO-229E (<c7/>). Testes (<c8/>): com linha de base nula, o erro corrigido do utilizador e cada erro de distância corrigido por satélite são ~{ "0" } (< { "1e-6" } m) e ≪ o erro sem correção; o termo de relógio cancela-se exatamente com qualquer linha de base (caso de erro orbital nulo); o erro corrigido cresce monotonicamente com a linha de base, mantendo-se ≪ o não corrigido em linhas de base modestas; o diferencial supera o autónomo por uma margem clara (> { "2" }×); o nível de proteção é igual a uma chamada direta a <c9/> e escala com o σ residual; uma geometria subdeterminada devolve <c10/>; o cenário é determinístico (com semente) e despacha através de <c11/>. <b>Âmbito honesto:</b> <b>MODELLED</b> — o cancelamento de modo comum é uma identidade exata, mas o resíduo de descorrelação espacial é um modelo geométrico de <b>primeira ordem</b>, <b>NÃO</b> um modelo de descorrelação ajustado a partir de seguimento lunar real, e isto <b>NÃO</b> está validado com dados reais. O NovaMoon é referido <b>apenas como classe de sistema</b> (ilustrativo, de fonte pública, <b>não afiliado à ESA</b>). Não se alega nenhum TRL, herança de voo nem aval de agência.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Exportação de interoperabilidade lunar — CCSDS OEM + KIF alinhados com LunaNet/IOAG, com aderência à norma na ida e volta (<c1/>)

# text
# c1: crate::oem::OemFile::to_oem_string
# c2: crate::oem::parse_oem
# c3: crate::interchange::Envelope
# c4: export_lunar_oem
# c5: REF_FRAME
# c6: MOON_ME
# c7: MOON_PA
# c8: TIME_SYSTEM
# c9: LTC
# c10: TCL
# c11: UTC
# c12: CENTER_NAME
# c13: MOON
# c14: crate::lunar_service::LunarSat::position_mci
# c15: export_lunar_time_metadata
# c16: crate::lunar_time::lunar_rate_breakdown
# c17: export_kif_lunar
seg-39b875078d27 = O referencial lunar, a escala de tempo lunar e as efemérides lunares são exportados em <b>formas de intercâmbio alinhadas com o LunaNet/IOAG (IOAG: Interagency Operations Advisory Group), baseadas no CCSDS</b>. Esta fase <b>não</b> inventa um formato de transmissão: <b>reutiliza</b> o emissor e o analisador de CCSDS OEM (Orbit Ephemeris Message) { "2.0" } já existentes no crate (<c1/> / <c2/>) e o envelope do Kshana Interchange Format (<c3/>), reetiquetados para o contexto lunar. <c4/> define o <c5/> do OEM como o <b>referencial de corpo lunar WGCCRE da IAU { "2015" }</b> (<c6/> Terra média ou <c7/> eixos principais), <c8/> como a <b>escala de tempo lunar</b> (<c9/> / <c10/> / <c11/>) e <c12/> como <c13/>, sobre uma efeméride de exemplo <b>ilustrativa, de fonte pública, da classe LCNS</b> (posições de <c14/>, velocidade por diferença finita central). <c15/> emite um descritor de tempo lunar alinhado com o LunaNet/IOAG (identificador da escala, taxa secular em µs/dia de <c16/>, a banda publicada de { "56" }–{ "59" } µs/dia, superfície de referência) que faz a ida e volta através de serde_json. <c17/> envolve o OEM + descritor + etiqueta do referencial no envelope KIF existente com a etiqueta de honestidade MODELLED.

# text
# c1: oem.rs
# c2: crate::oem::parse_oem
# c3: oem_conformance
# c4: REF_FRAME
# c5: MOON_*
# c6: TIME_SYSTEM
# c7: META_START … META_STOP
# c8: TIME_SYSTEM
# c9: parse_lunar_time_metadata
# c10: Envelope::parse
seg-bbfce5323abb = A <b>referência independente</b> é a ida e volta / aderência dos campos à norma. Como <c1/> fornece <em>ambos</em> os sentidos, o OEM faz a ida e volta através de <c2/> (de volta a um segmento igual, com o referencial/tempo lunares e o número de estados preservados) <b>e</b> é verificado de forma independente por <c3/>, que confirma que todas as palavras-chave de cabeçalho exigidas pelo CCSDS/LunaNet estão presentes, que <c4/> contém um símbolo <c5/> lunar e que <c6/> não está vazio, que o enquadramento <c7/> se mantém e que as linhas de dados de posição+velocidade estão bem formadas — devolvendo um resultado estruturado mais a lista de campos presentes/em falta, de modo que uma exportação defeituosa (por exemplo, um <c8/> omitido) seja detetada e identificada. Os metadados de tempo fazem a ida e volta através de <c9/>, e o envelope KIF faz a ida e volta através de <c10/> para artefactos iguais que contêm a etiqueta MODELLED.

# text
# c1: export_lunar_oem
# c2: export_lunar_time_metadata
# c3: parse_lunar_time_metadata
# c4: export_kif_lunar
# c5: oem_conformance
# c6: LunarInteropScenario
# c7: InternalConsistency
# c8: crate::oem::parse_oem
# c9: crate::interchange::Envelope::parse
# c10: lunar_interop::tests
# c11: REF_FRAME
# c12: MOON_ME
# c13: MOON_PA
# c14: TIME_SYSTEM
# c15: LTC
# c16: TCL
# c17: CENTER_NAME = MOON
# c18: TIME_SYSTEM
# c19: oem_conformance
# c20: run_toml
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Referência independente: <c7/></b> — ida e volta determinística (CCSDS OEM através de <c8/>; KIF através de <c9/>; metadados de tempo através de serde_json) mais aderência dos nomes dos campos à norma face à semântica de campos publicada do CCSDS OEM + LunaNet/IOAG. Testes (<c10/>): o OEM exportado contém os símbolos <c11/> lunar (<c12/>/<c13/>) e <c14/> (<c15/>/<c16/>), <c17/>, o objeto e linhas de dados bem formadas; os metadados de tempo lunar fazem a ida e volta (taxa/banda/referência) e rejeitam lixo; o envelope KIF serializa e desserializa para um valor igual com a etiqueta de honestidade MODELLED presente; um OEM deliberadamente defeituoso (sem <c18/>) falha em <c19/> e é comunicado como em falta; o cenário despacha através de <c20/>. <b>Âmbito honesto:</b> os <b>nomes/unidades</b> dos campos estão alinhados com normas <b>públicas</b> (CCSDS 502.0-B OEM, referenciais lunares WGCCRE da IAU { "2015" }, a LunaNet Interoperability Specification / arquitetura lunar do IOAG); a exportação é <b>MODELLED</b> — a ida e volta determinística + a aderência dos nomes dos campos à norma são a referência independente, isto <b>NÃO</b> é um teste certificado de aderência à norma de interoperabilidade, a efeméride é <b>ilustrativa, de fonte pública, não afiliada à ESA</b>, e não se alega nenhum TRL, herança de voo nem aval de agência.

# text
seg-69a214b7236d = Previsões pré-registadas

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Uma previsão pré-registada é um resultado MODELLED congelado antes de existirem dados para a pontuar, com o protocolo de pontuação fixado ao mesmo tempo. Não é uma validação e não acrescenta nenhuma linha ao registo. Cada uma reside em <c1/>, com as suas entradas congeladas, o seu resultado e os respetivos hashes SHA-256, e <c2/> falha se algum byte congelado se alterar; a uma alteração de pressuposto responde-se com uma nova previsão datada ao lado da antiga, nunca editando-a.

# text
seg-e65d79893e2c = Previsão

# text
seg-f9e2d4b52b79 = Congelada

# text
seg-dd68891f75e2 = Pontuada face a

# text
seg-d5a09f26a028 = Cobertura de uma estação de referência lunar

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = exatidão, disponibilidade, cobertura e níveis de proteção publicados de uma estação diferencial lunar polar sul, por qualquer entidade

# text
seg-4e7d9449a880 = ainda não pontuada (sem resultados publicados)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Registo de representatividade da demonstração e de lacunas até ao voo (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = Um resultado de simulação só é útil como evidência se declarar, de forma explícita, àquilo a que está ancorado, o que pressupõe e o que ainda o separa de um sistema de voo. O registo de representatividade torna isso uma saída de primeira classe, verificada por máquina: um registo <c1/> contém as <c2/>s externas da demonstração, os seus pressupostos modelados, as suas <c3/>s até ao voo (cada uma com a fase/atividade que a fecharia) e a banda de TRL para a qual é representativo. É o complemento, por resultado, da matriz <c4/> ao nível das capacidades.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = A <b>referência independente</b> é um conjunto de invariantes em forma fechada, impostas por <c1/>: um registo <c2/> tem de listar pelo menos uma âncora <c3/> (uma simulação não pode ser validada face a si própria); um registo <c4/> tem de listar pelo menos uma lacuna até ao voo e não pode alegar uma banda de TRL representativa acima de { "4" } (a maturação para além disso exige evidências de hardware/voo, que são uma lacuna, e não uma saída de simulação); a banda de TRL tem de estar bem formada; e um registo <c5/> não pode afirmar nada. Estas invariantes operacionalizam a disciplina de "representatividade justificada + lacunas restantes até ao voo claramente identificadas".

# text
seg-6b29111096ca = Registo de representatividade e de lacunas até ao voo

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: check
# c5: is_valid
# c6: report
# c7: to_json
# c8: InternalConsistency
# c9: verification
# c10: representativeness::tests
# c11: verification
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Referência independente: <c8/></b> — invariantes de honestidade em forma fechada ligadas à fronteira de estado/tipo de referência independente de <c9/>. Testes (<c10/>): um registo validado sem âncora externa falha; uma âncora interna (ReferenceImpl) não satisfaz o estado validado; um registo modelado sem lacuna falha; um registo modelado acima de TRL { "4" } falha; bandas de TRL malformadas são detetadas; o registo serializa para JSON com os campos esperados e produz um relatório legível. <b>Âmbito honesto:</b> o registo verifica a <em>classificação</em> da evidência de um resultado — não prova que as âncoras nomeadas correspondem a testes ativos (estes são curados, exatamente como a matriz <c11/>); a alegação de "verificado por máquina" limita-se às invariantes de estado/âncora/lacuna/TRL.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Evidência unificada de compromisso quântico vs clássico (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Cada área de aplicação de PNT quântico responde à mesma pergunta da mesma forma: fixar um referencial de comparação (cenário + semente + versão do motor), encaminhar um candidato quântico e uma linha de base clássica por um único percurso de código neutro, pontuá-los em figuras de mérito comuns e comunicar — com um intervalo de confiança e uma etiqueta honesta de validado/modelado — onde o quântico ganha e onde não ganha. <c1/> dá a essa resposta uma forma única para que as verticais de temporização, navegação e deteção de anomalias emitam o <b>mesmo</b> objeto reprodutível e honestamente etiquetado. Não volta a implementar nenhum compromisso: os números por figura de mérito vêm dos motores existentes (<c2/>, <c3/> e dos módulos verticais); isto é o contrato mais o invólucro de reprodutibilidade/representatividade, construído sobre o registo de representatividade e as etiquetas de verificação.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = A <b>referência independente</b> são identidades de benefício/vencedor em forma fechada mais um invólucro fiel da saída de compromisso existente. <c1/>: a razão de benefício tem a polaridade correta (orientada de modo que <c2/> signifique sempre que o lado quântico é melhor, tanto para figuras de mérito de holdover em que mais é melhor como para figuras de mérito de erro em que menos é melhor); um objeto de evidência construído a partir de um <c3/> real reproduz as suas razões de benefício; a evidência desonesta é rejeitada (uma representatividade modelada sem lacuna, ou uma figura de mérito <c4/> cujo registo de compromisso não tem âncora externa); o JSON é determinístico e contém os campos de referencial/semente/motor/figura de mérito/representatividade.

# text
seg-ae87cea429ba = Evidência de compromisso quântico vs clássico

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Referência independente: <c5/></b> — identidades de benefício/vencedor em forma fechada + invólucro fiel de <c6/>; honestidade ligada ao registo de representatividade e à fronteira de estado/tipo de referência independente da verificação. Testes (<c7/>) como acima. <b>Âmbito honesto:</b> o arnês normaliza <em>como</em> um compromisso é comunicado e reproduzido; a física subjacente de cada figura de mérito é a que o motor contribuinte fornecer, com a sua própria etiqueta de validado/modelado — <c8/> não promove uma figura de mérito modelada a validada.

# text
# c1: src/quantum_devices.rs
seg-ce13223e04d0 = Biblioteca de modelos de erro de dispositivos quânticos (<c1/>)

# text
# c1: DeviceCard
# c2: holdover::QuantumClockClass
# c3: clock_state::ClockClass
# c4: quantum_trade
# c5: crossover
# c6: timetransfer_adv
# c7: σ_t ≈ jitter/√(R·τ)
# c8: R
# c9: τ
# c10: √(1 + dark/R)
seg-c206fc7d58d6 = Um único local que expõe os dispositivos de PNT quântico que o demonstrador compara — relógios óticos / de iões aprisionados / de iões de mercúrio, relógios de referência clássicos, o interferómetro de átomos frios e ligações de transferência de tempo — cada um como um <c1/> com a sua especificação principal e um registo de representatividade. A maior parte da física dos dispositivos é <b>reutilizada</b> (estabilidades de relógio de <c2/> e <c3/>; o interferómetro de átomos frios de <c4/>/<c5/>; ligações clássicas óticas/RF de <c6/>). O único modelo genuinamente novo é a <b>ligação de transferência de tempo por entrelaçamento / fotão único</b>, cuja precisão de temporização é limitada pelo ruído de disparo: <c7/> na taxa de coincidências detetadas <c8/> e integração <c9/>, degradada por uma penalização de contagens de escuro <c10/> e limitada inferiormente por um sistemático irredutível.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = A <b>referência independente</b> são os coeficientes publicados de relógios/CAI reutilizados mais identidades em forma fechada de ruído de disparo/perdas. <c1/>: a ordenação reutilizada das estabilidades dos relógios é sensata (rede ótica < iões de mercúrio < CSAC em σ_y({ "1" } s)); a precisão do entrelaçamento melhora como <c2/> ({ "4" }× de integração reduz σ a metade) quando limitada pelo ruído de disparo; a taxa de coincidências detetadas cai { "10" }× por cada { "10" } dB de perda da ligação; as contagens de escuro degradam monotonicamente a precisão; o piso sistemático limita a precisão inferiormente; cada cartão de dispositivo é um registo de representatividade válido e modelado.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Referência independente: <c5/></b> — coeficientes publicados de relógios/CAI reutilizados + identidades em forma fechada de ruído de disparo/perdas para a ligação de entrelaçamento. Testes (<c6/>) como acima. <b>Âmbito honesto:</b> os parâmetros dos dispositivos de relógio/CAI são reutilizados dos modelos de coeficientes publicados já existentes no motor; o modelo da ligação de entrelaçamento é MODELLED a partir do comportamento publicado de sincronização quântica de relógios, com valores ilustrativos de fonte pública de taxa de pares/eficiência/perdas — <b>não</b> está validado face a uma ligação medida, e o hardware real de fonte/canal/detetor é uma lacuna até ao voo declarada.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Temporização quântica de confiança — cadeia de ponta a ponta, disseminação segura, anomalias + compromisso (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = O cenário <c1/> compõe a cadeia de temporização de que um demonstrador de PNT quântico precisa: um orçamento de tempo do utilizador de ponta a ponta (erro de deriva livre do relógio de referência e precisão de temporização da ligação combinados em quadratura) para uma cadeia <b>quântica</b> (relógio de rede ótica + ligação por entrelaçamento/fotão único) face a uma cadeia <b>clássica</b> (CSAC + ligação RF a duas vias); um <b>nível de proteção de temporização</b> (TPL, reutilizado de <c2/>) que limita o erro de tempo não detetado; uma <b>figura de mérito de segurança contra ataques de atraso/repetição</b> <c3/> a uma taxa de falsos alarmes indicada (reutilizada de <c4/>); uma <b>probabilidade de deteção de anomalias do relógio + latência de deteção de alterações por CUSUM (soma cumulativa)</b>; e a comparação quântico-vs-clássico como <c5/> honesto que contém um registo de representatividade + lacunas até ao voo.

# text
# c1: detection::analytic_pd
# c2: analytic_pmd
# c3: timetransfer_chain::tests
# c4: is_honest()
seg-6fa095264bdc = A <b>referência independente</b> é um orçamento em quadratura em forma fechada sobre núcleos reutilizados e validados separadamente (ADEV vs Stable32/NIST; o limite do TPL; <c1/>/<c2/>). <c3/>: a precisão quântica melhora com o tempo de integração; a cadeia quântica pode ganhar <em>e</em> pode perder na figura de mérito de precisão (honesto — não é uma vitória universal; uma ligação com muitas perdas inverte o resultado); o nível de proteção é finito e positivo; a figura de mérito de segurança está em [{ "0,1" }] e cresce com o atraso do ataque; a probabilidade de deteção de anomalias é monótona na magnitude da falha; e a evidência de compromisso é internamente honesta (<c4/>).

# text
seg-42a7d1170cc3 = Temporização quântica de confiança (cadeia + disseminação segura + anomalias + compromisso)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referência independente: <c5/></b> — orçamento em quadratura em forma fechada sobre núcleos validados reutilizados (ADEV/Stable32-NIST, limite do TPL, Pd/Pmd analíticos de deteção); honestidade ligada ao registo de representatividade. Testes (<c6/>) como acima. <b>Âmbito honesto:</b> os parâmetros do relógio/ligação são ilustrativos, de fonte pública; a ligação por entrelaçamento é o modelo MODELLED limitado pelo ruído de disparo de <c7/>; isto modela a <em>classe</em> de sistema de temporização de confiança — <b>não</b> está validado face a uma ligação de ponta a ponta medida, e o hardware real de relógio/ligação/canal espacial é uma lacuna até ao voo declarada; não se alega nenhum TRL, herança de voo nem certificação.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = Navegação quântica sem GNSS (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = O cenário <c1/> compara a navegação por estima durante uma falha de GNSS com um orçamento inercial <b>quântico</b> (um acelerómetro interferométrico de átomos frios, reutilizado de <c2/>/<c3/>, cujo piso de ruído branco CAI está validado a ~{ "2" } ordens de grandeza de Freier et al. { "2016" }) face a um INS <b>clássico</b> de grau de navegação. Comunica o crescimento do erro de posição durante a deriva livre, o tempo de holdover até um limiar de posição e o compromisso quântico-vs-clássico como <c4/> honesto. A observabilidade é declarada com honestidade: sem posição externa durante a falha, o viés do acelerómetro é inobservável, pelo que o erro de posição cresce sem limite (≈ ½·viés·t² mais um termo de passeio aleatório de velocidade); um sensor quântico de menor viés <em>atenua</em> esse crescimento, mas não elimina a diferença — só uma posição externa o faz.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = A <b>referência independente</b> são os orçamentos inerciais reutilizados (<c1/>/<c2/>, ambos a implementar o trait <c3/>) mais identidades de deriva em forma fechada. <c4/>: o orçamento quântico supera o clássico numa falha longa (menor erro, holdover mais longo); o erro cresce com a duração da falha em ambos (a lacuna de observabilidade); a vantagem depende da duração da falha, não é um fator de ganho constante (a curva quântica é dominada pelo ruído em deriva livre curta e pelo viés em deriva livre longa); a evidência de compromisso é internamente honesta.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referência independente: <c5/></b> — orçamentos inerciais reutilizados (CAI validado por reutilização a ~{ "2" } ordens vs Freier { "2016" }; deriva clássica em forma fechada); honestidade ligada ao registo de representatividade. Testes (<c6/>) como acima. <b>Âmbito honesto:</b> uma comparação estática de orçamentos de navegação por estima, não um filtro dinâmico sobre trajetórias reais; declara-se que o viés é inobservável sem posição externa; os parâmetros dos dispositivos são ilustrativos, de fonte pública; modela a <em>classe</em> de navegação quântica sem GNSS — o hardware real de IMU de átomos frios, uma plataforma dinâmica e o ambiente de voo são lacunas até ao voo declaradas; não se alega nenhum TRL/voo/certificação.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Deteção de falhas / anomalias para sistemas PNT quânticos (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = O cenário <c1/> define um catálogo etiquetado de falhas de PNT quântico (salto de frequência do relógio, deriva, perda de bloqueio; degrau de viés do sensor, perda de dados), pontua uma estatística de deteção em janelas nominais vs com falhas e comunica a discriminação do detetor como uma AUC de ROC e uma falha mínima detetável a uma taxa de falsos alarmes fixa. O ângulo quântico-vs-clássico: uma referência de relógio quântico mais estável reduz o ruído σ do monitor, pelo que deteta falhas menores — emitido como <c2/> honesto com um registo de representatividade.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = A <b>referência independente</b> é uma AUC em forma fechada para a estatística de deteção gaussiana (nominal <c1/>, falha <c2/> ⇒ <c3/>) verificada por comparação com o <c4/> validado externamente (validado face ao scikit-learn) e com os limiares analíticos de <c5/>. <c6/>: a AUC analítica coincide com valores conhecidos ({ "0.5" } com μ={ "0" }, →{ "1" } para μ/σ grande, monótona); o IC bootstrap empírico da AUC enquadra a forma fechada; o monitor quântico tem AUC superior e uma falha mínima detetável menor; a vantagem desaparece para falhas enormes (ambos detetam na perfeição — não é uma margem universal); o catálogo tem cinco classes etiquetadas; o compromisso é internamente honesto.

# text
seg-9dda4ab0647a = Deteção de falhas/anomalias para PNT quântico

# text
# c1: FaultKind
# c2: QuantumAnomalyScenario
# c3: Report
# c4: analytic_auc
# c5: min_detectable_fault
# c6: kind="quantum-anomaly-detect"
# c7: InternalConsistency
# c8: eval_stats
# c9: detection
# c10: quantum_faults::tests
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Referência independente: <c7/></b> — AUC gaussiana em forma fechada verificada por comparação com a AUC bootstrap de <c8/> validada externamente (vs scikit-learn) e com os limiares analíticos de <c9/>. Testes (<c10/>) como acima. <b>Âmbito honesto:</b> a estatística de deteção é um modelo gaussiano, não telemetria real; o catálogo de falhas é sintético etiquetado; os níveis de ruído do monitor quântico/clássico são ilustrativos, de fonte pública; modela a <em>classe</em> de deteção de anomalias de PNT quântico — telemetria real de hardware com etiquetas de verdade é uma lacuna até ao voo declarada; não se alega nenhum TRL/voo/certificação.

# text
seg-24ad75143bed = Aderência às normas — formatos de intercâmbio, balanço de ligação e integridade (verificações com referência independente externa)

# text
seg-9d31773e0ecd = Estas normas são validadas recuperando os <b>exemplos trabalhados textuais / valores de referência publicados nas próprias normas</b> (ou numa implementação de referência independente), e não através da ida e volta do próprio Kshana. Recuperar o exemplo de anexo de uma norma é a verificação de aderência à norma mais forte disponível para um analisador de formato de intercâmbio.

# text
seg-7ec3d508c64f = Referência independente externa

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (Mensagens de Dados Orbitais 502.0-B)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/>: <c2/> recupera as épocas exatas e os vetores de estado X/Y/Z/Ẋ/Ẏ/Ż do exemplo OEM em KVN do <b>CCSDS 502.0-B-3, Anexo G §G6, Figura G-11</b> ("OEM Example with No Acceleration, No Covariance", p. G-10) — ambos os segmentos de efemérides, incluindo os valores de origem com zeros à esquerda (<c3/>). O dado de teste <c4/> é reproduzido caráter a caráter a partir do Livro Azul oficial (os marcadores editoriais "< intervening data records omitted here >", que não são registos OEM válidos, não são incluídos).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (Mensagem de Dados de Seguimento 503.0-B)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/>: <c2/> recupera todos os { "41" } registos RANGE (primeiro { "3198.03679519614" } km, último { "3270.46440460551" } km) e os metadados do exemplo TDM em KVN do <b>CCSDS 503.0-B-2, Anexo E, Figura E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", p. E-9). O dado de teste <c3/> é textual do Livro Azul. (Esta é a referência independente do Livro Azul publicado, a par da ida e volta de <c4/> escrito à mão já existente em <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/>: o codificador reproduz os vetores de teste do cabeçalho primário ao nível do byte da <b>biblioteca <c2/></b> independente (us-irs/spacepackets-py, <c3/>) — por exemplo <c4/> e o <c5/> de todos os máximos — mais o caso canónico de telemetria (TM) com todos os bits a um, cada um com ida e volta através da descodificação. Larguras/ordem dos campos de bits segundo o <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (balanço de ligação, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/>: a cadeia de FSPL (perda de percurso em espaço livre) e C/N₀ reproduz a tabela de controlo de projeto de telemetria de espaço profundo publicada em <b>J. H. Yuen (ed.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Tabela 1-1</b> — a ligação descendente em banda X ({ "8420.43" } MHz) do Galileo a { "6.37" } UA: perda em espaço livre <b>{ "290.54" } dB</b> (<{ "0.05" } dB) e <b>Pr/N₀ = { "54.6" } dB-Hz</b> recebido (<{ "0.2" } dB). Os centros de banda situam-se dentro das atribuições de ligação descendente de espaço profundo DSN/CCSDS-401 (DSN 810-005 Módulo { "201" }). Os <em>parâmetros de missão predefinidos</em> permanecem representativos (não são um transponder calibrado); o que aqui é fixado é a <em>equação</em> da ligação.

# text
seg-c2cee7d5c7b1 = Normas GNSS — estado da referência independente externa e lacunas honestas que subsistem:

# text
seg-d8f653b3c955 = Estado e ressalva honesta

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Núcleo, geometria e nível de proteção ARAIM validados externamente.</b> O <em>núcleo</em> de deteção — o limiar de deteção de falhas χ², a não centralidade da deteção falhada do χ² não central e os multiplicadores K da lei normal — reproduz o <b>SciPy</b> (<c1/>, { "171" } casos, ≤ { "1e-6" } rel), e a geometria envolvente reproduz o <b>gnss_lib_py</b> (DOP). O <em>valor</em> do nível de proteção (PL) ARAIM está agora também fixado: face ao "exemplo numérico LPV-200 (LPV: desempenho do localizador com orientação vertical)" do ADD (Algorithm Description Document) de Referência ARAIM do WG-C (WG: Working Group) v3.1, <c2/> / <c3/> dão VPL { "18.2926" } m vs { "18.3" } m, HPL { "13.4063" } m vs { "13.45" } m e σ_v,acc { "1.3694" } m vs { "1.3694" } m, dentro da própria <c4/> = { "0.05" } m da referência (o tipo <c5/>). Âmbito: modos de falha até um satélite ou uma constelação (<c6/>); subconjuntos de falhas com vários eventos e a exclusão não estão implementados, e o RAIM clássico continua a não ter <b>nenhum vetor de teste canónico publicado de entrada→HPL</b>. Ver <a1><c7/></a1>.

# text
# c1: sbas_protection_level
# c2: zsiki/rtklib_ws
# c3: waasprotlevels()
# c4: tests/sbas_reference.rs
# c5: core/filter.c
# c6: K_H,PA=6.0
# c7: K_V=5.33
# c8: K_H,NPA≈6.18
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-e6a47dfb7e54 = <b>Algoritmo do nível de proteção agora validado externamente.</b> Dado o (el, az, σ) por satélite, o <c1/> do kshana reproduz o <b>fork RTKLIB de PL SBAS</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — alimentado com o σ <b>próprio</b> dessa ferramenta, calculado a partir de mensagens de difusão <b>EGNOS reais</b> + RINEX BUTE real — a <b>< { "2e-3" } m de HPL</b> em { "6" } épocas (<c4/>); o ESA gLAB { "v6.0.0" } (<c5/>) confirmou a convenção idêntica. Os fatores K (<c6/>, <c7/>, <c8/>) coincidem com o DO-229E Appendix J. <b>O que está validado e o que não está:</b> isto fixa o <em>algoritmo</em> de PL (σ à entrada → HPL/VPL à saída); a <em>modelação</em> do σ a montante a partir de mensagens UDRE/GIVE em bruto está fora do âmbito do kshana — é aí que as ferramentas independentes de <em>pipeline completo</em> ainda divergem em metros com dados reais. O K_V coincidiu com o valor arredondado de { "5.33" } da referência independente (o <c9/> exato do kshana → VPL ~{ "0.06" } % menor; a vertical é validada sem fator K como <c10/>).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Modelo de difusão validado externamente.</b> O modelo de Klobuchar L1 reproduz o <b><c1/> do RTKLIB</b> (<c2/>, < { "1e-4" } m) — <em>paridade de implementação</em> com a referência aberta de facto, uma vez que não existe nenhum exemplo trabalhado oficial de <em>verdade medida</em>. O leitor de mapas de TEC IONEX já existe (<c3/>, com testes unitários); a lacuna que subsiste é uma verificação cruzada do mesmo face a um produto GIM real, e não o modelo de difusão. Ver as linhas de Klobuchar em <a1>Alegações vs. realidade</a1>.

# text
seg-fa3058dffb2a = Código de espalhamento GPS L1 C/A (IS-GPS-200)

# text
seg-53ac231770fb = Geração de código validada externamente.

# text
# c1: src/sdr.rs
# c2: ca_first_ten_chips_match_is_gps_200_octal
# c3: navsignal
seg-04db7c613bd5 = <c1/> (<c2/>): o gerador do código C/A com LFSR (registo de deslocamento com realimentação linear) G1/G2 reproduz <b>exatamente as atribuições de fase de código publicadas na Tabela 3-Ia do IS-GPS-200</b> — os primeiros dez chips em octal para os PRN (ruído pseudoaleatório) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }). Isto fixa a <b>sequência de chips do código de espalhamento</b> face à especificação de interface do GPS; as peças envolventes de modulação, separação espetral e seguimento de código por DLL (malha de bloqueio de atraso) (<c3/>) permanecem MODELLED.

# text
seg-e5f1b960777a = Temporização para redes, espetro, o sistema solar, constelações, campanhas e LEO-PNT

# text
# c1: VERIFICATION-MATRIX.md
seg-c5bf3b23d688 = As capacidades acrescentadas na linha { "0.28" } são classificadas linha a linha na <a1><c1/></a1> gerada; esta secção resume quais delas têm uma referência independente externa. Uma linha só é VALIDATED com uma referência independente externa; tudo o resto é MODELLED.

# text
seg-d791a48b3895 = Capacidade (tipo de cenário)

# text
seg-d4779be2efd8 = Referência independente externa, ou porque continua modelado

# text
# c1: telecom-timing
seg-0d7bb0fc1c5e = MTIE (erro máximo de intervalo de tempo) e TDEV (desvio de tempo) de telecomunicações numa série de holdover (<c1/>)

# text
# c1: tests/telecom_timing_reference.rs
# c2: TELECOM-TIMING.md
seg-18894b55b6c1 = <c1/>: { "17" } fatores de média de MTIE e { "12" } de TDEV numa série de holdover de relógio à escala de chip de { "2" } 048 amostras incluída no repositório, face ao allantools { "2024.06" }, a < { "1e-12" } / < { "1e-9" } relativo. Os veredictos PASS/FAIL da máscara ITU-T (International Telecommunication Union Telecommunication Standardization Sector) e as predefinições de osciladores das folhas de especificações permanecem MODELLED. Ver <a1><c2/></a1>.

# text
# c1: slot-timing
seg-ff9cb967ae08 = Previsão de holdover a partir de um registo de relógio medido (<c1/>)

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
seg-7821227795d8 = <c1/>: ajuste sobre o primeiro terço do registo real de césio 5071A, previsão do instante de violação de um sigma em seis limiares, medição no conjunto reservado dos restantes dois terços; limiar de um fator de { "1.5" } em qualquer sentido, razões observadas de { "0.84" } a { "1.03" }. O orçamento de guarda do intervalo e a cadência de posição construídos sobre ele permanecem MODELLED.

# text
# c1: spectrum
seg-2667e3ddf829 = Densidades espetrais de potência em banda L em forma fechada e separação espetral (<c1/>)

# text
# c1: navsignal
seg-1a0c6ef49f98 = Formas fechadas de <c1/> face a valores publicados (linha da matriz "Closed-form L-band signal power spectral densities…"). O diagrama em cascata com J/S (razão interferente-sinal) por banda e C/N0 (densidade portadora-ruído) efetiva, e a entrada/saída SigMF (Signal Metadata Format), permanecem MODELLED.

# text
# c1: solar-system
seg-46278e9c03c1 = Posições planetárias a partir dos elementos de Standish do JPL (Jet Propulsion Laboratory) e tempo de luz entre corpos (<c1/>)

# text
# c1: tests/solar_system_standish_preregistered.rs
# c2: tests/solar_system_standish_earth_icrf_preregistered.rs
# c3: tests/solar_system_light_time_solver_preregistered.rs
# c4: tests/solar_system_horizons_reference.rs
# c5: body-pnt
seg-43cfeb9f2403 = { "0.30" }, pré-registado face ao JPL Horizons (DE441): <c1/> e <c2/>, RMS por planeta e componente no máximo igual ao valor da Tabela { "8.10.1" } do Explanatory Supplement (pior { "0.778" }), incluindo a separação da Terra e a rotação ICRF; <c3/>, o solucionador de tempo de luz sobre posições DE441 a menos de { "1e-6" } s do tempo de luz do Horizons (pior { "6.7e-9" } s). A comparação anterior com o dobro do valor nominal (<c4/>), cujo limiar foi fixado após a primeira comparação, é mantida como regressão sem efeito de bloqueio. Úrano/Neptuno da Tabela { "1" }, Plutão, as luas, as constantes dos corpos e <c5/> permanecem MODELLED.

# text
# c1: constellation-design
seg-b96d8ea13c87 = Geometria Walker e as posições publicadas de GPS, Galileo e GLONASS (GLObal NAvigation Satellite System); diluição de precisão global do GPS (<c1/>)

# text
# c1: constellation::tests
seg-85c293b8d235 = <c1/>: Walker 24/3/1 reproduz a tabela de definição do serviço aberto do Galileo a { "1e-9" }°, a fórmula de posições do documento de controlo de interface do GLONASS, os cruzamentos equatoriais do GPS; a mediana de HDOP da linha de base do GPS de { "0.940" } face ao valor de { "0.94" } da norma de desempenho do Serviço de Posicionamento Padrão. Os mapas de cobertura de multiconstelação arbitrária em torno de qualquer corpo permanecem MODELLED.

# text
# c1: campaign
seg-f0187be4b97f = Campanhas: missões encadeadas, varrimentos, conjuntos de Monte Carlo, execuções com condições partilhadas (<c1/>)

# text
# c1: tests/campaign_composition_reference.rs
seg-b5c45fc12e5f = <c1/> ({ "11" } testes): uma campanha de uma só fase reproduz a execução autónoma byte a byte, um varrimento de um só nó lê o mesmo número, um conjunto com semente é estável byte a byte. Identidades de composição, não uma referência independente externa.

# text
seg-bc25d20125e7 = Física da ligação LEO (órbita terrestre baixa): coeficientes de chuva ITU-R (ITU Radiocommunication Sector) P.838, atenuação por chuva e cintilação P.618, perda de penetração em edifícios P.2109, ionosfera de primeira ordem, Doppler máximo

# text
# c1: tests/leo_link_reference.rs
# c2: tests/leo_doppler_reference.rs
seg-b1f3bd37d169 = <c1/>, <c2/>: as próprias tabelas das Recomendações ITU-R e os exemplos de validação do Study Group { "3" } (incluídos no repositório com a sua fonte e data de obtenção), a razão de atraso de grupo do IS-GPS-200 para a ionosfera e a tabela publicada de Doppler máximo de Leclere, Marathe e Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

# text
# c1: leo-navmsg
seg-492917f11386 = Mensagem de navegação LEO: o algoritmo de utilizador de efemérides de difusão do ICD (documento de controlo de interface) do Galileo, CRC-24Q (verificação de redundância cíclica de 24 bits), pesos SISRE (erro de distância do sinal no espaço) médios globais (<c1/>)

# text
# c1: tests/leo_navmsg_reference.rs
seg-514a7da01582 = <c1/>: o algoritmo de utilizador do Galileo reproduz o RTKLIB (uma biblioteca de código aberto de posicionamento cinemático em tempo real) a { "1" } mm em quatro efemérides de difusão reais do Galileo; o CRC-24Q dá o valor de verificação de catálogo 0xCDE703 e os bytes de verificação da trama de exemplo RTCM (Radio Technical Commission for Maritime Services) { "1005" }; os pesos SISRE reproduzem a tabela publicada de MEO/GEO. O ajustador, a atualização a meio da passagem, a codificação binária, o texto em estilo RINEX-4/CSV (valores separados por vírgulas) e os modelos de efemérides selecionáveis permanecem MODELLED.

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
# c4: leo-ppp
# c5: ntn-positioning
seg-94bbcd43e03a = Projeto de sinal LEO, passagem e balanço de ligação, Doppler e posicionamento conjunto GNSS+LEO, convergência de PPP (posicionamento preciso de ponto), posicionamento 5G NTN (rede não terrestre), transferência de tempo LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/leo_signal_reference.rs
# c2: tests/leo_fusion_scenarios.rs
seg-4c37a8cfac87 = <c1/>, <c2/>: formas fechadas, consistência do filtro (por exemplo, o NEES médio das execuções do filtro PPP dentro da sua banda de { "95" }%) e comparações de tendências publicadas; sem dados de campo.

# text
# c1: leo-pnt-chain
seg-91cf4e399f0a = Um sistema LEO-PNT de ponta a ponta (<c1/>)

# text
# c1: tests/leo_pnt_chain.rs
seg-fb947da2e8b4 = <c1/>: cada valor transmitido é igual à própria saída da etapa a montante, e alterar uma entrada a montante desloca todas as figuras a jusante que dela dependem.

# text
seg-7e230aa73770 = Resiliência e verticais LEO (spoofing por Doppler e por consistência entre bandas, sondagem da ionosfera)

# text
# c1: tests/leo_resilience_verticals.rs
# c2: RESILIENCE-CROSSWALK.md
seg-ab2542cfc295 = <c1/> ({ "10" } testes). Os cenários de resiliência e verticais estão listados em <a1><c2/></a1>.

# text
# c1: tests/interop_formats.rs
# c2: INTEROP.md
# c3: tests/animation.rs
# c4: tests/advanced_report.rs
# c5: tests/advanced_report_cli.rs
# c6: result.json
seg-2d3ead293658 = As saídas que são representações, e não evidências, têm testes mas não têm linha na matriz: as exportações de intercâmbio (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit), SigMF (Signal Metadata Format)), cada uma lida de volta por um validador escrito a partir da especificação do formato (<c1/>, { "13" } testes; ver <a1><c2/></a1>); as animações (<c3/>: reexecuções idênticas byte a byte, contagens exatas de fotogramas, SVG (Scalable Vector Graphics) bem formado, nenhum endereço externo no leitor HTML (HyperText Markup Language)); e o relatório de execução (<c4/>, <c5/>: todos os cenários incluídos geram relatório sem secção vazia nem valor de substituição, as etiquetas coincidem com a matriz, e o comando registado reproduz <c6/> e o relatório byte a byte).

# text
seg-903e4e51dda1 = Envelope de operação

# text
# c1: tests/scenario_coverage.rs
seg-e226ad523a3d = Cada pacote é exercitado ao longo do seu envelope de entrada declarado por <c1/>, que verifica que todas as saídas numéricas são finitas (sem NaN/Inf (NaN: não é um número)) e limitadas. A tabela lista o intervalo de entrada testado por pacote, o comportamento de saída esperado e o teste que o cobre.

# text
seg-8bd4f586f3c7 = Entrada varrida

# text
seg-3ebc1201a545 = Intervalo testado

# text
seg-a1198518d667 = Saída esperada

# text
seg-7bf563f5420a = Teste de cobertura

# text
# c1: threshold_ns
seg-4906c027a805 = <c1/> (especificação de temporização)

# text
seg-d91e18ce3773 = { "1" } – { "500" } ns

# text
seg-10cf765fdd75 = figuras de mérito de holdover/temporização/segurança finitas

# text
seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (átomos frios → MEMS (sistemas microeletromecânicos) rudimentar)

# text
seg-456c32a126a2 = RMS/p95 de posição finitos e limitados

# text
# c1: mask_deg
seg-dae96fd3a01b = <c1/> (máscara de elevação)

# text
seg-a54c3c8933c6 = DOP/disponibilidade finitos; limitados

# text
seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

# text
seg-b6d0d587046e = P_md / segurança finitos, limitados

# text
seg-fda0b32d7784 = { "10" } – { "1000" } m

# text
seg-132fdea2270f = holdover de temporização/posição finito

# text
seg-c9099375b99f = órbita (real)

# text
# c1: gps-ops
seg-952b94eda0ff = TLEs reais <c1/> do Celestrak

# text
seg-60009932477c = instantâneo de 30 satélites, somas de verificação estritas

# text
seg-deb16d50741e = só carrega com somas de verificação válidas; geometria limitada

# text
seg-c46d726e35b3 = relógio (flicker)

# text
# c1: flicker_floor
seg-15939085bf3a = <c1/> ligado/desligado

# text
seg-504a95f55b88 = { "0" } vs { "1e-12" }

# text
seg-e1cce0c2028e = ativar o piso 1/f <b>agrava</b> a deriva livre de p95 da temporização

# text
seg-bdd4e56bdef9 = fusão (realismo)

# text
# c1: accel.bias
seg-09af9dd78fe3 = <c1/> { "0" } vs { "5.88e-7" } m/s²

# text
seg-0a6723be642c = zero vs não nulo realista

# text
seg-a9eb04be2b9f = o filtro continua a convergir, a menos de { "3" }× o erro com viés zero

# text
seg-2a839953aa6a = As linhas de flicker-FM e de viés de fusão fecham duas lacunas de realismo específicas: os termos de ruído estão <b>desligados por predefinição, mas afetam demonstravelmente a saída quando ativados</b>, e o filtro de fusão conjunto <b>não depende de os vieses serem anulados</b> — converge também com um viés residual realista de grau de átomos frios.

# text
seg-4f0e9f9d4cdf = As execuções quânticas e clássicas usam agora sementes de RNG (gerador de números aleatórios) independentes (semente clássica = semente + 0x9e3779b97f4a7c15), pelo que as suas realizações de ruído são não correlacionadas — corrigido após revisão.

# text
# c1: holdover_s
seg-3b6b785f401a = <c1/> tem em conta os segmentos: as cronologias de falha são divididas em segmentos contíguos na reaquisição do GNSS e o valor comunicado é a deriva livre do pior caso (a mais curta) entre eles. Continua limitado pela resolução da grelha temporal (um limite inferior).

# text
seg-4a830113b13d = A ressincronização de transferência de tempo por ISL modela a incerteza residual da ligação como oscilação nova de média nula a cada passo de medição, mais reancoragem no intervalo configurado.

# text
seg-30c4d89aa433 = Alegações vs. realidade — referência rápida

# text
seg-27a22de7b8c0 = Uma lista de verificação de um revisor hostil. Para cada termo que possa ser lido como mais do que é: o que o Kshana faz hoje e onde se situa, no roteiro, a versão real.

# text
seg-759eb0cfafe4 = Termo que poderá ver

# text
seg-6a2d3691d642 = O que realmente é hoje

# text
seg-bbd0145bfb95 = O que <b>não</b> é (ainda)

# text
seg-a6fdb038b003 = "simulador PNT híbrido quântico/clássico"

# text
seg-4421f8bd0967 = um simulador estocástico clássico conduzido por coeficientes de Allan/ruído publicados de sensores quânticos

# text
# c1: QUANTUM-MODELS.md
seg-3885661aafff = física quântica de princípios fundamentais (fase de Mach–Zehnder, ruído de projeção, sistemáticos) — ver <a1><c1/></a1>

# text
seg-1d28debd0302 = "fusão de Kalman conjunta" / pacote de fusão

# text
# c1: fusion
seg-d13beba21ba7 = o pacote <c1/> executável observa o relógio e a posição <b>separadamente</b> (uma posição de tempo direta e uma posição direta), para o que o estimador ótimo é genuinamente diagonal por blocos — dois filtros de dois estados com uma figura de mérito combinada

# text
# c1: fusion::coupled::CoupledPntFilter
# c2: [pos,vel,phase,freq]
seg-25c2fe6fa6d3 = um filtro <em>acoplado</em> para o caso da <b>pseudodistância</b> <b>existe</b> agora como <c1/> (<c2/> empilhado de 4 estados, covariância de blocos cruzados não nula, validado por NEES) mas <b>ainda não está ligado ao pacote executável</b>, e o pacote é <b>de 1 grau de liberdade (1-DOF)</b> — a extensão 3-D de 8 estados é trabalho futuro

# text
# c1: spoof
seg-5cce1ca5b86f = Figura de mérito de segurança (tipo de cenário <c1/>)

# text
# c1: 1 − P_md
# c2: P_fa
# c3: P_md
seg-d55c30f63023 = <c1/> de um <b>detetor estocástico de spoofing de tempo</b>: um teste χ²₁ bilateral / de Neyman–Pearson sobre uma estatística de monitor assistida por relógio, limiar definido a partir de um <c2/> alvo, <c3/> avaliado <b>à magnitude da especificação</b> tanto em forma fechada como por Monte Carlo (que concordam a alguns ×1/√N)

# text
# c1: INTEGRITY.md
seg-dbf2039a4a8e = um detetor RAIM/ARAIM multissatélite — ver <a1><c1/></a1>; a estatística do monitor é um modelo gaussiano com o σ derivado da PSD do relógio, e não uma correlação ao nível do sinal

# text
seg-32bcb801e49c = "deteção de spoofing assistida por relógio"

# text
seg-58e4d22075e9 = um monitor de discrepância de tempo de <b>relógio único</b> (estatística gaussiana, σ da PSD do relógio), NÃO um RAIM multi-SV (SV: veículo espacial, isto é, um satélite)

# text
seg-f3f6f95bc559 = RAIM multi-SV no domínio da distância com níveis de proteção

# text
seg-a5faedaab13e = P_md do detetor de spoofing (forma fechada vs Monte Carlo)

# text
# c1: Φ
# c2: P_md
# c3: mc_runs
# c4: src/spoof.rs
# c5: src/detection.rs
seg-0362489c341a = o <c2/> analítico baseado em <c1/> e a estimativa empírica de <c3/> ensaios coincidem a menos do erro de amostragem (≈ 1/√N); validado nos testes de <c4/> / <c5/> a um desvio sob esforço (μ/σ = { "2" })

# text
seg-8fa5c9468ff5 = uma ROC de detetor medida face a dados de spoofing registados

# text
# c1: gnss-sim
seg-8f895aa1c657 = modelo de pseudodistância de <c1/>

# text
# c1: ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath
# c2: ionmodel()
# c3: klobuchar_agrees_with_rtklib_reference_implementation
seg-a5e5e1e7a0e9 = uma <b>simulação direta</b>: <c1/>. Cada modelo de atmosfera é testado unitariamente face a valores calculados à mão (ZHD (atraso hidrostático zenital) ≈ { "2.3" } m, Niell = { "1" } no zénite, obliquidade de Klobuchar), e o modelo de difusão completo de Klobuchar é <b>verificado por comparação com a implementação de referência <c2/> do RTKLIB</b> a menos de um milímetro (<c3/>, { "6.1278" } m para o caso de coeficientes predefinidos do RTKLIB — não existe nenhum vetor de teste de Klobuchar oficial publicado, pelo que isto é paridade de implementação, e não verdade medida); uma <b>execução sem ruído reproduz a geometria + correções a menos de um milímetro</b> (resíduo RAIM ≈ { "0" })

# text
seg-adc8a5d89cbd = uma <b>solução</b> de posição a partir de sinais reais (PPP/RTK (PPP: posicionamento preciso de ponto)), combinação sem ionosfera em dupla frequência ou resolução de ambiguidades da fase da portadora — não modelado

# text
# c1: jamming
seg-a56533528c6e = modelo de jamming (tipo de cenário <c1/>)

# text
# c1: Q
seg-0a4a28fcd53a = uma cadeia de <b>balanço de ligação</b>: J/S a partir da perda de percurso em espaço livre + ganho de antena por direção → C/N₀ efetivo através da equação anti-jam (ganho de desespalhamento × separação espetral <c1/>) → perda de bloqueio a um limiar (Kaplan & Hegarty §{ "9.4" })

# text
# c1: [acquisition]
# c2: [front_end]
# c3: [crpa]
# c4: [terrain]
# c5: Q
seg-b53e210487fb = multipercurso, dinâmica do AGC (controlo automático de ganho) no tempo, a própria pesquisa de aquisição (a histerese opcional <c1/> é um par de limiares); a perda de quantização opcional <c2/> é a de uma entrada gaussiana, não válida para um interferente CW; o agrupamento opcional <c3/> é de banda estreita e ideal (sem acoplamento nem desadaptação), e a sombra opcional <c4/> é um único gume de faca num único mosaico SRTM; <c5/> é uma constante representativa por tipo, não derivada da PSD medida do interferente

# text
seg-523d66d56f97 = Figura de mérito de integridade (pacotes de relógio/holdover)

# text
seg-d0702ee52d37 = <b>autoconsistência</b> do filtro (fração das amostras da falha dentro do seu próprio limite k·σ)

# text
# c1: integrity
seg-b4b68065e521 = HPL/VPL, risco de integridade / P_HMI, limites de alerta, DO-229E/316/ED-259A — estes são comunicados em separado pelo tipo de cenário <c1/> (RAIM / ARAIM) e pelas funções SBAS, nunca incorporados nesta figura de mérito

# text
# c1: inertial
seg-d5b1f858f0e3 = figura de mérito do <b>pacote</b> de cenário <c1/> legado

# text
seg-e9fe365d7318 = um orçamento de erro de acelerómetro/giroscópio de <b>eixo único (1-DOF)</b> (VRW/ARW, instabilidade do viés) com reposição à verdade

# text
# c1: gnss-ins
seg-604e8d96c2c2 = o pacote <em>legado</em> é de 1-DOF; o <b>percurso de 3 eixos é fornecido no pacote <c1/></b> (linha seguinte)

# text
# c1: gnss-ins
# c2: src/inertial/
# c3: src/fusion/pack.rs
seg-e2a4a1c47f2c = <b>Biblioteca</b> strapdown de 3 eixos + <b>pacote</b> <c1/> (<c2/>, <c3/>)

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
seg-01e5672a37a4 = um navegador verificado de quaterniões/NED (NED: norte-este-baixo) com um modelo determinístico de erro de IMU — <b>fator de escala, desalinhamento, sensibilidade à gravidade, quantização, rampa de taxa</b> modelados (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — agora <b>conduzido pelo pacote de cenário <c1/></b> e <b>configurável por sensor a partir de TOML (Tom's Obvious Minimal Language, o formato dos cenários)</b> (<c2/>)

# text
seg-acecd6b81859 = <b>não modelado:</b> erro de retificação por vibração, deriva por gradiente de temperatura. O erro da deriva livre fundida é limitado inferiormente pelo erro de atitude na transferência (inclinação/viés do acelerómetro pouco separáveis), pelo que não se alega calibração por viés

# text
# c1: hybrid
seg-6b04fc376c0d = "Integração PNT híbrida" (pacote <c1/>)

# text
seg-cd3125081b5c = navegação por estima em malha aberta delimitada por reposições GNSS à verdade

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-578c93c67ae7 = uma mistura de Kalman GNSS–INS acoplada (fraca/forte) — que é o pacote <c1/> separado (EKF) e o tipo de cenário <c2/>

# text
seg-57f603da0331 = "Desempenho de posicionamento" (pacotes de relógio)

# text
# c1: timing_rms_ns
seg-278aafe7fadf = RMS de <b>temporização</b> da fase do relógio em ns (<c1/>)

# text
seg-a6af364cbcdc = uma exatidão no domínio da posição com RMS/CEP/SEP/ponderada por DOP (SEP: erro esférico provável)

# text
# c1: pos_rms_m
seg-b68c5a4363a5 = figura de mérito de posição inercial (<c1/>)

# text
# c1: runs = N
seg-850e030bb5e3 = um RMS/p95 de posição de <b>eixo único</b> em metros, de uma só semente, a menos que <c1/> peça um conjunto (então média, dispersão e um intervalo de confiança bootstrap de { "95" }% por métrica)

# text
seg-be77929afa2c = uma distribuição de CEP / 2DRMS (o dobro do RMS da distância) de conjunto (roteiro: CEP de Monte Carlo)

# text
seg-75f239679dc2 = "validado a ~{ "2" }%"

# text
seg-2d593a99a2b1 = uma concordância observada <em>típica</em>; o <b>limiar imposto é um erro relativo de { "20" }–{ "25" }%</b>

# text
seg-34cfd0e08235 = um limite de exatidão de { "2" }% garantido

# text
seg-d3402cc1ebd5 = "reprodutível / idêntico bit a bit"

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-46ea210bcdad = reexecução idêntica bit a bit no <b>mesmo SO (sistema operativo) + cadeia de ferramentas fixada</b>; entre Linux, macOS e Windows, a CI verifica um SHA-256 incluído no repositório da impressão digital de entrada e da forma de cada resultado (<c1/>) e os valores numéricos a { "1e-6" } (<c2/>)

# text
seg-38c6528122a8 = um resultado completo idêntico byte a byte entre sistemas operativos (diferenças de libm no último dígito)

# text
# c1: orbit-sgp4-gps.toml
seg-b0e21aea4ccd = Cenário SGP4 de GPS (<c1/>)

# text
# c1: gps-ops
seg-1131aa869f1d = um instantâneo genuíno <c1/> do Celestrak (2021-07-28, { "30" } satélites, somas de verificação estritas), com cada satélite propagado a partir da sua própria época de TLE

# text
# c1: scripts/fetch_tles.sh
# c2: REAL_TLE_GUIDE.md
seg-21c2f1b5d7e2 = uma constelação atual — atualize o instantâneo com <c1/> (ver <a1><c2/></a1>); os números de catálogo do NORAD (North American Aerospace Defense Command) são os reais

# text
seg-6948bd06c7e5 = Verificações cruzadas de artigos de PNT lunar (evidência de regressão, não linhas da matriz)

# text
# c1: tests/validate_p*.rs
seg-9ee0faf0b359 = O conjunto lunar/cislunar (as capacidades "Lunar & cislunar" e "Lunar PNT suite" do README) tem as suas alegações de artigos publicados verificadas por comparação independente em <c1/>, cada uma face a uma referência independente de uma implementação <em>diferente</em>:

# text
# c1: scipy.special.j1
seg-b4edbf832fe6 = <b>pegada orbital de transmissão/captura</b> vs <c1/> (Bessel J1 de Cephes);

# text
# c1: (HᵀH)⁻¹
seg-c856d319a46e = <b>DOP da geometria de faróis à superfície</b> vs uma resolução <c1/> independente em NumPy;

# text
# c1: finals2000A
seg-33ee672d98d7 = <b>crescimento do erro de previsão por persistência de UT1/EOP</b> vs uma nova leitura em NumPy das mesmas linhas textuais <c1/> do IERS;

# text
seg-9b6e59789117 = <b>família de órbitas retrógradas distantes planares</b> vs a Three-Body Periodic Orbit Database da NASA/JPL;

# text
seg-c77384abd1cc = <b>orçamento de precisão de medição de distância por RF</b> vs uma referência de princípios fundamentais.

# text
# c1: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c2: src/verification.rs
# c3: VERIFICATION-MATRIX.md
# c4: gen_validation_artifacts
# c5: verification_matrix()
# c6: tests/verification_artifacts_doc_sync.rs
seg-a451dbe09e10 = Os dados de teste e os scripts de geração de referências independentes encontram-se em <c1/>. Estes reforçam a evidência por detrás de capacidades que permanecem <b>MODELLED</b> na matriz verificada por máquina (<c2/>); são verificações de regressão, <b>não</b> novas linhas VALIDATED da matriz, pelo que não alteram por si a contagem da matriz verificada por máquina. Essa contagem não é aqui repetida, porque uma cópia escrita à mão dela desatualiza-se: a divisão em vigor é o cabeçalho gerado de <a1><c3/></a1>, que <c4/> escreve a partir de <c5/> e <c6/> fixa.

# text
seg-a353a63661de = <s1>Anterior</s1>Exportações e importações de interoperabilidade

# text
seg-fdae3b73ab67 = <s1>Seguinte</s1>Matriz de verificação

# text
seg-59c12422e6e7 = Marés no geopotencial (src/tides.rs)

# text
seg-10f0b4616abe = Manobras e projeto de trajetórias (src/maneuver.rs)

# text
seg-56cdbd59ce5d = Determinação de órbita (OD) (src/orbit_determination.rs, src/batch_ls.rs)

# text
seg-3a2c69fcbb86 = Validação do modelo de forças por ajuste de efemérides (src/precise_od.rs)

# text
seg-05a25c6ef750 = Órbitas precisas reais de agências (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

# text
seg-279f4619bc2d = Navegação por mapa gravítico / alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

# text
seg-7b512df70323 = Modelo de erro de INS / IMU — validação referenciada a folhas de especificações (src/inertial/)

# text
seg-b385e665cfff = PNT de espaço profundo e de Marte — fundação D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

# text
seg-5887e7e1a218 = Observáveis radiométricos de espaço profundo e Mensagem de Dados de Seguimento CCSDS — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

# text
seg-a9cf84a14301 = OD de dinâmica reduzida de espaço profundo — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

# text
seg-dc406cb825db = Cenário PNT de espaço profundo e fusão a uma via + duas vias — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

# text
seg-7784f9436dd2 = Tempo coordenado lunar — taxa relativista do relógio Terra–Lua (src/lunar_time.rs)

# text
seg-8a34cb900611 = VLBI geodésico lunar — atraso em campo próximo para uma linha de base terrestre que observa um farol lunar (src/lunar_vlbi.rs)

# text
seg-d47906a347b3 = OD lunar conjunta multitécnica + relógio — recuperação simulada em circuito fechado (src/lunar_combination.rs)

# text
seg-17b9f0ae9dee = Realização do referencial lunar — ajuste de datum de Helmert de 7 parâmetros (src/lunar_frame_realise.rs)

# text
seg-3cfffa3eeb79 = Volume de serviço de navegação lunar — DOP / cobertura / disponibilidade + PL ARAIM lunar generalizado (src/lunar_service.rs)

# text
seg-d80bf3320a15 = PNT diferencial lunar — cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS (src/lunar_dpnt.rs)

# text
seg-23c3d8a79acf = Exportação de interoperabilidade lunar — CCSDS OEM + KIF alinhados com LunaNet/IOAG, com aderência à norma na ida e volta (src/lunar_interop.rs)

# text
seg-a697f4f424b8 = Registo de representatividade da demonstração e de lacunas até ao voo (src/representativeness.rs)

# text
seg-4c924153299d = Evidência unificada de compromisso quântico vs clássico (src/qtrade.rs)

# text
seg-bd1a5835c5db = Biblioteca de modelos de erro de dispositivos quânticos (src/quantum_devices.rs)

# text
seg-6b1bb731f966 = Temporização quântica de confiança — cadeia de ponta a ponta, disseminação segura, anomalias + compromisso (src/timetransfer_chain.rs)

# text
seg-3332c6c1ae86 = Navegação quântica sem GNSS (src/quantum_nav_od.rs)

# text
seg-9b46a5add4ab = Deteção de falhas / anomalias para sistemas PNT quânticos (src/quantum_faults.rs)
