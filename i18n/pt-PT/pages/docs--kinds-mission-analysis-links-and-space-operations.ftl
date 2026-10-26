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

# text
seg-953188c11165 = Orçamento de ligação unidirecional segundo a equação de ligação CCSDS { "401" } / DSN 810-005: perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fecho para uma EIRP de transmissão, G/T de receção, distância, taxa de dados e banda (s|x|ka) face a um Eb/N₀ exigido. Um cálculo de engenharia determinístico a partir das entradas fornecidas (não a ficha técnica de um terminal calibrado).

# attr:alt
seg-bd375631bc7e = O gráfico que o motor escreve para scenarios/link-budget.toml, tipo de cenário link-budget

# text
seg-dbffff25b57f = Ponte de interoperabilidade CCSDS OEM: importa uma Orbit Ephemeris Message produzida por uma ferramenta externa de dinâmica de voo (GMAT/Orekit/STK emitem todas OEM) e indica os seus segmentos/objetos/referenciais/intervalo de épocas, mais uma verificação de consistência da velocidade; sem entrada, faz a ida e volta de uma órbita de referência gerada e indica a fidelidade importação↔exportação. Verificação de ingestão estrutural/física MODELLED, NÃO uma validação da exatidão orbital da origem.

# attr:alt
seg-5db5a7c812ca = O gráfico que o motor escreve para scenarios/oem-interop.toml, tipo de cenário oem-interop

# text
seg-039f77066d97 = Corredor de reentrada balística de Allen-Eggers: desaceleração máxima (independente do coeficiente balístico, V_e^{ "2" } sin|γ|/(2eH)), a velocidade e a altitude no pico de g e a velocidade de aquecimento máximo, para uma velocidade de entrada/ângulo da trajetória de voo/coeficiente balístico numa atmosfera exponencial, mais uma integração planar de massa pontual da mesma entrada balística com gravidade, curvatura da Terra e a Atmosfera Padrão dos EUA de { "1976" } (desaceleração máxima, velocidade, altitude e tempo no pico). Entrada balística (sem sustentação) MODELLED; o resultado de aquecimento é a VELOCIDADE de aquecimento máximo, não um fluxo de calor (sem modelo aerotérmico/TPS).

# attr:alt
seg-b0109481e8ff = O gráfico que o motor escreve para scenarios/reentry.toml, tipo reentry

# text
seg-de2448d74c2b = Enquadramento CCSDS 133.0-B Space Packet Protocol: codifica um fluxo sintético de pacotes TM/TC (cabeçalho primário de 6 octetos + campo de dados) e indica a descodificação do cabeçalho de cada pacote, o total de octetos e uma viagem de ida e volta codificação↔descodificação exata. Enquadramento determinístico com disposição exata de bits — a camada de interoperabilidade de formato de pacotes das agências; NÃO é uma certificação de aderência à norma (sem lógica de cabeçalho secundário/CRC/segmentação além dos indicadores).

# attr:alt
seg-af1cf9aa9938 = O gráfico que o motor escreve para scenarios/space-packet.toml, tipo space-packet

# text
seg-4e31c8daf798 = Registo

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
# c1: docs/kinds/mission-analysis-links-and-space-operations.md
seg-69ee217ed8e0 = Fonte: <c1/>

# text
seg-f5091cbeecbf = Análise de missão, ligações e operações espaciais (família de tipos de cenário)

# text
seg-d0eea6d9d1ad = { "14" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: kshana scenarios/launch-window.toml
seg-6481dabc9458 = Páginas de tema: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Executar uma: <c1/>. Todas as famílias: <a4>KINDS.md</a4>.

# attr:alt
seg-d6c5a581ffaf = Folha de contactos dos gráficos que o motor escreve para os tipos da família Análise de missão, ligações e operações espaciais

# text
seg-8d65a4a1948d = Geometria de lançamento e ascensão de dois corpos: azimute(s) de lançamento (sin Az = cos i / cos lat), inclinação mínima atingível, velocidade circular, o bónus para leste da rotação da Terra, Δv de mudança de plano em dogleg quando o

# text
seg-dd47e755d262 = Ascensão planar por viragem gravitacional de um veículo multiestágio sobre uma Terra esférica sem rotação através da Atmosfera Padrão dos EUA de { "1976" } (subida vertical, impulso de inclinação, tração ao longo da velocidade), integrando a gra

# text
seg-cc88f37328a3 = Corredor de reentrada balística de Allen-Eggers: desaceleração máxima (independente do coeficiente balístico, V_e^{ "2" } sin/γ//(2eH)), a velocidade e a altitude no pico de g e a velocidade de aquecimento máximo, para uma velocidade de entrada

# text
seg-8ad7c34d8c25 = Entrada atmosférica de massa pontual de 3-DoF sobre uma Terra ou um Marte esféricos em rotação (balística ou com sustentação a inclinação constante), RK4, através da US76, de uma atmosfera exponencial ou da atmosfera de Marte, com estagnação de Sutton-Graves

# text
seg-efe896d3f43b = Geometria de pegada e cobertura de carga útil de observação da Terra (triângulo espacial SMAD): raio angular da Terra, largura da faixa, distância de amostragem no solo ao nadir, acesso máximo fora do nadir, período circular, período nodal J2

# text
seg-d3d9652fd8a0 = Radiometria e qualidade de imagem de um sensor de imagem ao nadir: radiância à abertura de uma cena lambertiana, a equação da câmara, sinal e ruído de disparo/escuro/leitura/quantização e SNR; a MTF do sistema a Nyquist (difração

# text
seg-1940d5c75a98 = Orçamento de erro de atitude e apontamento de 3-DOF: o pior caso do binário perturbador de gradiente de gravidade ((3/2)(μ/R³)ΔI) e um orçamento de erro de apontamento por raiz da soma dos quadrados sobre contribuintes de 1σ identificados (ruído de sensor, reação

# text
seg-e00d18fbb52b = Controlo de atitude de veículo espacial: uma reorientação de apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas sob realimentação MRP (L = -K sigma - P omega), binários de roda de norma mínima limitados a cada

# text
seg-496fa280de7b = Orçamento de ligação unidirecional sobre a equação de ligação CCSDS { "401" } / DSN 810-005: perda de percurso em espaço livre, C/N₀, Eb/N₀, margem e fecho para uma EIRP de emissão, G/T de receção, distância, taxa de dados e banda (s/x/ka) face a uma

# text
seg-f0aca7ea1ffa = Um satélite sobre uma estação: a distância oblíqua, a elevação e o Es/N0 de cada passagem ao longo da passagem, o MODCOD DVB-S2 escolhido em cada passo (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem de implementação)

# text
seg-44c4890ba07e = Planeamento de contactos terrestres para vários satélites sobre várias estações: janelas de acesso aparentes (SGP4, referencial terrestre IAU 2006/2000A, refração ITU-R P.834, tempo de luz), o volume de dados ACM DVB-S2 d

# text
seg-19ab136e9f9b = Ciclo de trabalho de abertura: a partilha de tempo entre navegação e comunicações que um plano de contactos implica para um conjunto de aberturas orientáveis.

# text
seg-ee0c649ca8b2 = Enquadramento CCSDS 133.0-B Space Packet Protocol: codifica um fluxo sintético de pacotes TM/TC (cabeçalho primário de 6 octetos + campo de dados) e indica a descodificação do cabeçalho de cada pacote, o total de octetos e uma viagem de ida e volta codificação↔descodificação exata

# text
seg-e561f3a749db = Ponte de interoperabilidade CCSDS OEM: importa uma Orbit Ephemeris Message produzida por uma ferramenta externa de dinâmica de voo (GMAT/Orekit/STK emitem todos OEM) e indica os seus segmentos/objetos/referenciais/intervalo de épocas mais

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-1f074d7beccc = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-8f65824c39c5 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>launch-window</a1>.

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-2926bde689d3 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-66f6489411d0 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>ascent-losses</a1>.

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-481ce1d98bc7 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-fff98550eb48 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>reentry</a1>.

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-9cf8d4b6064f = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-84e1bddcbc95 = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>entry-heating</a1>.

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-eab43348803e = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-9c6ce756a89a = <b>Registo:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>eo-coverage</a1>.

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-cd84a7bdbe57 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-320d724ac797 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>eo-radiometry</a1>.

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-905487bf50f1 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-14511e367361 = <b>Registo:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>attitude-budget</a1>.

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
# c6: duration_s
# c7: dt_s
# c8: sample_s
# c9: omega0_rad_s
# c10: pointing_threshold_deg
# c11: estimator
seg-540fa1932dad = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcionais: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-6d2e9b9ce87f = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>aocs</a1>.

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-3345731b5729 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-f8b896b81014 = <b>Registo:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>link-budget</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-e38e356f4b71 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-eed876ed5aab = <b>Registo:</b> MODELLED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>acm-link</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-5fddd2460fb0 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-58d00faa1eda = <b>Registo:</b> MODELLED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>contact-schedule</a1>.

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-5d4f6861f301 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1e06e06d4325 = <b>Registo:</b> MODELLED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>aperture-duty-cycle</a1>.

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-9bb424e01c84 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-688071019c9e = <b>Registo:</b> VALIDATED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>space-packet</a1>.

# text
# c1: oem_text
seg-03c06f9fdc85 = Campos obrigatórios: nenhum. Opcional: <c1/>.

# text
seg-568c484ce9a0 = <b>Registo:</b> VALIDATED. Página completa, com os dados de entrada, os resultados, as evidências e as limitações: <a1>oem-interop</a1>.

# text
seg-41996765fcf1 = <s1>Anterior</s1>Lunar e cislunar

# text
seg-1951c46fe429 = <s1>Seguinte</s1>PNT ótica
