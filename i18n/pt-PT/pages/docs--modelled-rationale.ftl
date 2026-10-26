# docs--modelled-rationale: translations (pt-PT)

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Mapeamento de compliance para quadros públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidade

# text
seg-60a43431ebe0 = Requisito

# text
seg-bde1b3a94a47 = Sombra de SRP com escurecimento de bordo solar (opcional)

# text
seg-eaaec545dd68 = Fração iluminada da SRP como a fração não ocultada do fluxo solar com escurecimento de bordo (lei de aproximação de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadratura de Gauss-Legendre) sobre uma Terra esférica ou WGS-84 (srp_shadow::limb_darkened_shadow, a variante ShadowModel OblateEarthLimbDarkened)

# text
seg-9e15970435c3 = Sol e Lua DE440 no modelo de forças de Cowell (opcional)

# text
seg-de6831cf7785 = Nível opcional de efemérides para os termos de terceiro corpo e de SRP do ForceModel numérico de Cowell: o Sol e a Lua geocêntricos a partir de qualquer EphemerisProvider (um kernel SPK DE440 através de KernelEphemeris) em TDB = TT + (TDB - TT), recusando um fornecedor que não consiga servir a época e contando qualquer recurso à série analítica; desativado por predefinição

# text
seg-057c21daf4f2 = Maré atmosférica S1 (opcional)

# text
seg-f600a39f297e = A maré diurna S1 de pressão atmosférica como perturbação do geopotencial: modelo N1 de Biancale e Bode ({ "2006" }), graus { "2" } a { "6" }, através da fórmula de carga da Eq. { "6.21" } do IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional nos modelos de forças de Cowell e preciso (air_tide_s1, desativado por predefinição)

# text
seg-e8f5ff8c9149 = Gravidade de harmónicos esféricos de grau elevado (EGM2008 até { "2190" })

# text
seg-d3b2f32dcecb = Avaliação sem underflow e sem problemas nos polos de um campo totalmente normalizado até ao grau { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, coluna progressiva modificada de Holmes-Featherstone { "2002" } com o gradiente livre de 1/cos phi), um carregador ICGEM .gfc em fluxo contínuo (from_gfc_file / from_gfc_reader; o EGM2008 completo é obtido em tempo de execução, não incluído), e o avaliador de Holmes-Featherstone selecionável no Geopotential de Cowell opcional

# text
seg-1960804ef2f4 = Determinação de órbita em lote com taxa de distância e az/el com máscara de estação

# text
seg-4c185244bc66 = Recuperar um estado de época a partir de seguimento misto de distância, taxa de distância e azimute/elevação acima de uma máscara de elevação, por Gauss-Newton em H = (dh/dx(t)) Phi(t, t0): derivadas parciais analíticas das medições e uma matriz de transição de estado variacional com derivadas parciais analíticas de dois corpos + J2 (integrada por RK4, não uma STM de forma fechada)

# text
seg-bc3d1ee7c639 = Ponderação das observações por código de exatidão SP3

# text
seg-63b1fab84f85 = Mapear os códigos de exatidão SP3 (expoentes do cabeçalho ++ em { "2" }^n mm, a base %f, desvios-padrão por registo base^n mm) em sigmas de posição por observação para o motor de determinação de órbita precisa (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Associar um campo gravitacional publicado a um corpo

# text
seg-ffb2b20e5f32 = with_gravity_field (em Body, em src/gravity_pds.rs): associar qualquer campo de harmónicos esféricos carregado (por exemplo GMM-3 ou GL0660B) a um Body, para que o propagador o avalie solidário com o corpo; opcional, os corpos predefinidos não se alteram

# text
seg-9762cf428435 = Codificadores de mensagens de navegação para além do GPS LNAV (GPS CNAV, Galileo I/NAV e F/NAV)

# text
seg-9b703b9607d8 = Mensagens GPS CNAV dos tipos 10/11/30, tipos de palavra 1-5 do Galileo I/NAV em páginas pares/ímpares nominais e tipos de página 1-4 do Galileo F/NAV: empacotamento e quantização dos campos do ICD, CRC-24Q, codificação convolucional de taxa 1/2 com K={ "7" } (G2 invertido para o Galileo), entrelaçamento de blocos e padrões de sincronização, com descodificadores de teste correspondentes

# text
seg-974d8c1f7876 = Suavização da portadora do código por Hatch sobre observações RINEX reais

# text
seg-f26b5da0f52e = Filtro de Hatch sem divergência (código livre de ionosfera suportado pela portadora livre de ionosfera, janela de N épocas, reinício na perda de bloqueio, salto de geometria livre ou lacuna) na montagem de posicionamento pontual preciso

# text
seg-278ca396127a = Leitura de ficheiros de observação RINEX { "4" }

# text
seg-e0883aa933eb = Cabeçalhos de observação RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiquetas identificadas nas colunas 61-80 para a versão { "4" } e posteriores) e registos de época

# text
seg-33e5c74720ff = Posição de satélite GEO BeiDou por difusão

# text
seg-44b61449b65a = Posição de satélite geoestacionário segundo BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de efemérides de difusão (referencial quase inercial, depois Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional através do campo include_beidou_geo de NavParseOptions, pelo que o leitor predefinido continua a ignorar os GEO

# text
seg-71f48628ebb2 = GNSS/INS fortemente acoplado com fase da portadora e ambiguidades flutuantes

# text
seg-5a156aa81275 = EKF de estado de erro sobre { "15" } estados INS, um relógio do recetor de dois estados e uma ambiguidade flutuante da portadora por satélite seguido; pseudodistância, fase da portadora e taxa de distância opcional a partir de uma constelação Walker SGP4 (tempo de luz e Sagnac), correções de Klobuchar e Saastamoinen/Niell aplicadas no ciclo à posição do próprio filtro; deteção de saltos de ciclo por portadora de diferenças temporais com um limiar por satélite alargado pela incerteza da velocidade; reinicialização das ambiguidades em saltos de ciclo e na reaquisição

# text
seg-7d644516b1ec = Pacotes GNSS/INS marítimo, ferroviário e de aviação com opção de acoplamento forte

# text
seg-cbb03a8baf73 = Três cenários gnss-ins na biblioteca de trajetórias (uma embarcação a ziguezaguear a { "8" } m/s com uma interrupção de cinco minutos; um comboio através de um desfiladeiro com dois satélites e de um túnel; uma aeronave cuja interrupção abrange uma curva inclinada de 25 graus) e a tabela opcional [tight] do pacote: pseudodistâncias de uma constelação Walker SGP4 fundidas pelo navegador em ciclo fechado, todos os satélites acima da máscara em condição nominal e os poucos mais altos em condição degradada

# text
seg-f4dab73c4eda = Filtro PNT de pseudodistância acoplado com estado de enviesamento e extensão 3-D no pacote de fusão

# text
seg-742b60089361 = Um único filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio, alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que conservam a covariância cruzada); uma variante de 1 grau de liberdade aumentada com um estado de enviesamento constante do acelerómetro, que o pacote de fusão executa em [coupled]; e a versão 3-D de 8 estados com linhas de linha de visão

# text
seg-2db2b9dc3b45 = Biblioteca de trajetórias GNSS/INS e importação de verdade CSV

# text
seg-e1fe83c75a6c = Perfis de movimento selecionáveis para o pacote gnss-ins (reta, figura-8, urbano com paragens e arranques, subida de aeronave e curva coordenada, drone de levantamento), definidos por comandos de taxa de Euler e de aceleração ao longo da trajetória fechados sobre o estado de verdade com a IMU cinemática (termos centrípeto, gravítico e de Coriolis), e verdade CSV importada transformada na IMU que a reproduz; o percurso histórico inalterado quando não é dado nenhum perfil

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } do CR3BP Terra-Lua face à órbita que a CAPSTONE voou

# text
seg-d4127cf241f3 = A órbita de halo quase retilínea sul L2 { "9" }:{ "2" } do problema circular restrito que cr3bp::differential_correct_halo corrige (a família de órbitas do Gateway e da CAPSTONE), comparada pela sua geometria média (período, raio do perilúnio, raio do apolúnio) com a órbita que a CAPSTONE realmente voou. Uma medição de quão bem o membro CR3BP descreve a órbita real; uma órbita CR3BP não é uma órbita de modelo de efemérides e não é comparada época a época

# text
seg-1a5623c81b48 = Erro de posição a partir da geometria: erro RMS = sigma_UERE x DOP para a solução de mínimos quadrados do motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry e check: uma simulação de Monte Carlo com semente (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da solução iterada de mínimos quadrados do próprio motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) nas { "8" } geometrias de tests/fixtures/dop/dop_reference.csv, comparando as variâncias do erro este, norte, cima e relógio, o RMS H/V/P, a correlação este-norte, os erros médios e a fração dentro da elipse horizontal de { "95" } % com sigma^{ "2" } Q, onde Q é o fator de covariância do kernel orbit::dop (orbit::dop_cofactor, a mesma aritmética) na mesma geometria

# text
seg-9acfde1b57f7 = Classificação de confiança com consciência da geometria: geometria dos satélites junto à pontuação de confiança do recetor e uma classe em cada dedução

# text
seg-6138c41e13ff = receiver_trust::geometry: geometria de satélites por época (boa, degradada com os motivos few-satellites/high-pdop/high-hdop/sky-blocked, ou desconhecida quando o registo não fornece GSV, NAV-SAT nem GSA) derivada das elevações e dos azimutes comunicados através de orbit::dop ou tomada de GSA, com uma etiqueta sempre comunicada e nunca pontuada (good, fair, poor, unknown) e o HDOP, PDOP, VDOP, a contagem de satélites e a perda de sinal por palavras; um monitor de geometria da pontuação da embarcação que não deduz nada a menos que a geometria seja fraca (razão max(hdop/4, pdop/6, 5/n_used) acima de { "1" }), depois sobe progressivamente até um teto de { "15" } pontos em { "1.5" } que só a geometria não pode fazer descer abaixo da faixa degradada (teto, fim da rampa e piso em [geometry]; sem alarme); uma classe em cada dedução (geometry, environment, inconsistency) com a perda de bloqueio de satélites abaixo de { "15" } graus classificada como geometry, satélites à vista mas não seguidos classificados como environment, e uma dedução de geometria fraca cujo HDOP indicado está além de max({ "1.0" }, { "25" } % do HDOP derivado) do céu indicado classificada como inconsistency

# text
seg-bbb1828b3db1 = Reduções de desfiladeiro urbano, setor e terreno para uma tabela

# text
seg-2864aec7be88 = skyline: o desfiladeiro urbano em forma fechada (corte atan((h - a) / d) com d = (w/2) / abs(sin(az - s)), extremidades abertas para um comprimento finito), setores de arestas vivas no sentido horário com envolvimento, e pontos de terreno reduzidos a uma tabela com a queda de curvatura d^2/({ "2" } * 4/3 R); o skyline é o seu máximo ponto a ponto com qualquer tabela

# text
seg-3f3d657854ce = Predefinições de skyline (rua da cidade, aproximação a porto, fiorde, terminal de contentores)

# text
seg-b915c06fa3f1 = skyline::PRESETS: quatro geometrias REPRESENTATIVE com as dimensões indicadas na nota de projeto e uma linha de proveniência cada: city-street (um desfiladeiro, rua a { "0" } graus, { "20" } m entre paredes de { "30" } m, antena a { "1.5" } m), harbour-approach (setores: aberto para o mar numa extensão de { "180" } graus, edifícios do cais a { "8" } graus numa extensão de { "90" } graus, o quebra-mar a { "3" } graus), fjord (terreno: paredes { "600" } m acima da antena a { "1.5" } km de cada lado de um canal norte-sul, queda de curvatura aplicada), container-terminal (setores: pilhas a { "12" } graus sobre a metade para terra, lanças de gruas a { "35" } graus e { "25" } graus sobre dois setores estreitos); substituíveis campo a campo

# text
seg-6012113b4836 = Funções de geometria do céu: visibilidade, DOP, covariância, elipse de erro, nuvem de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> e <c2/>, funções Python e WASM com os mesmos nomes, MCP <c3/>): a partir de um local, de uma hora e de predefinições de constelações (ou de satélites como azimute/elevação ou ECEF), os satélites visíveis e mascarados sob um skyline, GDOP/PDOP/HDOP/VDOP/TDOP, o cofator de variância unitária (H^T H)^-1 e a covariância em este-norte-cima com um relógio de recetor por sistema ou um em comum, a elipse de erro horizontal (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientação { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) a partir do norte), e n erros de mínimos quadrados com semente sob erros de distância gaussianos independentes, com a sua covariância empírica, RMS e contenção de { "95" } %. O cofator é orbit::cofactor_from_los, o único kernel por trás de orbit::dop e orbit::dop_cov (dop é a redução de dop_cov): nenhuma segunda implementação de DOP

# text
seg-7f66be0f15c8 = Holdover de relógio sem GNSS

# text
seg-4d8f87668a0f = Crescimento do erro em deriva em forma fechada + holdover até ao limiar; classes de relógios quânticos

# text
seg-29b482d88916 = Cartões de dispositivo de relógio medidos (previsão sobre conjunto reservado)

# text
seg-8c68c5b25004 = clock_library: um cartão de dispositivo (ruído branco de fase, FM branco, de cintilação e de passeio aleatório, mais uma deriva linear de frequência) ajustado a um terço de um registo de relógio medido designado, após uma passagem registada de condicionamento (lacunas, valores atípicos de fase, saltos de fase, rajadas removidos; saltos de frequência registados), ponderado pelos graus de liberdade do tipo de ruído identificados por lag 1, e o seu desvio de Allan previsto pontuado sobre os dois terços reservados; leitores para ficheiros de relógio RINEX e IGS, ficheiros por laboratório do BIPM e a Secção { "1" } da Circular T; conversão de um cartão para o modelo de ruído de temporização de slots, o modelo de relógio de Kalman estendido e os níveis de ruído do monitor de spoofing

# text
seg-5097a0e6460d = Cartões de relógio medidos de GPS Block IIF com termos por revolução (previsão sobre conjunto reservado)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: um cartão de dispositivo que comporta os termos de fase de uma a quatro vezes por revolução (período T/k, T = { "43 082.05" } s), ajustados em conjunto com o quadrático por mínimos quadrados sobre um terço de um registo de relógio de satélite medido, com a contribuição de Allan em forma fechada de cada termo { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } no desvio de Allan previsto

# text
seg-0d72fcc0fbea = Estimação do estado do relógio de bordo

# text
seg-6db5391f8ebe = Relógio de Kalman de Van Loan de 3 estados (fase/frequência/deriva), estabilizado na forma de Joseph

# text
seg-3f0a9d7c2971 = Orçamento de erros da transferência de tempo

# text
seg-216f46b43860 = Bidirecional/TWSTFT (Sagnac), vista comum GNSS, PPP; jitter da ligação→distância

# text
seg-157fadeb5d67 = Modulação de sinais de navegação e análise de seguimento de código

# text
seg-ab633d191396 = PSD de BPSK-R/BOC, separação espectral κ, largura de banda de Gabor, jitter do DLL, multipercurso

# text
seg-e6c08e1e6ae3 = Desempenho de sensores inerciais quânticos

# text
seg-d28e1f6a430f = Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Ambiguidade de franja / gama dinâmica de sensores inerciais quânticos

# text
seg-deb2850546d5 = Gama dinâmica de ambiguidade de franja de Mach–Zehnder: a leitura de franja 2π-periódica define uma força específica máxima não ambígua a_max=π/(k_eff·T²), e a gama não ambígua em células de resolução a_max/σ_a=π/σ_Φ é independente do fator de escala ótico — o ganho de sensibilidade T² custa gama não ambígua em perfeito compasso (o tempo de interrogação troca resolução por gama, deixando o número de células fixado pelo ruído de fase da leitura)

# text
seg-d04bf321d4a1 = Resiliência de navegação inercial por estima quântica

# text
seg-c4989abb5d40 = Orçamento de posição composto de enviesamento + fator de escala + VRW + decaimento da estabilidade durante o holdover

# text
seg-5692c7b936b6 = Resiliência a jamming sem GNSS

# text
seg-f4ff77caa47b = Orçamento de ligação J/S geométrico, C/N₀ anti-jam, perda de bloqueio por satélite

# text
seg-ff90679d1de9 = Deteção de spoofing

# text
seg-b843f63e77e6 = FoM de segurança por época que funde χ² auxiliado por relógio, RAIM, AGC e SQM

# text
seg-b10d07921f5e = Nível de proteção temporal sob spoofing

# text
seg-2a829711b997 = Limite em forma fechada do erro temporal não detetado no pior caso = piso do monitor + σ de deriva do oscilador sobre a latência de deteção CUSUM, comunicado como uma banda de piso de ruído vermelho

# text
seg-f1d49eac89f8 = PNT alternativo / complementar

# text
seg-023dda973f66 = Correspondência com mapas de gravidade, referenciada ao terreno (TERCOM/SITAN), anomalia magnética

# text
seg-791e7285c291 = Reprodutibilidade e garantia de software

# text
seg-7177355a482c = Determinístico, com hash de cenário, SBOM + portões golden multiplataforma

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético etiquetado de degradações + conjunto de testes ROC/AUC/confusão/Pfa-Pmd agnóstico ao detetor; salvaguarda contra fugas, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro vs fora do regime). Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudo sintético controlado da diferença de otimismo da AUC entre dentro da distribuição→fora da distribuição em detetores de métodos publicados e aprendidos (regressão logística / MLP de uma camada oculta): tendências de lei de escala por classe (ρ de Spearman + declive em { "1" }−gravidade) e um preditor ridge apenas com dados ID que estima a diferença apenas a partir de diagnósticos dentro da distribuição, pontuado deixando de fora um detetor e deixando de fora uma classe. Reproduzível através de <c1/>

# text
seg-fd6424213d1f = Compromisso PNT quântico versus clássico e resiliência sem GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestão de ADEV medido (NNLS), tabela de compromissos (holdover temporal/inercial + benefício), envolvente de resiliência versus tempo; ressalva do piso transportada no artefacto. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Ambiente de meteorologia espacial e densidade termosférica dependente da atividade

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971, e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfis de difusão estáticos que reproduzem a sua Tabela { "7" }, com as variações diurna, geomagnética, semianual, sazonal-latitudinal e do hélio) face à atmosfera estática USSA76. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/space-weather.toml)

# text
seg-c76b8c395ef0 = Janela de lançamento e geometria de ascensão (análise de missões)

# text
# c1: launch-window
seg-6066c634faba = Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bónus de rotação da Terra para leste, Δv de mudança de plano em dogleg e oportunidades diárias e, dados uma época e linhas IERS finals2000A, a velocidade do local em torno do polo verdadeiro (launch::site_rotation_speed_at). Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Desaceleração de pico (independente do coeficiente balístico), velocidade + altitude no pico de g, e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/reentry.toml)

# text
seg-7b4a8e25c3c9 = Codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de ligação descendente LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei de cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que supera o seu limiar de quase ausência de erros da Tabela { "13" } da ETSI EN { "302" } 307-1 V1.4.1 mais uma margem de implementação em cada passo, o volume de dados ACM da passagem, e a linha de base de codificação constante que fecha na máscara e no alcance mais longo. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-19603a7e0fe8 = Escalonamento de contactos terrestres com vários satélites e várias estações, com resolução de conflitos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contactos candidatos a partir de cada passagem satélite-estação com o seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro do seu tempo de reposicionamento ou um satélite faria downlink para duas estações em simultâneo; um objetivo de entrega ponderado por prioridade limitado ao atraso acumulado de cada satélite; um plano ávido de valor marginal preguiçoso, uma linha de base de ordem de chegada e um ramificar-e-limitar exato sobre até { "26" } candidatos, com a lacuna de otimalidade do plano ávido comunicada. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-3742d2aea62a = Enquadramento frugal de custo por cobertura / ROI

# text
seg-4228311689f8 = Custo por ponto percentual de cobertura + ROI de cobertura por euro sobre o motor de dimensionamento de constelações; o custo por satélite é um intervalo baixo/nominal/alto fornecido por quem chama (sem preços inventados)

# text
seg-8ba6ee9acc8a = Impacto na integridade da deteção falhada (HPL/VPL com consciência do contexto vs limite de alerta)

# text
seg-f5985399d0d5 = Mapeia um enviesamento de spoofing/jamming não detetado para o erro efetivo → região de Stanford (disponível/indisponível/MI/HMI) face a HAL/VAL específicos do contexto (céu aberto vs urbano)

# text
seg-37d43b5b918a = Folha de parâmetros de modelo de erro citados de CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Desempenho de interferómetro de átomos frios com intervalos (melhor/nominal/conservador) — instabilidade de enviesamento, passeio aleatório de velocidade/ângulo, estabilidade do fator de escala, taxa de amostragem limitada pela interrogação, gama dinâmica de ambiguidade de franja — cada um rastreável a uma citação; alimenta o QuantumNavBudget sem modelar hardware

# text
seg-c93f2d3a3167 = Benchmark de aderência à norma da integridade temporal — classificador de épocas do diagrama de integridade de Stanford

# text
seg-712d5c35a6a6 = Classificação de épocas do diagrama de integridade de Stanford do TIB (nominal / indisponível / MI / HMI)

# text
seg-573aa0193cb3 = Benchmark de aderência à norma da integridade temporal — pontuador de cobertura de integridade

# text
seg-4d86f3c2d8f5 = Pontuação de cobertura de integridade do TIB (taxas de HMI/MI/disponibilidade + veredicto de cobertura de sobrelimite)

# text
seg-372dd0fdb025 = Benchmark de aderência à norma da integridade temporal — catálogo de falhas (geradores paramétricos)

# text
seg-2604e7cf27d2 = Menu de falhas do TIB (divergência de domínio, clock-slam, deriva em holdover, atraso estático/incremental/simétrico/assimétrico, repetição dentro da frescura, seletiva por caminho, quórum k-de-N)

# text
seg-90c0eb1e7c14 = Benchmark de aderência à norma da integridade temporal — veredicto de absorção do não detetável

# text
seg-f713acf042ff = Veredicto de absorção do não detetável do TIB (o simétrico/repetição tem de ser absorvido pelo PL, nunca comunicado como detetado)

# text
seg-8adbbd2cdb74 = Autodescrição do relatório híbrido ótico/RF

# text
seg-2a5e48b558e1 = O relatório hybrid-optical-rf indica a configuração de ligação com que realmente foi executado (comprimento de onda da portadora, abertura de transmissão e de receção, distância, largura de impulso, tempo de integração, eficiências e perdas, predefinições resolvidas) e inclui um bloco de unidades que dá a unidade e a classe de proveniência de cada grandeza que um artigo provavelmente citará, incluindo os traços de covariância de transferência em metros quadrados

# text
seg-0691f3dee8cb = Disponibilidade da ligação híbrida ótica/RF no lado RF

# text
seg-72ccb655caf0 = O relatório hybrid-optical-rf indica uma disponibilidade de ligação RF, composta a partir de grandezas que o motor já calcula e não de uma climatologia importada, e indica a composição como uma regra nomeada: A_rf = I_closure * I_track, onde I_closure é o veredicto de fecho do orçamento de ligação unidirecional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margem de Eb/N0 >= { "0" }) à distância do próprio cenário e I_track é o veredicto do ciclo de seguimento (jamming::lock_status) sobre o C/N0 que esse MESMO orçamento devolveu. Cada fator transporta a classe de proveniência da sua entrada até à saída, e os fatores deliberadamente NÃO incluídos no produto -- visibilidade geométrica, negação por interferência e uma climatologia de interrupções de RF -- são nomeados com o motivo, em vez de silenciosamente postos a { "1" }. O ramo RF resolvido é repetido como o seu próprio bloco rf_link_configuration, e as figuras contínuas junto ao indicador (margem da ligação, margem de C/N0, as distâncias de fecho e de seguimento em forma fechada, e a utilização da distância) são as inversões em distância do mesmo orçamento. O relatório declara por extenso, no bloco e na entrada de unidades em que o leitor cai, que esta figura é LIMITADA POR MARGEM/GEOMETRIA e DETERMINÍSTICA, ao passo que a disponibilidade ótica é LIMITADA POR METEOROLOGIA/CLIMATOLOGIA e probabilística, pelo que os dois nunca podem ser citados como um par comparável de percentagens

# text
seg-22c5df9b6c7c = Comparação de medição de distância ótica versus RF em condições equivalentes

# text
seg-70eb396f40af = O relatório hybrid-optical-rf emite a razão de medição de distância ótica versus RF com a UMA configuração a que ambos os ramos foram avaliados transportada no mesmo objeto: o mesmo percurso unidirecional, a mesma distância e o mesmo tempo de acumulação. O ramo ótico é o CRLB de ToA limitado por fotões do motor sobre a contagem unidirecional de fotões; o ramo RF é o jitter térmico de seguimento de código early-late do DLL do motor ao C/N0 que o próprio orçamento de ligação do motor devolve para essa mesma distância unidirecional. A largura de banda de ruído do ciclo é derivada, não escolhida: B_L = 1/({ "2" }*integration_s) põe o ramo RF exatamente no tempo de acumulação ótico, e se quem chama a substituir de modo que os dois tempos de média divirjam, a razão é REFUSED -- nula, com a divergência e ambos os tempos nomeados -- em vez de citada em dois pontos de operação. Não se forma nenhuma razão face ao rf_position_sigma_m paramétrico ESCOLHIDO do cenário, e a recusa diz porquê: essa entrada não transporta nenhuma configuração. O valor de referência divulgado de duas vias ótico e o fator exato que o liga ao ramo de comparação unidirecional são emitidos junto à razão, pelo que o relatório não pode ser lido como contendo dois sigmas óticos em desacordo

# text
seg-3f26f598e013 = Autodescrição do relatório de orçamento de ligação

# text
seg-b88bf41d6d4c = O relatório de orçamento de ligação indica todas as constantes absolutas a partir das quais a sua própria margem foi calculada -- a frequência da portadora que a perda em espaço livre usou, a EIRP, a figura de mérito, a perda agregada e o termo de Boltzmann -- mais o G/T requerido a que a margem é nula, a constante de ligação (EIRP - perdas - Eb/N0 requerido) que é a única combinação que uma tabela publicada de taxa/ganho pode alguma vez fixar e, quando quem chama indica uma temperatura de ruído do sistema, o ganho da antena de receção que essa figura de mérito implica

# text
seg-a7b192e27cb5 = Tabela de cruzamento de tempo lunar por classe de relógio

# text
seg-cab605dc6ea2 = Uma execução de orçamento de tempo lunar emite uma linha de cruzamento relógio-vs-referencial por classe de relógio face a um único termo de referencial partilhado, de modo que o relógio é a única variável na comparação; cada linha comporta o cruzamento obtido de duas maneiras -- por bisseção da curva geral de erro temporal em lei de potência e por inversão algébrica a partir do tipo de ruído dominante da linha -- com a diferença relativa entre elas

# text
seg-18c72a7565d6 = Pegada de captura face à altitude e à largura de feixe

# text
seg-9c30a0ab5233 = Varredura de dois eixos da pegada de captura à superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de operação com a largura de feixe a meia potência que cada diâmetro implica, e a captura do limbo comunicada como um LIMIAR -- por linha o J/S do limbo, a sua margem e a potência de transmissão que o fecharia; por grelha os cruzamentos localizados, ou uma declaração explícita de que o limbo não é alcançado em nenhum ponto da grelha, com o défice

# text
seg-fc0a64b9a280 = Reprodutibilidade do orçamento de erro de tempo lunar

# text
seg-5d5970506b9c = O cenário lunar-time-budget publica as suas saídas de valor matricial como uma tabela de forma longa (índice de grelha, tempo de média, termo) a par do relatório, de modo que as sete curvas x(tau) por termo e o total de raiz da soma dos quadrados são saída do motor e não algo que um leitor reconstrói a partir da secção de método

# text
seg-675887733454 = Laboratório de tempo de estação lunar: holdover do miniRAFS face ao LTC

# text
seg-7dfedc40da6a = O bloco opcional [time_lab] do cenário lunar-time-budget modela um relógio de estação de referência lunar (por predefinição a classe miniRAFS, ou qualquer classe nomeada, ou um cartão de dispositivo ajustado a pontos de estabilidade indicados) guiado para o Tempo Lunar Coordenado e depois em funcionamento livre ou novamente guiado a cada N segundos: a curva de erro temporal x(t) como a raiz da soma dos quadrados do termo de lei de potência do relógio, um resíduo de guiamento constante (ILLUSTRATIVE), um resíduo constante de realização do LTC e um termo opcional de taxa de altura da estação; o tempo após um guiamento até { "1" }, { "10" } e { "100" } ns (ou limiares indicados) por bisseção junto à inversa em forma fechada para o tipo de ruído dominante, e o termo dominante em cada horizonte indicado, tudo com unidades

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Atraso VLBI de campo próximo para uma linha de base terrestre que observa um farol lunar + derivadas parciais

# text
seg-e08e98908f3a = GNSS terrestre à distância lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Receção de GNSS terrestre à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época calcula o ângulo fora do eixo face ao nadir do transmissor, se a Terra oculta o trajeto retilíneo, a distância oblíqua e a sua perda em espaço livre, o ganho de transmissão a esse ângulo, a potência recebida e a densidade portadora-ruído; depois agrega apenas as ligações que superam um limiar de seguimento, e varre uma revolução completa da constelação para que a resposta seja uma DISTRIBUIÇÃO e não um único instantâneo. Três factos determinam o resultado e o relatório declara cada um: a Terra subtende { "13.90" } graus a partir do raio da constelação, pelo que o PICO do feixe é geometricamente inacessível a qualquer raio dirigido à Lua; o que resta é a borda do lóbulo principal e os lóbulos laterais, o regime em que a LuGRE operou na Lua em { "2025" }; e a perda de percurso em L1 é de cerca de { "208" } dB, uns { "25" } dB mais do que paga um utilizador terrestre. MEASURED sobre a geometria incluída de classe GPS com 24 satélites ao longo de { "64" } épocas de um período orbital: disponibilidade de SINAL de { "0.375" } com a melhor ligação a { "30.93" } dB-Hz, e disponibilidade de SOLUÇÃO DE POSIÇÃO de { "0.000" } - no máximo duas ligações seguíveis em simultâneo, nunca as quatro de que uma posição precisa. A separação dessas duas disponibilidades é o essencial, e o relatório recusa deixar que se confundam: o GNSS terrestre à distância lunar é uma camada de grau de TEMPORIZAÇÃO, não de grau de posição, e um a priori de resiliência em camadas tem de tomar a disponibilidade de solução de posição. O condicionamento é emitido pela mesma razão - todos os satélites visíveis ficam dentro de um cone com poucos graus de largura visto da Lua, pelo que as linhas de visão são quase paralelas por construção. Executável como o tipo de cenário <c1/>. Reafirmado segundo D7: a afirmação à distância lunar é a densidade portadora-ruído RELATIVA entre satélites numa época, a partir de diagramas de transmissão bidimensionais medidos (NAVCEN Block IIR/IIR-M), mais visibilidade geométrica; o C/N0 absoluto não é afirmado (Parker et al. comunicam uma perda comum de { "7" } a { "12" } dB).

# text
seg-29df5b40a3f9 = Determinação de órbita lunar: GNSS terrestre face a radiométrico terrestre

# text
seg-647902ebcee3 = Determinação de órbita numa órbita de halo quase retilínea (ou numa órbita elítica congelada) a partir de dois tipos de dados independentes: pseudodistâncias de GNSS terrestre recebidas a bordo (a regra de ligação da linha GNSS terrestre à distância lunar, mais ocultação pela Lua) e distância e taxa de distância bidirecionais a partir do solo, de três estações da Deep Space Network. Cada uma é um ajuste em lote de mínimos quadrados de um passo em torno da órbita de referência com a sua covariância formal; uma simulação de Monte Carlo com semente da diferença entre as duas estimativas testa se as duas covariâncias a explicam (q = d' (P_G + P_R)^-1 d, qui-quadrado com seis graus de liberdade quando os modelos coincidem) e o que uma aceleração não modelada faz à estatística.

# text
seg-652bdc29deea = Resolução de ambiguidades da fase da portadora lunar: superfície e orbitador

# text
seg-02496f9e9af2 = Fase da portadora e código de GNSS terrestre em diferença simples entre recetores numa estação à superfície lunar e num orbitador, com a diferença de relógio por época eliminada por perfilagem, uma ambiguidade por passagem contínua e a passagem mais longa como gauge. A covariância das ambiguidades flutuantes é um complemento de Schur; o LAMBDA resolve os inteiros, a taxa de bootstrap é comunicada junto a uma taxa de sucesso de mínimos quadrados inteiros por Monte Carlo com semente e aos sigmas de posição flutuantes e fixados. Comunicado como encontrado: aos { "12" } dBi registados o problema de diferença dupla não é formável (a alteração { "1" } passou a predefinição para { "25" } dBi depois de apenas as contagens de disponibilidade terem sido vistas), e a { "25" } dBi a fixação de inteiros NÃO é atingida - está fora de alcance (alguns por cento no máximo), embora a solução flutuante melhore com o arco.

# text
seg-11dd1bb8e4e1 = Coestimação do referencial lunar: estações de superfície e orbitadores

# text
seg-a38c8d95e6c9 = Informação de Fisher do datum de sete parâmetros do referencial lunar a partir de telemetria laser de estações terrestres para os cinco refletores isoladamente e com distâncias orbitador-estação de superfície acrescentadas: a matriz de informação, o posto, os sigmas de Cramer-Rao, a métrica de degenerescência do módulo de identificabilidade lunar e conjuntos aleatórios de estações com semente. A órbita é mantida conhecida nos eixos lunares (o seu erro é transportado pelo sigma de distância do orbitador).

# text
seg-862977c4bb01 = Precisão da ligação espacial entre referenciais: GNSS, VLBI e telemetria laser co-localizados

# text
seg-a9ae8e99f00d = Precisão de Cramer-Rao dos desvios de translação, escala e rotação entre técnicas dos referenciais de GNSS, VLBI e telemetria laser quando uma só nave transporta as três, com a posição da nave eliminada em cada época e nove parâmetros incómodos de ligação local com um a priori, varridos sobre a exatidão da ligação local. Covariâncias pela via da raiz quadrada (as equações normais perdem os dígitos quando as técnicas são quase perfeitas).

# text
seg-ae627996875e = Sensibilidade lunar a números de Love e a libração

# text
seg-28780d07c4a7 = Informação de Fisher de h2, k2, l2 e das amplitudes físicas de libração a partir de telemetria laser (deslocamento de maré radial e horizontal, rotação dos refletores), seguimento de orbitadores (a aceleração k2 de grau 2 integrada ao longo da linha de visão, tendência removida), um gravímetro de superfície (fator gravimétrico { "1" } + h2 - { "1.5" } k2) e um relógio de superfície (taxa fracionária ({ "1" } + k2 - h2) W2/c2, ligada às constantes de tempo lunar). Os valores nominais de h2 e l2 são pontos de linearização; o estudo diz o que é sensível a quê, não quais são os números.

# text
seg-da712b740519 = Aumento do DOP por faróis à superfície lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Diluição da precisão aumentada por faróis para um utilizador à superfície lunar: as linhas de linha de visão dos satélites visíveis e as linhas de medição de distância dos faróis de superfície visíveis são concatenadas numa só matriz de projeto e avaliadas através do kernel DOP partilhado, e o DOP resultante é mapeado para uma exatidão realizada de 1 sigma EM METROS através de um erro equivalente de distância do utilizador por farol, composto como a raiz da soma dos quadrados dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade dos faróis é o horizonte geométrico de duas alturas da Lua sem atmosfera, que não tem extensão refrativa e é por isso exato e não aproximado. Executável como o tipo de cenário <c1/>, que comunica satélites isoladamente, satélites mais faróis, e uma constelação maior como a via concorrente para a mesma geometria. MEASURED sobre a geometria golden incluída (utilizador a -80 graus, três faróis levantados, LCNS ilustrativo de seis satélites em t={ "0" }, máscara de { "5" } graus): { "5" } satélites visíveis dão PDOP { "9.6941" } e um 1 sigma 3-D de { "11.222" } m; acrescentar os faróis que realmente superam o horizonte dá PDOP { "4.1160" } e { "4.765" } m, um fator de { "2.355" }; o serviço de 24 satélites dá em vez disso PDOP { "2.4226" } e { "2.804" } m, um fator de { "4.002" }. O relatório imprime a contagem de faróis VISÍVEIS e não a configurada, e nesta geometria apenas UM dos três faróis supera o horizonte: os dois locais laterais ficam a cerca de { "333" } km do utilizador contra um horizonte de { "86" } km para uma antena de { "2" } m, pelo que o leitor nunca é deixado a supor que os três contribuíram

# text
seg-845e9f5eec81 = Nível de proteção de modo comum e envolvente total de integridade

# text
seg-e4ec41d0f5e1 = Observabilidade absoluta de estações lunares (defeito de datum)

# text
seg-b3e4160042d2 = Observabilidade, pela informação de Fisher, da solução lunar conjunta: sem linhas de base com a Terra, o datum do referencial absoluto fica no espaço nulo de HᵀWH (a posição da estação é inobservável); ≥{ "3" } linhas de base restabelecem a característica completa e limitam o erro de Cramér–Rao da estação, que o estimador atinge

# text
seg-2ed7181c97dd = Geração dos códigos de espalhamento do LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Os códigos do Augmented Forward Signal do LSIS V1.0 ({ "29" } de janeiro de { "2025" }): o primário de 10230 chips do AFS-Q, gerado a partir da construção do piloto L1C do IS-GPS-800 com os índices do IS-GPS-800J (as mesmas { "210" } atribuições que o Apêndice D do LSIS imprime), os códigos Gold de 2046 chips do AFS-I, gerados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } e g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, com o atraso de G2 de cada PRN recuperado do ficheiro do Anexo { "3" } da norma, os quatro códigos secundários, os códigos terciários de 1500 chips, a atribuição provisória de nós da Tabela { "11" } e o código piloto em camadas. O conteúdo do LSIS é lido em tempo de execução a partir de uma cache local verificada por SHA-256, preenchida a partir do PDF alojado pela NASA, nunca redistribuído

# text
seg-56c7aeac59c1 = Descodificabilidade em malha fechada do LunaNet AFS por um recetor independente (LSIS V1.0)

# text
seg-da2d29d437b0 = Uma gravação AFS do Kshana adquirida, seguida e descodificada por um recetor de software independente e comparada com os rótulos de verdade da própria gravação. Isto prova apenas a aderência à norma e a consistência dos rótulos; não é uma afirmação sobre a física do canal, a propagação, a potência recebida ou os balanços de ligação, cujos valores na gravação são entradas escolhidas

# text
seg-780369fb9a54 = Aderência à norma entre geradores GPS L1 C/A

# text
seg-ee47b60515f1 = Códigos de espalhamento GPS L1 C/A (sdr::CaCode) e subtramas 1-3 de LNAV (gps_lnav: quantização de campos do IS-GPS-200 com o pi da especificação, empacotamento em complemento para dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução da paridade das palavras { "2" } e { "10" }) comparados bit a bit com o gps-sdr-sim sobre o seu brdc0010.22n incluído ({ "32" } satélites)

# text
seg-bf429c8f00fb = Aquisição IQ GNSS sobre amostras I/Q geradas de forma independente

# text
seg-9a0c52bfb06e = iq::acq::acquire (pesquisa paralela de fase de código por FFT com o limiar Marcum-Q de lei quadrática) com a réplica GpsL1Ca, em { "20" } ms da própria saída I/Q de 8 bits do gps-sdr-sim, descodificada pelo descodificador de amostras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sem ruído): todos os PRN de { "1" } a { "32" } pesquisados em duas janelas de { "10" } ms, comparando o resultado com a fase de código e o Doppler que o gps-sdr-sim modulou

# text
seg-f40dc3dac990 = Monitores IQ avaliados em campanhas de reprodução em laboratório: deteção, falhas, falsos alarmes e valores de falso alarme em forma fechada

# text
seg-93fb3109728c = iq::campaign::detect e o executor de campanhas: uma tabela opcional [monitors] executa os monitores IQ em todas as células na passagem única do executor. Os monitores de potência e espetrais veem as amostras depois de cada cadeia de front-end; os monitores de C/N0, SQM e bloqueio veem as atualizações de malha de cada canal seguido. Cada alarme é avaliado face aos eventos indicados: detetado ou não detetado por (evento, tipo de alarme, canal), tempo até à deteção, e falsos alarmes fora dos eventos sobre a respetiva exposição. É indicado o valor de falso alarme em forma fechada de cada teste: potência por bloco (cauda Gama exata), excesso espetral por bloco (aproximação), curtose (gaussiana unilateral), impulsos (limite binomial), SQM por atualização média (2Q(k) = Q(1/2, k^2/2), novo) e o ARL0 do CUSUM de C/N0 (Siegmund). Sem a tabela, as células, as chaves e os resumos criptográficos permanecem inalterados. Nenhuma forma de onda de interferência é sintetizada

# text
seg-5b7eb7ddb474 = ROC de deteção dos monitores IQ a partir de uma campanha de reprodução em laboratório avaliada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada célula de uma campanha com monitores guarda, por tipo de alarme e canal, o máximo da estatística de teste do próprio monitor sobre cada janela de evento indicada (positivo) e sobre janelas roc_window_s em mosaico fora dos eventos (negativo). As estatísticas são o desvio de potência por bloco, o excesso de PSD, o z da curtose, o |z| do SQM da métrica média e o CUSUM de C/N0. O relatório agrega-as por tipo numa ROC empírica ao nível da janela, com a sua AUC e o ponto de funcionamento ao limiar configurado, escrita como roc.json (kshana.campaign-roc/1) e uma secção Detection ROC de report.html. Uma campanha sem monitores não escreve nenhum dos dois

# text
seg-3a3cfa322f01 = Calibração dos modelos de C/N0 e de bloqueio do recetor aberto a resultados de campanhas IQ, com erro de previsão indicado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) e <c1/> em <c2/>, o <c3/> do Python e a ferramenta labfit do MCP (apenas pastas de campanha dentro do seu diretório de trabalho): lê uma pasta de saída de <c4/> pelo seu DIGEST e agrupa as células avaliadas em unidades de ajuste (sinal x conceção da malha x cadeia de front-end x tipo de interferidor, nunca agregadas). Por unidade, ajusta o C/N0 medido ao J/S indicado com a forma de separação espetral. O Q_eff não é identificável a partir de dados de C/N0 sem uma medição independente das potências do interferidor e do sinal, pelo que o Q é indicado, nunca ajustado (a tabela de tipos, o q do evento ou, para um tipo desconhecido, o valor indicado mais danoso, cw Q = { "1" }). O parâmetro ajustado é o desvio identificável delta_eff = delta - { "10" } log10 Q, com a salvaguarda de correlação a comunicar a degenerescência. Os intervalos de C/N0 com bloqueio abaixo de { "90" } % são censurados e listados. O J/S limiar é dado diretamente e pela forma fechada; os modelos de malha de seguimento e de bloqueio empírico são acoplados através do modelo de C/N0, com tempos de permanência de queda e de rebloqueio. Um bootstrap de agrupamentos com semente sobre as gravações ({ "1000" } réplicas) fornece intervalos por percentis; os intervalos de previsão de { "90" } % provêm de sorteios de resíduos; as retenções leave-one-recording-out são divididas em interpolação e extrapolação; uma tabela [validation] pré-registada recebe um hash e cada limiar é avaliado como PASS/FAIL. Relatório kshana.labfit-iq/1 em JSON, CSV e Markdown gerado, com um bloco de unidades. Apenas sintético (nenhuma gravação de terceiros, nenhuma forma de onda de interferidor). O percurso de labfit por registo do recetor permanece inalterado

# text
seg-9537d301c95e = Codificação GPS LNAV descodificada por uma biblioteca de recetor independente

# text
seg-909415621881 = As subtramas 1-3 de LNAV do Kshana (gps_lnav::encode_subframes) para as { "32" } efemérides brdc0010.22n fornecidas ao decode_word e ao decode_frame do RTKLIB: paridade de cada palavra, descodificação de subtramas com emissão de dados consistente, e cada parâmetro descodificado face ao inteiro do Kshana e face ao valor de entrada

# text
seg-f66855e35c53 = Codificação da mensagem de navegação GPS LNAV

# text
seg-8caf8366e2f8 = Subtramas 1-3 de LNAV do IS-GPS-200 (gps_lnav::encode_subframes: quantização por arredondamento ao mais próximo de cada parâmetro de relógio e de órbita aos fatores de escala e ao valor de pi da especificação, empacotamento em complemento para dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução da paridade das palavras { "2" } e { "10" }), a mensagem que um gerador de sinal GPS L1 C/A transmite

# text
seg-c5c944357643 = Aquisição e estimação de C/N0 em IQ lunar real

# text
seg-f5dcb5e06bf4 = Pesquisa paralela de fase de código (acquisition::pcps_acquire: FFT portátil, dobragem coerente, acumulação não coerente, limiar de qui-quadrado para uma probabilidade de falso alarme em toda a pesquisa), refinamento, correlação imediata em malha aberta com Doppler de código e o estimador de C/N0 M2M4, executados nos lotes IQ de 4 bits L1 do LuGRE lidos através de realdata::ion_sdr

# text
seg-709626569a5c = Aquisição em IQ lunar real face ao Doppler previsto pela órbita (decisão por potência da amostra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire com a sua decisão por potência da amostra nos nove lotes L1 não superficiais do LuGRE com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com as diferenças previstas a partir das órbitas finais da ESA e da trajetória Blue Ghost reconstruída pela Firefly

# text
seg-89875d67b253 = Aquisição em IQ lunar real avaliada pelo Doppler previsto pela órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire com a decisão por média de células (pico sobre a célula média da grelha, robusta ao ruído de banda limitada) nos nove lotes L1 não superficiais do LuGRE com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com as diferenças previstas a partir das órbitas finais da ESA e da trajetória Blue Ghost reconstruída pela Firefly

# text
seg-8fa779dd1788 = Aquisição em IQ lunar real reservado face ao Doppler previsto pela órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisão por média de células, probabilidade de falso alarme { "1e-7" }) com refine_doppler_coherent nos lotes L1 do LuGRE gravados na superfície lunar (I no nibble alto, níveis mid-rise); diferenças de Doppler entre satélites adquiridos face às diferenças previstas a partir das órbitas finais da ESA e do núcleo do local de alunagem da Firefly

# text
seg-10af60b488b9 = Estação de referência diferencial de classe NovaMoon: cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS

# text
seg-c04a3591074c = Exportação de interoperabilidade lunar

# text
seg-91f4a066b3c0 = Exportação lunar de referencial + tempo + efemérides alinhada com LunaNet/IOAG (CCSDS OEM + KIF) com aderência à norma na ida e volta

# text
seg-8ab65cbefb75 = Pontuação alinhada com enquadramentos de resiliência PNT

# text
seg-c48198f31d63 = Subpontuações por dimensão sobre as sete categorias de resiliência próprias do Kshana (não termos do DHS), as funções RDRR do RethinkPNT e os critérios de Yang, cada uma marcada como modelada com o seu fator determinante; Nível RPCF provisório com uma barreira de degradação limitada. Autoavaliação derivada de simulação, nunca uma certificação.

# text
seg-d7bdb6fe186e = Estudo de instabilidade de decisão da pontuação de resiliência

# text
seg-5fcf18a68bb1 = Quantifica como uma única pontuação compósita / Nível RPCF reordena arquiteturas sob um simplex de ponderação defensável e um conjunto de ameaças (taxa de inversão do top-1, dispersão do tau de Kendall, taxa de inversão de Nível, intervalos de classificação); análises de declarado versus medido e de colapso de diversidade.

# text
seg-1bf03544a010 = Representatividade da demonstração e lacunas até ao voo

# text
seg-db24d16d38c9 = Registo de honestidade por resultado que qualifica uma saída de demonstração: as suas âncoras externas, os pressupostos modelados, as lacunas até ao voo e a faixa de TRL representativa, com invariantes impostos (validada exige uma âncora externa; modelada exige uma lacuna e não pode reivindicar acima de TRL { "4" }).

# text
seg-52ab936eb5f5 = Evidência de compromisso quântico versus clássico (forma comum)

# text
seg-a6679ed5bed7 = Um objeto TradeEvidence reprodutível (referencial fixo: cenário+semente+motor; valores comuns de quântico versus clássico por FoM com benefício de polaridade correta, IC de { "95" }% opcional, rótulo validado/modelado) que transporta um registo de representatividade, de modo que cada vertical de PNT quântico comunica o compromisso da mesma forma honesta.

# text
seg-20fee61b3107 = Biblioteca de modelos de erro de dispositivos quânticos

# text
seg-e42eabe9bc2a = Fichas de dispositivo (ótico/iões aprisionados/iões de mercúrio + relógios clássicos reutilizados de holdover/clock_state; interferómetro de átomos frios; ligações de transferência de tempo clássicas + de emaranhamento/fotão único), cada uma com um registo de representatividade; a ligação de emaranhamento acrescenta um modelo de precisão de temporização limitado por ruído de disparo (~jitter/sqrt(R*tau), penalização de contagens no escuro, piso sistemático).

# text
seg-86d71fd89f26 = Temporização quântica de confiança (transferência de tempo + disseminação segura + anomalia)

# text
seg-d2a3d37825ef = Cadeia de transferência de tempo quântica versus clássica de ponta a ponta (deriva do relógio + precisão da ligação em quadratura), um nível de proteção de temporização reutilizado, uma FoM de segurança contra ataques de atraso/repetição (1-P_md) e uma probabilidade de deteção de anomalias do relógio + latência do CUSUM, emitidas como TradeEvidence honesta com um registo de representatividade.

# text
seg-eaf341ff4522 = Navegação quântica sem GNSS

# text
seg-908a44a9f7c7 = Navegação por estima com INS de grau de navegação quântico (interferómetro de átomos frios) versus clássico durante uma interrupção do GNSS: crescimento do erro de posição, holdover até um limiar de posição e o compromisso quântico versus clássico como TradeEvidence honesta; nota honesta de observabilidade (o viés é inobservável sem uma solução de posição, pelo que o erro cresce).

# text
seg-914132833f5a = Deteção de falhas/anomalias para sistemas PNT quânticos

# text
seg-f20392820b9d = Catálogo rotulado de falhas quânticas (salto de frequência/deriva/perda de bloqueio do relógio; salto de viés/perda de sinal do sensor), uma AUC da ROC da estatística de deteção com IC por bootstrap e uma falha mínima detetável a uma taxa de falso alarme fixa; um monitor assistido por relógio quântico deteta falhas mais pequenas do que um clássico, emitido como TradeEvidence honesta.

# text
seg-d31be81dfd8f = Geolocalização passiva de emissores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localizar um emissor (interferidor/spoofer, ou uma fonte oportunista para PNT inverso) a partir da diferença de tempo de chegada numa rede de recetores — a interseção de hiperboloides τᵢ=(Rᵢ−R₀)/c resolvida por mínimos quadrados de Gauss–Newton — e, acrescentando a diferença de frequência de chegada (diferenças de taxa de distância) com recetores em movimento, recuperar em conjunto a posição e a velocidade; com o limite inferior de Cramér–Rao da covariância da posição a partir da geometria das medições

# text
seg-5bd3882531b6 = Aquecimento convectivo de entrada no ponto de estagnação (Sutton-Graves) numa entrada 3-DoF

# text
seg-4f97036ed72f = Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), o seu pico e a carga térmica integrada ao longo de uma entrada 3-DoF, balística ou com sustentação a inclinação constante, na Terra ou em Marte.

# text
seg-1b96577665fc = Radiometria de geradores de imagem eletro-óticos, MTF, resposta relativa de aresta e NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Orçamento de relação sinal-ruído de um gerador de imagem em nadir (radiância de cena lambertiana, equação da câmara, ruído de disparo, de escuro, de leitura e de quantização), a MTF do sistema à frequência de Nyquist como o produto da difração de abertura sem obstrução, abertura do detetor, esbatimento linear e tremor gaussiano, a resposta de aresta e a resposta relativa de aresta integradas a partir dessa MTF, Q = lambda F / p, e o NIIRS GIQE versão { "4" } sem compensação de MTF. Executável como o tipo de cenário <c1/>.

# text
seg-07ca77a67207 = Perdas de gravidade, arrasto, orientação e contrapressão na ascensão de lançamento

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascensão plana por viragem gravitacional de um veículo multiestágio sobre uma Terra esférica sem rotação através da Atmosfera Padrão dos EUA { "1976" } (densidade e pressão), com um impulso de arfagem, tração reduzida pela contrapressão da tubeira, fins de combustão de estágio em fronteiras de passo exatas, e as perdas de gravidade, arrasto, orientação e contrapressão integradas a par do estado. Executável como o tipo de cenário <c1/>.

# text
seg-55e8345def8b = Equação bidirecional do TWSTFT, orçamento de incerteza e estabilidade da ligação com não reciprocidade de flicker e diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = A equação bidirecional do TWSTFT resolvida para T_A - T_B com atrasos de transmissão e receção da estação, a assimetria ionosférica ascendente/descendente em banda Ku, a diferença de atraso do transponder e os termos de Sagnac, face ao seu modelo direto exato; um orçamento de incerteza em quadratura com o TDEV da ligação como termo do tipo A; uma série bidirecional com ruído de fase branco e de flicker (Kasdin-Walter), uma não reciprocidade diurna e um resíduo constante de reciprocidade; e a taxa, o RMS residual, o TDEV e o ADEV de séries fornecidas de relógio de estação Circular T, MJD-CSV ou IGS RINEX. Executável como o tipo de cenário <c1/>.

# text
seg-2f9be02c92bc = Numérica de atmosfera ótica em percurso oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade ótica de nuvens e de céu limpo

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrado ao longo de um percurso oblíquo para a variância de Rytov de onda plana e esférica (ligação ascendente e descendente), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, o fator de média de abertura em turbulência fraca, a profundidade ótica de nuvem de uma coluna de água líquida e a profundidade ótica de céu limpo de Kim-visibilidade mais Rayleigh, a substituir a perda atmosférica agregada do orçamento de ligação ótica quando é fornecida uma atmosfera. Executável dentro do tipo de cenário <c1/>.

# text
seg-a2faab92e760 = Disponibilidade de locais óticos de solo condicionada pelo tempo e diversidade de locais correlacionada com a distância

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilidade de uma ligação ótica face a uma margem de ligação indicada a partir de um clima log-normal de água líquida de nuvens (quantidade ITU-R P.840, extinção por ótica geométrica) e do desvanecimento por turbulência gama-gama independente, a margem de ligação necessária para disponibilidades-alvo e o teto que nenhuma margem eleva, durações de interrupção log-normais, cenários hipotéticos de técnicas de melhoria, e uma disponibilidade de rede por cópula gaussiana de um fator cuja correlação entre pares é exp(-distância/comprimento de decorrelação). Executável como o tipo de cenário <c1/>.

# text
seg-043ece801e72 = Continuidade de temporização e de alcance através de interrupções óticas

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = A distribuição das durações de interrupção de um local ótico acoplada à variância de deriva em forma fechada do modelo de holdover do relógio: erro de temporização e de alcance em quantis de interrupção indicados, o holdover até um limiar de temporização, a fração de interrupções e de tempo de interrupção dentro dele e a disponibilidade de temporização A + U E[min(D, T_h)]/E[D], para as classes de relógio clássica e quântica. Executável dentro do tipo de cenário <c1/>.

# text
seg-b119df65d2a7 = Margem da ligação ótica ao longo do tempo: uma realização com semente do tempo atmosférico de um local

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Uma tabela opcional <c1/> (duração, passo, semente) faz com que o tipo <c2/> escreva também, por local, uma realização com semente do modelo de local indicado ao longo do tempo: episódios de nuvens (períodos limpos exponenciais, interrupções por nuvens log-normais com a média e a dispersão indicadas, a parcela de tempo em nuvem definida pela probabilidade de nuvem indicada), uma coluna de água líquida log-normal por episódio de nuvem, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem da ligação, os desvanecimentos por nuvens e por cintilação e o indicador de ligação ativa, com a disponibilidade realizada, a fração de nuvens, o número de interrupções e a interrupção mais longa. Sem a tabela, o resultado é o documento { "0.37" }. Os sorteios passam por rotas portáteis de distribuições e de matemática, pelo que native e wasm32 dão os mesmos bytes.

# text
seg-58cbf576c959 = Leitor de Orbit Data File TRK-2-18 e modelo de Doppler 2-way com rampas em Marte

# text
seg-d1055650a77f = Um leitor de Orbit Data Files (TRK-2-18) da DSN: os grupos de registos de 36 bytes (rótulo de ficheiro, identificador, dados de órbita, rampas por estação, desvios de relógio, resumo, fim de ficheiro) e, em cada registo de dados de órbita, a marca temporal desde { "1950" }, atrasos de ligação descendente e ascendente, observável, estações, tipo de dados, bandas, validade, canal, veículo espacial, a frequência de referência de 46 bits e o tempo de compressão; tempos de início e de fim de rampa, taxas e frequências iniciais. Sobre ele, um modelo de Doppler 2-way em banda X com rampas (rampas de ligação ascendente integradas, tempo de luz de ida e volta com Shapiro e troposfera, estações da DSN através da cadeia CIO IAU 2006/2000A e EOP do IERS, tempo de estação) e uma determinação de órbita em lote de orbitadores de Marte (campo GMM-3, terceiros corpos, SRP, arrasto).

# text
seg-455dc946c965 = Estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um seguidor de estrelas

# text
# c1: aocs
seg-553d043438b4 = O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a velocidade angular do giroscópio menos a estimativa de viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de velocidade), atualizações do seguidor de estrelas com o resíduo { "2" } vec(q^-1 q_st) na forma de Joseph e a reposição multiplicativa; um simulador discreto de Farrenkopf de giroscópio e seguidor de estrelas. O tipo <c1/> pode fechar a malha de controlo sobre a sua estimativa.

# text
seg-a971ff07592a = Ciclo de trabalho de abertura entre navegação e comunicações

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Uma execução recebe um plano de contactos (uma lista de janelas aos_s/los_s, cada uma a pedir a abertura para navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), um número de aberturas e uma política de arbitragem explícita, e devolve o ciclo de navegação, o ciclo de comunicações, o ciclo ocioso e a interrupção por sessão. A política é uma entrada com uma predefinição documentada (<c3/>; também <c4/> e <c5/> não preemptivo), e o relatório transporta a política resolvida, a sua definição completa e as definições de ciclo e de interrupção, porque um valor de ciclo citado sem a sua regra de arbitragem não é reprodutível. O escalonamento é uma varredura exata de intervalos sobre as fronteiras das janelas, pelo que uma janela que termina exatamente onde a seguinte começa nunca disputa, e os segundos de abertura de navegação, de comunicações e ociosos são acumulados de forma independente nessa única varredura. Executável como o tipo de cenário <c6/>

# text
seg-43cd7aa7ab53 = Interferência de RF na navegação à superfície lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Relação interferidor-sinal nativa lunar, C/N₀ efetivo e perda de bloqueio para um utilizador selenográfico à superfície sob um interferidor à superfície lunar (ou elevado), sobre a constelação ilustrativa de classe Moonlight/LCNS de fontes públicas. Compõe a cadeia aberta de interferência (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) com a geometria aberta do céu lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rederivada. Ao contrário do tipo <c1/> da Terra, o ramo do sinal não é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio EIRP do balanço de ligação − FSPL(distância oblíqua), pelo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Emite UMA LINHA POR LIGAÇÃO (época, satélite) VISÍVEL em JSON e como artefacto *.table.csv, com as duas potências recebidas de cuja diferença resulta o J/S impressas a seu lado; as grandezas de mérito agregadas ficam junto a essa tabela, nunca em vez dela. Executável como o tipo de cenário <c2/>

# text
seg-4c116e25c5c5 = Contorno de negação lunar com uma banda de incerteza a partir da dispersão do C/N₀ medido

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = O relatório <c1/> já não assenta o seu contorno de negação num único escalar. Emite a distribuição completa do C/N₀ do sinal pretendido medido sobre a tabela por satélite — n, mín., p05, p25, mediana, p75, p95, máx., média, desvio-padrão amostral e a assimetria própria da amostra (p95 − mediana) − (mediana − p05) — junto às linhas por ligação, que permanecem inalteradas. O contorno é depois comunicado em cada uma dessas estatísticas de ordem segundo AMBOS os critérios de negação que o motor reconhece, nunca um em vez do outro: o critério incumbente de razão de potências (J/S = { "30" } dB, o mesmo limiar que attack_surface e tracking_loop usam, e o critério por trás da coluna <c2/> da tabela publicada de interferência da ligação lunar), e o critério de perda de bloqueio (o C/N₀ efetivo a descer até tracking_threshold_dbhz), que é o critério com que a própria coluna links[].status deste relatório é avaliada. Cada ponto do contorno é dado em ambos os eixos do plano de negação — o EIRP do interferidor necessário ao afastamento do cenário e o afastamento de negação ao EIRP do cenário — pelo que a banda é um intervalo nos mesmos eixos em que um gráfico de contorno é desenhado. Os limites da banda SÃO contour(p05) e contour(p95): o mesmo mapa em forma fechada aplicado aos próprios quantis da amostra, não um sigma ajustado à amostra e não mediana ± k·desvio-padrão, e o relatório di-lo numa cadeia band_definition junto aos números. O desvio-padrão é emitido por continuidade e não é usado por nada. Um quantil cujo C/N₀ já esteja no limiar de seguimento ou abaixo dele não tem J/S de negação finito; essas colunas são emitidas como null com uma razão contada em vez de um infinito ou de um raio limitado

# text
seg-2d3944107ba0 = Poder de deteção do monitor de integridade intermodal

# text
seg-38bc7c0bfe57 = O relatório hybrid-optical-rf indica o que o monitor de qui-quadrado intermodal consegue realmente DETETAR, e não apenas que passa num caso sem falhas: o viés mínimo detetável por eixo monitorizado (este, norte, cima, relógio) às probabilidades de falso alarme e de deteção falhada indicadas no cenário, a curva de poder de deteção de um lado e do outro dele, o múltiplo de viés sem ruído a que a estatística realizada cruza pela primeira vez o limiar, e o tempo até à deteção para uma rampa de viés a uma taxa indicada. As falhas são também injetadas através do monitor real e a estatística que ele devolve é comunicada a par da previsão analítica

# text
seg-38cabd4921c1 = Recrescimento da covariância após a transferência face ao limite de alerta

# text
seg-9287268bbada = O relatório hybrid-optical-rf expõe o modelo de ruído de processo do filtro e indica durante quanto tempo a solução após a transferência permanece dentro do limite de alerta: para ambos os sentidos de transferência, transporta a covariância por eixo que a transferência deixou, propaga-a para a frente sob um ruído de processo de passeio aleatório indicado e comunica o instante em que o 1σ escalado pela cobertura atinge os limites de alerta horizontal, vertical e de temporização, qual limite é atingido primeiro, a constante de tempo de duplicação da variância e um perfil de deriva amostrado que enquadra o cruzamento. As PSD de ruído de processo, o fator de cobertura e os limites de alerta são todos entradas com predefinições documentadas

# text
seg-a3b8272862aa = Padrão de antena fora do eixo na exportação de geometria lunar

# text
seg-27d246503a48 = A exportação de geometria por satélite transporta, por (época, satélite), o ângulo fora do eixo NO SATÉLITE e o ganho de transmissão na direção do local a partir do padrão real de abertura circular uniformemente iluminada (Airy), e comunica a contagem dentro do feixe sob esse padrão A PAR DA contagem dentro do feixe sob a aproximação simétrica de ganho para largura de feixe (θ_3dB[deg] = √(31000/G_lin)), com a diferença emitida como correção explícita em ligações, em satélites por época e como pior época individual. Ambas as eficiências de abertura implícitas da aproximação são emitidas ({ "0.641" } face à regra de { "70" }·λ/D graus com que é citada, { "0.920" } face a uma abertura circular uniforme), pelo que a eficiência que assume em silêncio é indicada e não inferida. Desligada por predefinição: o bloco só aparece quando são dados um local de exportação e uma abertura

# text
seg-6fbfa234ef3e = Perda de bloqueio da malha de seguimento e arrastamento por spoofing sob interferência

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perda de bloqueio calculada a partir da dinâmica da malha em vez de uma razão de potências: tremor térmico de 1σ da portadora (Costas) e do código (adiantado/atrasado não coerente) face ao C/N₀ com a perda de elevação ao quadrado, face às regras indicadas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + atraso de rampa ≤ d/2 chips; limiares de C/N₀ de queda e de rebloqueio com a malha determinante nomeada e a histerese DERIVED da maior largura de banda de captura em vez de afirmada; o tempo declarado até perder o bloqueio de um detetor de bloqueio de dois limiares com tempos de confirmação, comunicado separadamente do tempo físico de fuga de fase (tempo médio de Viterbi entre saltos de ciclo, em log₁₀ s porque abrange centenas de décadas); a maior variação de código e a maior taxa de Doppler da portadora que as malhas da vítima conseguem seguir; e o RAIO DE NEGAÇÃO que a dinâmica da malha implica, comunicado a par do raio existente de razão de potências com a sua diferença com sinal como campo nomeado próprio. Executável como o tipo de cenário <c1/>

# text
seg-0f4d023fe2d4 = Covariância de coordenadas de ponto da superfície lunar a partir de um calendário de atrasos VLBI, mantida distinta da das estações terrestres

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Uma terceira escolha de datum, <c1/>, que mantém todas as estações terrestres e estima apenas as coordenadas da BALIZA fixas ao corpo lunar — a configuração para a qual uma incerteza de ponto da superfície lunar é realmente citada, dado que as coordenadas das estações terrestres são uma entrada do modelo de atraso e não uma incógnita dele. Existe porque a covariância ao nível da estação e a covariância de ponto da superfície são GRANDEZAS DIFERENTES separadas pelo braço de alavanca ρ/B, e nada impedia anteriormente que uma fosse citada face à outra. O bloco <c2/> emitido transporta ρ, a linha de base mais longa, o braço de alavanca, a forma de ponto da superfície da ligação de equipartição c·σ_τ·(ρ/B)·√(g/N), o sigma da baliza por coordenada calculado e a sua razão — a razão é null em vez de enganadora sempre que a baliza não é estimada ou a matriz tem deficiência de característica. B é tomado como a linha de base MAIS LONGA presente, a mais favorável, pelo que a razão só pode subestimar. Executável como <c3/> com <c4/>, o que é recusado com uma mensagem a nomear a entrada em falta quando a baliza não é estimada

# text
seg-0315968c8214 = PNT diferencial lunar — orçamento de resíduos da ligação de correções

# text
seg-c6785166a44c = Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado anteriormente como margem não modelada: erro de levantamento da estação de referência (correlacionado entre satélites, independente da linha de base, transferência de posição de ~{ "1" }:{ "1" } e comprovadamente não amplificado pelo DOP), envelhecimento da correção (o vetor de erro de órbita congelado reprojetado sobre a linha de visada em que o próprio propagador do motor coloca o satélite uma latência depois, mais a deriva de relógio c·σ_y(τ)·τ da lei de potência calibrada) e quantização uniforme da ligação sobre uma escala completa exata de ±(orbit_err + clock_err) com variância step²/12. Comunicados nos domínios da distância e da posição, a par de — nunca em vez de — o resíduo e o nível de proteção existentes, com uma curva de latência a par do valor único

# text
seg-c42646ae4707 = Mapa de cobertura e exatidão de estações de referência lunares

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores polar sul e um dia de épocas (o tipo <c1/>): para uma estação de referência diferencial num local polar sul conhecido, por ponto e sobre a região, o erro de posição corrigido e não corrigido por percentis (3-D, horizontal, vertical), a disponibilidade com uma razão para cada época indisponível (user_lt4, station_missing_sat), a cobertura face a um limiar indicado antes da execução, níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento da ligação de correções na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; não é afiliado a nenhuma agência nem por ela apoiado

# text
seg-7ecf4b0038b0 = Máscaras de horizonte de terreno lunar a partir de um perfil indicado ou de um DEM polar

# text
seg-7102948907bc = Máscaras de horizonte dependentes do azimute por local para o tipo lunar-station-coverage (a estação de referência e cada ponto de utilizador) e a grelha moonlight-service-volume e o seu local de exportação por satélite (cada linha de exportação ganha clears_terrain), no formato de tabela de skyline { "0.36" } (skyline::Skyline, linear em azimute com fecho a { "360" } graus; um perfil indicado e um horizonte de DEM num local combinam-se como o seu máximo ponto a ponto): um station_horizon ou user_horizon de [terrain] indicado e rotulado com a sua origem, e/ou um horizonte por traçado de raios sobre um DEM estereográfico polar sul (o formato de grelha polar LOLA do LRO, lido a partir de um descritor que fixa o seu tamanho e SHA-256, ou um mosaico realdata::lola_dem de latitude/longitude com [terrain] dem_tile_path, repetido com o seu SHA-256) ao longo de círculos máximos da esfera lunar com curvatura exata, a partir de uma altura de mastro indicada, a um passo de azimute e alcance indicados. Um satélite conta num local quando ultrapassa a mask_deg plana e o horizonte no seu azimute (lunar_service::topocentric); uma época que o horizonte deixa com menos de quatro satélites num ponto, onde a máscara plana dá quatro, é contada como a razão de indisponibilidade terrain_masked. O DEM incluído é um recorte do produto LOLA LDEM_75S_240M de domínio público, reamostrado por média de blocos { "5" } x { "5" } para { "1200" } m (data/lunar-dem/NOTICE.md). Na ausência, cada local mantém a máscara plana e cada documento é idêntico byte a byte

# text
seg-d37bb01e270b = Termos de multipercurso e de hardware do recetor da estação de referência lunar

# text
seg-1103199f019b = A secção opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multipercurso dependente da elevação sigma(el) = a + b exp(-el / el0) no utilizador e na estação (a forma funcional aerotransportada RTCA DO-229, com a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graus como predefinições; na Lua todos os valores são ILLUSTRATIVE), branco no utilizador e de Gauss-Markov de primeira ordem ao longo das épocas na estação (rho = exp(-dt / tau)); ruído térmico de código DLL adiantado-menos-atrasado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); vieses entre canais por canal constantes ao longo de um ensaio, no utilizador e na estação. Os termos da estação entram nas suas correções, os termos do utilizador nas medições brutas e corrigidas, cada um no seu próprio fluxo com semente. Na ausência, cada documento permanece inalterado

# text
seg-03796cb741b6 = Crescimento do erro de efemérides da estação de referência lunar ao longo da latência de correção

# text
seg-13b0ae9a874a = A entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): uma correção aplicada latency_s depois de calculada falha o crescimento g latency_s do erro de órbita difundida, g isotrópico de taxa RMS 3-D, sorteado por satélite e ensaio no seu próprio fluxo com semente (taxa de 1 sigma da distância tau / sqrt({ "3" })), além da reprojeção da linha de visada do erro congelado. Na ausência, cada documento permanece inalterado. Uma adenda K5 à comparação de afirmações publicadas, pré-registada isoladamente, executa K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-90307f07e0ef = Modos de solução da estação de referência lunar: restrição de altura, três satélites, janela de utilizador estático

# text
seg-366c7ad03fb2 = A secção opcional [solution] de lunar-station-coverage (LRS-06): uma linha de pseudomedição de altura up . dx = e_h de 1 sigma indicado, ponderada face às linhas de distância, um mínimo de três satélites permitido apenas com ela, e uma solução de mínimos quadrados ponderados sobre as últimas window_epochs épocas com uma posição estática partilhada e um relógio por época (a resposta de um filtro para uma posição estática sem ruído de processo sobre os mesmos dados; os erros das épocas são tratados como independentes). Na ausência, a solução instantânea e cada documento permanecem inalterados. Uma adenda à comparação de afirmações publicadas com o estilo de solução das fontes, pré-registada isoladamente

# text
seg-611ba369ed00 = Exatidão e cobertura de estações de referência lunares face a afirmações publicadas

# text
seg-4fe4f1cffa2b = O tipo lunar-station-coverage executado sob os pressupostos públicos do material publicado sobre uma estação de referência diferencial lunar (quatro satélites de navegação em órbitas elípticas congeladas de { "24" } h, SISE de { "10" } m a { "95" } %, ruído de código de { "0.30" } m, latência de correção de { "1" } s e { "600" } s, um levantamento da estação sub-decimétrico, o local de estação de exemplo publicado, os círculos polares sul de { "300" } km e { "600" } km) e avaliado face às afirmações numéricas das fontes segundo seis limiares unilaterais pré-registados antes da execução: cobertura de todo o polo sul com p95 sub-métrico (K1, K2), p95 corrigido sub-métrico e de nível decimétrico (K3, K4), sub-métrico mantido a { "600" } s de latência (K5), e exatidão mantida de { "10" } km a { "500" } km de linha de base (K6)

# text
seg-7bfcb5c6a985 = ARAIM com hipóteses de falha simultânea de vários satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: a regra de determinação de subconjuntos do ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorizados com menos remoções primeiro) generalizada de pares para combinações simultâneas de até max_order eventos de satélite e de constelação, com o a priori exato P_no fault prod q_e; add_v42_protection_levels_to_order executa sobre ele o percurso de nível de proteção do ADD v4.2 (a ordem { "2" } é exatamente o percurso existente). raim::araim_subset_raim (opcional): RAIM avançado sobre esse conjunto de hipóteses, cada subconjunto monitorizado como um modo (p_fault, T, b, sigma) na soma de risco de integridade, subconjuntos não observáveis movidos para o risco não monitorizado, o orçamento escalado pela atribuição do ADD do risco não monitorizado, e o subconjunto de maior separação normalizada comunicado quando é detetada uma falha. Os a priori que exigem subconjuntos mais profundos do que max_order são recusados, nunca truncados

# text
seg-48ca01332f8f = RAIM a par das figuras de mérito de holdover do relógio

# text
seg-890f1006a75d = A secção opcional [integrity] do tipo clock (clock_integrity::run): a partir de um local indicado e de presets de constelação (geometry::sky_geometry), em cada época de integridade enquanto a linha temporal GNSS não está negada, RAIM instantâneo (raim::snapshot_raim: teste de qui-quadrado de paridade, níveis de proteção de declive) sobre os satélites acima da máscara com resíduos gaussianos com semente do sigma indicado e um viés opcional indicado; um bloco integrity_fom separado com veredictos por época, níveis de proteção e disponibilidade. As épocas negadas são comunicadas como indisponíveis, nunca extrapoladas; as figuras de mérito de holdover permanecem inalteradas e, sem a secção, a saída é idêntica byte a byte

# text
seg-9cbb4ee7588a = Observabilidade espacial, ruidosa e multifamília do comprimento de arco cislunar

# text
seg-5ebd771deef8 = O limiar de comprimento de arco de observabilidade cislunar no CR3BP ESPACIAL de seis estados e não no planar de quatro estados, em famílias DRO, halo L2 e halo quase retilíneo L2, com ruído de medição a entrar no Gramiano e DOIS critérios comunicados porque não existe um único honesto: o critério de característica publicado, que é comprovadamente invariante a um sigma de medição homocedástico (o branqueamento multiplica a matriz de observabilidade por um escalar, deixando inalterados o espetro relativo de valores singulares e, portanto, a característica, o defeito e a condição), e um critério de estimabilidade — o primeiro arco em que a incerteza formal de 1σ da posição do estado inicial do principal desce abaixo de um limite indicado — que é o que se move com o ruído. Cada limiar transporta o enquadramento da grelha de épocas em que se situa; um critério não atingido é null com uma razão. O modo planar permanece a predefinição e as famílias fora do plano são recusadas nele em vez de achatadas para um estado que não as consegue representar

# text
seg-e250321394bc = Erro de previsão da orientação da Terra de estilo operacional, medido previsto versus final

# text
seg-0e443d241460 = Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para o UT1; Chandler, anual e semianual para o polo — extrapolado com o último resíduo dentro da janela levado para a frente: a classe que o IERS Bulletin A usa, em lugar do preditor de persistência em que o horizonte publicado assentava. Avaliado da única forma honesta: uma previsão para T+h construída a partir de linhas rápidas do Bulletin A em T ou antes, medida face ao Bulletin B final PUBLICADO POSTERIORMENTE em T+h, com a persistência avaliada sobre o conjunto idêntico de épocas face aos finais idênticos a seu lado. Uma época-alvo sem final publicado é descartada em vez de reavaliada face à coluna rápida; um termo periódico que a janela não consegue restringir é comunicado como rejeitado com os ciclos que realmente abrange; uma janela incompleta é recusada em vez de silenciosamente encurtada

# text
seg-f4efd94dd746 = Datum de referencial lunar a partir de uma campanha de observação

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA em vez de recuperado de uma transformação injetada. Estações terrestres observam um catálogo com origem identificada de balizas à superfície lunar segundo um calendário explícito; as derivadas parciais de atraso do VLBI lunar são acumuladas numa matriz de informação de Fisher de coordenadas das balizas e enviadas através do desenho de Helmert A = [I₃ | [p]ₓ | p] para H = AᵀM_bA, pelo que a exatidão de datum comunicada é função do programa de observação — exatamente linear no sigma de atraso e monótona no arco através da libração que o relatório MEDE. O defeito de datum é o assunto e não uma nota de rodapé: a característica, o defeito, o número de condição, o espetro, as direções inobserváveis na base de sete parâmetros, a direção mais fraca mesmo com característica completa e a parte de cada parâmetro nela são emitidos em cada execução, e qualquer parâmetro que a campanha não restrinja é publicado como NULL com um estado. A correlação do erro das balizas é MEASURED e não assumida — exatamente nula com as estações fixas, e impressa com o seu custo quando são estimadas. Executável como o tipo de cenário <c1/>

# text
seg-ca481f2d8f9e = Corroboração por estimador independente do limiar de comprimento de arco cislunar

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do principal a partir de medições entre satélites simuladas sobre prefixos crescentes da mesma grelha de épocas que a tabela de característica versus arco usa, com as derivadas parciais das medições tomadas como diferenças finitas centrais do modelo direto composto. Não consome nada da maquinaria com que o limiar foi medido — nenhuma linha de Jacobiano analítica, nenhuma matriz de transição de estado variacional, nenhuma decomposição em valores singulares ou próprios, nenhuma tolerância de característica, nenhum filtro de informação de raiz quadrada — e partilha apenas a dinâmica, as condições iniciais, o observável escalar e a grelha de épocas, cada um nomeado no documento emitido. Dois critérios, ambos varridos: recuperação sem ruído (o análogo da característica) e estimabilidade de Monte Carlo (o análogo da estimabilidade, medida face a uma verdade conhecida e não prevista a partir de uma covariância). Executável como o tipo de cenário <c1/>

# text
seg-1a3bb032960f = Estatística de consistência de modo comum (falha de referência partilhada invisível à separação)

# text
seg-1b03f522b8fc = Estatística de pontuação ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para um desvio de modo comum que a separação de soluções (contrastes ortogonais a { "1" }) não consegue ver; um desvio de modo comum aumenta-a, enquanto as separações entre pares se mantêm planas

# text
seg-3359eee713a5 = Classificação do espaço nulo do datum lunar (aditividade de posto LLR + elevação do defeito por libração)

# text
seg-6d722c176052 = Classificação do problema de datum de medição de distâncias interna: uma única observação de distância contribui com posto { "1" } (espaço nulo de dimensão 6); o par origem-X e escala é quase nulo e a libração física DE440 eleva o defeito a zero, enquanto o par se mantém quase degenerado

# text
seg-3fd19007ea67 = Informação de datum lunar multitécnica (LLR + VLBI lunar + distância de orbitador)

# text
seg-23d0dd7d0666 = Linhas do Jacobiano do datum para a distância LLR a refletores na Terra, o atraso diferencial VLBI lunar de duas estações e a distância orbitador-baliza sobre o datum de 7 parâmetros, combinadas numa única Fisher pré-condicionada de forma consistente; demonstra que o seguimento fora da radial (orbitador / diverso em profundidade) quebra a degenerescência entre origem-X e escala, enquanto o VLBI transversal só ajuda indiretamente

# text
seg-ab96cfc8d48c = Substrato de geometria do datum LLR lunar (refletores de eixos principais, estações terrestres, derivadas parciais analíticas da distância)

# text
seg-40e91288f81a = Os cinco conjuntos de retrorrefletores do lado visível em metros no referencial do corpo PA e as estações terrestres LLR em coordenadas geodésicas; a colocação dos refletores do referencial do corpo para o inercial através da orientação PA DE440; as derivadas parciais analíticas da distância Terra-refletor em relação ao datum de 4 parâmetros; e a matriz de Fisher só de LLR que exibe a degenerescência entre lunocentro-X e escala que motiva a análise de 7 parâmetros

# text
seg-63a8571f8eb0 = Degenerescência entre distância e desvio de relógio na medição de distâncias lunar unidirecional, e a lei de projeto da diversidade geométrica

# text
seg-cdd70f56051a = A degenerescência entre distância radial por nó e desvio do relógio do recetor é exata em { "1" } m para { "3.336" } ns (um sobre c). A marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) mostra que, numa rede geometricamente diversa, a medição de distâncias bidirecional eleva a marginal aproximadamente no mesmo fator que um número igual de dados unidirecionais adicionais, enquanto no regime idealizado de nó único a elevação bidirecional é maior em ordens de grandeza. A lei de projeto que daí decorre: a diversidade geométrica, e não a medição bidirecional como tal, é o que separa a escala do referencial lunar do desvio da escala de tempo na medição de distâncias unidirecional; uma ligação temporal bidirecional ou externa só é necessária no regime de baixa diversidade ou de utilizador único.

# text
seg-2c074d6260ba = Menu representativo de medições multitécnica e regra aditiva de combinação de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock guarda uma campanha de medição candidata como uma contribuição de informação de Fisher 7x7 mais um custo relativo escalar; block_from_rows constrói uma a partir de linhas brutas do Jacobiano do datum, de modo que cada bloco é pré-condicionado de forma idêntica através de lunar_identifiability::assemble_multi_info; combine soma a informação de um subconjunto escolhido, o que é a regra correta porque a informação de Fisher é aditiva entre medições independentes; representative_lunar_menu fornece um menu determinista de quatro blocos (LLR, uma baliza VLBI de limbo transversal, um orbitador do lado visível e um orbitador do lado oculto). O otimizador de projeto com restrição orçamental que consome este menu não faz parte deste crate.

# text
seg-2d3347bcb15e = Tolerância de consistência entre fornecedores para um utilizador de fornecedores mistos

# text
seg-9decf2cb6b0c = consistency_tolerance: inverte um orçamento de posição do utilizador num requisito de concordância de Helmert entre fornecedores por parâmetro (origem/escala/rotação) a um braço de alavanca de referência, opcionalmente inflacionado pelo CRLB de realização de fornecedor único P1

# text
seg-5450d921dfc9 = Orçamento de erro de interoperabilidade lunar multifornecedor e lei de projeto referencial-versus-efemérides

# text
seg-e1e30f5c17a6 = interop_budget: divisão entre redutível (ligação de referencial comum) e irredutível (dinâmica) sob as convenções PerProvider / CommonFrameTie / CommonEphemeris, com a métrica de lei de projeto de fração irredutível (~{ "0.69" } em DE440/INPOP/EPM reais: uma etiqueta de referencial comum por si só deixa o piso dominante)

# text
seg-ebb827739614 = Limite de deteção/identificação por faísca de bloco bizantina na rede lunar autónoma por nó (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia o limite de codificação de estimação segura de estado / observabilidade esparsa sobre a geometria da rede por nó: um par bizantino injeta uma combinação linear arbitrária das medições em que participa, e a rede DETETA qualquer coligação de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única qualquer coligação de ≤ ⌊(block_spark − { "1" })/2⌋, onde block_spark é a menor coligação de pares cujas assinaturas efetivas empilhadas P⊥·B_T têm deficiência de posto de coluna. A detetabilidade de um par é o POSTO DE COLUNA COMPLETO de P⊥·B_j (um bloco não nulo mas com deficiência de posto é um ataque não nulo que cai em range(G) e não deixa resíduo), e não apenas P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Piso de calibre temporal de holdover autónomo para a constelação lunar autorreferencial (T4)

# text
seg-eb690e8f5c9b = holdover_floor estabelece que, num conjunto de nós autónomos ligados apenas por medições entre nós, a taxa de relógio comum (δα_j += { "1" } ∀j) é um parâmetro livre de tempo de conjunto que se situa em N(GᵀWG): nenhuma quantidade de medição adicional de distâncias entre nós a consegue observar (rate_in_gauge = true, temporal_gauge_dim = { "2" } com o desvio comum). Este é o verdadeiro piso de holdover — o análogo temporal do calibre de posição de referencial rígido. Acrescentar uma ligação externa de taxa absoluta (uma ligação direta a uma referência fora da rede) expulsa a taxa comum do espaço nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), o que prova que o piso é um calibre real e não um artefacto do modelo de oscilador

# text
seg-25ffd6e1979c = Divisão comum/diferencial por fornecedor, unificação da deficiência de um posto e declive da lacuna de proteção (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Três facetas da decomposição única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), com o calibre datum⊕escala de tempo de 8 dimensões como N(G) e as state_dim − { "8" } = { "32" } direções observáveis como range(G): (T5) provider_mismatch_split classifica um viés comum multifornecedor (∈ range(G)) como INDETETÁVEL — a precisar de uma ligação externa — e um viés diferencial (∉ range(G)) como automonitorizado / DETETÁVEL; (§{ "0" }) a unificação consiste em que o MESMO subespaço cego range(G) governa a classe de falhas indetetáveis, pelo que o calibre de datum N(G) e o subespaço cego às falhas range(G) são uma só geometria, não duas; (g7) slope devolve o declive de lacuna de proteção de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para uma falha b ∈ range(G) (estimador corrompido com paridade nula) e finito para uma falha detetável

# text
seg-632add2dbd3c = Máscaras de sincronização de telecomunicações ITU-T com PASS/FAIL e margem

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado e holdover ePRTC-A (incluindo a envolvente de erro de tempo da Tabela { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes T-BC/T-TSC A-D e G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) ponto de referência C, cada intervalo aberto ou fechado como a tabela o indica, com todas as entradas «para estudo posterior» omitidas; um veredicto e uma margem no ponto condicionante por verificação, e o tempo até exceder cada orçamento. Executável como o tipo de cenário <c1/>

# text
seg-165ed2bc771a = Máscaras de geração de wander de sincronização de frequência ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sete máscaras de geração de wander de MTIE e TDEV a temperatura constante para o tipo de cenário <c1/>: G.811 (09/1997) PRC (autónomo), G.812 (06/2004) Tipos I, II e III, G.8262 (10/2024) EEC Opções { "1" } e { "2" } e G.8262.1 (11/2025) eEEC (modo bloqueado), incluindo as parcelas de lei de potência que as tabelas escrevem (<c2/> e semelhantes), cada intervalo aberto ou fechado como impresso, medidas através do filtro de { "10" } Hz que as cláusulas indicam (tomado como aplicado antes da amostragem); o cenário de referência scenarios/telecom-synce-eec.toml põe um OCXO em funcionamento livre contra as três máscaras EEC. Não implementado: as tolerâncias de temperatura variável, o holdover, os transitórios, o jitter e a exatidão de frequência de G.811

# text
seg-5fc2ad88faf0 = Formatos de registo de relógio (relógio RINEX, TimeLab ASCII, TAPR TICC) lidos para uma série de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: uma camada de análise sintática que converte um ficheiro de relógio RINEX (registos AS/AR de um relógio indicado, versões { "2" } e { "3.00" } a { "3.04" }), um registo ASCII de fase ou frequência no estilo TimeLab, ou um registo de marcas temporais ou de intervalos TAPR TICC numa grelha de fase uniforme, com tau0 indicado, a partir de um cabeçalho, ou o espaçamento mediano, cada lacuna, leitura fora da grelha e duplicado contados, e uma política de lacunas de recusa, de maior sequência ou linear; ligada de forma opcional à série de temporização de telecomunicações (<c1/>, a acrescentar um bloco <c2/>) e ao tipo de cenário clock (<c3/>, a acrescentar um bloco <c4/> com ADEV, TDEV e MTIE, o SHA-256 da tabela e o SHA-256 da fase; runs = { "1" }). Sem a tabela, ambos os tipos de cenário são idênticos byte a byte

# text
seg-acdb0337bce7 = Formatos de registo de relógio linuxptp (ptp4l, phc2sys, ts2phc) e chrony (tracking, statistics) lidos para uma série de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input com os formatos ptp4l, phc2sys, ts2phc, chrony-tracking e chrony-statistics: o desvio registado de uma linha de servo linuxptp (ns, a marca temporal entre parênteses retos da própria linha, leituras anteriores à primeira comunicação de s2 pelo servo omitidas e contadas) ou de um registo tracking ou statistics do chrony (s, por posição de coluna, data e hora UTC) torna-se uma grelha de fase uniforme através das mesmas políticas de lacunas dos outros formatos; um seletor de fonte (<c1/>) designa uma de várias interfaces, relógios ou endereços; os registos alimentam a série de temporização de telecomunicações, o tipo de cenário clock e o tipo de cenário holdover-test

# text
seg-97aebb84576e = Teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador

# text
# c1: holdover-test
seg-ab533cf99c56 = O tipo de cenário <c1/>: um registo de erro de tempo (um registo de relógio linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes que o operador indica para a remoção e o restabelecimento do GNSS numa fase de linha de base, uma de holdover e uma de recuperação; a linha de base é medida face às máscaras ITU-T escritas para um relógio bloqueado e o holdover face às escritas para holdover ou relógio autónomo, a envolvente de holdover ePRTC-A e os orçamentos de erro de tempo; o holdover comunica o desvio de frequência por mínimos quadrados que o sistema manteve, e a recuperação se e quando |TE| entrou numa banda indicada e nela permaneceu durante um tempo de permanência indicado, com o pico e o maior salto. Cada limite é o que o tipo de cenário telecom-timing transcreve; os dois instantes são a declaração do operador e não são verificados

# text
seg-94cbac97a1aa = Disponibilidade de sinais GNSS no Volume de Serviço Espacial e para além dele, comparada com a brochura SSV do ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = As varreduras de disponibilidade do tipo de cenário <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (utilizador, época) com pelo menos um e pelo menos quatro sinais e a maior interrupção, para um utilizador numa esfera (a camada global de 2,562 pontos da brochura, { "14" } dias a { "1" } minuto) ou numa trajetória (GEO, HEO, transferência lunar), a partir das órbitas keplerianas do anexo C da brochura, uma potência radiada mínima constante dentro do ângulo de referência fora do eixo, bloqueio da Terra pela esfera mais { "50" } km e um limiar de C/N0; antenas de utilizador da tabela B10 da brochura

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efeitos de ionosfera, plasmasfera e atmosfera em raios de limbo sobre sinais GNSS rasantes, e o projeto de recetor de sinal fraco, no tipo de cenário <c1/>

# text
seg-1a1786ba90b6 = Uma ionosfera de Chapman, uma plasmasfera do tipo Gallagher e uma atmosfera neutra (curvatura por refratividade, absorção de oxigénio, desfocagem) integradas ao longo do raio reto entre o emissor e o utilizador: conteúdo eletrónico total oblíquo, a sua parte plasmasférica, atraso em excesso, altitude da tangente e a perda em ligações rasantes; e um projeto de recetor de sinal fraco (integração coerente e não coerente, limite de bit de dados, auxílio, busca de Doppler) que define o limiar de C/N0 a partir dos modelos de aquisição e de malha de seguimento

# text
seg-6b8f9f3ca2a3 = Filtro de navegação GNSS a bordo para veículos espaciais em órbita alta e de transferência lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = O modo <c2/> do tipo de cenário <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, desvio e deriva do relógio do recetor, uma escala de pressão de radiação solar) sobre pseudodistâncias cuja disponibilidade, ruído e C/N0 provêm da mesma geometria de ligação das varreduras; a referência é integrada com J2, terceiros corpos Sol e Lua e pressão de radiação com sombra, o filtro modela J2 e os terceiros corpos e estima a pressão de radiação; comunica erros de posição e velocidade dentro e acima das órbitas GNSS, a maior lacuna de medição e o NEES médio

# text
seg-5fc242476828 = Navegação relativa de uma formação de vários veículos espaciais numa órbita muito elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = O modo <c2/> do tipo de cenário <c1/>: um chefe e subordinados executam cada um o filtro absoluto; a posição do subordinado relativa ao chefe é estimada subtraindo as estimativas absolutas e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambos os veículos seguem, sendo a dinâmica relativa a diferença de duas trajetórias não lineares

# text
seg-7038f6902820 = Termos de erro do interferómetro de átomos frios: ruído de fase do laser Raman, viés de curvatura de frente de onda e resolução da ambiguidade de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funções de biblioteca, ainda não acessíveis a partir de um tipo de cenário): a função de ponderação da fase Raman de um interferómetro de três pulsos de pulsos quadrados (Cheinet et al. { "2008" }, Eq. { "8" }) com a forma fechada de fase branca (pi/2)^{ "2" } S_phi0/tau_R e um caminho numérico para qualquer espectro; o ruído de frequência do laser que o atraso da retrorreflexão não cancela (Le Gouet et al. { "2007" }, Eqs. { "9" } a { "11" }); o viés de frente de onda de desfocagem pura sigma_v^2/R de uma nuvem térmica e a sua redução por um raio de deteção; a probabilidade de índice de franja errado erfc(pi/(sqrt({ "2" }) s)) para um auxílio de acelerómetro clássico e para dois tempos de interrogação, e a sua inversa

# text
seg-363705e03bac = Predefinições de holdover de osciladores a partir de folhas de dados públicas

# text
seg-9750d9e0ec7a = Quatro predefinições — OCXO (Microchip OX-208), rubídio (Microchip 8040C), césio (Microchip 5071A tubo de alto desempenho) e CSAC (Microchip SA.45s) — cada uma com os máximos de desvio de Allan, o envelhecimento e o limite de temperatura da sua folha de dados; um ajuste de ruído de frequência branco + flicker + passeio aleatório por mínimos quadrados não negativos escalado para envolver cada ponto da folha de dados, um piso de flicker nunca abaixo do valor de τ mais longo, envelhecimento linear e um termo de temperatura sinusoidal, sintetizado como um holdover com semente após uma perda de GNSS

# text
seg-d7e03158b972 = Segundos até um relógio em funcionamento livre sair da guarda de um intervalo indexado no tempo, e a cadência de correções que o mantém dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = O tipo de cenário <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, o intervalo de ressincronização líquido da latência da correção e as correções por dia, cada termo discriminado com o dominante identificado; relógios a partir das seis predefinições de ClockClass (TCXO, OCXO e RAFS acrescentados, cada um a citar uma folha de dados), as predefinições de temporização de telecomunicações, uma folha de dados em linha ou um registo medido; uma violação além do maior tempo de média da fonte é assinalada como extrapolada

# text
seg-2797643153dc = Nível de proteção de temporização para um recetor em órbita sob spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, acessível como a secção de spoofing do tipo de cenário <c1/>: velocidade e período em órbita circular, o maior tempo em que um spoofer em terra consegue alcançar o satélite por passagem, o piso do monitor assistido por relógio e a latência de deteção CUSUM, o nível de proteção condicional (piso mais deriva ao longo da latência), o arrastamento que um spoofer a uma taxa de rampa máxima indicada acumula antes de o satélite sair da sua pegada ou de ser executada uma verificação independente, e se cada verificação de contacto com a terra ou de ligação cruzada é independente de um spoofer em terra

# text
seg-f134975d4ffa = Cascata de espectro em banda L com J/S por banda e C/N0 efetivo sob uma cronologia de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = O tipo de cenário <c1/>: uma grelha frequência por tempo da densidade espectral de potência em banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais às suas potências mínimas recebidas da especificação de interface, e jammers de onda contínua, de banda estreita, chirp e de ruído adaptado com instantes de ligar/desligar), cada célula com a média sobre o seu intervalo e linha (chirps exatamente sobre varrimentos completos e parciais, jammers pelo ciclo de trabalho), C/N0 efetivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por linha, J/S por banda, J/S em banda e uma cascata SVG com barras de C/N0. O relatório inclui uma verificação cruzada com a cadeia do tipo de cenário <c2/> nas mesmas entradas de ligação

# text
seg-6e0b9687e8ee = Úrano e Neptuno a partir da Tabela { "1" } de Standish, Plutão e velocidades planetárias

# text
seg-df3bf502dfe9 = Posições de Úrano e Neptuno a partir da Tabela { "1" } de Standish (a predefinição entre { "1800" } AD e { "2050" } AD), Plutão a partir da linha da Tabela { "1" } de { "1992" } que a página atual da JPL já não lista, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com o movimento médio que os elementos implicam mais a rotação da elipse pelas taxas do periélio, da inclinação e do nó

# text
seg-a50be56f605a = Posições da Lua e de sete luas principais (Fobos, Deimos, as luas galileanas, Titã)

# text
seg-2cfbe5a1eece = A Lua geocêntrica a partir da série de Montenbruck & Gill (cujo termo de -1.3972 deg por século já a refere ao equinócio J2000), e posições e velocidades planetocêntricas de Fobos, Deimos, Io, Europa, Ganimedes e Calisto a partir dos elementos médios da JPL Solar System Dynamics no plano de Laplace de cada lua, com a taxa de longitude média tirada da taxa de rotação síncrona da IAU (a tabela imprime o período com poucos dígitos para conservar a fase), e de Titã a partir do modelo de rotação da IAU (a lua sobre o eixo x fixo ao corpo, com sinal menos, à distância média), porque a linha do plano de Laplace impressa para Titã não reproduz o Horizons nem na sua própria época

# text
seg-8b8c8e28ece9 = Constantes físicas de cada corpo do sistema solar e o relatório do sistema completo

# text
# c1: solar-system
seg-d225a30de35c = Body ganha Mercúrio, Vénus, Júpiter, Saturno, Úrano, Neptuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã (parâmetro gravitacional, raio de referência, J2 onde publicado com o raio a que se refere, polo IAU e meridiano de origem), uma consulta por nome e um registo BodyFacts (código NAIF, classe, progenitor, raio equatorial e médio); o tipo de cenário <c1/> comunica-os para todos os dezoito corpos com as posições, os tempos de luz e uma trajetória de órbita ao longo de uma revolução, cada corpo etiquetado VALIDATED ou MODELLED

# text
seg-87ab655f8270 = Posicionamento em torno de qualquer corpo do sistema solar com uma constelação local e uma ligação de espaço profundo a partir da Terra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = O tipo de cenário <c1/>: um orbitador ou um módulo de aterragem à superfície em torno de um corpo escolhido por nome navega com pseudodistâncias unidirecionais de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular J2 do corpo, um relógio de utilizador desconhecido) e uma distância bidirecional opcional, sem relógio, a partir da Terra, com a direção e a distância da Terra obtidas da efeméride analítica em cada época; linhas de visão bloqueadas pela esfera do corpo e uma máscara de elevação à superfície; por época o GDOP e o PDOP só da constelação (orbit::dop), a incerteza formal de posição com e sem a linha da Terra, e soluções de posição de Gauss-Newton com semente (batch_ls::gauss_newton) de cada forma, com o tempo de luz e o tempo de ida e volta entre o corpo e a Terra

# text
seg-7d4d7200cbca = Mapas de cobertura e de diluição da precisão para projetos arbitrários multiconstelação à escala, em torno de qualquer corpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = O tipo de cenário <c1/> para além dos dois casos fixados: projetos explícitos e multicamada, várias constelações por execução com um relógio de recetor por constelação, a Terra, a Lua e Marte a partir das constantes dos corpos, a predefinição BeiDou (fase de órbita média e cruzamento geossíncrono inclinado a { "118" } deg E modelados), satélites à vista por célula, GDOP, PDOP, HDOP, VDOP e disponibilidade, trajetórias no solo subamostradas e um pré-filtro de visibilidade por latitude subsatélite que executa um projeto de { "5" } 000 satélites numa grelha de { "10" } deg numa fração de segundo

# text
seg-278c77438493 = Uma missão encadeada entre tipos de cenário numa cronologia partilhada

# text
# c1: campaign
seg-3dcfb26f6234 = As fases do tipo de cenário <c1/>: cada fase executa um ou mais cenários de tipos existentes através de run_toml, lê as suas saídas para canais com nome (erro de tempo de relógio e guarda, razão média efetiva portadora-densidade de ruído e piso de seguimento, nível de proteção vertical e limite de alerta, erro de posição, satélites em seguimento, indicadores de alarme) por predefinições por tipo de cenário ou caminhos de resultado explícitos, coloca-os no início da fase e mantém-nos numa grelha comum, com fronteiras de fase e eventos; o estado é passado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número de uma fase anterior escrito no cenário seguinte) e end_at (uma fase termina num instante que uma execução calculou, como o instante de deteção de um monitor de spoofing); um hash da campanha e um digest de todos os resultados dos membros

# text
seg-ad6105af464c = Varrimentos de parâmetros e conjuntos Monte Carlo com semente sobre qualquer tipo de cenário

# text
# c1: campaign
seg-95921611839e = As secções sweep (uma a três chaves com pontos de qualquer tipo de cenário, sobre os valores de eixo do varrimento genérico, opcionalmente com um conjunto em cada nó) e monte_carlo do tipo de cenário <c1/>: a realização k é executada com base_seed + k; cada métrica comunica a média, o desvio-padrão, os percentis 5.º/50.º/95.º por posto mais próximo e um intervalo de confiança de { "95" }% da média por bootstrap de percentis com semente fixa (inertial::metric_stat); as unidades das métricas são lidas do próprio bloco de unidades do tipo de cenário varrido

# text
seg-24327a0ed82e = Vários cenários sob condições partilhadas, com um resumo combinado

# text
# c1: campaign
seg-5833fb3b06e3 = A secção compose do tipo de cenário <c1/>: valores partilhados com nome (por exemplo a potência e a posição de um jammer) escritos em cada membro nas chaves a que os liga, cada membro executado e, por métrica, o menor, o maior e o valor médio entre os membros com o membro identificado; as unidades das métricas têm de coincidir entre os membros

# text
seg-0bc866720bde = Otimização limitada de uma métrica sobre parâmetros de campanha

# text
# c1: campaign
seg-f9bdb89c2b4f = A secção optimize do tipo de cenário <c1/> (CAP-32): uma a três chaves de cenário com pontos limitadas a [lo, hi] numa escala lin ou log, uma métrica lida por caminho de resultado, objetivo minimize, maximize ou target; método grid (os valores de eixo do varrimento) ou um simplex de Nelder-Mead determinista em coordenadas normalizadas com projeção na caixa e os coeficientes padrão; uma métrica em falta ou não finita pontua como a pior e permanece no rasto; com runs > { "1" } a métrica é a média sobre sementes comuns; cada avaliação é uma execução real do tipo de cenário indicado, listada em trace e contada no digest de reprodutibilidade

# text
seg-652e28dfa10f = Projetos de sinais de posicionamento, navegação e temporização em órbita terrestre baixa: seguimento de código, aquisição, compatibilidade com GNSS e um compromisso de banda para qualquer sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição ITU; componentes de aquisição, de dados e piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, partilhas de potência, subportadoras FDMA, comprimentos de código e taxas de dados) a partir de ficheiros de predefinições públicas compilados (Xona Pulsar, Iridium STL, sinal de oportunidade Starlink, CentiSpace, um projeto genérico de banda C e projetos genéricos UHF/L/S/C/C larga, cada um com o seu URL de fonte e os valores não publicados etiquetados REPRESENTATIVE) ou escritos em linha; por sinal a densidade espectral de potência de banda limitada, as frações de potência em banda, a largura de banda de Gabor, o jitter de código face a C/N0 e espaçamento e a exatidão de medição de distâncias, o espaço de busca de aquisição, a probabilidade de deteção de lei quadrática e o tempo médio de aquisição serial e paralela de código, o coeficiente de separação espectral para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a degradação de C/N0, e a tolerância de J/S CW, de banda larga e adaptada a partir da cadeia SSC do tipo de cenário spectrum; um compromisso de banda de atraso ionosférico, perda em espaço livre, exatidão de medição de distâncias a C/N0 igual e EIRP igual e tolerância a jammers; e verificações qualitativas de forma de um projeto face a uma medição descrita

# text
seg-c2b9c8e4a364 = Cascata de espectro multibanda (UHF, L, S, C) com sinais projetados e jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = O tipo de cenário <c1/> alargado para além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com cada componente, de banda limitada à largura de banda de transmissão, C/N0 e J/S referidos à componente seguida) ou como uma portadora e modulação personalizadas; painéis de cascata adicionais sobre qualquer intervalo de frequências na mesma cronologia e escala de cor; um jammer de banda larga (barragem) ao lado de ruído CW, de banda estreita, chirp e adaptado; J/S por banda e C/N0 efetivo a partir da cadeia inalterada do coeficiente de separação espectral

# text
seg-d9eb3e7e69c2 = Uma passagem LEO-PNT e o seu orçamento de ligação por banda face aos satélites GNSS MEO à vista

# text
# c1: leo-pass
seg-d986e44443dd = O tipo de cenário <c1/>: satélites a partir de uma passagem projetada, elementos, um TLE através de SGP4 ou uma constelação Walker de constellation-design; por banda e época os ângulos de visada, a distância, a taxa de variação de distância e a aceleração de distância em forma fechada (verificadas em cada execução face a diferenças centrais e comunicadas), a perda em espaço livre, o EIRP com diagrama isofluxo, gaussiano ou plano, uma antena de utilizador de patch, hemisférica ou isotrópica, a atenuação gasosa do Anexo { "2" } de ITU-R P.676-10, a chuva e a cintilação de P.618, a perda de penetração em edifícios de P.2109, o desajuste de polarização, a temperatura de ruído do sistema, C/N0, Doppler e taxa de Doppler, e o atraso de primeira ordem a partir de um TEC oblíquo de Klobuchar ou de TEC vertical escalado pela fração de Chapman abaixo do satélite; pares livres de ionosfera com ruído de código no pico da passagem; portadoras Galileo ou GPS a partir das suas potências recebidas do documento de interface através do mesmo recetor

# text
seg-95a077a980b6 = Predefinições de sistemas LEO-PNT com nome e fontes indicadas, e um motor agnóstico ao sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérico (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como sinal de oportunidade apenas de Doppler, CentiSpace e uma predefinição opcional Celeste IOD, cada uma com a sua fonte marcada PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP, a de workshop no ficheiro opcional da predefinição Celeste IOD, compilada apenas quando esse ficheiro existe; cada banda e órbita podem ser substituídas num cenário, e um cenário pode não indicar nenhuma predefinição

# text
seg-a39f34973373 = Posicionamento de baixa energia: tempo até à primeira solução de posição e energia por solução de posição face ao ciclo de trabalho

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy e a secção [iot] do tipo de cenário <c1/>: integração coerente limitada pela taxa de Doppler, somas não coerentes de lei quadrática até um limiar de deteção, uma busca por intervalos de Doppler sobre a envolvente de utilizador estático da órbita (a frio) ou uma janela assistida (a quente), busca de código paralela ou serial, tempo de mensagem de navegação num arranque a frio, energia por solução de posição e duração da bateria ao longo dos intervalos de solução, para cada banda LEO e o sinal GNSS

# text
seg-8121e7db3db3 = Atualização da mensagem de navegação LEO a meio da passagem com verificação de continuidade na comutação

# text
# c1: leo-navmsg
seg-34c310d85c42 = A análise de atualização a meio da passagem <c1/>: a passagem mais alta sobre um utilizador dentro de um intervalo de busca, mensagens num calendário global com períodos de utilização centrados nas suas janelas de ajuste e, em cada comutação, o salto de posição 3D, o salto de relógio, o salto de pseudodistância do utilizador, o maior salto sobre qualquer linha de visão visível (forma fechada sobre o cone de nadir), o erro de distância antes e depois, e PASS/FAIL face a um limiar

# text
seg-7635a8339e78 = Codificação binária documentada da mensagem de navegação LEO com um orçamento de erro de quantização

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: a trama própria do Kshana (preâmbulo, versão, modelo, comprimento, carga útil, CRC-24Q) para os quatro modelos de efemérides, o polinómio de relógio, SVID, issue of data, banda, estado de saúde, um conjunto Klobuchar, coeficientes NeQuick-G e parâmetros UTC, cada campo com uma largura e um passo indicados (field_table), quantização com recusa de intervalo e um orçamento da maior variação de posição e de relógio que uma variação de meio passo de cada campo provoca ao longo da janela de validade

# text
seg-17ca41d7fd71 = Exportações em estilo RINEX-4 e CSV de mensagens de navegação LEO

# text
seg-185e12ccef0d = leo_navmsg::text: um bloco em estilo RINEX-4 (cabeçalho de registo > EPH, linha de satélite e época com três termos de relógio, linhas de órbita de difusão D19.12) com letra de sistema L e tipos de registo KP16, KRAC, LU22 e APOL, etiquetado em cada cabeçalho como extensão do Kshana que não faz parte do RINEX { "4.02" }, e uma tabela CSV com um esquema de colunas por omissão e esquemas predefinidos, cada um com um importador

# text
seg-e79047fc95af = Polinómio ECEF de relógio nulo do ATOMIC e a comparação sintética de modelos LEO a cinco altitudes

# text
seg-e261843e35b1 = a variante EcefPoly de leo_navmsg::elements::EphemerisModel: um polinómio ECEF por eixo sem termos de relógio, o termo relativista a partir de -2 r.v/c^{ "2" }, avaliado face a um relógio governado. Também a análise de comparação de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta o modelo de 22 parâmetros às cinco altitudes do artigo sobre arcos de 20 minutos de uma órbita integrada pelo Kshana e imprime o resultado ao lado do SISRE publicado

# text
seg-d2e18c8bdc14 = Posicionamento a partir do Doppler LEO, com um ou vários satélites, com estados de deriva de relógio e de velocidade

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamento em lote de Gauss-Newton a partir da taxa de variação de distância com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade de utilizador constante como opção, uma pseudomedição de altura para um utilizador à superfície, passos amortecidos; a covariância formal na referência; projeções ao longo da trajetória, transversal e vertical; a exatidão de uma só passagem face ao desvio transversal do utilizador; o instante de maior aproximação. O modo doppler do tipo de cenário <c1/> acrescenta o erro face ao comprimento da janela e um modo de sinais de oportunidade só de Doppler (a predefinição starlink-sop)

# text
seg-7f462969d2d4 = Posicionamento conjunto por pseudodistâncias GNSS e LEO com desvios entre sistemas e modelos de erro por sinal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluções de posição de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de recetor por sistema (o desvio entre sistemas estimado com a posição) ou um desvio de difusão conhecido na escala de tempo de referência; sigmas por medição fornecidos pelo chamador, por omissão o ruído térmico da malha de seguimento de atraso do motor (navsignal::dll_code_jitter_chips) ao C/N0 da elevação combinado com o erro de distância do sinal no espaço; DOP sem ponderação (GDOP, PDOP, HDOP, VDOP, TDOP) no referencial geodésico local, sigmas formais este-norte-cima e os sigmas dos desvios; o modo conjunto de <c1/> compara soluções só GNSS, só LEO e fundidas e varre o DOP face ao número de satélites LEO acrescentados

# text
seg-ee9a4a0cb530 = Convergência de posicionamento de ponto preciso apenas com GNSS e com aumento por LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Um filtro de Kalman estendido PPP float sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de recetor branco, um desvio entre sistemas por sistema adicional, um atraso húmido zenital em passeio aleatório mapeado por 1/sin(elevação), uma ambiguidade float por arco de satélite acrescentada ao nascer e descartada ao pôr, e o erro preciso de órbita e relógio comum ao código e à fase de um satélite, processado como uma atualização correlacionada de duas linhas numa forma estabilizada de Joseph; medições simuladas a partir do mesmo modelo; tempo de convergência (erros abaixo dos limiares até ao fim da execução), curvas de erro e o NEES de posição médio da execução para apenas GNSS e cada caso LEO, executado como o tipo de cenário <c1/>

# text
seg-9306f1c06081 = Transferência de tempo para UTC assistida por LEO face ao C/N0 e ao oscilador do recetor

# text
# c1: leo-pvt
seg-c618feb01476 = Medições de relógio de cada satélite LEO à vista numa posição conhecida, combinadas por variância inversa a partir do modelo de ruído de pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o ruído de frequência branco e de passeio aleatório da classe do oscilador (slot_timing::ClockNoise, clock_state::ClockClass; a variância de deriva de holdover::coast_phase_variance), um relógio de referência com semente dos mesmos níveis, e a expressão de escala de tempo do sistema para UTC da secção { "20.3.3.5.2.4" } do IS-GPS-200 com uma incerteza do desvio de difusão acrescentada como desvio por execução; o modo timing de <c1/> varre osciladores e desvios de C/N0

# text
seg-d92777401093 = Sistemas LEO PNT com nome como predefinições de dados opcionais, cada um com a sua fonte

# text
seg-5130bfe2410c = Entradas agnósticas ao sistema: cada sistema é camadas Walker, elementos explícitos ou uma predefinição GNSS, um sinal (portadora, taxa de chips, largura de banda, potência recebida ou intervalo de C/N0), um SISRE, um sigma de Doppler e um modelo de relógio; as predefinições preenchem apenas o que um cenário omite, um ficheiro cada, com fontes marcadas PUBLIC (com um URL), WORKSHOP ou DERIVED e os valores não publicados listados como representativos: Xona Pulsar X1/X5, Iridium STL, sinais de oportunidade Starlink, CentiSpace, um sistema representativo de banda C, o modelo de efemérides de relógio nulo ATOMIC e uma predefinição derivada de workshop no ficheiro opcional de predefinições Celeste IOD, retida ao apagar esse ficheiro e os seus cenários

# text
seg-dec52b5b9cd6 = Um sistema LEO-PNT de ponta a ponta: projeto de sinal, orçamento de ligação da passagem, mensagem de navegação e posicionamento fundido, com a saída de cada fase passada à seguinte

# text
# c1: leo-pnt-chain
seg-39443b31d418 = O tipo de cenário <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chips e a divisão de EIRP de uma banda leo-pass; a passagem dá o C/N0 da componente seguida e o jitter de código de banda limitada por época; uma reta de C/N0 por mínimos quadrados em sin(elevação), o SISRE da mensagem leo-navmsg (ajustado à órbita do satélite da passagem, mais um termo indicado de determinação de órbita em soma quadrática) e a portadora e a taxa de chips do projeto vão para cada sistema LEO de uma solução conjunta leo-pvt e, opcionalmente, para os casos LEO de leo-ppp; cada transferência é comunicada com o seu valor e unidade

# text
seg-55ca63edff02 = Deteção de spoofing por consistência do Doppler LEO e da geometria da passagem

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = A secção <c2/> do tipo de cenário <c1/>: um spoofer falsifica, de forma autoconsistente em distância e taxa de variação de distância, os sinais vistos numa posição declarada que salta e/ou é empurrada para longe da verdadeira após um início (por banda LEO e para o sinal GNSS MEO); o recetor prevê cada taxa de variação de distância a partir da órbita difundida e de uma posição e velocidade a priori independentes, e testa as taxas medidas com uma estatística qui-quadrado de mínimos quadrados generalizados sobre uma janela de épocas (deriva de relógio um incómodo ou com um prior), nos canais GNSS, nos canais LEO e em todos os canais, com ruído térmico da malha de bloqueio de frequência a partir do C/N0 (Kaplan & Hegarty { "2006" }, secção { "5.6.2" }); probabilidade de deteção a partir da lei qui-quadrado não central a uma probabilidade de falso alarme indicada, deteção declarada a uma probabilidade de deteção falhada indicada

# text
seg-5f341f85ac07 = Deteção de spoofing por consistência entre bandas de um sinal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO e par de bandas de medição de distâncias, a secção <c1/> forma a combinação de pseudodistâncias livre de geometria, remove o modelo ionosférico do recetor e testa o seu salto de época para época face ao ruído de código das duas bandas e a uma taxa ionosférica não modelada tolerada indicada (gaussiana bilateral, probabilidade de deteção exata); um spoofer que falsifica algumas bandas e não outras, ou todas as bandas sem a ionosfera, é visto no seu início; um que falsifica todas as bandas e simula a ionosfera não o é, o que o resultado indica

# text
seg-97dbcd5f2728 = Sondagem da ionosfera: TEC oblíquo a partir do atraso de dupla banda de uma passagem LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de um satélite <c1/>, o relatório dá o conteúdo eletrónico total oblíquo que a combinação de código livre de geometria recupera no pico da passagem, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), e o seu 1-sigma a partir do ruído térmico de código das duas bandas, pelo que qualquer projeto LEO-PNT multibanda pode ser avaliado como sondador ionosférico

# text
seg-1fdbb476c8ab = Pontuação de confiança marítima: a agregação da evidência dos monitores numa pontuação de 0-100 e as suas três bandas

# text
seg-0d76b33144f1 = Cada monitor reduz a sua evidência a uma razão entre estatística e limiar; a pontuação é { "100" } menos a soma, sobre os monitores, do peso vezes uma rampa linear limitada da razão ({ "0" } até { "0.5" }, { "1" } a { "1.5" }), limitada a { "0" } a { "100" } e arredondada a { "0.1" }, com bandas em { "90" } e { "55" }; cada época lista os monitores que deduziram e os seus pontos.

# text
seg-51640405c9b7 = Eventos SIEM da telemetria de confiança: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de mudança de banda (ou por época) como cargas Log Event Extended Format { "2.0" } num envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado.

# text
seg-c04042b0270a = Limiares de interferência de confiança do recetor calibrados no conjunto de dados JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: a calibração pré-registada dos monitores de queda de C/N0, AGC e indicador de jamming no conjunto de dados público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtido em tempo de execução, nunca incorporado): por pasta uma cronologia de { "1" } s de mon_rf.csv e rinex.csv, os monitores executados uma vez, cada época pós-calibração etiquetada como limpa ou de jamming a partir do attack_log da pasta (deslocado de CEST para UTC, guarda de { "60" } s), cada limiar varrido sobre uma grelha fixa, selecionado o menor limiar com probabilidade de falso alarme limpo agregada no máximo de { "0.01" }, e contagens reservadas de deixar uma pasta de fora; uma verificação cruzada do leitor UBX. A seleção só é fornecida como o perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); a regra por omissão e cada saída sem ele permanecem inalteradas

# text
seg-f839285852d9 = Volume de serviço lunar a partir de geometria de constelação real, obtida de fontes externas

# text
# c1: ephemeris_path
seg-c3059fcced49 = Aceita uma efeméride de estado tabelada, centrada na Lua (a avaliação de um kernel SPK/BSP), ou uma definição de constelação publicada através de <c1/>, executa contra ela o mesmo varrimento de cobertura / DOP / nível de proteção e emite o requisito de alcance σ_URE que daí decorre AO LADO dos resultados keplerianos e perturbados ilustrativos, que permanecem inalterados, com a diferença como grandeza própria e nomeada. Cada valor traz uma classe de proveniência que distingue o derivado de kernel do derivado de elementos publicados e do modelado, de modo que nunca possam ser confundidos numa citação posterior

# text
seg-36a6cfaf5afa = Unidade e proveniência declaradas para cada grandeza reportada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Um esquema legível por máquina que indica a unidade, a classe de proveniência e a definição de cada campo numérico de cada relatório de cenário, mais uma única barreira global que executa todos os tipos de cenário registados e falha se um campo numérico emitido não tiver uma das duas. O vocabulário de proveniência é fechado e cada classe tem um nível de evidência, com duas classes deliberadamente mapeadas para <c1/> e <c2/>, em vez de lhes ser atribuído um nível que a classe não determina

# text
seg-c815cb90dcde = Geodesia de estações de referência lunares: retrorrefletor e baliza VLBI acrescentados face ao datum de cinco matrizes

# text
seg-103cf21173ac = As entradas opcionais extra_reflectors e extra_beacons no cenário lunar-llr-datum acrescentam um bloco station_geodesy: a informação de Helmert das cinco matrizes a partir da fatia arquivada de medição laser lunar, mais a informação que um retrorrefletor acrescentado (medido nas épocas arquivadas de pontos normais em que a estação de medição está acima do horizonte, cada uma com o peso arquivado desse ponto normal) e uma baliza VLBI acrescentada (observada pela rede e pelo calendário da campanha do referencial lunar com as estações terrestres fixas, através das derivadas parciais de atraso de lunar-vlbi-fim) em locais indicados introduzem no datum de sete parâmetros, voltado a resolver, com o 1-sigma de cada parâmetro de Helmert antes e depois, a sua razão, as normas antes e depois e os valores próprios extremos da diferença de Fisher. Ausentes ou vazias, o relatório não se altera

# text
seg-44f582b17fa9 = Integridade da barreira — um verde que significa o que diz

# text
# c1: cargo test --all
seg-43fbcfbe990c = Três guardas estruturais sobre o próprio processo de verificação, cada uma a fechar uma classe de defeito que chegou à barreira canónica como um vermelho intermitente ou espúrio. ({ "1" }) Todo o caminho temporário construído nas fontes Rust tem de ter um componente único por chamada; um identificador de processo é rejeitado, porque o cargo executa os testes da biblioteca como fios paralelos de UM só processo e o pid é partilhado por todos eles. ({ "2" }) Todo o teste de fixação byte a byte ou de soma de controlo tem de declarar, junto de si ou no cabeçalho do seu módulo, o que cobre e o que deliberadamente exclui — para que uma alteração transversal permita ver de relance quais as fixações abrangidas e quais se tornaram, sem alarde, detetores de alterações de todo o repositório. ({ "3" }) Um verde só pode ser reclamado a partir da bateria COMPLETA: scripts/gate.sh executa <c1/>, captura o código de saída verdadeiro sem nenhum pipe pelo meio e escreve um recibo que nomeia o commit, o número de binários de integração, o número de testes e a duração; a verificação antes do push recusa um push cujo commit nenhum recibo válido nomeie, numa árvore limpa. A repetibilidade é amostrada em separado por scripts/check-repeatability.sh, que executa a bateria da biblioteca N vezes e falha se o conjunto de testes que passam diferir.

# text
seg-b7cd952ff133 = PL de temporização composto — atravessamento em holdover iniciado em P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); PL({ "0" }+)≥PL({ "0" }−) semicontínuo inferiormente; máximo corrente K(IR/2); expoentes de fase τ/τ³/τ⁵

# text
seg-096b6cdfe2dc = PL de temporização composto — envolvente LIL q.c. (impossibilidade + consistência)

# text
seg-1671add2210d = Não existe holdover finito no pior caso (o supremo browniano diverge); HPL atribuído por IR consistente com a envolvente de Hartman-Wintner quando IR→{ "0" }

# text
seg-5a27c9f0a67d = Sobrelimite de integridade do desvio de rastreabilidade UTC(k) heterogéneo

# text
seg-fd09ab2adbf6 = Sobrelimite do desvio por fonte b = (U/k_cov)·Phi^-1(1-tail/2) + envelhecimento, a inflar uma incerteza expandida de Tipo B publicada até uma cauda de integridade atribuída; liga-se a tpl_scalar como bias_s

# text
seg-d75b900ad25f = Covariância cruzada do desvio de rastreabilidade correlacionado (atribuição insegura em modo comum)

# text
seg-0641f6d38c23 = Covariância cruzada de desvios N×N com termos fora da diagonal rho·b_i·b_j para fontes que partilham um realizador UTC(k); PROVADO correlated_fused_bias >= independent_fused_bias (a atribuição independente ingénua subestima o limite do desvio fundido -> otimista -> insegura)

# text
seg-65a8361b4a22 = Pontuação do Jammertest: um registo de recetor pontuado por ensaio programado (latência de deteção, alarmes em falta, falsos alarmes, tempo de recuperação) face ao plano de ensaios publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): o catálogo de ensaios e o plano de transmissão da NPRA (MIT, obtidos com um SHA-256 fixado, nunca incorporados no repositório) lidos como verdade programada, com os identificadores do catálogo preservados; uma execução de receiver-trust pontuada por ensaio (primeiro alarme menos o início planeado, detetado/tardio/em falta face a uma tolerância, tempo até ao primeiro período sem alarmes, alarmes fora de todos os intervalos e da sua guarda), com um pacote de evidências assinado que transporta o quadro de pontuação. O calendário são intervalos planeados, não horas de emissão registadas

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): um mapeamento das saídas do Kshana para cláusulas de referenciais públicos apenas por número, preenchido a partir das execuções fornecidas; um resultado só conta para uma capacidade quando traz a evidência que o mapeamento nomeia, um conjunto vazio não evidencia nada, e a formulação é "fornece elementos de prova em apoio de"; o relatório não é uma conclusão de que algum referencial seja satisfeito nem uma classificação ou aprovação por quem quer que seja.

# text
seg-98c360d82d56 = Integrações marítimas: plugin Signal K, fluxo de barreira e painel de pontuação do OpenCPN, compilação de referência

# text
seg-7af9ce566646 = A pontuação de confiança, a banda, os motivos, o estado da barreira e a posição comunicada pelo recetor publicados em navigation.gnss.kshana num servidor Signal K com uma notificação de aviso, de alarme e normal (integrations/signalk); o fluxo NMEA com barreira, com a posição marcada como inválida enquanto a confiança está colapsada e uma frase PKSHT por ciclo, servido ao OpenCPN por TCP pela própria barreira ou por um pequeno retransmissor, e um painel nativo de pontuação do OpenCPN que lê a frase PKSHT (integrations/opencpn); e unidades systemd e um contentor que executam a barreira (deploy/reference-build). Onde estes mostram saída, trazem a declaração consultiva: Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
seg-89ab9ef155eb = Seguimento BOC({ "1,1" }): escala do DLL e resolução de ambiguidade bump-jump (opcional)

# text
seg-ef24be9b5917 = O campo boc de iq::track::LoopConfig (opcional, None por omissão): os três discriminadores do DLL reescalados para ler o erro de código em chips com declive unitário no pico principal do BOC({ "1,1" }) em seno, e um monitor bump-jump nos correladores muito adiantado e muito atrasado a meio período de subportadora ({ "0.5" } chip) que faz saltar o NCO de código para o pico principal quando um contador ascendente/descendente atinge N ({ "8" } por omissão). Sem a opção, todas as saídas permanecem inalteradas.

# text
seg-2c32955cbfb3 = Canal de cintilação ionosférica IQ (modelo de Cornell) face a cintilação GPS L1 medida a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, o modelo de cintilação de Cornell (intensidade de Rice, espectro de Butterworth de segunda ordem, fase arg z) conduzido com o S4 e o tempo de decorrelação da intensidade de uma janela medida, comparado naquilo que gera para além dessas duas entradas; realdata::scint50 lê o registo medido, retira-lhe a tendência e executa a comparação.

# text
seg-160507ac3702 = Opção CFAR de média de células na aquisição IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar e ca_cfar_cells (opcional): uma célula de uma grelha de aquisição é comparada com a média de células de referência da sua linha de Doppler (desfasamentos de guarda e de passo, a dar a volta ao período), com um fator alpha definido a partir da probabilidade de falso alarme CA-CFAR em forma fechada para M blocos não coerentes (ca_cfar_pfa, ca_cfar_alpha). O detetor de potência de amostra continua a ser o predefinido e todas as saídas existentes permanecem inalteradas.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou e Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resolve, apenas por nome (MORE_BAND_NAMES), GLONASS L1OF e L2OF em todos os canais FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a e B3I (BPSK({ "10" })) e Galileo E6 (BPSK({ "5" })), com as portadoras e as potências mínimas recebidas dos seus documentos de controlo de interface; o conjunto de bandas predefinido e todas as saídas existentes permanecem inalterados.

# text
seg-7b1ae0c7ca28 = Códigos terciários e camada de mensagens LunaNet AFS (SB1 BCH, CRC-24Q, entrelaçador) face à LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: padrão de sincronização, codificador SB1 BCH({ "51,8" }) e descodificador de 256 hipóteses, CRC-24Q, o entrelaçador de blocos de { "60" } x { "98" }, um verificador de fluxo de símbolos (kshana lunanet-afs-check) e um gerador de fluxo de teste com subtramas provisórias. A codificação LDPC de taxa 1/2 das subtramas { "2" } a { "4" } não está implementada (as suas matrizes estão num anexo separado).

# text
seg-0d7b17524c04 = Pacotes de normas: cenários pontuados face a limiares indicados antes da execução

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): os perfis de ensaio do referencial DHS Resilient PNT para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e os pacotes de monitorizar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }: cada ensaio executa um tipo de cenário incluído e compara campos de resultado com limiares indicados no pacote, e os ensaios que precisam de um registo de recetor ficam listados como NEEDS INPUT e não são pontuados.

# text
seg-8a8f2c85e0c3 = Pacote de evidências de ida e volta de laboratório (cenário, condições de ensaio, registo do recetor, pontuação)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) e a exportação do registo do recetor kshana.test-conditions/1 de kshana bench-export: um pacote assinado que regista a soma de controlo do cenário, a das condições indicadas, a do registo e a pontuação face aos eventos indicados, e que recusa condições que discordem dos eventos de pontuação ou um registo cuja soma de controlo não seja a indicada. Nenhum sinal é escrito, reproduzido nem programado.

# text
seg-a9189e4fe413 = Motor de seguimento IQ face ao GNSS-SDR { "0.0.19" } em gravações independentes

# text
seg-364de05e5b1b = O motor de seguimento completo da camada IQ (iq::track através de kshana iq track: passagem da aquisição, correladores, NCO, PLL Costas de segunda ordem a { "15" } Hz, DLL de envolvente EML de primeira ordem a { "2" } Hz assistido pela portadora, indicador de bloqueio e estimadores de C/N0) em GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-259d201c2ff8 = Ganhos de antena CRPA no tipo de cenário jamming face a um recálculo independente em numpy

# text
seg-192144c57783 = A secção opcional [crpa] do tipo de cenário jamming: um feixe por canal na direção de cada satélite (anulação direcionada com o jammer como nulo, ou MVDR em sigma^{ "2" } I + P_j a_j a_j^H), escalando o ruído de cada ligação por ||w||^{ "2" } e o jammer por |w^H a_j|^{ "2" } antes da equação de C/N0 anti-jam existente.

# text
seg-a2f34cff9338 = Sombra de terreno sobre o jammer no tipo de cenário jamming face a um recálculo independente em numpy numa tesela SRTM real

# text
seg-334c569d9cae = A secção opcional [terrain] do tipo de cenário jamming: o perfil de terreno em círculo máximo entre o jammer e o recetor numa tesela SRTM .hgt com uma curvatura da Terra de fator k, o gume de faca dominante (maior nu de Fresnel-Kirchhoff) e a perda de gume de faca único da ITU-R P.526-15 secção { "4.1" }, subtraída à potência recebida do jammer.

# text
seg-825c121c7512 = Histerese de aquisição e quantizador do front-end no tipo de cenário jamming face a recálculos independentes

# text
seg-f7207263d881 = A secção opcional [acquisition] do tipo de cenário jamming (um satélite é adquirido num limiar de aquisição ou acima dele após um atraso de reaquisição e mantido enquanto estiver no limiar de seguimento ou acima dele) e a secção [front_end] (a leitura do AGC { "10" } log10({ "1" } + J/N) e a perda do quantizador do ADC para entrada gaussiana retiradas de cada ligação, assinalada como não válida para jammers não gaussianos).

# text
seg-9c46f1c76486 = Captura inicial do FLL limitada abaixo do patamar de passagem de FLL para PLL do projeto predefinido (opcional)

# text
seg-efa1d1a9e904 = fll_pull_in_max_s opcional de iq::track (o campo fll_pull_in_max_s de iq::track::LoopConfig): com fll_assist = pull-in, o FLL passa o controlo ao PLL após um tempo fixo de captura inicial, seja qual for o PLI, com um tempo de permanência de regresso correspondente até o PLI atingir pela primeira vez fll_off_pli.

# text
seg-ac0f97e945a7 = Leitor de soluções .pos do RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lê um ficheiro de solução do RTKLIB (hora de calendário ou semana GPS/TOW, posição em latitude/longitude ou ECEF, satélites usados) para a cronologia de receiver-trust (receiver_trust::machines::rtklib).

# text
seg-849393517c04 = Registos NovAtel OEM7 ASCII e binários (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lê BESTPOS (posição), RANGE (C/No por sinal) e RXSTATUS (o indicador de jammer do recetor, como autorrelato da época) de registos OEM7 ASCII e binários, com CRC verificado, só de leitura (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = Leitor de relação portadora-ruído RTCM { "3" } MSM4 e MSM7 para receiver-trust

# text
seg-0a0c9976236f = Lê o C/N0 de cada célula de sinal das mensagens RTCM { "3" } MSM4 e MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de um fluxo de tramas, com CRC-24Q verificado (receiver_trust::machines::rtcm3). Disposições das tabelas pyrtcm de licença BSD, não do texto da norma RTCM.

# text
seg-cd554a7c1649 = Adaptador de monitor GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lê mensagens do Monitor do GNSS-SDR (Gnss_Synchro) e do monitor PVT, retransmitidas como linhas JSON com os nomes de campo do proto, para C/N0 por canal, posição, satélites usados, HDOP e céu (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = Ingestão de registos IMU, entrada de rumo por giroscópio e ajuste de Allan dos parâmetros de sensores híbridos

# text
seg-9dadc819daef = Lê um CSV de IMU (colunas documentadas ou a disposição EuRoC); integra a taxa de guinada no rumo que o monitor de rumo-trajetória lê ([log.imu]); e ajusta os parâmetros de ruído do acelerómetro e do giroscópio dos cenários híbridos e de fusão a partir de um registo estacionário por desvio de Allan sobreposto (imu-fit).

# text
seg-15a852a2dcb0 = Descoberta MQTT do Home Assistant e exportador de estado para telemetria de confiança

# text
seg-6d6b07b26966 = Um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant para o fluxo de confiança, impressos como texto em todas as superfícies e publicados por MQTT { "3.1.1" } QoS { "0" } pela CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-68caf86157c2 = Pacote receiver-trust para ROS { "2" } e ponte gnss_lib_py

# text
seg-e7d7d99fe538 = Uma ponte sem ROS que escreve mensagens de posição e de satélites como NMEA e as pontua através da ligação Python (integrations/ros2/kshana_trust), e uma ponte de NavData do gnss_lib_py para receiver-trust através do formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Testes
