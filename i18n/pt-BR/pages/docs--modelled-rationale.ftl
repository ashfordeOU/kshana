# docs--modelled-rationale: translations (pt-BR)

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Mapeamento de compliance para frameworks públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidade

# text
seg-60a43431ebe0 = Requisito

# text
seg-bde1b3a94a47 = Sombra de SRP com escurecimento de limbo solar (opcional)

# text
seg-eaaec545dd68 = Fração iluminada da SRP como a fração não ocultada do fluxo solar com escurecimento de limbo (lei de aproximação de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadratura de Gauss-Legendre) sobre uma Terra esférica ou WGS-84 (srp_shadow::limb_darkened_shadow, a variante OblateEarthLimbDarkened de ShadowModel)

# text
seg-9e15970435c3 = Sol e Lua da DE440 no modelo de forças de Cowell (opcional)

# text
seg-de6831cf7785 = Nível opcional de efemérides para os termos de terceiros corpos e de SRP do ForceModel numérico de Cowell: o Sol e a Lua geocêntricos de qualquer EphemerisProvider (um kernel SPK DE440 por meio de KernelEphemeris) em TDB = TT + (TDB - TT), recusando um provedor que não consiga atender à época e contando qualquer recurso à série analítica; desativado por padrão

# text
seg-057c21daf4f2 = Maré atmosférica S1 (opcional)

# text
seg-f600a39f297e = A maré diurna S1 de pressão do ar como perturbação do geopotencial: modelo N1 de Biancale e Bode ({ "2006" }), graus { "2" } a { "6" }, pela fórmula de carga da Eq. { "6.21" } do IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional nos modelos de forças de Cowell e preciso (air_tide_s1, desativado por padrão)

# text
seg-e8f5ff8c9149 = Gravidade por harmônicos esféricos de alto grau (EGM2008 até { "2190" })

# text
seg-d3b2f32dcecb = Avaliação, sem underflow e sem singularidade nos polos, de um campo totalmente normalizado até o grau { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, coluna direta modificada de Holmes-Featherstone { "2002" } com o gradiente livre de 1/cos phi), um carregador ICGEM .gfc em fluxo (from_gfc_file / from_gfc_reader; o EGM2008 completo é obtido em tempo de execução, não incluído no pacote) e o avaliador de Holmes-Featherstone selecionável no Geopotential de Cowell opcional

# text
seg-1960804ef2f4 = Determinação de órbita em lote com distância, taxa de distância e az/el, com máscara de estação

# text
seg-4c185244bc66 = Recuperar um estado de época a partir de rastreamento misto de distância, taxa de distância e azimute/elevação acima de uma máscara de elevação, por Gauss-Newton sobre H = (dh/dx(t)) Phi(t, t0): derivadas parciais analíticas das medições e uma matriz de transição de estado variacional com derivadas parciais analíticas de dois corpos + J2 (integrada por RK4, não uma STM em forma fechada)

# text
seg-bc3d1ee7c639 = Ponderação das observações por código de acurácia do SP3

# text
seg-63b1fab84f85 = Mapear os códigos de acurácia do SP3 (expoentes ++ do cabeçalho em { "2" }^n mm, a base %f, desvios-padrão base^n mm por registro) para sigmas de posição por observação para o motor de determinação precisa de órbita (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Associar um campo gravitacional publicado a um corpo

# text
seg-ffb2b20e5f32 = with_gravity_field (em Body, em src/gravity_pds.rs): associa qualquer campo de harmônicos esféricos carregado (por exemplo GMM-3 ou GL0660B) a um Body para que o propagador o avalie fixo ao corpo; opcional, corpos padrão inalterados

# text
seg-9762cf428435 = Codificadores de mensagens de navegação além do GPS LNAV (GPS CNAV, Galileo I/NAV e F/NAV)

# text
seg-9b703b9607d8 = Tipos de mensagem GPS CNAV 10/11/30, tipos de palavra Galileo I/NAV 1-5 em páginas pares/ímpares nominais e tipos de página Galileo F/NAV 1-4: empacotamento e quantização dos campos do ICD, CRC-24Q, codificação convolucional de taxa 1/2 K={ "7" } (G2 invertido para o Galileo), entrelaçamento em blocos e padrões de sincronização, com decodificadores de teste correspondentes

# text
seg-974d8c1f7876 = Suavização do código pela portadora de Hatch em observações RINEX reais

# text
seg-f26b5da0f52e = Filtro de Hatch sem divergência (código livre de ionosfera conduzido pela portadora livre de ionosfera, janela de N épocas, reinício em caso de perda de travamento, salto livre de geometria ou lacuna) na montagem de posicionamento pontual preciso

# text
seg-278ca396127a = Leitura de arquivos de observação RINEX { "4" }

# text
seg-e0883aa933eb = Cabeçalhos de observação RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; rótulos identificados nas colunas 61-80 para a versão { "4" } e posteriores) e registros de época

# text
seg-33e5c74720ff = Posição de satélite GEO do BeiDou pelas efemérides de transmissão

# text
seg-44b61449b65a = Posição de satélite geoestacionário segundo BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de efemérides de transmissão (referencial quase inercial, depois Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional por meio do campo include_beidou_geo de NavParseOptions, de modo que o leitor padrão continua ignorando os GEOs

# text
seg-71f48628ebb2 = GNSS/INS fortemente acoplado por fase da portadora com ambiguidades float

# text
seg-5a156aa81275 = EKF de estado de erro sobre { "15" } estados do INS, um relógio de receptor de dois estados e uma ambiguidade float de portadora por satélite rastreado; pseudodistância, fase da portadora e taxa de distância opcional a partir de uma constelação Walker SGP4 (tempo de luz e Sagnac), correções de Klobuchar e Saastamoinen/Niell aplicadas no laço na posição do próprio filtro; detecção de saltos por portadora diferenciada no tempo com um limiar por satélite ampliado pela incerteza de velocidade; reinicialização de ambiguidade em saltos e na readquirição

# text
seg-7d644516b1ec = Pacotes GNSS/INS marítimo, ferroviário e de aviação com opção de acoplamento forte

# text
seg-cbb03a8baf73 = Três cenários gnss-ins sobre a biblioteca de trajetórias (uma embarcação que serpenteia a { "8" } m/s com uma interrupção de cinco minutos; um trem que passa por um corte com dois satélites e por um túnel; uma aeronave cuja interrupção cobre uma curva inclinada de 25 graus) e a tabela opcional [tight] do pacote: pseudodistâncias de uma constelação Walker SGP4 fundidas pelo navegador de malha fechada, com todos os satélites acima da máscara quando nominal e os poucos mais altos quando degradado

# text
seg-f4dab73c4eda = Filtro PNT de pseudodistância acoplado com estado de viés e extensão 3-D no pacote de fusão

# text
seg-742b60089361 = Um único filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio, alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que carregam a covariância cruzada); uma variante de 1 grau de liberdade ampliada com um estado de viés constante do acelerômetro, que o pacote de fusão executa sob [coupled]; e a versão 3-D de 8 estados com linhas de linha de visada

# text
seg-2db2b9dc3b45 = Biblioteca de trajetórias GNSS/INS e importação de verdade em CSV

# text
seg-e1fe83c75a6c = Perfis de movimento selecionáveis para o pacote gnss-ins (reta, figure-8, urbano com para-e-anda, subida e curva coordenada de aeronave, drone de levantamento), definidos por comandos de taxa de Euler e de aceleração ao longo da trajetória fechados sobre o estado verdadeiro com a IMU cinemática (termos centrípeto, gravitacional e de Coriolis), e verdade em CSV importada convertida na IMU que a reproduz; o percurso histórico inalterado quando nenhum perfil é dado

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } do CR3BP Terra-Lua em comparação com a órbita que o CAPSTONE voou

# text
seg-d4127cf241f3 = A órbita de halo quase retilínea sul L2 { "9" }:{ "2" } do problema circular restrito, que cr3bp::differential_correct_halo corrige (a família de órbitas do Gateway e do CAPSTONE), comparada, quanto à geometria média (período, raio de periluna, raio de apoluna), com a órbita que o CAPSTONE realmente voou. Uma medição de quão bem o membro do CR3BP descreve a órbita real; uma órbita do CR3BP não é uma órbita de modelo de efemérides e não é comparada época a época

# text
seg-1a5623c81b48 = Erro de posição a partir da geometria: erro RMS = sigma_UERE x DOP para a solução de mínimos quadrados do motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry e check: uma simulação de Monte Carlo com semente (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da própria solução iterada de mínimos quadrados do motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) nas { "8" } geometrias de tests/fixtures/dop/dop_reference.csv, comparando as variâncias do erro leste, norte, vertical e do relógio, o RMS H/V/P, a correlação leste-norte, os erros médios e a fração dentro da elipse horizontal de { "95" } % com sigma^{ "2" } Q, em que Q é o fator de covariância do kernel orbit::dop (orbit::dop_cofactor, a mesma aritmética) sobre a mesma geometria

# text
seg-9acfde1b57f7 = Classificação de confiança sensível à geometria: geometria de satélites ao lado da pontuação de confiança do receptor e uma classe em cada dedução

# text
seg-6138c41e13ff = receiver_trust::geometry: geometria de satélites por época (boa, degradada com os motivos few-satellites/high-pdop/high-hdop/sky-blocked, ou desconhecida quando o registro não traz GSV, NAV-SAT nem GSA) derivada das elevações e azimutes informados por orbit::dop ou tomada do GSA, com um rótulo sempre informado e nunca pontuado (good, fair, poor, unknown) e o HDOP, o PDOP, o VDOP, a contagem de satélites e a perda de sinal em palavras; um monitor de geometria da pontuação da embarcação que não deduz nada a menos que a geometria seja ruim (razão max(hdop/4, pdop/6, 5/n_used) acima de { "1" }), depois cresce em rampa até um teto de { "15" } pontos em { "1.5" } que a geometria sozinha não pode levar abaixo da faixa degradada (teto, fim da rampa e piso em [geometry]; sem alarme); uma classe em cada dedução (geometry, environment, inconsistency), com perda de travamento em satélites abaixo de { "15" } graus classificada como geometry, satélites à vista mas não rastreados classificados como environment, e uma dedução de geometria ruim cujo HDOP declarado esteja além de max({ "1.0" }, { "25" } % do HDOP derivado) do céu declarado classificada como inconsistency

# text
seg-bbb1828b3db1 = Reduções de cânion urbano, setor e terreno a uma tabela

# text
seg-2864aec7be88 = skyline: o cânion urbano em forma fechada (corte atan((h - a) / d) com d = (w/2) / abs(sin(az - s)), extremidades abertas para um comprimento finito), setores de bordas nítidas em sentido horário com retorno, e pontos de terreno reduzidos a uma tabela com a queda por curvatura d^2/({ "2" } * 4/3 R); o horizonte é o máximo ponto a ponto entre eles e qualquer tabela

# text
seg-3f3d657854ce = Predefinições de horizonte (rua urbana, aproximação portuária, fiorde, terminal de contêineres)

# text
seg-6012113b4836 = Funções de geometria do céu: visibilidade, DOP, covariância, elipse de erro, nuvem de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> e <c2/>, funções Python e WASM de mesmos nomes, MCP <c3/>): a partir de um local, um instante e predefinições de constelação (ou satélites como azimute/elevação ou ECEF), os satélites visíveis e mascarados sob um horizonte, GDOP/PDOP/HDOP/VDOP/TDOP, o cofator de variância unitária (H^T H)^-1 e a covariância em leste-norte-cima com um relógio de receptor por sistema ou um comum, a elipse de erro horizontal (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientação { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) a partir do norte) e n erros de mínimos quadrados com semente sob erros de distância gaussianos independentes, com sua covariância empírica, RMS e contenção de { "95" } %. O cofator é orbit::cofactor_from_los, o único kernel por trás de orbit::dop e orbit::dop_cov (dop é a redução de dop_cov): nenhuma segunda implementação de DOP

# text
seg-7f66be0f15c8 = Holdover do relógio sem GNSS

# text
seg-4d8f87668a0f = Crescimento do erro em deriva em forma fechada + holdover até o limiar; classes de relógio quântico

# text
seg-29b482d88916 = Cartões de dispositivo de relógio medidos (previsão com dados reservados)

# text
seg-8c68c5b25004 = clock_library: um cartão de dispositivo (ruído branco de fase, FM branco, de cintilação e de passeio aleatório mais uma deriva linear de frequência) ajustado a um terço de um registro de relógio medido nomeado após uma passagem de condicionamento registrada (lacunas, valores atípicos de fase, saltos de fase e rajadas removidos; saltos de frequência registrados), ponderado pelos graus de liberdade dos tipos de ruído identificados por lag-1, e seu desvio de Allan previsto avaliado sobre os dois terços reservados; leitores de arquivos de relógio RINEX e IGS, arquivos por laboratório do BIPM e da Seção { "1" } da Circular T; conversão de um cartão para o modelo de ruído de temporização de slots, o modelo de relógio de filtro de Kalman estendido e os níveis de ruído do monitor de spoofing

# text
seg-5097a0e6460d = Cartões de relógio medidos de GPS Bloco IIF com termos por revolução (previsão com dados reservados)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: um cartão de dispositivo que traz os termos de fase de uma a quatro por revolução (período T/k, T = { "43 082.05" } s), ajustados conjuntamente com a quadrática por mínimos quadrados sobre um terço de um registro medido de relógio de satélite, com a contribuição de Allan em forma fechada de cada termo { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } no desvio de Allan previsto

# text
seg-0d72fcc0fbea = Estimação do estado do relógio de bordo

# text
seg-6db5391f8ebe = Relógio de Kalman de 3 estados (fase/frequência/deriva) de Van-Loan, estabilizado por Joseph

# text
seg-3f0a9d7c2971 = Orçamento de erro da transferência de tempo

# text
seg-216f46b43860 = Bidirecional/TWSTFT (Sagnac), visada comum GNSS, PPP; jitter do enlace→distância

# text
seg-157fadeb5d67 = Modulação de sinal de navegação e análise de rastreamento de código

# text
seg-ab633d191396 = PSD de BPSK-R/BOC, separação espectral κ, largura de banda de Gabor, jitter do DLL, multicaminho

# text
seg-e6c08e1e6ae3 = Desempenho de sensores inerciais quânticos

# text
seg-d28e1f6a430f = Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Ambiguidade de franja / faixa dinâmica de sensor inercial quântico

# text
seg-deb2850546d5 = Faixa dinâmica de ambiguidade de franja de Mach–Zehnder: a leitura de franja periódica em 2π fixa uma força específica máxima não ambígua a_max=π/(k_eff·T²), e a faixa não ambígua em células de resolução a_max/σ_a=π/σ_Φ é independente do fator de escala óptico — o ganho de sensibilidade em T² custa faixa não ambígua em exata proporção (o tempo de interrogação troca resolução por faixa, deixando o número de células fixado pelo ruído de fase da leitura)

# text
seg-d04bf321d4a1 = Resiliência de navegação inercial quântica por estima

# text
seg-c4989abb5d40 = Orçamento composto de posição com viés + fator de escala + VRW + decaimento de estabilidade em holdover

# text
seg-5692c7b936b6 = Resiliência a jamming sem GNSS

# text
seg-f4ff77caa47b = Orçamento de enlace J/S geométrico, C/N₀ anti-jam, perda de travamento por satélite

# text
seg-ff90679d1de9 = Detecção de spoofing

# text
seg-b843f63e77e6 = χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos em uma figura de mérito de segurança por época

# text
seg-b10d07921f5e = Nível de proteção de temporização sob spoofing

# text
seg-2a829711b997 = Limite em forma fechada do erro de tempo não detectado no pior caso = piso do monitor + σ de deriva do oscilador sobre a latência de detecção do CUSUM, informado como uma faixa de piso de ruído vermelho

# text
seg-f1d49eac89f8 = PNT alternativo / complementar

# text
seg-023dda973f66 = Correspondência com mapa gravitacional, referenciado ao terreno (TERCOM/SITAN), anomalia magnética

# text
seg-791e7285c291 = Reprodutibilidade e garantia de software

# text
seg-7177355a482c = Determinístico, com hash de cenário, SBOM + portões golden multiplataforma

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético rotulado de degradações + arcabouço de ROC/AUC/confusão/Pfa-Pmd agnóstico ao detector; proteção contra vazamento, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro vs fora do regime). Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudo sintético controlado da lacuna de otimismo de AUC entre distribuição interna→externa em detectores de métodos publicados e aprendidos (regressão logística / MLP de uma camada oculta): tendências de lei de escala por classe (ρ de Spearman + inclinação em { "1" }−severidade) e um preditor de crista somente com ID que estima a lacuna apenas a partir de diagnósticos da distribuição interna, avaliado deixando um detector de fora e deixando uma classe de fora. Reproduzível por meio de <c1/>

# text
seg-fd6424213d1f = Compromisso PNT quântico vs clássico e resiliência sem GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestão de ADEV medida (NNLS), tabela de compromisso (holdover de temporização/inercial + benefício), envelope de resiliência por tempo; a ressalva do piso é carregada no artefato. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Ambiente de clima espacial e densidade termosférica dirigida pela atividade

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfis de difusão estáticos que reproduzem sua Tabela { "7" }, com as variações diurna, geomagnética, semianual, sazonal-latitudinal e do hélio) contra a atmosfera estática USSA76. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/space-weather.toml)

# text
seg-c76b8c395ef0 = Janela de lançamento e geometria de ascensão (análise de missão)

# text
# c1: launch-window
seg-6066c634faba = Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bônus de rotação da Terra para leste, Δv de mudança de plano em dogleg e oportunidades diárias e, dados uma época e linhas IERS finals2000A, a velocidade do local em torno do polo verdadeiro (launch::site_rotation_speed_at). Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Desaceleração de pico (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento de pico para uma entrada balística em atmosfera exponencial. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/reentry.toml)

# text
seg-7b4a8e25c3c9 = Codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de enlace de descida em LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 do enlace de descida ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda no espaço livre, perda atmosférica pela lei da cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que supera o limiar de quase ausência de erros da Tabela { "13" } do ETSI EN { "302" } 307-1 V1.4.1 mais uma margem de implementação em cada passo, o volume de dados ACM da passagem e a linha de base de codificação constante que fecha na máscara e na maior distância. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-19603a7e0fe8 = Escalonamento de contatos com o solo de vários satélites e várias estações com resolução de conflitos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contatos candidatos a partir de cada passagem satélite-estação com seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro de seu tempo de reposicionamento ou um satélite faria o downlink para duas estações ao mesmo tempo; um objetivo de entrega ponderado por prioridade limitado ao atraso acumulado de cada satélite; um plano guloso de valor marginal preguiçoso, uma linha de base de primeiro a chegar e um branch and bound exato com até { "26" } candidatos, com a lacuna de otimalidade do guloso informada. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-3742d2aea62a = Enquadramento frugal de custo por cobertura / ROI

# text
seg-4228311689f8 = Custo por ponto percentual de cobertura + ROI de cobertura por euro sobre o motor de dimensionamento de constelação; o custo por satélite é uma faixa baixo/nominal/alto fornecida pelo chamador (sem preços fabricados)

# text
seg-8ba6ee9acc8a = Impacto de integridade de detecção perdida (HPL/VPL sensível ao contexto contra limite de alerta)

# text
seg-f5985399d0d5 = Mapeia um viés de spoofing/jamming não detectado em erro efetivo → região de Stanford (disponível/indisponível/MI/HMI) contra HAL/VAL específicos do contexto (céu aberto vs urbano)

# text
seg-37d43b5b918a = Folha de parâmetros de modelo de erro citados do CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Desempenho delimitado (melhor/nominal/conservador) de interferômetro de átomos frios — instabilidade de viés, passeio aleatório de velocidade/ângulo, estabilidade do fator de escala, taxa de amostragem limitada pela interrogação, faixa dinâmica de ambiguidade de franja — cada um rastreável por citação; alimenta o QuantumNavBudget sem modelar hardware

# text
seg-c93f2d3a3167 = Benchmark de aderência à norma de integridade de temporização — classificador de épocas do diagrama de integridade de Stanford

# text
seg-712d5c35a6a6 = Classificação de épocas do diagrama de integridade de Stanford do TIB (nominal / indisponível / MI / HMI)

# text
seg-573aa0193cb3 = Benchmark de aderência à norma de integridade de temporização — pontuador de cobertura de integridade

# text
seg-4d86f3c2d8f5 = Pontuação de cobertura de integridade do TIB (taxas de HMI/MI/disponibilidade + veredicto de cobertura do overbound)

# text
seg-372dd0fdb025 = Benchmark de aderência à norma de integridade de temporização — catálogo de falhas (geradores paramétricos)

# text
seg-2604e7cf27d2 = Menu de falhas do TIB (divergência de domínio, clock-slam, deriva em holdover, atraso estático/incremental/simétrico/assimétrico, replay dentro da validade, seletivo por caminho, quórum k-de-N)

# text
seg-90c0eb1e7c14 = Benchmark de aderência à norma de integridade de temporização — veredicto de absorção do indetectável

# text
seg-f713acf042ff = Veredicto de absorção do indetectável do TIB (simétrico/replay devem ser absorvidos pelo PL, nunca informados como detectados)

# text
seg-8adbbd2cdb74 = Autodescrição do relatório híbrido óptico/RF

# text
seg-2a5e48b558e1 = O relatório hybrid-optical-rf declara a configuração de enlace em que de fato foi executado (comprimento de onda da portadora, abertura de transmissão e de recepção, distância, largura de pulso, tempo de integração, eficiências e perdas, padrões resolvidos) e traz um bloco de unidades que dá a unidade e a classe de procedência de cada grandeza que um artigo provavelmente citará, incluindo os traços de covariância da transferência em metros quadrados

# text
seg-0691f3dee8cb = Disponibilidade do enlace híbrido óptico/RF no lado de RF

# text
seg-72ccb655caf0 = O relatório hybrid-optical-rf declara uma disponibilidade do enlace de RF, composta a partir de grandezas que o motor já calcula, e não de uma climatologia importada, e declara a composição como uma regra nomeada: A_rf = I_closure * I_track, em que I_closure é o veredicto de fechamento do orçamento de enlace unidirecional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margem de Eb/N0 >= { "0" }) na distância do próprio cenário e I_track é o veredicto do laço de rastreamento (jamming::lock_status) sobre o C/N0 que esse MESMO orçamento retornou. Cada fator leva a classe de procedência de sua entrada até a saída, e os fatores deliberadamente NÃO incluídos no produto -- visibilidade geométrica, negação por interferência e uma climatologia de interrupção de RF -- são nomeados com o motivo, em vez de silenciosamente definidos como { "1" }. O trecho de RF resolvido é ecoado como seu próprio bloco rf_link_configuration, e os números contínuos ao lado do indicador (margem do enlace, margem de C/N0, as distâncias de fechamento e de rastreamento em forma fechada e a utilização da distância) são as inversões de distância do mesmo orçamento. O relatório declara por completo, no bloco e na entrada de unidades em que o leitor chega, que este número é LIMITADO POR MARGEM/GEOMETRIA e DETERMINÍSTICO, enquanto a disponibilidade óptica é LIMITADA POR CLIMA/CLIMATOLOGIA e probabilística, de modo que os dois nunca podem ser citados como um par comparável de porcentagens

# text
seg-22c5df9b6c7c = Comparação de ranging óptico versus RF em condições iguais

# text
seg-70eb396f40af = O relatório hybrid-optical-rf emite a razão de ranging óptico versus RF com a ÚNICA configuração em que ambos os trechos foram avaliados contida no mesmo objeto: o mesmo percurso unidirecional, a mesma distância e o mesmo tempo de acumulação. O trecho óptico é o CRLB de ToA limitado por fótons do motor sobre a contagem de fótons unidirecional; o trecho de RF é o jitter térmico de rastreamento de código early-late do DLL do motor no C/N0 que o próprio orçamento de enlace do motor retorna para essa mesma distância unidirecional. A largura de banda de ruído do laço é derivada, não escolhida: B_L = 1/({ "2" }*integration_s) coloca o trecho de RF exatamente no tempo de acumulação óptico, e se um chamador a substitui de modo que os dois tempos de média discordem, a razão é REFUSED -- nula, com a divergência e ambos os tempos nomeados -- em vez de citada em dois pontos de operação. Nenhuma razão é formada contra o rf_position_sigma_m paramétrico ESCOLHIDO do cenário, e a recusa diz por quê: essa entrada não traz nenhuma configuração. O resultado principal óptico bidirecional liberado e o fator exato que o liga ao trecho de comparação unidirecional são emitidos ao lado da razão, de modo que o relatório não pode ser lido como se trouxesse dois sigmas ópticos discordantes

# text
seg-3f26f598e013 = Autodescrição do relatório de orçamento de enlace

# text
seg-b88bf41d6d4c = O relatório de orçamento de enlace declara toda constante absoluta a partir da qual sua própria margem foi calculada -- a frequência da portadora usada na perda no espaço livre, o EIRP, a figura de mérito, a perda agrupada e o termo de Boltzmann -- mais o G/T requerido em que a margem é zero, a constante de enlace (EIRP - perdas - Eb/N0 requerido), que é a única combinação que uma tabela publicada de taxa/ganho pode fixar, e, quando um chamador declara uma temperatura de ruído do sistema, o ganho da antena receptora que essa figura de mérito implica

# text
seg-a7b192e27cb5 = Tabela de cruzamento de tempo lunar por classe de relógio

# text
seg-cab605dc6ea2 = Uma execução do orçamento de tempo lunar emite uma linha de cruzamento relógio-vs-referencial por classe de relógio contra um único termo de referencial compartilhado, de modo que o relógio é a única variável na comparação; cada linha traz o cruzamento alcançado de duas maneiras -- por bisseção a partir da curva geral de erro de tempo em lei de potência e invertido algebricamente a partir do tipo de ruído dominante da linha -- com a diferença relativa entre elas

# text
seg-18c72a7565d6 = Pegada de captura contra altitude e largura de feixe

# text
seg-9c30a0ab5233 = Varredura de dois eixos da pegada de captura de superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de operação com a largura de feixe de meia potência que cada diâmetro implica, e a captura do limbo informada como um LIMIAR -- por linha, o J/S do limbo, sua margem e a potência de transmissão que o fecharia; por grade, os cruzamentos localizados, ou uma declaração explícita de que o limbo não é alcançado em lugar nenhum da grade, com o déficit

# text
seg-fc0a64b9a280 = Reprodutibilidade do orçamento de erro de tempo lunar

# text
seg-5d5970506b9c = O cenário lunar-time-budget publica suas saídas em forma de arranjo como uma tabela em formato longo (índice da grade, tempo de média, termo) ao lado do relatório, de modo que as sete curvas x(tau) por termo e o total de raiz da soma dos quadrados são saída do motor e não algo que o leitor reconstrói a partir da seção de método

# text
seg-675887733454 = Laboratório de tempo de estação lunar: holdover do miniRAFS contra o LTC

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Atraso de VLBI de campo próximo para uma linha de base na Terra observando um farol lunar + derivadas parciais

# text
seg-e08e98908f3a = GNSS da Terra à distância lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Recepção de GNSS da Terra à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época, calcula o ângulo fora do eixo em relação ao nadir do transmissor, se a Terra oculta o caminho reto, a distância oblíqua e sua perda no espaço livre, o ganho de transmissão nesse ângulo, a potência recebida e a densidade de portadora sobre ruído; depois agrega apenas os enlaces que superam um limiar de rastreamento e varre uma revolução completa da constelação, de modo que a resposta é uma DISTRIBUIÇÃO e não um único instantâneo. Três fatos determinam o resultado e o relatório declara cada um: a Terra subtende { "13.90" } graus a partir do raio da constelação, de modo que o PICO do feixe é geometricamente indisponível a qualquer raio dirigido à Lua; o que resta é a borda do lóbulo principal e os lóbulos laterais, o regime em que o LuGRE operou na Lua em { "2025" }; e a perda de percurso em L1 é de cerca de { "208" } dB, uns { "25" } dB a mais do que um usuário terrestre paga. MEDIDO na geometria incluída de 24 satélites de classe GPS ao longo de { "64" } épocas de um período orbital: disponibilidade de SINAL { "0.375" } com um melhor enlace de { "30.93" } dB-Hz, e disponibilidade de SOLUÇÃO { "0.000" } - no máximo dois enlaces rastreáveis simultâneos, nunca os quatro de que uma posição precisa. A separação dessas duas disponibilidades é o ponto central, e o relatório se recusa a deixar que sejam confundidas: o GNSS da Terra à distância lunar é uma camada de classe de TEMPORIZAÇÃO, não de classe de posição, e um a priori de resiliência em camadas deve tomar a disponibilidade de solução. O condicionamento é emitido pela mesma razão - todo satélite visível fica dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas por construção. Executável como o tipo de cenário <c1/> Reformulado segundo D7: a afirmação à distância lunar é a densidade de portadora sobre ruído RELATIVA entre satélites em uma época, a partir de diagramas bidimensionais de transmissão medidos (NAVCEN Block IIR/IIR-M), mais visibilidade geométrica; o C/N0 absoluto não é afirmado (Parker et al. relatam uma perda comum de { "7" } a { "12" } dB).

# text
seg-29df5b40a3f9 = Determinação de órbita lunar: GNSS da Terra contra radiométrico em solo

# text
seg-647902ebcee3 = Determinação de órbita em uma órbita de halo quase retilínea (ou em uma órbita elíptica congelada) a partir de dois tipos de dados independentes: pseudodistâncias do GNSS da Terra recebidas a bordo (a regra de enlace da linha de GNSS da Terra à distância lunar, mais a ocultação pela Lua) e distância e taxa de distância bidirecionais em solo de três estações da Deep Space Network. Cada uma é um ajuste de mínimos quadrados em lote de um passo em torno da órbita de referência, com sua covariância formal; uma simulação de Monte Carlo com semente da diferença entre as duas estimativas testa se as duas covariâncias a explicam (q = d' (P_G + P_R)^-1 d, qui-quadrado com seis graus de liberdade quando os modelos coincidem) e o que uma aceleração não modelada faz com a estatística.

# text
seg-652bdc29deea = Resolução de ambiguidade de fase da portadora lunar: superfície e orbitador

# text
seg-02496f9e9af2 = Fase da portadora e código do GNSS da Terra em diferença simples entre receptores em uma estação de superfície lunar e em um orbitador, com a diferença de relógio por época eliminada por perfilamento, uma ambiguidade por passagem contínua e a passagem mais longa como gauge. A covariância da ambiguidade float é um complemento de Schur; o LAMBDA resolve os inteiros, a taxa por bootstrap é informada ao lado de uma taxa de sucesso de mínimos quadrados inteiros por Monte Carlo com semente e dos sigmas de posição float e fixa. Informado como encontrado: com os { "12" } dBi registrados, o problema de dupla diferença não é formável (a emenda { "1" } moveu o padrão para { "25" } dBi depois que apenas contagens de disponibilidade foram vistas), e com { "25" } dBi a fixação de inteiros NÃO é alcançada - fora de alcance (alguns por cento no máximo), embora a solução float melhore com o arco.

# text
seg-11dd1bb8e4e1 = Co-estimação do referencial lunar: estações de superfície e orbitadores

# text
seg-a38c8d95e6c9 = Informação de Fisher do datum do referencial lunar de sete parâmetros a partir de telemetria a laser de estações da Terra para os cinco refletores isoladamente e com distâncias de orbitador a estação de superfície adicionadas: a matriz de informação, o posto, os sigmas de Cramer-Rao, a métrica de degenerescência do módulo de identificabilidade lunar e conjuntos aleatórios de estações com semente. A órbita é mantida conhecida nos eixos lunares (seu erro é carregado pelo sigma de distância do orbitador).

# text
seg-862977c4bb01 = Precisão do vínculo espacial de referenciais: GNSS, VLBI e telemetria a laser colocalizados

# text
seg-a9ae8e99f00d = Precisão de Cramer-Rao dos deslocamentos de translação, escala e rotação entre técnicas dos referenciais de GNSS, VLBI e telemetria a laser quando uma espaçonave carrega as três, com a posição da espaçonave eliminada em cada época e nove parâmetros de perturbação de vínculo local com um a priori, varridos sobre a acurácia do vínculo local. Covariâncias pela via da raiz quadrada (as equações normais perdem os dígitos quando as técnicas são quase perfeitas).

# text
seg-ae627996875e = Sensibilidade a números de Love lunares e à libração

# text
seg-28780d07c4a7 = Informação de Fisher de h2, k2, l2 e das amplitudes de libração física a partir de telemetria a laser (deslocamento de maré radial e horizontal, rotação do refletor), rastreamento de orbitador (a aceleração de k2 de grau 2 integrada ao longo da linha de visada, tendência removida), um gravímetro de superfície (fator gravimétrico { "1" } + h2 - { "1.5" } k2) e um relógio de superfície (taxa fracionária ({ "1" } + k2 - h2) W2/c2, vinculada às constantes de tempo lunar). Os valores nominais de h2 e l2 são pontos de linearização; o estudo diz o que é sensível a quê, não quais são os números.

# text
seg-da712b740519 = Aumento de DOP por faróis de superfície lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Diluição de precisão aumentada por faróis para um usuário na superfície lunar: as linhas de linha de visada dos satélites visíveis e as linhas de distância dos faróis de superfície visíveis são concatenadas em uma única matriz de projeto e avaliadas pelo kernel de DOP compartilhado, e o DOP resultante é mapeado em uma acurácia de 1 sigma realizada EM METROS por meio de um erro equivalente de distância do usuário por farol, montado como a raiz da soma dos quadrados dos termos de sincronização de relógio, multicaminho e levantamento. A visibilidade dos faróis é o horizonte geométrico de duas alturas da Lua sem atmosfera, que não tem extensão refrativa e é, portanto, exato e não aproximado. Executável como o tipo de cenário <c1/>, que informa só satélites, satélites mais faróis e uma constelação maior como a rota concorrente para a mesma geometria. MEDIDO na geometria de referência incluída (usuário a -80 graus, três faróis levantados, LCNS ilustrativo de seis satélites em t={ "0" }, máscara de { "5" } graus): { "5" } satélites visíveis dão PDOP { "9.6941" } e um 1-sigma 3-D de { "11.222" } m; somar os faróis que de fato superam o horizonte dá PDOP { "4.1160" } e { "4.765" } m, um fator de { "2.355" }; o serviço de 24 satélites dá, em vez disso, PDOP { "2.4226" } e { "2.804" } m, um fator de { "4.002" }. O relatório imprime a contagem de faróis VISÍVEIS em vez da configurada, e nesta geometria apenas UM dos três faróis supera o horizonte: os dois locais laterais ficam a cerca de { "333" } km do usuário contra um horizonte de { "86" } km para uma antena de { "2" } m, de modo que o leitor nunca fica a supor que os três contribuíram

# text
seg-845e9f5eec81 = Nível de proteção de modo comum e envelope total de integridade

# text
seg-e4ec41d0f5e1 = Observabilidade absoluta de estações lunares (defeito de datum)

# text
seg-b3e4160042d2 = Observabilidade, pela informação de Fisher, da solução lunar conjunta: sem linhas de base com a Terra, o datum do referencial absoluto fica no espaço nulo de HᵀWH (a posição da estação é inobservável); ≥{ "3" } linhas de base restauram o posto completo e limitam o erro de Cramér–Rao da estação, que o estimador atinge

# text
seg-2ed7181c97dd = Geração dos códigos de espalhamento do LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Os códigos do Augmented Forward Signal do LSIS V1.0 ({ "29" } de janeiro de { "2025" }): o primário de 10230 chips do AFS-Q, gerado a partir da construção do piloto L1C do IS-GPS-800 com os índices do IS-GPS-800J (as mesmas { "210" } atribuições que o Apêndice D do LSIS imprime), os códigos Gold de 2046 chips do AFS-I, gerados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } e g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, com o atraso de G2 de cada PRN recuperado do arquivo do Anexo { "3" } da norma, os quatro códigos secundários, os códigos terciários de 1500 chips, a atribuição provisória de nós da Tabela { "11" } e o código piloto em camadas. O conteúdo do LSIS é lido em tempo de execução a partir de um cache local verificado por SHA-256, preenchido a partir do PDF hospedado pela NASA, nunca redistribuído

# text
seg-56c7aeac59c1 = Decodificabilidade em malha fechada do LunaNet AFS por um receptor independente (LSIS V1.0)

# text
seg-da2d29d437b0 = Uma gravação AFS do Kshana adquirida, rastreada e decodificada por um receptor de software independente e comparada com os rótulos de verdade da própria gravação. Isso demonstra apenas a aderência à norma e a consistência dos rótulos; não é uma afirmação sobre a física do canal, a propagação, a potência recebida ou os orçamentos de enlace, cujos valores na gravação são entradas escolhidas

# text
seg-780369fb9a54 = Aderência à norma do GPS L1 C/A entre geradores

# text
seg-ee47b60515f1 = Códigos de espalhamento do GPS L1 C/A (sdr::CaCode) e subquadros LNAV 1-3 (gps_lnav: quantização dos campos do IS-GPS-200 com o pi da especificação, empacotamento em complemento de dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução de paridade das palavras { "2" } e { "10" }) comparados bit a bit com o gps-sdr-sim em seu brdc0010.22n incluído ({ "32" } satélites)

# text
seg-bf429c8f00fb = Aquisição IQ GNSS em amostras I/Q geradas de forma independente

# text
seg-9a0c52bfb06e = iq::acq::acquire (busca paralela de fase do código por FFT com o limiar Marcum-Q de lei quadrática) com a réplica GpsL1Ca, em { "20" } ms da própria saída I/Q de 8 bits do gps-sdr-sim decodificada pelo decodificador de amostras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sem ruído): cada PRN de { "1" } a { "32" } pesquisado em duas janelas de { "10" } ms, com o resultado comparado à fase do código e ao Doppler que o gps-sdr-sim modulou

# text
seg-f40dc3dac990 = Monitores IQ avaliados em campanhas de reprodução em laboratório: detecção, perdas, falsos alarmes e valores de falso alarme em forma fechada

# text
seg-93fb3109728c = iq::campaign::detect e o executor de campanhas: uma tabela opcional [monitors] executa os monitores IQ em cada célula na passagem única do executor. Os monitores de potência e de espectro veem as amostras após cada cadeia de front-end; os monitores de C/N0, SQM e de travamento veem as atualizações de malha de cada canal rastreado. Cada alarme é avaliado em relação aos eventos declarados: detectado ou perdido por (evento, tipo de alarme, canal), tempo até a detecção e falsos alarmes fora dos eventos ao longo de sua exposição. O valor de falso alarme em forma fechada de cada teste é declarado: potência por bloco (cauda Gama exata), excesso espectral por bloco (aproximação), curtose (gaussiana unilateral), pulsos (teto binomial), SQM por atualização média (2Q(k) = Q(1/2, k^2/2), novo) e o ARL0 do CUSUM de C/N0 (Siegmund). Sem a tabela, células, chaves e resumos permanecem inalterados. Nenhuma forma de onda de interferência é sintetizada

# text
seg-5b7eb7ddb474 = ROC de detecção dos monitores IQ a partir de uma campanha de reprodução em laboratório avaliada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada célula de uma campanha com monitores mantém, por tipo de alarme e canal, o máximo da estatística de teste do próprio monitor em cada janela de evento declarada (positivo) e em janelas roc_window_s ladrilhadas fora dos eventos (negativo). As estatísticas são o desvio da potência de bloco, o excesso de PSD, a curtose z, o |z| do SQM da métrica média e o CUSUM de C/N0. O relatório as agrupa por tipo em uma ROC empírica em nível de janela com sua AUC e o ponto de operação no limiar configurado, gravada como roc.json (kshana.campaign-roc/1) e uma seção Detection ROC do report.html. Uma campanha sem monitores não grava nenhum dos dois

# text
seg-3a3cfa322f01 = Calibração dos modelos de C/N0 e de travamento do receptor aberto a resultados de campanhas IQ, com erro de predição declarado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) e <c1/> em <c2/>, o <c3/> do Python e a ferramenta labfit do MCP (apenas pastas de campanha dentro de seu diretório de trabalho): lê uma pasta de saída de <c4/> por seu DIGEST e agrupa as células avaliadas em unidades de ajuste (sinal x projeto de malha x cadeia de front-end x tipo de interferidor, nunca agrupados). Por unidade, ajusta o C/N0 medido ao J/S declarado com a forma de separação espectral. O Q_eff não é identificável a partir de dados de C/N0 sem uma medição independente das potências do interferidor e do sinal, portanto o Q é declarado, nunca ajustado (a tabela de tipos, o q do evento ou, para um tipo desconhecido, o valor declarado mais danoso, cw Q = { "1" }). O parâmetro ajustado é o deslocamento identificável delta_eff = delta - { "10" } log10 Q, com a salvaguarda de correlação relatando a degenerescência. Os intervalos de C/N0 travados em menos de { "90" } % são censurados e listados. O J/S limiar é dado diretamente e pela forma fechada; os modelos de malha de rastreamento e de travamento empírico são acoplados pelo modelo de C/N0, com tempos de permanência de queda e de retravamento. Um bootstrap de agrupamentos com semente sobre as gravações ({ "1000" } réplicas) fornece intervalos por percentis; intervalos de predição de { "90" } % vêm de sorteios de resíduos; as retenções leave-one-recording-out são divididas em interpolação e extrapolação; uma tabela [validation] pré-registrada recebe um hash e cada limiar é julgado PASS/FAIL. Relatório kshana.labfit-iq/1 em JSON, CSV e Markdown gerado, com um bloco de unidades. Somente sintético (nenhuma gravação de terceiros, nenhuma forma de onda de interferidor). O caminho de labfit por registro do receptor permanece inalterado

# text
seg-9537d301c95e = Codificação GPS LNAV decodificada por uma biblioteca de receptor independente

# text
seg-909415621881 = Subquadros LNAV 1-3 do Kshana (gps_lnav::encode_subframes) para as efemérides { "32" } brdc0010.22n, fornecidas ao decode_word e ao decode_frame do RTKLIB: paridade de cada palavra, decodificação de subquadros com emissão de dados consistente e cada parâmetro decodificado em relação ao inteiro do Kshana e ao valor de entrada

# text
seg-f66855e35c53 = Codificação da mensagem de navegação GPS LNAV

# text
seg-8caf8366e2f8 = Subquadros LNAV 1-3 do IS-GPS-200 (gps_lnav::encode_subframes: quantização por arredondamento ao mais próximo de cada parâmetro de relógio e de órbita nos fatores de escala da especificação e no valor de pi, empacotamento em complemento de dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução de paridade das palavras { "2" } e { "10" }), a mensagem que um gerador de sinal GPS L1 C/A transmite

# text
seg-c5c944357643 = Aquisição e estimativa de C/N0 em IQ lunar real

# text
seg-f5dcb5e06bf4 = Busca paralela de fase do código (acquisition::pcps_acquire: FFT portátil, dobramento coerente, acumulação não coerente, limiar de qui-quadrado para uma probabilidade de falso alarme em toda a busca), refinamento, correlação prompt em malha aberta com Doppler de código e o estimador de C/N0 M2M4, executados nos lotes IQ de 4 bits do LuGRE L1 lidos por meio de realdata::ion_sdr

# text
seg-709626569a5c = Aquisição em IQ lunar real em relação ao Doppler previsto pela órbita (decisão por potência da amostra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire com sua decisão por potência da amostra nos nove lotes L1 do LuGRE fora da superfície com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com diferenças previstas a partir das órbitas finais da ESA e da trajetória do Blue Ghost reconstruída pela Firefly

# text
seg-89875d67b253 = Aquisição em IQ lunar real avaliada pelo Doppler previsto pela órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire com a decisão por média de células (pico sobre a célula média da grade, robusta a ruído de banda limitada) nos nove lotes L1 do LuGRE fora da superfície com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com diferenças previstas a partir das órbitas finais da ESA e da trajetória do Blue Ghost reconstruída pela Firefly

# text
seg-8fa779dd1788 = Aquisição em IQ lunar real reservado em relação ao Doppler previsto pela órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisão por média de células, probabilidade de falso alarme { "1e-7" }) com refine_doppler_coherent nos lotes L1 do LuGRE gravados na superfície lunar (I no nibble alto, níveis mid-rise); diferenças de Doppler entre satélites adquiridos contra diferenças previstas a partir das órbitas finais da ESA e do kernel do local de pouso da Firefly

# text
seg-10af60b488b9 = Estação de referência diferencial de classe NovaMoon: cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS

# text
seg-c04a3591074c = Exportação de interoperabilidade lunar

# text
seg-91f4a066b3c0 = Exportação de referencial lunar + tempo + efemérides alinhada ao LunaNet/IOAG (CCSDS OEM + KIF) com ida e volta e aderência à norma

# text
seg-8ab65cbefb75 = Pontuação de resiliência de PNT alinhada a referenciais

# text
seg-c48198f31d63 = Subpontuações por dimensão sobre as sete categorias de resiliência próprias do Kshana (não termos do DHS), funções RDRR do RethinkPNT e critérios de Yang, cada uma marcada como modelada com seu fator determinante; Nível RPCF provisório com uma porta de degradação limitada. Autoavaliação derivada de simulação, nunca uma certificação.

# text
seg-d7bdb6fe186e = Estudo de instabilidade de decisão da pontuação de resiliência

# text
seg-5fcf18a68bb1 = Quantifica como uma única pontuação composta / Nível RPCF reordena arquiteturas sob um simplex de ponderação defensável e um conjunto de ameaças (taxa de inversão do top-1, dispersão do tau de Kendall, taxa de inversão de Nível, intervalos de classificação); análises de declarado versus medido e de colapso de diversidade.

# text
seg-1bf03544a010 = Representatividade da demonstração e lacunas até o voo

# text
seg-db24d16d38c9 = Registro de honestidade por resultado que qualifica a saída de uma demonstração: suas âncoras externas, hipóteses modeladas, lacunas até o voo e a faixa de TRL representativa, com invariantes impostas (validado exige uma âncora externa; modelado exige uma lacuna e não pode reivindicar acima do TRL { "4" }).

# text
seg-52ab936eb5f5 = Evidência de trade quântico versus clássico (forma comum)

# text
seg-a6679ed5bed7 = Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns de quântico versus clássico por FoM com benefício de polaridade correta, IC de { "95" }% opcional, rótulo validado/modelado) que carrega um registro de representatividade, de modo que toda vertical de PNT quântico relate o trade da mesma forma honesta.

# text
seg-20fee61b3107 = Biblioteca de modelos de erro de dispositivos quânticos

# text
seg-e42eabe9bc2a = Fichas de dispositivos (óptico/íon aprisionado/íon de mercúrio + relógios clássicos reutilizados de holdover/clock_state; interferômetro de átomos frios; enlaces de transferência de tempo clássico + emaranhamento/fóton único), cada uma com um registro de representatividade; o enlace de emaranhamento acrescenta um modelo de precisão de temporização limitado por ruído de disparo (~jitter/sqrt(R*tau), penalidade de contagem de escuro, piso sistemático).

# text
seg-86d71fd89f26 = Temporização quântica confiável (transferência de tempo + disseminação segura + anomalia)

# text
seg-d2a3d37825ef = Cadeia de transferência de tempo quântica versus clássica de ponta a ponta (deriva do relógio + precisão do enlace em quadratura), um nível de proteção de temporização reutilizado, uma FoM de segurança contra ataques de atraso/reprodução (1-P_md) e uma probabilidade de detecção de anomalia de relógio + latência do CUSUM, emitidos como TradeEvidence honesta com um registro de representatividade.

# text
seg-eaf341ff4522 = Navegação quântica sem GNSS

# text
seg-908a44a9f7c7 = Navegação por estima de INS quântico (interferômetro de átomos frios) versus INS clássico de grau de navegação durante uma interrupção de GNSS: crescimento do erro de posição, holdover até um limite de posição e o trade quântico versus clássico como TradeEvidence honesta; nota honesta de observabilidade (o viés é inobservável sem uma correção, portanto o erro cresce).

# text
seg-914132833f5a = Detecção de falhas/anomalias para sistemas de PNT quântico

# text
seg-f20392820b9d = Catálogo rotulado de falhas quânticas (salto de frequência/deriva/perda de travamento do relógio; salto de viés/perda de sinal do sensor), uma AUC de ROC da estatística de detecção com IC por bootstrap e uma falha mínima detectável a uma taxa de falso alarme fixa; um monitor auxiliado por relógio quântico detecta falhas menores que um clássico, emitido como TradeEvidence honesta.

# text
seg-d31be81dfd8f = Geolocalização passiva de emissores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localiza um emissor (interferidor/falsificador de sinal, ou uma fonte oportunista para PNT reverso) a partir da diferença de tempo de chegada em uma rede de receptores — a interseção de hiperboloides τᵢ=(Rᵢ−R₀)/c resolvida por mínimos quadrados de Gauss–Newton — e, ao acrescentar a diferença de frequência de chegada (diferenças de taxa de variação de distância) com receptores em movimento, recupera conjuntamente posição e velocidade; com o limite inferior de Cramér–Rao sobre a covariância de posição a partir da geometria das medições

# text
seg-5bd3882531b6 = Aquecimento convectivo de entrada no ponto de estagnação (Sutton-Graves) em uma entrada de 3 graus de liberdade

# text
seg-4f97036ed72f = Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), seu pico e a carga térmica integrada ao longo de uma entrada de 3 graus de liberdade, balística ou sustentada com inclinação lateral constante, na Terra ou em Marte.

# text
seg-1b96577665fc = Radiometria de imageador eletro-óptico, MTF, resposta relativa de borda e NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Orçamento de relação sinal-ruído de imageador em nadir (radiância de cena lambertiana, equação da câmera, ruídos de disparo, de escuro, de leitura e de quantização), a MTF do sistema em Nyquist como o produto de difração de abertura desobstruída, abertura do detector, borrão linear e jitter gaussiano, a resposta de borda e a resposta relativa de borda integradas a partir dessa MTF, Q = lambda F / p, e o NIIRS do GIQE versão { "4" } sem compensação de MTF. Executável como o tipo de cenário <c1/>.

# text
seg-07ca77a67207 = Perdas de gravidade, arrasto, direcionamento e contrapressão na ascensão de lançamento

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascensão planar por curva gravitacional de um veículo de vários estágios sobre uma Terra esférica sem rotação, através da Atmosfera Padrão dos EUA { "1976" } (densidade e pressão), com um chute de arfagem, empuxo reduzido pela contrapressão do bocal, fins de queima de estágio em limites exatos de passo e as perdas de gravidade, arrasto, direcionamento e contrapressão integradas junto ao estado. Executável como o tipo de cenário <c1/>.

# text
seg-55e8345def8b = Equação bidirecional do TWSTFT, orçamento de incerteza e estabilidade do enlace com não reciprocidade de flicker e diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = A equação bidirecional do TWSTFT resolvida para T_A - T_B com atrasos de transmissão e recepção da estação, a assimetria ionosférica de subida/descida na banda Ku, a diferença de atraso do transponder e os termos de Sagnac, em relação ao seu modelo direto exato; um orçamento de incerteza em quadratura com o TDEV do enlace como termo do tipo A; uma série bidirecional com ruído de fase branco e de flicker (Kasdin-Walter), uma não reciprocidade diurna e um resíduo de reciprocidade constante; e a taxa, o RMS residual, o TDEV e o ADEV de séries de relógio de estação fornecidas em Circular T, MJD-CSV ou RINEX do IGS. Executável como o tipo de cenário <c1/>.

# text
seg-2f9be02c92bc = Numérica de atmosfera em trajeto óptico oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade óptica de nuvem e de ar limpo

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrado ao longo de um trajeto oblíquo para a variância de Rytov de onda plana e esférica (enlace de subida e de descida), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, o fator de média de abertura em turbulência fraca, a profundidade óptica de nuvem de uma coluna de água líquida e a profundidade óptica de ar limpo de Kim-visibilidade mais Rayleigh, substituindo a perda atmosférica agregada do orçamento de enlace óptico quando uma atmosfera é fornecida. Executável dentro do tipo de cenário <c1/>.

# text
seg-a2faab92e760 = Disponibilidade de sítios ópticos em solo dirigida pelo clima e diversidade de sítios correlacionada com a distância

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilidade de um enlace óptico em relação a uma margem de enlace declarada a partir de um clima log-normal de água líquida em nuvens (quantidade da ITU-R P.840, extinção por óptica geométrica) e o desvanecimento por turbulência gama-gama independente, a margem de enlace necessária para disponibilidades-alvo e o teto que nenhuma margem eleva, durações de interrupção log-normais, cenários hipotéticos de técnicas de melhoria e uma disponibilidade de rede por cópula gaussiana de um fator cuja correlação entre pares é exp(-distância/comprimento de decorrelação). Executável como o tipo de cenário <c1/>.

# text
seg-043ece801e72 = Continuidade de temporização e de telemetria através de interrupções ópticas

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = A distribuição de duração de interrupções de um sítio óptico acoplada à variância de deriva em forma fechada do modelo de holdover do relógio: erro de temporização e de telemetria em quantis de interrupção declarados, o holdover até um limite de temporização, a fração das interrupções e do tempo de interrupção dentro dele e a disponibilidade de temporização A + U E[min(D, T_h)]/E[D], para as classes de relógio clássica e quântica. Executável dentro do tipo de cenário <c1/>.

# text
seg-b119df65d2a7 = Margem de enlace óptico ao longo do tempo: uma realização com semente do clima de um sítio

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Uma tabela opcional <c1/> (duração, passo, semente) faz o tipo <c2/> gravar também, por sítio, uma realização com semente do modelo de sítio declarado ao longo do tempo: episódios de nuvem (períodos claros exponenciais, interrupções por nuvem log-normais com a média e a dispersão declaradas, a parcela de tempo sob nuvem definida pela probabilidade de nuvem declarada), uma coluna de água líquida log-normal por episódio de nuvem, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem de enlace, os desvanecimentos por nuvem e por cintilação e o indicador de enlace ativo, com a disponibilidade realizada, a fração de nuvem, a contagem de interrupções e a interrupção mais longa. Sem a tabela, o resultado é o documento { "0.37" }. Os sorteios passam por rotas portáteis de distribuição e de matemática, de modo que native e wasm32 dão os mesmos bytes.

# text
seg-58cbf576c959 = Leitor de Orbit Data File TRK-2-18 e modelo de Doppler de 2 vias com rampa em Marte

# text
seg-d1055650a77f = Um leitor de Orbit Data Files (TRK-2-18) da DSN: os grupos de registros de 36 bytes (rótulo de arquivo, identificador, dados de órbita, rampas por estação, deslocamentos de relógio, resumo, fim de arquivo) e, em cada registro de dados de órbita, a marca de tempo desde { "1950" }, atrasos de descida e de subida, observável, estações, tipo de dado, bandas, validade, canal, espaçonave, a frequência de referência de 46 bits e o tempo de compressão; instantes de início e de fim das rampas, taxas e frequências iniciais. Sobre ele, um modelo de Doppler de 2 vias em banda X com rampa (rampas de subida integradas, tempo de luz de ida e volta com Shapiro e troposfera, estações da DSN pela cadeia CIO IAU 2006/2000A e EOP do IERS, tempo da estação) e uma determinação de órbita em lote de orbitador de Marte (campo GMM-3, terceiros corpos, SRP, arrasto).

# text
seg-455dc946c965 = Estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um rastreador de estrelas

# text
# c1: aocs
seg-553d043438b4 = O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa de viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de taxa), atualizações do rastreador de estrelas com o resíduo { "2" } vec(q^-1 q_st) na forma de Joseph e a reinicialização multiplicativa; um simulador discreto de Farrenkopf de giroscópio e rastreador de estrelas. O tipo <c1/> pode fechar a malha de controle sobre a sua estimativa.

# text
seg-a971ff07592a = Ciclo de trabalho de abertura entre navegação e comunicações

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Uma execução recebe um plano de contatos (uma lista de janelas aos_s/los_s, cada uma pedindo à abertura navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), uma contagem de aberturas e uma política de arbitragem explícita, e devolve o ciclo de navegação, o ciclo de comunicações, o ciclo ocioso e a interrupção por sessão. A política é uma entrada com um padrão documentado (<c3/>; também <c4/> e <c5/> não preemptivo), e o relatório traz a política resolvida, sua definição completa e as definições de ciclo e de interrupção, porque um valor de ciclo citado sem sua regra de arbitragem não é reproduzível. O escalonamento é uma varredura exata de intervalos sobre as fronteiras das janelas, de modo que uma janela que termina exatamente onde a seguinte começa nunca disputa, e os segundos de abertura de navegação, de comunicações e ociosos são acumulados de forma independente nessa única varredura. Executável como o tipo de cenário <c6/>

# text
seg-43cd7aa7ab53 = Interferência de RF na navegação de superfície lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Razão interferidor-sinal nativa lunar, C/N₀ efetivo e perda de travamento para um usuário de superfície selenográfico sob um interferidor na superfície lunar (ou elevado), sobre a constelação ilustrativa de fontes públicas de classe Moonlight/LCNS. Compõe a cadeia aberta de interferência (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) com a geometria aberta do céu lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rederivada. Diferentemente do tipo <c1/> da Terra, a perna do sinal não é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é seu próprio EIRP do orçamento de enlace − FSPL(distância oblíqua), de modo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Emite UMA LINHA POR ENLACE VISÍVEL (época, satélite) em JSON e como artefato *.table.csv, com as duas potências recebidas cuja diferença é o J/S impressas ao lado; as figuras de mérito agregadas ficam ao lado dessa tabela, nunca no lugar dela. Executável como o tipo de cenário <c2/>

# text
seg-4c116e25c5c5 = Contorno de negação lunar com uma faixa de incerteza a partir da dispersão medida de C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = O relatório <c1/> não apoia mais seu contorno de negação em um único escalar. Ele emite a distribuição completa medida de C/N₀ do sinal desejado sobre a tabela por satélite — n, mín, p05, p25, mediana, p75, p95, máx, média, desvio padrão amostral e a própria assimetria da amostra (p95 − mediana) − (mediana − p05) — ao lado das linhas por enlace, que permanecem inalteradas. O contorno é então relatado em cada uma dessas estatísticas de ordem sob AMBOS os critérios de negação que o motor reconhece, nunca um no lugar do outro: o critério incumbente de razão de potência (J/S = { "30" } dB, o mesmo limite que attack_surface e tracking_loop usam, e o critério por trás da coluna <c2/> da tabela publicada de interferência em enlaces lunares), e o critério de perda de travamento (o C/N₀ efetivo caindo a tracking_threshold_dbhz), que é o critério com que a própria coluna links[].status deste relatório é avaliada. Cada ponto do contorno é dado nos dois eixos do plano de negação — o EIRP do interferidor necessário no afastamento do cenário, e o afastamento de negação no EIRP do cenário — de modo que a faixa é um intervalo nos mesmos eixos em que um gráfico de contorno é desenhado. As bordas da faixa SÃO contour(p05) e contour(p95): o mesmo mapa em forma fechada aplicado aos próprios quantis da amostra, não um sigma ajustado à amostra e não mediana ± k·desvio padrão, e o relatório diz isso em uma string band_definition ao lado dos números. O desvio padrão é emitido por continuidade e não é usado por nada. Um quantil cujo C/N₀ já está no limiar de rastreamento ou abaixo dele não tem J/S de negação finito; essas colunas são emitidas como null com um motivo contado, e não como um infinito nem como um raio limitado

# text
seg-2d3944107ba0 = Poder de detecção do monitor de integridade entre modalidades

# text
seg-38bc7c0bfe57 = O relatório hybrid-optical-rf declara o que o monitor de qui-quadrado entre modalidades realmente consegue DETECTAR, e não apenas que ele passa em um caso sem falhas: o viés mínimo detectável por eixo monitorado (leste, norte, vertical, relógio) nas probabilidades de falso alarme e de detecção perdida declaradas do cenário, a curva de poder de detecção de cada lado dele, o múltiplo do viés sem ruído em que a estatística realizada cruza pela primeira vez o limiar e o tempo até a detecção para uma rampa de viés a uma taxa declarada. Falhas também são injetadas através do monitor real e a estatística que ele devolve é relatada ao lado da previsão analítica

# text
seg-38cabd4921c1 = Recrescimento da covariância pós-handover em relação ao limite de alerta

# text
seg-9287268bbada = O relatório hybrid-optical-rf expõe o modelo de ruído de processo do filtro e declara por quanto tempo a solução pós-handover permanece dentro do limite de alerta: para ambos os sentidos de transferência, ele carrega a covariância por eixo que o handover deixou, a propaga adiante sob um ruído de processo de passeio aleatório declarado e relata o instante em que o 1σ escalado pela cobertura atinge os limites de alerta horizontal, vertical e de temporização, qual limite é atingido primeiro, a constante de tempo de duplicação da variância e um perfil amostrado de deriva que delimita o cruzamento. As PSDs de ruído de processo, o fator de cobertura e os limites de alerta são todos entradas com padrões documentados

# text
seg-a3b8272862aa = Padrão de antena fora do eixo na exportação de geometria lunar

# text
seg-27d246503a48 = A exportação de geometria por satélite traz, por (época, satélite), o ângulo fora do eixo NO SATÉLITE e o ganho de transmissão em direção ao local a partir do padrão real de abertura circular uniformemente iluminada (Airy), e relata a contagem de satélites dentro do feixe sob esse padrão AO LADO da contagem sob a aproximação simétrica de ganho para largura de feixe (θ_3dB[deg] = √(31000/G_lin)), com a diferença emitida como uma correção explícita em links, em satélites por época e como a pior época isolada. Ambas as eficiências de abertura implícitas da aproximação são emitidas ({ "0.641" } contra a regra de { "70" }·λ/D graus com que é citada, { "0.920" } contra uma abertura circular uniforme), de modo que a eficiência que ela supõe silenciosamente seja declarada, e não inferida. Desligado por padrão: o bloco só aparece quando um local de exportação e uma abertura são ambos fornecidos

# text
seg-6fbfa234ef3e = Perda de travamento da malha de rastreamento e captura por falsificação sob interferência

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perda de travamento calculada a partir da dinâmica da malha, e não de uma razão de potência: jitter térmico de 1σ de portadora (Costas) e de código (antecipado/atrasado não coerente) contra C/N₀ com a perda por elevação ao quadrado, contra as regras declaradas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + defasagem de rampa ≤ d/2 chips; limiares de C/N₀ de queda e de retravamento com a malha determinante nomeada e a histerese DERIVADA da largura de banda de captura mais ampla, e não afirmada; o tempo declarado até perder o travamento a partir de um detector de travamento de dois limiares com tempos de permanência de confirmação, relatado separadamente do tempo físico de escape de fase (tempo médio de Viterbi entre saltos de ciclo, em log₁₀ s porque abrange centenas de décadas); a maior taxa de variação de código e de Doppler da portadora que as malhas da vítima conseguem seguir; e o RAIO DE NEGAÇÃO que a dinâmica da malha implica, relatado ao lado do raio existente de razão de potência, com sua diferença com sinal como um campo nomeado próprio. Executável como o tipo de cenário <c1/>

# text
seg-0f4d023fe2d4 = Covariância de coordenadas de pontos da superfície lunar a partir de um cronograma de atrasos de VLBI, mantida distinta da das estações da Terra

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Uma terceira escolha de datum, <c1/>, que mantém fixas todas as estações da Terra e estima apenas as coordenadas do FAROL fixas ao corpo lunar — a configuração para a qual de fato se cita a incerteza de um ponto da superfície lunar, já que as coordenadas das estações da Terra são uma entrada do modelo de atraso e não uma incógnita dele. Ela existe porque a covariância no nível da estação e a covariância do ponto da superfície são GRANDEZAS DIFERENTES separadas pelo braço de alavanca ρ/B, e nada antes impedia que uma fosse citada no lugar da outra. O bloco <c2/> emitido traz ρ, a linha de base mais longa, o braço de alavanca, a forma de ponto da superfície do enlace de equipartição c·σ_τ·(ρ/B)·√(g/N), o sigma do farol por coordenada calculado e sua razão — a razão nula, e não enganosa, sempre que o farol não é estimado ou a matriz tem deficiência de posto. B é tomado como a linha de base MAIS LONGA presente, a mais favorável, de modo que a razão só pode subestimar. Executável como <c3/> com <c4/>, o que é recusado com uma mensagem que nomeia a entrada ausente quando o farol não é estimado

# text
seg-0315968c8214 = PNT diferencial lunar — orçamento de resíduos do enlace de correção

# text
seg-c6785166a44c = Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado antes como margem não modelada: erro de levantamento da estação de referência (correlacionado entre satélites, independente da linha de base, transferência de posição de ~{ "1" }:{ "1" } e comprovadamente não amplificado pelo DOP), envelhecimento da correção (o vetor de erro de órbita congelado reprojetado sobre a linha de visada em que o próprio propagador do motor coloca o satélite uma latência depois, mais a deriva de relógio c·σ_y(τ)·τ da lei de potência calibrada) e quantização uniforme do enlace sobre uma escala completa exata de ±(orbit_err + clock_err) com variância step²/12. Relatados nos domínios de distância e de posição, ao lado — nunca no lugar — do resíduo e do nível de proteção existentes, com uma curva de latência ao lado do valor único

# text
seg-c42646ae4707 = Mapa de cobertura e exatidão de estações de referência lunares

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas (o tipo <c1/>): para uma estação de referência diferencial em um local conhecido do polo sul, por ponto e sobre a região, o erro de posição percentil corrigido e não corrigido (3-D, horizontal, vertical), a disponibilidade com um motivo para cada época indisponível (user_lt4, station_missing_sat), a cobertura em relação a um limite declarado antes da execução, níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento do enlace de correção na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; não é afiliado nem endossado por nenhuma agência

# text
seg-7ecf4b0038b0 = Máscaras de horizonte do terreno lunar a partir de um perfil declarado ou de um DEM polar

# text
seg-7102948907bc = Máscaras de horizonte dependentes do azimute por local para o tipo lunar-station-coverage (a estação de referência e cada ponto de usuário) e para a grade moonlight-service-volume e seu local de exportação por satélite (cada linha de exportação ganha clears_terrain), no formato de tabela de linha do horizonte { "0.36" } (skyline::Skyline, linear em azimute com fechamento em { "360" } graus; um perfil declarado e um horizonte de DEM em um local se combinam como seu máximo ponto a ponto): um station_horizon ou user_horizon de [terrain] declarado e rotulado com sua fonte, e/ou um horizonte traçado por raios sobre um DEM estereográfico polar sul (o layout polar em grade do LRO LOLA, lido de um descritor que fixa seu tamanho e SHA-256, ou um bloco latitude/longitude realdata::lola_dem com [terrain] dem_tile_path, ecoado com seu SHA-256) ao longo de grandes círculos da esfera lunar com curvatura exata, a partir de uma altura de mastro declarada, em um passo de azimute e um alcance declarados. Um satélite conta em um local quando ultrapassa a mask_deg plana e o horizonte em seu azimute (lunar_service::topocentric); uma época em que o horizonte deixa menos de quatro satélites em um ponto, onde a máscara plana dá quatro, é contada com o motivo de indisponibilidade terrain_masked. O DEM incluído é um recorte do produto de domínio público LOLA LDEM_75S_240M, reamostrado por média de blocos de { "5" } x { "5" } para { "1200" } m (data/lunar-dem/NOTICE.md). Se ausente, todo local mantém a máscara plana e todo documento é idêntico byte a byte

# text
seg-d37bb01e270b = Termos de multipercurso e de hardware do receptor da estação de referência lunar

# text
seg-1103199f019b = A seção opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multipercurso dependente da elevação sigma(el) = a + b exp(-el / el0) no usuário e na estação (a forma funcional aerotransportada do RTCA DO-229, com a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graus como padrões; na Lua todo valor é ILLUSTRATIVE), branco no usuário e Gauss-Markov de primeira ordem ao longo das épocas na estação (rho = exp(-dt / tau)); ruído térmico de código do DLL antecipado-menos-atrasado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); vieses entre canais por canal constantes ao longo de um ensaio, no usuário e na estação. Os termos da estação entram em suas correções, os do usuário nas medições brutas e corrigidas, cada um em seu próprio fluxo com semente. Se ausente, todo documento permanece inalterado

# text
seg-03796cb741b6 = Crescimento do erro de efemérides da estação de referência lunar ao longo da latência da correção

# text
seg-13b0ae9a874a = A entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): uma correção aplicada latency_s depois de calculada perde o crescimento g latency_s do erro de órbita transmitido, g isotrópico de taxa RMS 3-D, sorteado por satélite e ensaio em seu próprio fluxo com semente (taxa de 1-sigma tau / sqrt({ "3" })), além da reprojeção da linha de visada do erro congelado. Se ausente, todo documento permanece inalterado. Um adendo K5 à comparação de afirmações publicadas, pré-registrado isoladamente, executa o K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-90307f07e0ef = Modos de solução da estação de referência lunar: restrição de altura, três satélites, janela de usuário estático

# text
seg-366c7ad03fb2 = A seção opcional [solution] de lunar-station-coverage (LRS-06): uma linha de pseudomedição de altura up . dx = e_h de 1-sigma declarado ponderada contra as linhas de distância, um mínimo de três satélites permitido apenas com ela e uma solução de mínimos quadrados ponderados sobre as últimas window_epochs épocas com uma posição estática compartilhada e um relógio por época (a resposta de um filtro para uma posição estática sem ruído de processo sobre os mesmos dados; os erros das épocas são tratados como independentes). Se ausente, a solução instantânea e todo documento permanecem inalterados. Um adendo à comparação de afirmações publicadas com o estilo de solução das fontes, pré-registrado isoladamente

# text
seg-611ba369ed00 = Exatidão e cobertura da estação de referência lunar em relação a afirmações publicadas

# text
seg-4fe4f1cffa2b = O tipo lunar-station-coverage executado sob as hipóteses públicas do material publicado sobre uma estação de referência diferencial lunar (quatro satélites de navegação em órbitas elípticas congeladas de { "24" } h, SISE de { "10" } m a { "95" } %, ruído de código de { "0.30" } m, latência de correção de { "1" } s e { "600" } s, um levantamento da estação em escala submétrica, o local de estação de exemplo publicado, os círculos do polo sul de { "300" } km e { "600" } km) e avaliado em relação às afirmações numéricas das fontes sob seis limiares unilaterais pré-registrados antes da execução: cobertura de todo o polo sul com p95 submétrico (K1, K2), p95 corrigido submétrico e em nível decimétrico (K3, K4), submétrico mantido com latência de { "600" } s (K5) e exatidão mantida de { "10" } km a { "500" } km de linha de base (K6)

# text
seg-7bfcb5c6a985 = ARAIM com hipóteses de falha simultânea de múltiplos satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: a regra de determinação de subconjuntos da ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorados com menos removidos primeiro) generalizada de pares para combinações simultâneas de até max_order eventos de satélite e de constelação, com o a priori exato P_no fault prod q_e; add_v42_protection_levels_to_order executa sobre ele o caminho de nível de proteção da ADD v4.2 (a ordem { "2" } é exatamente o caminho existente). raim::araim_subset_raim (opcional): RAIM avançado sobre esse conjunto de hipóteses, cada subconjunto monitorado um modo (p_fault, T, b, sigma) na soma de risco de integridade, subconjuntos não observáveis movidos para o risco não monitorado, o orçamento escalado pela alocação da ADD do risco não monitorado e o subconjunto de maior separação normalizada relatado quando uma falha é detectada. Probabilidades a priori que exigem subconjuntos mais profundos que max_order são recusadas, nunca truncadas

# text
seg-48ca01332f8f = RAIM ao lado das figuras de mérito de holdover de relógio

# text
seg-890f1006a75d = A seção opcional [integrity] do tipo clock (clock_integrity::run): a partir de um local declarado e de predefinições de constelação (geometry::sky_geometry), em cada época de integridade enquanto a linha do tempo do GNSS não está negada, RAIM instantâneo (raim::snapshot_raim: teste de qui-quadrado de paridade, níveis de proteção por inclinação) sobre os satélites acima da máscara com resíduos gaussianos com semente do sigma declarado e um viés declarado opcional; um bloco integrity_fom separado com veredictos por época, níveis de proteção e disponibilidade. Épocas negadas são relatadas como indisponíveis, nunca extrapoladas; as figuras de mérito de holdover permanecem inalteradas e, sem a seção, a saída é idêntica byte a byte

# text
seg-9cbb4ee7588a = Observabilidade cislunar de comprimento de arco espacial, ruidosa e de múltiplas famílias

# text
seg-5ebd771deef8 = O limiar de observabilidade de comprimento de arco cislunar no CR3BP ESPACIAL de seis estados, e não no planar de quatro estados, em famílias DRO, halo L2 e halo quase retilíneo L2, com o ruído de medição entrando no Gramiano e DOIS critérios relatados porque não existe um único honesto: o critério de posto publicado, comprovadamente invariante a um sigma de medição homocedástico (o branqueamento multiplica a matriz de observabilidade por um escalar, deixando inalterados o espectro relativo de valores singulares e, portanto, o posto, o defeito e a condição), e um critério de estimabilidade — o primeiro arco em que a incerteza formal de 1σ de posição do estado inicial do chefe cai abaixo de um limite declarado — que é o que de fato se move com o ruído. Cada limiar traz o intervalo da grade de épocas em que se situa; um critério não atingido é null com um motivo. O modo planar continua sendo o padrão e as famílias fora do plano são recusadas ali, em vez de achatadas em um estado que não consegue representá-las

# text
seg-e250321394bc = Erro de predição da orientação da Terra em estilo operacional, medido como predito versus final

# text
seg-0e443d241460 = Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para o UT1; Chandler, anual e semianual para o polo — extrapolado com o último resíduo da janela levado adiante: a classe que o IERS Bulletin A usa, no lugar do preditor de persistência em que o horizonte publicado se apoiava. Avaliado da única maneira honesta: uma previsão para T+h construída a partir de linhas rápidas do Bulletin A em T ou antes, medida contra o final do Bulletin B PUBLICADO DEPOIS em T+h, com a persistência avaliada sobre o mesmo conjunto de épocas contra os mesmos finais ao lado. Uma época-alvo sem final publicado é descartada em vez de reavaliada contra a coluna rápida; um termo periódico que a janela não consegue restringir é relatado como rejeitado com os ciclos que de fato abrange; uma janela incompleta é recusada em vez de silenciosamente encurtada

# text
seg-f4efd94dd746 = Datum de referencial lunar a partir de uma campanha de observação

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada. Estações da Terra observam um catálogo com fonte de faróis da superfície lunar em um cronograma explícito; as derivadas parciais de atraso do VLBI lunar são acumuladas em uma matriz de informação de Fisher de coordenadas dos faróis e propagadas pelo projeto de Helmert A = [I₃ | [p]ₓ | p] até H = AᵀM_bA, de modo que a exatidão de datum relatada é função do programa de observação — exatamente linear no sigma de atraso e monótona no arco pela libração que o relatório MEDE. O defeito de datum é o assunto, e não uma nota de rodapé: posto, defeito, número de condição, espectro, direções inobserváveis na base de sete parâmetros, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução, e qualquer parâmetro que a campanha não restrinja é publicado como NULL com um status. A correlação de erro dos faróis é MEDIDA, não suposta — exatamente zero com as estações mantidas fixas, e impressa com seu custo quando elas são estimadas. Executável como o tipo de cenário <c1/>

# text
seg-ca481f2d8f9e = Corroboração por estimador independente do limiar de comprimento de arco cislunar

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do chefe a partir de medições intersatélites simuladas sobre prefixos crescentes da mesma grade de épocas que a tabela de posto versus arco usa, com as derivadas parciais das medições tomadas como diferenças finitas centrais do modelo direto composto. Ele não consome nada da maquinaria com que o limiar foi medido — nenhuma linha de Jacobiano analítico, nenhuma matriz de transição de estados variacional, nenhuma decomposição em valores singulares ou autovalores, nenhuma tolerância de posto, nenhum filtro de informação em raiz quadrada — e compartilha apenas a dinâmica, as condições iniciais, a observável escalar e a grade de épocas, cada um nomeado no documento emitido. Dois critérios, ambos varridos: recuperação sem ruído (o análogo do posto) e estimabilidade de Monte Carlo (o análogo da estimabilidade, medida contra uma verdade conhecida e não prevista a partir de uma covariância). Executável como o tipo de cenário <c1/>

# text
seg-f839285852d9 = Volume de serviço lunar a partir de geometria de constelação real e obtida

# text
# c1: ephemeris_path
seg-c3059fcced49 = Aceita uma efeméride tabulada de estados centrada na Lua (a avaliação de um kernel SPK/BSP) ou uma definição publicada de constelação por trás de <c1/>, executa contra ela a mesma varredura de cobertura / DOP / nível de proteção e emite o requisito de telemetria σ_URE que ela implica AO LADO dos resultados keplerianos e perturbados ilustrativos inalterados, com a diferença como grandeza nomeada própria. Todo valor traz uma classe de proveniência que distingue o derivado de kernel do derivado de elementos publicados e do modelado, de modo que os dois nunca possam ser confundidos em uma citação posterior

# text
seg-36a6cfaf5afa = Unidade e proveniência declaradas para toda grandeza relatada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Um esquema legível por máquina que dá unidade, classe de proveniência e definição para todo campo numérico de todo relatório de cenário, mais um único portão global que executa todo tipo de cenário registrado e falha se um campo numérico emitido não tiver qualquer um dos dois. O vocabulário de proveniência é fechado e cada classe carrega um nível de evidência, com duas classes deliberadamente mapeadas para <c1/> e <c2/> em vez de receberem um nível que a classe não determina

# text
seg-c815cb90dcde = Geodesia da estação de referência lunar: retrorrefletor e farol de VLBI adicionados em relação ao datum dos cinco arranjos

# text
seg-103cf21173ac = As entradas opcionais extra_reflectors e extra_beacons do cenário lunar-llr-datum acrescentam um bloco station_geodesy: a informação de Helmert dos cinco arranjos a partir da fatia arquivada de telemetria laser lunar mais a informação que um retrorrefletor adicionado (medido nas épocas de pontos normais arquivadas em que a estação de medição está acima do horizonte, cada uma com o peso arquivado desse ponto normal) e um farol de VLBI adicionado (observado pela rede e pelo cronograma do lunar-frame-campaign com as estações da Terra fixas, pelas derivadas parciais de atraso do lunar-vlbi-fim) em locais declarados colocam sobre o datum de sete parâmetros, resolvido de novo, com o 1-sigma de cada parâmetro de Helmert antes e depois, sua razão, as normas antes e depois e os autovalores extremos da diferença de Fisher. Ausentes ou vazias, o relatório permanece inalterado

# text
seg-44f582b17fa9 = Integridade do portão — um verde que significa o que diz

# text
# c1: cargo test --all
seg-43fbcfbe990c = Três proteções estruturais sobre o próprio processo de verificação, cada uma fechando uma classe de defeito que chegou ao portão canônico como vermelho intermitente ou espúrio. ({ "1" }) Todo caminho temporário construído nas fontes em Rust deve carregar um componente único por chamada; um id de processo é rejeitado, porque o cargo executa os testes da biblioteca como threads paralelas de UM processo e o pid é compartilhado por todas elas. ({ "2" }) Toda fixação byte a byte ou por hash deve declarar, junto de si ou no cabeçalho de seu módulo, o que cobre e o que exclui deliberadamente — de modo que uma mudança transversal possa dizer de relance quais fixações estão no escopo e quais se tornaram silenciosamente detectores de mudança de todo o repositório. ({ "3" }) Um verde só pode ser reivindicado a partir da suíte COMPLETA: scripts/gate.sh executa <c1/>, captura o código de saída verdadeiro sem nenhum pipe no caminho e grava um recibo que nomeia o commit, a contagem de binários de integração, a contagem de testes e a duração; a verificação pré-push recusa um push cujo commit nenhum recibo válido nomeia, em uma árvore limpa. A repetibilidade é amostrada separadamente por scripts/check-repeatability.sh, que executa a suíte da biblioteca N vezes e falha se o conjunto de testes aprovados diferir.

# text
seg-b7cd952ff133 = TPL composto — travessia de holdover iniciada por P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); PL semicontínuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrente de K(IR/2); expoentes de fase τ/τ³/τ⁵

# text
seg-096b6cdfe2dc = TPL composto — envelope q.c. de LIL (impossibilidade + consistência)

# text
seg-1671add2210d = Nenhum holdover de pior caso finito (o supremo browniano diverge); HPL alocado por IR consistente com o envelope de Hartman-Wintner quando IR→{ "0" }

# text
seg-5a27c9f0a67d = Majorante de integridade do viés de rastreabilidade heterogênea de UTC(k)

# text
seg-fd09ab2adbf6 = Majorante de viés por fonte b = (U/k_cov)·Phi^-1(1-tail/2) + envelhecimento, inflando uma incerteza expandida publicada do Tipo B até uma cauda de integridade alocada; faz a ponte com tpl_scalar como bias_s

# text
seg-d75b900ad25f = Covariância cruzada de viés de rastreabilidade correlacionado (alocação insegura de modo comum)

# text
seg-0641f6d38c23 = Covariância cruzada de viés de N×N com termos fora da diagonal rho·b_i·b_j para fontes que compartilham um realizador de UTC(k); COMPROVADO correlated_fused_bias >= independent_fused_bias (a alocação independente ingênua subestima o viés fundido -> otimista -> insegura)

# text
seg-1a3bb032960f = Estatística de consistência de modo comum (falha de referência compartilhada invisível à separação)

# text
seg-1b03f522b8fc = Estatística de escore ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para um deslocamento de modo comum que a separação de soluções (contrastes ortogonais a { "1" }) não consegue ver; um deslocamento de modo comum a infla, enquanto as separações par a par permanecem planas

# text
seg-3359eee713a5 = Classificação do espaço nulo do datum lunar (aditividade de posto do LLR + elevação do defeito por libração)

# text
seg-6d722c176052 = Classificação do problema de datum de telemetria interna: uma única observação de distância contribui com posto { "1" } (espaço nulo de dimensão 6); o par origem-X e escala é quase nulo e a libração física do DE440 eleva o defeito a zero, enquanto o par permanece quase degenerado

# text
seg-3fd19007ea67 = Informação de datum lunar multitécnica (LLR + VLBI lunar + distância de orbitador)

# text
seg-23d0dd7d0666 = Linhas do jacobiano do datum para a distância LLR a refletores na Terra, o atraso diferencial de VLBI lunar com duas estações e a distância orbitador-baliza, sobre o datum de 7 parâmetros, combinadas em um único Fisher com pré-condicionamento consistente; demonstra que o rastreamento fora da direção radial (orbitador / diversidade em profundidade) rompe a degenerescência entre origem-X e escala, enquanto o VLBI transversal ajuda apenas de forma indireta

# text
seg-ab96cfc8d48c = Substrato de geometria de datum LLR lunar (refletores nos eixos principais, estações em terra, derivadas analíticas de distância)

# text
seg-40e91288f81a = Os cinco conjuntos de retrorrefletores do lado voltado para a Terra em metros no referencial do corpo PA e as estações em terra do LLR em coordenadas geodésicas; a colocação dos refletores do referencial do corpo para o inercial pela orientação PA do DE440; derivadas analíticas da distância Terra-refletor em relação ao datum de 4 parâmetros; e a matriz de Fisher somente LLR, que exibe a degenerescência entre lunocentro-X e escala que motiva a análise de 7 parâmetros

# text
seg-63a8571f8eb0 = Degenerescência entre distância e deslocamento de relógio na telemetria lunar de ida, e a lei de projeto da diversidade geométrica

# text
seg-cdd70f56051a = A degenerescência por nó entre distância radial e deslocamento de relógio do receptor é exata em { "1" } m para { "3.336" } ns (um sobre c). A marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) mostra que, em uma rede geometricamente diversa, a telemetria de ida e volta eleva a marginal por aproximadamente o mesmo fator que uma quantidade igual de dados de ida adicionais, enquanto no regime idealizado de nó único o ganho da ida e volta é maior em ordens de grandeza. A lei de projeto que decorre disso: a diversidade geométrica, e não a telemetria de ida e volta em si, é o que separa a escala do referencial lunar do deslocamento da escala de tempo na telemetria de ida; um vínculo de tempo de ida e volta ou externo é necessário apenas no regime de baixa diversidade ou de usuário único.

# text
seg-2c074d6260ba = Menu representativo de medições multitécnica e a regra aditiva de combinação de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock contém uma campanha de medição candidata como uma contribuição de informação de Fisher 7x7 mais um custo relativo escalar; block_from_rows constrói uma a partir de linhas brutas do jacobiano do datum, de modo que todo bloco seja pré-condicionado de forma idêntica por meio de lunar_identifiability::assemble_multi_info; combine soma a informação de um subconjunto escolhido, que é a regra correta porque a informação de Fisher é aditiva entre medições independentes; representative_lunar_menu fornece um menu determinístico de quatro blocos (LLR, uma baliza de limbo VLBI transversal, um orbitador do lado voltado para a Terra e um orbitador do lado oculto). O otimizador de projeto com restrição orçamentária que consome este menu não faz parte deste crate.

# text
seg-2d3347bcb15e = Tolerância de consistência entre provedores para um usuário de provedores mistos

# text
seg-9decf2cb6b0c = consistency_tolerance: inverte um orçamento de posição do usuário em uma exigência de concordância de Helmert entre provedores, por parâmetro (origem/escala/rotação), em um braço de alavanca de referência, opcionalmente inflada pelo CRLB de realização de provedor único P1

# text
seg-5450d921dfc9 = Orçamento de erro de interoperabilidade lunar multiprovedor e lei de projeto referencial-versus-efemérides

# text
seg-e1e30f5c17a6 = interop_budget: divisão entre redutível (vínculo de referencial comum) e irredutível (dinâmica) sob as convenções PerProvider / CommonFrameTie / CommonEphemeris, com a métrica de lei de projeto da fração irredutível (~{ "0.69" } em DE440/INPOP/EPM reais: um rótulo de referencial comum, por si só, deixa o piso dominante)

# text
seg-ebb827739614 = Limite de detecção/identificação por centelha de bloco bizantino na rede lunar autônoma por nó (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia o limite de codificação de estimação segura de estado / observabilidade esparsa na geometria da rede por nó: um par bizantino injeta uma combinação linear arbitrária das medições de que participa, e a rede DETECTA qualquer coalizão de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única qualquer coalizão de ≤ ⌊(block_spark − { "1" })/2⌋, onde block_spark é a menor coalizão de pares cujas assinaturas efetivas empilhadas P⊥·B_T têm deficiência de posto de coluna. A detectabilidade de um par é o POSTO DE COLUNA COMPLETO de P⊥·B_j (um bloco não nulo, mas com deficiência de posto, é um ataque não nulo que cai em range(G) e não deixa resíduo), e não meramente P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Piso de calibre temporal em holdover autônomo para a constelação lunar autorreferenciada (T4)

# text
seg-eb690e8f5c9b = holdover_floor estabelece que, em um conjunto de nós autônomos conectados apenas por medições entre nós, a taxa comum de relógio (δα_j += { "1" } ∀j) é um parâmetro livre do tempo do conjunto que está em N(GᵀWG): nenhuma quantidade de telemetria adicional entre nós consegue observá-la (rate_in_gauge = true, temporal_gauge_dim = { "2" } com o deslocamento comum). Este é o genuíno piso de holdover — o análogo temporal do calibre de posição do referencial rígido. Acrescentar um vínculo externo de taxa absoluta (um enlace direto a uma referência fora da rede) expulsa a taxa comum do espaço nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), provando que o piso é um calibre real, não um artefato do modelo de oscilador

# text
seg-25ffd6e1979c = Divisão comum/diferencial de provedor, unificação por deficiência de posto única e inclinação da lacuna de proteção (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Três facetas da decomposição única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), com o calibre datum⊕escala de tempo de 8 dimensões como N(G) e as state_dim − { "8" } = { "32" } direções observáveis como range(G): (T5) provider_mismatch_split classifica um viés comum de múltiplos provedores (∈ range(G)) como INDETECTÁVEL — exigindo um vínculo externo — e um viés diferencial (∉ range(G)) como automonitorado / DETECTÁVEL; (§{ "0" }) a unificação é que o MESMO subespaço cego range(G) governa a classe de falhas indetectáveis, de modo que o calibre de datum N(G) e o subespaço cego a falhas range(G) são uma só geometria, não duas; (g7) slope retorna a inclinação da lacuna de proteção de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para uma falha b ∈ range(G) (estimador corrompido com paridade zero) e finita para uma falha detectável

# text
seg-632add2dbd3c = Máscaras de sincronização de telecomunicações da ITU-T com PASS/FAIL e margem

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Emenda { "1" } (07/2025) ePRTC travado e holdover do ePRTC-A (incluindo o envelope de erro de tempo da Tabela { "3" }), G.8273.2 ({ "2023" }) Emenda { "2" } (11/2025) classes A-D de T-BC/T-TSC e G.8271.1 ({ "2022" }) Emenda { "3" } (05/2025) ponto de referência C, cada intervalo aberto ou fechado como a tabela o enuncia, com toda entrada marcada 'para estudo posterior' deixada de fora; um veredito e uma margem no ponto limitante por verificação, e o tempo até exceder cada orçamento. Executável como o tipo de cenário <c1/>

# text
seg-165ed2bc771a = Máscaras de geração de wander de sincronização de frequência da ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sete máscaras de geração de wander de MTIE e TDEV a temperatura constante para o tipo <c1/>: G.811 (09/1997) PRC (autônomo), G.812 (06/2004) Tipos I, II e III, G.8262 (10/2024) EEC Opções { "1" } e { "2" } e G.8262.1 (11/2025) eEEC (modo travado), incluindo os trechos em lei de potência que as tabelas escrevem (<c2/> e semelhantes), cada intervalo aberto ou fechado como impresso, medidos através do filtro de { "10" } Hz que as cláusulas enunciam (tomado como aplicado antes da amostragem); o cenário de referência scenarios/telecom-synce-eec.toml confronta um OCXO em marcha livre com as três máscaras de EEC. Não implementados: as tolerâncias de temperatura variável, o holdover, os transitórios, o jitter e a exatidão de frequência da G.811

# text
seg-5fc2ad88faf0 = Formatos de registro de relógio (relógio RINEX, ASCII do TimeLab, TICC do TAPR) lidos para uma série de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: uma camada de análise sintática que transforma um arquivo de relógio RINEX (registros AS/AR de um relógio nomeado, versões { "2" } e { "3.00" } a { "3.04" }), um registro ASCII de fase ou frequência no estilo TimeLab, ou um registro de marcas de tempo ou intervalos do TICC do TAPR em uma grade de fase uniforme, com tau0 declarado, vindo de um cabeçalho ou dado pelo espaçamento mediano, com toda lacuna, leitura fora da grade e duplicata contadas, e uma política de lacunas de recusa, trecho mais longo ou linear; conectada, por adesão opcional, à série de telecom-timing (<c1/>, acrescentando um bloco <c2/>) e ao tipo clock (<c3/>, acrescentando um bloco <c4/> com ADEV, TDEV e MTIE, o SHA-256 da tabela e o SHA-256 da fase; runs = { "1" }). Sem a tabela, ambos os tipos são idênticos byte a byte

# text
seg-acdb0337bce7 = Formatos de registro de relógio do linuxptp (ptp4l, phc2sys, ts2phc) e do chrony (tracking, statistics) lidos para uma série de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input com os formatos ptp4l, phc2sys, ts2phc, chrony-tracking e chrony-statistics: o deslocamento registrado de uma linha de servo do linuxptp (ns, a marca de tempo entre colchetes da própria linha, leituras anteriores à primeira vez que o servo informa s2 deixadas de fora e contadas) ou de um registro tracking ou statistics do chrony (s, por posição de coluna, data e hora UTC) torna-se uma grade de fase uniforme pelas mesmas políticas de lacuna dos outros formatos; um seletor de fonte (<c1/>) nomeia uma entre várias interfaces, relógios ou endereços; os registros alimentam a série de telecom-timing, o tipo clock e o tipo holdover-test

# text
seg-97aebb84576e = Teste de holdover pontuado a partir de um registro de erro de tempo fornecido pelo operador

# text
# c1: holdover-test
seg-ab533cf99c56 = O tipo <c1/>: um registro de erro de tempo (um registro de relógio do linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes que o operador declara para a remoção e a restauração do GNSS em uma etapa de linha de base, uma de holdover e uma de recuperação; a linha de base é medida contra as máscaras da ITU-T escritas para um relógio travado e o holdover contra as escritas para holdover ou relógio autônomo, o envelope de holdover do ePRTC-A e os orçamentos de erro de tempo; o holdover informa o deslocamento de frequência por mínimos quadrados que o sistema manteve, e a recuperação informa se e quando |TE| entrou em uma faixa declarada e permaneceu nela durante um tempo de permanência declarado, com o pico e o maior degrau. Todo limite é o que o tipo telecom-timing transcreve; os dois instantes são declaração do operador e não são verificados

# text
seg-94cbac97a1aa = Disponibilidade de sinais GNSS no Space Service Volume e além, comparada com o livreto SSV do ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = As varreduras de disponibilidade do tipo <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (usuário, época) com pelo menos um e pelo menos quatro sinais e a maior interrupção, para um usuário sobre uma esfera (a casca global de 2,562 pontos do livreto, { "14" } dias a { "1" } minuto) ou sobre uma trajetória (GEO, HEO, transferência lunar), a partir das órbitas keplerianas do anexo C do livreto, uma potência radiada mínima constante dentro do ângulo de referência fora do eixo de visada, bloqueio pela Terra dado pela esfera mais { "50" } km e um limiar de C/N0; antenas de usuário da tabela B10 do livreto

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efeitos de ionosfera, plasmasfera e atmosfera sobre sinais GNSS rasantes por raio de limbo, e o projeto de receptor para sinais fracos, no tipo <c1/>

# text
seg-1a1786ba90b6 = Uma ionosfera de Chapman, uma plasmasfera do tipo Gallagher e uma atmosfera neutra (curvatura por refratividade, absorção por oxigênio, desfocalização) integradas ao longo do raio reto entre o transmissor e o usuário: conteúdo total de elétrons inclinado, sua parte plasmasférica, atraso em excesso, altitude da tangente e a perda em enlaces rasantes; e um projeto de receptor para sinais fracos (integração coerente e não coerente, limite de bit de dados, auxílio, busca Doppler) que define o limiar de C/N0 a partir dos modelos de aquisição e de malha de rastreamento

# text
seg-6b8f9f3ca2a3 = Filtro de navegação GNSS embarcado para espaçonaves em órbita alta e de transferência lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = O modo <c2/> do tipo <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, polarização e deriva do relógio do receptor, uma escala de pressão de radiação solar) sobre pseudodistâncias cuja disponibilidade, ruído e C/N0 vêm da mesma geometria de enlace das varreduras; a verdade é integrada com J2, terceiros corpos Sol e Lua e pressão de radiação com sombra, o filtro modela J2 e os terceiros corpos e estima a pressão de radiação; informa erros de posição e velocidade dentro e acima das órbitas GNSS, a maior lacuna de medição e o NEES médio

# text
seg-5fc242476828 = Navegação relativa de uma formação de várias espaçonaves em órbita altamente elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = O modo <c2/> do tipo <c1/>: uma nave chefe e suas naves subordinadas executam cada uma o filtro absoluto; a posição da nave subordinada em relação à chefe é estimada subtraindo as estimativas absolutas e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambas as naves rastreiam, com a dinâmica relativa sendo a diferença de duas trajetórias não lineares

# text
seg-7038f6902820 = Termos de erro do interferômetro de átomos frios: ruído de fase do laser Raman, viés de curvatura de frente de onda e resolução da ambiguidade de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funções de biblioteca, ainda não acessíveis a partir de um tipo de cenário): a função de ponderação da fase Raman de um interferômetro de três pulsos quadrados (Cheinet et al. { "2008" }, Eq. { "8" }) com a forma fechada de fase branca (pi/2)^{ "2" } S_phi0/tau_R e um caminho numérico para qualquer espectro; o ruído de frequência do laser que o atraso da retrorreflexão não cancela (Le Gouet et al. { "2007" }, Eqs. { "9" } a { "11" }); o viés de frente de onda de desfocalização pura sigma_v^2/R de uma nuvem térmica e sua redução por um raio de detecção; a probabilidade de índice de franja errado erfc(pi/(sqrt({ "2" }) s)) para um auxílio de acelerômetro clássico e para dois tempos de interrogação, e sua inversa

# text
seg-363705e03bac = Predefinições de holdover de osciladores a partir de folhas de dados públicas

# text
seg-9750d9e0ec7a = Quatro predefinições — OCXO (Microchip OX-208), rubídio (Microchip 8040C), césio (Microchip 5071A, tubo de alto desempenho) e CSAC (Microchip SA.45s) — cada uma com os máximos de desvio de Allan, o envelhecimento e o limite de temperatura de sua folha de dados; um ajuste de mínimos quadrados não negativos de ruído de frequência branco + flicker + passeio aleatório escalado para envolver todo ponto da folha de dados, um piso de flicker nunca abaixo do valor de τ mais longo, envelhecimento linear e um termo sinusoidal de temperatura, sintetizado como um holdover com semente após uma perda de GNSS

# text
seg-d7e03158b972 = Segundos até que um relógio em marcha livre saia da guarda de um slot indexado no tempo, e a cadência de correções que o mantém dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = O tipo <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para obter a violação, o tempo restante, o intervalo de ressincronização líquido da latência da correção e as correções por dia, com cada termo detalhado e o dominante nomeado; relógios a partir dos seis padrões de ClockClass (TCXO, OCXO e RAFS acrescentados, cada um citando uma folha de dados), as predefinições de telecom-timing, uma folha de dados em linha ou um registro medido; uma violação além do maior tempo de média da fonte é sinalizada como extrapolada

# text
seg-2797643153dc = Nível de proteção de temporização para um receptor em órbita sob spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, acessível como a seção de spoofing do tipo <c1/>: velocidade e período de órbita circular, o maior tempo que um spoofer em solo consegue alcançar o satélite por passagem, o piso do monitor auxiliado por relógio e a latência de detecção por CUSUM, o nível de proteção condicional (piso mais deriva sobre a latência), o desvio que um spoofer com uma taxa máxima de rampa declarada acumula antes que o satélite deixe sua área de cobertura ou que uma verificação independente seja executada, e se cada verificação de contato com o solo ou de enlace cruzado é independente de um spoofer em solo

# text
seg-f134975d4ffa = Cascata de espectro em banda L com J/S por banda e C/N0 efetivo sob uma linha do tempo de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = O tipo <c1/>: uma grade frequência por tempo da densidade espectral de potência em banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais em suas potências mínimas recebidas da especificação de interface, e jammers de onda contínua, de banda estreita, de chirp e de ruído casado com tempos de ligar/desligar), cada célula com média sobre sua faixa e linha (chirps exatamente sobre varreduras inteiras e parciais, jammers por ciclo de trabalho), C/N0 efetivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por linha, J/S por banda, J/S em banda e uma cascata em SVG com barras de C/N0. O relatório traz uma verificação cruzada com a cadeia do tipo <c2/> sobre as mesmas entradas de enlace

# text
seg-6e0b9687e8ee = Urano e Netuno a partir da Tabela { "1" } de Standish, Plutão e velocidades planetárias

# text
seg-df3bf502dfe9 = Posições de Urano e Netuno a partir da Tabela { "1" } de Standish (o padrão entre { "1800" } d.C. e { "2050" } d.C.), de Plutão a partir da linha da Tabela { "1" } de { "1992" } que a página atual do JPL não lista mais, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com o movimento médio que os elementos implicam, mais a rotação da elipse pelas taxas de periélio, inclinação e nodo

# text
seg-a50be56f605a = Posições da Lua e de sete luas principais (Fobos, Deimos, as luas galileanas, Titã)

# text
seg-2cfbe5a1eece = A Lua geocêntrica a partir da série de Montenbruck & Gill (cujo termo de -1.3972 graus por século já a refere ao equinócio J2000), e as posições e velocidades planetocêntricas de Fobos, Deimos, Io, Europa, Ganimedes e Calisto a partir dos elementos médios de Dinâmica do Sistema Solar do JPL no plano de Laplace de cada lua, com a taxa de longitude média tomada da taxa de rotação síncrona da IAU (a tabela imprime o período com poucos dígitos para manter a fase), e de Titã a partir do modelo de rotação da IAU (a lua sobre o eixo x fixo ao corpo, com sinal negativo, na distância média), porque a linha impressa do plano de Laplace de Titã não reproduz o Horizons nem em sua própria época

# text
seg-8b8c8e28ece9 = Constantes físicas de cada corpo do sistema solar e o relatório do sistema inteiro

# text
# c1: solar-system
seg-d225a30de35c = Body ganha Mercúrio, Vênus, Júpiter, Saturno, Urano, Netuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã (parâmetro gravitacional, raio de referência, J2 onde publicado com o raio ao qual se refere, polo e meridiano de origem da IAU), uma busca por nome e um registro BodyFacts (código NAIF, classe, pai, raio equatorial e médio); o tipo <c1/> os informa para todos os dezoito corpos com as posições, os tempos de luz e uma trilha orbital ao longo de uma revolução, cada corpo rotulado VALIDATED ou MODELLED

# text
seg-87ab655f8270 = Posicionamento em torno de qualquer corpo do sistema solar com uma constelação local e um enlace de espaço profundo a partir da Terra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = O tipo <c1/>: um orbitador ou um módulo de pouso em superfície em torno de um corpo escolhido pelo nome navega com pseudodistâncias de ida de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do corpo, um relógio de usuário desconhecido) e uma distância bidirecional opcional, livre de relógio, a partir da Terra, com a direção e a distância da Terra tomadas da efeméride analítica em cada época; linhas de visada bloqueadas pela esfera do corpo e uma máscara de elevação na superfície; por época, o GDOP e o PDOP apenas da constelação (orbit::dop), a incerteza formal de posição com e sem a linha da Terra, e soluções de Gauss-Newton semeadas (batch_ls::gauss_newton) de cada modo, com o tempo de luz e o tempo de ida e volta do corpo à Terra

# text
seg-7d4d7200cbca = Mapas de cobertura e de diluição de precisão para projetos arbitrários de múltiplas constelações em escala, em torno de qualquer corpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = O tipo <c1/> além dos dois casos fixados: projetos explícitos e de múltiplas camadas, várias constelações por execução com um relógio de receptor por constelação, a Terra, a Lua e Marte a partir das constantes de corpos, a predefinição do BeiDou (fase de órbita média e cruzamento geossíncrono inclinado em { "118" } graus L modelados), satélites em visada por célula, GDOP, PDOP, HDOP, VDOP e disponibilidade, rastros no solo subamostrados e um pré-filtro de visibilidade por latitude do subsatélite que executa um projeto de { "5" } 000 satélites em uma grade de { "10" } graus em uma fração de segundo

# text
seg-278c77438493 = Uma missão encadeada entre tipos de cenário em uma única linha do tempo compartilhada

# text
# c1: campaign
seg-3dcfb26f6234 = As fases do tipo <c1/>: cada fase executa um ou mais cenários de tipos existentes por run_toml, lê suas saídas em canais nomeados (erro de tempo e guarda do relógio, razão média efetiva portadora-densidade de ruído e piso de rastreamento, nível de proteção vertical e limite de alerta, erro de posição, satélites em rastreamento, indicadores de alarme) por predefinições por tipo ou caminhos de resultado explícitos, as coloca no início da fase e as mantém em uma grade comum, com limites de fase e eventos; o estado é repassado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número de uma fase anterior escrito no cenário seguinte) e end_at (uma fase termina em um instante calculado por uma execução, como o instante de detecção de um monitor de spoofing); um hash da campanha e um resumo sobre todos os resultados dos membros

# text
seg-ad6105af464c = Varreduras de parâmetros e conjuntos Monte Carlo semeados sobre qualquer tipo de cenário

# text
# c1: campaign
seg-95921611839e = As seções sweep (de uma a três chaves com pontos de qualquer tipo, sobre os valores de eixo da varredura genérica, opcionalmente um conjunto em cada nó) e monte_carlo do tipo <c1/>: a realização k é executada em base_seed + k; cada métrica informa média, desvio padrão, percentis 5º/50º/95º por posto mais próximo e um intervalo de confiança de { "95" } % por bootstrap de percentis com semente fixa sobre a média (inertial::metric_stat); as unidades das métricas são lidas do próprio bloco de unidades do tipo varrido

# text
seg-24327a0ed82e = Vários cenários sob condições compartilhadas, com um resumo combinado

# text
# c1: campaign
seg-5833fb3b06e3 = A seção compose do tipo <c1/>: valores compartilhados nomeados (por exemplo, a potência e a posição de um jammer) escritos em cada membro nas chaves às quais os vincula, cada membro executado e, por métrica, o menor valor, o maior valor e o valor médio entre os membros, com o membro nomeado; as unidades das métricas devem concordar entre os membros

# text
seg-0bc866720bde = Otimização limitada de uma métrica sobre parâmetros de campanha

# text
# c1: campaign
seg-f9bdb89c2b4f = A seção optimize do tipo <c1/> (CAP-32): de uma a três chaves de cenário com pontos limitadas a [lo, hi] em escala lin ou log, uma métrica lida por caminho de resultado, objetivo minimize, maximize ou target; método grid (os valores de eixo da varredura) ou um simplex determinístico de Nelder-Mead em coordenadas normalizadas, com projeção na caixa e os coeficientes padrão; uma métrica ausente ou não finita recebe a pior pontuação e permanece no trace; com runs > { "1" }, a métrica é a média sobre sementes comuns; cada avaliação é uma execução real do tipo nomeado, listada em trace e contada no resumo de reprodutibilidade

# text
seg-652e28dfa10f = Projetos de sinais de posicionamento, navegação e temporização em órbita baixa da Terra: rastreamento de código, aquisição, compatibilidade com GNSS e uma troca de bandas para qualquer sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = O tipo <c1/>: projetos de sinais parametrizados (banda, largura de banda de transmissão, alocação da ITU; componentes de aquisição, de dados e piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, participações de potência, subportadoras FDMA, comprimentos de código e taxas de dados) a partir de arquivos de predefinições públicas compilados no programa (Xona Pulsar, Iridium STL, sinal de oportunidade do Starlink, CentiSpace, um projeto genérico em banda C e projetos genéricos UHF/L/S/C/C larga, cada um com sua URL de origem e valores não publicados rotulados REPRESENTATIVE) ou escritos em linha; por sinal, a densidade espectral de potência limitada em banda, as frações de potência em banda, a largura de banda de Gabor, o jitter de código contra C/N0 e espaçamento e a exatidão de telemetria, o espaço de busca de aquisição, a probabilidade de detecção por lei quadrática e o tempo médio de aquisição serial e paralela em código, o coeficiente de separação espectral para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a degradação de C/N0, e a tolerância de J/S CW, de banda larga e casada a partir da cadeia de SSC do tipo spectrum; uma troca de bandas entre atraso ionosférico, perda em espaço livre, exatidão de telemetria com C/N0 igual e EIRP igual e tolerância a jammers; e verificações qualitativas de forma de um projeto contra uma medição descrita

# text
seg-c2b9c8e4a364 = Cascata de espectro multibanda (UHF, L, S, C) com sinais projetados e jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = O tipo <c1/> estendido além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com todos os componentes, limitado em banda à largura de banda de transmissão, com C/N0 e J/S referidos ao componente rastreado) ou como uma portadora e modulação personalizadas; painéis extras de cascata sobre qualquer faixa de frequência, na mesma linha do tempo e escala de cores; um jammer de banda larga (barragem) ao lado de CW, banda estreita, chirp e ruído casado; J/S por banda e C/N0 efetivo a partir da cadeia inalterada de coeficientes de separação espectral

# text
seg-d9eb3e7e69c2 = Uma passagem LEO-PNT e seu orçamento de enlace por banda contra os satélites GNSS MEO em visada

# text
# c1: leo-pass
seg-d986e44443dd = O tipo <c1/>: satélites a partir de uma passagem projetada, elementos, um TLE por meio do SGP4 ou uma constelação Walker de constellation-design; por banda e época, os ângulos de visada, a distância, a taxa de variação de distância e a aceleração de distância em forma fechada (verificadas a cada execução contra diferenças centrais e informadas), perda em espaço livre, EIRP com um diagrama isoflux, gaussiano ou plano, uma antena de usuário do tipo patch, hemisférica ou isotrópica, atenuação gasosa do ITU-R P.676-10 Anexo { "2" }, chuva e cintilação da P.618, perda de entrada em edificações da P.2109, descasamento de polarização, temperatura de ruído do sistema, C/N0, Doppler e taxa de Doppler, e o atraso de primeira ordem a partir de um TEC inclinado de Klobuchar ou de TEC vertical, escalonado pela fração de Chapman abaixo do satélite; pares livres de ionosfera com ruído de código no pico da passagem; portadoras do Galileo ou do GPS a partir das potências recebidas de seus documentos de interface, pelo mesmo receptor

# text
seg-95a077a980b6 = Predefinições nomeadas de sistemas LEO-PNT com fontes declaradas e um motor agnóstico quanto ao sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérica (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como sinal de oportunidade apenas de Doppler, CentiSpace e uma predefinição opcional Celeste IOD, cada uma com sua fonte marcada PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP, a de workshop no arquivo opcional de predefinição Celeste IOD, compilada somente quando esse arquivo existe; toda banda e órbita pode ser sobrescrita em um cenário, e um cenário pode não nomear predefinição alguma

# text
seg-a39f34973373 = Posicionamento de baixa energia: tempo até a primeira solução e energia por solução contra o ciclo de trabalho

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy e a seção [iot] do tipo <c1/>: integração coerente limitada pela taxa de Doppler, somas não coerentes de lei quadrática até um limiar de detecção, uma busca em faixas de Doppler sobre o envelope de usuário estático da órbita (a frio) ou uma janela assistida (a quente), busca de código paralela ou serial, tempo da mensagem de navegação em partida a frio, energia por solução e vida útil da bateria entre intervalos de solução, para cada banda LEO e o sinal GNSS

# text
seg-8121e7db3db3 = Atualização da mensagem de navegação LEO no meio da passagem com verificação de continuidade na troca

# text
# c1: leo-navmsg
seg-34c310d85c42 = A análise midpass-update do tipo <c1/>: a passagem mais alta sobre um usuário dentro de um intervalo de busca, mensagens em um cronograma global com períodos de uso centrados em suas janelas de ajuste, e em cada troca o salto de posição 3D, o salto de relógio, o salto de pseudodistância do usuário, o maior salto em qualquer linha de visada visível (forma fechada sobre o cone de nadir), o erro de distância antes e depois, e PASS/FAIL contra um limiar

# text
seg-7635a8339e78 = Codificação binária documentada da mensagem de navegação LEO com um orçamento de erro de quantização

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: o quadro próprio do Kshana (preâmbulo, versão, modelo, comprimento, carga útil, CRC-24Q) para os quatro modelos de efemérides, o polinômio de relógio, SVID, issue of data, banda, saúde, um conjunto de Klobuchar, coeficientes NeQuick-G e parâmetros UTC, cada campo com largura e passo declarados (field_table), quantização com recusa fora da faixa e um orçamento da maior variação de posição e de relógio que uma variação de meio passo de cada campo produz ao longo da janela de validade

# text
seg-17ca41d7fd71 = Exportações no estilo RINEX 4 e em CSV de mensagens de navegação LEO

# text
seg-185e12ccef0d = leo_navmsg::text: um bloco no estilo RINEX 4 (cabeçalho de registro > EPH, linha de satélite e época com três termos de relógio, linhas de órbita de transmissão D19.12) com letra de sistema L e tipos de registro KP16, KRAC, LU22 e APOL, rotulado em todo cabeçalho como uma extensão do Kshana que não faz parte do RINEX { "4.02" }, e uma tabela CSV com um esquema de colunas padrão e esquemas predefinidos, cada um com um importador

# text
seg-e79047fc95af = Polinômio ECEF de relógio zero do ATOMIC e a comparação sintética de modelos LEO em cinco altitudes

# text
seg-e261843e35b1 = a variante EcefPoly de leo_navmsg::elements::EphemerisModel: um polinômio ECEF por eixo sem termos de relógio, o termo relativístico a partir de -2 r.v/c^{ "2" }, pontuado contra um relógio corrigido. Também a análise de comparação de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta o modelo de 22 parâmetros às cinco altitudes do artigo sobre arcos de 20 minutos de uma órbita integrada pelo Kshana e imprime o resultado ao lado do SISRE publicado

# text
seg-d2e18c8bdc14 = Posicionamento a partir do Doppler de LEO, com um ou vários satélites, com estados de deriva de relógio e de velocidade

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamento por Gauss-Newton em lote a partir da taxa de variação de distância com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade constante do usuário como opção, uma pseudomedição de altura para um usuário em superfície, passos amortecidos; a covariância formal na verdade; projeções ao longo da trajetória, transversal e vertical; a exatidão de passagem única contra o deslocamento transversal do usuário; o instante de maior aproximação. O modo doppler do tipo <c1/> acrescenta o erro contra a duração da janela e um modo de sinais de oportunidade somente com Doppler (a predefinição starlink-sop)

# text
seg-7f462969d2d4 = Posicionamento conjunto por pseudodistância de GNSS e LEO com vieses entre sistemas e modelos de erro por sinal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de receptor por sistema (o viés entre sistemas estimado junto com a posição) ou um deslocamento de transmissão conhecido na escala de tempo de referência; sigmas por medição fornecidos pelo chamador, por padrão o ruído térmico da malha de captura de atraso do motor (navsignal::dll_code_jitter_chips) no C/N0 da elevação combinado com o erro de distância de sinal no espaço; DOP não ponderado (GDOP, PDOP, HDOP, VDOP, TDOP) no referencial geodésico local, sigmas formais leste-norte-cima e os sigmas dos vieses; o modo joint do tipo <c1/> compara soluções só com GNSS, só com LEO e fundidas e varre o DOP contra o número de satélites LEO acrescentados

# text
seg-ee9a4a0cb530 = Convergência do posicionamento preciso por ponto apenas com GNSS e com aumento por LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Um filtro de Kalman estendido de PPP float sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de receptor branco, um viés entre sistemas por sistema extra, um atraso zenital úmido em passeio aleatório mapeado por 1/sin(elevação), uma ambiguidade float por arco de satélite acrescentada no nascer e descartada no ocaso, e o erro de órbita e relógio precisos comum ao código e à fase de um satélite, processado como uma única atualização correlacionada de duas linhas em forma estabilizada de Joseph; medições simuladas a partir do mesmo modelo; tempo de convergência (erros abaixo dos limiares até o fim da execução), curvas de erro e o NEES de posição médio da execução para apenas GNSS e cada caso LEO, executado como o tipo <c1/>

# text
seg-9306f1c06081 = Transferência de tempo para UTC assistida por LEO contra o C/N0 e o oscilador do receptor

# text
# c1: leo-pvt
seg-c618feb01476 = Medições de relógio de todo satélite LEO em visada em uma posição conhecida, combinadas por variância inversa a partir do modelo de ruído de pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o ruído de frequência branco e de passeio aleatório da classe do oscilador (slot_timing::ClockNoise, clock_state::ClockClass; a variância de deriva de holdover::coast_phase_variance), um relógio de verdade semeado a partir dos mesmos níveis, e a expressão de tempo do sistema para UTC da seção { "20.3.3.5.2.4" } do IS-GPS-200 com uma incerteza do deslocamento de transmissão acrescentada como viés por execução; o modo timing do tipo <c1/> varre osciladores e deslocamentos de C/N0

# text
seg-d92777401093 = Sistemas LEO PNT nomeados como predefinições de dados opcionais, cada um com sua fonte

# text
seg-5130bfe2410c = Entradas agnósticas quanto ao sistema: cada sistema é composto de camadas Walker, elementos explícitos ou uma predefinição GNSS, um sinal (portadora, taxa de chip, largura de banda, potência recebida ou faixa de C/N0), um SISRE, um sigma de Doppler e um modelo de relógio; as predefinições preenchem apenas o que um cenário deixa de fora, um arquivo cada uma, com fontes marcadas PUBLIC (com uma URL), WORKSHOP ou DERIVED e os valores não publicados listados como representativos: Xona Pulsar X1/X5, Iridium STL, sinais de oportunidade do Starlink, CentiSpace, um sistema representativo em banda C, o modelo de efemérides de relógio zero do ATOMIC e uma predefinição derivada de workshop no arquivo opcional de predefinição Celeste IOD, retida ao se excluir esse arquivo e seus cenários

# text
seg-dec52b5b9cd6 = Um sistema LEO-PNT de ponta a ponta: projeto de sinal, orçamento de enlace da passagem, mensagem de navegação e posicionamento fundido, com a saída de cada etapa repassada à seguinte

# text
# c1: leo-pnt-chain
seg-39443b31d418 = O tipo <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chip e a divisão de EIRP de uma banda leo-pass; a passagem fornece o C/N0 do componente rastreado e o jitter de código limitado em banda por época; uma reta de C/N0 por mínimos quadrados em sin(elevação), o SISRE da mensagem leo-navmsg (ajustado na órbita do satélite da passagem, mais um termo declarado de determinação de órbita em raiz da soma dos quadrados) e a portadora e a taxa de chip do projeto vão para todo sistema LEO de uma solução conjunta leo-pvt e, opcionalmente, para os casos LEO de leo-ppp; cada repasse é informado com seu valor e unidade

# text
seg-55ca63edff02 = Detecção de spoofing por consistência de Doppler de LEO e da geometria da passagem

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = A seção <c2/> do tipo <c1/>: um spoofer falsifica, de forma autoconsistente em distância e em taxa de variação de distância, os sinais vistos em uma posição alegada que salta e/ou é empurrada para longe da verdadeira após um início (por banda LEO e para o sinal GNSS MEO); o receptor prevê toda taxa de variação de distância a partir da órbita de transmissão e de uma posição e velocidade prévias independentes, e testa as taxas de variação de distância medidas com uma estatística qui-quadrado de mínimos quadrados generalizados sobre uma janela de épocas (a deriva do relógio como incômoda ou com um prior), nos canais GNSS, nos canais LEO e em todos os canais, com ruído térmico da malha de captura de frequência a partir do C/N0 (Kaplan & Hegarty { "2006" }, seção { "5.6.2" }); probabilidade de detecção pela lei qui-quadrado não central a uma probabilidade declarada de falso alarme, com a detecção declarada a uma probabilidade declarada de perda de detecção

# text
seg-5f341f85ac07 = Detecção de spoofing por consistência entre bandas de um sinal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO e par de bandas de telemetria, a seção <c1/> forma a combinação de pseudodistâncias livre de geometria, remove o modelo ionosférico do receptor e testa seu salto de época a época contra o ruído de código das duas bandas e uma taxa ionosférica não modelada tolerada declarada (gaussiana bilateral, probabilidade de detecção exata); um spoofer que falsifica algumas bandas e outras não, ou todas as bandas sem a ionosfera, é visto no seu início; um que falsifica todas as bandas e simula a ionosfera não é, o que o resultado declara

# text
seg-97dbcd5f2728 = Sondagem da ionosfera: TEC inclinado a partir do atraso em duas bandas de uma passagem LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de um satélite <c1/>, o relatório fornece o conteúdo total de elétrons inclinado que a combinação de código livre de geometria recupera no pico da passagem, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), e seu 1-sigma a partir do ruído térmico de código das duas bandas, de modo que qualquer projeto LEO-PNT multibanda possa ser avaliado como sondador ionosférico

# text
seg-1fdbb476c8ab = Pontuação de confiança marítima: a agregação das evidências dos monitores em uma pontuação de 0-100 e suas três faixas

# text
seg-0d76b33144f1 = Cada monitor reduz sua evidência a uma razão entre a estatística e o limiar; a pontuação é { "100" } menos a soma, sobre os monitores, do peso vezes uma rampa linear limitada da razão ({ "0" } até { "0.5" }, { "1" } em { "1.5" }), limitada a { "0" } a { "100" } e arredondada a { "0.1" }, com faixas em { "90" } e { "55" }; cada época lista os monitores que deduziram e seus pontos.

# text
seg-51640405c9b7 = Eventos SIEM da telemetria de confiança: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de mudança de faixa (ou por época) como cargas Log Event Extended Format { "2.0" } em um envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado.

# text
seg-c04042b0270a = Limiares de interferência do receiver-trust calibrados no conjunto de dados JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: a calibração pré-registrada dos monitores de queda de C/N0, de AGC e de indicador de jamming no conjunto de dados público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtido em tempo de execução, nunca incorporado): por pasta, uma linha do tempo de { "1" } s a partir de mon_rf.csv e rinex.csv, os monitores executados uma vez, cada época posterior à calibração rotulada como limpa ou de jamming a partir do attack_log da pasta (deslocado de CEST para UTC, guarda de { "60" } s), cada limiar varrido sobre uma grade fixa, o menor limiar com probabilidade de falso alarme limpo agrupada de no máximo { "0.01" } selecionado, e contagens reservadas por exclusão de uma pasta; uma verificação cruzada do leitor UBX. A seleção é fornecida apenas como o perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); a regra padrão e toda saída sem ele permanecem inalteradas

# text
seg-65a8361b4a22 = Pontuação do Jammertest: um registro de receptor pontuado por ensaio programado (latência de detecção, alarmes perdidos, alarmes falsos, tempo de recuperação) em relação ao plano de ensaios publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): o catálogo de ensaios e o plano de transmissão da NPRA (MIT, obtidos com um SHA-256 fixado, nunca incorporados ao repositório) lidos como verdade programada, com os identificadores do catálogo preservados; uma execução de receiver-trust pontuada por ensaio (primeiro alarme menos o início planejado, detectado/tardio/perdido em relação a uma tolerância, tempo até o primeiro trecho sem alarmes, alarmes fora de todos os intervalos e da sua margem de guarda), com um pacote de evidências assinado que carrega o quadro de pontuação. O cronograma são intervalos planejados, não horários de transmissão registrados

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): um mapeamento das saídas do Kshana para cláusulas de referenciais públicos apenas por número, preenchido a partir das execuções fornecidas; um resultado conta para uma capacidade somente quando traz as evidências que o mapeamento indica, um conjunto vazio não evidencia nada, e a redação é "fornece evidências em apoio de"; o relatório não é uma constatação de que algum referencial normativo foi atingido, nem uma classificação ou aprovação por quem quer que seja.

# text
seg-98c360d82d56 = Integrações marítimas: plugin Signal K, fluxo de gate e painel de pontuação para OpenCPN, build de referência

# text
seg-7af9ce566646 = A pontuação de confiança, a faixa, os motivos, o estado do gate e a posição informada pelo receptor, publicados em navigation.gnss.kshana em um servidor Signal K com uma notificação de aviso, de alarme e normal (integrations/signalk); o fluxo NMEA controlado pelo gate, com o fix marcado como inválido enquanto a confiança está colapsada e uma sentença PKSHT por ciclo, servido ao OpenCPN por TCP pelo próprio gate ou por um pequeno relay, e um painel de pontuação nativo do OpenCPN que lê a sentença PKSHT (integrations/opencpn); e unidades systemd e um contêiner que executam o gate (deploy/reference-build). Onde estes mostram saída, trazem a declaração consultiva: Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
seg-89ab9ef155eb = Rastreamento BOC({ "1,1" }): escala do DLL e resolução de ambiguidade bump-jump (opcional)

# text
seg-ef24be9b5917 = O campo boc de iq::track::LoopConfig (opcional, None por padrão): os três discriminadores do DLL reescalados para ler o erro de código em chips com inclinação unitária no pico principal do BOC({ "1,1" }) senoidal, e um monitor bump-jump sobre correlatores muito adiantado e muito atrasado a meio período da subportadora ({ "0.5" } chip) que salta o NCO de código em direção ao pico principal quando um contador crescente/decrescente atinge N ({ "8" } por padrão). Sem a opção, toda saída permanece inalterada.

# text
seg-2c32955cbfb3 = Canal de cintilação ionosférica IQ (modelo de Cornell) em relação à cintilação GPS L1 medida a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, o modelo de cintilação de Cornell (intensidade de Rice, espectro de Butterworth de segunda ordem, fase arg z) conduzido com o S4 e o tempo de decorrelação da intensidade de uma janela medida, comparado naquilo que gera além dessas duas entradas; realdata::scint50 lê o registro medido, remove a tendência e executa a comparação.

# text
seg-160507ac3702 = Opção CFAR por média de células (cell-averaging) na aquisição IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar e ca_cfar_cells (opcional): uma célula de uma grade de aquisição é comparada com a média de células de referência de sua linha Doppler (atrasos de guarda e de passo, dando a volta no período), com um fator alpha definido a partir da probabilidade de falso alarme do CA-CFAR em forma fechada para M blocos não coerentes (ca_cfar_pfa, ca_cfar_alpha). O detector de potência da amostra continua sendo o padrão e toda saída existente permanece inalterada.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou e Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resolve, apenas por nome (MORE_BAND_NAMES), GLONASS L1OF e L2OF em todo canal FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a e B3I (BPSK({ "10" })) e Galileo E6 (BPSK({ "5" })), com as portadoras e as potências mínimas recebidas de seus documentos de controle de interface; o conjunto de bandas padrão e toda saída existente permanecem inalterados.

# text
seg-7b1ae0c7ca28 = Códigos terciários do LunaNet AFS e camada de mensagem (SB1 BCH, CRC-24Q, entrelaçador) em relação ao LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: padrão de sincronização, codificador SB1 BCH({ "51,8" }) e decodificador de 256 hipóteses, CRC-24Q, o entrelaçador em bloco de { "60" } x { "98" }, um verificador de fluxo de símbolos (kshana lunanet-afs-check) e um gerador de fluxo de teste com subquadros provisórios. A codificação LDPC de taxa 1/2 dos subquadros { "2" } a { "4" } não está implementada (suas matrizes estão em um anexo separado).

# text
seg-0d7b17524c04 = Pacotes de normas: cenários pontuados em relação a limiares declarados antes da execução

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): os perfis de teste do framework de PNT resiliente do DHS para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e os pacotes de monitorar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }: cada teste executa um tipo de cenário incluído e compara campos de resultado com limiares declarados no pacote, e os testes que precisam de um registro de receptor são listados como NEEDS INPUT e não são pontuados.

# text
seg-8a8f2c85e0c3 = Pacote de evidências de ida e volta em laboratório (cenário, condições de teste, registro do receptor, pontuação)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) e a exportação de registro de receptor kshana.test-conditions/1 de kshana bench-export: um pacote assinado que registra o hash do cenário, o hash das condições declaradas, o hash do registro e a pontuação em relação aos eventos declarados, e recusa condições que divergem dos eventos de pontuação ou um registro cujo hash não é o declarado. Nenhum sinal é escrito, reproduzido ou agendado.

# text
seg-a9189e4fe413 = Motor de rastreamento IQ em relação ao GNSS-SDR { "0.0.19" } em gravações independentes

# text
seg-364de05e5b1b = O motor completo de rastreamento da camada IQ (iq::track por meio de kshana iq track: transferência da aquisição, correlatores, NCOs, PLL Costas de segunda ordem de { "15" } Hz, DLL de envoltória EML de primeira ordem de { "2" } Hz auxiliado pela portadora, indicador de travamento e estimadores de C/N0) em GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-259d201c2ff8 = Ganhos de antena CRPA no tipo de cenário jamming em relação a um recálculo independente em numpy

# text
seg-192144c57783 = A seção opcional [crpa] do tipo de cenário jamming: um feixe por canal em direção a cada satélite (anulação com o jammer como nulo, ou MVDR sobre sigma^{ "2" } I + P_j a_j a_j^H), escalando o ruído de cada enlace por ||w||^{ "2" } e o jammer por |w^H a_j|^{ "2" } antes da equação C/N0 antijam existente.

# text
seg-a2f34cff9338 = Sombreamento do terreno sobre o jammer no tipo de cenário jamming em relação a um recálculo independente em numpy sobre uma tile SRTM real

# text
seg-334c569d9cae = A seção opcional [terrain] do tipo de cenário jamming: o perfil do terreno em círculo máximo entre o jammer e o receptor em uma tile SRTM .hgt, com a protuberância da Terra segundo um fator k, o gume de faca dominante (maior nu de Fresnel-Kirchhoff) e a perda por gume de faca único da ITU-R P.526-15 seção { "4.1" }, subtraída da potência recebida do jammer.

# text
seg-825c121c7512 = Histerese de aquisição e quantizador do front end no tipo de cenário jamming em relação a recálculos independentes

# text
seg-f7207263d881 = A seção opcional [acquisition] do tipo de cenário jamming (um satélite é adquirido em ou acima de um limiar de aquisição, após um atraso de readquisição, e mantido enquanto estiver em ou acima do limiar de rastreamento) e a seção [front_end] (a leitura do AGC { "10" } log10({ "1" } + J/N) e a perda do quantizador do ADC para entrada gaussiana, retiradas de todo enlace e sinalizadas como não válidas para jammers não gaussianos).

# text
seg-9c46f1c76486 = Entrada em sincronismo do FLL com limite, abaixo do piso de transferência de FLL para PLL do projeto padrão (opcional)

# text
seg-efa1d1a9e904 = carrier.fll_pull_in_max_s opcional de iq::track (o campo fll_pull_in_max_s de iq::track::LoopConfig): com fll_assist = pull-in, o FLL transfere para o PLL após um tempo fixo de entrada em sincronismo, qualquer que seja o PLI, com uma permanência de retorno correspondente até o PLI atingir pela primeira vez fll_off_pli.

# text
seg-ac0f97e945a7 = Leitor de soluções .pos do RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lê um arquivo de solução do RTKLIB (tempo em calendário ou em semana GPS/TOW, posição em latitude/longitude ou ECEF, satélites usados) para a linha do tempo do receiver-trust (receiver_trust::machines::rtklib).

# text
seg-849393517c04 = Registros ASCII e binários NovAtel OEM7 (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lê BESTPOS (posição), RANGE (C/No por sinal) e RXSTATUS (o sinalizador de jammer do receptor, como autorrelato da época) de registros OEM7 ASCII e binários, com CRC verificado, somente leitura (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = Leitor de relação portadora-ruído RTCM { "3" } MSM4 e MSM7 para receiver-trust

# text
seg-0a0c9976236f = Lê o C/N0 de toda célula de sinal das mensagens RTCM { "3" } MSM4 e MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de um fluxo de quadros, com CRC-24Q verificado (receiver_trust::machines::rtcm3). Layouts das tabelas do pyrtcm, sob licença BSD, não do texto da norma RTCM.

# text
seg-cd554a7c1649 = Adaptador de monitor do GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lê mensagens do GNSS-SDR Monitor (Gnss_Synchro) e do monitor PVT, retransmitidas como linhas JSON com os nomes de campo do proto, para C/N0 por canal, fix, satélites usados, HDOP e céu (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = Ingestão de registros de IMU, entrada de rumo do giroscópio e ajuste de Allan dos parâmetros dos sensores híbridos

# text
seg-9dadc819daef = Lê um CSV de IMU (colunas documentadas, ou o layout EuRoC); integra a taxa de guinada no rumo que o monitor heading-course lê ([log.imu]); e ajusta os parâmetros de ruído do acelerômetro e do giroscópio dos cenários híbridos e de fusão a partir de um registro estacionário pelo desvio de Allan sobreposto (imu-fit).

# text
seg-15a852a2dcb0 = Descoberta MQTT do Home Assistant e exportador de estado para a telemetria de confiança

# text
seg-6d6b07b26966 = Um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant para o fluxo de confiança, impressos como texto em todas as superfícies e publicados por MQTT { "3.1.1" } QoS { "0" } pela CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, formato mqtt).

# text
seg-68caf86157c2 = Pacote ROS { "2" } do receiver-trust e ponte gnss_lib_py

# text
seg-e7d7d99fe538 = Uma ponte sem ROS que escreve mensagens de fix e de satélites como NMEA e as pontua pela interface Python (integrations/ros2/kshana_trust), e uma ponte de NavData do gnss_lib_py para o receiver-trust pelo formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Testes
