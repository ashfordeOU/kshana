# docs--resilience-crosswalk: translations (pt-BR)

# text
seg-88372b30ed79 = Limite

# text
seg-aab745a65e76 = Módulo

# text
seg-ad856ad710eb = Status

# text
seg-b03d56f501c3 = Tipo

# text
seg-4dbf41c0ec3b = Função

# text
seg-f472e43c1100 = O que ele mostra

# text
seg-fa4468d4cb80 = Disponibilidade

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-fe4d868448ef = Fonte: <c1/>

# text
seg-d745715d5332 = Correspondência com frameworks de resiliência de PNT

# text
# c1: VALIDATED
# c2: MODELLED
# c3: resilience::diversity
# c4: resilience::stats
seg-aa1c24d63df5 = <b>Alinhado a, não classificado nem aprovado.</b> Isto mapeia as capacidades simuladas do Kshana para os frameworks publicados de resiliência de PNT (PNT: posicionamento, navegação e temporização). É uma <em>autoavaliação derivada de simulação, alinhada ao</em> Resilient PNT Conformance Framework (RPCF) v2.0 do DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency), ao modelo Resist-Detect-Respond-Recover (RDRR) do RethinkPNT/Firesmith e aos critérios de PNT resiliente de Yang Yuanxi. <b>Não</b> é uma classificação, uma aprovação, uma acreditação nem uma declaração de compliance, e não traz aval do DHS, do IEEE (Institute of Electrical and Electronics Engineers) nem de qualquer autoridade. Cada linha é rotulada com seu status honesto de verificação (<c1/> em relação a uma referência independente externa, ou <c2/> a partir de primeiros princípios com testes); a própria camada de pontuação de resiliência é <b>MODELLED</b>. Dois de seus kernels têm linhas VALIDATED próprias na matriz de verificação, o kernel de diversidade de inverso de Simpson (<c3/>) e o kernel de estatísticas de ordem por postos (<c4/>); isso valida a aritmética, não as pontuações construídas sobre ela.

# text
# c1: src/resilience/
# c2: src/verification.rs
seg-652fcf3ec12d = O motor de pontuação (<c1/>) consome essas capacidades e emite subpontuações por dimensão, nunca um único número fantasma. Veja <c2/> para as invariantes de status verificadas por máquina.

# text
seg-7a71de89a9fd = RPCF v2.0 do DHS: o que o framework define, e as categorias de subpontuação do próprio Kshana

# text
seg-1985dbfe351d = O framework publicado (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } de abril de { "2022" }, DHS Science and Technology Directorate com a CISA) define três <b>funções centrais</b> (seção { "5.2" }: Prevent, Respond, Recover), <b>níveis de resiliência de { "0" } a { "4" }</b> (seção { "5.3" }) e <b>oito requisitos mínimos numerados</b> distribuídos pelos Níveis { "1" } a { "4" } (seção { "5.3" }, retomados em { "5.5" }), além de uma abordagem de avaliação (seção { "8" }). Ele <b>não</b> define uma lista de sete categorias de técnicas. Uma versão anterior desta página, e os comentários do módulo de resiliência, descreviam sete "categorias de técnicas do RPCF"; as palavras Obfuscate e Diversify não aparecem na v2.0. O texto desse documento foi relido em 2026-10-09 e nenhuma lista desse tipo foi encontrada.

# text
seg-178d1e119dce = Os sete nomes de subpontuação que o motor de pontuação emite (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; "OLVIDMR" é nosso mnemônico) são, portanto, <b>categorias de pontuação do próprio Kshana</b>, mantidas por estabilidade da saída. Não são termos do DHS, e as linhas abaixo não dizem que o DHS as exige. Onde uma categoria se alinha a um requisito do framework, a última coluna o indica; onde não se alinha, diz "nenhum".

# text
seg-5a9eb11bb965 = Categoria de subpontuação do Kshana

# text
seg-e117e6f71845 = Capacidade do Kshana usada como condutora

# text
seg-7677dafa7016 = Referência mais próxima do RPCF v2.0

# text
seg-27e0f6b39605 = Obfuscate

# text
seg-7327b9cbc106 = Técnica declarada × qualidade da fonte (sem condutor comportamental direto)

# text
seg-b63e61fa5fa2 = nenhum (uma técnica de prevenção; seção { "5.2" }, Prevent)

# text
seg-7ed4f2e21189 = Técnica declarada × qualidade da fonte

# text
seg-8579207ae2e5 = Verify

# text
seg-30b8cb030965 = AUC (área sob a curva) do detector de degradação no cenário (monitores de spoofing/jamming/meaconing)

# text
seg-3d358c029f50 = Nível { "2" } requisito { "4" }; Nível { "3" } requisito { "7" }

# text
seg-fcb8cb7d4c97 = Isolate

# text
seg-b3cd355743da = Nível { "3" } requisito { "6" }

# text
seg-ffa87d149a20 = Diversify

# text
seg-1282685a888b = Contagem de grupos independentes → diversidade efetiva de inverso de Simpson

# text
seg-f0dd4c4ef1c5 = Nível { "4" } requisito { "8" }; seção { "5.5" } (modo comum)

# text
seg-2d91b12a9e56 = Mitigate

# text
seg-d183b552df76 = Disponibilidade sob negação

# text
seg-c337df73e231 = seção { "5.2" }, Respond

# text
seg-2da4df22d35d = Recover

# text
seg-85d7e3292549 = Deslizamento em holdover × limitador de degradação limitada

# text
seg-3aec9f076902 = Nível { "2" } requisito { "5" }; seção { "5.2" }, Recover

# text
seg-36958650abc0 = O mapeamento por requisito para o framework real, com aquilo para que as saídas do Kshana fornecem evidências em apoio de e o que sobra, está em <a1>compliance/dhs-rpcf.md</a1>.

# text
seg-a085dd81c769 = Funções RDRR do RethinkPNT / Firesmith

# text
seg-1b972717180b = Condutor

# text
seg-6eaf161f8871 = Resist

# text
seg-6046a8914dc7 = Média das subpontuações Obfuscate/Limit/Isolate/Diversify

# text
seg-242e2c01ebc2 = Detect

# text
seg-45c8da13581f = Subpontuação Verify (AUC do detector)

# text
seg-d29232baaaa6 = Respond

# text
seg-36ab7ce187e6 = Subpontuação Mitigate (disponibilidade)

# text
seg-f98dc190541c = Holdover × limitador; indicadores-chave de desempenho (KPIs) da linha do tempo de resiliência (detectar/reagir/recuperar/perda)

# text
seg-e7190928bed6 = Critérios de Yang Yuanxi (o subconjunto de que as figuras de mérito de temporização/detecção tratam)

# text
seg-52836e247425 = Critério

# text
seg-cbbe4c0baf3f = Confiabilidade

# text
seg-32d64f865b21 = Fração de integridade do filtro

# text
seg-214372f29bd1 = Continuidade

# text
seg-ad5e76a596b8 = Holdover × limitador

# text
seg-d92fb15e6dfa = Exatidão

# text
# c1: fom::positioning_performance
seg-0de1f9119e0f = Aproximação de temporização/qualidade — <b>a exatidão no domínio da posição não faz parte da pontuação</b>. <c1/> converte uma covariância de posição e um HPL (nível de proteção horizontal) fornecidos em CEP/SEP/2DRMS (erro circular provável, erro esférico provável, o dobro da raiz da distância quadrática média), mas nenhum cenário o alimenta na pontuação de resiliência

# text
seg-0aa925a09499 = MODELLED (apenas no domínio do tempo)

# text
seg-6b661e6e4399 = O que esta correspondência não afirma

# text
seg-51a48d0c718d = Nenhum Nível do RPCF conferido. O Nível atribuído é uma leitura <em>provisória, derivada de simulação</em>, com um limitador explícito de degradação limitada, não uma maturidade conferida.

# text
# c1: pvt
# c2: gnss-ins
# c3: leo-pvt
# c4: integrity
seg-df73b7c76ae5 = Nenhuma exatidão no domínio da posição na pontuação. As subpontuações de resiliência são construídas a partir de métricas do domínio do tempo e de detecção. O motor calcula posições em outros pontos (os tipos de cenário <c1/>, <c2/> e <c3/>) e níveis de proteção (o tipo de cenário <c4/>), mas a camada de pontuação não os consome.

# text
# c1: resilience::panel
seg-30a1b1a4dfea = Nenhuma validação em campo. O painel de referência e o conjunto de ameaças são reduções sintéticas, fundamentadas em parâmetros (<c1/>), declaradas como limitação de primeira classe.

# text
# c1: resilience::study
seg-83c465cd78b0 = O estudo acompanhante (<c1/>) existe justamente para mostrar que reduzir essas dimensões a uma pontuação composta ou a um Nível produz uma classificação cuja ordenação de arquiteturas é instável sob escolhas defensáveis de ponderação e de ameaça — de modo que esta correspondência é uma camada de medição a ser lida por dimensão, não uma nota única para classificar um produto.

# text
seg-32bd45dc031d = Cenários de resiliência e verticais que exercitam essas camadas

# text
seg-4e36adba1c55 = Os cenários incluídos abaixo executam o mecanismo de ameaça e recuperação para o qual as linhas da correspondência apontam. Cada um é uma execução real do tipo de cenário nomeado; todos são <b>MODELLED</b> (sem dados de campo).

# text
# c1: scenarios/
seg-44664e49d449 = Cenário (<c1/>)

# text
seg-44b8d7435bfd = PNT em camadas sob uma ameaça comum de jamming/spoofing: um Monte Carlo com semente da negação de camadas, a fusão por variância inversa das sobreviventes, a razão de perda total de camada única versus em camadas, e como a negação correlacionada faz essa razão colapsar. Suas identidades de Monte Carlo para forma fechada e de fusão são verificadas por testes internos ao crate; o tipo de cenário não tem linha na matriz de verificação, de modo que aqui é classificado como MODELLED.

# text
seg-1734506ad287 = GNSS (sistema global de navegação por satélite) sob jamming, uma camada PNT de órbita terrestre baixa (LEO) sustenta o usuário, integridade mantida (três fases em uma linha do tempo).

# text
seg-ff8cc090bdce = Um jammer contra um receptor de quatro bandas; qual monitor de spoofing enxerga qual spoofer.

# text
seg-0a93502a4a19 = A margem jammer-sinal (J/S) a partir da potência recebida.

# text
seg-f2230253bdff = Detecção de spoofing por consistência de Doppler e de geometria de passagem.

# text
seg-d8ca900a8c14 = Temporização de estações-base e de infraestrutura crítica em holdover, com tempo LEO.

# text
seg-2a61d07bf177 = Usuários rodoviários, ferroviários, marítimos, polares e de Internet das Coisas (IoT) com uma camada LEO.

# text
seg-8723073167ad = Dead reckoning GNSS/INS (sistema de navegação inercial) por um cânion urbano e sob jamming em uma pequena aeronave não tripulada.

# text
seg-6ee1ef707b20 = Por quanto tempo um INS mantém um navio ou um trem dentro de seu limite com o GNSS negado.

# text
seg-7ca913e1729b = Um jammer marítimo; detecção de um spoofer que arrasta a posição informada de um navio.

# text
seg-c49548e8393b = <s1>Anterior</s1>Mapa DO-316 / DO-229E

# text
seg-dedf3b53d31f = <s1>Próximo</s1>Confiança no receptor
