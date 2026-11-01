# docs--kind-launch-window: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-b054c73f22e5 = sem valor

# text
seg-8e62cc4af6ea = Página do tópico: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/launch-window.md
seg-1c385961d594 = Fonte: <c1/>

# text
# c1: launch-window
seg-e0990c5f14da = <c1/> (tipo de cenário)

# text
seg-7a4e6215a488 = Geometria de lançamento e ascensão de dois corpos: azimute(s) de lançamento (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, o bônus para leste da rotação da Terra, Δv de mudança de plano em dogleg quando a inclinação-alvo está abaixo da latitude do local, e o número de oportunidades diárias de lançamento. Geometria de Terra esférica MODELLED (sem correção do triângulo de velocidades da Terra em rotação, sem modelo de ascensão/perda por arrasto).

# text
# c1: scenarios/launch-window.toml
seg-e24b0ae723c7 = Uma execução de <c1/> resume-se assim: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, bônus de rotação da Terra de +{ "409" } m/s, { "2" } oportunidades/dia (MODELLED)

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-6f955816b5c6 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/launch-window.toml
seg-aaadee0743ee = O exemplo <c1/> define, entre outros:

# text
seg-58d26f083b8f = Rótulo do resultado (o do motor): MODELLED — geometria de lançamento de dois corpos com Terra esférica; o azimute é a relação geométrica sin(Az)=cos(i)/cos(lat) (sem correção do triângulo de velocidades da Terra em rotação, sem modelo de ascensão/perda por arrasto)

# attr:alt
seg-9696283a95ae = O gráfico que o motor gera para scenarios/launch-window.toml, tipo de cenário launch-window

# text
seg-38175030f689 = <b>MODELLED</b> Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bônus para leste da rotação da Terra, Δv de mudança de plano em dogleg e oportunidades diárias, e, dados uma época e linhas IERS finals2000A, o local

# text
seg-53bc589c7ed6 = <b>MODELLED</b> Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bônus para leste da rotação da Terra, Δv de mudança de plano em dogleg a. Referência independente (InternalConsistency): Geometria de lançamento de trigonometria esférica em forma fechada contra âncoras publicadas de exemplos resolvidos (Vallado, Fundamentals of Astrodynamics 4ª ed., Algoritmo { "37" } de azimute de lançamento + Cap. 6 de mudança de plano; tests/launch_window_ascent_geometry_reference.rs). Elas reutilizam a mesma forma fechada que o kshana implementa (uma verificação de paridade com valor publicado / de transcrição, InternalConsistency); MODELLED de dois corpos, sem triângulo de velocidades da Terra em rotação / ascensão / arra

# text
# c1: label
seg-12396619d3e5 = MODELLED — geometria de lançamento de dois corpos com Terra esférica; o azimute é a relação geométrica sin(Az)=cos(i)/cos(lat) (sem correção do triângulo de velocidades da Terra em rotação, sem modelo de ascensão/perda por arrasto) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-715f1856bd37 = Geometria de Terra esférica MODELLED (sem correção do triângulo de velocidades da Terra em rotação, sem modelo de ascensão/perda por arrasto). (catálogo de tipos de cenário (<c1/>))

# text
seg-4e9a215e3918 = ESCOPO HONESTO: MODELLED. Apenas azimute geométrico -- sem correção do triângulo de velocidades da Terra em rotação (o bônus é informado separadamente para ser incorporado), sem trajetória de ascensão / perda por arrasto / modelo de esterçamento. Geometria de pré-Fase A. Execução: kshana scenarios/launch-window.toml (comentário do arquivo de cenário, linhas { "8" } a { "11" })

# text
seg-12332d181de4 = A geometria de janela de lançamento e ascensão (análise de missão) é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-1a3841380d88 = <s1>Anterior</s1>jamming

# text
seg-78411b85f301 = <s1>Próximo</s1>leo-navmsg
