# docs--kinds-mission-analysis-links-and-space-operations: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-cb9447893c7f = Um satélite sobre uma estação: a distância oblíqua, a elevação e o Es/N0 de cada passagem ao longo da passagem, o MODCOD DVB-S2 escolhido em cada passo (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem de implementação) e o volume de dados que o ACM transfere face à linha de base de codificação constante que fecha na máscara. MODELLED.

# attr:alt
seg-046f69293874 = O gráfico que o motor escreve para scenarios/acm-link.toml, tipo acm-link

# text
seg-7eff466eb018 = Controlo de atitude de veículos espaciais: uma reorientação com apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas sob realimentação MRP (L = -K sigma - P omega), binários de roda de norma mínima limitados ao limite de cada motor, RK4 com retenção de ordem zero; opcionalmente fechada sobre um EKF multiplicativo a partir de um giroscópio simulado (passeio aleatório de ângulo e de taxa) e de um seguidor de estrelas. Comunica o tempo de estabilização, o erro de apontamento final e máximo, a velocidade e o binário máximos das rodas, a fração saturada, a deriva do momento angular e, com o estimador, o seu erro de atitude e o NEES. O ciclo de estado verdadeiro é VALIDATED face ao Basilisk { "2.9.1" }; o estimador é MODELLED.

# attr:alt
seg-08c624d5324d = O gráfico que o motor escreve para scenarios/aocs-slew.toml, tipo aocs

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Ciclo de utilização de aberturas: a partilha de tempo entre navegação e comunicações que um plano de contactos implica para um conjunto de aberturas orientáveis. Recebe um plano de contactos (uma lista de janelas <c1/> aos_s/los_s, cada uma a pedir navegação ou comunicações — o mesmo vocabulário aos_s/los_s que o preditor <c2/> emite), um número de aberturas e uma POLÍTICA DE ARBITRAGEM (prioridade à navegação por predefinição, ou prioridade às comunicações, ou por ordem de chegada sem preempção), e comunica a utilização para navegação, a utilização para comunicações, a utilização em repouso e a indisponibilidade por sessão — o tempo de contacto que uma sessão pediu e que nenhuma abertura serviu. Uma varredura exata de intervalos sobre os limites das janelas, de modo que janelas contíguas nunca disputam e nenhum segundo de abertura é contado duas vezes; os segundos de abertura de navegação, de comunicações e em repouso são acumulados independentemente e fecham face a apertures*horizon_s. O relatório indica a política resolvida, a sua definição completa e as definições de utilização e de indisponibilidade, porque um valor de utilização citado sem a sua política de arbitragem não é reprodutível. Aritmética de escalonamento MODELLED: não é contabilizado nenhum tempo de reorientação / resintonização / mudança quando uma abertura muda de serviço ou de sessão, nenhum volume de dados, estado de memória intermédia, orçamento de energia ou fecho de ligação entra na decisão, e as janelas de contacto são entradas — a sua geometria é aquilo que as produziu. Não é um produto de escalonamento de segmento terrestre.

# attr:alt
seg-a8b38ed8e029 = O gráfico que o motor escreve para scenarios/aperture-duty-cycle.toml, tipo aperture-duty-cycle

# text
seg-34d041d6bd9f = Ascensão planar com viragem gravitacional de um veículo de vários andares sobre uma Terra esférica sem rotação, através da US Standard Atmosphere { "1976" } (subida vertical, impulso de inclinação, tração ao longo da velocidade), integrando as perdas por gravidade, resistência, orientação e contrapressão e verificando o dv ideal menos as perdas face à velocidade no fim da queima; max-Q, aceleração máxima e estado no fim da queima. MODELLED.

# attr:alt
seg-ccf2185b0b5e = O gráfico que o motor escreve para scenarios/ascent-losses.toml, tipo ascent-losses

# text
seg-62c0dda9fc56 = Orçamento de erro de atitude e de apontamento a 3-DOF: o binário perturbador de gradiente de gravidade no pior caso ((3/2)(μ/R³)ΔI) e um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes nomeados de 1σ (ruído de sensores, vibração das rodas de reação, térmico, alinhamento) com o termo dominante, para uma altitude orbital e uma dispersão de inércia do corpo. Orçamento escalar de AOCS MODELLED — um complemento pré-hardware do Basilisk/42, não uma simulação de ciclo de controlo/6-DoF/modos flexíveis.

# attr:alt
seg-ad0e72e3b688 = O gráfico que o motor escreve para scenarios/attitude-budget.toml, tipo attitude-budget

# text
seg-be4e928a5865 = Planeamento de contactos com o solo para vários satélites sobre várias estações: janelas de acesso aparentes (SGP4, referencial fixo à Terra IAU 2006/2000A, refração ITU-R P.834, tempo de luz), o volume de dados DVB-S2 ACM de cada passagem (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1) e um calendário sem conflitos (um satélite por antena com um tempo de retorno, uma estação por satélite, entrega ponderada por prioridade limitada a cada backlog) por um método guloso de valor marginal, uma linha de base de ordem de chegada e um branch and bound exato em conjuntos pequenos, com a lacuna de otimalidade do método guloso. MODELLED.

# attr:alt
seg-e26b549579e2 = O gráfico que o motor gera para scenarios/contact-schedule.toml, tipo de cenário contact-schedule

# text
seg-b843e2e0a4ee = Entrada atmosférica de massa pontual em 3-DoF sobre uma Terra esférica em rotação ou Marte (balística ou com sustentação a inclinação lateral constante), RK4, através da US76, de uma atmosfera exponencial ou da atmosfera de Marte, com aquecimento convectivo no ponto de estagnação de Sutton-Graves (NASA TR R-376): desaceleração de pico, fluxo de calor e pressão dinâmica, carga térmica, alcance longitudinal, uma verificação de energia no referencial em rotação e a forma fechada de Allen-Eggers ao lado. A desaceleração de pico é conferida contra o valor nominal publicado da Stardust; o aquecimento é MODELLED.

# attr:alt
seg-dbb618cd6357 = O gráfico que o motor gera para scenarios/entry-heating-stardust.toml, tipo de cenário entry-heating

# text
seg-47b4aea6ed01 = Pegada da carga útil de observação da Terra e geometria de cobertura (triângulo espacial do SMAD): raio angular da Terra, largura da faixa imageada, distância de amostragem no solo no nadir, acesso máximo fora do nadir, período circular, período nodal com J2 e espaçamento equatorial do traço no solo com um indicador de cobertura contígua, para uma altitude orbital, uma inclinação (heliossíncrona por predefinição) e um FOV/IFOV do sensor. Geometria de Terra esférica MODELLED (sem radiometria/MTF/atmosfera/jitter/reflexo solar); espaçamento de nós R_e·(ω − Ω̇)·T_nodal com taxas seculares de J2 de primeira ordem.

# attr:alt
seg-c2a8332f2ee2 = O gráfico que o motor gera para scenarios/eo-coverage.toml, tipo de cenário eo-coverage

# text
seg-816bd5a5808a = Radiometria de imageador no nadir e qualidade de imagem: radiância na abertura de uma cena lambertiana, a equação da câmara, sinal e ruído de disparo/escuro/leitura/quantização e SNR; a MTF do sistema em Nyquist (difração x detector x arrasto x jitter), a resposta relativa de borda a partir dela, Q = lambda F/p e o NIIRS da GIQE versão { "4" } sem compensação de MTF. MODELLED.

# attr:alt
seg-bf7b52f7a01e = O gráfico que o motor gera para scenarios/eo-radiometry.toml, tipo de cenário eo-radiometry

# text
seg-7a4e6215a488 = Geometria de lançamento e ascensão de dois corpos: azimute(s) de lançamento (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, o bónus para leste da rotação da Terra, Δv de mudança de plano em dogleg quando a inclinação-alvo está abaixo da latitude do local, e o número de oportunidades diárias de lançamento. Geometria de Terra esférica MODELLED (sem correção do triângulo de velocidades da Terra em rotação, sem modelo de ascensão/perda por arrasto).

# attr:alt
seg-9696283a95ae = O gráfico que o motor gera para scenarios/launch-window.toml, tipo de cenário launch-window
