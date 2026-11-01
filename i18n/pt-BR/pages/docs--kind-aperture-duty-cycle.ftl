# docs--kind-aperture-duty-cycle: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Fonte: <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (tipo de cenário)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Ciclo de trabalho de abertura: a divisão de tempo entre navegação e comunicações que um plano de contatos implica para um conjunto de aberturas direcionáveis. Recebe um plano de contatos (uma lista de janelas <c1/> aos_s/los_s, cada uma pedindo navegação ou comunicações — o mesmo vocabulário aos_s/los_s que o preditor <c2/> emite), uma contagem de aberturas e uma POLÍTICA DE ARBITRAGEM (prioridade de navegação por padrão, ou prioridade de comunicações, ou primeiro a chegar, primeiro a ser atendido sem preempção), e informa o ciclo de trabalho de navegação, o ciclo de trabalho de comunicações, o ciclo de trabalho ocioso e a indisponibilidade por sessão — o tempo de contato que uma sessão pediu e nenhuma abertura atendeu. Uma varredura exata de intervalos sobre as fronteiras das janelas, de modo que janelas que se tocam nunca disputam e nenhum segundo de abertura é contado em dobro; os segundos de abertura de navegação, de comunicações e ociosos são acumulados de forma independente e fecham contra aberturas*horizon_s. O relatório declara a política resolvida, a sua definição completa e as definições de ciclo de trabalho e de indisponibilidade, porque um valor de ciclo de trabalho citado sem a sua política de arbitragem não é reproduzível. Aritmética de agendamento MODELLED: nenhum tempo de manobra / resintonização / troca é cobrado quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de buffer, orçamento de energia ou fechamento de enlace entra na decisão, e as janelas de contato são entradas — a sua geometria é aquela que as produziu. Não é um produto de agendamento de segmento terrestre.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Uma execução de <c1/> resume-se assim: aperture-duty-cycle: { "6" } sessão(ões) em { "2" } abertura(s) sob prioridade de navegação -> ciclo de trabalho de navegação { "0.1167" }, ciclo de trabalho de comunicações { "0.2667" }, ocioso { "0.6167" }; { "0" } s de { "6900" } s pedidos perdidos por disputa (MODELLED)

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-67c665d5c8c0 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-60f25ccdab6e = O exemplo <c1/> define, entre outros:

# text
seg-bf51947657c0 = navegação

# text
seg-b4ff1d640bdf = comunicações

# text
seg-2e78730d0737 = abertura*s

# text
seg-330cbcd04718 = fração (adimensional)

# text
seg-0ef5875db338 = Rótulo do resultado (o do motor): MODELLED — aritmética de agendamento de aberturas sobre um plano de contatos fornecido: uma varredura exata de intervalos da divisão de tempo entre navegação e comunicações e da perda por disputa por sessão sob uma política de arbitragem nomeada. Nenhum tempo de manobra / resintonização / troca é cobrado quando uma abertura muda de serviço ou de sessão,

# attr:alt
seg-a8b38ed8e029 = O gráfico que o motor grava para scenarios/aperture-duty-cycle.toml, tipo de cenário aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Uma execução recebe um plano de contatos (uma lista de janelas aos_s/los_s, cada uma pedindo à abertura navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), uma abertu

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Uma execução recebe um plano de contatos (uma lista de janelas aos_s/los_s, cada uma pedindo à abertura navegação ou comunicações — o mesmo vocabulário de janelas que `passes::pre. Referência independente (InternalConsistency): Consistência interna, a partir de três grandezas calculadas por expressões diferentes na mesma varredura e então obrigadas a fechar. Os segundos de abertura de navegação, de comunicações e ociosos são acumulados separadamente — os ociosos a partir de (aberturas − |atendidas|) por intervalo elementar, nunca como um resto — e a sua soma é afirmada contra aberturas × horizon_s, o que uma fronteira mal delimitada, uma dupla c

# text
# c1: label
seg-a388c24fec99 = MODELLED — aritmética de agendamento de aberturas sobre um plano de contatos fornecido: uma varredura exata de intervalos da divisão de tempo entre navegação e comunicações e da perda por disputa por sessão sob uma política de arbitragem nomeada. Nenhum tempo de manobra / resintonização / troca é cobrado quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de buffer, orçamento de energia ou fechamento de enlace entra na decisão, e as janelas de contato são entradas — th (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = Aritmética de agendamento MODELLED: nenhum tempo de manobra / resintonização / troca é cobrado quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de buffer, orçamento de energia ou fechamento de enlace entra na decisão, e as janelas de contato são entradas — a sua geometria é aquela que as produziu. (catálogo de tipos de cenário (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = ESCOPO HONESTO: aritmética de agendamento MODELLED sobre as janelas fornecidas. Nenhum tempo de manobra / resintonização / troca é cobrado quando uma abertura muda de serviço ou de sessão; nenhum volume de dados, estado de buffer, orçamento de energia ou fechamento de enlace entra na decisão; e as janelas de contato são entradas -- a sua geometria é aquela que as produziu (o cenário <c1/> emite o mesmo vocabulário aos_s / los_s). Não é um agendamento de segmento terrestre (comentário do arquivo de cenário, linhas { "18" } a { "24" })

# text
seg-0b7f8d86e5d5 = O ciclo de trabalho de navegação versus comunicações da abertura é MODELLED, não validado: verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Anterior</s1>aocs

# text
seg-5b4fd889fdff = <s1>Próxima</s1>araim-reference-check
