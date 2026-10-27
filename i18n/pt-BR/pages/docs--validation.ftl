# docs--validation: translations (pt-BR)

# text
seg-70860389903a = Relógio

# text
seg-583dc9ff6178 = Biblioteca

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-619f89bf160c = Realização do referencial de referência lunar

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
seg-ad856ad710eb = Status

# text
seg-d12d4565b01d = VLBI geodésico lunar, caminho por kernel

# text
seg-5ed34a5b402e = OD conjunta multitécnica lunar + relógio

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
seg-7634c6f4b32c = Enlace

# text
seg-b966dd26caa6 = Conjunto de dados

# text
seg-4fe4920a3fa1 = Padrão

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Fonte: <c1/>

# text
seg-028f26d1374e = <b>Sobre as tolerâncias.</b> "Validado" abaixo significa que um teste de calibração afirma que a estatística simulada coincide com a relação de referência dentro de um <b>limite imposto (gate)</b>, atualmente de <b>{ "20" }–{ "25" }% de erro relativo</b> (média sobre seeds) para as relações de Allan/orçamento de ruído. A concordância mediana observada costuma ser muito mais estreita (alguns por cento), mas o limite <em>garantido</em> é o gate, não a mediana. Onde um número como "~{ "2" }%" aparece, é uma observação típica, não a tolerância imposta. Veja <a1>Alegações versus realidade</a1>.

# text
seg-94a480ed9ccb = A regra de promoção

# text
# c1: src/verification.rs
seg-a550784412a6 = Uma linha da matriz de verificação verificada por máquina (<c1/>) é VALIDATED somente quando uma referência independente <b>do Kshana</b> concorda com a implementação <b>dentro de uma tolerância declarada antes de a comparação ser executada</b>, em um teste que roda no gate. Esta seção é o único lugar em que a regra é escrita; a matriz, a prosa de cada linha e as notas de versão remetem a ela.

# text
seg-5e14faed9f05 = Os tipos de referência independente aceitos

# text
seg-4297b6a1b385 = O que conta

# text
seg-a42c0c36b37f = Exemplos já na matriz

# text
seg-e39aeb132e03 = Dados reais medidos da grandeza que a linha afirma: uma observação do mundo físico, não uma saída de modelo.

# text
seg-e77977db9de1 = Os dois terços reservados de um registro real de relógio de césio; pontos normais arquivados de telemetria laser lunar; a série UTC(k) da Circular T do BIPM (Bureau Internacional de Pesos e Medidas); a tile de terreno da SRTM (Shuttle Radar Topography Mission).

# text
seg-6325fe1fafaf = Uma biblioteca ou ferramenta de terceiros independente que calcula uma grandeza <b>univocamente definida</b> sobre as mesmas entradas, em que a biblioteca implementa o próprio cálculo do domínio. A concordância entre bibliotecas é uma verificação genuína apenas porque a grandeza tem uma única resposta certa.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, as distribuições estatísticas do SciPy.

# text
seg-056adffae706 = Vetores de referência, tabelas ou exemplos de verificação publicados: números que uma norma, uma agência ou um texto de referência imprime para que as implementações possam ser conferidas com eles.

# text
seg-991fb822e99c = Vetores SOFA/ERFA (Standards of Fundamental Astronomy), os vetores de verificação do SGP4 da AIAA (American Institute of Aeronautics and Astronautics), os exemplos de validação da ITU-R (International Telecommunication Union, Radiocommunication Sector), o exemplo resolvido de ARAIM do Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Duas outras regras decidem os casos limítrofes. Ambas são adotadas para a versão { "0.30" }.

# text
seg-f5c6cf536ba1 = <b>P1, um valor resolvido publicado.</b> Um valor resolvido publicado, calculado a partir da mesma forma fechada que a linha implementa, conta como vetor de referência publicado quando a publicação é independente do Kshana e a comparação fixa uma tolerância declarada. O valor deve estar impresso como número na publicação (um valor lido de um gráfico só conta se a incerteza de leitura estiver dentro da tolerância declarada), e o teste deve fazer o Kshana calculá-lo a partir das entradas da publicação; comparar uma constante com o documento de que foi copiada é uma verificação de transcrição, não P1.

# text
seg-0b043b552e76 = <b>P2, uma biblioteca numérica independente.</b> Uma biblioteca numérica independente, como numpy ou LAPACK (Linear Algebra PACKage), recalculando uma grandeza de álgebra linear univocamente definida sobre entradas declaradas conta como biblioteca independente. A biblioteca deve realizar a decomposição, a inversa, a resolução ou o passo de mínimos quadrados por seu próprio algoritmo, sobre entradas registradas junto com a fixture; a afirmação validada é então a álgebra linear sobre essas entradas, não as magnitudes físicas de um cenário representativo. Um script que reavalia uma forma fechada escalar com aritmética numpy é uma segunda implementação nossa, não P2.

# text
seg-b7911d589f7a = Condições que se aplicam a todo tipo: a referência independente não é escrita, executada nem publicada por este projeto (a série de artigos do próprio repositório, portanto, não é independente dele); a tolerância está no teste e foi fixada antes da primeira comparação; um teste condicionado a dados que é ignorado quando seus dados públicos estão ausentes informa isso quando é ignorado.

# text
seg-7e6057a2cad7 = O que não conta

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>Nossa própria segunda implementação</b>: um segundo caminho de código neste crate (<c1/>), ou um script neste repositório que reavalia a mesma forma fechada.

# text
seg-d6efaf8399f9 = <b>Concordância com nossa própria saída anterior</b>: goldens, pins de regressão, snapshots ou uma tabela dos artigos do próprio projeto.

# text
seg-4d0365b383e5 = <b>Uma transcrição das constantes de uma citação</b>: conferir um coeficiente, predefinição, valor de datasheet ou folha de parâmetros contra o documento do qual foi copiado.

# text
seg-3bf8025077fb = <b>Uma escolha de projeto</b>: uma alocação, ponderação, limiar, limite de alerta ou cenário representativo. Não há verdade externa para uma escolha.

# text
seg-4f0aafd7166e = <b>Uma identidade interna</b>: uma integral numérica contra sua própria forma analítica, uma ida e volta, uma inversão, um teste de propriedade ou de monotonicidade.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Uma execução de integração contra um host real</b> (<c1/>): carregar um plugin em um servidor Signal K real ou no OpenCPN, ou alimentar a saída de um gate real a um consumidor TCP, e verificar que o host aceita a entrada e mostra o estado esperado. Isso mostra que a infraestrutura funciona. O host não é uma referência independente para nenhum valor que a integração carrega, portanto não há nada externo contra o que comparar, e uma linha assim (a linha de integrações marítimas) é MODELLED, não VALIDATED. <c2/> é um tipo próprio de referência independente, permitido somente em linhas MODELLED: <c3/> em <c4/> falha se uma linha VALIDATED o carrega, e <c5/> já exige que toda linha VALIDATED seja <c6/>.

# text
seg-a39a87c56a16 = <b>Plausibilidade em entradas reais</b>: dados reais usados apenas como entrada, com asserções de escala em vez de uma comparação com um valor externo.

# text
seg-db6f5d98b4ef = Uma tolerância escolhida depois de ver a comparação.

# text
seg-f4f18b7549df = Como a regra é imposta

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Toda linha VALIDATED declara, em <c1/> em <c2/>, em qual tipo ela se apoia (Measured, Library, Reference, P1 ou P2), a fonte independente (citada do próprio texto da referência independente da linha) e o único teste que carrega a comparação. Os testes unitários ao lado da tabela falham quando uma linha VALIDATED não é declarada ou é declarada duas vezes, quando uma declaração nomeia uma linha que não é VALIDATED, quando a fonte declarada não é a que o texto da referência independente da linha nomeia ou é o próprio Kshana, quando o teste declarado não é um que a linha cita, ou quando uma linha P2 não nomeia nenhuma biblioteca numérica independente. <c3/> então exige que o teste declarado exista em disco como um <c4/> real que não esteja ignorado. O que a máquina não consegue verificar é se o teste nomeado compara contra a fonte declarada; isso continua sendo uma leitura humana. As contagens por tipo não são digitadas aqui: a tabela é a fonte.

# text
seg-e8ae3e380f40 = Linhas VALIDATED existentes reexaminadas sob a regra

# text
seg-1dd44545a67a = A regra foi aplicada às linhas existentes, além de às futuras promoções.

# text
seg-38db7b6e7053 = <b>Linhas P1 nomeadas pelo estudo de validação { "0.30" }, cada uma apoiada:</b> Orçamento de enlace unidirecional (a tabela de controle de projeto X-band do Galileo da JPL Pub 82-76, remontada a partir de seus itens de linha até { "4.6e-3" } dB de perda no espaço livre); Formas fechadas de banda limitada para qualquer sinal de medição de distância ({ "90.3" } por cento da potência do lóbulo principal e o jitter coerente early-late publicado); Doppler máximo de um satélite de navegação em órbita terrestre baixa (os valores publicados do Xona Pulsar X1 e do Iridium); Doppler máximo que um usuário estático vê de uma órbita LEO ou MEO (Tabela { "1" } do artigo do Pulsar, { "20" } valores); Doppler que um receptor em solo deve tratar de um satélite de navegação LEO (os mesmos valores publicados de uma órbita voada). Cada publicação é independente do Kshana, imprime seus números, e o teste declara sua tolerância.

# text
seg-8e38103d05d6 = <b>Outras linhas que se apoiam em P1, encontradas no reexame, cada uma apoiada:</b> Compromisso de projeto de código de medição de distância (a correlação cruzada Gold de −{ "23.9" } dB publicada); Tempo coordenado lunar (Ashby e Patla { "2024" }, cuja verificação cruzada da velocidade da Lua contra a DE440 é uma verificação de biblioteca); Densidades espectrais de potência de sinal de banda L em forma fechada (valores Q de Kaplan e Hegarty); Atraso ionosférico de primeira ordem por banda (a razão de atraso de grupo da IS-GPS-200); Pesos de erro de alcance do sinal no espaço médios globais (a tabela de Montenbruck, Steigenberger e Hauschild { "2018" }).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>Linhas P2 nomeadas pelo estudo, cada uma apoiada:</b> Informação de Fisher e observabilidade de Cramér–Rao (numpy <c1/>/<c2/>); Identificabilidade do datum lunar; Gauge acoplado de referencial e escala de tempo lunares; Pipeline autônomo de observabilidade de falhas em rede livre (SVD de numpy/SciPy, decomposição em valores singulares). Cada uma recalcula uma grandeza de álgebra linear univocamente definida sobre entradas registradas por um algoritmo diferente do solucionador de autovalores de Jacobi do Kshana.

# text
# c1: expm
seg-e9d01633d002 = <b>Outras linhas que se apoiam em P2, encontradas no reexame, cada uma apoiada:</b> Derivação de prioridades MCDA (análise de decisão multicritério) (o autovetor do AHP, processo analítico hierárquico, pelo SciPy/LAPACK; a tabela de Random Index que ele também reproduz é uma transcrição e não é contada); Variância de deriva do holdover de relógio (<c1/> do SciPy da matriz aumentada de Van Loan); Realização do referencial lunar (uma solução de Umeyama por SVD do numpy); Beamforming de CRPA (antena de padrão de recepção controlado) (resolução complexa do LAPACK); Núcleo de nível de proteção ARAIM lunar (a inversa LU do RTKLIB com quantis do SciPy); Consistência de referencial/dinâmica lunar entre provedores (um ajuste de mínimos quadrados por SVD do numpy de três efemérides publicadas).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>Sinalizadas na primeira passagem, reapoiadas na rodada { "2" } da execução { "0.30" }.</b> Três linhas foram sinalizadas como não apoiadas pela regra escrita. Cada uma agora se apoia em uma comparação pré-registrada antes de sua fixture ser obtida, de modo que nenhuma linha é sinalizada; um teste unitário ao lado de <c1/> fixa a lista (agora vazia).

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Integridade (RAIM/ARAIM/SBAS).</b> Os testes citados costumavam afirmar apenas plausibilidade sobre geometria real do IGS (International GNSS Service). A linha agora se apoia em três referências independentes de biblioteca: a separação de solução de múltiplas hipóteses do ARAIM do Airborne Design Document v4.2 contra o Stanford MAAST para o ARAIM { "2" } ({ "270" } casos reais, pior diferença de VPL { "2.2e-3" } m contra { "0.05" } m); a detecção e exclusão de RAIM de snapshot contra o RTKLIB <c1/> ({ "2016" } de { "2016" } decisões idênticas) com o nível de proteção de inclinação; e os níveis de proteção L1 do SBAS DO-229E contra o Stanford MAAST em transmissões WAAS reais ({ "2868" } pares dentro de { "1.6e-5" } m). A linha diz claramente que as funções de sigma uniforme <c2/> e <c3/> não são aderentes à norma do ADD e que a comparação de SBAS L5 de dupla frequência é uma constatação.

# text
seg-16a4261c77ec = <b>Posições de planetas pelo sistema solar a partir dos elementos keplerianos de Standish do JPL.</b> O limiar post-hoc de duas vezes o erro nominal é substituído por um limiar pré-registrado: RMS no máximo igual ao valor da Tabela { "8.10.1" } do Explanatory Supplement por planeta e componente, contra o JPL Horizons DE441, com a divisão da Terra e a rotação ICRF cobertas.

# text
seg-8d5b51a942e0 = <b>Tempo-luz entre corpos do sistema solar.</b> O solucionador de tempo-luz agora é comparado com os tempos-luz do Horizons dentro de { "1e-6" } s em posições DE441, um limiar pré-registrado que não herda o limiar de posição.

# text
seg-e96900bc322f = <b>Linhas MODELLED que as duas políticas tornam promovíveis</b> (somente pela execução linha a linha { "0.30" }, nunca por este texto): sob P1, o limite de geolocalização de emissor por TDOA/FDOA (diferença de tempo e de frequência de chegada), o acoplamento da taxa de relógio relativística ao referencial, as máscaras de sincronização da ITU-T (Setor de Normalização das Telecomunicações) (somente para valores de máscara que as Recomendações imprimem como números; os pontos de quebra transcritos conferidos contra si mesmos não contam) e o limite de posicionamento 5G por rede não terrestre (somente se um valor resolvido publicado for encontrado); sob P2, a cegueira de integridade em modo comum, o nível de proteção de temporização MHSS (separação de solução de múltiplas hipóteses) escalar e o branqueamento GLS (mínimos quadrados generalizados). As duas linhas de benchmark de integridade de temporização (o classificador de diagrama de integridade de Stanford e o pontuador de cobertura de integridade) são classificação baseada em regras, não álgebra linear, de modo que P2 não as alcança; elas precisam de uma ferramenta independente, e a única encontrada (gLAB) tem licença não comercial.

# text
seg-50a08fe5918b = <b>Coerência com recusas anteriores.</b> A verificação de Vallado da linha da janela de lançamento agora se qualificaria sob P1 se seu teste calcular o exemplo resolvido impresso; o plano { "0.30" } a promove pelo Orekit. A tabela de cruzamento de tempo lunar por classe de relógio permanece MODELLED: a tabela que ela reproduz vem do artigo do próprio projeto, que não é independente.

# text
seg-02423542480f = Termo de ruído

# text
seg-2bd49b92f14b = Paridade dos estimadores de Allan (ADEV/MDEV/TDEV/OHDEV (ADEV: desvio de Allan; MDEV: desvio de Allan modificado; OHDEV: desvio de Hadamard sobreposto))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Duas verificações em fonte primária contra a <b>SP (Special Publication) { "1065" } do NIST (National Institute of Standards and Technology)</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), ambas com tolerância relativa de <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: os estimadores ADEV sobreposto, ADEV modificado, desvio de tempo e Hadamard sobreposto reproduzem os desvios do conjunto canônico de 10 pontos <b>NBS14</b> (<b>SP { "1065" } Tabela 29/30, p. { "107" }</b>) em tau = { "1" }, { "2" } — a concordância é, na verdade, de ~{ "1e-6" } (por exemplo, ADEV sobreposto (OADEV) em τ = { "2" }: { "85.952868" } contra { "85.95287" }). ({ "2" }) <c2/>: os mesmos quatro estimadores reproduzem o <b>conjunto de dados da SP { "1065" } §{ "12.4" } de 1000 pontos</b> (<b>Tabela { "31" }, p. { "108" }</b>) nos fatores de média { "1" } / { "10" } / { "100" }, em que o conjunto é regenerado no código a partir do LCG da SP { "1065" } (Eq. { "73" }) — hermético, sem fixture. Os mesmos dados e os números da Tabela 31 são o alvo de regressão em aewallin/allantools (<c3/>), reproduzidos aqui sem código de terceiros. Isso fixa a <em>matemática dos estimadores</em> contra a referência, distinta das linhas de <em>calibração</em> de ruído abaixo.

# text
seg-79e6f7d1e7f0 = Paridade dos estimadores de Allan em <b>hardware real medido</b>

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/>: os estimadores de Allan sobreposto e de Hadamard sobreposto reproduzem os desvios de referência do <b>Stable32</b> para um <b>padrão primário real de césio 5071A medido contra um maser de hidrogênio</b> ({ "556 990" } amostras de fase em τ₀ = { "1" } s; { "1" } PPS (pulso por segundo) em um contador 53230A, fev { "2014" }; coletado por A. Wallin, distribuído com <c2/>). Verificado em <b>toda a escada decádica de τ ({ "16" } fatores de média, τ = { "1" } s … { "4" }×10⁴ s)</b>: fatores bem amostrados com um limite relativo de <b>{ "1e-3" }</b> (a concordância observada é, na verdade, ≤ { "3e-5" }, por exemplo OADEV({ "1" } s) { "3.317111e-10" } contra Stable32 { "3.3171e-10" }), fatores esparsos de τ longo obrigados a cair dentro da faixa de confiança de { "1" }‑σ impressa pelo Stable32. Isso complementa a paridade sintética do NBS14 acima com uma verificação de relógio medido. O arquivo bruto de fase é dado de terceiros sem licença de redistribuição, por isso é ignorado pelo git; <c3/> o reproduz e o teste imprime um aviso de omissão (a CI (integração contínua) continua verde) quando ele está ausente. Somente os números públicos de referência do Stable32 são registrados (<c4/>); nenhum código de terceiros é usado.

# text
seg-1a7f0e741913 = Paridade dos estimadores de Allan no <b>PHASE.DAT canônico do Stable32</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/>: os estimadores de Allan sobreposto, de Allan modificado e de desvio de tempo reproduzem os desvios de referência do <b>Stable32</b> para <b>PHASE.DAT</b> — a série de 1001 pontos distribuída com o Stable32 que ferramentas independentes (por exemplo <c2/>) usam como alvo padrão de regressão — em toda a <b>escada completa de fatores de média ({ "139" } fatores)</b> com um limite relativo de <b>{ "1e-3" }</b> (observado ≤ { "5e-5" }). Uma segunda série de referência real e independente, ao lado da verificação de césio medido acima. O PHASE.DAT acompanha a ferramenta comercial Stable32, por isso a série bruta é ignorada pelo git; <c3/> a reproduz e o teste é ignorado em verde (a CI continua verde) quando ela está ausente. Somente os números públicos de referência do Stable32 são registrados (<c4/>); nenhum código de terceiros é usado.

# text
seg-9dde9e0c8055 = Estabilidade de relógio óptico em uma <b>curva real medida</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/>: a inversão de parâmetros de ruído do relógio (<c2/>) reproduz o <b>σ_y(τ) publicado do relógio de rede óptica de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), curva incluída em <c3/>): o coeficiente de frequência branca recuperado √q_wf ≈ { "4.33e-16" } coincide com a estabilidade de curto prazo de ≈4.7e-16/√τ do artigo (~{ "10" }% RMS (raiz do valor quadrático médio) sobre a curva) e o ajuste detecta um piso medido não nulo (q_rw > { "0" }). Isso fixa a <b>inversão ADEV medido → parâmetro de ruído contra um relógio óptico real</b>; o benefício de holdover até o limiar construído sobre ela permanece MODELLED.

# text
seg-e1e930dcd0a1 = ROC (curva característica de operação do receptor) AUC (área sob a curva) de detecção de anomalias em <b>telemetria real OPS-SAT da ESA (Agência Espacial Europeia)</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reproduz os rótulos)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/>: no conjunto <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — segmentos reais de housekeeping do OPS-SAT com rótulos de anomalia de verdade-terreno — a AUC ROC de Mann–Whitney do Kshana (<c2/>) reproduz o <b><c3/> do scikit-learn</b> a <b>< { "1e-9" }</b> na partição de teste reservada ({ "529" } segmentos, { "113" } anomalias), para dois escores determinísticos: um detector transparente de uma só característica (contagem de picos do segmento, <b>AUC ≈ { "0.851" }</b>) e um escore de Mahalanobis diagonal de 8 características ajustado nos segmentos normais de treinamento (AUC ≈ { "0.556" }); <c4/> delimita a estimativa pontual com seu limite inferior acima do acaso. Isso valida o <b>cálculo da AUC em dados reais da ESA</b> e a <b>separação rotulada</b> de um detector transparente — <b>não</b> reproduz a melhor métrica publicada do artigo OPSSAT-AD (uma FCNN supervisionada (rede neural totalmente conectada), F1 ≈ { "0.95" }), que precisa do modelo treinado deles. Dados CC-BY incluídos (<c5/>, herméticos); referência independente regenerada por <c6/>.

# text
seg-5f2d41617fb2 = Síntese de funcionais do campo gravitacional (mapa de navegação com auxílio gravitacional / sem GNSS (GNSS: sistema global de navegação por satélite))

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/>: o núcleo de funcional gravitacional em harmônicos esféricos (<c2/> / <c3/>) — o "leitor de mapa" com que um navegador auxiliado por gravidade compara — é validado contra o <b>padrão de gravidade normal GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, adotado pela IAG (IAG: Associação Internacional de Geodesia)). Construir o campo normal GRS80 a partir de seus harmônicos zonais pares publicados J₂…J₈ e sintetizar a gravidade (gravitação + centrífuga) no elipsoide reproduz a gravidade normal de <b>Somigliana</b> em forma fechada, e os valores equatorial/polar publicados γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², a <b>{ "3.5e-12" }</b> relativo em todas as latitudes (limite { "1e-9" }). O mesmo núcleo carrega o modelo terrestre principal <b>real ICGEM (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency), domínio público via ICGEM; o leitor <c4/> também é exercitado no campo lunar GRAIL (Gravity Recovery and Interior Laboratory) em <c5/>) e produz um mapa de perturbação gravitacional fisicamente limitado (RMS ≈ { "26" } mGal, máx. ≈ { "89" } mGal em d/o { "70" }). Valida a <b>correção do código de síntese</b>; a <em>exatidão da solução de navegação</em> auxiliada por gravidade permanece MODELLED (não há trajetória pública de gravímetro em uma plataforma com verdade-terreno).

# text
seg-7dc3ff4c6eea = edf específico do tipo de ruído (intervalos de confiança)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/>: a faixa de confiança χ² em cada ponto de ADEV sobreposto usa os graus de liberdade efetivos específicos do tipo de ruído (formas fechadas da Tabela { "5" } da NIST SP { "1065" } para modulação de fase branca e de flicker, modulação de frequência branca e de flicker e modulação de frequência de passeio aleatório (WPM/FPM/WFM/FFM/RWFM) — o conjunto simples do Stable32), com o tipo de lei de potência do registro identificado a partir da inclinação log-log de seu MDEV. Três verificações independentes: (a) as cinco fórmulas reproduzem valores avaliados à mão em N={ "64" },m={ "4" } a { "1e-12" }; (b) um <b>conjunto Monte-Carlo de FM (modulação de frequência) branca</b> ({ "4 000" } registros) mede o edf qui-quadrado real do estimador = { "2" }·média²/Var(σ²) e coincide com a fórmula dentro de { "20" }% (e supera de forma material a contagem conservadora sem sobreposição); (c) <c2/> reproduz o edf impresso na <b>SP { "1065" } Tabela { "32" } (p. { "109" })</b> = { "146.177" } para o conjunto de 1000 pontos em m={ "10" } (FM branca) a { "5e-3" }, e os limites de confiança de { "95" }% da tabela ({ "8.223942e-2" } / { "1.035201e-1" }) a <{ "0.2" }% (o pequeno resíduo é a aproximação χ² de Wilson-Hilferty contra o χ² exato do NIST). A curva ADEV exportada traz o tipo de ruído identificado, o edf e a faixa de { "95" }% por τ.

# text
seg-7048ac695b99 = FM branca (curto prazo)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/>: o ADEV sobreposto simulado reproduz o sigma_y({ "1" } s) publicado — tipicamente dentro de alguns por cento, <b>limite imposto de { "20" }%</b> (CSAC e a meta da rede óptica) — e a curva de FM branca sigma_y(tau)=sigma_y(1s)/sqrt(tau) em tau = { "1" }, { "10" }, { "100" } s dentro de um <b>limite de { "25" }%</b> (coincide com o datasheet do CSAC (relógio atômico em escala de chip) { "3e-10" } / { "1e-10" } / { "3e-11" }).

# text
seg-11fc7c4b61ff = FM de passeio aleatório (longo prazo)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/>: o ADEV simulado coincide com sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) a ~{ "20" }% (média sobre seeds).

# text
seg-dcfca4041429 = Envelhecimento / deriva linear

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + calibrado e removido

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Determinístico; o estimador de holdover remove o deslocamento e o envelhecimento por meio de um preditor quadrático, de modo que o resíduo é o limite estocástico. Testado em <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Estimador de Kalman + limite de integridade

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/>: um filtro de dois estados (fase, frequência) cujo ruído de processo exato de van Loan coincide com o modelo verdadeiro; a deriva livre reproduz a variância analítica de holdover <c2/> a { "1e-9" }. A atualização da covariância está na <b>forma estabilizada de Joseph</b> <c3/>, que permanece semidefinida positiva (verificada por Cholesky) ao longo de { "500" } passos de predição/atualização a uma razão <c4/> extrema, e concorda com a forma ingênua a { "1e-9" } onde esta é bem condicionada. A camada de execução informa a Integridade como a fração de amostras da interrupção dentro do limite de proteção de 3-sigma (<c5/>).

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
seg-c1304de95180 = <c1/>: uma avaliação de consistência Monte-Carlo (Bar-Shalom §{ "5.4" }). O <b>NIS → { "1" }</b> e o <b>NEES → { "2" }</b> agregados do filtro casado caem dentro de suas faixas χ² de { "95" }% (a faixa do NIS usa a contagem de inovações brancas agregadas; a faixa do NEES usa a contagem de execuções independentes, já que os erros de estimação são correlacionados no tempo). Um teste de <b>varredura de descasamento Q/R</b> verifica que o monitor informa <c2/> somente na sintonia unitária e <c3/> em dessintonias de ×0.1/×0.5/×2/×{ "10" }, com o NIS escalando como ≈1/q_factor, como derivado. Exposto como <c4/> no JSON (JavaScript Object Notation) de resultado do relógio e em um cartão do playground. As faixas χ² usam o quantil de Wilson–Hilferty (<c5/>, conferido contra tabela).

# text
seg-078c4009b24f = Modelo de transferência de tempo bidirecional

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/>: o atraso de modo comum recíproco se cancela exatamente na estimativa <c2/> (derivada à mão, exata) e duas medições unidirecionais têm média <c3/> (média sobre seeds); o atraso diferencial não recíproco é um processo colorido de FM branca + FM de passeio aleatório cujo desvio de Allan segue <c4/> (média sobre seeds, ~{ "20" }%, pelo <c5/> do próprio enlace). Os <em>parâmetros</em> (por enlace <c6/>, <c7/>) são valores TWSTFT/ópticos (TWSTFT: transferência bidirecional de tempo e frequência por satélite) representativos, não ajustados a um terminal específico.

# text
seg-6ab219622143 = Segurança (pontuação de detecção de spoofing)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/>: o piso de 1-sigma do monitor <c2/> e o desvio mínimo detectável de <c3/>-sigma e a pontuação <c4/> resultantes são derivados à mão e testados unitariamente. O modelo (detecção auxiliada por relógio, de inovação / estilo RAIM (RAIM: monitoramento autônomo de integridade pelo receptor)) é sólido; os <em>parâmetros</em> (janela de monitoramento <c5/>, multiplicador de detecção <c6/>, ruído de medição <c7/>) são representativos, não ajustados a um receptor específico.

# text
seg-ca51e4f1e19c = Detecção de ataque de spoofing

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/>: um spoof de tempo falso em rampa é sinalizado quando seu deslocamento excede o limite de detecção do relógio; o tempo de detecção coincide com o <c2/> derivado à mão a um passo de grade, e um relógio cujo limite excede a especificação deixa o spoof alcançar o limiar sem ser detectado. Mesma ressalva de <c3/> da pontuação de Segurança.

# text
seg-3d2f6d2b7722 = FM de flicker (piso)

# text
# c1: modeled
seg-55697d598918 = <c1/> (desativado por padrão)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Sintetizado como uma soma de processos de Ornstein-Uhlenbeck (OU) espaçados logaritmicamente, calibrados para um piso de ADEV plano configurável; <c1/> valida que o piso é plano ao longo do tempo de média e fica no nível configurado (média sobre seeds). Ativado por relógio via <c2/>. Os cenários de referência citados o deixam desativado: o CSAC é dominado por FM branca em toda a faixa de seu datasheet (1-1000 s) e o piso sistemático do relógio óptico (~{ "5e-17" }) é representado por sua figura de exatidão.

# text
seg-e2e3de9a61a4 = Estatísticas do conjunto Monte Carlo

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (agregação)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/>: percentis por posto mais próximo e média sobre <c2/> realizações reprodutíveis; uma execução única colapsa a dispersão, a faixa por passo de tempo é ordenada <c3/>, e as reexecuções são idênticas bit a bit. Isto é agregação estatística sobre a execução única já validada, não um novo modelo físico.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Microchip SA65 / SA.45s datasheet

# text
seg-e3bde4355d78 = optical-sr-lattice (Sr lattice)

# text
seg-87793f684233 = relógio óptico de rede de estrôncio, meta orientada ao espaço, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Status: FM branca e FM de passeio aleatório validadas; envelhecimento modelado e calibrado e removido; FM de flicker modelada e validada (desativada por padrão nos cenários citados).

# text
seg-c5ff448dcb88 = Maturidade: os valores do relógio óptico são a <em>meta orientada ao espaço</em> em hardware de solo -- nenhum relógio óptico de estrôncio voou. Relógios de Sr de laboratório chegam a { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Os valores do CSAC vêm de uma peça comercial em uso.

# text
seg-b59a4b8e6d88 = Relações: Riley, NIST SP { "1065" }, Eq. { "67" } -- FM branca sigma_y^{ "2" }(tau)=h0/({ "2" } tau); FM de passeio aleatório sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, equivalentemente q_rw*tau/3 para um processo de Wiener de frequência de difusão q_rw.

# text
seg-dca7ee671d91 = Pacote { "2" } — navegação por estima inercial (unidade de medição inercial quântica)

# text
seg-98452a081241 = Viés constante/residual -> posição

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = erro de posição = família { "0.5" }<em>b</em>T^{ "2" } (Tutorial de Groves AESS (Aerospace and Electronic Systems Society)); teste discreto derivado à mão em <c1/>.

# text
seg-c60c0b54c485 = Passeio aleatório de velocidade (aceleração branca)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/>: o DP (desvio-padrão) do erro de posição simulado coincide com sigma_x(T)=sqrt(S_a*T^3/3) (Groves eq.54) a ~{ "12" }% observado (média sobre seeds; limite imposto de { "20" }%).

# text
seg-8ac776795d40 = Física do acelerômetro de interferômetro de átomos frios (CAI) (primeiros princípios)

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
seg-4eafc81873ed = <c1/>: um interferômetro de átomos frios Mach-Zehnder de três pulsos. Verificado à mão contra a geometria de livro-texto — Rb-87 <c2/>; <c3/> a { "1" } g, <c4/>; ruído de projeção <c5/> em <c6/>, <c7/>; <c8/> por disparo; as leis de escala <c9/> e <c10/>; decaimento exponencial de contraste. <c11/> <b>deriva</b> a PSD (densidade espectral de potência) de aceleração branca que o <c12/> clássico consome. Escopo honesto: apenas o <b>piso de ruído de projeção quântica</b> (~{ "0.09" } ug/sqrtHz aqui) — muito abaixo de dispositivos reais, limitados por vibração (1-50 ug/sqrtHz); o tensor de vibração, a força de Coriolis e as sistemáticas de deslocamento de luz ainda não são modeladas (veja <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Viés de giroscópio + passeio aleatório angular (ARW) -> inclinação -> acoplamento da gravidade

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Um viés residual de giroscópio e o ARW provocam um erro de atitude; a inclinação acopla a gravidade (<c1/>) ao erro de força específica horizontal. <c2/> valida exatamente o crescimento cúbico de posição por viés puro e o crescimento de atitude por ARW como um processo de Wiener (média sobre seeds). Ativado por sensor via <c3/> e <c4/>; desativado nos cenários citados só com acelerômetro.

# text
seg-e68d093e952a = Instabilidade de viés (piso de flicker 1/f)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/>: um processo de flicker 1/f (a mesma síntese OU validada para o relógio) cujo piso plano de desvio de Allan fica no coeficiente de instabilidade de viés; zero é uma operação nula, um piso não nulo altera a trajetória, ambos reprodutíveis. Ativado por sensor via <c2/>.

# text
seg-b631c1bfce05 = Passeio aleatório de aceleração (passeio aleatório de taxa)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/>: o viés é um processo de Wiener com <c2/>, verificado com média sobre seeds a ~{ "20" }%. Ativado por sensor via <c3/>.

# text
seg-49c4a2532dca = Validação cruzada com o NaveGo (coeficientes de ruído da IMU (unidade de medição inercial))

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/>: uma verificação cruzada externa contra o <b>NaveGo</b> (R. Gonzalez, toolbox INS/GNSS (INS: sistema de navegação inercial) de código aberto, <c2/>). Reproduz a ida e volta sintética do <c3/> do NaveGo em seu <b>perfil de referência publicado do Microstrain 3DM-GX3-35</b>: alimentar nosso estimador de ADEV sobreposto (validado com NBS14/Stable32) com ruído branco de sensor nos níveis de 1-σ do NaveGo recupera os coeficientes de passeio aleatório de velocidade e de ângulo (VRW, ARW) (<c4/>) a <c5/> (real ~{ "0.4" }%), com o ramo de ruído branco na inclinação −1/2. Confirma que nosso pipeline de Allan e as definições de VRW/ARW do NaveGo concordam. O registro <c6/> de { "40" } MB do STIM300 gravado não é ingerido (condicionado a formato binário).

# text
seg-171b215f0526 = Fator de escala, termos cruzados entre eixos mais finos

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> neste pacote de 1-DOF (um grau de liberdade)

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = O pacote legado de eixo único não tem erro de fator de escala nem de acoplamento cruzado. A biblioteca strapdown de três eixos e o pacote <c1/> modelam fator de escala, desalinhamento, sensibilidade a g, quantização e rampa de taxa (<c2/>; veja a tabela de alegações abaixo).

# text
seg-ce2b3237acfe = estabilidade de viés

# text
seg-129dc6af8f10 = raiz da PSD do ruído

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
seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

# text
seg-79fc524162b5 = Enquadramento honesto: a vantagem do átomo frio é a <b>estabilidade de viés de longo prazo</b> (~2600x menor), que domina uma longa interrupção de GNSS por meio de { "0.5" }<em>b</em>T^{ "2" }. O ruído de curto prazo é comparável (quântico ~{ "22" } contra clássico ~{ "20" } ug/sqrtHz) — o sensor quântico vence a maratona, não a corrida de velocidade. Maturidade: os acelerômetros de átomos frios estão em estágio de laboratório/inicial (JRC122785), o quartzo de grau de navegação já é empregado.

# text
seg-e02e93f4f30a = Pacote { "3" } — transferência de tempo (óptica contra radiofrequência (RF), enlace óptico entre satélites)

# text
seg-2b87e5f0ba7e = Jitter de temporização branco -> precisão de sincronização

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/>: o RMS de sincronização simulado reproduz o jitter do enlace sigma_j; a média amostral se comporta como sigma/sqrt(N) a <{ "20" }% (média sobre seeds).

# text
seg-4325ec478bca = Temporização -> medição de distância unidirecional

# text
seg-aa7a1f463683 = distância = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (exato, teste derivado à mão).

# text
seg-7ad8bb95bf35 = Piso de flicker/TDEV, resíduo de reciprocidade bidirecional

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (tipo de cenário <c2/>): ruído de fase flicker (Kasdin–Walter, TDEV plano), uma não reciprocidade diurna e um resíduo de reciprocidade constante na série bidirecional; o pacote <c3/> de jitter branco permanece inalterado.

# text
seg-dae3fa0375fe = jitter de amostra única

# text
seg-4a141a45a8ff = fonte

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = alvo crível em órbita

# text
seg-9dfc1d4334a3 = enlace óptico entre satélites, alvo de sincronização em picossegundos; O-TWTFT de laboratório (TWTFT: transferência bidirecional de tempo e frequência) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = sessão única medida

# text
seg-b9faad47d802 = TWSTFT do BIPM/PTB/NIST (BIPM: Bureau Internacional de Pesos e Medidas; PTB: Physikalisch-Technische Bundesanstalt, o instituto nacional de metrologia da Alemanha)

# text
seg-51e2e5782c96 = Enquadramento honesto: o valor óptico é uma meta de sincronização em órbita em nível de picossegundo (não voada). O piso do laboratório óptico terrestre é ~{ "1" } fs (muito melhor); um enlace de micro-ondas bem projetado (o enlace de micro-ondas (MWL) do ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) pode rivalizar com o óptico, de modo que a linha de base "RF = { "0.5" } ns" é especificamente o TWSTFT comum. A conversão para distância é unidirecional (distância = c<em>dt); bidirecional/ida e volta a divide por dois (distância = c</em>dt/2).

# text
seg-5fa72f18f983 = Pacote { "4" } — fusão híbrida (capstone)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Compõe o Pacote { "1" } (relógio), o Pacote { "2" } (inercial) e o Pacote { "3" } (transferência de tempo) em uma única suíte PNT (posicionamento, navegação e temporização). A suíte deve manter TANTO a temporização (< especificação de temporização) QUANTO a posição (< especificação de posição) dentro dos limites; <c1/> é o tempo até que qualquer uma delas seja violada. A transferência de tempo por enlace óptico entre satélites (ISL) opcional ressincroniza o relógio durante a interrupção (apenas auxílio de tempo — a posição não é ressincronizada, pois a transferência de tempo fornece tempo, não posição).

# text
seg-4f7cd8f86565 = Aspecto

# text
seg-19deb2a3537c = Pontuação combinada de PNT (temporização E posição)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/> teste de <c2/> derivado à mão (pnt_holdover = o primeiro entre temporização/posição a violar).

# text
seg-d0e39bf123d8 = Integridade + Segurança para o pacote híbrido

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/>: um estimador de temporização de Kalman disciplinado à verdade (nominal) e reancorado a cada ressincronização óptica; a Integridade é a contenção no limite de proteção (o limite inclui o piso de jitter do enlace), a Segurança a pontuação de detecção de spoofing. Testado para ambas as suítes, inclusive o caso auxiliado por enlace.

# text
seg-c3be96b7cb41 = Estimador de fusão conjunta

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/>: um único filtro de Kalman conjunto ([fase, freq] ⊕ [pos, vel]) é o navegador, disciplinado pelo GNSS (aprendendo os deslocamentos a partir de covariância inicial não nula) e auxiliado pela transferência de tempo; a covariância conjunta dá uma integridade conjunta que é testada como confiável (≥{ "0.9" }) para ambas as suítes com sensores de ruído consistente. O pacote observa posição e tempo <b>separadamente</b>, caso em que o filtro ótimo é bloco-diagonal; a estimativa de viés constante com estado aumentado e o auxílio cruzado dinâmico são trabalho futuro.

# text
seg-915ec766439f = Filtro acoplado de relógio+posição (covariância entre blocos)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/>: um único filtro de Kalman empilhado <c2/> (atualizações na forma de Joseph) cuja medição de <b>pseudodistância</b> <c3/> acopla os blocos de posição e de relógio. Testes: uma pseudodistância compartilhada torna <c4/> não nulo (filtros desacoplados o mantêm exatamente em { "0" }); duas geometrias distintas resolvem em conjunto deslocamentos injetados de posição e de relógio que uma única distância não consegue separar; uma solução <b>somente de relógio</b> afina a <b>posição</b> pela covariância cruzada (o ganho que o acoplamento oferece e que filtros desacoplados não podem); e um <b>NEES Monte-Carlo é consistente com χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, faixa baseada em execuções). 1-DOF (a dimensionalidade do pacote); ainda não ligado ao pacote executável, e a extensão 3-D de 8 estados é trabalho futuro.

# text
seg-31ecf062b941 = Composição de submodelos validados

# text
seg-9b849cb4fe8d = herda

# text
seg-4e1c8b6791f3 = os termos de relógio/inercial/transferência de tempo são validados em seus próprios pacotes.

# text
# c1: gnss-ins
seg-b672e5499976 = GNSS/INS fracamente acoplado (pacote <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/>: um EKF de estado de erro de 15 estados (δp, δv, ψ, viés de acelerômetro/giroscópio; Groves §{ "14" }) conduz o navegador strapdown de três eixos com realimentação. Testes: um erro de posição injetado se anula com auxílio de verdade perfeita; a solução auxiliada permanece limitada a metros enquanto um INS em funcionamento livre diverge além de { "100" } m; e o RMS de posição fundida ao longo de uma interrupção de { "60" } s supera a navegação por estima sem auxílio pelo limite do teste de conjunto (~{ "4" }× quando medido antes da { "0.27.3" }; a margem é maior após a correção abaixo). O acoplamento do viés de giroscópio é conferido contra o próprio strapdown: um viés residual de giroscópio conhecido deve produzir o erro de atitude que o filtro prevê (<c2/>), e um prior amplo deve aprender um viés de giroscópio de classe controlador de voo mantendo-se limitado; ambos falham com o sinal anterior à 0.27.3. <b>Revisado na { "0.27.3" }:</b> esse acoplamento tinha o sinal errado, de modo que as estimativas de viés de giroscópio empurravam no sentido errado e só um prior estreito mantinha o pacote estável; os valores publicados de interrupção mudaram (CHANGELOG, Fixed). Limite honesto: o viés de acelerômetro e a inclinação em acoplamento fraco são pouco separáveis, de modo que a calibração por viés não é alegada.

# text
seg-1c9a9f76a432 = GNSS/INS fortemente acoplado (pseudodistância)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: a inovação é formada no domínio da distância (Jacobiano de linha de visada sobre δp). Testes: quatro satélites anulam um erro horizontal injetado de { "8" } m/−{ "5" } m a < { "0.1" } m; <b>dois satélites</b> (nenhuma solução de posição, velocidade e tempo (PVT) possível) ainda reduzem o erro horizontal em > { "5" }×; um único satélite no zênite observa apenas a componente ao longo da linha de visada (vertical) e deixa a horizontal intocada; entradas malformadas são rejeitadas. Somente pseudodistância — fase da portadora e um estado explícito de relógio do receptor estão no roteiro.

# text
seg-240b681b6021 = Fidelidade de auxílio cruzado entre sensores (fusão completa por Kalman/grafo de fatores)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> no pacote <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = O pacote híbrido é uma composição em nível de sistema + auxílio de tempo, não um estimador ótimo. Existem filtros em outros lugares: o EKF (filtro de Kalman estendido) fracamente e fortemente acoplado do pacote <c1/> (linhas acima) e o filtro de Kalman unscented (UKF) de 17 estados do tipo de cenário <c2/>. Nenhum suavizador de grafo de fatores é modelado.

# text
seg-189758709fd2 = Resultado: a suíte totalmente quântica mantém o PNT completo ao longo de uma interrupção de { "1.8" } h; a suíte totalmente clássica é <b>limitada pela posição</b> (a IMU de grau de navegação viola primeiro). A transferência de tempo óptica ISL mantém travado até o relógio clássico, isolando o sensor inercial como o elo fraco da suíte clássica — o argumento central a favor de inércia quântica + temporização óptica em conjunto.

# text
seg-a4c5b45ea8a5 = Geometria — disponibilidade de GNSS a partir de órbitas

# text
seg-d347bb63c1fd = Propagação circular de dois corpos

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/>: período <c2/> (mu = { "3.986004418e14" }), a posição retorna após um período, planaridade equatorial/polar — testes derivados à mão.

# text
seg-1260a2fef95f = Propagação excêntrica (kepleriana)

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/>: equação de Kepler <c2/> resolvida por Newton (resíduo < { "1e-12" }); raios de perigeu/apogeu <c3/>; o caso circular coincide com o caminho em forma fechada a { "1e-9" }.

# text
seg-958f03424508 = Deriva secular nodal/apsidal J2

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); o nó regride (progrado) / avança (retrógrado) / é estacionário (polar), e as apsides congelam na inclinação crítica de { "63.4" } graus — testes de sinal/zero derivados à mão. Somente dois corpos + secular, não osculador.

# text
seg-dcba8d368326 = Visibilidade por linha de visada (ocultação pela Terra + máscara de elevação)

# text
seg-2eee9a8f894b = Satélite antipodal ocultado, satélite radialmente para fora a { "90" } graus de elevação, satélite tangencial no horizonte — testes exatos derivados à mão.

# text
seg-f251c75eb367 = Visibilidade -> estado do GNSS -> linha do tempo

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> visíveis = nominal, 1-3 degradado, { "0" } negado; gerador Walker-delta; um teste de integração conduz uma execução de holdover de relógio a partir da linha do tempo derivada.

# text
seg-988d3fedb7f5 = Otimizador de projeto de constelação + geometria de streets-of-coverage

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
seg-2a636487a4e6 = <c1/>: <c2/> varre a grade <c3/> e devolve a célula que melhor satisfaz um <c4/> (mín. de satélites para uma meta de cobertura / cobertura máx. / PDOP do pior caso mín. (PDOP: diluição da precisão de posição)) — um teste afirma que a escolha é igual a uma varredura de força bruta independente do mesmo conjunto, e um exemplo resolvido confirma que um projeto Walker 24/6/1 do GPS (Global Positioning System) cobre pelo menos tão bem quanto um desbastado de 18 satélites. As formas fechadas analíticas de <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) são verificadas à mão contra a geometria de livro-texto (GPS com máscara de { "5" }°: λ ≈ { "71.16" }°, meia-largura da faixa de 4 satélites ≈ { "62.83" }°) e detectam a lacuna de subpopulação (<c9/>). O solucionador completo de Rider de número mínimo de satélites para cobertura <em>global</em> (a contagem de planos sensível à emenda) ainda não está implementado.

# text
seg-a1c1364cc45a = Diluição da precisão (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: diluição geométrica da precisão; HDOP: diluição horizontal da precisão; VDOP: diluição vertical da precisão; TDOP: diluição de tempo da precisão)) -> exatidão de posição

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/>: <c2/> a partir da matriz de projeto de linha de visada. <b>Referência independente externa</b> (<c3/>): os cinco fatores de DOP reproduzem os calculados pelo <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — uma biblioteca GNSS independente e revisada por pares, usada aqui como o ERFA (Essential Routines for Fundamental Astronomy) é para os referenciais) em <b>{ "8" } geometrias</b> que vão de bem condicionadas a quase singulares (DOP na casa das centenas), a <b>{ "1e-6" }</b> relativo; procedência + regeneração em <c4/>. Como verificação adicional em forma fechada, uma geometria de tetraedro regular reproduz os DOPs analíticos (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) a { "1e-9" }. Sigma de posição = PDOP × erro equivalente de alcance do usuário.

# text
seg-504d5aa92cbc = Erro de posição = σ_UERE × DOP para a própria solução de mínimos quadrados do mecanismo

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/>: um Monte Carlo com seed (N = { "20,000" } épocas por geometria, σ = { "1.5" } m, seed ChaCha8 { "36" } + i) de <c3/> com pesos unitários, resolvido a partir da posição verdadeira, nas <b>{ "8" } geometrias de <c4/></b> (aquelas cujo DOP coincide com o do gnss_lib_py), contra σ²·Q, em que Q é o fator de covariância do próprio núcleo <c5/> (<c6/>, a mesma aritmética). <b>Tolerâncias pré-registradas</b> (commit e50c88d2, antes da primeira execução, segundo a nota de projeto de geometria { "0.36" }, seção { "5.2" }), cada uma um número de erros-padrão: variâncias de leste, norte, vertical e relógio dentro de { "5" } %; RMS H/V/P dentro de { "2.5" } %; correlação leste-norte dentro de { "0.035" }; médias dentro de { "5" } erros-padrão; a fração da elipse horizontal de { "95" } % dentro de { "0.95" } ± { "0.0077" }. Primeira execução: todas as { "104" } verificações passam (pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros-padrão, elipse { "0.0039" }). <b>Controles negativos</b> falham como exigido: PDOP dobrado falha em toda geometria; erros crescendo como 1/sin(elevação) contra o Q sem ponderação falham em uma verificação de variância em toda geometria cujo satélite mais baixo está abaixo de { "20" }°. <b>Como ele se combina com a linha acima:</b> aquela linha valida o DOP dessas geometrias contra o gnss_lib_py; esta acrescenta o passo desses fatores até metros pelo solucionador do mecanismo. <b>Uma primeira verificação, separada, é mantida ao lado dela</b> (<c7/>, <c8/>, executada antes do pré-registro e relatada como tal): quatro céus escolhidos à mão (aberto, agrupado, cânion, meio céu; σ { "1" } m) com intervalos de confiança qui-quadrado a { "1e-6" } no total sobre { "20" } verificações; razões de { "0.987" } a { "1.009" }, e seus próprios controles negativos (um erro de DOP de { "10" } %, erros de 1/sin(elevação)) falham como exigido. <b>Por que MODELLED:</b> sem conjunto de dados externo; não mostra que o erro de um receptor real segue o modelo, e σ_UERE é uma entrada.

# text
seg-94bffbd8385b = Disponibilidade multiconstelação

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/>: <c2/> adicionais são mescladas em um único conjunto de satélites para visibilidade/DOP; um teste de contagem combinada confirma a união.

# text
seg-0b905100d91c = Ionosfera de transmissão (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → atraso oblíquo em L1

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/>: <c2/>, o modelo de frequência única transmitido de oito coeficientes. <b>Referência independente externa</b> (<c3/>): o atraso oblíquo em L1 reproduz o <b><c4/> do RTKLIB (uma biblioteca de código aberto de posicionamento cinemático em tempo real)</b> (tomojitakasu/RTKLIB, <c5/> — a referência GNSS aberta de fato, compilada do código-fonte e executada de forma independente) em <b>{ "10" } casos</b> que cobrem elevação, azimute, hora local e dois conjuntos de coeficientes (o padrão do kshana + o do RTKLIB), a <b>< { "1e-4" } m</b>. O leitor de mapas de TEC (TEC: conteúdo total de elétrons) IONEX (IONosphere map EXchange format) para arquivos GIM (mapa global da ionosfera) agora existe (<c6/>, <c7/> com interpolação espacial e temporal bilinear e um mapeamento oblíquo, testado unitariamente no próprio crate); uma verificação cruzada dessa interpolação contra um produto GIM real do CODE (Center for Orbit Determination in Europe) ainda é uma continuação. O próprio modelo transmitido é validado externamente.

# text
seg-39e235557ecc = Núcleo de detecção RAIM/ARAIM (ARAIM: monitoramento autônomo avançado de integridade pelo receptor) (χ² / χ² não central / normal) → limiares e multiplicadores

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
seg-8906f922b9b9 = <c1/>: o limiar de detecção de snapshot / separação de solução / ARAIM (<c2/>), a não centralidade de detecção perdida <c3/> (<c4/>) e os multiplicadores K_fa/K_md/K_V (<c5/>) são todos avaliados a partir de uma função gama incompleta regularizada sem dependências. <b>Referência independente externa</b> (<c6/>): <b>{ "171" } casos</b> reproduzem o <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — uma implementação independente Cephes/Boost, um algoritmo diferente) nas faixas operacionais de P_fa / P_md / redundância, a <b>≤ { "1e-6" } relativo</b>. A geometria que envolve o núcleo (a inclinação/covariância de <c11/>) é o núcleo de DOP validado pelo gnss_lib_py. <b>Escopo:</b> esta linha fixa o <em>núcleo estatístico</em>. O <em>valor</em> do nível de proteção da alocação MHSS (separação de solução de múltiplas hipóteses) do ARAIM é fixado separadamente contra o exemplo resolvido publicado do Subgrupo Técnico ARAIM do WG-C (Working Group C) (<c12/>, VPL (nível de proteção vertical) { "18.2926" } m contra { "18.3" } m, HPL (nível de proteção horizontal) { "13.4063" } m contra { "13.45" } m, dentro da própria tolerância de { "0.05" } m da referência; veja a nota de normas abaixo e <a1><c13/></a1>).

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
seg-abe00b67e4cb = <c1/>: <c2/>, o <c3/> de LS ponderado (LS: mínimos quadrados) → eixo maior da elipse de erro horizontal + σ vertical, escalado pelos fatores K do DO-229E. <b>Referência independente externa</b> (<c4/>): o HPL do kshana reproduz o <b>fork SBAS-PL do RTKLIB</b> (<c5/> <c6/>, a implementação "DO-229D Appendix J" de Siki & Takács { "2017" }), executado por <c7/> em <b>dados reais do EGNOS (European Geostationary Navigation Overlay Service)</b> (mensagens de transmissão do GEO (órbita geoestacionária) PRN120 + RINEX real (Receiver Independent Exchange Format) BUTE/Budapeste, 2017-02-19), em <b>{ "6" } épocas</b> a <b>< { "2e-3" } m</b>. O σ por satélite é o orçamento SBAS completo da própria referência independente (UDRE (erro diferencial de distância do usuário) + ionosfera GIVE (erro vertical ionosférico de grade) + tropo + aerotransportado). O gLAB { "v6.0.0" } da ESA (<c8/>) foi compilado e confirmado como usando a convenção idêntica. <b>Nota sobre K_V:</b> ambas as referências independentes arredondam o K_V do MOPS (padrões mínimos de desempenho operacional) → { "5.33" }; o kshana usa o <c9/> exato (VPL ~{ "0.06" } % menor), de modo que a vertical é validada como o <c10/> sem fator K (= VPL da referência independente / { "5.33" }). O HPL é comparado diretamente (K_H = { "6.0" } em ambos os lados).

# text
seg-fd16d642cafd = Geometria real da constelação a partir de TLEs (linha 2 / kepleriana)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (interpretação)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/>: interpreta os elementos keplerianos médios da linha 2 (semieixo maior a partir do movimento médio); um conjunto de elementos conhecido da ISS (International Space Station) faz a ida e volta para os elementos e o período corretos. Para um bloco somente com a linha 2, a propagação é a de dois corpos do mecanismo (+ J2 opcional) dos elementos <em>médios</em> — adequada para um instantâneo de uma época comum, divergindo do SGP4 (Simplified General Perturbations { "4" }) com o tempo.

# text
seg-26d22e76e28d = Propagação SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (TLEs completos)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/>: SGP4 completo de órbita próxima à Terra + SDP4 de espaço profundo (secular/periódico lunissolar + ressonância geopotencial de { "12" } h / { "24" } h). Validado em <c2/> contra os vetores oficiais AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 ("Revisiting Spacetrack Report #3") — todos os { "666" } estados de referência (órbita próxima à Terra, espaço profundo, ressonante, casos de código de erro) coincidem com um erro de posição de pior caso de ≈ { "4.1" } mm. Um conjunto completo de duas linhas (linha { "1" } + linha { "2" }) é propagado com o SGP4; somente a linha 2 permanece kepleriana; os dois podem ser misturados. O referencial é o TEME (equador verdadeiro, equinócio médio), usado de forma consistente para o usuário e os satélites (sem redução TEME→ECEF (ECEF: centrado e fixo na Terra) — adequado para geometria de disponibilidade/DOP).

# text
seg-c8fc6a49d249 = Nutação IAU (União Astronômica Internacional) 2000A / 2000B + redução TEME→GCRS (GCRS: Geocentric Celestial Reference System)

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
seg-b31c49596100 = <c1/>: a <b>série IAU 2000A completa</b> ({ "678" } termos lunissolares + { "687" } planetários, <c2/>) e o truncamento de 77 termos 2000B (<c3/>) são cada um validados <b>bit a bit</b> contra os vetores de referência SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) publicados em JD_TT { "2453736.5" } — <c4/> dá Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> dá Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — ambos a <b>{ "1e-13" } rad</b>. A tabela 2000A é gerada por máquina a partir da fonte <c6/> do ERFA por <c7/> (reproduz o <c8/> registrado bit a bit). A matriz de nutação (<c9/>), a equação dos equinócios e a cadeia completa TEME→TOD→MOD→GCRS (TOD: verdadeiro da data; MOD: médio da data) (<c10/>, Vallado AIAA-2006-6980) são testadas quanto às propriedades de rotação própria/ida e volta/precessão mais nutação, a matriz de nutação contra o <c11/> do ERFA elemento por elemento a { "1e-14" }, e toda a cadeia TEME→GCRS contra o exemplo TEME→GCRF publicado de Vallado (AIAA 2006-6753, 2004-04-06) a <b>{ "0.11" } m</b> (<c12/>); até que essa verificação de ponta a ponta fosse acrescentada, a matriz de nutação carregava Δψ com o sinal errado, uma rotação de { "2" }·Δψ (cerca de { "25" }″) que os testes de propriedade não conseguiam ver (veja CHANGELOG, Unreleased, Fixed); 2000A e 2000B concordam a < { "1" } mas, como exigido. A cadeia é baseada em equinócio/GMST (GMST: tempo sideral médio de Greenwich); a redução CIO (X,Y,s) sem equinócio e sua verificação cruzada numérica independente com ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um toolkit de geometria planetária em Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m na órbita do GNSS, bem dentro da meta < { "10" } m) estão na linha CIO abaixo.

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
seg-9dbb3b1b18a1 = <c1/>: o campo de harmônicos esféricos normalizado de Schmidt da IAGA (International Association of Geomagnetism and Aeronomy) (grau/ordem { "13" }, { "2025.0" } + variação secular; coeficientes gerados por máquina a partir do <c2/> oficial por <c3/>, reproduzindo <c4/> bit a bit). Validado em cinco frentes independentes: ({ "1" }) verificações pontuais exatas de coeficientes contra o arquivo da IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) a síntese de grau 1 reproduz o campo <b>exato do dipolo inclinado em forma fechada</b> <c5/> a { "1e-6" }; ({ "3" }) o <b>campo analítico completo de grau 13 é igual a −∇V</b> do potencial escalar (diferenças finitas, a { "1e-4" }) — exercitando as derivadas de Legendre e o termo 1/sinθ de ponta a ponta; ({ "4" }) o eixo do dipolo reproduz o conhecido <b>polo norte geomagnético</b> (~{ "80.7" }°N, −{ "72.7" }°E) e a <b>intensidade do dipolo</b> (~{ "29.7" } µT), e o campo global fica na faixa física de { "22" }–{ "67" } µT com o sinal correto de inclinação por hemisfério; e ({ "5" }) <b>referência independente externa</b> — a síntese completa reproduz os valores do <b>serviço web do IGRF-14 do British Geological Survey</b> em { "2025.0" } (geodésico, altitude WGS-84 (WGS: World Geodetic System)) a <b>< { "2" } nT</b> em X/Y/Z/F e <c6/> em D/I em quatro pontos, incluindo { "400" } km de altitude (<c7/>).

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
seg-aad81285e8cf = <c1/>: a cadeia celeste-terrestre sem equinócio. As coordenadas <c2/> do CIP (Celestial Intermediate Pole) e a série de 66 termos do localizador CIO <c3/> são validadas <b>bit a bit</b> contra o vetor <c4/> do SOFA/ERFA publicado em JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); a matriz GCRS→CIRS (CIRS: Celestial Intermediate Reference System) contra <c5/> (todos os nove elementos a { "1e-12" }); o ângulo de rotação da Terra (ERA) contra <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). A tabela <c7/> é gerada por máquina a partir da referência <c8/> do ERFA por <c9/> (reproduz <c10/> bit a bit). A <c11/> completa (CIO <c12/> = movimento polar · ERA · GCRS→CIRS) é testada quanto a rotação própria + ida e volta, e mostrada consistente com a redução TEME legada de equinócio/GMST-1982 a menos de { "1" } m em um raio de { "7 000" } km (as convenções diferem em cerca de { "5" } cm ali). <b>Verificação cruzada independente de terceiros (<c13/>):</b> a mesma <c14/> é comparada com o <b>ANISE</b> (a reimplementação em Rust puro do NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) rotacionando GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) a partir do <c15/> do JPL (Jet Propulsion Laboratory), com <b>parâmetros de orientação da Terra <c16/> do IERS (International Earth Rotation and Reference Systems Service) idênticos fornecidos aos dois lados</b>, ao longo de oito épocas trimestrais { "2020" }–{ "2023" }. As duas realizações independentes de referencial concordam a uma <b>rotação relativa máxima de { "0.028" }″ — ≤ { "0.86" } m no solo, ≤ { "0.93" } m em LEO (órbita terrestre baixa), ≤ { "3.6" } m em órbita de GNSS</b> (ângulo médio { "0.023" }″). Esta é a verificação cruzada de referencial "< { "10" } m" do ROADMAP, <b>entregue</b>; o resíduo é a diferença esperada de modelo/datum entre ITRF93 e IERS-2010-CIO, não um defeito (a âncora bit a bit continua sendo os vetores SOFA/ERFA acima). O ANISE é um crate MPL-2.0 (MPL: Mozilla Public License) / edition-2024, de modo que a verificação fica em um subcrate autônomo, excluído do workspace, que nunca toca o grafo de dependências publicado do <c17/> nem qualquer gate de CI padrão.

# text
seg-fa5889f379d2 = Ida e volta da exportação SP3 (Standard Product { "3" }, o formato de órbita precisa) (constelação → SP3-c → nova leitura)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/>: o instantâneo real do <c2/> do Celestrak ({ "30" } satélites GPS) é propagado com SGP4, exportado para SP3-c (<c3/> → <c4/>), lido novamente (<c5/>), e as posições ECEF recuperadas são comparadas com a verdade do SGP4 em cada época ao longo de { "24" } h — pior resíduo <b>< { "0.5" } m</b> (a serialização em milímetros do gravador; a tolerância de { "10" } m, de nível TLE (TLE: conjunto de elementos de duas linhas), do marco é atendida com larga margem). O caminho <c6/> da CLI (interface de linha de comando) também é coberto: o cenário de órbita incluído exporta um SP3 de 30 satélites que pode ser lido novamente, e um cenário que não é de órbita é rejeitado.

# text
seg-fa5ee52e59aa = Geometria real da constelação GPS a partir de TLEs (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/>: um <b>instantâneo <c2/> genuíno do Celestrak</b> (2021-07-28, { "30" } satélites GPS operacionais; procedência em <c3/>) é lido e cada satélite é propagado pelo núcleo SGP4 validado até um instante comum, girado de TEME para ECEF. Afirma que a constelação completa pousa na camada GPS MEO (órbita terrestre média) dentro de { "1" }%, e que, de um local de latitude média com céu aberto, o conjunto real de todos os satélites em visada (nove satélites) rende PDOP { "1.64" } com a diluição vertical superando a horizontal (como deve ser para um usuário em solo). Isso exercita o SGP4 em uma constelação real, ao lado dos caminhos de dados reais SP3 (preciso) e RINEX (transmitido).

# text
seg-a1b7d74bbe02 = Gerador Walker de elementos médios SGP4

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/>: um padrão Walker-delta projetado é emitido como elementos médios SGP4 (movimento médio de Kozai escolhido para que o semieixo maior do SGP4 caia na camada-alvo) e propagado pelo núcleo validado. Testes: um Walker de 24 satélites semelhante ao GPS fica na camada MEO dentro de { "1" }%, os planos são espaçados exatamente { "90" }° em RAAN (ascensão reta do nó ascendente) recuperada a partir das normais das órbitas, e o movimento médio reproduz o período de ~{ "718" } min da camada GPS.

# text
seg-6e8c472ec9fa = Varredura de PDOP da constelação + FoMs (figuras de mérito) de cobertura/revisita

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (monotonicidade)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/>: <c2/> tabula a cobertura e o PDOP mediano/pior sobre uma grade <c3/>; <c4/> informa a fração de cobertura e as lacunas de revisita em um ponto do solo. Validado pelas monotonicidades físicas que um estudo de compromisso de projeto deve obedecer: adicionar satélites nunca reduz a cobertura e reduz estritamente o PDOP mediano (um projeto completo de 24 satélites cobre continuamente com PDOP ~{ "1.7" }), e adensar uma constelação reduzida diminui estritamente a pior lacuna de revisita. A lacuna média de revisita nunca excede a máxima. São tabelas de compromisso geométrico, não um orçamento de enlace/cobertura certificado.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Enquadramento honesto: esta é uma camada geométrica determinística (órbitas circulares, Terra esférica de raio médio { "6371" } km, linha de visada pura). Ela estabelece a <em>disponibilidade</em> e a exatidão de posição <em>geométrica</em> (diluição de precisão × um orçamento de erro de distância representativo) a partir da geometria real, não uma solução de navegação com efemérides precisas. A referência <c1/> coloca uma espaçonave dentro da camada GNSS: ela mantém uma posição apenas em ~{ "59" }% do dia, o relógio quântico mantém uma solução de temporização de { "5" } ns em todas as lacunas (disponibilidade { "1.0" }) enquanto o relógio em escala de chip mantém ~{ "0.73" }.

# text
seg-e2c433c35ba8 = Propagador numérico (Cowell) e modelo de forças

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = O propagador numérico (<c1/>) integra um modelo de forças hierárquico (<c2/>) com os integradores adaptativos (<c3/>). Cada termo abaixo é validado contra a verdade analítica ou uma forma fechada derivada à mão; as perturbações ficam <b>desligadas por padrão</b>, de modo que os goldens publicados permanecem intactos. O modelo composto também é verificado de forma cruzada contra outra ferramenta: <c4/> executa { "11" } casos LEO e GTO (órbita de transferência geoestacionária), { "275" } épocas horárias, contra o propagador DormandPrince853 do Orekit { "12.2" }, e os níveis conservativos (dois corpos → J2–J6 → Sol/Lua → SRP de bola de canhão) concordam até um pior caso de { "0.08" } m ao longo de { "24" } h (VALIDATED na matriz); o nível de arrasto é apenas caracterizado ({ "333" } m) e permanece MODELLED.

# text
seg-ec74e57ff801 = Propagador de Cowell contra a verdade analítica de Kepler

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/>: a órbita sem perturbações (dois corpos) reproduz a <b>solução exata de Kepler em variáveis universais com precisão submétrica ao longo de uma órbita LEO de { "24" } h</b> (um critério mais rígido que "contra uma referência numérica < { "10" } m"); a energia específica e o momento angular se conservam em ~{ "1e-9" } relativo; a regressão nodal de J2 reproduz a forma fechada <c2/> segundo a teoria de primeira ordem (dentro de { "2" } %, o resíduo O(J2²)). <c3/> devolve <c4/> em vez de uma resposta silenciosamente errada quando Newton não converge (perto do perigeu, e = { "0.999" }). O <c5/> robusto (ponto de partida de Markley { "1995" }, <c6/>) converge ali e em todo o intervalo { "0" } ≤ e ≤ { "0.999999" }, dentro de { "0.9" } ε·|E| das raízes mpmath de 50 dígitos (<c7/>).

# text
seg-549d15780f79 = Integradores adaptativos (RK4 (Runge–Kutta de quarta ordem) com duplicação de passo + o par embutido Dormand–Prince RK5({ "4" }), DP5({ "4" }) abaixo)

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/>: o RK4 integra <c2/> até < { "1e-9" }, mostra a queda de erro de ~{ "16" }× por passo reduzido à metade (convergência de 4ª ordem) e conserva o oscilador harmônico ao longo de um período. A estimativa de erro embutida do DP5({ "4" }) é <b>O(h⁵)</b> (reduzir o passo à metade a corta em ~{ "32" }×), integra o oscilador por { "50" } períodos conservando a energia até < { "1e-6" } e chega ao mesmo ponto final com a mesma tolerância em <b>menos avaliações de função</b> que a duplicação de passo; <c3/> satisfaz o mesmo critério submétrico de Kepler e concorda com o caminho RK4 até < { "1" } m em uma órbita J2..J6. O <b>DOP853</b> (<c4/>): o par { "8" }({ "5,3" }) de Hairer com saída densa reproduz o passo do DOP853 do SciPy { "1.18.1" } passo a passo (um único passo dentro de { "5.6e-15" }; contagens de passos idênticas nas execuções com e = { "0.7" } e de Arenstorf, uma inversão de aceitação/rejeição em { "501" } passos na execução LEO; estados finais dentro de { "1.6e-12" }) e coincide com a solução exata de Kepler tão de perto quanto o SciPy (<c5/>).

# text
seg-345ae1eb05ec = Campo de harmônicos zonais J2–J6

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/>: <c2/> é verificado de três maneiras — ele <b>se reduz ao <c3/>, validado com 666 vetores, até a precisão de máquina</b> quando restrito a <c4/>; ele <b>coincide com o gradiente numérico do seu próprio potencial zonal</b> ao longo de todo o campo J2..J6 (o padrão-ouro do campo conservativo); e os termos ímpares <c5/> contra os pares <c6/>/<c7/> mostram a (anti)simetria norte–sul característica sob <c8/>. Uma órbita J2..J6 propagada conserva a energia total em ~{ "1e-8" } ao longo de um dia.

# text
seg-5536986d9c8f = Gravidade de terceiro corpo (Sol e Lua)

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>coincide com o gradiente exato do seu potencial perturbador</b>, anula-se no geocentro e atinge as magnitudes LEO de livro-texto (~{ "5e-7" } m/s² Sol, ~{ "1.1e-6" } m/s² Lua). As efemérides do Sol de baixa precisão de Montenbruck–Gill atingem âncoras J2000 derivadas à mão (distância do periélio ≈ { "1.471e11" } m, declinação do solstício ~−{ "23" }°, movimento de ~{ "1" }°/dia); as efemérides da Lua permanecem dentro do seu envelope de perigeu/apogeu, recuperam a distância média de ~{ "384 400" } km, nunca excedem a inclinação de { "5.3" }° e voltam a menos de { "1" }° após um mês sideral. A ligação do lado direito (RHS) dirigida pela época é <b>exata bit a bit</b> (o termo RHS é igual a <c4/> na posição amostrada em t = { "0" } e t = { "1" } dia), e um deslocamento de época de um quarto de ano produz uma trajetória diferente.

# text
seg-9c8756f9d534 = Pressão de radiação solar (SRP) + sombra cônica

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/>: <c2/> (bola de canhão <c3/>) é <b>idêntico bit a bit</b> à forma fechada em pleno sol, fixa a <b>pressão de radiação a 1 AU (AU: unidade astronômica) em ≈ { "4.5398e-6" } N/m²</b>, fica na faixa LEO de ~{ "1.36e-7" } m/s² empurrando para longe do Sol, cai a um quarto quando a distância ao Sol dobra (inverso do quadrado) e é <b>exatamente zero</b> no fundo da umbra. <c4/> dá <c5/> em pleno sol e <c6/> em umbra total (exato), uma penumbra suave e monotônica que sobe de { "0" } → { "1" } ao longo da faixa <c7/>, a qual <b>se estende além do cilindro umbral</b>.

# text
seg-17b48db4038b = Arrasto atmosférico (primeiro termo dependente da velocidade)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado Tabela 8-4, exponencial por partes) <b>ancora em { "1.225" } kg/m³ ao nível do mar</b>, limita abaixo da superfície, decresce monotonicamente através da LEO, fica na faixa de ~{ "1e-12" } kg/m³ a { "400" } km com uma altura de escala física recuperada de ~{ "58" } km; <c3/> se opõe à velocidade relativa de co-rotação na magnitude LEO de ~{ "2e-6" } m/s². A verificação característica: uma órbita de { "300" } km perde energia específica <b>monotonicamente</b> e seu semieixo maior decai de forma limitada, ~km/dia, enquanto a linha de base no vácuo conserva a energia até < { "1e-9" }.

# text
seg-133eed361425 = Correção relativística pós-newtoniana (Schwarzschild)

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/>: <c2/> (forma <c3/> do IERS <c4/>) colapsa em uma órbita circular na forma fechada <c5/> (radial, <b>para fora</b>, componentes fora do eixo exatamente zero), mostra a <b>razão LEO <c6/> em relação a dois corpos</b> de livro-texto, coincide com a forma simplificada à mão em velocidade radial <c7/> até < { "1e-12" } e, no propagador, <b>perturba a órbita mantendo o semieixo maior abaixo de um metro/dia</b> — o oposto conservativo do decaimento por arrasto.

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
seg-d39e75019595 = Escopo honesto: os padrões <c1/> publicados integram o campo zonal. O campo <b>tesseral</b> EGM2008 de alto grau (<c2/>, grau/ordem { "70" }), as <b>marés</b> sólida/oceânica/atmosférica (<c3/>) e o termo de arrasto de referencial de <b>Lense–Thirring</b> agora estão implementados e compostos no modelo de forças preciso de ajuste de efemérides (<c4/> — veja abaixo). O campo tesseral também é um termo opcional do <c5/> de Cowell (<c6/>, desligado por padrão), validado contra o <c7/> do Orekit { "12.2" } até grau/ordem { "70" } ({ "6" } casos ao longo de { "24" } h, pior |Δr| { "0.036" } m; <c8/>). Existem dois avaliadores de campo: o histórico <c9/> (derivadas parciais esféricas; válido até o grau ~{ "180" } longe dos polos; saídas fixadas) e <c10/> (coluna progressiva modificada de Holmes–Featherstone { "2002" }, gradiente sem 1/cos φ; válido até o grau { "2190" } em todas as latitudes). O EGM2008 até { "2190" } é carregado em tempo de execução (<c11/>, <c12/>, não incluído). <c13/> concorda com o Orekit { "12.2" } até { "7.3e-17" } m/s² em oito pontos até o grau { "2190" }; permanece MODELLED porque o pyshtools não atingiu o limiar perto dos polos fixado antecipadamente (uma verificação com mpmath situa o erro no pyshtools; <c14/>). Uma órbita { "200" }×{ "200" } de { "24" } h concorda com o Orekit até { "0.13" } m, mas seu controle de sensibilidade de grau 70 fixado antecipadamente não foi atingido ({ "0.73" } m < { "1" } m), de modo que os graus { "71" }–{ "200" } são caracterizados, não validados, em órbita (<c15/>). A densidade termosférica NRLMSISE-00 (NRLMSISE: modelo de atmosfera estendida do Naval Research Laboratory com espectrômetro de massa e radar de espalhamento incoerente) está portada (<c16/>: idêntica bit a bit à porta em C de domínio público em { "720" } pontos, dentro de { "1.9e-6" } relativo do pymsis, com os { "17" } casos de teste publicados reproduzidos; <c17/>) e é um nível opcional de densidade de arrasto (<c18/>, <c19/>; o padrão continua sendo o modelo estático de Vallado). Isso valida a porta, não a exatidão do modelo contra a densidade medida. O Sol e a Lua DE440 (DE: efemérides de desenvolvimento) são um nível opcional de efemérides (<c20/>). A sombra de SRP da Terra oblata WGS-84 é opcional (<c21/>), concordando com a razão de iluminação do Orekit { "12.2" } dentro de { "7.4e-9" } em { "2400" } geometrias (<c22/>); sua variante com escurecimento de limbo não tem referência independente externa (MODELLED). O nível de arrasto NRLMSISE-00 concorda com o próprio arrasto NRLMSISE-00 do Orekit { "12.2" } ao longo de { "24" } h até { "0.03" } m contra até { "142" } km de deslocamento por arrasto (<c23/>, VALIDATED sob as convenções compartilhadas). Uma verificação cruzada com o GMAT (General Mission Analysis Tool) continua sendo um passo seguinte.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Marés no geopotencial (<c1/>)

# text
seg-81b18c4caad3 = Correções variáveis no tempo ΔC̄_nm, ΔS̄_nm aos coeficientes de Stokes (IERS Conventions { "2010" }, Capítulo { "6" }), validadas contra os próprios números publicados das convenções — não contra outra ferramenta.

# text
seg-78dc5baf4d9d = Contribuição

# text
seg-7c6c910bbf89 = Maré terrestre sólida (IERS Eq. { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/>: a maré permanente (frequência zero) ΔC̄₂₀ fica dentro de { "1" } % do valor publicado pelo IERS, −{ "4.1736" }×{ "10" }⁻⁹ (números de Love anelásticos); o <b>exemplo resolvido K1 do Passo 2 é reproduzido bit a bit</b> (amplitudes seno/cosseno { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² até { "0.1" }×{ "10" }⁻¹²); o caminho de Legendre normalizado é fixado por valores à mão em forma fechada, independentes da recorrência.

# text
seg-f2e2c5334721 = Maré oceânica (IERS Eq. { "6.15" }, FES2004 (atlas de marés Finite Element Solution { "2004" }), { "8" } constituintes)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = O subconjunto FES2004 incorporado (<c1/> → <c2/>, interpretação de Doodson→multiplicador) reproduz exatamente os coeficientes M2 ({ "2,2" }) da fonte; a fase de Doodson de K1 é igual a θ_g + π; a magnitude setorial de grau 2 é física e uma ordem abaixo da maré sólida.

# text
seg-52a19a291a41 = Maré atmosférica de ar S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

# text
seg-86b3d3a39bc7 = Os harmônicos de Ray incorporados são convertidos pela relação de carga superficial (Eq. { "6.21" }) em um ΔC̄₂₂ de pico ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % do termo M2 oceânico). Ressalva honesta: <b>não existe referência independente publicada de coeficiente de geopotencial para a maré de ar</b>, de modo que ela é validada por integridade da fonte + magnitude, um critério mais fraco que o das marés sólida/oceânica.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Manobras e projeto de trajetória (<c1/>)

# text
seg-a2ff4b0619d4 = ΔV impulsivo + propagação de covariância

# text
seg-12f469864d28 = Uma descontinuidade de velocidade com uma covariância { "6" }×{ "6" } levada adiante (queima determinística ⇒ STM (matriz de transição de estado) identidade; a covariância do erro de execução gira do referencial da queima — ECI (inercial centrado na Terra) ou LVLH (vertical local, horizontal local) — para o bloco de velocidade).

# text
seg-f3f0e4a7ec05 = Integração de queima finita contra Tsiolkovsky

# text
seg-f7b35b7acdba = Integração de empuxo constante ao longo de um arco de queima (massa como estado) cujo ΔV alcançado coincide com a equação do foguete de <b>Tsiolkovsky</b> em forma fechada com <b>melhor que { "0.01" } %</b>.

# text
seg-46ae334a0604 = Ida e volta do solucionador de Lambert (Izzo { "2015" })

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = A saída de Lambert de revolução única (<c1/>, <c2/>, tempo de voo ⇒ <c3/>, <c4/>) é <b>levada de ida e volta pelo propagador exato de Kepler em variáveis universais</b> — ela deve pousar de volta em <c5/>.

# text
seg-04d69337acb3 = Varredura porkchop contra o piso de Hohmann

# text
seg-fb5298b7983c = O mínimo da grade de C3 de lançamento × V∞ de chegada é verificado contra o <b>piso analítico de C3 da transferência de Hohmann</b> para duas órbitas circulares coplanares.

# text
seg-bf2eb36e3eb6 = Solucionador de Lambert contra uma biblioteca independente

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/>: { "13" } transferências de revolução única de LEO a GEO e a heliocêntricas, progradas e retrógradas, contra o lamberthub { "1.0.0" } <c2/>; pior diferença de velocidade de contorno { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Escopo honesto: sem otimizador de trajetória, sem ramos de Lambert de múltiplas revoluções e com um modelo heliocêntrico sintético coplanar-circular (sem efemérides planetárias DE, de modo que uma verificação cruzada de C3 Terra–Marte com o GMAT não foi executada).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Determinação de órbita (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Corretor em lote de Gauss–Newton

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = O solucionador genérico <c1/> atinge a solução exata de mínimos quadrados ponderados em um ajuste linear, recupera os parâmetros verdadeiros em um ajuste não linear <c2/> e resolve uma multilateração de distâncias em 3-D a partir de distâncias sem ruído.

# text
seg-b31d1ffa99b1 = Determinação de órbita em lote a partir de distâncias

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> recupera <c2/> a partir do rastreamento de distância por estações terrestres (propagado sobre o modelo de forças de dois corpos + J2) com <b>precisão submétrica / mm·s⁻¹ a partir de distâncias sem ruído</b>, e com <b>~{ "2" } m com um resíduo pós-ajuste no piso de ruído de { "5" } m</b> — a assinatura de um ajuste de mínimos quadrados consistente.

# text
seg-fb29199bf8bd = OD sequencial (filtro unscented)

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> recupera recursivamente o estado dentro de dezenas de metros na mesma dinâmica e no mesmo modelo de distância.

# text
seg-7a636cc9eef0 = OD em lote e sequencial contra um estimador independente

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/>: { "8" } cenários ({ "6" } LEO/MEO/excêntricos sem ruído com { "3" }–{ "4" } estações, { "2" } com σ = { "5" } m) contra os estimadores de mínimos quadrados em lote e de Kalman do Orekit { "12.2" } em um modelo de forças equivalente; pior caso em lote { "1e-3" } m / { "1e-6" } m/s, sequencial { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | OD em lote com taxa de variação da distância / az-el e máscara de elevação | <c1/> (comparação externa, um limiar fixado antecipadamente não atingido) | <c2/>: { "8" } cenários contra os mínimos quadrados em lote do Orekit { "12.2" } com medições geométricas instantâneas personalizadas; conjuntos visíveis idênticos, valores de medição dentro de { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, matriz de transição de estado dentro de { "1.2e-14" }, estados ruidosos dentro de { "1.74" } cm e RMS por tipo dentro de { "2.7e-4" }; o limiar sem ruído ≤ { "1" } cm de estado, fixado antecipadamente, não é atingido em { "2" } de { "4" } cenários ({ "1.46" } e { "1.74" } cm; a própria estimativa do Orekit fica tão longe da sua verdade simulada, a do kshana dentro de { "1e-8" } m). Veja <c3/>. |

# text
seg-35a85fb744cd = Escopo honesto: a OD didática usa estações inerciais fixas, um referencial topocêntrico de Terra esférica e medições geométricas instantâneas (sem tempo de luz, aberração, refração ou rotação da Terra); a matriz de transição de estado do caminho de taxa de variação da distância/ângulos é variacional (integrada por RK4 com derivadas parciais analíticas de dois corpos + J2), não de forma fechada; não há filtro sequencial para taxa de variação da distância ou ângulos. O caminho somente de distância mantém seu jacobiano por diferenças finitas. (O motor completo de ajuste de efemérides com todas as forças, abaixo, traz sua própria matriz de transição de estado variacional.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Validação do modelo de forças por ajuste de efemérides (<c1/>)

# text
seg-9207d7139b87 = Um estimador de mínimos quadrados em lote de observação de posição, preciso e com todas as forças: o geopotencial tesseral EGM2008 (avaliado no referencial fixo à Terra por meio da redução CIO) composto com o terceiro corpo Sol/Lua, SRP, arrasto, GR (relatividade geral) de Schwarzschild/Lense–Thirring e as marés acima, ajustado a uma trilha de posições inerciais com um jacobiano de matriz de transição de estado variacional. Validado em dados <b>sintéticos</b>, em que a verdade é o próprio integrador do Kshana, de modo que cada resíduo é do estimador e não da dinâmica.

# text
seg-fc676106563e = Composição precisa do modelo de forças

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/>: o campo de grau 0 é exatamente a massa pontual em cada época (o termo central é invariante por rotação); o grau 8 acrescenta o achatamento da banda J2; o terceiro corpo Sol e o termo de maré se conectam com fidelidade bit a bit; uma aceleração empírica radial constante é puramente radial em RTN (radial, transversal, normal).

# text
seg-98b036354077 = Matriz de transição de estado variacional

# text
seg-71787d9334db = Cada coluna de Φ ao longo de meia órbita LEO (geopotencial de grau 8 + Sol + Lua) concorda com uma repropagação independente por <b>diferenças finitas (FD) centrais de arco inteiro</b> com <b>< { "1" }×{ "10" }⁻⁶ relativo</b> tanto na resposta de posição quanto na de velocidade — a verificação cruzada documentada STM↔FD. Φ({ "0" }) = I; os propagadores aumentado e simples concordam em nível submilimétrico.

# text
seg-0b453776136b = Autorrecuperação do mínimo quadrado em lote

# text
seg-c651db308332 = Um arco Kshana de 1 hora (grau 6 + Sol + Lua) observado sem ruído é recuperado de um deslocamento de { "150" } m / { "0.1" } m·s⁻¹ até o <b>estado de época dentro de { "1" }×{ "10" }⁻² m</b> com RMS pós-ajuste quase nulo; com ruído branco de { "5" } m, o RMS 3-D pós-ajuste se estabiliza no <b>piso de ruído de ~σ</b>, sem viés. O <b>C_R de SRP é recuperado de { "1.0" } até dentro de { "1" } %</b> da verdade de { "1.4" }.

# text
seg-06bd2857f832 = Edição de valores atípicos e relatório em RTN

# text
seg-8b9dea5c0727 = Um erro grosseiro de { "500" } m é rejeitado pela edição pós-ajuste de 5-σ (exatamente uma observação), deixando um ajuste limpo em nível milimétrico; os resíduos são relatados decompostos em radial/transversal/normal, além de 3-D.

# text
seg-e3969a15df96 = Nível de aceleração empírica (constante em RTN + 1-CPR (CPR: ciclo por revolução))

# text
seg-c46af7926511 = Os nove parâmetros empíricos com restrição a priori permanecem abaixo de { "1" }×{ "10" }⁻⁸ m·s⁻² sobre uma verdade sem componente empírica, sem perturbar o ajuste; uma aceleração transversal constante de { "3" }×{ "10" }⁻⁸ m·s⁻² injetada na verdade é recuperada dentro de { "20" } %.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Escopo honesto: a onda sintética usa parâmetros nominais de orientação da Terra (EOP: UT1 (Universal Time { "1" }, tempo de rotação da Terra) ≈ TT (Tempo Terrestre), sem movimento polar) — exato para a autorrecuperação, pois o mesmo modelo gera e ajusta o arco. As validações com conjuntos de dados de agências sobrepõem EOP <b>reais</b> finals2000A e verdade SP3/SPK (SPK: kernel de efemérides planetárias) a este motor por meio da cadeia de referenciais CIO (<c1/>, <c2/>, <c3/>, <c4/>).

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
seg-14a2999d0739 = O motor de todas as forças do Kshana ajustado a uma fatia literal da <b>própria órbita final da ESA/ESOC (ESOC: Centro Europeu de Operações Espaciais)</b> (<c1/>, ITRF (Referencial Terrestre Internacional)) para o Galileo <b>E11</b> ao longo de { "8" } h, cada posição ITRF girada para o GCRS com EOP real finals2000A: <b>RMS 3-D pós-ajuste de { "0.133" } m</b> só com força pura + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> com o nível empírico, a partir de uma sobreposição bruta de { "78.7" } km. O arco completo de { "24" } h é <b>{ "0.611" } m</b>. Tudo bem dentro do limiar de { "5" } m. Gravidade do campo convergida em d/o-8 (idêntica em d/o 8/10/12); o job <c4/> executa o d/o-70 completo. Procedência + SHA-256 (SHA: Secure Hash Algorithm) em <c5/>; registro completo em <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Motor de todas as forças (+ arrasto atmosférico) ajustado a uma fatia literal da <b>própria órbita precisa de dinâmica reduzida do Swarm-A da ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) ao longo de { "3" } h em d/o-70, EOP real finals2000A pela cadeia CIO: nível <b>dinâmico</b> (só estado, densidade estática, <c2/>={ "1" }) <b>RMS 3-D pós-ajuste de { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — resíduo ≈ puro arrasto ao longo da trilha), nível <b>de dinâmica reduzida</b> (+ acelerações empíricas CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm contra a órbita de ~{ "2" } cm da ESA. Procedência + SHA-256 em <c4/>; registro completo em <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) lunar — validado, acima de { "5" } m (honesto)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = Ajuste de modelo de forças <b>centrado na Lua</b> (<c1/>): o campo gravitacional <b>GRGM660PRIM</b> do GRAIL (d/o { "100" }) no referencial lunar de eixos principais fixo ao corpo (<c2/>, IAU { "2015" } Terra-média + o deslocamento fixo DE421 (efemérides de desenvolvimento { "421" }) Terra-média → eixos principais (ME→PA), aplicado como o SPICE o define desde { "0.36" }: até então era aplicado no sentido errado, com cerca de { "208" }″ de erro) + terceiro corpo Terra/Sol, ajustado pelo <em>mesmo</em> estimador genérico de Gauss–Newton dos conjuntos de dados da Terra à órbita reconstruída real do <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } épocas, ~{ "98" } km. Pós-ajuste honesto ({ "0.36" }): <b>dinâmico { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>de dinâmica reduzida { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2-por-revolução empírico), a partir de uma sobreposição bruta de { "39.9" } m (antes da correção ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>acima</b> do limiar de < { "5" } m, sem que a causa seja o estimador (idêntico em d/o 100/150 e <c3/> 1e-6/1e-9). Uma <b>validação cruzada de nível DE</b> (<c4/>: orientação PA lunar DE440 (efemérides de desenvolvimento { "440" }) + efemérides DE440 via ANISE) <b>corrigiu</b> a afirmação do fator limitante — deu { "12.0" } m dinâmico e { "6.67" } m de dinâmica reduzida, que a pilha analítica corrigida agora iguala nos dois níveis (a lacuna dinâmica anterior, { "12.6" } → { "12.0" } m, era o erro de deslocamento ME→PA), de modo que o piso operacional <b>não</b> é a orientação/efemérides analíticas, mas um resíduo irredutível do nível empírico (mais consistente com dinâmica não gravitacional do LRO não modelada ao longo do arco curto); a pilha analítica enxuta já iguala o nível DE para a órbita de dinâmica reduzida. Procedência + SHA-256 em <c5/>; registro completo em <c6/>. <b>Validado contra verdade real de agências: { "3" } de { "3" }; atingindo < { "5" } m: { "2" } de { "3" }.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Navegação por mapa gravitacional / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Campo de anomalia gravitacional em harmônicos esféricos

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/>: um campo de grau baixo, totalmente normalizado, verificado contra as funções de Legendre em forma fechada (<c2/>, <c3/>, <c4/>) e uma anomalia de termo único derivada à mão de { "1.897" } mGal.

# text
seg-f00f82b70e6e = Modelo de medição do gravímetro de átomos frios

# text
# c1: σ = ASD/√τ
seg-49090598c525 = O piso de ruído branco é derivado da ASD do acelerômetro CAI (<c1/>), injetado como uma sequência determinística com semente (o comparador nunca recebe a verdade sem ruído, mas a execução é reprodutível bit a bit).

# text
seg-0556db62c45f = Filtro de partículas com reamostragem por importância sequencial

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/>: o núcleo determinístico é fixado exatamente — ESS (tamanho efetivo da amostra) abrangendo { "1" }…N, reamostragem sistemática escolhendo índices em proporção ao peso, a combinação convexa da média ponderada, uma verossimilhança gaussiana puxando a estimativa para a medição e o determinismo da predição com semente.

# text
seg-7dca80b16a00 = Verossimilhança de correspondência de mapa + recuperação

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/>: <c2/> atinge o pico (= { "1" }) em uma correspondência perfeita e cai para <c3/> a um sigma; um filtro de partículas sobre um trecho distintivo de terreno sintético recupera a posição verdadeira dentro de { "0.1" }.

# text
seg-446d9f03a860 = Benchmark de 60 minutos sem GPS

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>): uma interrupção de ~{ "700" } km / uma hora em que a solução inercial deriva para <b>≈ { "70" } km</b> é recuperada para <b>≈ { "145" } m (< { "500" } m)</b> por um comparador hierárquico do grosso ao fino — reprodutível bit a bit, estável entre realizações de ruído e comprovadamente limitado pelo refinamento (uma única grade grossa estagna em ~{ "2" } km).

# text
# c1: .hgt
seg-81a2963c26cc = Carregador de DEM (modelo digital de elevação) <c1/> do SRTM (Shuttle Radar Topography Mission) + amostra bilinear (REFERÊNCIA INDEPENDENTE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/>: um buffer <c3/> { "2" }×{ "2" } construído à mão, com cantos [{ "100,200" };{ "300,400" }], interpola bilinearmente para <b>exatamente { "250.0" }</b> no centro da célula (referência independente em forma fechada), a ida e volta em 16 bits big-endian é exata, e a inversão de linhas coloca a linha de arquivo mais ao norte na latitude armazenada mais alta — tudo contra a <b>especificação do driver SRTMHGT (formato de arquivo de altura da Shuttle Radar Topography Mission) do GDAL (Geospatial Data Abstraction Library)</b> (16 bits com sinal big-endian, linha a linha, linha norte primeiro, vazio -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Uma fixture { "11" }×{ "11" } versionada (<c4/>) exercita o analisador na CI; e uma <b>tile real SRTM v3 da NASA/USGS (USGS: United States Geological Survey), de domínio público, versionada</b> (N36W117, Vale da Morte, decimada para 6 arcos de segundo, { "722" } KB, <c5/>) é lida na CI (não ignorada, <c6/>), situando <b>Badwater Basin em ≈ −{ "78" } m dentro da faixa documentada de [−{ "95" },−{ "70" }] m</b> (levantamento NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) com o máximo da tile ≈ { "2161" } m — a fonte da verdade é o levantamento, o DEM está sob teste (não circular). Cotas pontuais publicadas maiores (Mount Whitney { "4421" } m) permanecem em testes de tile completa condicionados por <c7/>.

# text
seg-80f985ea3e11 = Convergência da navegação referenciada ao terreno (TERCOM/SITAN (TERCOM: correspondência de contornos de terreno; SITAN: Sandia Inertial Terrain-Aided Navigation)) (REFERÊNCIA INDEPENDENTE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>): uma deriva de INS injetada <b>derivada à mão</b> ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km a ~{ "12" }° de latitude, calculada como deriva° × M_por_grau × cos lat) é recuperada para <b>< { "500" } m</b> (dentro do piso de resolução da grade <c3/>), um corte > { "100" }× em relação ao inercial livre — verificado contra o número <em>injetado</em>, nunca contra o DEM (não circular), reprodutível bit a bit e estável entre sementes de ruído.

# text
seg-5b7c1dc72436 = Ganho de fusão combinada gravidade+magnético+terreno (REFERÊNCIA INDEPENDENTE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>): três canais escalares (Δg · anomalia crustal de |B| · elevação) fundidos como uma verossimilhança em produto dão um resíduo <b>limitado < { "500" } m</b> ao longo da interrupção de 60 min que, com média sobre sementes, é <b>não pior que o melhor canal único</b> (aditividade de informação / CRLB (limite inferior de Cramér–Rao) menor). Situa-se no regime publicado de "dezenas de metros" de CEP (erro circular provável) da navegação referenciada ao terreno (TRN) / TERCOM (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: filtro de Kalman de estado de erro), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Escopo honesto: o campo gravitacional é de grau baixo + mascons sintéticos, <b>não</b> o conjunto completo de coeficientes EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); o canal magnético se apoia no campo principal suave IGRF mais mascons de anomalia crustal <b>sintéticos</b> (um mapa crustal real de alta frequência é um passo seguinte); o campo de terreno da CI para os benchmarks de <em>correção de navegação</em> é o DEM sintético autocontido, enquanto o leitor <c1/> em si agora é validado na CI contra uma tile real SRTM v3 versionada (acima); as tiles reais de resolução total continuam condicionadas por <c2/>. Um Monte Carlo do erro de representação do mapa continua sendo um passo seguinte. Os três navegadores agora estão ligados ao motor de cenários por <c3/> (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = Modelo de erro de INS / IMU — validação referenciada a folhas de dados (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = O modelo de erro estocástico da IMU é validado contra <b>especificações publicadas de folhas de dados / conjuntos de dados de fabricantes</b> — nunca contra um valor produzido pelo próprio Kshana. A ponte entre uma especificação em unidades de campo e o modelo de ruído em SI (Sistema Internacional de Unidades) é a identificação padrão por desvio de Allan (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): o coeficiente de passeio aleatório <c1/> é o ADEV sobreposto lido em τ = { "1" } s na inclinação τ⁻¹ᐟ², e o coeficiente de instabilidade de viés é o patamar plano de Allan (<c2/>, hermético — sem download).

# text
seg-702de63000d2 = Evidência / referência independente

# text
seg-c3fed48b98b1 = Camada de conversão de unidades (o risco nº 1 de não circularidade)

# text
seg-6cdc88d36bfd = Verificado à mão: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Passeio aleatório de ângulo do giroscópio

# text
seg-d5fd60857e4d = ARW do ADIS16465 de { "0.15" } deg/√hr (folha de dados da Analog Devices) recuperado a partir do ADEV({ "1" } s) com < { "5" }%.

# text
seg-c5e2d361b83f = Passeio aleatório de velocidade do acelerômetro

# text
seg-4413d3bb39b4 = VRW do ADIS16465 de { "0.1" } m/s/√hr recuperado com < { "5" }%.

# text
seg-ebeb0bb0e0fb = Inclinação de Allan do ruído branco

# text
seg-f674ce82dc2c = Inclinação log-log do ramo branco do ADIS16460 −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Patamar de instabilidade de viés em operação

# text
seg-94acb18a94cb = Instabilidade de viés (BI) do giroscópio ADIS16465 de { "2.0" } deg/hr recuperada como o mínimo plano de Allan com < { "15" }%.

# text
seg-b359e0e92e20 = Segundo perfil de IMU

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) ambos recuperados com < { "5" }%.

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Escopo honesto: isto valida o <b>modelo de erro estocástico</b> contra coeficientes de Allan de folhas de dados. O conjunto de dados de veículo <b>KF-GINS</b> do i2Nav-WHU (WHU: Universidade de Wuhan) é usado como uma verificação separada, condicionada aos dados: o EKF de estado de erro em malha fechada, fracamente acoplado, com o modelo de braço de alavanca GNSS, é uma linha VALIDATED da <a1>matriz de verificação</a1> (<em>EKF GNSS/INS fracamente acoplado com braço de alavanca no conjunto de dados KF-GINS</em>), comparada com a trajetória de referência em C++ do KF-GINS sob limiares registrados antes da execução. Ele só é executado onde o conjunto de dados é fornecido (<c1/>); sem ele, são executados o carregador sintético e os testes de braço de alavanca. As variantes fortemente acopladas e de fase da portadora não são cobertas por essa linha (a linha GNSS/INS fortemente acoplada com fase da portadora é MODELLED).

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
seg-bd222b27949c = O primeiro marco do motor de navegação de espaço profundo: generalizar o núcleo fixado na Terra para um corpo central arbitrário, acrescentar a dinâmica de Marte, uma junção de provedor de efemérides, tempo submicrossegundo e as primitivas de tempo de luz / atraso relativístico. <b>Todo cenário terrestre existente é idêntico byte a byte</b> — os goldens de reprodutibilidade multiplataforma (<c1/>, <c2/>) passam sem alterações e sem regeneração, verificado a cada commit.

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
seg-7d20649189fa = <c1/>: <c2/> com <c3/>. <c4/> afirma que <c5/> e <c6/> são iguais às funções legadas da Terra com <b>igualdade exata de bits</b> (<c7/>), e um arco terrestre com <c8/> padrão é idêntico byte a byte — os goldens de reprodutibilidade permanecem inalterados (mesmo SHA, sem regeneração).

# text
seg-658acc8112e3 = Gravidade de Marte (GMM-3 (GMM: Goddard Mars Model) tesseral, fixa ao corpo)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/>: zonais C̄20/C̄30/C̄{ "40" } a partir de J2/J3/J4 do MRO110 (solução gravitacional da Mars Reconnaissance Orbiter) (<c2/>, o J2 faz ida e volta até { "1.9604e-3" }) + setorial/tesseral C̄22/S̄{ "22" }, C̄32/S̄{ "32" } do MRO110B2 (Konopliv et al. { "2011" }; tabulados em Liu, Baoyin & Ma { "2012" }), avaliados no referencial fixo ao corpo de Marte da IAU. <c3/> verifica a ida e volta, o afastamento em escala J2 em relação à massa pontual e que o campo é genuinamente fixo ao corpo (uma reorientação de um quarto de dia marciano altera a aceleração inercial). Graus/ordens mais altos são carregados de um <c4/> incorporado por meio de <c5/>.

# text
seg-1dcbee768418 = Referencial fixo ao corpo de Marte (polo IAU)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/>: a rotação IAU 3-1-3 <c2/> (convenção WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), a mesma de <c3/>). Testes: ortonormal até { "1e-12" } com det +{ "1" }, identidade de ida e volta, o meridiano de referência avança a <c4/> por dia.

# text
seg-5b6355a143c7 = Propagação em Marte / centrada no Sol

# text
# c1: validated
seg-4ab87f666765 = <c1/> (autoconsistência)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/>: uma Órbita Baixa de Marte retorna ao ponto de partida após um período kepleriano (fechamento); a energia específica ε=v²/2−μ/r deriva <{ "1e-9" } ao longo do arco; a regressão nodal secular de J2 de Marte coincide com a taxa analítica de Vallado (calculada de forma independente ≈ −{ "5.15" } °/dia a { "60" }° de incl.) com { "3" }%; uma órbita heliocêntrica recupera o ano marciano de ~687 dias (vis-viva + recuperação independente do período a partir do arco). Sem dados externos.

# text
seg-acff4c016089 = Validação cruzada com a DE440 (Marte heliocêntrico)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (EXCLUÍDO do workspace; o ANISE sob MPL-2.0 confinado ao seu próprio Cargo.lock; espelha <c2/>): compara a propagação de Marte centrada no Sol do Kshana com a DE440 do JPL (via ANISE), com a verdade do Horizons citada literalmente (procedência + SHA-256). <b>Resultado reproduzido</b> (semente JD (data juliana) { "2459580.5" } TDB (Tempo Dinâmico Baricêntrico), <c3/> SHA-256 <c4/>): resíduo de posição de <b>{ "137" } m @ arco de 1 dia</b> ({ "5.97" }×{ "10" }⁻¹⁰ da distância heliocêntrica de { "2.299" }×10¹¹ m), crescendo para { "3.3" } km @ { "5" } d, { "87.9" } km @ { "30" } d, { "1.71" } Mm @ { "90" } d — o resíduo <em>cresce</em> com o comprimento do arco porque um modelo de dois corpos centrado no Sol omite deliberadamente as perturbações planetárias (principalmente de Júpiter) e o movimento interno do sistema de Marte que a efeméride baricêntrica DE440 carrega, de modo que o crescimento é a assinatura honesta da dinâmica de n corpos não modelada, não um erro do integrador; um arco curto permanecendo uma pequena fração da distância heliocêntrica confirma que a maquinaria centrada no Sol está correta. Só é executado quando o kernel DE440 está presente (<c5/>, ou obtido automaticamente, ~{ "32" } MB) — uma verificação de nível DE manual / <c6/>, <b>não</b> um portão padrão da CI, de modo que o crate publicado e todo portão padrão permanecem byte a byte intocados.

# text
seg-a7d79066a53b = Tempo de luz + atraso de Shapiro

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/>: a solução iterativa de tempo de luz em época retardada (converge |Δτ|<{ "1e-12" } s, com limite) e o atraso de Shapiro Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testes: Terra–Sol ≈ { "499" } s e Terra–Lua ≈ { "1.28" } s pela efeméride embutida; um emissor sintético de velocidade constante recupera a solução retardada analítica com <{ "1e-9" } s (solucionador comprovadamente independente de qualquer efeméride real); o Shapiro coincide exatamente com um valor calculado à mão e dá ~{ "100" }–{ "250" } µs para um raio rasante de conjunção superior Terra–Marte.

# text
seg-1bc28f6bdc8f = Junção de provedor de efemérides

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/>: <c2/> + <c3/> sem kernel (Sol/Lua de Montenbruck–Gill, geocêntricas); devolve <c4/> para corpos para os quais não há série (por exemplo, Marte), para os quais o provedor ANISE de nível DE é o caminho — a mesma divisão embutido-versus-ANISE de <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Tempo em duas partes + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/>: um <c2/> com acumulação de soma dupla de Knuth recupera intervalos submicrossegundo que o JD em f64 único perde perto de J2000 (>{ "1000" }× melhor, testado); <c3/>/<c4/> usam a série periódica dominante de Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, verificada à mão em J2000). Aditivo — o caminho de tempo existente em f64 único permanece inalterado.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Observáveis radiométricos de espaço profundo e Tracking Data Message do CCSDS — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = O segundo marco do motor de navegação de espaço profundo: o <b>modelo de observáveis</b> que transforma o núcleo de tempo de luz/atraso relativístico D0 nas grandezas reais que uma passagem de rastreamento da Deep Space Network (DSN) ou da ESTRACK (rede europeia de rastreamento espacial) informa — distância, Doppler de uma/duas/três vias, retorno coerente do transponder, medição de distância regenerativa/PN (PN: pseudo-ruído), Δ-DOR (DOR: medição diferencial de distância em uma via) e os meios de propagação — além da entrada/saída da <b>Tracking Data Message (TDM) CCSDS (Consultative Committee for Space Data Systems) 503.0-B</b>, que ingere/emite um arquivo de rastreamento padrão de agência. <b>Escopo honesto:</b> são <b>modelos geométricos exatos</b> que seguem as convenções de Moyer / CCSDS; o <em>ruído</em> de medição é o <c1/> por observação fornecido pelo chamador, não embutido no modelo. Reproduzir uma <em>passagem de rastreamento real específica</em> exige dados TDM reais mais o solucionador de determinação de órbita de espaço profundo — isso é <b>D2</b>, não D1. Tudo abaixo é aditivo (os goldens de reprodutibilidade permanecem inalterados; mesmo SHA, sem regeneração).

# text
seg-d1d2dc7906c8 = Distância e Doppler de 1/2/3 vias (solução de duas pernas de Moyer)

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
seg-e2176b844df8 = <c1/>: <c2/>/<c3/> compõem as soluções de tempo de luz retardada (perna de descida) e adiantada (perna de subida) do D0; a convenção completa de ida e volta é <c4/> (m), documentada e consistente. <c5/>/<c6/>/<c7/> formam o deslocamento da portadora <c8/> (Hz) a partir da taxa de variação da distância na linha de visada, <b>convenção de sinal: uma espaçonave que se aproxima dá um deslocamento positivo (para o azul)</b>. Testes: distância de duas vias = soma das pernas com <{ "1" } mm (~{ "2" } AU de ida e volta Terra–Sol); distância de uma via = <c9/> exatamente; o Doppler de uma via coincide com o analítico <c10/> para um emissor radial de velocidade constante até ppt; o de três vias com estações no mesmo local colapsa byte a byte para o de duas vias.

# text
seg-638697be5b5b = Retorno coerente do transponder (razões exatas da DSN)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/>: os números racionais exatos de retorno DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 módulo 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testado quanto à igualdade exata; um par de bandas indefinido <b>entra em pânico</b> (falha em voz alta, nunca inventa uma razão). <c3/> aplica a portadora da banda + a razão de ponta a ponta e é igual ao <c4/> explícito até a precisão de máquina.

# text
seg-f24f9da1570c = Medição de distância regenerativa / PN (CCSDS { "414" }; ambiguidade)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (a distância inequívoca em escala de resolução por chip) e <c4/> = isso × o comprimento do código (a distância inequívoca do código PN completo <c5/>), segundo a CCSDS 414.1-B. Testado: um relógio de distância de { "1" } MHz dá ~{ "149.9" } m; o código PN de votação ponderada CCSDS-414.1 ({ "1 009 470" } chips) a { "1" } Mchip/s dá a distância inequívoca de projeto de ~{ "151 000" } km; dobrar a taxa de chips divide pela metade a ambiguidade por chip.

# text
seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" } plano do céu)

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/>: o atraso diferencial no plano do céu <c2/> (s) para uma linha de base interferométrica <c3/> (CCSDS 506.1-B). Testado: coincide com a projeção analítica exata <c4/> para um deslocamento conhecido alinhado à linha de base até { "1e-15" } s, com a magnitude de ângulo pequeno <c5/> e com o <b>nulo</b> (uma espaçonave co-alinhada com o quasar dá atraso diferencial exatamente zero).

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
seg-e3b340103825 = <c1/>: <c2/> = <c3/> (o atraso de grupo dispersivo <c4/> de partículas carregadas, <c5/>); <c6/> a coluna coronal <c7/> de classe Cassini (substituto analítico, não uma coroa calibrada); <c8/> a inversão de dispersão <c9/> que a DSN usa para remover o plasma. Testado: a lei 1/f² <c10/>; a coroa aumenta em direção à conjunção; e um <b>TEC injetado é recuperado com <{ "1" } %</b> (na verdade ≪ { "1e-9" } sem ruído) — <c11/>.

# text
seg-e1e265ab499a = Meios tropo / iono (reutilizam modelos GNSS)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/>: o segmento de estação terrestre de espaço profundo atravessa a mesma atmosfera terrestre que o pacote GNSS já modela, de modo que estes delegam para <c3/> (zênite de Saastamoinen + mapeamento de Niell, não dispersivo) e <c4/> (iono transmitido). Testado ligado + com sinal físico: tropo positivo e maior em baixa elevação do que no zênite; iono um atraso oblíquo não negativo (a fidelidade numérica é a dos próprios testes referenciados a folhas de dados do pacote GNSS).

# text
seg-44ba6e0411fd = Análise / emissão CCSDS-TDM { "503" } + ponte radiométrica

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
seg-18eafe936dcb = <c1/>: um leitor <b>e</b> gravador KVN (notação palavra-chave-valor) CCSDS 503.0-B-2 (cabeçalho + segmentos <c2/> / <c3/>; registros <c4/>/<c5/>/<c6/>/<c7/>). Testes (<c8/> + <c9/>): a fixture de referência é analisada nos campos nomeados esperados; <b>analisar→emitir→analisar é uma estrutura igual</b> (ida e volta semântica); a ponte <c10/> mapeia os registros inequívocos <c11/>/<c12/> para <c13/> (vias a partir de <c14/> <c15/>/<c16/>/<c17/>, banda a partir de <c18/>, km→m); um arquivo de vários segmentos reinicia a máquina de estados. <b>Omissão honesta em vez de suposição:</b> ângulos/frequências, bandas desconhecidas, épocas em dia do ano e sistemas de tempo não reconhecidos são <b>omitidos</b>, nunca mapeados incorretamente, e <c19/> é deixado em <c20/> para o chamador ponderar.

# text
seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (precisão do modelo ≫ piso publicado)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/>: os observáveis são cálculos geométricos exatos, de modo que o benchmark honesto é que o <b>erro numérico do próprio modelo está muito abaixo do piso de medição publicado da DSN/ESTRACK</b> — o modelo não é o gargalo de exatidão, o σ fornecido pelo chamador é. Cada teste calcula um observável de duas maneiras independentes (ou recupera uma verdade injetada) e afirma que o resíduo está abaixo do piso: a <b>distância</b> faz ida e volta com <{ "1" } mm ≪ o piso de ~{ "1" } m da medição de distância PN (DSN 810-005 mód. { "214" } / CCSDS 414.1-B); o <b>Doppler</b> coincide com a taxa de variação da distância retardada em forma fechada exata <c2/> até ~{ "10" }⁻⁶ m/s, várias × abaixo do piso de ~{ "0.05" } mm/s da banda X (DSN 810-005 mód. { "203" } / Moyer) — o resíduo é o piso da diferenciação de distância em f64 a ~{ "1" } AU, uma característica numérica, não um erro de modelagem; o <b>Δ-DOR</b> reproduz a projeção em forma fechada até um ângulo equivalente no plano do céu ≪ { "1" } nrad ≪ o piso de ~{ "1" }–{ "10" } nrad (DSN 810-005 mód. { "210" } / CCSDS 506.1-B); o <b>plasma</b> em dupla frequência recupera o atraso injetado com ≪ { "1" } %; e o atraso de <b>Shapiro</b> fica na faixa publicada de ~{ "100" }–{ "250" } µs da conjunção Terra–Marte. Os valores publicados são declarados e rotulados como especificações da DSN de <b>ordem de grandeza</b>, não como números exatos fabricados, e a documentação do módulo é explícita ao dizer que este benchmark mede a PRECISÃO DO MODELO, não a reprodução de uma passagem real (isso é D2 + TDM real).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = OD de espaço profundo de dinâmica reduzida — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = O terceiro marco do motor de navegação de espaço profundo: o <b>estimador</b> que transforma os observáveis radiométricos D1 em uma trajetória recuperada — um Square-Root Information Filter (SRIF) numericamente robusto com acelerações empíricas de dinâmica reduzida, um relógio de bordo de três estados, um modelo de arrasto de Marte e as derivadas parciais da medição radiométrica que ligam distância/Doppler ao estado do filtro, fechado de ponta a ponta por uma recuperação sintética de determinação de órbita em órbita baixa de Marte (LMO). <b>Escopo honesto:</b> a recuperação é um <b>circuito fechado sintético</b> (a verdade e o filtro compartilham o mesmo propagador de Marte, e as observações são o mesmo modelo de observáveis geométricos que o filtro inverte, mais ruído gaussiano injetado) — ela valida a <b>maquinaria do estimador</b>, não a fidelidade absoluta do modelo de forças de Marte; a verificação cruzada externa de nível DE é o crate <c1/> condicionado a kernel (D0.8b). Tudo abaixo é aditivo (os goldens de reprodutibilidade permanecem inalterados; mesmo SHA, sem regeneração).

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
seg-9d5fd8c1d37d = <c1/>: um filtro de informação de raiz quadrada de Bierman feito à mão — <c2/> triangular superior com <c3/>, vetor de informação <c4/>, atualizações de medição/tempo de Householder, aritmética com <c5/> puro (sem nalgebra). Testes: o SRIF sequencial coincide com a solução de mínimos quadrados ponderados em lote (<c6/>) em <b>estado e covariância até { "1e-9" }</b> em um problema linear-gaussiano projetado (<c7/>); a covariância recuperada <c8/> é <b>simétrica ({ "1e-12" }) e definida positiva por construção</b> após uma longa sequência de atualizações de medição/tempo (<c9/>, a Cholesky tem sucesso); e a informação se acumula (o traço de <c10/> diminui monotonicamente à medida que medições de geometria idêntica são incorporadas).

# text
seg-f9ffa1ef4688 = Acelerações empíricas de dinâmica reduzida (ajuste cruzeiro↔LMO)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/>: o filtro de nove estados <c2/> com acelerações empíricas RTN como estados de processo de Gauss–Markov de primeira ordem, a técnica de dinâmica reduzida do JPL/ESOC exposta como um único parâmetro <c3/> (quase dinâmico ⇒ suaviza o ruído em um arco balístico; quase cinemático ⇒ o nível empírico absorve uma manobra/arrasto não modelado). Testes: um filtro quase cinemático acompanha uma <b>manobra em degrau (propulsor)</b> com <½ do resíduo do quase dinâmico, enquanto o filtro quase dinâmico <b>suaviza melhor um arco balístico ruidoso</b> (<c4/>); variar a rigidez move o resíduo pós-ajuste <b>monotonicamente</b>, um contínuo e não uma chave (<c5/>).

# text
seg-9d5db4d63990 = Relógio de bordo de 3 estados (fase/freq/deriva, Q de van Loan, Allan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/>: estado de erro de fase + frequência fracionária + deriva de frequência com o <b>ruído de processo discreto exato de van Loan</b> e uma atualização estabilizada de Joseph. Testes: o <c2/> discretizado coincide com o polinômio de van Loan derivado à mão <b>até { "1e-12" }</b> e <b>se reduz exatamente ao Q do KalmanClock de dois estados quando a deriva = { "0" }</b> (um superconjunto estrito); uma propagação livre de vários passos faz a variância de fase crescer até a relação analítica de holdover do NIST SP { "1065" } por meio do termo de passeio de execução <c3/>; o estado de deriva <b>recupera uma verdadeira rampa de envelhecimento com <{ "5" } %</b>; um <b>perfil de Allan de classe USO é recuperado</b> (ADEV sobreposto em τ={ "1" } s dentro do critério de calibração) e o estimador permanece consistente em NEES (>{ "95" } % dentro de 3σ) e PSD durante uma execução com <c4/> severo. <c5/> traz os valores <c6/> citados de CSAC/USO/DSAC (USO: oscilador ultraestável; DSAC: Deep Space Atomic Clock) e o piso Doppler <c7/>.

# text
seg-8666d18daa2b = Arrasto atmosférico de Marte (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/>: um perfil de densidade neutra de Marte exponencial por partes (superfície ~{ "0.020" } kg/m³, altura de escala perto da superfície ~{ "11" } km, a média de baixa poeira do Mars-GRAM { "2010" } / MCD (Mars Climate Database)) e a aceleração de arrasto quadrática tomada em relação à atmosfera de Marte em <b>co-rotação</b>, mais uma variante <c2/> que o SRIF pode multiplicar. Testes: a densidade decresce monotônica e continuamente entre as faixas, a altura de escala recuperada perto da superfície é a física de ~{ "11" } km, o arrasto é <b>estritamente antiparalelo à velocidade relativa</b> (o produto vetorial se anula até { "1e-12" }) com uma magnitude LMO razoável de ~{ "3e-4" } m/s², e é linear no termo balístico. <b>Escopo honesto:</b> uma atmosfera de engenharia representativa, não um Mars-GRAM/MCD validado em voo com dependência de poeira/estação/hora local.

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
seg-6661d241cdaf = <c1/> / <c2/>: as derivadas parciais da distância na linha de visada <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) e da taxa de variação da distância <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) que ligam os observáveis D1 ao estado do filtro, mais a derivada parcial de frequência do relógio no Doppler de uma via <c5/>. Testes: ambas as derivadas parciais coincidem com uma <b>diferença finita central do observável até { "1e-6" }</b> (<c6/>, <c7/>); uma única atualização de distância <b>reduz a covariância na direção observada (linha de visada, LOS) em ≫{ "1000" }×</b> e a mantém definida positiva (PD), e uma atualização Doppler reduz a variância de <b>velocidade</b> na LOS (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = OD de ponta a ponta em LMO de Marte a partir de dados radiométricos

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/>: um arco verdadeiro de Órbita Baixa de Marte propagado sob a gravidade <c2/> gera <b>distância (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> de duas vias com ruído em relação a duas estações de rastreamento; o SRIF de dinâmica reduzida o recupera a partir de um estado inicial <b>perturbado em ~{ "2.7" } km</b>. Alcançado: RMS de posição convergido <b>≈ { "0.2" } m</b> (submétrico, bem dentro do critério de conclusão de metros a dezenas de metros) ao longo de um arco de 3 órbitas com cadência de { "30" } s, com a <b>covariância fatorada definida positiva em cada época</b> (a garantia do SRIF, afirmada o tempo todo). O <b>contínuo de ajuste cruzeiro→LMO</b> é exercitado de ponta a ponta: com uma verdade de arrasto não modelado que o modelo do filtro não tem, o parâmetro de dinâmica reduzida (rigidez { "1" }) recupera ~{ "14" } m contra ~{ "677" } m da execução quase dinâmica (rigidez { "0" }) — uma melhoria de { "48" }× devido ao nível empírico absorver o arrasto. <b>Escopo honesto:</b> circuito fechado sintético (verdade = o mesmo propagador que o filtro usa); a verificação cruzada externa de nível DE é o <c3/> condicionado a kernel (D0.8b), nunca executado aqui, sem rede.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Cenário PNT de espaço profundo e fusão de uma via + duas vias — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = O quarto marco do motor de navegação de espaço profundo: um <b>cenário de produto Mars-PNT</b> executável que reúne o corpo / referencial de Marte D0, os observáveis radiométricos D1 e a OD de dinâmica reduzida D2 em um único tipo de cenário <c1/>. Ele modela uma pequena <b>constelação de retransmissão ao estilo MARCONI</b> que transmite um sinal no espaço de uma via (acoplado ao relógio) e retransmite um enlace de duas vias (coerente, livre de relógio) para uma estação de espaço profundo, e navega três usuários de referência (transferência para Marte, orbitador em Órbita Baixa de Marte, ponto fixo na superfície) pelo <b>estimador de fusão conjunta de uma via + duas vias D3.1</b> — um SRIF de doze estados que amplia o bloco de órbita/empírico de dinâmica reduzida do D2 com um relógio de bordo de três estados. <b>Escopo honesto:</b> toda figura de mérito é o <b>limite de covariância formal</b> do estimador (posição 1σ / 3σ por época) e o RMS alcançado contra uma verdade de <b>circuito fechado sintético</b> (a verdade e o filtro compartilham a mesma dinâmica de Marte e o mesmo modelo de observáveis geométricos, mais ruído gaussiano injetado) — uma FoM de navegação simulada, <b>NÃO</b> um nível de proteção certificado para aviação, e <b>NÃO</b> uma afirmação de voo (sem modelo de falhas certificado, sem monitor de integridade, sem dados de rastreamento reais). Tudo abaixo é aditivo (os goldens de reprodutibilidade permanecem inalterados; mesmo SHA, sem regeneração).

# text
seg-b81920d2df82 = Fusão radiométrica conjunta de uma via + duas vias (a fusão supera cada uma isoladamente)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/>: o SRIF de dinâmica reduzida D2.2 ampliado com os três estados de relógio de bordo (<c2/>), ingerindo uma série temporal mista de distância/Doppler de <b>duas vias</b> (livre de relógio, fixando a órbita — colunas de relógio nulas na derivada parcial) e de <b>uma via</b> (acoplado ao relógio — a derivada parcial de frequência <c3/>) por meio de <c4/>. A estrutura calibrar-e-depois-navegar-livremente: as passagens de duas vias fixam a órbita, os dados de uma via então calibram o relógio e propagam livremente a órbita entre passagens com erro limitado pela estabilidade de Allan do relógio. Testado em <c5/> <c6/>: a solução <b>fundida</b> supera <b>qualquer tipo de enlace isolado</b>; o erro de propagação livre de uma execução somente de uma via cresce com a lacuna entre passagens de duas vias de forma consistente com o limite de Allan da classe do relógio; a covariância conjunta permanece SPD (simétrica definida positiva) o tempo todo.

# text
seg-26a4bfa8e6ad = Constelação MARCONI (raio areoestacionário, ocultação)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/>: um conjunto de cinco retransmissores — três retransmissores <b>areoestacionários</b> em <c2/> (o raio síncrono de Marte a partir de μ/taxa de rotação publicados; testado na faixa de <b>{ "20 400" }–{ "20 500" } km</b>) igualmente espaçados em { "120" }° de longitude com inclinação de { "5" }°, mais dois retransmissores em uma órbita circular mais alta ({ "1.4" }× areoestacionária) inclinada em { "60" }° para cobertura no plano do céu. Os estados dos retransmissores por época são integrados adiante sob a gravidade <c3/>; o teste de visibilidade por <b>ocultação por Marte</b> é a geometria corda-livra-esfera (<c4/>, testado: um retransmissor diametralmente oposto está oculto, um retransmissor sobre a cabeça está visível). <b>Escopo honesto:</b> uma geometria mínima representativa de transmissão mais retransmissão construída a partir de constantes de Marte publicadas — não um projeto específico de constelação de voo.

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
seg-3a01d13ad2e7 = <c1/> / <c2/> está ligado como o cenário <c3/> em todas as superfícies (D3.3): o executor da CLI, a ligação Python, a compilação WASM/playground e o despacho do servidor MCP encaminham todos para ele (<c4/>, teste de ida e volta <c5/>). Cenários de referência fornecidos: <c6/>, <c7/>, <c8/>. O resultado traz um <c9/> explícito rotulando a FoM como um limite de covariância (não um PL certificado), e as saídas <c10/> / <c11/> repetem o rótulo de honestidade.

# text
seg-28a49a455a74 = Metas MARCONI / LightShip reproduzidas: <b>orbitador < { "100" } m</b>, <b>rover < { "15" } m</b>

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/>: as metas publicadas do programa MARCONI / LightShip (orbitador < { "100" } m, superfície/rover < { "15" } m) reproduzidas em simulação. <b>Premissas compartilhadas:</b> a constelação MARCONI padrão de cinco retransmissores; cada retransmissor à vista dá uma distância+Doppler de uma via por época; uma passagem coerente de estação de duas vias a cada <b>{ "30" } min</b>; ruído de classe DSN (<b>σ de distância = { "1" } m, σ de Doppler = { "0.1" } mm/s</b>); o filtro de fusão conjunta de órbita de dinâmica reduzida + relógio de 3 estados iniciado a partir de um estado a priori <b>perturbado em ~{ "2.7" } km</b> (rigidez { "0.1" }); FoM = RMS de posição 3-D convergido na segunda metade do arco em relação à verdade sintética. <b>Orbitador</b> (LMO ~{ "400" } km / { "60" }° de incl., relógio <b>USO</b>, cadência de { "60" } s, arco de ~{ "2" } h ≈ uma órbita): RMS convergido alcançado <b>≈ { "0.40" } m</b> ≪ a meta de { "100" } m (média de { "3.1" } retransmissores à vista, covariância SPD o tempo todo). <b>Rover</b> (ponto fixo equatorial na superfície, relógio <b>USO</b>, cadência de { "30" } s, arco de ~{ "2" } h): RMS convergido alcançado <b>≈ { "5.1" } m</b> < a meta de { "15" } m (média de { "3.0" } retransmissores à vista, covariância SPD). <b>Ambas as metas foram atingidas sem afrouxar nenhuma asserção</b> — o USO é a classe <em>menos</em> capaz entre as classes realistas de relógio de bordo (um DSAC só ajudaria) e a cadência de 30 min de duas vias é conservadora para um cronograma rotineiro de rede de retransmissão, de modo que as premissas são fisicamente justas para um sistema de classe MARCONI, e não ajustadas para passar. <b>Escopo honesto:</b> reprodução simulada sob as premissas declaradas, NÃO uma afirmação de voo nem um nível de proteção certificado; a verdade sintética em circuito fechado compartilha a dinâmica de Marte e o modelo de observáveis do filtro.

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Tempo coordenado lunar — taxa relativística do relógio Terra-Lua (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Uma escala de Tempo Coordenado Lunar (LTC/TCL (TCL: Temps-Coordonnée Lunaire, o nome francês do Tempo Coordenado Lunar)) exige a taxa secular com que um relógio na superfície lunar corre em relação a um relógio no geoide terrestre (TT). <c1/> a calcula a partir de primeiros princípios: uma identidade pós-newtoniana de primeira ordem que soma a <b>diferença de autopotencial</b> (o potencial convencional do geoide <c2/> da IAU <c3/> menos o autopotencial da superfície da Lua <c4/>) e o <b>termo cinético (efeito Doppler de segunda ordem)</b> <c5/> a partir da velocidade geocêntrica da Lua (obtida por diferenças finitas da série lunar de Montenbruck-Gill em <c6/>). O termo dominante de autopotencial dá <b>≈ { "57.5" } µs/dia</b>, o termo cinético <b>≈ −{ "0.5" } µs/dia</b>, para um total de <b>≈ { "57" } µs/dia</b>. O cenário <c7/> informa essa taxa, o deslocamento LTC−TT acumulado ao longo de um horizonte e oferece suporte a um conjunto mínimo de variância inversa (um relógio de papel lunar); as conversões TT↔LTC fazem ida e volta com < { "1" } ns/dia.

# text
seg-beeb6561ef6b = Referência independente / escopo honesto

# text
seg-4500e65ede97 = Taxa relativística do relógio Terra-Lua (LTC/TCL)

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
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Referência independente: uma identidade relativística interna em forma fechada</b> (geopotencial <c6/> da IAU / das convenções do IERS e o autopotencial GM/r (GM: parâmetro gravitacional, G vezes a massa)), <b>verificada de forma cruzada contra a faixa publicada da taxa do relógio lunar [{ "56" }, { "59" }] µs/dia</b>. Testes (<c7/>): o termo de autopotencial ≈ { "57.5" } µs/dia, a velocidade da Lua ≈ { "1" } km/s, o termo cinético um pequeno valor negativo, o total dentro da faixa com os termos nomeados somando-o, o deslocamento LTC−TT de 1 dia ≈ { "57" } µs e uma ida e volta TT↔LTC com < { "1" } ns/dia. <b>Escopo honesto:</b> o valor de destaque em µs/dia é <b>dependente da referência</b> — depende das superfícies de referência escolhidas (geoide terrestre <c8/> contra um selenoide lunar), da janela de média temporal e das correções centrífuga/J₂ desprezadas abaixo de µs/dia — razão pela qual uma <b>faixa</b>, e não um único número certificado, é a saída publicada. Esta é uma verificação de autoconsistência <c9/>, <b>NÃO</b> uma validação externa, <b>NÃO</b> uma exatidão absoluta abaixo de nanossegundo e <b>NÃO</b> certificada para cronometragem operacional.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = VLBI geodésico lunar — atraso de campo próximo para uma linha de base na Terra observando um farol lunar (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Um observável de VLBI (interferometria de linha de base muito longa) geodésico para duas estações terrestres (uma linha de base) observando um sinal de uma via de um transmissor de classe NovaMoon na superfície lunar. A Lua está em <b>campo próximo</b>, não é uma onda plana, de modo que o atraso geométrico é a diferença exata de duas distâncias <c1/>, em vez da projeção no plano do céu. O observável completo acrescenta a diferença de deslocamento de relógio das estações e um termo de Shapiro do potencial terrestre diferenciado (reutilizado de <c2/>). As estações são posicionadas em coordenadas inerciais geocêntricas (GCRS) por meio de <c3/> + <c4/>; o farol por meio de <c5/> (Lua geocêntrica) + <c6/> (selenográfico→MCMF (MCMF: centrado na Lua, fixo à Lua)) + <c7/> (corpo fixo ME→inercial IAU-2015). O cenário <c8/> amostra o atraso, sua taxa por diferença finita e a correção de campo próximo ao longo de uma passagem.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = A <b>referência independente</b> é o observável Δ-DOR de onda plana da mesma base de código <c1/> em <c2/>: no limite de campo distante (um farol sintético a { "1e15" } m), o atraso geométrico deve colapsar em <c3/> até a precisão de máquina; à distância lunar verdadeira, a correção de campo próximo da curvatura da frente de onda é diferente de zero (dezenas a centenas de µs). As derivadas parciais do farol <c4/> (e as das estações) são verificadas por diferença finita central (erro relativo < { "1e-5" }).

# text
seg-107b9d328f69 = Atraso VLBI geodésico lunar + derivadas parciais

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
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Referência independente: <c8/></b> — o <c9/> de onda plana da mesma base de código (<c10/>) no limite de campo distante, mais <b>derivadas parciais por diferença finita</b>. Testes (<c11/>): magnitude da estação ≈ raio da Terra, distância do farol à distância lunar ({ "356" }–{ "407" } Mm), o atraso geométrico de campo distante coincide com <c12/> até < { "1e-9" } s, uma correção de campo próximo diferente de zero à distância lunar, derivadas parciais FD do farol/estação dentro de { "1e-5" } relativo, um termo de relógio exato e uma execução finita de cenário despachada por <c13/>. <b>Escopo honesto:</b> <c14/>, <b>NÃO</b> validado contra dados reais de VLBI. O movimento polar é descartado (<c15/>), de modo que as posições inerciais das estações carregam um erro de referencial de alguns metros; o farol mistura uma série da Lua de equador médio da data com um deslocamento fixo ao corpo ICRF (International Celestial Reference Frame) (<c16/>), uma incompatibilidade de consistência de referencial abaixo da fidelidade do modelo, mas não rigorosa; e não há iteração de tempo de luz, rotação da Terra durante o tempo de luz, meios (tropo/iono/plasma) nem termo de aberração além do Shapiro diferenciado. Não se alega TRL (nível de maturidade tecnológica), herança de voo nem endosso de agência. { "0.30" }: contra os tempos de luz do ANISE pela DE440, nenhum atraso deste caminho analítico está dentro de { "1" } ps (maior diferença { "24" } µs); a constatação é fixada.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (Terra e Lua DE440, eixos principais lunares DE440, orientação da Terra ITRF93, cada tempo de luz convergido no referencial baricêntrico), executado pelo cenário <c2/> quando os três caminhos de kernel estão definidos. <b>Referência independente: biblioteca</b> — tempos de luz convergidos do NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) até DSS-14/43/63, pré-registrado: { "75" } atrasos dentro de { "1" } ps (pior caso { "0.06" } ps), derivadas parciais do farol e da estação dentro de { "1e-6" }, em { "25" } épocas perto de J2000 (uma emenda depois que as { "2024" } épocas falharam na própria época de emissão em precisão dupla do SPICE, cerca de { "6" } ps, divulgada e fixada). O termo de Shapiro diferenciado, a taxa de atraso e a correção de campo próximo do cenário não são comparados.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = OD lunar conjunta multitécnica + relógio — recuperação simulada em circuito fechado (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Um ajuste de mínimos quadrados em lote de época única (instantâneo) (<c1/>, um passo QR de Householder desde { "0.30" }) que <b>funde as técnicas de VLBI geodésico, radiométrica/de medição de distância local lunar e de medição de distância entre satélites</b> em uma rede lunar SIMULADA para recuperar, <em>em conjunto</em>, a posição 3-D de uma estação na superfície lunar, as posições por satélite de uma pequena constelação e o deslocamento de relógio de cada ativo. Os observáveis são: ({ "1" }) atrasos de VLBI geodésico de linha de base na Terra até a estação lunar tratada como o farol (reutilizando <c2/>, inercial geocêntrico) — a técnica de destaque; ({ "2" }) distâncias radiométricas geocêntricas de estação terrestre→satélite (que multilateram a constelação a partir das estações terrestres bem distribuídas) e distâncias locais lunares estação↔satélite (distância euclidiana MCI (inercial centrado na Lua) mais o termo de relógio diferenciado); ({ "3" }) distâncias entre satélites (mesma forma); mais uma única pseudo-observação de sincronização de relógio de estação que ancora o deslocamento de relógio comum, de outro modo inobservável. O vetor de estado é <c3/>. <b>Não há propagação de modelo de forças dentro do solucionador</b> — os satélites são pontos fixos, distintos e ilustrativos sobre uma órbita lunar representativa; este é um ajuste instantâneo deliberadamente limpo. Internamente, as posições são escaladas e os relógios são estimados em metros equivalentes de distância para que a matriz normal permaneça bem condicionada em f64; as distâncias de VLBI e à distância lunar têm a média removida em torno da geometria nominal para que o jacobiano por diferenças finitas não sofra cancelamento catastrófico. O cenário <c4/> executa a solução com e sem as pernas de VLBI com a mesma semente/verdade e informa ambas as soluções mais o fator de melhoria de observabilidade da estação.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = O <b>resultado honesto de destaque</b>: a medição de distância local lunar a partir de uma estação polar até um punhado de satélites que ficam todos para um lado do céu deixa a posição da estação <b>fracamente observada ao longo de uma direção</b>, de modo que a solução somente com distâncias é mal condicionada e o erro 3-D recuperado da estação é grande (ou a solução não converge). <b>Acrescentar os atrasos de VLBI de linha de base na Terra torna observável a posição 3-D completa da estação</b>, e o erro recuperado da estação colapsa para o nível de metros. O teste <c1/> afirma que o erro da estação com VLBI é nitidamente (≥{ "5" }×) menor que o erro somente com distâncias na mesma verdade injetada — o VLBI restaurar a direção da estação, de outro modo inobservável, é o objetivo da fase.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = A <b>referência independente</b> é a consistência interna: um estado verdadeiro injetado (estação ~{ "50" } m/eixo, satélites ~{ "30" } m/eixo, relógios ~{ "1e-7" } s, com uma oscilação por componente com semente) é mapeado para observáveis sintéticos pelo <em>mesmo</em> modelo geométrico que o solucionador inverte, ruído gaussiano com semente é adicionado (padrões ilustrativos: VLBI σ ≈ { "1e-11" } s, distância σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; pesos <c1/>), e o estimador deve recuperar a verdade injetada dentro do ruído a partir de uma estimativa inicial de zeros. Um NEES médio de Monte Carlo <c2/> sobre sementes (<c3/>) fica dentro de uma faixa folgada em torno de <c4/>, uma verificação de realismo da covariância.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: a álgebra linear da solução)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Referência independente de { "0.30" }: P2</b> — o numpy { "2.4.6" } (LAPACK gelsd e inv) recalcula cada passo de Gauss-Newton, a solução ponderada convergida, os sigmas formais e o erro da estação nos jacobianos versionados de seis redes (<c4/>, passos dentro de { "2.4e-11" }, sigmas dentro de { "1.3e-11" }); os modelos físicos de observação e as magnitudes permanecem MODELLED. <b>Referência independente anterior: <c5/></b> — recuperação de uma verdade simulada injetada + consistência de covariância por NEES. Testes (<c6/>): a fusão completa recupera a verdade (estação < { "5" } m, RMS dos satélites < { "5" } m, relógios < { "1e-8" } s, convergido); o VLBI restaura a observabilidade 3-D da estação (erro da estação ≥{ "5" }× menor com VLBI do que somente com distâncias na mesma verdade); determinístico (mesma semente → solução idêntica bit a bit, semente diferente → solução diferente, mas recuperada); NEES médio dentro de uma faixa folgada em torno de <c7/>; números informados finitos/protegidos mesmo quando a solução somente com distâncias é mal condicionada; cenário despachado por <c8/>. <b>Escopo honesto:</b> esta é uma <b>recuperação simulada em circuito fechado</b> — a verdade compartilha o modelo de observação — <b>NÃO</b> uma validação com dados reais; sem propagação de modelo de forças dentro do solucionador; as posições dos satélites e a geometria das estações terrestres/lunares são ilustrativas. Não se alega TRL, herança de voo nem endosso de agência.

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
seg-240271b9d7de = Enquanto <c1/> <em>aplica</em> a orientação do corpo lunar WGCCRE da IAU { "2015" } (um modelo direto), este módulo <em>estima</em> (realiza) um referencial lunar a partir de uma rede de coordenadas pontuais estimadas ligadas a um datum. O núcleo de estimação é uma clássica <b>transformação de similaridade (Helmert) de 7 parâmetros</b> — três de translação, três de rotação de ângulo pequeno e um de escala — que mapeia os pontos <c2/> (referencial estimado) para <c3/> (referencial do datum) como <c4/>, com <c5/> construído a partir de <c6/>. Os sete parâmetros <c7/> são estimados a partir de ≥ { "3" } pares de pontos não colineares por mínimos quadrados ponderados por meio de <c8/>: o modelo direto prediz cada <c9/> a partir de seu <c10/> e achata as três componentes de todos os pontos no vetor de observáveis, as coordenadas observadas do datum formam <c11/>, os pesos são <c12/> e a solução parte de <c13/>. Os ângulos de rotação são estimados em µrad e a escala em ppb para que o jacobiano por diferenças finitas permaneça bem escalado na magnitude de coordenadas da superfície lunar (~{ "1.7e6" } m). Um pequeno <c14/> compõe a pequena rotação realizada pela orientação IAU corpo→ICRF (<c15/>) e devolve o deslocamento angular pequeno residual do referencial realizado em torno dos eixos ICRF — uma mudança de referencial de expressão deliberadamente simples, <b>não</b> uma estimativa independente do polo lunar.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = A <b>referência independente</b> é a consistência interna: uma transformação de Helmert conhecida (translação ~dezenas de m, rotação ~µrad, escala ~{ "1e-7" }) é <em>injetada</em> em uma rede sintética de pontos bem distribuídos (lat/lon selenográficas variadas → MCMF, alguns pontos em altitude), ruído gaussiano com semente é adicionado e o ajuste deve recuperar os parâmetros injetados. Em dados sem ruído, a recuperação é até ~a precisão de máquina (translação < { "1e-6" } m, rotação < { "1e-9" } rad, escala < { "1e-12" }); com ruído de metros, os parâmetros recuperados ficam dentro de alguns × o σ formal e o resíduo RMS pós-ajuste fica perto do nível de ruído. O cenário <c1/> informa o datum recuperado, o erro de recuperação por parâmetro em relação à verdade injetada, o resíduo RMS pós-ajuste e a ligação de orientação ICRF da rotação realizada.

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
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referência independente: <c6/></b> — recuperação de uma transformação de similaridade de 7 parâmetros injetada mais a identidade algébrica de ida e volta de <c7/>. Testes (<c8/>): recuperação sem ruído da transformação injetada (translação < { "1e-6" } m, rotação < { "1e-9" } rad, escala < { "1e-12" }); recuperação com ruído dentro de alguns × σ e resíduo RMS perto do nível de ruído; ida e volta aplicar-depois-inverter; determinístico (mesma semente → idêntico bit a bit, semente diferente → diferente, mas recuperado); a ligação ICRF de rotação zero é zero e a ligação preserva a magnitude da rotação; cenário despachado por <c9/>. <b>Escopo honesto:</b> esta é uma verificação de <b>autoconsistência</b> — ela recupera uma transformação <em>injetada</em> em uma rede <em>sintética</em> — <b>NÃO</b> uma realização do referencial lunar contra dados reais de rastreamento / VLBI, e não alega exatidão absoluta de referencial. A ligação de orientação ICRF é uma simples mudança de expressão, não uma estimativa independente do polo. Não se alega TRL, herança de voo nem endosso de agência.

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
seg-9b4f13e138e4 = Este módulo <em>compõe</em> peças já construídas em uma análise de <b>volume de serviço</b> de navegação lunar: ele varre uma grade selenográfica de latitude/longitude ao longo de um horizonte de tempo contra uma constelação de órbita lunar <b>ilustrativa, de fonte pública, de classe Moonlight / LCNS</b> (LCNS: Lunar Communications and Navigation Services) e informa DOP / cobertura / disponibilidade mais um envelope generalizado de nível de proteção ARAIM lunar. As duas reutilizações são determinantes e explícitas. A <b>geometria de DOP</b> é o kernel <b>VALIDATED</b> (contra o gnss_lib_py) <c1/> — <c2/> é um fino filtro de máscara de elevação mais esse kernel, e um teste afirma a identidade (<c3/> é igual a um <c4/> direto nas mesmas posições visíveis). A <b>integridade</b> reutiliza a maquinaria ARAIM lunar da LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliza o nível de proteção existente do polo sul para um ponto arbitrário da superfície, e um teste afirma que ele <b>se reduz ao caso do polo sul</b> (no polo sul, com a mesma geometria/orçamento, ele devolve exatamente o resultado existente de <c8/> até < { "1e-9" }).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Os parâmetros da constelação são uma <b>aproximação ilustrativa de descrições públicas da ESA</b> da classe do sistema (≈ { "4" } satélites em órbitas lunares elípticas congeladas que favorecem a cobertura do polo sul — apolúnio sobre o hemisfério sul; { "4" } é o padrão da biblioteca, e o <c1/> incluído define { "8" } porque o nível de proteção precisa de pelo menos { "6" } à vista). Eles <b>não</b> são a efeméride real do Moonlight/LCNS e não implicam <b>nenhuma</b> afiliação, endosso, herança, certificação ou TRL. A composição (cobertura / disponibilidade / integridade) é <b>MODELLED</b>: um conjunto de retransmissores kepleriano circular/elíptico (não uma efeméride LCNS / NRHO (órbita de halo quase retilínea) { "9" }:{ "2" } corrigida diferencialmente), uma Lua de rotação média (sem libração física / polo em precessão) e parâmetros de integridade LunaNet LNIS publicados. Ela demonstra o <em>método</em> de volume de serviço, não um número de disponibilidade operacional. Determinístico (geometria pura; sem aleatoriedade). O cenário <c2/> informa a porcentagem de cobertura, os envelopes de contagem de visíveis e de PDOP, o envelope HPL/VPL sobre o volume e a disponibilidade do nível de proteção em relação ao limite de alerta.

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
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Geometria DOP validada por reutilização</b> do kernel <c7/> validado com o gnss_lib_py; a integridade reutiliza o ARAIM lunar publicado da LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Testes (<c9/>): <c10/> é uma identidade sobre o kernel validado; <c11/> no polo sul é igual ao PL existente de <c12/> até < { "1e-9" } (reduz-se ao caso do polo sul); a cobertura é não decrescente com o tamanho da constelação; a visibilidade respeita a máscara de elevação; o cenário é determinístico e é despachado por <c13/>. <b>Escopo honesto:</b> a constelação é <b>ilustrativa, de fonte pública, NÃO afiliada à ESA</b> — não é a efeméride real do Moonlight/LCNS; a composição de cobertura/disponibilidade/integridade é <b>MODELLED</b> (retransmissores keplerianos circulares/elípticos, Lua de rotação média, parâmetros LNIS publicados), <b>NÃO</b> um número operacional de disponibilidade do Moonlight. Não se alega TRL, herança de voo nem endosso de agência.

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
seg-8f94c4bf3fe6 = Um análogo lunar de DGNSS (navegação diferencial por satélite) / SBAS: uma <b>estação de referência de classe NovaMoon</b> em uma localização selenográfica <em>conhecida</em> calcula correções diferenciais por satélite a partir de uma constelação <b>ilustrativa, de fonte pública, de classe Moonlight / LCNS</b>, e um usuário itinerante afastado dela por uma linha de base as aplica, de modo que os erros de efeméride transmitida de <b>modo comum</b> se cancelam. Cada satélite <c1/> traz um vetor comum injetado de erro de órbita 3-D <c2/> e um erro comum de relógio <c3/>. O resíduo de pseudodistância da estação de referência é a correção <c4/>; o erro bruto do usuário é <c5/>; o erro corrigido do usuário é a diferença entre eles <c6/>. O <b>termo de relógio <c7/> se cancela exatamente</b> (é idêntico nas duas observações), e o <b>termo de órbita colapsa na projeção sobre a diferença dos dois vetores unitários de linha de visada</b>, que → { "0" } quando a linha de base → { "0" } (o piso de descorrelação espacial) e cresce ≈ linearmente com a linha de base. Os erros de distância corrigidos por satélite são mapeados pela geometria do usuário por uma pequena solução instantânea de mínimos quadrados ponderados, de poucas dependências (estado <c8/> via <c9/>; um viés constante de distância é absorvido pela incógnita de relógio em vez de corromper a posição) para dar o erro de <b>posição</b> do usuário. O <b>nível de proteção do usuário reutiliza a maquinaria de nível de proteção SBAS DO-229E</b> (<c10/>, fatores K de Aproximação de Precisão) com o σ residual diferencial como o orçamento de erro de 1-σ de cada satélite.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = O NovaMoon é referenciado <b>apenas como uma classe de sistema</b> (uma descrição pública de uma estação de referência lunar); a constelação reutiliza a <c1/> ilustrativa de fonte pública. São parâmetros ilustrativos para exercitar o <em>método</em> diferencial, <b>não</b> uma efeméride real, e não implicam <b>nenhuma</b> afiliação, endosso, herança, certificação ou TRL. O cenário <c2/> informa o erro de posição do usuário com e sem correções, o fator de redução, a curva de erro contra linha de base e o nível de proteção. Na configuração padrão, o erro corrigido do usuário a uma linha de base de { "50" } km é ≈ { "0.008" } m contra ≈ { "24" } m sem correção (uma redução de ~{ "3000" }×), e ≈ { "0" } com linha de base zero.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = A <b>referência independente</b> é a consistência interna: o cancelamento de modo comum é uma <b>identidade algébrica exata</b> (com <c1/>, erro corrigido < { "1e-6" } m com linha de base zero; o termo de relógio se cancela até a precisão de máquina em qualquer linha de base), o resíduo <b>cresce monotonicamente com a linha de base</b>, e o nível de proteção é o <b>mesmo algoritmo DO-229E</b> contra o qual a pilha SBAS é fixada. O resíduo de descorrelação espacial é um modelo geométrico de <b>primeira ordem</b>, <b>não</b> um modelo de descorrelação ajustado a partir de rastreamento lunar real.

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
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referência independente: <c6/></b> — a identidade de cancelamento de erro diferencial mais a reutilização da maquinaria de nível de proteção SBAS DO-229E (<c7/>). Testes (<c8/>): com linha de base zero, o erro corrigido do usuário e cada erro de distância corrigido por satélite são ~{ "0" } (< { "1e-6" } m) e ≪ o erro sem correção; o termo de relógio se cancela exatamente em qualquer linha de base (caso de erro de órbita zero); o erro corrigido cresce monotonicamente com a linha de base, permanecendo ≪ o não corrigido em linhas de base modestas; o diferencial supera o autônomo por uma margem clara (> { "2" }×); o nível de proteção é igual a uma chamada direta de <c9/> e escala com o σ residual; uma geometria subdeterminada devolve <c10/>; o cenário é determinístico (com semente) e é despachado por <c11/>. <b>Escopo honesto:</b> <b>MODELLED</b> — o cancelamento de modo comum é uma identidade exata, mas o resíduo de descorrelação espacial é um modelo geométrico de <b>primeira ordem</b>, <b>NÃO</b> um modelo de descorrelação ajustado a partir de rastreamento lunar real, e isto <b>NÃO</b> é validado com dados reais. O NovaMoon é referenciado <b>apenas como uma classe de sistema</b> (ilustrativo, de fonte pública, <b>não afiliado à ESA</b>). Não se alega TRL, herança de voo nem endosso de agência.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Exportação de interoperabilidade lunar — CCSDS OEM e KIF alinhados à LunaNet/IOAG, com aderência à norma na ida e volta (<c1/>)

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
seg-39b875078d27 = O referencial lunar, a escala de tempo lunar e a efeméride lunar são exportados em <b>formas de intercâmbio baseadas no CCSDS e alinhadas à LunaNet/IOAG (IOAG: Interagency Operations Advisory Group)</b>. Esta fase <b>não</b> inventa um formato de transmissão: ela <b>reutiliza</b> o emissor e o analisador CCSDS OEM (Orbit Ephemeris Message) { "2.0" } já existentes no crate (<c1/> / <c2/>) e o envelope do Kshana Interchange Format (<c3/>), reetiquetados para o contexto lunar. <c4/> define o <c5/> do OEM como o <b>referencial de corpo lunar WGCCRE da IAU { "2015" }</b> (<c6/> Terra-média ou <c7/> de eixos principais), <c8/> como a <b>escala de tempo lunar</b> (<c9/> / <c10/> / <c11/>) e <c12/> como <c13/>, sobre uma efeméride de amostra <b>ilustrativa, de fonte pública, de classe LCNS</b> (posições de <c14/>, velocidade por diferença finita central). <c15/> emite um descritor de tempo lunar alinhado à LunaNet/IOAG (id da escala, taxa secular em µs/dia de <c16/>, a faixa publicada de { "56" }–{ "59" } µs/dia, superfície de referência) que faz ida e volta por serde_json. <c17/> envolve o OEM + descritor + rótulo de referencial no envelope KIF existente com o rótulo de honestidade MODELLED.

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
seg-bbfce5323abb = A <b>referência independente</b> é a ida e volta / aderência à norma dos campos. Como <c1/> traz <em>ambas</em> as direções, o OEM faz ida e volta por <c2/> (de volta a um segmento igual, com o referencial/tempo lunar e a contagem de estados preservados) <b>e</b> é verificado de forma independente por <c3/>, que confirma que toda palavra-chave obrigatória de cabeçalho CCSDS/LunaNet está presente, que <c4/> traz um token <c5/> lunar e que <c6/> não está vazio, que o enquadramento <c7/> se mantém e que as linhas de dados de posição+velocidade estão bem formadas — devolvendo um resultado estruturado de sucesso mais a lista de campos presentes/ausentes, de modo que uma exportação quebrada (por exemplo, um <c8/> descartado) é detectada e nomeada. Os metadados de tempo fazem ida e volta por <c9/>, e o envelope KIF faz ida e volta por <c10/> até artefatos iguais que carregam o rótulo MODELLED.

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
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Referência independente: <c7/></b> — ida e volta determinística (CCSDS OEM via <c8/>; KIF via <c9/>; metadados de tempo via serde_json) mais aderência à norma dos nomes de campo contra a semântica de campos publicada do CCSDS OEM + LunaNet/IOAG. Testes (<c10/>): o OEM exportado traz os tokens lunares <c11/> (<c12/>/<c13/>) e <c14/> (<c15/>/<c16/>), <c17/>, o objeto e linhas de dados bem formadas; os metadados de tempo lunar fazem ida e volta (taxa/faixa/referência) e rejeitam lixo; o envelope KIF é serializado e desserializado para um valor igual, com o rótulo de honestidade MODELLED presente; um OEM deliberadamente quebrado (sem <c18/>) falha em <c19/> e é relatado como ausente; o cenário é despachado por <c20/>. <b>Escopo honesto:</b> os <b>nomes/unidades</b> dos campos estão alinhados a padrões <b>públicos</b> (CCSDS 502.0-B OEM, referenciais lunares WGCCRE da IAU { "2015" }, a LunaNet Interoperability Specification / arquitetura lunar do IOAG); a exportação é <b>MODELLED</b> — a ida e volta determinística + a aderência à norma dos nomes de campo são a referência independente, isto <b>NÃO</b> é um teste certificado de aderência à norma de interoperabilidade, a efeméride é <b>ilustrativa, de fonte pública, não afiliada à ESA</b>, e não se alega TRL, herança de voo nem endosso de agência.

# text
seg-69a214b7236d = Previsões pré-registradas

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Uma previsão pré-registrada é um resultado MODELLED congelado antes de existirem dados para avaliá-lo, com o protocolo de avaliação fixado ao mesmo tempo. Não é uma validação e não acrescenta nenhuma linha ao registro. Cada uma fica em <c1/>, com suas entradas congeladas, seu resultado e os hashes SHA-256 de ambos, e <c2/> falha se qualquer byte congelado mudar; uma premissa alterada é respondida por uma nova previsão datada ao lado da antiga, nunca editando-a.

# text
seg-e65d79893e2c = Previsão

# text
seg-f9e2d4b52b79 = Congelada

# text
seg-dd68891f75e2 = Avaliada contra

# text
seg-d5a09f26a028 = Cobertura da estação de referência lunar

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = exatidão, disponibilidade, cobertura e níveis de proteção publicados de uma estação diferencial lunar polar sul, por qualquer parte

# text
seg-4e7d9449a880 = ainda não avaliada (sem resultados publicados)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Representatividade da demonstração e registro de lacunas até o voo (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = Um resultado de simulação só é útil como evidência se declara, de forma explícita, ao que está ancorado, o que assume e o que ainda o separa de um sistema de voo. O registro de representatividade torna isso uma saída de primeira classe, verificada por máquina: um registro <c1/> traz os <c2/>s externos da demonstração, suas premissas modeladas, suas <c3/>s até o voo (cada uma com a fase/atividade que a fecharia) e a faixa de TRL para a qual ele é representativo. É o complemento por resultado da matriz <c4/> em nível de capacidade.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = A <b>referência independente</b> é um conjunto de invariantes em forma fechada, impostas por <c1/>: um registro <c2/> deve listar pelo menos uma âncora <c3/> (uma simulação não pode ser validada contra si mesma); um registro <c4/> deve listar pelo menos uma lacuna até o voo e não pode alegar uma faixa de TRL representativa acima de { "4" } (a maturação além disso exige evidência de hardware/voo, o que é uma lacuna, não uma saída de simulação); a faixa de TRL deve estar bem formada; e um registro <c5/> não deve afirmar nada. Essas invariantes operacionalizam a disciplina "representatividade justificada + lacunas restantes até o voo claramente identificadas".

# text
seg-6b29111096ca = Registro de representatividade e de lacunas até o voo

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
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Referência independente: <c8/></b> — invariantes de honestidade em forma fechada ligadas à fronteira entre status/tipo de referência independente de <c9/>. Testes (<c10/>): um registro validado sem âncora externa falha; uma âncora interna (ReferenceImpl) não satisfaz o validado; um registro modelado sem lacuna falha; um registro modelado acima de TRL { "4" } falha; faixas de TRL malformadas são detectadas; o registro é serializado em JSON com os campos esperados e gera um relatório legível. <b>Escopo honesto:</b> o registro verifica a <em>classificação</em> da evidência de um resultado — ele não prova que as âncoras nomeadas resolvem para testes ativos (esses são curados, exatamente como a matriz <c11/>); a afirmação "verificado por máquina" se restringe às invariantes de status/âncora/lacuna/TRL.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Evidência unificada de compromisso quântico versus clássico (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Toda área de aplicação de PNT quântico responde à mesma pergunta da mesma maneira: fixar um referencial de comparação (cenário + semente + versão do motor), encaminhar um candidato quântico e uma linha de base clássica por um único caminho de código neutro, pontuá-los em figuras de mérito comuns e informar — com um intervalo de confiança e um rótulo honesto de validado/modelado — onde o quântico vence e onde não vence. <c1/> dá a essa resposta uma forma única, de modo que as verticais de temporização, navegação e detecção de anomalias emitem o <b>mesmo</b> objeto reprodutível e honestamente rotulado. Ele não reimplementa nenhum compromisso: os números por FoM vêm dos motores existentes (<c2/>, <c3/> e os módulos verticais); isto é o contrato mais o invólucro de reprodutibilidade/representatividade, construído sobre o registro de representatividade e os rótulos de verificação.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = A <b>referência independente</b> são identidades de benefício/vencedor em forma fechada mais um invólucro fiel da saída de compromisso existente. <c1/>: a razão de benefício tem a polaridade correta (orientada de modo que <c2/> sempre significa que o lado quântico é melhor, tanto para FoMs de holdover em que mais é melhor quanto para FoMs de erro em que menos é melhor); um objeto de evidência construído a partir de um <c3/> real reproduz suas razões de benefício; evidência desonesta é rejeitada (uma representatividade modelada sem lacuna, ou uma FoM <c4/> cujo registro de compromisso não traz âncora externa); o JSON é determinístico e traz os campos de referencial/semente/motor/FoM/representatividade.

# text
seg-ae87cea429ba = Evidência de compromisso quântico versus clássico

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Referência independente: <c5/></b> — identidades de benefício/vencedor em forma fechada + invólucro fiel de <c6/>; honestidade ligada ao registro de representatividade e à fronteira entre status/tipo de referência independente da verificação. Testes (<c7/>) como acima. <b>Escopo honesto:</b> o arcabouço padroniza <em>como</em> um compromisso é relatado e reproduzido; a física subjacente por FoM é a que o motor contribuinte fornece, carregada com seu próprio rótulo validado/modelado — <c8/> não promove uma FoM modelada a validada.

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
seg-c206fc7d58d6 = Um lugar único que expõe os dispositivos de PNT quântico que o demonstrador compara — relógios ópticos / de íons aprisionados / de íons de mercúrio, relógios de referência clássicos, o interferômetro de átomos frios e enlaces de transferência de tempo — cada um como um <c1/> que traz sua especificação de destaque e um registro de representatividade. A maior parte da física dos dispositivos é <b>reutilizada</b> (estabilidades de relógio de <c2/> e <c3/>; o interferômetro de átomos frios de <c4/>/<c5/>; enlaces ópticos/RF clássicos de <c6/>). O único modelo realmente novo é o <b>enlace de transferência de tempo por emaranhamento / fóton único</b>, cuja precisão de temporização é limitada por ruído de disparo: <c7/> na taxa de coincidências detectadas <c8/> e na integração <c9/>, degradada por uma penalidade de contagens de escuro <c10/> e com piso dado por um sistemático irredutível.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = A <b>referência independente</b> são os coeficientes publicados de relógio/CAI reutilizados mais identidades em forma fechada de ruído de disparo/perda. <c1/>: a ordenação reutilizada das estabilidades dos relógios é razoável (rede óptica < íon de mercúrio < CSAC em σ_y({ "1" } s)); a precisão do emaranhamento melhora como <c2/> (uma integração { "4" }× maior divide σ pela metade) quando limitada por ruído de disparo; a taxa de coincidências detectadas cai { "10" }× a cada { "10" } dB de perda do enlace; as contagens de escuro degradam a precisão monotonicamente; o piso sistemático limita a precisão inferiormente; todo cartão de dispositivo é um registro de representatividade válido e modelado.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Referência independente: <c5/></b> — coeficientes publicados de relógio/CAI reutilizados + identidades em forma fechada de ruído de disparo/perda para o enlace de emaranhamento. Testes (<c6/>) como acima. <b>Escopo honesto:</b> os parâmetros de dispositivos de relógio/CAI são reutilizados dos modelos de coeficientes publicados já existentes no motor; o modelo do enlace de emaranhamento é MODELLED a partir do comportamento publicado de sincronização quântica de relógios, com valores ilustrativos de fonte pública de taxa de pares/eficiência/perda — ele <b>não</b> é validado contra um enlace medido, e o hardware real de fonte/canal/detector é uma lacuna até o voo declarada.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Temporização quântica confiável — cadeia de ponta a ponta, disseminação segura, anomalia + compromisso (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = O cenário <c1/> compõe a cadeia de temporização de que um demonstrador de PNT quântico precisa: um orçamento de tempo do usuário de ponta a ponta (erro de navegação livre do relógio de referência e precisão de temporização do enlace combinados em quadratura) para uma cadeia <b>quântica</b> (relógio de rede óptica + enlace de emaranhamento/fóton único) contra uma cadeia <b>clássica</b> (CSAC + enlace RF de duas vias); um <b>nível de proteção de temporização</b> (TPL, reutilizado de <c2/>) que limita o erro de tempo não detectado; uma <b>figura de mérito de segurança contra ataques de atraso/repetição</b> <c3/> a uma taxa de falso alarme declarada (reutilizada de <c4/>); uma <b>probabilidade de detecção de anomalia de relógio + latência de detecção de mudança por CUSUM (soma cumulativa)</b>; e a comparação quântico-versus-clássico como <c5/> honesto que traz um registro de representatividade + lacunas até o voo.

# text
# c1: detection::analytic_pd
# c2: analytic_pmd
# c3: timetransfer_chain::tests
# c4: is_honest()
seg-6fa095264bdc = A <b>referência independente</b> é um orçamento em quadratura em forma fechada sobre kernels reutilizados e validados separadamente (ADEV contra Stable32/NIST; o limite do TPL; <c1/>/<c2/>). <c3/>: a precisão quântica melhora com o tempo de integração; a cadeia quântica pode vencer <em>e</em> pode perder na FoM de precisão (honesto — não é uma vitória universal; um enlace com muita perda inverte o resultado); o nível de proteção é finito e positivo; a FoM de segurança está em [{ "0,1" }] e cresce com o atraso do ataque; a probabilidade de detecção de anomalia é monotônica na magnitude da falha; e a evidência de compromisso é internamente honesta (<c4/>).

# text
seg-42a7d1170cc3 = Temporização quântica confiável (cadeia + disseminação segura + anomalia + compromisso)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referência independente: <c5/></b> — orçamento em quadratura em forma fechada sobre kernels validados reutilizados (ADEV/Stable32-NIST, limite do TPL, Pd/Pmd analíticos de detecção); honestidade ligada ao registro de representatividade. Testes (<c6/>) como acima. <b>Escopo honesto:</b> os parâmetros de relógio/enlace são ilustrativos, de fonte pública; o enlace de emaranhamento é o modelo MODELLED limitado por ruído de disparo de <c7/>; isto modela a <em>classe</em> de sistema de temporização confiável — ele <b>não</b> é validado contra um enlace medido de ponta a ponta, e o hardware real de relógio/enlace/canal espacial é uma lacuna até o voo declarada; não se alega TRL, herança de voo nem certificação.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = Navegação quântica sem GNSS (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = O cenário <c1/> compara a navegação por estimativa durante uma interrupção do GNSS entre um orçamento inercial <b>quântico</b> (um acelerômetro interferômetro de átomos frios, reutilizado de <c2/>/<c3/>, cujo piso de ruído branco CAI é validado até ~{ "2" } ordens de grandeza de Freier et al. { "2016" }) e um INS <b>clássico</b> de grau de navegação. Ele informa o crescimento do erro de posição ao longo da navegação livre, o tempo de holdover até um limiar de posição e o compromisso quântico-versus-clássico como <c4/> honesto. A observabilidade é declarada com honestidade: sem correção externa durante a interrupção, o viés do acelerômetro é inobservável, de modo que o erro de posição cresce sem limite (≈ ½·viés·t² mais um termo de passeio aleatório de velocidade); um sensor quântico de viés menor <em>retarda</em> esse crescimento, mas não fecha a lacuna — somente uma correção externa fecha.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = A <b>referência independente</b> são os orçamentos inerciais reutilizados (<c1/>/<c2/>, ambos implementando o trait <c3/>) mais identidades de deriva em forma fechada. <c4/>: o orçamento quântico supera o clássico em uma interrupção longa (menor erro, holdover mais longo); o erro cresce com a duração da interrupção para ambos (a lacuna de observabilidade); a vantagem depende da interrupção, não é um fator de vitória constante (a curva quântica é dominada por ruído na navegação livre curta, dominada por viés na longa); a evidência de compromisso é internamente honesta.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referência independente: <c5/></b> — orçamentos inerciais reutilizados (CAI validado por reutilização ~{ "2" } ordens contra Freier { "2016" }; deriva clássica em forma fechada); honestidade ligada ao registro de representatividade. Testes (<c6/>) como acima. <b>Escopo honesto:</b> uma comparação estática de orçamentos de navegação por estimativa, não um filtro dinâmico em trajetórias reais; o viés inobservável sem correção é declarado; os parâmetros dos dispositivos são ilustrativos, de fonte pública; modela a <em>classe</em> de navegação quântica sem GNSS — o hardware real de IMU de átomos frios, uma plataforma dinâmica e o ambiente de voo são lacunas até o voo declaradas; não se alega TRL/voo/certificação.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Detecção de falhas / anomalias para sistemas PNT quânticos (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = O cenário <c1/> define um catálogo rotulado de falhas de PNT quântico (salto de frequência de relógio, deriva, perda de travamento; degrau de viés de sensor, perda de dados), pontua uma estatística de detecção em janelas nominais versus com falha e informa a discriminação do detector como uma AUC de ROC e uma falha mínima detectável a uma taxa de falso alarme fixa. O ângulo quântico-versus-clássico: uma referência de relógio quântico mais estável reduz o ruído σ do monitor, de modo que ele detecta falhas menores — emitido como <c2/> honesto com um registro de representatividade.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = A <b>referência independente</b> é uma AUC em forma fechada para a estatística de detecção gaussiana (nominal <c1/>, falha <c2/> ⇒ <c3/>) verificada de forma cruzada contra o <c4/> validado externamente (validado contra o scikit-learn) e os limiares analíticos de <c5/>. <c6/>: a AUC analítica coincide com valores conhecidos ({ "0.5" } em μ={ "0" }, →{ "1" } para μ/σ grande, monotônica); o IC de AUC por bootstrap empírico envolve a forma fechada; o monitor quântico tem AUC maior e uma falha mínima detectável menor; a vantagem desaparece para falhas enormes (ambos detectam perfeitamente — não é uma margem universal); o catálogo tem cinco classes rotuladas; o compromisso é internamente honesto.

# text
seg-9dda4ab0647a = Detecção de falhas/anomalias para PNT quântico

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
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Referência independente: <c7/></b> — AUC gaussiana em forma fechada verificada de forma cruzada contra a AUC por bootstrap de <c8/>, validada externamente (contra o scikit-learn), e os limiares analíticos de <c9/>. Testes (<c10/>) como acima. <b>Escopo honesto:</b> a estatística de detecção é um modelo gaussiano, não telemetria real; o catálogo de falhas é sintético rotulado; os níveis de ruído do monitor quântico/clássico são ilustrativos, de fonte pública; modela a <em>classe</em> de detecção de anomalias de PNT quântico — telemetria real de hardware com rótulos de verdade de referência é uma lacuna até o voo declarada; não se alega TRL/voo/certificação.

# text
seg-24ad75143bed = Aderência às normas — formatos de intercâmbio, orçamento de enlace e integridade (verificações com referência independente externa)

# text
seg-9d31773e0ecd = Estas normas são validadas ao recuperar os <b>exemplos resolvidos literais / valores de referência publicados nas próprias normas</b> (ou em uma implementação de referência independente), e não pela ida e volta do próprio Kshana. Recuperar o exemplo de anexo da própria norma é a verificação de aderência à norma mais forte disponível para um analisador de formato de intercâmbio.

# text
seg-7ec3d508c64f = Referência independente externa

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/>: <c2/> recupera as épocas exatas e os vetores de estado X/Y/Z/Ẋ/Ẏ/Ż do exemplo OEM em KVN da <b>CCSDS 502.0-B-3, Anexo G §G6, Figura G-11</b> ("OEM Example with No Acceleration, No Covariance", p. G-10) — ambos os segmentos de efemérides, incluindo os valores de origem com zeros à esquerda (<c3/>). A fixture <c4/> é reproduzida caractere por caractere do Blue Book oficial (os marcadores editoriais "< intervening data records omitted here >", que não são registros OEM válidos, não são incluídos).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/>: <c2/> recupera todos os { "41" } registros RANGE (primeiro { "3198.03679519614" } km, último { "3270.46440460551" } km) e os metadados do exemplo TDM em KVN da <b>CCSDS 503.0-B-2, Anexo E, Figura E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", p. E-9). A fixture <c3/> é literal do Blue Book. (Esta é a referência independente do Blue Book publicado, ao lado da ida e volta <c4/> já existente, escrita à mão, em <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/>: o codificador reproduz os vetores de teste de cabeçalho primário em nível de byte da <b>biblioteca <c2/></b> independente (us-irs/spacepackets-py, <c3/>) — por exemplo <c4/> e o <c5/> com todos os valores máximos — mais o caso canônico de telemetria (TM) com todos os bits em um, cada um levado de ida e volta pela decodificação. Larguras/ordem dos campos de bits segundo a <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (orçamento de enlace, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/>: a cadeia de FSPL (perda no espaço livre) e C/N₀ reproduz a tabela publicada de controle de projeto de telemetria de espaço profundo de <b>J. H. Yuen (ed.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Tabela 1-1</b> — o enlace de descida do Galileo em banda X ({ "8420.43" } MHz) a { "6.37" } AU: perda no espaço livre de <b>{ "290.54" } dB</b> (<{ "0.05" } dB) e <b>Pr/N₀ = { "54.6" } dB-Hz</b> recebido (<{ "0.2" } dB). Os centros de banda ficam dentro das alocações de enlace de descida de espaço profundo da DSN/CCSDS-401 (DSN 810-005 Módulo { "201" }). Os <em>parâmetros de missão padrão</em> continuam representativos (não um transponder calibrado); o que é fixado aqui é a <em>equação</em> do enlace.

# text
seg-c2cee7d5c7b1 = Normas GNSS — situação da referência independente externa e as lacunas restantes, com honestidade:

# text
seg-d8f653b3c955 = Situação e ressalva honesta

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Núcleo, geometria e nível de proteção ARAIM validados externamente.</b> O <em>núcleo</em> de detecção — o limiar de detecção de falhas por χ², a não centralidade da detecção perdida em χ² não central e os multiplicadores K da lei normal — reproduz o <b>SciPy</b> (<c1/>, { "171" } casos, ≤ { "1e-6" } rel), e a geometria envolvente reproduz o <b>gnss_lib_py</b> (DOP). O <em>valor</em> do nível de proteção (PL) do ARAIM agora também é fixado: contra o "exemplo numérico LPV-200 (LPV: desempenho de localizador com orientação vertical)" do ADD (Algorithm Description Document) v3.1 de Referência ARAIM do WG-C (WG: Working Group), <c2/> / <c3/> dão VPL { "18.2926" } m contra { "18.3" } m, HPL { "13.4063" } m contra { "13.45" } m e σ_v,acc { "1.3694" } m contra { "1.3694" } m, dentro do próprio <c4/> = { "0.05" } m da referência (o tipo <c5/>). Escopo: modos de falha até um satélite ou uma constelação (<c6/>); subconjuntos de falhas de múltiplos eventos e a exclusão não estão implementados, e o RAIM clássico ainda <b>não tem vetor de teste entrada→HPL canônico publicado</b>. Veja <a1><c7/></a1>.

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
seg-e6a47dfb7e54 = <b>Algoritmo de nível de proteção agora validado externamente.</b> Dados (el, az, σ) por satélite, o <c1/> do kshana reproduz o <b>fork SBAS-PL do RTKLIB</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — alimentado com o σ <b>próprio</b> dessa ferramenta, calculado a partir de mensagens de transmissão <b>reais do EGNOS</b> + RINEX real da BUTE — até <b>< { "2e-3" } m de HPL</b> em { "6" } épocas (<c4/>); o gLAB { "v6.0.0" } da ESA (<c5/>) confirmou a convenção idêntica. Os fatores K (<c6/>, <c7/>, <c8/>) coincidem com o DO-229E Appendix J. <b>O que é validado e o que não é:</b> isto fixa o <em>algoritmo</em> de PL (σ entra → HPL/VPL sai); a <em>modelagem</em> de σ a montante a partir de mensagens UDRE/GIVE brutas está fora do escopo do kshana — é aí que ferramentas independentes de <em>pipeline completo</em> ainda discordam por metros em dados reais. K_V coincidiu no valor arredondado da referência independente, { "5.33" } (o exato do kshana <c9/> → VPL ~{ "0.06" } % menor; a vertical é validada sem fator K como <c10/>).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Modelo de transmissão validado externamente.</b> O modelo Klobuchar L1 reproduz o <b><c1/> do RTKLIB</b> (<c2/>, < { "1e-4" } m) — <em>paridade de implementação</em> com a referência aberta de fato, já que não existe nenhum exemplo resolvido oficial de <em>verdade medida</em>. O leitor de mapas de TEC IONEX agora existe (<c3/>, testado por unidade); a lacuna restante é uma verificação cruzada dele contra um produto GIM real, não o modelo de transmissão. Veja as linhas Klobuchar em <a1>Afirmações versus realidade</a1>.

# text
seg-fa3058dffb2a = Código de espalhamento GPS L1 C/A (IS-GPS-200)

# text
seg-53ac231770fb = Geração de código validada externamente.

# text
# c1: src/sdr.rs
# c2: ca_first_ten_chips_match_is_gps_200_octal
# c3: navsignal
seg-04db7c613bd5 = <c1/> (<c2/>): o gerador de código C/A G1/G2 LFSR (registrador de deslocamento com realimentação linear) reproduz as <b>atribuições de fase de código publicadas na IS-GPS-200 Tabela 3-Ia</b> — os dez primeiros chips em octal para PRN (ruído pseudoaleatório) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — exatamente. Isto fixa a <b>sequência de chips do código de espalhamento</b> contra a especificação de interface do GPS; as peças circundantes de modulação, separação espectral e rastreamento de código por DLL (malha de captura de atraso) (<c3/>) permanecem MODELLED.

# text
seg-e5f1b960777a = Temporização para redes, espectro, o sistema solar, constelações, campanhas e PNT em LEO

# text
# c1: VERIFICATION-MATRIX.md
seg-c5bf3b23d688 = As capacidades acrescentadas na linha { "0.28" } são avaliadas linha por linha na <a1><c1/></a1> gerada; esta seção resume quais delas trazem uma referência independente externa. Uma linha é VALIDATED somente com uma referência independente externa; todo o resto é MODELLED.

# text
seg-d791a48b3895 = Capacidade (tipo)

# text
seg-d4779be2efd8 = Referência independente externa, ou por que permanece modelada

# text
# c1: telecom-timing
seg-0d7bb0fc1c5e = MTIE (erro máximo de intervalo de tempo) e TDEV (desvio de tempo) de telecomunicações em uma série de holdover (<c1/>)

# text
# c1: tests/telecom_timing_reference.rs
# c2: TELECOM-TIMING.md
seg-18894b55b6c1 = <c1/>: { "17" } fatores de promediação de MTIE e { "12" } de TDEV em uma série versionada de holdover de relógio em escala de chip de { "2" } 048 amostras contra o allantools { "2024.06" }, com < { "1e-12" } / < { "1e-9" } relativo. Os veredictos PASS/FAIL da máscara ITU-T (International Telecommunication Union Telecommunication Standardization Sector) e as predefinições de osciladores de folha de dados permanecem MODELLED. Veja <a1><c2/></a1>.

# text
# c1: slot-timing
seg-ff9cb967ae08 = Previsão de holdover a partir de um registro de relógio medido (<c1/>)

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
seg-7821227795d8 = <c1/>: ajustar sobre o primeiro terço do registro real do césio 5071A, prever o tempo de violação de um sigma em seis limiares e medi-lo nos dois terços reservados; limiar de um fator de { "1.5" } para mais ou para menos, razões observadas de { "0.84" } a { "1.03" }. O orçamento de guarda de slot e a cadência de correção construídos sobre isso permanecem MODELLED.

# text
# c1: spectrum
seg-2667e3ddf829 = Densidades espectrais de potência da banda L em forma fechada e separação espectral (<c1/>)

# text
# c1: navsignal
seg-1a0c6ef49f98 = Formas fechadas de <c1/> contra valores publicados (linha da matriz "Closed-form L-band signal power spectral densities…"). A cascata com J/S (razão jammer-sinal) por banda e C/N0 (densidade de portadora para ruído) efetivo, e a entrada/saída SigMF (Signal Metadata Format), permanecem MODELLED.

# text
# c1: solar-system
seg-46278e9c03c1 = Posições planetárias a partir dos elementos de Standish do JPL (Jet Propulsion Laboratory) e tempo de luz entre corpos (<c1/>)

# text
# c1: tests/solar_system_standish_preregistered.rs
# c2: tests/solar_system_standish_earth_icrf_preregistered.rs
# c3: tests/solar_system_light_time_solver_preregistered.rs
# c4: tests/solar_system_horizons_reference.rs
# c5: body-pnt
seg-43cfeb9f2403 = { "0.30" }, pré-registrado contra o JPL Horizons (DE441): <c1/> e <c2/>, RMS por planeta e componente no máximo igual ao valor da Tabela { "8.10.1" } do Explanatory Supplement (pior caso { "0.778" }), incluídos a divisão da Terra e a rotação ICRF; <c3/>, o solucionador de tempo de luz sobre posições DE441 dentro de { "1e-6" } s do tempo de luz do Horizons (pior caso { "6.7e-9" } s). A comparação anterior com o dobro do nominal (<c4/>), cujo limiar foi definido depois da primeira comparação, é mantida como regressão sem efeito bloqueante. Urano/Netuno da Tabela { "1" }, Plutão, as luas, as constantes de corpos e <c5/> permanecem MODELLED.

# text
# c1: constellation-design
seg-b96d8ea13c87 = Geometria Walker e as posições orbitais publicadas de GPS, Galileo e GLONASS (GLObal NAvigation Satellite System); diluição de precisão global do GPS (<c1/>)

# text
# c1: constellation::tests
seg-85c293b8d235 = <c1/>: o Walker 24/3/1 reproduz a tabela de definição do serviço aberto do Galileo até { "1e-9" }°, a fórmula de posição do documento de controle de interface do GLONASS e os cruzamentos equatoriais do GPS; a mediana de HDOP da linha de base do GPS { "0.940" } contra os { "0.94" } do padrão de desempenho do Standard Positioning Service. Mapas de cobertura multiconstelação arbitrários em torno de qualquer corpo permanecem MODELLED.

# text
# c1: campaign
seg-f0187be4b97f = Campanhas: missões encadeadas, varreduras, conjuntos de Monte Carlo, execuções com condições compartilhadas (<c1/>)

# text
# c1: tests/campaign_composition_reference.rs
seg-b5c45fc12e5f = <c1/> ({ "11" } testes): uma campanha de uma fase reproduz a execução autônoma byte a byte, uma varredura de um nó lê o mesmo número, um conjunto com semente é estável byte a byte. Identidades de composição, não uma referência independente externa.

# text
seg-bc25d20125e7 = Física de enlace LEO (low Earth orbit): coeficientes de chuva ITU-R (ITU Radiocommunication Sector) P.838, atenuação por chuva e cintilação P.618, perda de penetração em edificações P.2109, ionosfera de primeira ordem, Doppler máximo

# text
# c1: tests/leo_link_reference.rs
# c2: tests/leo_doppler_reference.rs
seg-b1f3bd37d169 = <c1/>, <c2/>: as próprias tabelas das Recomendações ITU-R e os exemplos de validação do Study Group { "3" } (versionados com sua fonte e data de obtenção), a razão de atraso de grupo da IS-GPS-200 para a ionosfera e a tabela publicada de Doppler máximo de Leclere, Marathe e Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

# text
# c1: leo-navmsg
seg-492917f11386 = Mensagem de navegação LEO: o algoritmo de usuário de efemérides transmitidas do ICD (documento de controle de interface) do Galileo, CRC-24Q (verificação de redundância cíclica de 24 bits), pesos globais médios de SISRE (erro de distância do sinal no espaço) (<c1/>)

# text
# c1: tests/leo_navmsg_reference.rs
seg-514a7da01582 = <c1/>: o algoritmo de usuário do Galileo reproduz o RTKLIB (uma biblioteca aberta de posicionamento cinemático em tempo real) até { "1" } mm em quatro efemérides transmitidas reais do Galileo; o CRC-24Q dá o valor de verificação de catálogo 0xCDE703 e os bytes de verificação do quadro de exemplo RTCM (Radio Technical Commission for Maritime Services) { "1005" }; os pesos de SISRE reproduzem a tabela publicada de MEO/GEO. O ajustador, a atualização no meio da passagem, a codificação binária, o texto no estilo RINEX-4/CSV (valores separados por vírgula) e os modelos de efemérides selecionáveis permanecem MODELLED.

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
# c4: leo-ppp
# c5: ntn-positioning
seg-94bbcd43e03a = Projeto de sinal LEO, passagem e orçamento de enlace, Doppler e posicionamento conjunto GNSS+LEO, convergência de PPP (posicionamento preciso por ponto), posicionamento 5G NTN (rede não terrestre), transferência de tempo LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/leo_signal_reference.rs
# c2: tests/leo_fusion_scenarios.rs
seg-4c37a8cfac87 = <c1/>, <c2/>: formas fechadas, consistência de filtro (por exemplo, o NEES médio das execuções do filtro PPP dentro de sua faixa de { "95" }%) e comparações de tendências publicadas; sem dados de campo.

# text
# c1: leo-pnt-chain
seg-91cf4e399f0a = Um sistema PNT em LEO de ponta a ponta (<c1/>)

# text
# c1: tests/leo_pnt_chain.rs
seg-fb947da2e8b4 = <c1/>: cada valor repassado é igual à própria saída do estágio a montante, e alterar uma entrada a montante move toda figura a jusante que depende dela.

# text
seg-7e230aa73770 = Resiliência e verticais em LEO (spoofing por Doppler e por consistência entre bandas, sondagem da ionosfera)

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
seg-2d3ead293658 = As saídas que são renderizações, não evidência, têm testes mas não têm linha na matriz: as exportações de intercâmbio (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit), SigMF (Signal Metadata Format)), cada uma lida de volta por um validador escrito a partir da especificação do formato (<c1/>, { "13" } testes; veja <a1><c2/></a1>); as animações (<c3/>: reexecuções idênticas byte a byte, contagens exatas de quadros, SVG (Scalable Vector Graphics) bem formado, nenhum endereço externo no player HTML (HyperText Markup Language)); e o relatório de execução (<c4/>, <c5/>: todo cenário incluído gera relatório sem nenhuma seção vazia ou valor de preenchimento, os rótulos coincidem com a matriz, e o comando registrado reproduz <c6/> e o relatório byte a byte).

# text
seg-903e4e51dda1 = Envelope operacional

# text
# c1: tests/scenario_coverage.rs
seg-e226ad523a3d = Cada pacote é exercitado ao longo do seu envelope de entrada declarado por <c1/>, que afirma que toda saída numérica é finita (sem NaN/Inf (NaN: não é um número)) e limitada. A tabela lista a faixa de entrada testada por pacote, o comportamento de saída esperado e o teste que a cobre.

# text
seg-8bd4f586f3c7 = Entrada variada

# text
seg-3ebc1201a545 = Faixa testada

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
seg-10cf765fdd75 = FoMs finitas de holdover/temporização/segurança

# text
seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (átomos frios → MEMS (sistemas microeletromecânicos) rudimentares)

# text
seg-456c32a126a2 = RMS/p95 de posição finito e limitado

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
seg-60009932477c = instantâneo de 30 satélites, com verificação estrita de checksum

# text
seg-deb16d50741e = só carrega com checksums válidos; geometria limitada

# text
seg-c46d726e35b3 = relógio (flicker)

# text
# c1: flicker_floor
seg-15939085bf3a = <c1/> ligado/desligado

# text
seg-504a95f55b88 = { "0" } contra { "1e-12" }

# text
seg-e1cce0c2028e = habilitar o piso 1/f <b>piora</b> a navegação livre de p95 de temporização

# text
seg-bdd4e56bdef9 = fusão (realismo)

# text
# c1: accel.bias
seg-09af9dd78fe3 = <c1/> { "0" } contra { "5.88e-7" } m/s²

# text
seg-0a6723be642c = zero contra não nulo realista

# text
seg-a9eb04be2b9f = o filtro ainda converge, dentro de { "3" }× o erro de viés zero

# text
seg-2a839953aa6a = As linhas de flicker-FM e de viés de fusão fecham duas lacunas específicas de realismo: os termos de ruído ficam <b>desligados por padrão, mas afetam demonstravelmente a saída quando habilitados</b>, e o filtro de fusão conjunta <b>não depende de os vieses serem zerados</b> — ele converge também com um viés residual realista de grau átomos frios.

# text
seg-4f0e9f9d4cdf = As execuções quântica e clássica agora usam sementes de RNG (gerador de números aleatórios) independentes (semente clássica = semente + 0x9e3779b97f4a7c15), de modo que suas realizações de ruído são não correlacionadas — corrigido após revisão.

# text
# c1: holdover_s
seg-3b6b785f401a = <c1/> reconhece segmentos: as linhas do tempo de interrupção são divididas em segmentos contíguos na reaquisição do GNSS, e o valor informado é a pior navegação livre (a mais curta) entre eles. Ele continua limitado pela resolução da grade de tempo (um limite inferior).

# text
seg-4a830113b13d = A ressincronização da transferência de tempo ISL modela a incerteza residual do enlace como uma nova oscilação de média zero a cada passo de medição, mais reancoragem no intervalo configurado.

# text
seg-30c4d89aa433 = Afirmações versus realidade — referência rápida

# text
seg-27a22de7b8c0 = A lista de verificação de um revisor hostil. Para cada termo que possa ser lido como mais do que é: o que o Kshana faz hoje e onde fica a versão real no roteiro.

# text
seg-759eb0cfafe4 = Termo que você pode ver

# text
seg-6a2d3691d642 = O que de fato é hoje

# text
seg-bbd0145bfb95 = O que <b>não</b> é (ainda)

# text
seg-a6fdb038b003 = "simulador PNT híbrido quântico/clássico"

# text
seg-4421f8bd0967 = um simulador estocástico clássico conduzido por coeficientes publicados de Allan/ruído de sensores quânticos

# text
# c1: QUANTUM-MODELS.md
seg-3885661aafff = física quântica de primeiros princípios (fase de Mach–Zehnder, ruído de projeção, sistemáticos) — veja <a1><c1/></a1>

# text
seg-1d28debd0302 = "fusão de Kalman conjunta" / pacote de fusão

# text
# c1: fusion
seg-d13beba21ba7 = o pacote executável <c1/> observa o relógio e a posição <b>separadamente</b> (uma correção direta de tempo e uma correção direta de posição), para o que o estimador ótimo é genuinamente bloco-diagonal — dois filtros de dois estados com uma FoM combinada

# text
# c1: fusion::coupled::CoupledPntFilter
# c2: [pos,vel,phase,freq]
seg-25c2fe6fa6d3 = um filtro <em>acoplado</em> para o caso de <b>pseudodistância</b> agora <b>existe</b> como <c1/> (<c2/> empilhado de 4 estados, covariância cruzada entre blocos não nula, validado por NEES) mas <b>ainda não está ligado ao pacote executável</b>, e o pacote é <b>1-DOF (um grau de liberdade)</b> — a extensão 3-D de 8 estados é trabalho futuro

# text
# c1: spoof
seg-5cce1ca5b86f = FoM de segurança (tipo <c1/>)

# text
# c1: 1 − P_md
# c2: P_fa
# c3: P_md
seg-d55c30f63023 = <c1/> de um <b>detector estocástico de spoofing de tempo</b>: um teste χ²₁ bilateral / de Neyman–Pearson sobre uma estatística de monitor auxiliada pelo relógio, limiar definido a partir de um <c2/> alvo, <c3/> avaliado <b>na magnitude da especificação</b>, tanto em forma fechada quanto por Monte Carlo (que concordam até alguns ×1/√N)

# text
# c1: INTEGRITY.md
seg-dbf2039a4a8e = um detector RAIM/ARAIM de múltiplos satélites — veja <a1><c1/></a1>; a estatística do monitor é um modelo gaussiano com o σ derivado da PSD do relógio, não uma correlação em nível de sinal

# text
seg-32bcb801e49c = "detecção de spoofing auxiliada por relógio"

# text
seg-58e4d22075e9 = um monitor de discrepância de tempo de <b>relógio único</b> (estatística gaussiana, σ da PSD do relógio), NÃO um RAIM multi-SV (SV: veículo espacial, isto é, um satélite)

# text
seg-f3f6f95bc559 = RAIM multi-SV no domínio da distância com níveis de proteção

# text
seg-a5faedaab13e = P_md do detector de spoofing (forma fechada contra Monte Carlo)

# text
# c1: Φ
# c2: P_md
# c3: mc_runs
# c4: src/spoof.rs
# c5: src/detection.rs
seg-0362489c341a = o <c2/> analítico baseado em <c1/> e a estimativa empírica de <c3/> ensaios coincidem dentro do erro amostral (≈ 1/√N); validado nos testes de <c4/> / <c5/> a uma deflexão sob estresse (μ/σ = { "2" })

# text
seg-8fa5c9468ff5 = uma ROC de detector medida contra dados de spoofing gravados

# text
# c1: gnss-sim
seg-8f895aa1c657 = modelo de pseudodistância <c1/>

# text
# c1: ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath
# c2: ionmodel()
# c3: klobuchar_agrees_with_rtklib_reference_implementation
seg-a5e5e1e7a0e9 = uma <b>simulação direta</b>: <c1/>. Cada modelo de atmosfera é testado por unidade contra valores à mão (ZHD (atraso hidrostático zenital) ≈ { "2.3" } m, Niell = { "1" } no zênite, obliquidade de Klobuchar), e o modelo de transmissão completo de Klobuchar é <b>verificado de forma cruzada contra a implementação de referência <c2/> do RTKLIB</b> até o nível submilimétrico (<c3/>, { "6.1278" } m para o caso de coeficientes padrão do RTKLIB — não existe vetor de teste oficial publicado de Klobuchar, de modo que isto é paridade de implementação, não verdade medida); uma <b>execução sem ruído reproduz geometria + correções até o nível submilimétrico</b> (resíduo RAIM ≈ { "0" })

# text
seg-adc8a5d89cbd = uma <b>solução</b> de posição a partir de sinais reais (PPP/RTK (PPP: posicionamento preciso por ponto)), combinação livre de ionosfera de dupla frequência ou resolução de ambiguidade da fase da portadora — não modelada

# text
# c1: jamming
seg-a56533528c6e = modelo de jamming (tipo <c1/>)

# text
# c1: Q
seg-0a4a28fcd53a = uma cadeia de <b>orçamento de enlace</b>: J/S a partir da perda no espaço livre + ganho de antena por direção → C/N₀ efetivo pela equação antijamming (ganho de desespalhamento × separação espectral <c1/>) → perda de travamento em um limiar (Kaplan & Hegarty §{ "9.4" })

# text
# c1: [acquisition]
# c2: [front_end]
# c3: [crpa]
# c4: [terrain]
# c5: Q
seg-b53e210487fb = multipercurso, dinâmica de AGC (controle automático de ganho) no tempo, a própria busca de aquisição (a histerese opcional <c1/> é um par de limiares); a perda opcional de quantizador <c2/> é a de uma entrada gaussiana, não válida para um jammer CW; o arranjo opcional <c3/> é de banda estreita e ideal (sem acoplamento ou descasamento), e o sombreamento opcional <c4/> é uma única aresta de faca em uma única tile SRTM; <c5/> é uma constante representativa por tipo, não derivada da PSD medida do jammer

# text
seg-523d66d56f97 = FoM de integridade (pacotes de relógio/holdover)

# text
seg-d0702ee52d37 = <b>autoconsistência</b> do filtro (fração das amostras de interrupção dentro de seu próprio limite k·σ)

# text
# c1: integrity
seg-b4b68065e521 = HPL/VPL, risco de integridade / P_HMI, limites de alerta, DO-229E/316/ED-259A — estes são informados separadamente pelo tipo <c1/> (RAIM / ARAIM) e pelas funções SBAS, nunca incorporados a esta FoM

# text
# c1: inertial
seg-d5b1f858f0e3 = FoM do <b>pacote</b> de cenário <c1/> legado

# text
seg-e9fe365d7318 = um orçamento de erro de acelerômetro/giroscópio de <b>eixo único (1-DOF)</b> (VRW/ARW, instabilidade de viés) com redefinição por ajuste à verdade

# text
# c1: gnss-ins
seg-604e8d96c2c2 = o pacote <em>legado</em> é 1-DOF; o <b>caminho de 3 eixos vem no pacote <c1/></b> (próxima linha)

# text
# c1: gnss-ins
# c2: src/inertial/
# c3: src/fusion/pack.rs
seg-e2a4a1c47f2c = <b>biblioteca</b> strapdown de 3 eixos + <b>pacote</b> <c1/> (<c2/>, <c3/>)

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
seg-01e5672a37a4 = um navegador verificado de quatérnions/NED (NED: norte-leste-baixo) com um modelo determinístico de erro de IMU — <b>fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa</b> modelados (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — agora <b>conduzido pelo pacote de cenário <c1/></b> e <b>configurável por sensor a partir de TOML (Tom's Obvious Minimal Language, o formato de cenário)</b> (<c2/>)

# text
seg-acecd6b81859 = <b>não modelados:</b> erro de retificação de vibração, deriva por gradiente de temperatura. O erro de navegação livre fundida é limitado por piso pelo erro de atitude na transferência (inclinação/viés do acelerômetro pouco separáveis), de modo que a calibração por viés não é alegada

# text
# c1: hybrid
seg-6b04fc376c0d = "Integração PNT híbrida" (pacote <c1/>)

# text
seg-cd3125081b5c = navegação por estimativa em malha aberta delimitada por redefinições GNSS ajustadas à verdade

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-578c93c67ae7 = uma mistura de Kalman GNSS–INS acoplada (fraca/forte) — esse é o pacote <c1/> separado (EKF) e o tipo <c2/>

# text
seg-57f603da0331 = "Desempenho de posicionamento" (pacotes de relógio)

# text
# c1: timing_rms_ns
seg-278aafe7fadf = RMS de <b>temporização</b> da fase do relógio em ns (<c1/>)

# text
seg-a6af364cbcdc = uma exatidão no domínio da posição ponderada por RMS/CEP/SEP/DOP (SEP: erro esférico provável)

# text
# c1: pos_rms_m
seg-b68c5a4363a5 = FoM de posição inercial (<c1/>)

# text
# c1: runs = N
seg-850e030bb5e3 = um RMS/p95 de posição de <b>eixo único</b> em metros, a partir de uma semente, a menos que <c1/> peça um conjunto (então média, dispersão e um intervalo de confiança bootstrap de { "95" }% por métrica)

# text
seg-be77929afa2c = uma distribuição de CEP / 2DRMS (o dobro do RMS de distância) de conjunto (roteiro: CEP por Monte Carlo)

# text
seg-75f239679dc2 = "validado até ~{ "2" }%"

# text
seg-2d593a99a2b1 = uma concordância <em>típica</em> observada; o <b>critério imposto é de { "20" }–{ "25" }%</b> de erro relativo

# text
seg-34cfd0e08235 = um limite de exatidão garantido de { "2" }%

# text
seg-d3402cc1ebd5 = "reprodutível / idêntico bit a bit"

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-46ea210bcdad = nova execução idêntica bit a bit no <b>mesmo SO (sistema operacional) + toolchain fixada</b>; entre Linux, macOS e Windows, a CI verifica um SHA-256 versionado da impressão digital de entrada e da forma de cada resultado (<c1/>) e os valores numéricos até { "1e-6" } (<c2/>)

# text
seg-38c6528122a8 = um resultado completo idêntico byte a byte entre sistemas operacionais (diferenças do libm no último dígito)

# text
# c1: orbit-sgp4-gps.toml
seg-b0e21aea4ccd = Cenário SGP4 GPS (<c1/>)

# text
# c1: gps-ops
seg-1131aa869f1d = um instantâneo <c1/> genuíno do Celestrak (2021-07-28, { "30" } satélites, checksums estritos), cada satélite propagado a partir de sua própria época de TLE

# text
# c1: scripts/fetch_tles.sh
# c2: REAL_TLE_GUIDE.md
seg-21c2f1b5d7e2 = uma constelação atual — atualize o instantâneo com <c1/> (veja <a1><c2/></a1>); os números de catálogo do NORAD (North American Aerospace Defense Command) são os reais

# text
seg-6948bd06c7e5 = Verificações cruzadas dos artigos de PNT lunar (evidência de regressão, não linhas da matriz)

# text
# c1: tests/validate_p*.rs
seg-9ee0faf0b359 = A suíte lunar/cislunar (as capacidades "Lunar & cislunar" e "Lunar PNT suite" no README) tem suas afirmações de artigos publicados verificadas de forma cruzada e independente em <c1/>, cada uma contra uma referência independente de uma implementação <em>diferente</em>:

# text
# c1: scipy.special.j1
seg-b4edbf832fe6 = <b>pegada orbital de transmissão/captura</b> contra <c1/> (Bessel J1 do Cephes);

# text
# c1: (HᵀH)⁻¹
seg-c856d319a46e = <b>DOP da geometria de faróis de superfície</b> contra uma solução <c1/> independente em NumPy;

# text
# c1: finals2000A
seg-33ee672d98d7 = <b>crescimento do erro de previsão por persistência de UT1/EOP</b> contra uma nova leitura em NumPy das mesmas linhas literais de <c1/> do IERS;

# text
seg-9b6e59789117 = <b>família plana de órbitas retrógradas distantes</b> contra o Three-Body Periodic Orbit Database da NASA/JPL;

# text
seg-c77384abd1cc = <b>orçamento de precisão de medição de distância por RF</b> contra uma referência de primeiros princípios.

# text
# c1: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c2: src/verification.rs
# c3: VERIFICATION-MATRIX.md
# c4: gen_validation_artifacts
# c5: verification_matrix()
# c6: tests/verification_artifacts_doc_sync.rs
seg-a451dbe09e10 = As fixtures e os scripts geradores de referência independente ficam em <c1/>. Eles reforçam a evidência por trás de capacidades que permanecem <b>MODELLED</b> na matriz verificada por máquina (<c2/>); são verificações de regressão, <b>não</b> novas linhas VALIDATED da matriz, de modo que não alteram, por si mesmas, a contagem da matriz verificada por máquina. Essa contagem não é reproduzida aqui, porque uma cópia digitada à mão dela se desatualiza: a divisão atual é o cabeçalho gerado de <a1><c3/></a1>, que <c4/> escreve a partir de <c5/> e <c6/> fixa.

# text
seg-a353a63661de = <s1>Anterior</s1>Exportações e importações de interoperabilidade

# text
seg-fdae3b73ab67 = <s1>Próxima</s1>Matriz de verificação

# text
seg-59c12422e6e7 = Marés no geopotencial (src/tides.rs)

# text
seg-10f0b4616abe = Manobras e projeto de trajetória (src/maneuver.rs)

# text
seg-56cdbd59ce5d = Determinação de órbita (OD) (src/orbit_determination.rs, src/batch_ls.rs)

# text
seg-3a2c69fcbb86 = Validação do modelo de forças por ajuste de efemérides (src/precise_od.rs)

# text
seg-05a25c6ef750 = Órbitas precisas reais de agências (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

# text
seg-279f4619bc2d = Navegação por mapa gravitacional / alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

# text
seg-7b512df70323 = Modelo de erro de INS / IMU — validação referenciada a folhas de dados (src/inertial/)

# text
seg-b385e665cfff = PNT de espaço profundo e de Marte — fundação D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

# text
seg-5887e7e1a218 = Observáveis radiométricos de espaço profundo e Tracking Data Message do CCSDS — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

# text
seg-a9cf84a14301 = OD de espaço profundo de dinâmica reduzida — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

# text
seg-dc406cb825db = Cenário PNT de espaço profundo e fusão de uma via + duas vias — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

# text
seg-7784f9436dd2 = Tempo coordenado lunar — taxa relativística do relógio Terra-Lua (src/lunar_time.rs)

# text
seg-8a34cb900611 = VLBI geodésico lunar — atraso de campo próximo para uma linha de base na Terra observando um farol lunar (src/lunar_vlbi.rs)

# text
seg-d47906a347b3 = OD lunar conjunta multitécnica + relógio — recuperação simulada em circuito fechado (src/lunar_combination.rs)

# text
seg-17b9f0ae9dee = Realização do referencial lunar — ajuste de datum de Helmert de 7 parâmetros (src/lunar_frame_realise.rs)

# text
seg-3cfffa3eeb79 = Volume de serviço de navegação lunar — DOP / cobertura / disponibilidade + PL ARAIM lunar generalizado (src/lunar_service.rs)

# text
seg-d80bf3320a15 = PNT diferencial lunar — cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS (src/lunar_dpnt.rs)

# text
seg-23c3d8a79acf = Exportação de interoperabilidade lunar — CCSDS OEM e KIF alinhados à LunaNet/IOAG, com aderência à norma na ida e volta (src/lunar_interop.rs)

# text
seg-a697f4f424b8 = Representatividade da demonstração e registro de lacunas até o voo (src/representativeness.rs)

# text
seg-4c924153299d = Evidência unificada de compromisso quântico versus clássico (src/qtrade.rs)

# text
seg-bd1a5835c5db = Biblioteca de modelos de erro de dispositivos quânticos (src/quantum_devices.rs)

# text
seg-6b1bb731f966 = Temporização quântica confiável — cadeia de ponta a ponta, disseminação segura, anomalia + compromisso (src/timetransfer_chain.rs)

# text
seg-3332c6c1ae86 = Navegação quântica sem GNSS (src/quantum_nav_od.rs)

# text
seg-9b46a5add4ab = Detecção de falhas / anomalias para sistemas PNT quânticos (src/quantum_faults.rs)
