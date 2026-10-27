# docs--kinds-lunar-and-cislunar: translations (pt-BR)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: independence
seg-f994c81583bf = Teste MODELLED de estimador independente do limiar de observabilidade do comprimento de arco cislunar. Esse limiar é uma leitura de POSTO sobre a matriz de observabilidade montada a partir das linhas ANALÍTICAS do jacobiano de distância e da matriz de transição de estado variacional ANALÍTICA, e a sua verificação cruzada por filtro de informação em raiz quadrada incorpora essas mesmas linhas — uma verificação de consistência entre duas máquinas numéricas, não uma corroboração. Este tipo de cenário fornece o árbitro que faltava: um estimador de mínimos quadrados em lote que de fato RECUPERA o estado inicial do chefe a partir de medidas simuladas, com as derivadas parciais da medida tomadas como DIFERENÇAS FINITAS CENTRAIS do modelo direto composto. Ele não chama nenhuma linha de jacobiano analítico, nenhuma STM variacional, nenhuma decomposição em valores singulares ou autovalores, nenhuma tolerância de posto e nenhum filtro de informação em raiz quadrada — uma guarda de texto-fonte em tests/cislunar_arc_recovery_reference.rs torna isso verificável — enquanto a dinâmica (o mesmo fluxo RK4 do CR3BP), as condições iniciais (a mesma constelação corrigida diferencialmente), o observável escalar e a grade de épocas são compartilhados deliberadamente e nomeados no bloco <c1/> emitido, porque duas análises de um mesmo problema físico precisam concordar quanto à física para serem comparáveis. Dois critérios, cada um varrido ao longo de cinco décadas do seu próprio limite: RECUPERAÇÃO SEM RUÍDO (o erro de estado final de cada tentativa com semente no máximo recovery_factor vezes o seu deslocamento a priori — o análogo do posto, sem nenhuma tolerância de valor singular) e ESTIMABILIDADE POR MONTE CARLO (o erro RMS de posição medido sobre um conjunto de ruído com semente abaixo de um limite declarado — o análogo da estimabilidade, medido e não previsto). Suporta o caso planar de quatro estados e o espacial de seis estados, as famílias DRO / halo L2 / NRHO L2, os observáveis de distância e de taxa de distância, e uma parametrização polar centrada na Lua em que a transformação é aplicada ao ESTADO e o modelo direto é rediferenciado ali. MEASURED na grade planar de DRO publicada: o estimador recupera o caso de quatro estados a partir de { "0.782609" } h contra os { "2.086957" } h do critério de posto em rel_tol { "1e-6" } (razão { "0.375" }) — o limiar de posto NÃO é corroborado como fronteira de recuperabilidade — enquanto a fronteira de estimabilidade medida cai na mesma célula da grade que a formal, { "5.739130" } h, e a curva de erro medida reproduz o 1 sigma formal ao longo de { "21" } comprimentos de arco com uma razão de média geométrica de { "0.98" }. MODELLED: o projeto da constelação, a grade de épocas, o único enlace rastreado, a magnitude do deslocamento, o sigma da medida e os dois limites declarados. Não é um produto de desempenho de navegação certificado.

# attr:alt
seg-2fe411ae2153 = O gráfico que o motor grava para scenarios/cislunar-arc-recovery.toml, tipo de cenário cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = Observabilidade MODELLED de constelação cislunar planar (P6): rastreia uma constelação planar de DRO corrigida diferencialmente, com quatro espaçonaves e alcance intersatélites, e informa quanto do estado de quatro componentes [x,y,ẋ,ẏ] de uma espaçonave o arco torna observável. Emite ({ "1" }) a tabela de posto contra comprimento de arco para um único enlace só de distância — de posto 1 instantâneo, crescendo em direção ao estado completo de quatro componentes à medida que o arco se estende (P6 Tabela { "1" }); ({ "2" }) o espectro de autovalores do gramiano de observabilidade + o número de condição ao longo do arco; ({ "3" }) a comparação de posto instantâneo só de distância contra distância + taxa de distância (a alavanca de projeto do Doppler) mais o relato de GDOP singular só com distância / definido com distância + taxa; e ({ "4" }) uma validação cruzada independente por SRIF cuja covariância a posteriori se torna finita / bem condicionada exatamente no arco em que o posto observável chega a quatro. Núcleo VALIDATED: o posto observável é um limiar de valor singular revelador de posto, verificado de forma cruzada contra o posto de autovalores do gramiano; o espectro de autovalores obedece aos invariantes espectrais (traço=Σλ, det=Πλ, Frobenius²=Σλ²); a STM variacional é a STM do CR3BP validada por diferenças finitas; as linhas do jacobiano de distância/taxa de distância são derivadas parciais analíticas validadas por diferenças finitas (verificadas de forma cruzada contra o observável de taxa de distância em 3-D do crate); as quatro condições iniciais são DROs planares corrigidas diferencialmente que fecham com um resíduo de periodicidade estreito e são retrógradas; a transição de posto é validada de forma cruzada contra o filtro de informação em raiz quadrada do crate (covariância a posteriori finita exatamente em posto completo, cond(P)=cond(OᵀO)); um instantâneo com deficiência de posto é sinalizado como GDOP indefinido (fim condition=inf), nunca como um valor finito espúrio — a mesma guarda de geometria singular que pvt::solve_spp aplica. MODELLED: o projeto da constelação (amplitudes e fases do perilúnio dos DROs) e a progressão específica de posto que ele produz. Não é um produto de desempenho de navegação certificado.

# attr:alt
seg-f15bbf30b0dd = O gráfico que o motor gera para scenarios/cislunar-observability.toml, tipo de cenário cislunar-observability

# text
seg-c8a8be4b8894 = Recepção de GNSS da Terra à distância lunar, a camada de sinal fraco que o artigo sobre resiliência a conflitos nomeia e para a qual o motor não tinha modelo. Um satélite GNSS aponta a sua antena para a Terra; um receptor perto da Lua fica a cerca de quinze vezes o raio orbital de distância, de modo que três coisas pesam ao mesmo tempo. A Terra OCULTA O EIXO DE VISADA: a partir de { "26,560" } km ela subtende um semiângulo de { "13.9" } graus, de modo que qualquer raio dirigido à Lua deve deixar o transmissor com pelo menos esse afastamento do nadir, o que remove o pico do feixe antes de qualquer potência ser calculada. O que resta são A BORDA DO LÓBULO PRINCIPAL E OS LÓBULOS LATERAIS, o regime em que a carga útil LuGRE realmente operou em { "2025" }. E a perda no espaço livre é de cerca de { "208" } dB em L1, aproximadamente { "25" } dB a mais do que um usuário terrestre paga. O relatório emite uma linha por satélite (ângulo fora do eixo, ocultação pela Terra, distância, perda de percurso, ganho de transmissão nesse ângulo, potência recebida, densidade de portadora sobre ruído) e agrega apenas os enlaces que superam o limiar de rastreamento. TAMBÉM INFORMA O CONDICIONAMENTO, porque é isso que define esta camada: todo satélite visível está dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas, a diluição de precisão é enorme, e uma solução de GNSS da Terra à distância lunar é uma observação de grau de TEMPORIZAÇÃO muito mais do que de grau de posição. MODELLED, e o diagrama de transmissão é o motivo: o ganho em função do ângulo é uma abertura circular uniforme (Airy), enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal conformado e lóbulos laterais que não são de Airy. Existem diagramas medidos e eles não estão incluídos aqui, de modo que ordenações e ordens de grandeza são significativas, mas o dB de um único satélite não é. DELIBERADAMENTE AUSENTES, cada uma tornando o balanço otimista: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda por polarização, apontamento ou implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA (distância mais direção inercial) em vez de uma consulta a efemérides, porque a grandeza sob teste é o enlace e a geometria do feixe. Elevar esta linha a validada exige um diagrama de transmissão medido e pontos normais do LuGRE; nenhum dos dois está no repositório e nenhum é inventado aqui.

# attr:alt
seg-cf1dce5fc824 = O gráfico que o motor gera para scenarios/earth-gnss-lunar.toml, tipo de cenário earth-gnss-lunar

# text
seg-004c56ded47f = Superfície de ataque à segurança de sinais da navegação na superfície lunar (P1): compõe as análises abertas de segurança de sinais em uma única execução alcançável pelo binário. Informa ({ "1" }) a potência recebida do AFS e o seu EXCEDENTE de potência em relação a uma referência GPS terrestre, além da faixa de sensibilidade de 12-18 dB como uma varredura genuína em vários eixos sobre as entradas do enlace (nível de referência x EIRP x distância oblíqua), com a reconciliação do fator linear de 25x arredondado / 28x não arredondado. REVISADO (regra R4): isto informava um DÉFICIT de potência de { "15.6" } dB e um fator de 32x/36x até que a referência GPS fosse corrigida de -125 / -128.5 (que são os valores em dBm) para -155 / -158.5 dBW, os valores do ICD-GPS-200 que o módulo de interferência sempre carregou. O sinal se inverte: o sinal lunar AFS modelado é { "14.4" } dB MAIS FORTE do que o GPS L1 C/A terrestre, não mais fraco. A própria potência recebida não mudou nem um bit, e o fator linear é o antigo dividido por exatamente { "1000" }, que é exatamente o deslocamento de { "30" } dB entre dBm e dBW; ({ "2" }) a potência de transmissão exigida do atacante para falsificar (J/S = { "3" } dB) e para negar (J/S = { "30" } dB) em cada distância de afastamento, o inverso do enlace J/S; ({ "3" }) a área de captura orbital sob um diagrama real de antena de abertura uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), uma calota sub-hemisférica limitada pela altitude cujo limbo NÃO é capturado; ({ "4" }) um resultado calculado de entrada em captura de falsificação na malha de rastreamento (um falsificador de código casado, com dada vantagem de potência e dado deslocamento de código, realmente arrasta a DLL/PLL) em vez do limiar afirmado de { "3" } dB; ({ "5" }) o alcance do horizonte geométrico de um transmissor elevado na superfície de um corpo sem atmosfera; e ({ "6" }) o orçamento de autenticação OSNMA/TESLA ({ "20" } bit/s de sobrecarga = ~{ "40" } % de uma mensagem de navegação AFS de { "50" } bit/s, latência de divulgação de chave, falsificação de { "2" }^-40). Um corpo vazio reproduz a linha de base P1; toda entrada tem valor padrão e pode ser substituída. Os subresultados VALIDATED carregam a referência independente do seu módulo de origem (radiometria em dB de forma fechada; ida e volta do J/S inverso; diagrama de Airy contra Bessel de A&S e geometria de calota esférica; entrada em captura de DLL/PLL contra Kaplan & Hegarty; identidade de horizonte tangente esférico contra eo_payload; dimensionamento dos campos do SIS-ICD do OSNMA). MODELLED: as magnitudes representativas de geometria e potência e os valores específicos das células do mapa de captura. Não é um produto de segurança certificado.

# attr:alt
seg-de295af20c55 = O gráfico que o motor escreve para scenarios/lunar-attack-surface.toml, tipo de cenário lunar-attack-surface

# text
seg-142ad48fe422 = Aumento por balizas de superfície de um serviço lunar de navegação em órbita, como uma tabela executável de antes e depois. Um usuário polar sul vê um conjunto orbital esparso em uma faixa estreita do céu, de modo que a geometria de medição de distância é mal condicionada; algumas BALIZAS DE SUPERFÍCIE LEVANTADAS TOPOGRAFICAMENTE fornecem as linhas de linha de visada de baixa elevação e amplo azimute que um conjunto todo sobre a cabeça não tem, e a diluição horizontal da precisão colapsa. O cenário informa três configurações em uma época -- só os satélites, os satélites mais as balizas visíveis, e uma constelação maior como caminho alternativo para a mesma geometria -- cada uma com as suas contagens de fontes visíveis, o seu DOP completo e a precisão realizada de 1 sigma em METROS, obtida multiplicando por um erro equivalente de medição de distância do usuário por baliza, montado como a raiz da soma dos quadrados dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade das balizas é o horizonte geométrico de duas alturas da Lua sem ar (sem atmosfera, de modo que o limite é exato), e a montagem do DOP é o mesmo núcleo verificado de forma cruzada contra o gnss_lib_py em tests/dop_reference.rs. POR QUE ESTE TIPO DE CENÁRIO EXISTE: o módulo por trás dele está no motor e é verificado contra um caminho de DOP independente desde L08/L09, mas não era alcançável a partir de uma execução -- sem tipo de cenário, sem ramo de despacho, sem arquivo incluído. O README anunciava a capacidade e a matriz de verificação NÃO trazia nenhuma linha para ela, de modo que ela era ao mesmo tempo afirmada na prosa e não afirmada no registro, enquanto era inalcançável no motor. Os valores padrão são a geometria que já tem um golden registrado (um usuário a -80 graus com uma antena de { "2" } m, três balizas em -80/0, -79/+{ "60" } e -79/-60 a { "2" } km, um instantâneo LCNS ilustrativo de seis satélites em t={ "0" }, uma máscara de { "5" } graus), de modo que uma execução simples reproduz uma tabela que uma referência independente já cobre em vez de inventar números novos. MODELLED: o projeto da constelação, a posição das balizas e toda magnitude do orçamento de erros são entradas ilustrativas, não um levantamento em campo nem um enlace medido; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE têm âncora externa. Não é um compromisso de desempenho de serviço.

# attr:alt
seg-a53e353706f6 = O gráfico que o motor escreve para scenarios/lunar-beacon.toml, tipo de cenário lunar-beacon

# text
seg-8ac5ac006ae7 = PNT DIFERENCIAL lunar modelado (um análogo lunar de DGNSS/SBAS): uma estação de referência da classe NovaMoon em um local selenográfico CONHECIDO calcula correções diferenciais por satélite a partir de uma constelação da classe Moonlight/LCNS, ILLUSTRATIVE e de fonte pública (NovaMoon citada apenas como uma CLASSE de sistema, sem afiliação com a ESA), e um usuário deslocado por baseline_km as aplica, de modo que os erros de órbita + relógio de MODO COMUM se cancelem. O termo de relógio se cancela EXATAMENTE (uma identidade algébrica); o termo de órbita deixa apenas a projeção da diferença de linha de visada, que → { "0" } quando a linha de base → { "0" } (o piso de descorrelação espacial) e cresce ≈ linearmente com a linha de base. Informa o erro de posição 3-D do usuário COM e SEM correções, o fator de redução, a curva de erro contra a linha de base e um nível de proteção do usuário que REAPROVEITA o mecanismo SBAS da DO-229E (crate::sbas) com o resíduo diferencial σ. MODELLED — identidade de cancelamento exato + modelo de descorrelação de primeira ordem; não validado com dados reais; sem TRL, herança nem endosso de agência. Determinístico se houver semente.

# attr:alt
seg-8e67df89448a = O gráfico que o motor escreve para scenarios/lunar-differential-pnt.toml, tipo de cenário lunar-differential-pnt

# text
seg-55679aff66db = Datum de referencial de Helmert (de similaridade) de sete parâmetros conduzido por uma CAMPANHA DE OBSERVAÇÃO SIMULADA, e não por uma transformação injetada. Uma rede de estações terrestres observa um catálogo de balizas na superfície lunar segundo um cronograma explícito; as derivadas parciais do atraso VLBI lunar são acumuladas ao longo desse cronograma em uma matriz de informação de Fisher das coordenadas das balizas, exatamente como faz o lunar-vlbi-fim; e essa informação é propagada pelo projeto de Helmert A = [I3 | [p]_x | p] nos pontos do catálogo até a covariância do datum H = A^T M_b A, diagnosticada por crate::fim::crlb. NENHUMA transformação é injetada e nada é recuperado de uma resposta plantada, de modo que a precisão do datum informada deriva do programa de observação: reduzir o sigma do atraso à metade a reduz exatamente à metade, e alongar o arco a melhora porque a libração que o relatório MEDE (sub_earth_direction_sweep_deg) é o que separa a coordenada da baliza na linha de visada das do plano do céu. Posto, defeito de datum, número de condição, o espectro completo, as direções não observáveis NA BASE DE SETE PARÂMETROS, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução; um parâmetro que a campanha não restringe é publicado como NULL com um status, nunca lido de uma inversa quase singular. A correlação de erro entre balizas é medida, não presumida: com as estações mantidas fixas nenhuma observação toca duas balizas, de modo que a matriz de informação é exatamente diagonal em blocos (offblock_fraction { "0" }), e com as estações estimadas o bloco marginalizado por Schur é acoplado, com a correlação induzida impressa e toda a propagação refeita com ela descartada, de modo que o preço de uma hipótese de independência é um número. A mesma propagação sob um sigma isotrópico por coordenada, e o erro de recuperação que o cenário lunar-frame-realisation informa, são ambos executados aqui e impressos ao lado do valor da campanha com as suas razões. MODELLED: o catálogo de balizas tem fonte, mas a CAMPANHA é simulada — a rede de estações e o sigma do atraso são entradas ilustrativas, as observações individuais de atraso são tratadas como independentes, e as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, de modo que a covariância do datum é um limite de Cramer-Rao para um conjunto reduzido de parâmetros. Não é um produto geodésico.

# attr:alt
seg-883d94b321b4 = O gráfico que o motor escreve para scenarios/lunar-frame-campaign.toml, tipo de cenário lunar-frame-campaign

# text
seg-0c4c119abfca = Realização modelada do referencial lunar: um ajuste de datum de Helmert (de similaridade) de 7 parâmetros — { "3" } de translação, { "3" } de rotação de ângulo pequeno, { "1" } de escala — que amarra um conjunto estimado de coordenadas de pontos MCMF derivadas de coordenadas selenográficas a um datum por mínimos quadrados ponderados (crate::batch_ls::gauss_newton), mais uma amarração de orientação simples que exprime a pequena rotação realizada em torno dos eixos ICRF em relação à orientação do corpo WGCCRE da IAU { "2015" }. O cenário injeta uma pequena transformação conhecida (translação de ~dezenas de m, rotação de ~µrad, escala de ~{ "1e-7" }) em uma rede sintética de pontos bem distribuída, acrescenta ruído gaussiano com semente, recupera o datum e informa a transformação recuperada, o erro de recuperação por parâmetro contra a verdade injetada e o resíduo RMS pós-ajuste. Autoconsistência MODELLED — recupera uma transformação de similaridade injetada (sem ruído, até cerca da precisão de máquina), NÃO uma realização contra dados reais de rastreamento/VLBI; determinístico (com semente); sem TRL, herança nem endosso de agência.

# attr:alt
seg-f3a6d69d0225 = O gráfico que o motor escreve para scenarios/lunar-frame-realisation.toml, tipo de cenário lunar-frame-realisation

# text
# c1: study
seg-d0fb90f506c9 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos sob um único tipo de cenário, selecionados por <c1/>: od-consistency (determinação de órbita a bordo por GNSS terrestre em uma NRHO ou ELFO contra determinação de órbita radiométrica independente em solo, julgadas pelas suas próprias covariâncias em um Monte Carlo com semente), carrier-phase (fase da portadora com dupla diferença conjunta entre superfície e orbitador e resolução de ambiguidade inteira com LAMBDA), frame-coestimation (uma estação de superfície e orbitadores acrescentados à medição de distância por estações terrestres para o datum de referencial lunar de sete parâmetros), space-tie (GNSS, VLBI e medição laser em uma mesma espaçonave, precisão da amarração de referencial contra o erro de amarração local) e geodesy-sensitivity (informação de Fisher dos números de Love lunares h2, k2, l2 e da libração física a partir de medição laser, rastreamento de orbitadores, um gravímetro de superfície e um relógio de superfície). Um modelo restrito de três corpos com simplificações declaradas; a numérica é verificada contra programas independentes e nada é comparado com uma medição de uma grandeza lunar.

# text
seg-f3b4a80a739b = sem gráfico: o exemplo não escreve nenhum gráfico

# text
seg-4b6daea39f5c = Passagem de nível de proteção ARAIM no polo sul lunar contra um conjunto representativo de retransmissores LunaNet. sigma_ure_m expõe a precisão de medição de distância do sinal no espaço (os níveis de proteção escalam linearmente com ela, de modo que varrê-la responde que precisão de medição de distância um limite de alerta exige). O padrão é o caso histórico do polo sul da classe LNIS.

# attr:alt
seg-610fa190a393 = O gráfico que o motor escreve para scenarios/lunanet-araim.toml, tipo de cenário lunar-integrity

# text
seg-5a4dcb93a643 = Exportação de interoperabilidade lunar modelada: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio baseadas em CCSDS e alinhadas com LunaNet/IOAG, com ida e volta e aderência à norma dos campos. REAPROVEITA o emissor+analisador CCSDS OEM { "2.0" } do crate (crate::oem), reetiquetado para o contexto lunar — o REF_FRAME do OEM leva o referencial do corpo lunar WGCCRE da IAU { "2015" } (MOON_ME / MOON_PA), o TIME_SYSTEM a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON — sobre uma efeméride de amostra ilustrativa da classe LCNS (posições de crate::lunar_service, velocidade por diferença finita). Também emite um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefatos no envelope KIF existente (crate::interchange) com o rótulo de honestidade MODELLED. Informa artefatos emitidos, contagem de linhas do OEM, êxito na aderência à norma dos campos + lista de campos presentes/ausentes, ida e volta do OEM ok, ida e volta dos metadados de tempo ok, e tamanho do KIF em bytes. MODELLED — ida e volta determinística + aderência à norma dos nomes de campo contra o CCSDS OEM publicado + a semântica de campos do LunaNet/IOAG é a referência independente; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efeméride ilustrativa de fonte pública, sem afiliação com a ESA; sem TRL, herança nem endosso de agência.

# attr:alt
seg-0e86ff364c17 = O gráfico que o motor escreve para scenarios/lunar-interop-export.toml, tipo de cenário lunar-interop-export

# text
# c1: jamming
seg-a91a9ad5d8d1 = Interferência de RF nativa lunar: razão interferidor-sinal por satélite, C/N₀ efetivo e perda de sincronismo para um usuário na superfície selenográfica sob um interferidor na superfície lunar (ou elevado), sobre a constelação em órbita lunar ilustrativa, de fonte pública, da classe Moonlight/LCNS. Compõe a física aberta de interferência existente (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) com a geometria do céu lunar existente (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rededuzida. Diferentemente do tipo de cenário <c1/> da Terra, o trecho do sinal NÃO é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio orçamento de enlace EIRP − FSPL(distância oblíqua), de modo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Informa UMA LINHA POR ENLACE (época, satélite) VISÍVEL — azimute, elevação, distância oblíqua, as duas potências recebidas cuja diferença é o J/S, o J/S, o C/N₀ nominal e efetivo e o estado de sincronismo — mais valores agregados de mérito ao lado da (nunca no lugar da) tabela, e a mesma tabela como artefato CSV. Todo campo numérico emitido traz uma unidade e uma classe de proveniência. Os subresultados VALIDATED carregam a referência independente do seu módulo de origem (a equação antiinterferência e o enlace J/S de Kaplan & Hegarty §{ "9.4" }, referenciados externamente em tests/gnss_denied_jamming_resilience_reference.rs; a geometria lunar de lunar_service). A própria composição é verificada de forma cruzada contra um caminho independente de dois orçamentos de enlace (linkbudget::received_signal_power_dbw, uma expressão diferente de perda no espaço livre) até { "1e-9" } dB. MODELLED: a constelação ilustrativa, o EIRP / a potência do interferidor / os ganhos de antena / a temperatura de ruído representativos, e a ausência de sombreamento do terreno, de multipercurso, de dinâmica de AGC e de anulação adaptativa. Não é um produto certificado de negação de serviço. Com um interferidor configurado, o relatório traz também um CONTORNO DE NEGAÇÃO COM UMA FAIXA DE INCERTEZA, em vez de um contorno lido a partir de um único escalar: a distribuição completa medida do C/N₀ do sinal desejado sobre a tabela por satélite (n, mínimo, p05, p25, mediana, p75, p95, máximo, média, desvio-padrão amostral e a assimetria da própria amostra), e o contorno avaliado em cada uma dessas estatísticas de ordem sob AMBOS os critérios de negação que o motor reconhece — o vigente, de razão de potência (J/S = { "30" } dB, como em attack-surface e tracking-loop) e o de perda de sincronismo (C/N₀ efetivo caindo até tracking_threshold_dbhz, o critério que a própria coluna de estado deste relatório usa) — nos dois eixos do plano de negação (EIRP do interferidor exigido no afastamento do cenário, afastamento de negação no EIRP do cenário). Os extremos da faixa SÃO contour(p05) e contour(p95), o mesmo mapa de forma fechada aplicado aos próprios quantis da amostra: não um sigma ajustado à amostra e não a mediana ± k·desvio-padrão, com o desvio-padrão emitido por continuidade e usado por nada. Um quantil já igual ou abaixo do limiar de rastreamento não tem J/S finito de negação e as suas colunas de perda de sincronismo são nulas com um motivo contado, nunca um raio truncado.

# attr:alt
seg-6fe8b3c6c584 = O gráfico que o motor escreve para scenarios/lunar-jamming.toml, tipo de cenário lunar-jamming

# text
seg-200e58e189c2 = Estimador em lote conjunto, multitécnica, de OD lunar + relógio, modelado, em uma rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos VLBI geodésicos de linha de base terrestre, distâncias locais lunares estação↔satélite e distâncias entre satélites para recuperar, em conjunto, a posição 3-D de uma estação na superfície lunar, as posições de uma pequena constelação e o deslocamento de relógio de cada ativo a partir de uma verdade injetada. O resultado principal e honesto — o VLBI torna observável a posição 3-D completa da estação onde a medição de distância apenas local lunar deixa uma direção fracamente observada — é informado como o contraste de erro da estação com e sem VLBI. Recuperação simulada em malha fechada MODELLED (a verdade compartilha o modelo de observação), determinística (com semente), NÃO validada com dados reais; sem propagação de modelo de forças dentro do resolvedor; sem TRL, herança nem endosso de agência.

# attr:alt
seg-cfa051b87e59 = O gráfico que o motor escreve para scenarios/lunar-joint-od-clock.toml, tipo de cenário lunar-joint-od-clock

# text
seg-25455a33523c = Datum de referencial lunar de Helmert de sete parâmetros conduzido por uma campanha de observação REAL e ARQUIVADA, em vez de simulada. Enquanto o lunar-frame-campaign removeu a transformação injetada, mas ainda declarava a sua rede de estações, o seu cronograma e o seu sigma por observação como entradas ILLUSTRATIVE, este tipo de cenário toma os três a partir de medições: as épocas são os instantes de transmissão em solo de pontos normais arquivados do Consolidated Laser Ranging Data do ILRS, as observações são as distâncias laser realmente disparadas contra os cinco arranjos de retrorrefletores na Lua, e cada peso de observação é a precisão arquivada do próprio ponto normal, bin_rms/sqrt(n_raw), lida do arquivo. As coordenadas das estações vêm da solução SLR ITRF2020 do IERS (propagadas até a época pelas suas velocidades publicadas) e as coordenadas dos refletores da Tabela { "7" } do JPL DE430 no referencial de Terra média/rotação média que o modelo WGCCRE da IAU { "2015" } realiza. As derivadas parciais de distância se acumulam na matriz de informação de Fisher conjunta das coordenadas dos refletores e se propagam pelo mesmo projeto de Helmert até a covariância do datum, diagnosticada por crate::fim::crlb. Posto, defeito, condição, espectro, direções não observáveis na base de sete parâmetros, a direção mais fraca com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução, e um parâmetro sem restrição é publicado como NULL com um status. A correlação entre arranjos é MEASURED como exatamente zero, em vez de presumida, porque uma medição laser toca um único arranjo. Um registro que os catálogos não conseguem situar — uma estação sem posição ITRF publicada — é IGNORADO E CONTADO, nunca recebendo uma coordenada substituta. QUAIS ENLACES SÃO MEASURED E QUAIS SÃO MODELLED É O RELATÓRIO, NÃO UMA NOTA DE RODAPÉ: as efemérides do centro da Lua e a orientação do corpo pela IAU continuam modeladas e o seu tamanho combinado é emitido como o resíduo de distância unidirecional observado menos calculado sobre todos os pontos usados; troposfera, marés do corpo sólido, excentricidade da estação, movimento polar, UT1-UTC, atraso relativístico e relógios das estações estão ausentes e dentro desse resíduo. Como um erro de efemérides chega a uma covariância apenas pela direção de cada linha de visada, toda execução também resolve de novo o datum inteiro com todas as derivadas parciais inclinadas por sensitivity_tilt_deg (com sinal alternado) e emite a razão, de modo que a insensibilidade da covariância às efemérides modeladas é um número, e não um argumento. Os próprios valores da campanha simulada são EXECUTADOS e impressos ao lado dos medidos, não transcritos. MODELLED: os valores de sete parâmetros são um limite de Cramer-Rao para um conjunto reduzido de parâmetros em um cronograma real — não um datum resolvido, não uma análise LLR e não um produto geodésico. A fatia de dados reais registrada acompanha o repositório, mas não o crate publicado; aponte data_dir para uma cópia dela.

# attr:alt
seg-e4da113cbe18 = O gráfico que o motor escreve para scenarios/lunar-llr-datum.toml, tipo de cenário lunar-llr-datum

# text
seg-f7ea776e70c9 = Cobertura modelada da estação de referência lunar: uma varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas. Uma estação de referência diferencial em um local conhecido do polo sul corrige uma constelação declarada (kepleriana ilustrativa ou efemérides tabeladas) com um erro de sinal no espaço, um erro de levantamento, uma latência de correção e uma quantização de enlace declarados; por ponto e sobre a região, informa o erro de posição corrigido e não corrigido por percentil (3-D, horizontal, vertical), a disponibilidade, a cobertura contra um limiar declarado, os níveis de proteção da DO-229E, o raio de cobertura por azimute e o orçamento do enlace de correção na estação e no pior ponto. Não é uma declaração sobre o desempenho de nenhum sistema real; sem afiliação nem endosso de nenhuma agência. MODELLED.

# attr:alt
seg-922b8656fcae = O gráfico que o motor escreve para scenarios/lunar-station-coverage.toml, tipo de cenário lunar-station-coverage

# text
seg-cac3a0bcbfc6 = Orçamento de erro de tempo de ponta a ponta do Tempo Lunar Coordenado (LTC), MODELLED: os sete termos de erro do LTC montados como curvas de erro de tempo x_i(τ) sobre toda uma grade de tempos de média, somados em raiz em x_Σ(τ), e o τ de CRUZAMENTO relógio-referencial em que o termo crescente do relógio ultrapassa o termo constante de realização do referencial em tempo real (abaixo dele o orçamento é limitado pelo referencial, acima dele é limitado pelo relógio) — a resposta honesta ao artefato de um único τ. As inclinações em τ são de forma fechada e verificáveis analiticamente (relógio τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, pisos τ^{ "0" }, medição τ^{ "{" }-1/2{ "}" }) e as linhas de relógio reproduzem as especificações publicadas de relógio de um dia (crate::clock_specs); as MAGNITUDES dos pisos do enlace de RF/óptico, da realização do referencial, do resíduo relativístico e das efemérides são alocações modeladas do orçamento (valores padrão documentados, substituíveis por quem chama), não medições. A contribuição é o τ de cruzamento reproduzível, não um número certificado por termo; não certificado para a manutenção operacional da hora.

# attr:alt
seg-56fe184f2a12 = O gráfico que o motor escreve para scenarios/lunar-time-budget.toml, tipo de cenário lunar-time-budget

# text
seg-7f3e13712f10 = Taxa relativística modelada do relógio Terra–Lua (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, informada com a faixa publicada de { "56" }–{ "59" } µs/dia, mais o deslocamento acumulado ao longo de um horizonte.

# attr:alt
seg-e9deb6ed41c1 = O gráfico que o motor escreve para scenarios/lunar-time-offset.toml, tipo de cenário lunar-time-offset

# text
seg-1bc37634ba9f = Covariância das coordenadas das estações do VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CRONOGRAMA explícito (linhas de base x épocas) em uma matriz de informação de Fisher, invertida, e informada como a covariância das coordenadas das estações e o sigma de cada coordenada de cada estação — uma saída calculada do motor, em vez de uma precisão escalar de atraso empurrada por um fator de equipartição isotrópico presumido g = { "3" }. O estado traz coordenadas de estação FIXAS na Terra (ITRS), de modo que o jacobiano é a derivada parcial inercial girada pela matriz GCRS->ITRS de cada época: a rotação da Terra é o que torna essas coordenadas observáveis, e o relatório MEDE a varredura da linha de visada fixa na Terra e a declinação da baliza em vez de presumi-las. Uma observação é um par (linha de base, época) com AMBAS as estações acima da máscara de elevação, ponderada por 1/delay_sigma_s^{ "2" }. Informa posto, defeito de datum, número de condição, o espectro completo de informação, a matriz de covariância, os sigmas por estação, por eixo e 3-D, e o espaço nulo da rede livre em toda execução; sob uma deficiência de posto, o sigma principal é publicado como NULL com um status, nunca lido de uma inversa quase singular. O valor de equipartição c<em>delay_sigma_s</em>sqrt(g/N) para o MESMO cronograma é emitido ao lado do valor calculado com a razão, junto com o limite isotrópico do traço sqrt(p/trace(M)) que a desigualdade AM-HM torna um piso rígido — de modo que a razão é a anisotropia que a hipótese descartou. O fechamento de atraso tau_ik = tau_ij + tau_jk torna geometricamente independentes apenas n-1 das n(n-1)/2 linhas de base; o relatório declara as duas contagens. MODELLED: as efemérides do centro da Lua, os relógios das estações, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS e as observações são tratadas como independentes, de modo que a covariância é um limite de Cramer-Rao para um conjunto reduzido de parâmetros, não um resultado previsto de sessão; o sigma do atraso, as coordenadas das estações e o cronograma são entradas. A derivada parcial que o jacobiano do atraso geométrico deixa de fora (o termo de Shapiro diferenciado) é medida por diferença finita e emitida. Não é um produto geodésico.

# attr:alt
seg-19c383444296 = O gráfico que o motor escreve para scenarios/lunar-vlbi-fim.toml, tipo de cenário lunar-vlbi-fim

# text
seg-e01f77d493a0 = Observável modelado de atraso de VLBI geodésico lunar: uma linha de base terrestre (duas estações em solo, GCRS) observa um sinal unidirecional de uma baliza da classe NovaMoon na superfície lunar. Emite o atraso de campo próximo por diferença de duas distâncias, a sua taxa e a correção de curvatura de frente de onda de campo próximo ao longo de uma passagem — verificado de forma cruzada contra o observável Δ-DOR de onda plana da mesma base de código no limite de campo distante, com derivadas parciais verificadas por diferenças finitas. O caminho analítico padrão é MODELLED e traz as ressalvas de consistência de referencial, de movimento polar xp=yp={ "0" } e de onda plana contra campo próximo. Definir planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path executa em vez disso o caminho por kernel (DE440, MOON_PA_DE440, ITRF93; tempos de luz baricêntricos convergidos; acrescenta as derivadas parciais da baliza e da estação da época), cujo atraso newtoniano e cujas derivadas parciais concordam com os tempos de luz convergidos do NAIF SPICE a { "0.06" } ps e { "7.4e-9" }. Não validado contra dados reais de VLBI.

# attr:alt
seg-07d97fc1abac = O gráfico que o motor escreve para scenarios/lunar-vlbi.toml, tipo de cenário lunar-vlbi

# text
seg-28c6a5644152 = Análise modelada de volume de serviço de navegação lunar a partir de uma constelação em órbita lunar da classe Moonlight/LCNS, ILLUSTRATIVE e de fonte pública (sem afiliação com a ESA): varre uma grade selenográfica de latitude/longitude sobre um horizonte de tempo e informa DOP / cobertura / disponibilidade (≥{ "4" } satélites E PDOP < limiar) mais um envelope generalizado de nível de proteção ARAIM lunar (HPL/VPL) sobre o volume. A geometria do DOP REAPROVEITA o núcleo VALIDATED do gnss_lib_py (crate::orbit::dop); o nível de proteção REAPROVEITA o mecanismo ARAIM lunar LNIS da LunaNet (crate::lunar, σ_URE≈{ "30" } m) e se reduz ao PL existente do polo sul como caso particular. Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides reais LCNS/NRHO corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo com precessão). Determinístico (geometria pura). Sem TRL, herança nem endosso de agência.

# attr:alt
seg-edb738273a3a = O gráfico que o motor escreve para scenarios/moonlight-service-volume.toml, tipo de cenário moonlight-service-volume

# text
seg-4e31c8daf798 = Registro

# text
seg-efd15cff3d32 = MODELLED (rótulo do resultado)

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
seg-f964724ea446 = { "20" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Páginas de tópico: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Execute uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-15b8e26dc24b = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Lunar e cislunar

# text
seg-fd2a12be04c2 = Passagem de nível de proteção ARAIM no polo sul lunar contra um conjunto representativo de relés LunaNet.

# text
seg-240eb5858113 = Taxa relativística modelada de relógio Terra–Lua (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, informada com o { "56" }–{ "59" } publicado

# text
seg-177bff8d753e = Orçamento de erro de tempo do Tempo Lunar Coordenado (LTC) de ponta a ponta MODELLED: os sete termos de erro do LTC reunidos como curvas de erro de tempo x_i(τ) sobre toda uma grade de tempos de médias, somados pela raiz em x_Σ(τ), e o c

# text
seg-df0437ef8324 = Observável modelado de atraso de VLBI geodésico lunar: uma linha de base terrestre (duas estações em solo, GCRS) observa um sinal de sentido único de um farol de superfície lunar de classe NovaMoon.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Covariância das coordenadas de estação do VLBI lunar: as derivadas parciais do atraso do observável lunar-vlbi acumuladas ao longo de um CRONOGRAMA explícito (linhas de base x épocas) em uma matriz de informação de Fisher, invertida, e rep

# text
seg-23706714da99 = Estimador em lote conjunto multitécnica modelado de OD lunar + relógio em uma rede SIMULADA: um ajuste instantâneo de Gauss-Newton que funde atrasos de VLBI geodésico em linha de base terrestre, distâncias locais lunares estação↔satélite

# text
seg-2359450b3967 = Realização modelada de referencial de referência lunar: um ajuste de datum de Helmert (similaridade) de 7 parâmetros — { "3" } translação, { "3" } rotação de ângulo pequeno, { "1" } escala — que vincula um conjunto estimado de pontos MCMF derivados de coordenadas selenográficas c

# text
seg-2a5af9961e99 = Datum de referencial de Helmert (similaridade) de sete parâmetros conduzido por uma CAMPANHA DE OBSERVAÇÃO SIMULADA em vez de por uma transformação injetada.

# text
seg-3615bea1ea75 = Datum de referencial lunar de Helmert de sete parâmetros conduzido por uma campanha de observação REAL e ARQUIVADA em vez de uma simulada.

# text
seg-5413116b8b42 = Análise modelada de volume de serviço de navegação lunar a partir de uma constelação em órbita lunar ILLUSTRATIVE, de fonte pública, da classe Moonlight/LCNS (sem afiliação à ESA): varre uma grade de latitude/longitude selenográfica sobre

# text
seg-a0e202b3566c = PNT DIFERENCIAL lunar modelado (um análogo lunar de DGNSS/SBAS): uma estação de referência da classe NovaMoon em uma posição selenográfica CONHECIDA calcula correções diferenciais por satélite a partir de uma ILLUSTRATIVE

# text
seg-ed4ec8b6378c = Cobertura modelada de estação de referência lunar: uma varredura Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários do polo sul e um dia de épocas.

# text
seg-aeec32be6092 = Aumentação por faróis de superfície de um serviço de navegação orbital lunar, como uma tabela executável de antes/depois.

# text
seg-b28693368acd = Exportação modelada de interoperabilidade lunar: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio alinhadas com LunaNet/IOAG e baseadas em CCSDS, com aderência à norma de ida e volta / de campos

# text
seg-d88605893c05 = Observabilidade MODELLED de constelação cislunar planar (P6): rastreia uma constelação planar de DRO de quatro espaçonaves com correção diferencial e medição de distância entre satélites e informa quanto de uma espaçonave

# text
seg-8eaec90d1df5 = Teste de estimador independente MODELLED do limiar de observabilidade do comprimento de arco cislunar.

# text
seg-9619b3d699c6 = Superfície de ataque à segurança do sinal de navegação na superfície lunar (P1): compõe as análises abertas de segurança de sinal em uma só execução alcançável pelo binário.

# text
seg-64c78e211181 = Jamming de RF nativo lunar: razão jammer/sinal por satélite, C/N₀ efetivo e perda de travamento para um usuário na superfície selenográfica sob um jammer de superfície lunar (ou elevado), sobre o ilustrativo, de fonte pública

# text
seg-df68720ee7a5 = Recepção de GNSS terrestre à distância lunar, a camada de sinal fraco que o artigo sobre resiliência a conflitos nomeia e para a qual o mecanismo não tinha modelo.

# text
# c1: study
seg-e6475fe9f443 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos sob um único tipo selecionado por <c1/>: od-consistency (determinação de órbita a bordo com GNSS terrestre em

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-da20b48985b9 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-integrity</a1>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-0f0b2d0ca0b4 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-time-offset</a1>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-time-budget</a1>.

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
seg-de468e4d4b46 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "3" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-vlbi</a1>.

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
seg-3119d4005897 = <b>Registro:</b> MODELLED { "3" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-vlbi-fim</a1>.

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
seg-142f2253e4d6 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-joint-od-clock</a1>.

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
seg-73c0415efd2f = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-frame-realisation</a1>.

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
seg-ce2f0f85dda4 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "3" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-frame-campaign</a1>.

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
seg-4f05fad4b146 = <b>Registro:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-llr-datum</a1>.

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
seg-204901ae3684 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>moonlight-service-volume</a1>.

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
seg-c83350735643 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-differential-pnt</a1>.

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
seg-8a2f6f535c4a = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-station-coverage</a1>.

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
seg-4efffcd615df = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-019ca0f1051e = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-interop-export</a1>.

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
seg-af5d871bc69e = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>cislunar-observability</a1>.

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
seg-5e7bd8bb1adf = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>cislunar-arc-recovery</a1>.

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
seg-00b06a4fc0e0 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-attack-surface</a1>.

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
seg-63d4157e2294 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-jamming</a1>.

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
seg-287f89e6bf6b = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>earth-gnss-lunar</a1>.

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
seg-41e50e49da99 = <b>Registro:</b> nenhuma linha da matriz cita este tipo; o mecanismo rotula o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Anterior</s1>Navegação em órbita baixa da Terra

# text
seg-74c6bf83988e = <s1>Seguinte</s1>Análise de missão, enlaces e operações espaciais
