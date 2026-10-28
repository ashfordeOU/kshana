# docs--kinds-lunar-and-cislunar: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: independence
seg-f994c81583bf = Teste MODELLED de estimador independente do limiar de observabilidade do comprimento de arco cislunar. Esse limiar é uma leitura de CARACTERÍSTICA sobre a matriz de observabilidade montada a partir das linhas ANALÍTICAS do jacobiano de distância e da matriz de transição de estado variacional ANALÍTICA, e a sua verificação cruzada por filtro de informação em raiz quadrada incorpora essas mesmas linhas — uma verificação de consistência entre duas máquinas numéricas, não uma corroboração. Este tipo de cenário fornece o árbitro que faltava: um estimador de mínimos quadrados em lote que de facto RECUPERA o estado inicial do chefe a partir de medidas simuladas, com as derivadas parciais da medida tomadas como DIFERENÇAS FINITAS CENTRAIS do modelo direto composto. Este não chama nenhuma linha de jacobiano analítico, nenhuma STM variacional, nenhuma decomposição em valores singulares ou autovalores, nenhuma tolerância de característica e nenhum filtro de informação em raiz quadrada — uma guarda de texto-fonte em tests/cislunar_arc_recovery_reference.rs torna isso verificável — enquanto a dinâmica (o mesmo fluxo RK4 do CR3BP), as condições iniciais (a mesma constelação corrigida diferencialmente), o observável escalar e a grelha de épocas são partilhados deliberadamente e nomeados no bloco <c1/> emitido, porque duas análises de um mesmo problema físico precisam concordar quanto à física para serem comparáveis. Dois critérios, cada um varrido ao longo de cinco décadas do seu próprio limite: RECUPERAÇÃO SEM RUÍDO (o erro de estado final de cada tentativa com semente no máximo recovery_factor vezes o seu deslocamento a priori — o análogo da característica, sem nenhuma tolerância de valor singular) e ESTIMABILIDADE POR MONTE CARLO (o erro RMS de posição medido sobre um conjunto de ruído com semente abaixo de um limite declarado — o análogo da estimabilidade, medido e não previsto). Suporta o caso planar de quatro estados e o espacial de seis estados, as famílias DRO / halo L2 / NRHO L2, os observáveis de distância e de taxa de distância, e uma parametrização polar centrada na Lua em que a transformação é aplicada ao ESTADO e o modelo direto é rediferenciado ali. MEASURED na grelha planar de DRO publicada: o estimador recupera o caso de quatro estados a partir de { "0.782609" } h contra os { "2.086957" } h do critério de característica em rel_tol { "1e-6" } (razão { "0.375" }) — o limiar de característica NÃO é corroborado como fronteira de recuperabilidade — enquanto a fronteira de estimabilidade medida cai na mesma célula da grelha que a formal, { "5.739130" } h, e a curva de erro medida reproduz o 1 sigma formal ao longo de { "21" } comprimentos de arco com uma razão de média geométrica de { "0.98" }. MODELLED: o projeto da constelação, a grelha de épocas, o único enlace em seguimento, a magnitude do deslocamento, o sigma da medida e os dois limites declarados. Não é um produto de desempenho de navegação certificado.

# attr:alt
seg-2fe411ae2153 = O gráfico que o motor escreve para scenarios/cislunar-arc-recovery.toml, tipo de cenário cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = Observabilidade MODELLED de constelação cislunar planar (P6): segue uma constelação planar de DRO corrigida diferencialmente, com quatro espaçonaves e alcance intersatélites, e indica quanto do estado de quatro componentes [x,y,ẋ,ẏ] de uma espaçonave o arco torna observável. Emite ({ "1" }) a tabela de característica contra comprimento de arco para um único enlace só de distância — de característica 1 instantânea, crescendo em direção ao estado completo de quatro componentes à medida que o arco se estende (P6 Tabela { "1" }); ({ "2" }) o espetro de autovalores do gramiano de observabilidade + o número de condição ao longo do arco; ({ "3" }) a comparação de característica instantânea só de distância contra distância + taxa de distância (a alavanca de projeto do Doppler) mais o relato de GDOP singular só com distância / definido com distância + taxa; e ({ "4" }) uma validação cruzada independente por SRIF cuja covariância a posteriori se torna finita / bem condicionada exatamente no arco em que a característica observável chega a quatro. Núcleo VALIDATED: a característica observável é um limiar de valor singular que revela a característica, verificado de forma cruzada contra o característica de autovalores do gramiano; o espetro de autovalores obedece aos invariantes espetrais (traço=Σλ, det=Πλ, Frobenius²=Σλ²); a STM variacional é a STM do CR3BP validada por diferenças finitas; as linhas do jacobiano de distância/taxa de distância são derivadas parciais analíticas validadas por diferenças finitas (verificadas de forma cruzada contra o observável de taxa de distância em 3-D do crate); as quatro condições iniciais são DROs planares corrigidas diferencialmente que fecham com um resíduo de periodicidade estreito e são retrógradas; a transição de característica é validada de forma cruzada contra o filtro de informação em raiz quadrada do crate (covariância a posteriori finita exatamente em característica completa, cond(P)=cond(OᵀO)); um instantâneo com deficiência de característica é sinalizado como GDOP indefinido (fim condition=inf), nunca como um valor finito espúrio — a mesma guarda de geometria singular que pvt::solve_spp aplica. MODELLED: o projeto da constelação (amplitudes e fases do perilúnio dos DROs) e a progressão específica de característica que ele produz. Não é um produto de desempenho de navegação certificado.

# attr:alt
seg-f15bbf30b0dd = O gráfico que o motor gera para scenarios/cislunar-observability.toml, tipo de cenário cislunar-observability

# text
seg-c8a8be4b8894 = Receção de GNSS da Terra à distância lunar, a camada de sinal fraco que o artigo sobre resiliência a conflitos nomeia e para a qual o motor não tinha modelo. Um satélite GNSS aponta a sua antena para a Terra; um recetor perto da Lua fica a cerca de quinze vezes o raio orbital de distância, de modo que três coisas pesam ao mesmo tempo. A Terra OCULTA O EIXO DE VISADA: a partir de { "26,560" } km ela subtende um semiângulo de { "13.9" } graus, de modo que qualquer raio dirigido à Lua deve deixar o transmissor com pelo menos esse afastamento do nadir, o que remove o pico do feixe antes de qualquer potência ser calculada. O que resta são A ORLA DO LÓBULO PRINCIPAL E OS LÓBULOS LATERAIS, o regime em que a carga útil LuGRE realmente operou em { "2025" }. E a perda no espaço livre é de cerca de { "208" } dB em L1, aproximadamente { "25" } dB a mais do que um utilizador terrestre paga. O relatório emite uma linha por satélite (ângulo fora do eixo, ocultação pela Terra, distância, perda de percurso, ganho de transmissão nesse ângulo, potência recebida, densidade de portadora sobre ruído) e agrega apenas os enlaces que superam o limiar de seguimento. TAMBÉM INDICA O CONDICIONAMENTO, porque é isso que define esta camada: cada satélite visível está dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas, a diluição de precisão é enorme, e uma solução de GNSS da Terra à distância lunar é uma observação de grau de TEMPORIZAÇÃO muito mais do que de grau de posição. MODELLED, e o diagrama de transmissão é o motivo: o ganho em função do ângulo é uma abertura circular uniforme (Airy), enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal moldado e lóbulos laterais que não são de Airy. Existem diagramas medidos e eles não estão incluídos aqui, de modo que ordenações e ordens de grandeza são significativas, mas o dB de um único satélite não é. DELIBERADAMENTE AUSENTES, cada uma tornando o balanço otimista: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda por polarização, apontamento ou implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA (distância mais direção inercial) em vez de uma consulta a efemérides, porque a grandeza sob teste é o enlace e a geometria do feixe. Elevar esta linha a validada exige um diagrama de transmissão medido e pontos normais do LuGRE; nenhum dos dois está no repositório e nenhum é inventado aqui.

# attr:alt
seg-cf1dce5fc824 = O gráfico que o motor gera para scenarios/earth-gnss-lunar.toml, tipo de cenário earth-gnss-lunar

# text
seg-004c56ded47f = Superfície de ataque à segurança dos sinais de navegação à superfície lunar (P1): compõe as análises abertas de segurança de sinais numa única execução acessível por binário. Indica ({ "1" }) a potência recebida do AFS e o seu EXCEDENTE de potência face a uma referência GPS terrestre, bem como a banda de sensibilidade de 12-18 dB, como uma verdadeira varredura multieixo sobre as entradas da ligação (nível de referência x EIRP x distância oblíqua), com a reconciliação dos fatores lineares de 25x arredondado / 28x não arredondado. REVISTO (regra R4): isto indicava um DÉFICE de potência de { "15.6" } dB e um fator de 32x/36x até a referência GPS ser corrigida de -125 / -128.5 (que são os valores em dBm) para -155 / -158.5 dBW, os valores da ICD-GPS-200 que o módulo de jamming sempre usou. O sinal inverte-se: o sinal AFS lunar modelado é { "14.4" } dB MAIS FORTE do que o GPS L1 C/A terrestre, não mais fraco. A própria potência recebida não se alterou um único bit, e o fator linear é o antigo dividido por exatamente { "1000" }, que é exatamente o desvio de { "30" } dB entre dBm e dBW; ({ "2" }) a potência de transmissão exigida ao atacante para falsificar (J/S = { "3" } dB) e para negar (J/S = { "30" } dB) a cada distância de afastamento, o inverso da ligação J/S; ({ "3" }) a pegada orbital de captura sob um diagrama de antena real de abertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), uma calota sub-hemisférica limitada pela altitude cujo limbo NÃO é capturado; ({ "4" }) um resultado calculado de atracão por captura de spoofing no laço de seguimento (um spoofer de código adaptado, com uma dada vantagem de potência e desvio de código, arrasta efetivamente o DLL/PLL?) em vez do limiar afirmado de { "3" } dB; ({ "5" }) o alcance do horizonte geométrico de um corpo sem atmosfera para um transmissor de superfície elevado; e ({ "6" }) o orçamento de autenticação OSNMA/TESLA ({ "20" } bit/s de sobrecarga = ~{ "40" } % de uma mensagem de navegação AFS de { "50" } bit/s, latência de divulgação de chaves, falsificação de { "2" }^-40). Um corpo vazio reproduz a linha de base P1; todas as entradas têm valor predefinido e podem ser substituídas. Os subresultados VALIDATED trazem a referência independente do respetivo módulo de origem (radiometria em dB de forma fechada; ida e volta do J/S inverso; diagrama de Airy face a Bessel de A&S e à geometria da calota esférica; atracão DLL/PLL face a Kaplan & Hegarty; identidade do horizonte tangente esférico face a eo_payload; dimensionamento de campos do ICD de SIS do OSNMA). MODELLED: as magnitudes representativas de geometria/potência e os valores específicos das células do mapa de captura. Não é um produto de segurança certificado.

# attr:alt
seg-de295af20c55 = O gráfico que o motor escreve para scenarios/lunar-attack-surface.toml, tipo de cenário lunar-attack-surface

# text
seg-142ad48fe422 = Aumento de um serviço de navegação orbital lunar por balizas de superfície, como uma tabela executável de antes/depois. Um utilizador no polo sul vê um conjunto orbital esparso numa faixa estreita do céu, pelo que a geometria de medição de distâncias é mal condicionada; algumas BALIZAS DE SUPERFÍCIE TOPOGRAFADAS fornecem as linhas de linha de vista de baixa elevação e grande azimute que falta a um conjunto todo ele zenital, e a diluição horizontal da precisão desce abruptamente. O cenário indica três configurações numa época — só os satélites, os satélites mais as balizas visíveis, e uma constelação maior como via alternativa para a mesma geometria — cada uma com as suas contagens de fontes visíveis, o seu DOP completo e a exatidão realizada de 1 sigma em METROS, obtida multiplicando por um erro de distância equivalente do utilizador por baliza, montado como a soma quadrática dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade das balizas é o horizonte geométrico de duas alturas da Lua sem atmosfera (sem atmosfera, pelo que o limite é exato), e a montagem do DOP é o mesmo núcleo verificado face ao gnss_lib_py em tests/dop_reference.rs. PORQUE EXISTE ESTE TIPO DE CENÁRIO: o módulo subjacente existe no motor e foi verificado face a um percurso de DOP independente desde L08/L09, mas não era acessível a partir de uma execução — sem tipo de cenário, sem ramo de despacho, sem ficheiro incluído. O README anunciava a capacidade e a matriz de verificação não tinha NENHUMA linha para ela, pelo que era simultaneamente afirmada em prosa e não afirmada no registo, ao mesmo tempo que era inacessível no motor. As predefinições são a geometria que já tem uma referência de ouro registada (um utilizador a -80 graus com uma antena de { "2" } m, três balizas a -80/0, -79/+{ "60" } e -79/-60 a { "2" } km, um instantâneo ilustrativo de seis satélites LCNS em t={ "0" }, uma máscara de { "5" } graus), pelo que uma execução simples reproduz uma tabela que uma referência independente já cobre, em vez de inventar números novos. MODELLED: o projeto da constelação, a colocação das balizas e todas as magnitudes do orçamento de erro são entradas ilustrativas, não um levantamento no terreno nem uma ligação medida; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE estão ancoradas externamente. Não é um compromisso de desempenho do serviço.

# attr:alt
seg-a53e353706f6 = O gráfico que o motor escreve para scenarios/lunar-beacon.toml, tipo de cenário lunar-beacon

# text
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (um análogo lunar do DGNSS/SBAS): uma estação de referência da classe NovaMoon, numa localização selenográfica CONHECIDA, calcula correções diferenciais por satélite a partir de uma constelação ILLUSTRATIVE de classe Moonlight/LCNS, de fontes públicas (NovaMoon referida apenas como uma CLASSE de sistema, sem afiliação à ESA), e um utilizador afastado por baseline_km aplica-as, de modo que os erros de órbita e de relógio de MODO COMUM se cancelam. O termo do relógio cancela-se EXATAMENTE (uma identidade algébrica); do termo da órbita resta apenas a projeção da diferença de linha de vista, que → { "0" } quando a linha de base → { "0" } (o piso da decorrelação espacial) e cresce ≈ linearmente com a linha de base. Indica o erro de posição 3-D do utilizador COM versus SEM correções, o fator de redução, a curva do erro em função da linha de base e um nível de proteção do utilizador que REAPROVEITA a maquinaria SBAS da DO-229E (crate::sbas) com o resíduo diferencial σ. MODELLED — identidade de cancelamento exata + modelo de decorrelação de primeira ordem; não validado com dados reais; sem TRL, herança de voo nem aval de agências. Determinístico se tiver semente fixa.

# attr:alt
seg-8e67df89448a = O gráfico que o motor escreve para scenarios/lunar-differential-pnt.toml, tipo de cenário lunar-differential-pnt

# text
seg-55679aff66db = Datum de referencial de sete parâmetros de Helmert (semelhança) conduzido por uma CAMPANHA DE OBSERVAÇÃO SIMULADA, e não por uma transformação injetada. Uma rede de estações terrestres observa um catálogo de balizas da superfície lunar segundo um calendário explícito; as derivadas parciais do atraso VLBI lunar são acumuladas ao longo desse calendário numa matriz de informação de Fisher das coordenadas das balizas, exatamente como o lunar-vlbi-fim; e essa informação é propagada através do projeto de Helmert A = [I3 | [p]_x | p] nos pontos do catálogo para a covariância do datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NENHUMA transformação é injetada e nada é recuperado a partir de uma resposta plantada, pelo que a exatidão do datum indicada decorre do programa de observação: reduzir o sigma do atraso a metade reduz-no exatamente a metade, e alongar o arco melhora-a porque a libração que o relatório MEDE (sub_earth_direction_sweep_deg) é o que separa a coordenada da baliza ao longo da linha de vista das do plano do céu. Posto, defeito de datum, número de condição, o espetro completo, as direções inobserváveis NA BASE DE SETE PARÂMETROS, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em cada execução; um parâmetro que a campanha não restringe é publicado como NULL com um estado, nunca lido a partir de uma inversa quase singular. A correlação de erro das balizas é medida, não assumida: com as estações fixas nenhuma observação toca em duas balizas, pelo que a matriz de informação é exatamente diagonal por blocos (offblock_fraction { "0" }), e com as estações estimadas o bloco marginalizado por Schur está acoplado, sendo a correlação induzida impressa e toda a propagação repetida com ela descartada, de modo que o preço de um pressuposto de independência é um número. A mesma propagação com um sigma isotrópico por coordenada, e o erro de recuperação que o cenário lunar-frame-realisation indica, são ambos executados aqui e impressos a par do valor da campanha, com as suas razões. MODELLED: o catálogo de balizas tem fonte, mas a CAMPANHA é simulada — a rede de estações e o sigma do atraso são entradas ilustrativas, as observações de atraso individuais são tratadas como independentes, e as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, pelo que a covariância do datum é um limite de Cramer-Rao para um conjunto reduzido de parâmetros. Não é um produto geodésico.

# attr:alt
seg-883d94b321b4 = O gráfico que o motor escreve para scenarios/lunar-frame-campaign.toml, tipo de cenário lunar-frame-campaign

# text
seg-0c4c119abfca = Realização modelada do referencial lunar: um ajuste de datum de Helmert (semelhança) de 7 parâmetros — { "3" } de translação, { "3" } de rotação de ângulo pequeno, { "1" } de escala — que liga um conjunto estimado de coordenadas de pontos MCMF de origem selenográfica a um datum por mínimos quadrados ponderados (crate::batch_ls::gauss_newton), mais uma ligação de orientação simples que exprime a pequena rotação realizada em torno dos eixos do ICRF relativamente à orientação do corpo segundo o WGCCRE da IAU de { "2015" }. O cenário injeta uma pequena transformação conhecida (translação de ~dezenas de m, rotação de ~µrad, escala de ~{ "1e-7" }) numa rede sintética de pontos bem distribuída, acrescenta ruído gaussiano de semente fixa, recupera o datum e indica a transformação recuperada, o erro de recuperação por parâmetro face à verdade injetada e o resíduo RMS pós-ajuste. Autoconsistência MODELLED — recupera uma transformação de semelhança injetada (sem ruído até ~à precisão da máquina), NÃO uma realização face a dados reais de seguimento/VLBI; determinístico (semente fixa); sem TRL, herança de voo nem aval de agências.

# attr:alt
seg-f3a6d69d0225 = O gráfico que o motor escreve para scenarios/lunar-frame-realisation.toml, tipo de cenário lunar-frame-realisation

# text
# c1: study
seg-d0fb90f506c9 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos num único tipo de cenário selecionado por <c1/>: od-consistency (determinação de órbita a bordo com Earth-GNSS numa NRHO ou ELFO face à determinação de órbita radiométrica independente a partir do solo, avaliadas pelas suas próprias covariâncias sobre um Monte Carlo de semente fixa), carrier-phase (fase da portadora de dupla diferença conjunta superfície-orbitador e resolução de ambiguidades inteiras com LAMBDA), frame-coestimation (uma estação de superfície e orbitadores acrescentados à medição de distâncias de estações terrestres para o datum de referencial lunar de sete parâmetros), space-tie (GNSS, VLBI e telemetria laser numa única nave, precisão da ligação de referenciais face ao erro de ligação local) e geodesy-sensitivity (informação de Fisher dos números de Love lunares h2, k2, l2 e da libração física a partir de telemetria laser, seguimento de orbitadores, um gravímetro de superfície e um relógio de superfície). Um modelo restrito de três corpos com simplificações indicadas; a numérica é verificada face a programas independentes e nada é comparado com uma medição de uma grandeza lunar.

# text
seg-f3b4a80a739b = sem gráfico: o exemplo não escreve nenhum gráfico

# text
seg-4b6daea39f5c = Passagem de nível de proteção ARAIM no polo sul lunar face a um conjunto de retransmissores LunaNet representativo. sigma_ure_m expõe a exatidão de medição de distâncias do sinal no espaço (os níveis de proteção escalam linearmente com ela, pelo que variá-la responde à pergunta sobre que exatidão de medição de distâncias um limite de alerta exige). Por predefinição, o caso histórico do polo sul da classe LNIS.

# attr:alt
seg-610fa190a393 = O gráfico que o motor escreve para scenarios/lunanet-araim.toml, tipo de cenário lunar-integrity

# text
seg-5a4dcb93a643 = Exportação de interoperabilidade lunar modelada: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio alinhadas com LunaNet/IOAG e baseadas em CCSDS, com aderência à norma de ida e volta e dos campos. REAPROVEITA o emissor e analisador CCSDS OEM { "2.0" } da crate (crate::oem), reetiquetado para o contexto lunar — o REF_FRAME do OEM transporta o referencial do corpo lunar segundo o WGCCRE da IAU de { "2015" } (MOON_ME / MOON_PA), o TIME_SYSTEM a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON — sobre umas efemérides de amostra ilustrativas da classe LCNS (posições de crate::lunar_service, velocidade por diferença finita). Emite também um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefactos no envelope KIF existente (crate::interchange) com a etiqueta de honestidade MODELLED. Indica os artefactos emitidos, o número de linhas do OEM, a aderência dos campos à norma (resultado positivo) e a lista de campos presentes/em falta, a ida e volta do OEM correta, a ida e volta dos metadados de tempo correta e o tamanho em bytes do KIF. MODELLED — a referência independente é a ida e volta determinística e a aderência dos nomes de campos à norma face ao CCSDS OEM publicado e à semântica de campos do LunaNet/IOAG; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efemérides ilustrativas de fontes públicas, sem afiliação à ESA; sem TRL, herança de voo nem aval de agências.

# attr:alt
seg-0e86ff364c17 = O gráfico que o motor escreve para scenarios/lunar-interop-export.toml, tipo de cenário lunar-interop-export

# text
# c1: jamming
seg-a91a9ad5d8d1 = Jamming de RF nativo lunar: razão jammer-sinal por satélite, C/N₀ efetivo e perda de bloqueio para um utilizador à superfície selenográfica sob um jammer na superfície lunar (ou elevado), sobre a constelação ilustrativa de fontes públicas de órbita lunar da classe Moonlight/LCNS. Compõe a física aberta de jamming existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) com a geometria do céu lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); não se rededuz nenhuma geometria nem radiometria. Ao contrário do tipo de cenário <c1/> terrestre, a componente do sinal NÃO é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio orçamento de ligação EIRP − FSPL(distância oblíqua), pelo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Indica UMA LINHA POR LIGAÇÃO (época, satélite) VISÍVEL — azimute, elevação, distância oblíqua, as duas potências recebidas de que o J/S é a diferença, o J/S, o C/N₀ nominal e efetivo e o estado de bloqueio — mais figuras de mérito agregadas a par dessa tabela (nunca em seu lugar), e a mesma tabela como artefacto CSV. Cada campo numérico emitido traz uma unidade e uma classe de proveniência. Os subresultados VALIDATED trazem a referência independente do respetivo módulo de origem (a equação antiinterferência e a ligação J/S de Kaplan & Hegarty §{ "9.4" }, referenciadas externamente em tests/gnss_denied_jamming_resilience_reference.rs; a geometria lunar de lunar_service). A própria composição é verificada de forma cruzada face a um percurso independente de dois orçamentos de ligação (linkbudget::received_signal_power_dbw, uma expressão de perda no espaço livre diferente) até { "1e-9" } dB. MODELLED: a constelação ilustrativa, a EIRP / potência do jammer / ganhos de antena / temperatura de ruído representativos, e a ausência de sombreamento do terreno, multipercurso, dinâmica do AGC e anulação adaptativa. Não é um produto certificado de negação de serviço. Com um jammer configurado, o relatório traz também um CONTORNO DE NEGAÇÃO COM UMA BANDA DE INCERTEZA, em vez de um contorno lido a partir de um único escalar: a distribuição completa medida do C/N₀ do sinal pretendido sobre a tabela por satélite (n, mín., p05, p25, mediana, p75, p95, máx., média, desvio-padrão amostral e a própria assimetria da amostra), e o contorno avaliado em cada uma dessas estatísticas de ordem segundo AMBOS os critérios de negação que o motor reconhece — o incumbente de razão de potências (J/S = { "30" } dB, como em attack-surface e tracking-loop) e o de perda de bloqueio (C/N₀ efetivo a descer até tracking_threshold_dbhz, o critério que a própria coluna de estado deste relatório utiliza) — nos dois eixos do plano de negação (EIRP do jammer exigida à distância de afastamento do cenário, distância de afastamento de negação à EIRP do cenário). Os limites da banda SÃO contour(p05) e contour(p95), o mesmo mapa de forma fechada aplicado aos quantis da própria amostra: não um sigma ajustado à amostra e não mediana ± k·desvio-padrão, com o desvio-padrão emitido por continuidade e não utilizado por nada. Um quantil já igual ou inferior ao limiar de seguimento não tem J/S de negação finito e as suas colunas de perda de bloqueio são nulas, com um motivo contabilizado, nunca um raio truncado.

# attr:alt
seg-6fe8b3c6c584 = O gráfico que o motor escreve para scenarios/lunar-jamming.toml, tipo de cenário lunar-jamming

# text
seg-200e58e189c2 = Estimador em lote multitécnica modelado de OD lunar + relógio, numa rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos VLBI geodésicos de linha de base terrestre, distâncias locais lunares estação↔satélite e distâncias entre satélites para recuperar, em conjunto, a posição 3-D de uma estação à superfície lunar, as posições de uma pequena constelação e o desvio de relógio de cada ativo a partir de uma verdade injetada. O resultado principal, apresentado com honestidade — o VLBI torna observável a posição 3-D completa da estação, onde a medição de distâncias apenas local lunar deixa uma direção fracamente observada — é indicado como o contraste do erro da estação com versus sem VLBI. Recuperação simulada em malha fechada MODELLED (a verdade partilha o modelo de observação), determinística (semente fixa), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança de voo nem aval de agências.

# attr:alt
seg-cfa051b87e59 = O gráfico que o motor escreve para scenarios/lunar-joint-od-clock.toml, tipo de cenário lunar-joint-od-clock

# text
seg-25455a33523c = Datum de referencial lunar de Helmert de sete parâmetros conduzido por uma campanha de observação REAL e ARQUIVADA, e não por uma simulada. Onde o lunar-frame-campaign removeu a transformação injetada mas continuou a indicar a sua rede de estações, o seu calendário e o seu sigma por observação como entradas ILLUSTRATIVE, este tipo de cenário retira os três da medição: as épocas são os instantes de transmissão a partir do solo de pontos normais arquivados dos Consolidated Laser Ranging Data da ILRS, as observações são as distâncias laser efetivamente disparadas contra as cinco matrizes de retrorrefletores na Lua, e cada peso de observação é a PRÓPRIA precisão arquivada desse ponto normal, bin_rms/sqrt(n_raw), lida do ficheiro. As coordenadas das estações provêm da solução SLR ITRF2020 do IERS (propagadas para a época pelas suas velocidades publicadas) e as coordenadas dos refletores da Tabela { "7" } do JPL DE430, no referencial de Terra média/rotação média que o modelo WGCCRE da IAU de { "2015" } realiza. As derivadas parciais das distâncias acumulam-se na matriz de informação de Fisher conjunta das coordenadas dos refletores e propagam-se através do mesmo projeto de Helmert para a covariância do datum, diagnosticada por crate::fim::crlb. Posto, defeito, condição, espetro, direções inobserváveis na base de sete parâmetros, a direção mais fraca com posto completo e a parcela de cada parâmetro nela são emitidos em cada execução, e um parâmetro não restringido é publicado como NULL com um estado. A correlação entre matrizes é MEASURED como exatamente zero, em vez de assumida, porque uma distância laser toca numa só matriz. Um registo que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. QUAIS AS LIGAÇÕES MEASURED E QUAIS AS MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo segundo a IAU continuam modeladas e a sua dimensão combinada é emitida como o resíduo da distância unidirecional observado menos calculado sobre todos os pontos utilizados; a troposfera, as marés do corpo sólido, a excentricidade da estação, o movimento polar, o UT1-UTC, o atraso relativista e os relógios das estações estão ausentes e incluídos nesse resíduo. Como um erro de efemérides só chega a uma covariância através da direção de cada linha de vista, cada execução volta também a resolver todo o datum com todas as derivadas parciais inclinadas de sensitivity_tilt_deg (com o sinal alternado) e emite a razão, pelo que a insensibilidade da covariância às efemérides modeladas é um número e não um argumento. Os valores da própria campanha simulada são EXECUTADOS e impressos a par dos medidos, não transcritos. MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros num calendário real — não um datum resolvido, não uma análise LLR e não um produto geodésico. A fatia de dados reais registada é distribuída com o repositório, mas não com a crate publicada; aponte data_dir para uma cópia da mesma.

# attr:alt
seg-e4da113cbe18 = O gráfico que o motor escreve para scenarios/lunar-llr-datum.toml, tipo de cenário lunar-llr-datum

# text
seg-f7ea776e70c9 = Cobertura modelada de uma estação de referência lunar: uma varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores do polo sul e um dia de épocas. Uma estação de referência diferencial num local conhecido do polo sul corrige uma constelação indicada (kepleriana ilustrativa ou efemérides tabeladas) com um erro de sinal no espaço, um erro de levantamento, uma latência de correção e uma quantização da ligação indicados; por ponto e ao longo da região, indica o erro de posição percentil corrigido e não corrigido (3-D, horizontal, vertical), a disponibilidade, a cobertura face a um limiar indicado, os níveis de proteção da DO-229E, o raio de cobertura por azimute e o orçamento da ligação de correção na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; sem afiliação nem aval de nenhuma agência. MODELLED.

# attr:alt
seg-922b8656fcae = O gráfico que o motor escreve para scenarios/lunar-station-coverage.toml, tipo de cenário lunar-station-coverage

# text
seg-cac3a0bcbfc6 = Orçamento de erro de tempo MODELLED, de ponta a ponta, do Tempo Lunar Coordenado (LTC): os sete termos de erro do LTC reunidos como curvas de erro de tempo x_i(τ) ao longo de uma grelha completa de tempos de média, somados em soma quadrática em x_Σ(τ), e o CRUZAMENTO τ entre relógio e referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele limitado pelo relógio) — a resposta honesta ao artefacto de um único τ. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, patamares τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas do relógio reproduzem as especificações publicadas de relógio a um dia (crate::clock_specs); as MAGNITUDES dos patamares da ligação RF/ótica, da realização do referencial, do resíduo relativista e das efemérides são atribuições de orçamento modeladas (predefinições documentadas, substituíveis por quem chama), não medições. O contributo é o cruzamento τ reprodutível, não um valor certificado por termo; não certificado para manutenção da hora operacional.

# attr:alt
seg-56fe184f2a12 = O gráfico que o motor escreve para scenarios/lunar-time-budget.toml, tipo de cenário lunar-time-budget

# text
seg-7f3e13712f10 = Taxa relativista modelada do relógio Terra–Lua (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, indicada com a banda publicada de { "56" }–{ "59" } µs/dia, mais o desvio acumulado ao longo de um horizonte.

# attr:alt
seg-e9deb6ed41c1 = O gráfico que o motor escreve para scenarios/lunar-time-offset.toml, tipo de cenário lunar-time-offset

# text
seg-1bc37634ba9f = Covariância das coordenadas das estações VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CALENDÁRIO explícito (linhas de base x épocas) numa matriz de informação de Fisher, invertida e indicada como a covariância das coordenadas das estações e o sigma da estação por coordenada — um resultado calculado do motor, e não uma precisão escalar do atraso passada por um fator de equipartição isotrópico g = { "3" } assumido. O estado transporta coordenadas das estações FIXAS à Terra (ITRS), pelo que a jacobiana é a derivada parcial inercial rodada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de vista fixa à Terra e a declinação da baliza em vez de as assumir. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderado por 1/delay_sigma_s^{ "2" }. Indica posto, defeito de datum, número de condição, o espetro de informação completo, a matriz de covariância, os sigmas por estação, por eixo e 3-D, e o espaço nulo da rede livre em cada execução; sob uma deficiência de posto, o sigma principal é publicado como NULL com um estado, nunca lido a partir de uma inversa quase singular. O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO calendário é emitido a par do valor calculado, com a razão, juntamente com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — pelo que a razão é a anisotropia que o pressuposto descartou. O fecho do atraso tau_ik = tau_ij + tau_jk faz com que apenas n-1 das n(n-1)/2 linhas de base sejam geometricamente independentes; o relatório indica as duas contagens. MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, pelo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado de sessão previsto; o sigma do atraso, as coordenadas das estações e o calendário são entradas. A derivada parcial que a jacobiana do atraso geométrico deixa de fora (o termo de Shapiro diferenciado) é medida por diferença finita e emitida. Não é um produto geodésico.

# attr:alt
seg-19c383444296 = O gráfico que o motor escreve para scenarios/lunar-vlbi-fim.toml, tipo de cenário lunar-vlbi-fim

# text
seg-e01f77d493a0 = Observável modelado do atraso VLBI geodésico lunar: uma linha de base terrestre (duas estações em terra, GCRS) observa um sinal unidirecional de uma baliza da superfície lunar da classe NovaMoon. Emite o atraso de campo próximo por diferença de duas distâncias, a sua taxa e a correção de campo próximo por curvatura da frente de onda ao longo de uma passagem — verificada de forma cruzada face ao observável Δ-DOR de onda plana da mesma base de código no limite de campo distante, com derivadas parciais verificadas por diferenças finitas. O percurso analítico predefinido é MODELLED e traz as ressalvas de consistência de referencial, de movimento polar xp=yp={ "0" } e de onda plana versus campo próximo. Definir planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path executa em vez disso o percurso por núcleos (DE440, MOON_PA_DE440, ITRF93; tempos de luz baricêntricos convergidos; acrescenta as derivadas parciais da baliza e da estação da época), cujo atraso newtoniano e cujas derivadas parciais concordam com os tempos de luz convergidos do NAIF SPICE até { "0.06" } ps e { "7.4e-9" }. Não validado face a dados VLBI reais.

# attr:alt
seg-07d97fc1abac = O gráfico que o motor escreve para scenarios/lunar-vlbi.toml, tipo de cenário lunar-vlbi

# text
seg-28c6a5644152 = Análise modelada do volume de serviço de navegação lunar a partir de uma constelação de órbita lunar da classe Moonlight/LCNS, ILLUSTRATIVE e de fontes públicas (sem afiliação à ESA): varre uma grelha selenográfica de latitude/longitude ao longo de um horizonte temporal e indica DOP / cobertura / disponibilidade (≥{ "4" } sats E PDOP < limiar) mais uma envolvente generalizada de níveis de proteção ARAIM lunares (HPL/VPL) sobre o volume. A geometria do DOP REAPROVEITA o núcleo VALIDATED face ao gnss_lib_py (crate::orbit::dop); o nível de proteção REAPROVEITA a maquinaria ARAIM lunar LNIS do LunaNet (crate::lunar, σ_URE≈{ "30" } m) e reduz-se ao nível de proteção existente do polo sul como caso particular. Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides LCNS/NRHO reais corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo em precessão). Determinístico (geometria pura). Sem aval de TRL, de herança de voo nem de agências.

# attr:alt
seg-edb738273a3a = O gráfico que o motor escreve para scenarios/moonlight-service-volume.toml, tipo de cenário moonlight-service-volume

# text
seg-4e31c8daf798 = Registo

# text
seg-efd15cff3d32 = MODELLED (etiqueta de resultado)

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/lunar-and-cislunar.md
seg-a240ef37dc6d = Fonte: <c1/>

# text
seg-befef5f2f8dd = Lunar e cislunar (família de tipos de cenário)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Páginas de tema: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Executar uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-15b8e26dc24b = Folha de contactos dos gráficos que o motor escreve para os tipos da família Lunar e cislunar

# text
seg-fd2a12be04c2 = Passagem de nível de proteção ARAIM no polo sul lunar vs um conjunto representativo de relés LunaNet.

# text
seg-240eb5858113 = Taxa de relógio relativista Terra–Lua modelada (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, indicada com o valor publicado de { "56" }–{ "59" }

# text
seg-177bff8d753e = Orçamento de erro de tempo de ponta a ponta do Tempo Coordenado Lunar (LTC) MODELLED: os sete termos de erro do LTC reunidos como curvas de erro de tempo x_i(τ) sobre toda uma grelha de tempos de média, somados pela raiz da soma dos quadrados em x_Σ(τ), e o c

# text
seg-df0437ef8324 = Observável modelado de atraso VLBI geodésico lunar: uma linha de base terrestre (duas estações terrestres, GCRS) observa um sinal unidirecional de um farol à superfície lunar de classe NovaMoon.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Covariância das coordenadas de estações VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um PLANO explícito (linhas de base x épocas) numa matriz de informação de Fisher, invertida, e indi

# text
seg-23706714da99 = Estimador em lote modelado conjunto multitécnica de OD lunar + relógio sobre uma rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos VLBI geodésicos de linha de base terrestre, distâncias estação↔satélite locais lunares

# text
seg-2359450b3967 = Realização modelada do referencial lunar: um ajuste de datum de Helmert (similaridade) de 7 parâmetros — { "3" } translação, { "3" } rotação de ângulo pequeno, { "1" } escala — que liga um conjunto estimado de pontos MCMF derivados de coordenadas selenográficas c

# text
seg-2a5af9961e99 = Datum de referencial de Helmert de sete parâmetros determinado por uma CAMPANHA DE OBSERVAÇÃO SIMULADA e não por uma transformação injetada.

# text
seg-3615bea1ea75 = Datum de referencial lunar de Helmert de sete parâmetros determinado por uma campanha de observação REAL e ARQUIVADA e não por uma simulada.

# text
seg-5413116b8b42 = Análise modelada de volume de serviço de navegação lunar a partir de uma constelação de órbita lunar ILLUSTRATIVE, de fontes públicas, de classe Moonlight/LCNS (sem afiliação à ESA): varre uma grelha de lat/lon selenográfica sobre

# text
seg-a0e202b3566c = PNT DIFERENCIAL lunar modelado (um análogo lunar de DGNSS/SBAS): uma estação de referência de classe NovaMoon numa localização selenográfica CONHECIDA calcula correções diferenciais por satélite a partir de uma ILLUSTRATIVE

# text
seg-ed4ec8b6378c = Cobertura modelada de estação de referência lunar: um varrimento de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores polar sul e um dia de épocas.

# text
seg-aeec32be6092 = Aumentação por faróis de superfície de um serviço de navegação orbital lunar, como uma tabela executável de antes/depois.

# text
seg-b28693368acd = Exportação modelada de interoperabilidade lunar: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio baseadas em CCSDS e alinhadas com LunaNet/IOAG, com aderência à norma de ida e volta / de campos

# text
seg-d88605893c05 = Observabilidade MODELLED de constelação cislunar planar (P6): segue uma constelação planar DRO de quatro veículos espaciais com correção diferencial, com medição de distâncias entre satélites, e indica quanto de um veículo espacial

# text
seg-8eaec90d1df5 = Ensaio MODELLED de estimador independente do limiar de observabilidade do comprimento de arco cislunar.

# text
seg-9619b3d699c6 = Superfície de ataque à segurança dos sinais de navegação à superfície lunar (P1): compõe as análises abertas de segurança de sinais numa única execução acessível a partir do binário.

# text
seg-64c78e211181 = Jamming de RF nativo lunar: razão jammer-sinal por satélite, C/N₀ efetivo e perda de bloqueio para um utilizador à superfície selenográfica sob um jammer à superfície lunar (ou elevado), sobre os dados ilustrativos de fontes públicas

# text
seg-df68720ee7a5 = Receção de GNSS terrestre à distância lunar, a camada de sinal fraco que o artigo sobre resiliência a conflitos refere e para a qual o motor não tinha modelo.

# text
# c1: study
seg-e6475fe9f443 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos num único tipo selecionado por <c1/>: od-consistency (determinação de órbita a bordo por GNSS terrestre em

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-da20b48985b9 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-integrity</a1>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-0f0b2d0ca0b4 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-time-offset</a1>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-time-budget</a1>.

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-79140f2544ea = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

# text
seg-de468e4d4b46 = <b>Registo:</b> MODELLED { "3" } · VALIDATED { "3" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-vlbi</a1>.

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-7da3c3ff2386 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-3119d4005897 = <b>Registo:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-vlbi-fim</a1>.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-6f59a33a35b3 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-142f2253e4d6 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-joint-od-clock</a1>.

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-32c31af24e1b = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-73c0415efd2f = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-frame-realisation</a1>.

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-96efcb8d55d1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-ce2f0f85dda4 = <b>Registo:</b> MODELLED { "2" } · VALIDATED { "3" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-frame-campaign</a1>.

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-d9e24a9a8c0c = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-4f05fad4b146 = <b>Registo:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-llr-datum</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-8d9e0277303e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-6fe67fa619d0 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-c83350735643 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-differential-pnt</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-facc442295f1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

# text
seg-8a2f6f535c4a = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-station-coverage</a1>.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-a790c54ac1aa = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-4efffcd615df = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-019ca0f1051e = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-interop-export</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-28695dd2ecc3 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-af5d871bc69e = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>cislunar-observability</a1>.

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
seg-f646e9fd7553 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-5e7bd8bb1adf = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>cislunar-arc-recovery</a1>.

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-3c514f3acc78 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

# text
seg-00b06a4fc0e0 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-attack-surface</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-079d2bb805f1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-63d4157e2294 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-jamming</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-7bb977529f30 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-287f89e6bf6b = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>earth-gnss-lunar</a1>.

# text
# c1: study
# c2: seed
# c3: orbit
# c4: gnss
# c5: ground
# c6: monte_carlo
# c7: surface
# c8: llr
# c9: orbiter
# c10: gravimeter
# c11: clock
# c12: techniques
# c13: nominal
seg-f7ed8b60e7d1 = Campos obrigatórios: <c1/>. Opcionais: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-41e50e49da99 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Anterior</s1>Navegação em órbita terrestre baixa

# text
seg-74c6bf83988e = <s1>Seguinte</s1>Análise de missão, ligações e operações espaciais
