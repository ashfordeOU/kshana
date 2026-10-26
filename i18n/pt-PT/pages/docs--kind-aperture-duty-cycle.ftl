# docs--kind-aperture-duty-cycle: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Fonte: <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (tipo de cenário)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Ciclo de utilização de aberturas: a partilha de tempo entre navegação e comunicações que um plano de contactos implica para um conjunto de aberturas orientáveis. Recebe um plano de contactos (uma lista de janelas <c1/> aos_s/los_s, cada uma a pedir navegação ou comunicações — o mesmo vocabulário aos_s/los_s que o preditor <c2/> emite), um número de aberturas e uma POLÍTICA DE ARBITRAGEM (prioridade à navegação por predefinição, ou prioridade às comunicações, ou por ordem de chegada sem preempção), e comunica a utilização para navegação, a utilização para comunicações, a utilização em repouso e a indisponibilidade por sessão — o tempo de contacto que uma sessão pediu e que nenhuma abertura serviu. Uma varredura exata de intervalos sobre os limites das janelas, de modo que janelas contíguas nunca disputam e nenhum segundo de abertura é contado duas vezes; os segundos de abertura de navegação, de comunicações e em repouso são acumulados independentemente e fecham face a apertures*horizon_s. O relatório indica a política resolvida, a sua definição completa e as definições de utilização e de indisponibilidade, porque um valor de utilização citado sem a sua política de arbitragem não é reprodutível. Aritmética de escalonamento MODELLED: não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de memória intermédia, orçamento de energia ou fecho de ligação entra na decisão, e as janelas de contacto são entradas — a sua geometria é aquilo que as produziu. Não é um produto de escalonamento de segmento terrestre.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Uma execução de <c1/> resume-se assim: aperture-duty-cycle: { "6" } session(s) on { "2" } aperture(s) under navigation-priority -> navigation duty { "0.1167" }, communications duty { "0.2667" }, idle { "0.6167" }; { "0" } s of { "6900" } s requested lost to contention (MODELLED)

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
seg-0ef5875db338 = Etiqueta do resultado (a do motor): MODELLED — aritmética de escalonamento de aberturas sobre um plano de contactos fornecido: uma varredura exata de intervalos da partilha de tempo entre navegação e comunicações e da perda por disputa por sessão sob uma política de arbitragem nomeada. Não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão,

# attr:alt
seg-a8b38ed8e029 = O gráfico que o motor escreve para scenarios/aperture-duty-cycle.toml, tipo aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Uma execução recebe um plano de contactos (uma lista de janelas aos_s/los_s, cada uma a pedir à abertura navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), um número de aberturas

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Uma execução recebe um plano de contactos (uma lista de janelas aos_s/los_s, cada uma a pedir à abertura navegação ou comunicações — o mesmo vocabulário de janelas `passes::pre. Referência independente (InternalConsistency): Consistência interna, a partir de três grandezas calculadas por expressões diferentes na mesma varredura e depois obrigadas a fechar. Os segundos de abertura de navegação, de comunicações e em repouso são acumulados em separado — o repouso a partir de (aberturas − |servidas|) por intervalo elementar, nunca como resto — e a sua soma é verificada face a aberturas × horizon_s, o que um limite mal delimitado, uma dupla contagem

# text
# c1: label
seg-a388c24fec99 = MODELLED — aritmética de escalonamento de aberturas sobre um plano de contactos fornecido: uma varredura exata de intervalos da partilha de tempo entre navegação e comunicações e da perda por disputa por sessão sob uma política de arbitragem nomeada. Não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de memória intermédia, orçamento de energia ou fecho de ligação entra na decisão, e as janelas de contacto são entradas — th (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = Aritmética de escalonamento MODELLED: não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de memória intermédia, orçamento de energia ou fecho de ligação entra na decisão, e as janelas de contacto são entradas — a sua geometria é aquilo que as produziu. (catálogo de tipos (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = ÂMBITO HONESTO: aritmética de escalonamento MODELLED sobre as janelas fornecidas. Não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão; nenhum volume de dados, estado de memória intermédia, orçamento de energia ou fecho de ligação entra na decisão; e as janelas de contacto são entradas -- a sua geometria é aquilo que as produziu (o cenário <c1/> emite o mesmo vocabulário aos_s / los_s). Não é um escalonamento de segmento terrestre (comentário do ficheiro de cenário, linhas { "18" } a { "24" })

# text
seg-0b7f8d86e5d5 = O ciclo de utilização de aberturas entre navegação e comunicações é MODELLED, não validado: verificado face à sua própria identidade analítica / de forma fechada — apanha erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Anterior</s1>aocs

# text
seg-5b4fd889fdff = <s1>Seguinte</s1>araim-reference-check
