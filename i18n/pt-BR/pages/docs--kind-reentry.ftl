# docs--kind-reentry: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Subida planar em curva gravitacional de um veículo de vários estágios sobre uma Terra esférica não rotativa, através da US Standard Atmosphere { "1976" } (densidade e pressão), com um chute de arfagem, empuxo reduzido pela contrapressão do bocal, fins de queima dos estágios em s exatos

# text
seg-8e62cc4af6ea = Página do tópico: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-195347c63a8a = m/s^{ "2" }

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Fonte: <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (tipo de cenário)

# text
seg-039f77066d97 = Corredor balístico de reentrada de Allen-Eggers: desaceleração máxima (independente do coeficiente balístico, V_e^{ "2" } sin|γ|/(2eH)), a velocidade e a altitude no pico de g e a velocidade de aquecimento máximo, para uma velocidade de entrada, ângulo da trajetória e coeficiente balístico em uma atmosfera exponencial, além de uma integração planar de massa pontual da mesma entrada balística com gravidade, curvatura da Terra e a Atmosfera Padrão dos EUA { "1976" } (desaceleração máxima, velocidade, altitude e tempo no pico). Entrada balística (sem sustentação) MODELLED; a saída de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor (sem modelo aerotérmico/TPS).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Uma execução de <c1/> resume-se assim: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> pico { "16.6" } g a { "49" } km, { "4731" } m/s; o aquecimento atinge o máximo a { "6603" } m/s; massa pontual (gravidade, curvatura, US76) pico { "16.4" } g (balístico MODELLED, sem aerotérmico)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = O exemplo <c1/> define, entre outros:

# text
seg-0b7769c97ff3 = Rótulo do resultado (do mecanismo): MODELLED — entrada balística (sem sustentação) de Allen–Eggers, atmosfera isotérmica exponencial, ângulo de trajetória constante; o pico de g é independente do coeficiente balístico; o aquecimento é a VELOCIDADE de aquecimento máximo, NÃO um fluxo de calor (sem modelo aerotérmico/TPS)

# attr:alt
seg-b0109481e8ff = O gráfico que o mecanismo gera para scenarios/reentry.toml, tipo reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Desaceleração máxima (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. Testes: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Desaceleração máxima (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. R. Referência independente (InternalConsistency): entrada analítica de Allen–Eggers em forma fechada, conferida adicionalmente com uma integração numérica solve_ivp (DOP853) do scipy { "1.18" } da MESMA EDO de entrada somente com arrasto (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior a_max rel { "2.9e-9" }) — uma verificação de integral numérica contra a própria forma analítica, portanto ainda InternalConsistency, NÃO uma validação externa. Balístico (sem sustentação) MODELLED, sem aerotérmico/TPS — a saída de aquecimento é uma ve

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — entrada balística (sem sustentação) de Allen–Eggers, atmosfera isotérmica exponencial, ângulo de trajetória constante; o pico de g é independente do coeficiente balístico; o aquecimento é a VELOCIDADE de aquecimento máximo, NÃO um fluxo de calor (sem modelo aerotérmico/TPS) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = Entrada balística (sem sustentação) MODELLED; a saída de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor (sem modelo aerotérmico/TPS). (catálogo de tipos (<c1/>))

# text
seg-080b28422342 = ESCOPO HONESTO: balístico (sem sustentação) MODELLED, atmosfera isotérmica exponencial, ângulo de trajetória constante. Sem modelo aerotérmico/TPS -- a saída de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor. Não é uma trajetória de 3-/6-DoF. Execução: kshana scenarios/reentry.toml (comentário do arquivo de cenário, linhas { "8" } a { "11" })

# text
seg-cfc345f0dc0d = O corredor balístico de reentrada (Allen–Eggers) é MODELLED, não validado: conferido com a própria identidade analítica de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Anterior</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Seguinte</s1>slot-timing
