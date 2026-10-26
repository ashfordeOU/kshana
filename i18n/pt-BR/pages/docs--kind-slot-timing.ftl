# docs--kind-slot-timing: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Fonte: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (tipo de cenário)

# text
seg-1b61962464c5 = Temporização de slot: segundos até um relógio em operação livre sair da guarda de um slot de roteamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o slot tolera), a contribuição de cada termo nesse instante com o dominante indicado (incerteza da correção, ruído de fase branco, ruído de frequência branco, flicker, de passeio aleatório e de corrida aleatória, deslocamento de frequência residual, temperatura, envelhecimento), o tempo restante desde a última correção e o maior intervalo de correção que mantém o relógio dentro, descontada a latência da correção. O oscilador é um padrão de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan de um segundo citado e um piso de ruído vermelho assumido), uma PREDEFINIÇÃO DE DATASHEET de temporização de telecomunicações ou um DATASHEET em linha (máximos do desvio de Allan ajustados como envoltória, mais envelhecimento e um coeficiente de temperatura), ou um REGISTRO DE FASE MEDIDO em linha (seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de ruído de fase branco e de modulação de frequência da IEEE Std { "1139" }, de modo que o piso de ruído vermelho é medido em vez de assumido). Uma violação além do maior tempo de médias que o datasheet ou o registro suporta é sinalizada como extrapolada. Uma seção opcional de spoofing acrescenta o nível de proteção de temporização para um receptor em órbita: velocidade e período orbitais, por quanto tempo um único spoofer em solo alcança o satélite a cada passagem, o piso do monitor auxiliado pelo relógio e a latência de detecção do CUSUM, o limite condicional, o desvio que um spoofer com uma taxa de rampa máxima declarada acumula antes de o satélite sair do seu alcance ou de uma verificação independente ser executada, e se cada verificação de contato com o solo ou de crosslink é independente desse spoofer. VALIDATED: a inversão de holdover a partir de um registro ajustado, mantida de reserva em um relógio real de césio medido contra um maser de hidrogênio (tests/slot_timing_cs5071a_holdout.rs, condicionado a dados); em um oscilador de cristal medido, a predição reservada é conservadora, mas não está dentro do limiar, portanto o caso do cristal é MODELLED. MODELLED: as fontes de classe e de datasheet, os termos determinísticos e a avaliação de spoofing.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Uma execução de <c1/> resume-se assim: slot-timing (fonte datasheet): guarda de { "100.0" } ns com k={ "3" } é violada { "650.8" } s após uma correção (restam { "50.8" } s); correção pelo menos a cada { "645.8" } s ({ "133.80" } por dia); termo dominante: ruído de frequência de passeio aleatório

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Campos obrigatórios: <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Campos opcionais: <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = O exemplo <c1/> define, entre outros:

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = datasheet

# text
seg-c13396b4e57b = Rótulo do resultado (do mecanismo): MODELLED — tempo até um relógio em operação livre sair da guarda de um slot de roteamento e a cadência de correção que o mantém dentro, a partir de um modelo estacionário de relógio em lei de potência. Uma fonte datasheet é uma envoltória dos seus máximos, não uma medição de qualquer unidade; uma fonte de classe se apoia em um piso de ruído vermelho assumido.

# attr:alt
seg-97a91c8a60cd = O gráfico que o mecanismo gera para scenarios/slot-timing-ocxo-leo.toml, tipo slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que citam este tipo.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> O caminho de registro medido do tipo <c1/>: o desvio de Allan sobreposto de um registro de fase ajustado por mínimos quadrados não negativos ponderados por edf na base de ruído de fase branco e de modulação de frequência da IEEE Std { "1139" } (slot_timing::fit_weighted), Testes: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> O tipo <c1/>: o erro predito E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, o intervalo de ressincronização descontada a latência da correção e as correções por dia, com cada termo detalhado com th Testes: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, acessível como a seção de spoofing do tipo <c1/>: velocidade e período em órbita circular, o maior tempo em que um spoofer em solo alcança o satélite por passagem, o piso do monitor auxiliado pelo relógio e a l

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> O tipo <c1/>: o erro predito E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, a ressincronização. Referência independente (InternalConsistency): formas fechadas para cada termo isolado e a busca de raiz independente holdover::holdover_seconds; os valores do datasheet são os documentos citados (docs/SLOT-TIMING.md). Um padrão de classe se apoia em um piso de ruído vermelho assumido e uma fonte datasheet é uma envoltória de máximos, de modo que nenhuma das duas é uma medição de qualquer unidade

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, acessível como a seção de spoofing do tipo <c1/>: velocidade e período em órbita circular, o maior tempo em que um spoofer em solo pode alcançar o satélite. Referência independente (InternalConsistency): redução ao nível de proteção de temporização existente e às formas fechadas de órbita circular e de visibilidade com Terra esférica. Condicionado à detecção, um spoofer terrestre com uma taxa de rampa declarada, uma passagem sobre a cabeça em uma Terra sem rotação; não validado em um receptor em órbita sob spoofing

# text
# c1: not_modelled[0]
seg-29af1ec87672 = saltos de frequência, efeitos de radiação e deslocamentos relativísticos de frequência (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = um modelo térmico: a excursão de temperatura é aplicada como um degrau na correção (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = o próprio protocolo de sincronização: uma correção zera o erro para fix_sigma_ns (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = contra qual métrica de deriva um slot de roteamento deve ser aceito; ver docs/SLOT-TIMING.md (resultado <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — tempo até um relógio em operação livre sair da guarda de um slot de roteamento e a cadência de correção que o mantém dentro, a partir de um modelo estacionário de relógio em lei de potência. Uma fonte datasheet é uma envoltória dos seus máximos, não uma medição de qualquer unidade; uma fonte de classe se apoia em um piso de ruído vermelho assumido. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = O oscilador é um padrão de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan de um segundo citado e um piso de ruído vermelho assumido), uma PREDEFINIÇÃO DE DATASHEET de temporização de telecomunicações ou um DATASHEET em linha (máximos do desvio de Allan ajustados como envoltória, mais envelhecimento e um coeficiente de temperatura), ou um REGISTRO DE FASE MEDIDO em linha (seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de ruído de fase branco e de modulação de frequência da IEEE S (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: a inversão de holdover a partir de um registro ajustado, mantida de reserva em um relógio real de césio medido contra um maser de hidrogênio (tests/slot_timing_cs5071a_holdout.rs, condicionado a dados); em um oscilador de cristal medido, a predição reservada é conservadora, mas não está dentro do limiar, portanto o caso do cristal é MODELLED. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: as fontes de classe e de datasheet, os termos determinísticos e a avaliação de spoofing. (catálogo de tipos (<c1/>))

# text
seg-1a72034c1343 = Página do tópico: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Anterior</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Seguinte</s1>solar-system
