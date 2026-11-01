# docs--kind-slot-timing: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Fonte: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (tipo de cenário)

# text
seg-1b61962464c5 = Temporização de intervalos: segundos até um relógio em funcionamento livre sair da guarda de um intervalo de encaminhamento ou de atribuição de tarefas indexado no tempo (o maior erro de tempo absoluto que o intervalo tolera), a contribuição de cada termo nesse momento com o dominante identificado (incerteza da solução de posição, ruído de fase branco, ruído de frequência branco, flicker, de passeio aleatório e de corrida aleatória, desvio de frequência residual, temperatura, envelhecimento), o tempo restante desde a última solução de posição e o maior intervalo entre soluções de posição que mantém o relógio dentro, líquido da latência da solução de posição. O oscilador é uma predefinição de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan citado a um segundo e um patamar de ruído vermelho assumido), uma PREDEFINIÇÃO DE FICHA TÉCNICA de temporização de telecomunicações ou uma FICHA TÉCNICA em linha (máximos do desvio de Allan ajustados como envolvente, mais envelhecimento e um coeficiente de temperatura), ou um REGISTO DE FASE MEASURED em linha (o seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de fase branca e de modulação de frequência IEEE Std { "1139" }, de modo que o patamar de ruído vermelho é medido e não assumido). Uma violação além do maior tempo de média que a ficha técnica ou o registo suporta é assinalada como extrapolada. Uma secção opcional de spoofing acrescenta o nível de proteção de temporização para um recetor em órbita: velocidade e período orbitais, durante quanto tempo um único spoofer terrestre consegue alcançar o satélite por passagem, o patamar do monitor assistido por relógio e a latência de deteção CUSUM, o limite condicional, o arrastamento que um spoofer a uma taxa de rampa máxima indicada acumula antes de o satélite sair do seu alcance ou de uma verificação independente ser executada, e se cada verificação de contacto terrestre ou de ligação cruzada é independente desse spoofer. VALIDATED: a inversão de holdover a partir de um registo ajustado, reservada num relógio de césio real medido face a um maser de hidrogénio (tests/slot_timing_cs5071a_holdout.rs, condicionado pelos dados); num oscilador de cristal medido, a previsão reservada é conservadora mas não está dentro do limiar, pelo que o caso do cristal é MODELLED. MODELLED: as fontes de classe e de ficha técnica, os termos determinísticos e a avaliação de spoofing.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Uma execução de <c1/> resume-se assim: slot-timing (fonte ficha técnica): a guarda de { "100.0" } ns com k={ "3" } é violada { "650.8" } s após uma solução de posição (restam { "50.8" } s); solução de posição pelo menos a cada { "645.8" } s ({ "133.80" } por dia); termo dominante: ruído de frequência de passeio aleatório

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
seg-1a282dc35742 = ficha técnica

# text
seg-c13396b4e57b = Etiqueta de resultado (a do motor): MODELLED — tempo até um relógio em funcionamento livre sair da guarda de um intervalo de encaminhamento, e a cadência de soluções de posição que o mantém dentro, a partir de um modelo estacionário de relógio de lei de potência. Uma fonte de ficha técnica é uma envolvente dos seus máximos, não uma medição de qualquer unidade; uma fonte de classe assenta num patamar de ruído vermelho assumido.

# attr:alt
seg-97a91c8a60cd = O gráfico que o motor escreve para scenarios/slot-timing-ocxo-leo.toml, tipo slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> O percurso de registo medido do tipo <c1/>: o desvio de Allan sobreposto de um registo de fase ajustado por mínimos quadrados não negativos ponderados por edf na base de fase branca e de modulação de frequência IEEE Std { "1139" } (slot_timing::fit_weighted), Ensaios: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> O tipo <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, o intervalo de ressincronização líquido da latência da solução de posição e as soluções de posição por dia, cada termo discriminado com o Ensaios: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, acessível como a secção de spoofing do tipo <c1/>: velocidade e período de órbita circular, o maior tempo durante o qual um spoofer terrestre consegue alcançar o satélite por passagem, o patamar do monitor assistido por relógio e a latência de deteção CUSUM

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> O tipo <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, a ressincronização. Referência independente (InternalConsistency): formas fechadas para cada termo isolado e a procura de raiz independente holdover::holdover_seconds; os valores da ficha técnica são os dos documentos indicados (docs/SLOT-TIMING.md). Uma predefinição de classe assenta num patamar de ruído vermelho assumido e uma fonte de ficha técnica é uma envolvente de máximos, pelo que nenhuma é uma medição de qualquer unidade

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, acessível como a secção de spoofing do tipo <c1/>: velocidade e período de órbita circular, o maior tempo durante o qual um spoofer terrestre pode alcançar o. Referência independente (InternalConsistency): redução ao nível de proteção de temporização existente e às formas fechadas de visibilidade de órbita circular e Terra esférica. Condicional à deteção, um spoofer terrestre a uma taxa de rampa indicada, uma passagem a pino numa Terra sem rotação; não validado num recetor em órbita sujeito a spoofing

# text
# c1: not_modelled[0]
seg-29af1ec87672 = saltos de frequência, efeitos da radiação e desvios de frequência relativistas (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = um modelo térmico: a excursão de temperatura é aplicada como um degrau na solução de posição (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = o próprio protocolo de sincronização: uma solução de posição repõe o erro em fix_sigma_ns (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = a que métrica de deriva deve um intervalo de encaminhamento ser aceite; ver docs/SLOT-TIMING.md (resultado <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — tempo até um relógio em funcionamento livre sair da guarda de um intervalo de encaminhamento, e a cadência de soluções de posição que o mantém dentro, a partir de um modelo estacionário de relógio de lei de potência. Uma fonte de ficha técnica é uma envolvente dos seus máximos, não uma medição de qualquer unidade; uma fonte de classe assenta num patamar de ruído vermelho assumido. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = O oscilador é uma predefinição de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs: um desvio de Allan citado a um segundo e um patamar de ruído vermelho assumido), uma PREDEFINIÇÃO DE FICHA TÉCNICA de temporização de telecomunicações ou uma FICHA TÉCNICA em linha (máximos do desvio de Allan ajustados como envolvente, mais envelhecimento e um coeficiente de temperatura), ou um REGISTO DE FASE MEASURED em linha (o seu desvio de Allan sobreposto ajustado por mínimos quadrados ponderados na base de fase branca e de modulação de frequência IEEE S (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: a inversão de holdover a partir de um registo ajustado, reservada num relógio de césio real medido face a um maser de hidrogénio (tests/slot_timing_cs5071a_holdout.rs, condicionado pelos dados); num oscilador de cristal medido, a previsão reservada é conservadora mas não está dentro do limiar, pelo que o caso do cristal é MODELLED. (catálogo de tipos (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: as fontes de classe e de ficha técnica, os termos determinísticos e a avaliação de spoofing. (catálogo de tipos (<c1/>))

# text
seg-1a72034c1343 = Página do tema: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Anterior</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Seguinte</s1>solar-system
