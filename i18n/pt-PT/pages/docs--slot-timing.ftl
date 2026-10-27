# docs--slot-timing: translations (pt-PT)

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
seg-582fd72f1a1a = Veredicto

# text
seg-430edd66bda0 = Não modelado

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Fonte: <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = O tipo de cenário <c1/> responde a três perguntas para um relógio em marcha livre entre sincronizações, que tem de manter o tráfego dentro de um <b>slot indexado no tempo</b>: um slot de encaminhamento, de atribuição de tarefas ou de contacto cuja <b>guarda</b> é o maior erro de tempo absoluto, de qualquer dos lados, com o qual o slot ainda funciona.

# text
seg-6b39d8afeb5d = <b>Quando é que a guarda se rompe?</b> Segundos desde o último acerto até o erro de tempo previsto atingir a guarda, com todos os termos contributivos discriminados e o dominante identificado.

# text
seg-60476d723e1a = <b>Quanto tempo resta agora?</b> O mesmo valor menos o tempo já decorrido desde o acerto.

# text
seg-84010982db35 = <b>Com que frequência tem o relógio de receber um acerto?</b> O maior intervalo entre acertos que mantém o erro dentro da guarda, descontada a latência antes de um acerto produzir efeito.

# text
# c1: spoofing
seg-3388d46925f1 = Uma secção <c1/> opcional acrescenta o nível de proteção de temporização (TPL) para um recetor em órbita; ver <a1>Spoofing de um recetor em órbita</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Execute o exemplo incluído com <c1/>.

# text
seg-624e7a70c4f6 = Abreviaturas: GNSS, Global Navigation Satellite System; TCXO, temperature-compensated crystal oscillator; OCXO, oven-controlled crystal oscillator; RAFS, rubidium atomic frequency standard; CSAC, chip-scale atomic clock; USO, ultra-stable oscillator; DSAC, deep-space atomic clock; ADEV, desvio de Allan; FM, modulação de frequência (aqui, ruído na frequência do relógio); PM, modulação de fase (ruído na sua fase); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, o Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações; TIE, erro de intervalo de tempo; MTIE, erro máximo de intervalo de tempo; TDEV, desvio de tempo; max|TE|, erro de tempo absoluto máximo; CUSUM, detetor de alterações por soma cumulativa; TPL, nível de proteção de temporização; LEO, órbita terrestre baixa; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (uma IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, os satélites GPS Block II Follow-on; SHA-256, o Secure Hash Algorithm de 256 bits; PPS, pulso por segundo.

# text
seg-f2a0c73ef648 = O modelo de erro

# text
# c1: t
seg-6bc3f9e78346 = O erro de tempo previsto após <c1/> segundos em marcha livre desde um acerto é

# text
seg-3fbb186c716a = fator de cobertura ({ "3" } corresponde a cerca de { "99.7" } % de um erro gaussiano)

# text
seg-883965151598 = erro de tempo de um sigma do acerto

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = erro de um sigma da frequência conhecida no acerto; uma frequência estimada numa janela <c1/> tem cerca de <c2/>

# text
seg-ab28fc69d3ac = variância do ruído de fase branco: jitter do erro de tempo, um patamar constante

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = densidades de FM branca, de passeio aleatório e de corrida aleatória (os termos de van Loan de <c1/>)

# text
seg-5d36b32c4de8 = patamar de FM de cintilação da variância de Allan

# text
seg-65da5a90685f = desvio de frequência fracionário residual deixado após o acerto

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = desvio de frequência devido a uma variação de temperatura <c1/> através do coeficiente de temperatura <c2/>

# text
seg-e23d0ac960aa = taxa de envelhecimento linear

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Cada termo de FM é igual a <c1/> para o seu próprio tipo de ruído, com <c2/> (Zucca e Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Para a FM branca, de passeio aleatório e de corrida aleatória, essa relação é exata. Para a FM de cintilação, é a estimativa convencional do erro de previsão de tempo (Riley, NIST SP { "1065" }): a FM de cintilação não tem forma fechada sem um corte de baixa frequência. Os desvios de frequência somam-se em módulo porque os seus sinais são desconhecidos, pelo que a parte determinista é um pior caso. Todos os termos são não negativos e não decrescentes em <c3/>, pelo que <c4/> tem uma só raiz, encontrada por delimitação e bissecção.

# text
seg-f9038fba23e2 = De onde vem o relógio

# text
seg-5c44b2f8d015 = Chave do cenário

# text
seg-cb92ae98c231 = Predefinição da classe

# text
seg-7594664253f2 = um ADEV a um segundo citado e um patamar de ruído vermelho sintetizado duas e quatro décadas abaixo dele

# text
seg-794e4932b470 = MODELLED: a resposta para um relógio estável é governada pelo patamar assumido

# text
seg-5ea820aaa69f = Predefinição de ficha técnica

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = as predefinições de temporização de telecomunicações (<c1/>, <c2/>, <c3/>, <c4/>), cada uma uma ficha técnica Microchip com nome

# text
seg-a20353d50011 = MODELLED: uma envolvente de máximos de fichas técnicas

# text
seg-b543f3dcd11a = Ficha técnica em linha

# text
seg-4983ec096617 = a tabela de ADEV, o envelhecimento e o coeficiente de temperatura do próprio cliente

# text
seg-b079bca8a611 = MODELLED: uma envolvente dos máximos indicados

# text
seg-119d94700cab = Registo medido

# text
seg-ae6835f0c3c5 = um registo de fase; o seu ADEV sobreposto é ajustado por mínimos quadrados ponderados

# text
seg-6e1c4702186d = a inversão é VALIDATED num registo real reservado (abaixo)

# text
seg-f4cc2be238b7 = As três classes acrescentadas na { "0.28.0" } citam, cada uma, uma ficha técnica pública:

# text
seg-47f6ddc3bd02 = ADEV a um segundo

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, coluna TCXO básica

# text
seg-becbff195fff = Ficha técnica Microchip OX-208, Rev 12-1-2021

# text
seg-19d8d32203f6 = Ficha técnica Microchip 8040C Rubidium Frequency Standard, DS00003047A

# text
seg-48babc170b93 = As linhas de tempos de média longos da EndRun convergem ao longo dessa tabela ({ "4e-13" } para todos os osciladores exceto o TCXO, { "8e-13" }, a { "10 000" } s, e { "6e-14" } para todos eles a { "100 000" } s), o que sugere que descrevem o produto disciplinado e não o oscilador em marcha livre, pelo que não são utilizadas.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>O ajuste ao registo é ponderado.</b> Uma estimativa da variância de Allan com <c1/> graus de liberdade equivalentes tem variância de cerca de <c2/>, pelo que cada ponto entra com o resíduo <c3/>. Um ajuste não ponderado deixava os tempos de média curtos decidir os termos de tempos de média longos: num registo de teste de FM branca, produziu um patamar de cintilação espúrio que encurtou em { "30" } % uma violação de { "2 000" } s. Uma ficha técnica ou um registo só sustenta tempos de média até ao seu ponto mais longo; uma violação para além disso é assinalada como <c4/>.

# text
seg-5b61a42c76c2 = Validação: a inversão num relógio real reservado

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> usa o registo de { "556" } 990 amostras de um padrão de césio 5071A medido face a um maser de hidrogénio (A. Wallin, distribuído com <c2/>; o mesmo registo que a referência independente do estimador <c3/> usa). Com o maser como referência, o registo é uma marcha livre de 6,4 dias.

# text
seg-9bae4571f67c = Ajustar o modelo de ruído apenas ao <b>primeiro terço</b> do registo.

# text
seg-15b2cb621db7 = Prever, a partir desse modelo, o tempo de marcha livre em que o erro de tempo de um sigma atinge { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } e { "2.5" } ns.

# text
seg-1bd9ac435bfa = Nos <b>outros dois terços</b>, seguir em marcha livre a partir de um ponto de sincronização a cada { "997" } s, com a frequência estimada a partir do terço anterior, e medir onde o erro quadrático médio em marcha livre atinge cada limiar.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = O limiar de passagem, fixado antes de o teste ser executado pela primeira vez, é que cada violação prevista fique dentro de um fator de { "1.5" } da medida. Um controlo, o ADEV a um segundo lido como FM branca, tem de falhar esse limiar, para que o limiar consiga distinguir um bom modelo de um mau. O teste imprime a sua tabela; uma mutação que reduza para metade o nível de FM branca faz-no falhar. O registo bruto são dados de terceiros ignorados pelo git: <c1/> descarrega-o, e o fluxo de trabalho <c2/> executa o teste com <c3/>, pelo que um ficheiro em falta provoca aí uma falha em vez de ser ignorado.

# text
seg-3d11f7c6d4ab = O que isto valida: o percurso de ajuste e inversão, num padrão atómico dominado por FM branca, em marchas livres de até cerca de { "50 000" } s. O que não valida: as fontes de ficha técnica e de classe, os termos deterministas e um oscilador de cristal (secção seguinte).

# text
seg-bfcc5555ed50 = A mesma previsão num oscilador de cristal real: conservadora, não validada

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> usa um OCXO medido: { "19 982" } leituras de frequência de um segundo do oscilador de { "10" } MHz num analisador de impedância HP, face a um maser de hidrogénio (A. Wallin, { "2015" }, distribuído com <c2/>; <c3/>). O modelo de ruído e uma deriva linear são ajustados no primeiro terço; cada marcha livre nos outros dois terços parte de uma frequência estimada nos { "100" } s anteriores, e o modelo transporta a incerteza dessa estimativa (<c4/>, o próprio desvio de Allan do modelo a { "100" } s).

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
seg-612784f70090 = conservador: nunca mais tarde do que o medido, em grande parte fora do limiar de { "1.5" }

# text
seg-121fa832c30f = o próprio segmento de avaliação (diagnóstico)

# text
seg-b4be9afa69ac = { "0.98" } a { "1.17" }

# text
seg-75e1515b970a = a inversão está certa; a diferença no conjunto reservado deve-se à alteração do oscilador

# text
seg-c91da69e9c09 = O patamar de ruído do oscilador reduziu-se para metade durante o registo: o desvio de Allan do primeiro terço estabiliza perto de { "7.5e-12" }, e o do resto perto de { "3.5e-12" }. Um modelo ajustado cedo sobrestima o ruído, que é o sentido seguro. <b>O caso do cristal não está, por isso, validado, e continua MODELLED.</b> Para um cristal, ajustar num registo estabilizado e reajustar à medida que a peça envelhece.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Como o protocolo foi escolhido, declarado porque não foi cego.</b> Uma primeira execução exploratória reutilizou o protocolo do césio (frequência a partir do terço anterior, sem termo de frequência) e previu violações { "1.4" } a { "2.5" } vezes mais tarde do que as medidas: otimista, o sentido perigoso. A frequência de um cristal varia, pelo que uma frequência estimada horas antes do acerto está desatualizada, e o modelo não tinha termo para o grau de conhecimento da frequência no acerto. O termo <c1/> foi acrescentado por esse motivo e este protocolo foi fixado antes de o teste ser escrito; o limiar de passagem não foi alterado. O teste também verifica que, sem o termo, a previsão na própria amostra é otimista em todos os limiares, pelo que o termo é essencial.

# text
seg-88e01cac525a = A mesma previsão em relógios atómicos em órbita: { "8" } de { "10" }, não validada

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> usa os relógios combinados finais do IGS a { "30" } s durante { "14" } dias (de { "17" } a { "30" } de agosto de { "2025" }; <c2/>, cada ficheiro fixado por SHA-256): o relógio de cada satélite GPS Block IIF face à escala de tempo do IGS. O protocolo (conjunto de satélites, regra de lacunas, janela de ajuste, um acerto a cada { "3 570" } s com a frequência da hora anterior, limiares de { "1" } a { "20" } ns, o limiar de { "1.5" }, e a regra de que a classe só passa se todos os satélites passarem) foi redigido antes de qualquer dado ser descarregado.

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
seg-a7699b256ee1 = excluído pela regra de lacunas (um dia em falta)

# text
seg-eb71202e0b91 = Oito em dez é uma evidência útil, mas prevê-se que dois satélites se mantenham mais tempo do que se mantiveram, que é o sentido perigoso, e o protocolo exige que todos os satélites passem. <b>O caso orbital continua, por isso, MODELLED.</b> Os satélites Block IIF transportam padrões de rubídio e de césio e os ficheiros do IGS não dizem qual está ativo, pelo que o resultado é enunciado para os satélites, e não para um tipo de relógio. Não foi investigado porque é que G25 e G30 diferem.

# text
seg-a9be8a92b6b9 = Uma execução em bench para uma peça representativa de voo (delimitada, não realizada)

# text
seg-43597df55508 = O registo público do OCXO tem { "5.5" } horas, de um instrumento de laboratório, com o oscilador ainda a estabilizar. O que validaria o caso do cristal é uma marcha livre medida mais longa de um OCXO representativo de voo ou de um CSAC face a uma referência:

# text
seg-e2698f00a84a = um contador de intervalos de tempo a comparar o { "1" } PPS do oscilador com uma referência disciplinada por GNSS ou por maser, durante pelo menos { "10" } dias, a uma amostra por segundo, com a temperatura registada;

# text
seg-c4c902ac028e = o mesmo protocolo de conjunto reservado: ajustar no primeiro terço, prever as violações, medir no resto, com o mesmo limiar e o mesmo controlo;

# text
seg-0faaa6279195 = o registo e o seu resumo publicados junto do teste, para que a linha seja reproduzível.

# text
seg-9b2255563582 = Está bloqueada pelo acesso a hardware de referência e não é prometida.

# text
seg-6cb2dc94d1bf = Face a que métrica de deriva se deve aceitar um slot?

# text
seg-f6d24245dca6 = As normas de temporização oferecem três famílias de métricas. Para um slot indexado no tempo, apenas uma delas mede o que rompe o slot.

# text
seg-496531d9db93 = O <b>MTIE</b> (ITU-T G.810) é o maior TIE pico a pico dentro de qualquer janela de um dado comprimento. É cego a um desvio constante: um relógio que esteja { "1" } µs desfasado mas perfeitamente estável tem um MTIE próximo de zero e falha todos os slots. Mede quanto o erro <em>varia</em>, e não onde ele <em>está</em>.

# text
seg-5bdfc694a92a = O <b>TDEV</b> (ITU-T G.810) é construído a partir de segundas diferenças da fase média. Remove um desvio constante e um erro de frequência constante, que são exatamente os termos que dominam uma marcha livre. Caracteriza o tipo de ruído; não é uma métrica de aceitação para temporização absoluta.

# text
seg-1a9f01b0c786 = O <b>max|TE|</b> (ITU-T G.8260; a métrica de orçamento da G.8271) é o maior erro de tempo absoluto face à escala de tempo de referência. Compara-se diretamente com uma guarda.

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Conclusão.</b> Aceitar um slot face ao max|TE| relativo à escala de tempo de referência da rede, avaliado como uma envolvente prevista desde o último acerto, com um fator de cobertura declarado. É isso que <c1/> é: como todos os termos crescem com <c2/>, o máximo ao longo de uma marcha livre de duração <c3/> é <c4/>. O MTIE e o TDEV continuam a ser úteis como diagnóstico: o TDEV para identificar que termo de ruído atacar, o MTIE(L) para limitar quanto o erro se move durante um slot de duração <c5/>.

# text
seg-51d4ee8484d7 = Dois refinamentos que a escolha da métrica implica:

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>A guarda aplica-se ao erro relativo entre dois nós.</b> Se o emissor e o recetor seguirem ambos em marcha livre de forma independente, os seus erros estocásticos somam-se em quadratura e os seus erros deterministas somam-se em módulo. Quando domina a parte estocástica, pode atribuir-se a cada nó <c1/>; quando domina o envelhecimento ou a temperatura, <c2/>.

# text
seg-073fe7cd8e63 = O fator de cobertura é uma escolha de projeto, e não uma propriedade do relógio.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> limita cerca de { "99.7" } % dos erros gaussianos num instante, e não em todos os slots de um dia; um plano de encaminhamento com muitos slots por dia precisa do risco por slot que consegue tolerar.

# text
seg-04734b8a115b = Spoofing de um recetor em órbita

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = A secção <c1/> avalia <c2/> para o mesmo relógio:

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Geometria.</b> Um spoofer em terra só alcança um satélite LEO enquanto o satélite está acima do seu horizonte: a { "550" } km, no máximo cerca de doze minutos por passagem sobre o local. Um spoofer com uma rampa de taxa <c1/> pode, por isso, deslocar o relógio no máximo <c2/> vezes essa janela, ou vezes o intervalo até à verificação independente seguinte, se este for mais curto (<c3/>).

# text
seg-ff59489b08b8 = <b>Dinâmica.</b> Um deslocamento de tempo em modo comum desloca igualmente todas as pseudodistâncias e é absorvido pelo desvio do relógio, e não pela posição, pelo que uma verificação de posição por propagador de órbita não conta como verificação cruzada de temporização.

# text
# c1: tpl
seg-4302cc49b91f = <b>Verificações cruzadas.</b> Um satélite raramente tem um segundo recetor de temporização independente. Tem a marcha livre do seu próprio relógio (o monitor de <c1/>), uma transferência de tempo bidirecional com uma estação terrestre durante os contactos, e comparações de tempo através de ligações entre satélites. Uma ligação cruzada só é independente de um spoofer em terra se o vizinho estiver fora da área de cobertura desse spoofer no mesmo momento, o que o relatório verifica a partir do número de satélites por plano.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Limite condicional.</b> O patamar do monitor mais a marcha livre do relógio durante a latência de deteção do CUSUM, reduzindo-se exatamente a <c1/> quando o relógio não tem termo de cintilação, de fase branca nem de corrida aleatória. Tal como esse limite, só é válido se houver deteção.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Tudo isto é MODELLED: uma Terra esférica e sem rotação, uma passagem sobre o local, um spoofer terrestre com uma taxa de rampa máxima declarada. A direção de chegada dos sinais a uma antena apontada ao zénite é uma verificação cruzada real que precisa de um diagrama de antena e não é modelada. <a1><c1/></a1> explica por que razão uma mensagem de controlo assinada não elimina esta ameaça.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Saltos de frequência, efeitos da radiação e desvios de frequência relativistas; um modelo térmico (a variação de temperatura é um degrau no acerto); o próprio protocolo de sincronização (um acerto repõe o erro em <c1/>).

# text
seg-a2766c0f19d0 = <s1>Anterior</s1>Ligações óticas através da atmosfera

# text
seg-85ad3eb72a80 = <s1>Seguinte</s1>Temporização de telecomunicações
