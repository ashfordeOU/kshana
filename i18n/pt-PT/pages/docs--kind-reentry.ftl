# docs--kind-reentry: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação através da US Standard Atmosphere { "1976" } (densidade e pressão), com um impulso de inclinação, tração reduzida pela contrapressão da tubeira, fins de queima dos andares em s

# text
seg-8e62cc4af6ea = Página do tema: <a1>ENTRY-EO-ASCENT.md</a1>

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
seg-039f77066d97 = Corredor de reentrada balística de Allen-Eggers: desaceleração máxima (independente do coeficiente balístico, V_e^{ "2" } sin|γ|/(2eH)), a velocidade e a altitude no pico de g e a velocidade de aquecimento máximo, para uma velocidade de entrada/ângulo da trajetória de voo/coeficiente balístico numa atmosfera exponencial, mais uma integração planar de massa pontual da mesma entrada balística com gravidade, curvatura da Terra e a Atmosfera Padrão dos EUA de { "1976" } (desaceleração máxima, velocidade, altitude e tempo no pico). Entrada balística (sem sustentação) MODELLED; o resultado de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor (sem modelo aerotérmico/TPS).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Uma execução de <c1/> resume-se assim: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> pico { "16.6" } g a { "49" } km, { "4731" } m/s; o aquecimento atinge o máximo a { "6603" } m/s; massa pontual (gravidade, curvatura, US76) pico { "16.4" } g (balística MODELLED, sem modelo aerotérmico)

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
seg-0b7769c97ff3 = Etiqueta de resultado (a do motor): MODELLED — entrada balística (sem sustentação) de Allen–Eggers, atmosfera isotérmica exponencial, ângulo de trajetória de voo constante; o pico de g é independente do coeficiente balístico; o aquecimento é a VELOCIDADE de aquecimento máximo, NÃO um fluxo de calor (sem modelo aerotérmico/TPS)

# attr:alt
seg-b0109481e8ff = O gráfico que o motor escreve para scenarios/reentry.toml, tipo reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Desaceleração máxima (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. Ensaios: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Desaceleração máxima (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. R. Referência independente (InternalConsistency): entrada analítica de Allen–Eggers de forma fechada, verificada adicionalmente face a uma integração numérica scipy { "1.18" } solve_ivp (DOP853) da MESMA EDO de entrada só com arrasto (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior a_max rel { "2.9e-9" }) — uma verificação integral-numérico-vs-forma-analítica-própria, pelo que continua a ser InternalConsistency, NÃO uma validação externa. Balística MODELLED (sem sustentação), sem aerotérmico/TPS — o resultado de aquecimento é uma ve

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — entrada balística (sem sustentação) de Allen–Eggers, atmosfera isotérmica exponencial, ângulo de trajetória de voo constante; o pico de g é independente do coeficiente balístico; o aquecimento é a VELOCIDADE de aquecimento máximo, NÃO um fluxo de calor (sem modelo aerotérmico/TPS) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = Entrada balística (sem sustentação) MODELLED; o resultado de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor (sem modelo aerotérmico/TPS). (catálogo de tipos (<c1/>))

# text
seg-080b28422342 = ÂMBITO HONESTO: balística (sem sustentação) MODELLED, atmosfera isotérmica exponencial, ângulo de trajetória de voo constante. Sem modelo aerotérmico/TPS -- o resultado de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor. Não é uma trajetória de 3-/6-DoF. Executar: kshana scenarios/reentry.toml (comentário do ficheiro de cenário, linhas { "8" } a { "11" })

# text
seg-cfc345f0dc0d = O corredor de reentrada balística (Allen–Eggers) é MODELLED, não validado: verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Anterior</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Seguinte</s1>slot-timing
