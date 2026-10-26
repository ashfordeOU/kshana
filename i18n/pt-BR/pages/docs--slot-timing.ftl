# docs--slot-timing: translations (pt-BR)

# text
seg-f917e7fcac09 = O que é

# text
seg-adc34608c46b = Classe

# text
seg-3a0e724a8a2b = Nível

# text
seg-fffbeccd4266 = Símbolo

# text
seg-2247a2344710 = Significado

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-1ff32b87e030 = Satélites

# text
seg-582fd72f1a1a = Veredito

# text
seg-430edd66bda0 = Não modelado

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Fonte: <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = O tipo de cenário <c1/> responde a três perguntas para um relógio que corre livre entre sincronizações e precisa manter o tráfego dentro de um <b>slot indexado no tempo</b>: um slot de roteamento, de atribuição de tarefas ou de contato cujo <b>guarda</b> é o maior erro de tempo absoluto, de qualquer um dos lados, no qual o slot ainda funciona.

# text
seg-6b39d8afeb5d = <b>Quando o guarda se rompe?</b> Segundos desde a última correção até o erro de tempo previsto atingir o guarda, com todos os termos contribuintes discriminados e o dominante indicado.

# text
seg-60476d723e1a = <b>Quanto tempo resta agora?</b> O mesmo valor menos o tempo já decorrido desde a correção.

# text
seg-84010982db35 = <b>Com que frequência o relógio deve receber uma correção?</b> O maior intervalo entre correções que mantém o erro dentro do guarda, descontada a latência antes de uma correção fazer efeito.

# text
# c1: spoofing
seg-3388d46925f1 = Uma seção <c1/> opcional acrescenta o nível de proteção de temporização (TPL) para um receptor em órbita; veja <a1>Spoofing de um receptor em órbita</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Execute o exemplo incluído com <c1/>.

# text
seg-624e7a70c4f6 = Abreviaturas: GNSS, Global Navigation Satellite System; TCXO, oscilador de cristal com compensação de temperatura; OCXO, oscilador de cristal controlado por forno; RAFS, padrão de frequência atômico de rubídio; CSAC, relógio atômico em escala de chip; USO, oscilador ultraestável; DSAC, relógio atômico de espaço profundo; ADEV, desvio de Allan; FM, modulação em frequência (aqui, ruído na frequência do relógio); PM, modulação em fase (ruído na sua fase); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, o Setor de Normalização das Telecomunicações da União Internacional de Telecomunicações; TIE, erro de intervalo de tempo; MTIE, erro máximo de intervalo de tempo; TDEV, desvio de tempo; max|TE|, erro de tempo absoluto máximo; CUSUM, detector de mudança por soma cumulativa; TPL, nível de proteção de temporização; LEO, órbita baixa da Terra; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (uma IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, os satélites GPS Block II Follow-on; SHA-256, o Secure Hash Algorithm de 256 bits; PPS, pulso por segundo.

# text
seg-f2a0c73ef648 = O modelo de erro

# text
# c1: t
seg-6bc3f9e78346 = O erro de tempo previsto após <c1/> segundos de deriva livre a partir de uma correção é

# text
seg-3fbb186c716a = fator de cobertura ({ "3" } é cerca de { "99.7" } % de um erro gaussiano)

# text
seg-883965151598 = erro de tempo de um sigma da correção

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = erro de um sigma da frequência conhecida na correção; uma frequência estimada ao longo de uma janela <c1/> traz cerca de <c2/>

# text
seg-ab28fc69d3ac = variância do ruído de fase branco: jitter do erro de tempo, um piso constante

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = densidades de FM branca, de passeio aleatório e de corrida aleatória (os termos de van Loan de <c1/>)

# text
seg-5d36b32c4de8 = piso de FM flicker da variância de Allan

# text
seg-65da5a90685f = desvio fracionário de frequência residual deixado após a correção

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = desvio de frequência por uma variação de temperatura <c1/> por meio do coeficiente de temperatura <c2/>

# text
seg-e23d0ac960aa = taxa linear de envelhecimento

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Cada termo de FM é igual a <c1/> para o seu próprio tipo de ruído, com <c2/> (Zucca e Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Para FM branca, de passeio aleatório e de corrida aleatória, essa relação é exata. Para FM flicker, é a estimativa convencional do erro de previsão de tempo (Riley, NIST SP { "1065" }): a FM flicker não tem forma fechada sem um corte em baixa frequência. Os desvios de frequência se somam em módulo porque seus sinais são desconhecidos; assim, a parte determinística é um pior caso. Todo termo é não negativo e não decrescente em <c3/>, de modo que <c4/> tem uma única raiz, encontrada por delimitação e bissecção.

# text
seg-f9038fba23e2 = De onde vem o relógio

# text
seg-5c44b2f8d015 = Chave do cenário

# text
seg-cb92ae98c231 = Padrão da classe

# text
seg-7594664253f2 = um ADEV de um segundo citado e um piso de ruído vermelho sintetizado duas e quatro décadas abaixo dele

# text
seg-794e4932b470 = MODELLED: a resposta para um relógio estável é governada pelo piso assumido

# text
seg-5ea820aaa69f = Predefinição de datasheet

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = as predefinições de temporização para telecomunicações (<c1/>, <c2/>, <c3/>, <c4/>), cada uma um datasheet nomeado da Microchip

# text
seg-a20353d50011 = MODELLED: um envelope dos máximos do datasheet

# text
seg-b543f3dcd11a = Datasheet em linha

# text
seg-4983ec096617 = a tabela de ADEV, o envelhecimento e o coeficiente de temperatura do próprio cliente

# text
seg-b079bca8a611 = MODELLED: um envelope dos máximos fornecidos

# text
seg-119d94700cab = Registro medido

# text
seg-ae6835f0c3c5 = um registro de fase; seu ADEV sobreposto é ajustado por mínimos quadrados ponderados

# text
seg-6e1c4702186d = a inversão é VALIDATED em um registro real reservado (abaixo)

# text
seg-f4cc2be238b7 = As três classes acrescentadas na versão { "0.28.0" } citam, cada uma, um datasheet público:

# text
seg-47f6ddc3bd02 = ADEV de um segundo

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, coluna do TCXO básico

# text
seg-becbff195fff = Datasheet do Microchip OX-208, Rev 12-1-2021

# text
seg-19d8d32203f6 = Datasheet do Microchip 8040C Rubidium Frequency Standard, DS00003047A

# text
seg-48babc170b93 = As linhas de longo tempo de média da EndRun convergem ao longo dessa tabela ({ "4e-13" } para todos os osciladores, exceto o TCXO, { "8e-13" }, em { "10 000" } s, e { "6e-14" } para todos eles em { "100 000" } s), o que sugere que descrevem o produto disciplinado e não o oscilador em marcha livre; por isso, não são usadas.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>O ajuste do registro é ponderado.</b> Uma estimativa de variância de Allan com <c1/> graus de liberdade equivalentes tem variância de cerca de <c2/>; assim, cada ponto entra com resíduo <c3/>. Um ajuste sem ponderação deixou os tempos de média curtos decidirem os termos de longo tempo de média: em um registro de teste de FM branca, ele produziu um piso de flicker espúrio que encurtou em { "30" } % uma violação de { "2 000" } s. Um datasheet ou registro só sustenta tempos de média até o seu ponto mais longo; uma violação além disso é sinalizada como <c4/>.

# text
seg-5b61a42c76c2 = Validação: a inversão em um relógio real reservado

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> usa o registro de { "556" } 990 amostras de um padrão de césio 5071A medido em relação a um maser de hidrogênio (A. Wallin, distribuído com <c2/>; o mesmo registro que a referência independente do estimador <c3/> usa). Com o maser como referência, o registro é uma marcha livre de 6,4 dias.

# text
seg-9bae4571f67c = Ajuste o modelo de ruído apenas no <b>primeiro terço</b> do registro.

# text
seg-15b2cb621db7 = Preveja, a partir desse modelo, o tempo de deriva em que o erro de tempo de um sigma atinge { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } e { "2.5" } ns.

# text
seg-1bd9ac435bfa = Nos <b>outros dois terços</b>, faça a deriva a partir de um ponto de sincronização a cada { "997" } s, com a frequência estimada a partir do terço anterior, e meça onde o erro de deriva quadrático médio atinge cada limiar.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = O limiar de aceitação, fixado antes de o teste ser executado pela primeira vez, é toda violação prevista estar dentro de um fator de { "1.5" } da medida. Um controle, o ADEV de um segundo lido como FM branca, deve falhar nesse limiar, para que o limiar consiga distinguir um bom modelo de um mau. O teste imprime a sua tabela; uma mutação que reduza à metade o nível de FM branca o faz falhar. O registro bruto é um dado de terceiros ignorado pelo git: <c1/> o obtém, e o fluxo de trabalho <c2/> executa o teste com <c3/>, de modo que um arquivo ausente faz falhar ali em vez de ser ignorado.

# text
seg-3d11f7c6d4ab = O que isto valida: o caminho de ajuste seguido de inversão, em um padrão atômico dominado por FM branca, ao longo de derivas de até cerca de { "50 000" } s. O que não valida: o datasheet e as fontes de classe, os termos determinísticos e um oscilador de cristal (próxima seção).

# text
seg-bfcc5555ed50 = A mesma previsão em um oscilador de cristal real: conservadora, não validada

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> usa um OCXO medido: { "19 982" } leituras de frequência de um segundo do oscilador de { "10" } MHz de um analisador de impedância HP, em relação a um maser de hidrogênio (A. Wallin, { "2015" }, distribuído com <c2/>; <c3/>). O modelo de ruído e uma deriva linear são ajustados no primeiro terço; cada deriva nos outros dois terços parte de uma frequência estimada ao longo dos { "100" } s anteriores, e o modelo carrega a incerteza dessa estimativa (<c4/>, o próprio desvio de Allan do modelo em { "100" } s).

# text
seg-e05821406c28 = Ajustado em

# text
seg-c70aadbd47d4 = Violação prevista ÷ medida, de { "0.2" } a { "10" } ns

# text
seg-d71582148b20 = Leitura

# text
seg-dcc3fd23bede = o primeiro terço (reservado)

# text
seg-f9bb286f5868 = { "0.59" } a { "0.70" }

# text
seg-612784f70090 = conservadora: nunca mais tarde que a medida, em sua maioria fora do limiar de { "1.5" }

# text
seg-121fa832c30f = o próprio segmento de avaliação (diagnóstico)

# text
seg-b4be9afa69ac = { "0.98" } a { "1.17" }

# text
seg-75e1515b970a = a inversão está correta; a lacuna no conjunto reservado é o oscilador mudando

# text
seg-c91da69e9c09 = O piso de ruído do oscilador caiu pela metade durante o registro: o desvio de Allan do primeiro terço se achata perto de { "7.5e-12" }, o do restante perto de { "3.5e-12" }. Um modelo ajustado cedo superestima o ruído, que é a direção segura. <b>O caso do cristal, portanto, não é validado e permanece MODELLED.</b> Para um cristal, ajuste em um registro estabilizado e reajuste à medida que a peça envelhece.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Como o protocolo foi escolhido, declarado porque não foi cego.</b> Uma primeira execução exploratória reutilizou o protocolo do césio (frequência a partir do terço anterior, sem termo de frequência) e previu violações de { "1.4" } a { "2.5" } vezes mais tardias que as medidas: otimista, a direção perigosa. A frequência de um cristal oscila; assim, uma frequência estimada horas antes da correção está desatualizada, e o modelo não tinha termo para o quanto a frequência é conhecida na correção. O termo <c1/> foi acrescentado por essa razão e este protocolo foi fixado antes de o teste ser escrito; o limiar de aceitação não foi movido. O teste também verifica que, sem o termo, a previsão dentro da amostra é otimista em todos os limiares; portanto, o termo é essencial.

# text
seg-88e01cac525a = A mesma previsão em relógios atômicos em órbita: { "8" } de { "10" }, não validada

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> usa os relógios combinados finais do IGS a { "30" } s durante { "14" } dias ({ "17" } a { "30" } de agosto de { "2025" }; <c2/>, cada arquivo fixado por SHA-256): o relógio de cada satélite GPS Block IIF em relação à escala de tempo do IGS. O protocolo (conjunto de satélites, regra de lacunas, janela de ajuste, uma sincronização a cada { "3 570" } s com a frequência da hora anterior, limiares de { "1" } a { "20" } ns, o limiar de { "1.5" } e a regra de que a classe só passa se todos os satélites passarem) foi escrito antes de qualquer dado ser baixado.

# text
seg-1b5832633c87 = Violação prevista ÷ medida

# text
seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

# text
seg-9a6fac366156 = { "0.76" } a { "1.46" }

# text
seg-c14941cb5537 = dentro do limiar

# text
seg-dbaaf875f1fb = { "1.51" } a { "1.99" }

# text
seg-3601e13c39b6 = otimista

# text
seg-ea41cf6dbec2 = { "1.20" } a { "1.61" }

# text
seg-099fb000bf57 = não avaliado

# text
seg-a7699b256ee1 = excluído pela regra de lacunas (um dia ausente)

# text
seg-eb71202e0b91 = Oito de dez é uma evidência útil, mas dois satélites são previstos como se mantendo por mais tempo do que de fato se mantiveram, que é a direção perigosa, e o protocolo exige que todos os satélites passem. <b>O caso orbital, portanto, permanece MODELLED.</b> Os satélites Block IIF levam padrões de rubídio e de césio, e os arquivos do IGS não dizem qual está ativo; por isso, o resultado é declarado para os satélites, não para um tipo de relógio. Por que G25 e G30 diferem não foi investigado.

# text
seg-a9be8a92b6b9 = Uma execução em bancada para uma peça representativa de voo (delimitada, não realizada)

# text
seg-43597df55508 = O registro público de OCXO tem { "5.5" } horas, de um instrumento de laboratório, com o oscilador ainda se estabilizando. O que validaria o caso do cristal é uma marcha livre medida mais longa de um OCXO representativo de voo, ou de um CSAC, em relação a uma referência:

# text
seg-e2698f00a84a = um contador de intervalo de tempo que compare o { "1" } PPS do oscilador com uma referência disciplinada por GNSS ou por maser, por pelo menos { "10" } dias, com uma amostra por segundo e a temperatura registrada;

# text
seg-c4c902ac028e = o mesmo protocolo de conjunto reservado: ajustar no primeiro terço, prever as violações, medir no restante, com o mesmo limiar e o mesmo controle;

# text
seg-0faaa6279195 = o registro e o seu hash publicados ao lado do teste, para que a linha seja reproduzível.

# text
seg-9b2255563582 = Depende do acesso a hardware de referência e não é prometido.

# text
seg-6cb2dc94d1bf = Contra qual métrica de oscilação um slot deve ser aceito?

# text
seg-f6d24245dca6 = As normas de temporização oferecem três famílias de métricas. Para um slot indexado no tempo, apenas uma delas mede aquilo que rompe o slot.

# text
seg-496531d9db93 = O <b>MTIE</b> (ITU-T G.810) é o maior TIE pico a pico dentro de qualquer janela de um dado comprimento. Ele é cego a um desvio constante: um relógio que está { "1" } µs fora, mas perfeitamente estável, tem um MTIE próximo de zero e perde todos os slots. Ele mede o quanto o erro <em>muda</em>, não onde ele <em>está</em>.

# text
seg-5bdfc694a92a = O <b>TDEV</b> (ITU-T G.810) é construído a partir de diferenças de segunda ordem da fase média. Ele remove um desvio constante e um erro de frequência constante, que são exatamente os termos que dominam uma deriva. Ele caracteriza o tipo de ruído; não é uma métrica de aceitação para temporização absoluta.

# text
seg-1a9f01b0c786 = O <b>max|TE|</b> (ITU-T G.8260; a métrica de orçamento da G.8271) é o maior erro de tempo absoluto em relação à escala de tempo de referência. Ele se compara diretamente com um guarda.

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Conclusão.</b> Aceite um slot em relação ao max|TE| com respeito à escala de tempo de referência da rede, avaliado como um envelope previsto a partir da última correção, com um fator de cobertura declarado. É isso que <c1/> é: como todo termo cresce com <c2/>, o máximo ao longo de uma deriva de comprimento <c3/> é <c4/>. O MTIE e o TDEV continuam úteis como diagnóstico: o TDEV para identificar qual termo de ruído atacar, o MTIE(L) para limitar o quanto o erro se move durante um slot de comprimento <c5/>.

# text
seg-51d4ee8484d7 = Dois refinamentos que a escolha da métrica implica:

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>O guarda se aplica ao erro relativo entre dois nós.</b> Se transmissor e receptor derivam de forma independente, seus erros estocásticos se somam em quadratura e seus erros determinísticos se somam em módulo. Quando a parte estocástica domina, cada nó pode receber <c1/>; quando o envelhecimento ou a temperatura domina, <c2/>.

# text
seg-073fe7cd8e63 = O fator de cobertura é uma escolha de projeto, não uma propriedade do relógio.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> limita cerca de { "99.7" } % dos erros gaussianos em um instante, não em todos os slots de um dia; um plano de roteamento com muitos slots por dia precisa do risco por slot que consiga tolerar.

# text
seg-04734b8a115b = Spoofing de um receptor em órbita

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = A seção <c1/> avalia <c2/> para o mesmo relógio:

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Geometria.</b> Um spoofer em solo só alcança um satélite LEO enquanto o satélite está acima do seu horizonte: a { "550" } km, no máximo cerca de doze minutos por passagem sobre o local. Um spoofer com rampa de taxa <c1/> pode, portanto, deslocar o relógio no máximo <c2/> vezes essa janela, ou vezes o intervalo até a próxima verificação independente, se este for menor (<c3/>).

# text
seg-ff59489b08b8 = <b>Dinâmica.</b> Um deslocamento de tempo em modo comum desloca todas as pseudodistâncias igualmente e é absorvido no viés do relógio, não na posição; portanto, uma verificação de posição pelo propagador de órbita não conta como verificação cruzada de temporização.

# text
# c1: tpl
seg-4302cc49b91f = <b>Verificações cruzadas.</b> Um satélite raramente tem um segundo receptor de temporização independente. Ele tem a deriva do seu próprio relógio (o monitor de <c1/>), uma transferência de tempo bidirecional com uma estação em solo durante os contatos e comparações de tempo por enlaces entre satélites. Um enlace cruzado é independente de um spoofer em solo apenas se o vizinho estiver fora da área de cobertura desse spoofer no mesmo momento, o que o relatório verifica a partir do número de satélites por plano.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Limite condicional.</b> O piso do monitor mais a deriva do relógio ao longo da latência de detecção do CUSUM, reduzindo-se exatamente a <c1/> quando o relógio não tem termo de flicker, de ruído de fase branco ou de corrida aleatória. Como esse limite, só vale dada a detecção.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Tudo isso é MODELLED: uma Terra esférica e sem rotação, uma passagem sobre o local, um spoofer terrestre com uma taxa máxima de rampa declarada. A direção de chegada dos sinais em uma antena apontada para o zênite é uma verificação cruzada real que exige um diagrama de antena e não é modelada. <a1><c1/></a1> explica por que uma mensagem de controle assinada não elimina essa ameaça.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Saltos de frequência, efeitos de radiação e desvios relativísticos de frequência; um modelo térmico (a variação de temperatura é um degrau na correção); o próprio protocolo de sincronização (uma correção redefine o erro para <c1/>).

# text
seg-a2766c0f19d0 = <s1>Anterior</s1>Enlaces ópticos através da atmosfera

# text
seg-85ad3eb72a80 = <s1>Próximo</s1>Temporização para telecomunicações
