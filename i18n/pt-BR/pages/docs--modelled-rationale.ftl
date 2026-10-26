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
seg-dd8ce373d1f6 = Recepção de GNSS da Terra à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época, calcula o ângulo fora do eixo em relação ao nadir do transmissor, se a Terra oculta o caminho reto, a distância oblíqua e sua perda no espaço livre, o ganho de transmissão nesse ângulo, a potência recebida e a densidade de portadora sobre ruído; depois agrega apenas os enlaces que superam um limiar de rastreamento e varre uma revolução completa da constelação, de modo que a resposta é uma DISTRIBUIÇÃO e não um único instantâneo. Três fatos determinam o resultado e o relatório declara cada um: a Terra subtende { "13.90" } graus a partir do raio da constelação, de modo que o PICO do feixe é geometricamente indisponível a qualquer raio dirigido à Lua; o que resta é a borda do lóbulo principal e os lóbulos laterais, o regime em que o LuGRE operou na Lua em { "2025" }; e a perda de percurso em L1 é de cerca de { "208" } dB, uns { "25" } dB a mais do que um usuário terrestre paga. MEASURED na geometria incluída de 24 satélites de classe GPS ao longo de { "64" } épocas de um período orbital: disponibilidade de SINAL { "0.375" } com um melhor enlace de { "30.93" } dB-Hz, e disponibilidade de SOLUÇÃO { "0.000" } - no máximo dois enlaces rastreáveis simultâneos, nunca os quatro de que uma posição precisa. A separação dessas duas disponibilidades é o ponto central, e o relatório se recusa a deixar que sejam confundidas: o GNSS da Terra à distância lunar é uma camada de classe de TEMPORIZAÇÃO, não de classe de posição, e um a priori de resiliência em camadas deve tomar a disponibilidade de solução. O condicionamento é emitido pela mesma razão - todo satélite visível fica dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas por construção. Executável como o tipo de cenário <c1/> Reformulado segundo D7: a afirmação à distância lunar é a densidade de portadora sobre ruído RELATIVA entre satélites em uma época, a partir de diagramas bidimensionais de transmissão medidos (NAVCEN Block IIR/IIR-M), mais visibilidade geométrica; o C/N0 absoluto não é afirmado (Parker et al. relatam uma perda comum de { "7" } a { "12" } dB).

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
seg-83e6341e01b1 = Diluição de precisão aumentada por faróis para um usuário na superfície lunar: as linhas de linha de visada dos satélites visíveis e as linhas de distância dos faróis de superfície visíveis são concatenadas em uma única matriz de projeto e avaliadas pelo kernel de DOP compartilhado, e o DOP resultante é mapeado em uma acurácia de 1 sigma realizada EM METROS por meio de um erro equivalente de distância do usuário por farol, montado como a raiz da soma dos quadrados dos termos de sincronização de relógio, multicaminho e levantamento. A visibilidade dos faróis é o horizonte geométrico de duas alturas da Lua sem atmosfera, que não tem extensão refrativa e é, portanto, exato e não aproximado. Executável como o tipo de cenário <c1/>, que informa só satélites, satélites mais faróis e uma constelação maior como a rota concorrente para a mesma geometria. MEASURED na geometria de referência incluída (usuário a -80 graus, três faróis levantados, LCNS ilustrativo de seis satélites em t={ "0" }, máscara de { "5" } graus): { "5" } satélites visíveis dão PDOP { "9.6941" } e um 1-sigma 3-D de { "11.222" } m; somar os faróis que de fato superam o horizonte dá PDOP { "4.1160" } e { "4.765" } m, um fator de { "2.355" }; o serviço de 24 satélites dá, em vez disso, PDOP { "2.4226" } e { "2.804" } m, um fator de { "4.002" }. O relatório imprime a contagem de faróis VISÍVEIS em vez da configurada, e nesta geometria apenas UM dos três faróis supera o horizonte: os dois locais laterais ficam a cerca de { "333" } km do usuário contra um horizonte de { "86" } km para uma antena de { "2" } m, de modo que o leitor nunca fica a supor que os três contribuíram

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
seg-a6972eb89d7d = O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada. Estações da Terra observam um catálogo com fonte de faróis da superfície lunar em um cronograma explícito; as derivadas parciais de atraso do VLBI lunar são acumuladas em uma matriz de informação de Fisher de coordenadas dos faróis e propagadas pelo projeto de Helmert A = [I₃ | [p]ₓ | p] até H = AᵀM_bA, de modo que a exatidão de datum relatada é função do programa de observação — exatamente linear no sigma de atraso e monótona no arco pela libração que o relatório MEDE. O defeito de datum é o assunto, e não uma nota de rodapé: posto, defeito, número de condição, espectro, direções inobserváveis na base de sete parâmetros, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução, e qualquer parâmetro que a campanha não restrinja é publicado como NULL com um status. A correlação de erro dos faróis é MEASURED, não suposta — exatamente zero com as estações mantidas fixas, e impressa com seu custo quando elas são estimadas. Executável como o tipo de cenário <c1/>

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

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (PL de referência absorve; PL quebrado não absorvido nunca detectado; veredito de cobertura detectável; a propriedade de honestidade de que nenhum veredito de cobertura/detecção é alcançável para um cenário indetectável)

# text
# c1: variance
seg-350aaf43f349 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Não há referência independente externa, e nenhuma é possível: isto é autodescrição, não uma medição. Ela é registrada porque a sua ausência era um defeito -- P5 teve de citar o comprimento de onda da portadora e a abertura de transmissão a partir de valores padrão do código-fonte, e de inferir que um <c1/> isolado estava em metros quadrados a partir de uma verificação de consistência interna. A inferência estava correta, e é justamente por isso que importava: nada teria detectado que estivesse errada

# text
seg-6d963d838eed = hybrid_integrity::tests (a configuração resolvida é repetida na saída tanto para os valores padrão quanto para as substituições, sem passar o comprimento de onda por uma ida e volta em metros; toda entrada de units traz uma unidade e uma classe de proveniência; todo campo que o bloco units nomeia é de fato emitido, de modo que ele não pode documentar um campo fantasma)

# text
seg-cbd0ee1c1e97 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Não há referência independente externa, e ExternalDataset é recusado. As duas entradas são uma margem de Eb/N0 e um cruzamento de limiar de C/N0, ambos funções de uma EIRP MODELLED, de uma figura de mérito e de uma alocação de perdas agregadas; não existe registro de disponibilidade medida para um serviço híbrido óptico/RF Terra-Lua contra o qual conferir a cifra composta. As verificações que existem são internas e são declaradas como tais: a composição é recalculada a partir das margens publicadas no próprio relatório, e não a partir dos internos do emissor, e o alcance de fechamento é verificado executando de novo a equação do enlace NESSE alcance e exigindo que a margem se anule -- uma ida e volta por inversão, não uma implementação independente. O limite honesto da cifra é registrado no próprio relatório: é um indicador determinístico 0/1, não uma probabilidade, porque nada neste motor mede uma distribuição de indisponibilidade de enlace RF nesta banda e geometria. Essa entrada ausente é nomeada em rf_availability.factors_not_included em vez de inventada, e fornecê-la é o que uma disponibilidade RF probabilística exigiria

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (a disponibilidade é igual ao produto dos dois indicadores recalculados a partir das margens do próprio relatório, e essas margens são, por sua vez, remontadas a partir da EIRP, da perda em espaço livre, da perda agregada, da figura de mérito, do termo de Boltzmann, da taxa de dados e do requisito do próprio relatório até { "1e-9" } dB; o valor é medido como sendo { "0" } ou { "1" } enquanto a disponibilidade óptica na mesma execução é medida como estritamente entre ambos; cada linha de fator traz uma classe de proveniência do vocabulário fechado de field_schema; o alcance de fechamento relatado, executado de novo no orçamento de enlace, devolve uma margem de { "0" } a { "1e-9" } dB e é medido como independente do alcance em que a execução estava ao longo de quatro décadas, enquanto a utilização do alcance se move exatamente pela razão dos alcances; um enlace de -40 dBW relata disponibilidade { "0" }, LOST, e uma utilização acima de { "1" } em vez de uma fração; a nota substituída 'no RF-availability counterpart is computed by this engine' é afirmada como removida e a substituta é afirmada como nomeando o novo campo; uma entrada RF malformada é recusada em vez de truncada)

# text
seg-6471f38fc505 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Não há referência independente externa para a RAZÃO, e ExternalDataset é recusado deliberadamente. A cadeia RF subjacente tem uma -- tests/validate_p5_rf_ranging_precision.rs confere linkbudget::link_budget e navsignal::dll_code_jitter_chips contra uma fixture independente em Python/NumPy e contra o valor trabalhado fixo de Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz) -- e o CRLB óptico tem a sua própria linha de forma fechada. Reivindicar qualquer uma dessas âncoras para esta linha seria validação emprestada, o que os invariantes da matriz existem para impedir: a grandeza aqui é uma RAZÃO numa configuração com uma EIRP MODELLED, figura de mérito, potência de transmissão e abertura, e não existe comparação medida de alcance óptico versus RF num ponto de operação comum contra a qual conferi-la. O que se verifica internamente é aquilo em que a razão pode realmente errar: que as duas pernas estejam num mesmo ponto de operação. Isso é medido escalando o tempo de acumulação comum e exigindo que ambas as pernas se movam pela mesma lei da raiz quadrada e que a razão permaneça parada, e é imposto recusando a razão por completo quando os tempos de média divergem. Ambas as pernas são limites de ruído térmico/de disparo e ambas excluem atraso de meio, erro de relógio e ambiguidade, de modo que a exclusão é idêntica de cada lado; o relatório diz isso em vez de deixar para inferência

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (a razão é igual às duas pernas emitidas divididas, a { "1e-15" } relativo, e o seu recíproco e as formas em decibel concordam; o alcance e o sigma de tempo de cada perna se relacionam exatamente por c; a configuração comum emitida é afirmada igual ao alcance e ao tempo de integração do próprio cenário e o alcance da perna RF é afirmado igual ao da perna óptica; o C/N0 da perna RF é bit a bit o do bloco de disponibilidade, a partir de um único orçamento de enlace, não uma rederivação; a propriedade de COMPARAÇÃO EM BASE IGUAL é MEASURED em vez de afirmada -- quadruplicar o tempo de acumulação comum reduz à metade a perna óptica a { "1e-12" } e a perna RF a { "1e-7" } e deixa a razão inalterada a { "3.19e-9" } relativo, o que uma perna fazendo média secretamente sobre outra coisa não poderia fazer; uma substituição de rf_dll_bandwidth_hz que quebra o tempo de média comum torna a razão nula com um motivo que nomeia ambos os tempos, enquanto ambas as pernas continuam sendo emitidas; uma execução de via única torna a perna de comparação bit a bit o resultado principal liberado, com um fator de penalidade de exatamente { "1" }, e uma execução de via dupla reproduz a penalidade 0.5/sqrt(return-path geometric loss) recalculada a partir do próprio geometric_loss_db do relatório a { "1e-12" })

# text
seg-7c14f0734623 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Não há referência independente externa: isto é autodescrição sobre uma equação já validada contra uma tabela de controle de projeto publicada (veja a linha do orçamento de enlace de via única). Ela é registrada porque a sua ausência era um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv liberado exigiu resolver de trás para frente uma constante efetiva de { "0.0034" } dB a partir de todas as trinta linhas, e o motor agora tanto nomeia essa combinação quanto prova, por teste, que nenhuma tabela liberada poderia jamais ter separado os seus três componentes

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (em três bandas, quatro décadas de alcance e ambos os vereditos de fechamento, a margem e a perda em espaço livre sob ela são recalculadas somente a partir do relatório com melhor que { "1e-9" } dB; o G/T requerido montado a partir dos termos da equação concorda com a mesma grandeza obtida como G/T menos margem, e executar de novo nele zera a margem; três orçamentos com EIRP, perda e limiar muito diferentes, mas com uma constante de enlace igual, dão um requisito idêntico, enquanto { "1" } dB na constante o move exatamente { "1" } dB; a divisão do ganho é ausente a menos que uma temperatura de ruído seja declarada, e uma não positiva é recusada; todo campo que o bloco units nomeia é de fato emitido)

# text
seg-5a05659a1cbb = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Dois cálculos diferentes dentro da base de código para a mesma grandeza, e não um só reformulado: a bisseção sobre a curva de lei de potência da IEEE-1139 nada sabe sobre o tipo de ruído, enquanto a forma fechada inverte algebricamente o tipo dominante, de modo que um tipo de ruído mal classificado ou um intervalo inicial ruim aparece como uma diferença relativa não desprezível. Os quatro valores também reproduzem a tabela publicada do artigo até metade do seu último dígito impresso -- mas essa tabela foi ela própria reconstruída a partir da mesma forma fechada, de modo que é uma verificação de reprodutibilidade e não uma referência independente externa, e o termo de referencial contra o qual ela é medida é uma alocação modelada

# text
seg-d9742b5a3a48 = lunar_time_budget::tests e lunar_time_budget_scenario::tests (as quatro classes presentes numa só execução e numa ordem de subconjunto solicitada; toda linha concorda com a sua própria forma fechada com melhor que { "1e-12" } relativo; escalar o erro de referencial por k escala o cruzamento por k para um relógio de flicker-FM e por k^{ "2" } para um de white-FM, verificado em k={ "2" } e k={ "3" }, o que separa as duas classes de ruído; cada linha reproduz o cruzamento de relógio único que o orçamento já relatava; toda linha recupera o único termo de referencial compartilhado; um nome de relógio desconhecido é rejeitado)

# text
seg-75715af43b8b = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Inclusão de conjuntos: a razão interferente-sinal entra como um deslocamento uniforme em decibéis, de modo que o conjunto capturado a uma potência de transmissão maior contém o conjunto a uma menor e a fração só pode aumentar -- uma propriedade que o padrão de Airy NÃO fornece em largura de feixe ou altitude, onde a região capturada se rompe em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada fornece a fração de disco capturado de um transmissor orbital lunar em função da altitude e da largura de feixe, de modo que não há nada externo contra o qual conferir estas células; o padrão subjacente é validado separadamente contra valores publicados de Bessel e mantém a sua própria linha

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests e attack_surface::tests (a grade está completa e toda fração capturada está em [{ "0,1" }]; a fração capturada é não decrescente na potência de transmissão em todo nó; ela NÃO é monótona na largura de feixe nem na altitude, o que é fixado por um teste próprio para que a varredura não possa ser suavizada depois; o nó de linha de base reproduz bit a bit a fração capturada existente; a avaliação só de limbo é bit a bit idêntica ao último ponto da varredura completa; um cruzamento localizado fica sobre o limiar a { "1e-9" } dB e é ladeado)

# text
seg-eebb00692020 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Somente autoconsistência: o total publicado é verificado contra a soma quadrática dos termos no mesmo arquivo, e a curva emitida reproduz o p3_time_budget_curve.csv liberado em todos os { "57" } pontos. Ambas as verificações compartilham as definições de termos do próprio motor, de modo que nenhuma é independente. O termo do relógio se apoia em especificações publicadas de relógios, mas as MAGNITUDES do piso de enlace, referencial, relativístico e de efemérides são alocações de orçamento documentadas, sem referência independente externa

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (todos os { "57" } tempos de média x { "8" } termos presentes, o índice da grade vai de { "0" }..={ "56" } e traz { "8" } linhas cada; a linha <c1/> é igual à soma quadrática dos sete termos ao lado dela em todo tau; a tabela segue uma grade solicitada em vez de uma fixa no código; emiti-la deixa o JSON do relatório idêntico byte a byte)

# text
seg-af88df24ce81 = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Somente consistência interna: o tempo até o limiar obtido por bisseção é verificado contra o inverso de forma fechada do tipo de ruído dominante do relógio, e o termo do relógio em funcionamento livre contra o próprio termo de relógio do orçamento. As classes de relógio se apoiam em especificações publicadas de um dia (suas próprias linhas); a taxa do LTC não é rederivada aqui e mantém a sua própria linha VALIDATED (Tempo coordenado lunar); o resíduo de direcionamento é ILLUSTRATIVE, o resíduo de realização é uma alocação de orçamento e nenhum modelo térmico está incluído. A meta em nível de nanossegundos descrita no material de PNT Lunar do ICG WG-B de junho de { "2024" } é citada como declaração da fonte, não adotada como alegação; nada aqui é uma declaração sobre qualquer relógio de estação real

# text
seg-61e51873ef4b = lunar_time_lab (sobre clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: com o direcionamento desligado o termo do relógio é igual ao termo de relógio do orçamento, até o bit, para as quatro classes; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas as classes de ruído; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: o documento padrão, a tabela e o resumo permanecem inalterados e o bloco acrescenta apenas o seu próprio objeto e unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: óptico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, com as curvas de PHM e RAFS se cruzando entre { "7e5" } e { "8e5" } s, fixado como propriedade divulgada dos modelos de relógio de um único tipo de ruído; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — delta_dor de onda plana (mesma base de código) no limite de campo distante; derivadas parciais por diferenças finitas. { "0.30" } comparação externa, uma constatação (permanece MODELLED): contra o ANISE { "0.10" } tempos de luz convergidos pelo DE440 ({ "75" } atrasos em 2024-01-01 sobre três linhas de base da DSN, gerados por xval/anise-lunar-od sem código do Kshana), nenhum atraso está dentro da tolerância de { "1" } ps. A maior diferença é de { "24" } µs, devida ao centro analítico da Lua (cerca de { "200" } km do DE440), à única geometria instantânea sem iteração de tempo de luz ({ "3.6" } µs) e ao movimento polar descartado; as derivadas parciais da baliza diferem em até { "2.9e-3" } relativo contra { "1e-6" }. A afirmação na documentação do módulo de que as aproximações de referencial estão abaixo da fidelidade do modelo não se sustenta neste nível. { "0.30" } rodada { "2" }: o caminho por kernel (lunar_vlbi::KernelGeometry) é validado contra os tempos de luz do NAIF SPICE na sua própria linha, VLBI geodésico lunar, caminho por kernel; a comparação do ANISE desse caminho (75/75 dentro de { "1" } ps, pior { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) é apenas uma verificação cruzada da avaliação do kernel, porque a resolução do tempo de luz nesse arnês é própria deste projeto. Esta linha (o caminho analítico padrão) permanece MODELLED com a constatação acima

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (o limite de campo distante coincide com delta_dor; correção de campo próximo; derivadas parciais por FD); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = verificado contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de forma fechada e consistência interna; NENHUMA referência independente externa é alegada. O semiângulo do limbo é verificado contra asin(R_earth/r_orbit) e a geometria contra ele; a perda em espaço livre, o kernel de DOP e a propagação SGP4 que esta linha compõe são cada um validados externamente nas suas próprias linhas e esta linha não toma emprestado o status deles. POR QUE MODELLED, e é o padrão de transmissão: o ganho em função do ângulo é o de uma abertura circular uniformemente iluminada, o padrão de Airy, enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal moldado, com pico fora do eixo para uniformizar a potência sobre o disco da Terra, e com lóbulos laterais que não são de Airy. Existem padrões medidos publicados e eles não estão incluídos aqui, de modo que ordenações e ordens de grandeza se sustentam, mas o dB de qualquer satélite isolado não. UMA PRIMEIRA IMPLEMENTAÇÃO DESTA LINHA ESTAVA ERRADA DE UM MODO QUE VALE REGISTRAR: a expressão de Airy só é válida no hemisfério frontal, o seu argumento vai com sin(theta), e perto de theta = { "180" } graus ela dá a volta e devolve O GANHO COMPLETO NO EIXO atrás da abertura - de modo que os dois enlaces mais fortes do primeiro relatório eram satélites apontando suas antenas para longe da Lua, e eram os dois únicos que superavam o limiar. Atrás da abertura o modelo agora aplica um piso plano de lóbulo traseiro, declarado como um limite e não como uma forma de padrão fabricada. Deliberadamente ausentes, cada um tornando o orçamento OTIMISTA: nenhuma perda ionosférica ou troposférica nos raios que tangenciam o limbo, nenhuma perda de polarização, apontamento ou implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA, e não uma consulta de efemérides, porque a grandeza sob teste é o enlace e a geometria do feixe. Elevar esta linha a validada exige um padrão de transmissão medido e pontos normais do LuGRE contra os quais conferir; nenhum dos dois está no repositório e nenhum é inventado aqui. { "0.30" } rodada { "2" }, uma constatação (permanece MODELLED): um caminho de enlace com entradas medidas (posições SP3 reais, potência de transmissão por bloco, padrões de transmissão e recepção tabulados, histerese de aquisição e rastreamento) foi conferido contra Montenbruck et al. { "2023" } Tabela { "3" } para o GENESIS a { "6000" } km (pré-registrado 5b414f0a): as médias da antena voltada ao zênite concordam em { "5" } de { "6" } dentro de um dB da sensibilidade do artigo; as médias da antena voltada ao nadir são de { "1.0" } a { "2.4" } satélites acima do impresso, plausivelmente porque o artigo usou padrões de lóbulos laterais do GPS dependentes do azimute que não são publicados. Os valores a distância lunar desta linha ainda usam o substituto de Airy. { "0.30" }+ D7, uma constatação (permanece MODELLED): a grandeza reformulada, a DIFERENÇA de C/N0 entre satélites Block IIR/IIR-M rastreados numa mesma época, prevista com os padrões L1 medidos por SVN do NAVCEN (bidimensionais, no referencial de direcionamento de guinada) contra o C/N0 de voo do LuGRE (pré-registrado 768cb62b: { "99" } % visíveis, RMS dos pares <= { "3.0" } dB, mediana <= { "2.0" } dB, ao menos { "50" } registros e { "30" } pares) tem poucos dados: as { "26" } épocas de trânsito e de órbita lunar qualificadas contêm { "15" } registros IIR/IIR-M rastreados (rastreiam-se sobretudo IIF e III) e um par. Todos os { "15" } são previstos como visíveis e o resíduo do único par é -0.06 dB; nada é alegado

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } testes de biblioteca: o semiângulo do limbo da Terra contra a sua forma fechada asin(R/r) com uma asserção adicional de que TODO enlace não ocultado fica fora desse cone, de modo que o teste de ocultação e o ângulo do limbo não possam divergir; o predicado de ocultação verificado no lado próximo, no lado distante e no caso em que o corpo está ATRÁS do transmissor; perda de percurso limitada à faixa plausível de alcance lunar em todo enlace; o conjunto rastreável mostrado como um subconjunto do conjunto geometricamente visível e disjunto do ocultado; monotonicidade em ambas as direções - mais ganho de recepção nunca reduz a contagem, um limiar mais estrito nunca a eleva; nenhum enlace creditado com mais que o ganho no eixo; um receptor dentro da Terra recusado; a varredura afirmada como realmente VARIANDO com a época; e a disponibilidade de sinal versus a de solução afirmadas como distintas, corretamente ordenadas e consistentes com as linhas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fixado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constatação fixada)

# text
seg-5242a1ecb1f9 = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um programa independente em scipy/numpy integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente verifica a numérica de fórmulas declaradas, não a física, de modo que a linha permanece MODELLED. Modelo restrito de três corpos: sem Sol, sem harmônicos lunares, com o eixo de rotação da Terra ao longo da normal da órbita, entradas de receptor e de estação ILLUSTRATIVE.

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (limiar O1: a matriz de transição de estado encadeada ao longo de três dias e de um período é igual à do scipy DOP853 a um relativo de { "1e-6" }; limiar C1: q médio e a fração dentro de 95 %; limiar C2: amostra sobre o traço formal de cada estimador; limiar C3, NOT MET e fixado: com { "3e-10" } m/s2 de aceleração não modelada a ultrapassagem dentro de 95 % é { "0.0525" }, e não ao menos { "0.5" } - a estimativa de bordo é conhecida apenas a centenas de metros, de modo que cerca de dez metros de deslocamento se escondem dentro da sua covariância); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Uma resolução independente em numpy das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração inteira por força bruta (Q4). Nenhuma medição de fase da portadora de GNSS ou lunar é comparada. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (limiar Q1: sucesso de Monte Carlo ao menos o limite de bootstrap menos três erros-padrão; Q2: nenhuma queda com o comprimento do arco além de três erros-padrão; Q4: o LAMBDA é igual à enumeração por força bruta para { "200" } sorteios de dimensão até cinco; Q3: o projeto float é igual a uma resolução independente em numpy a { "1e-9" } para as covariâncias de ambiguidade e de posição, e a taxa por bootstrap é NOT MET a { "1e-9" }, fixada: ela difere por um relativo de { "1.7e-6" } porque a CDF normal do LAMBDA é uma aproximação de Abramowitz e Stegun)

# text
seg-ee535014d898 = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Uma diferença finita independente em numpy do modelo direto (F2). Nada é comparado com soluções reais de referencial lunar. O fator é condicional à órbita conhecida assumida e ao sigma de alcance de { "1" } m. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (limiar F1: o traço do CRLB não sobe e o menor autovalor não cai com enlaces de orbitadores, no exemplo e em { "20" } conjuntos aleatórios com semente; limiar F2: as derivadas parciais de alcance são iguais a uma diferença finita independente em numpy longdouble do modelo direto de Rodrigues em { "50" } geometrias; limiar F3: o menor autovalor sobe por ao menos 2.0x, encontrado cerca de 111x)

# text
seg-8d70ea5318fa = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um sistema empilhado independente em numpy com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Nenhum dado do GRASP, do Genesis ou de outras missões é comparado. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (limiar T1: os sigmas de translação não caem à medida que a amarração local se afrouxa; T2: com os sigmas das técnicas escalados por { "1e-6" } o sigma de translação de cada par está dentro de { "1" } % de sqrt({ "2" }) vezes o sigma da amarração local, encontrado dentro de { "3e-7" }; T3: a matriz de informação é igual a uma montagem empilhada independente em numpy a { "1e-9" }). A primeira execução de T2 com inversão das equações normais falhou ({ "1.3" } % numa amarração de { "0.1" } m, valores abaixo do piso a { "1" } m); a causa foi numérica e a covariância passou para a via da raiz quadrada antes de o limiar ser reavaliado.

# text
seg-6c1a6dc96a6a = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Uma montagem independente em numpy por diferenças finitas (G2) e uma avaliação em forma fechada (G4). A sensibilidade a k2 da família de orbitadores é um valor de extremo superior (o estado orbital absorve aqui apenas uma constante e uma tendência). Nenhuma medição de maré ou de libração lunar é comparada; k2 é citado de Lemoine et al. { "2014" } como valor nominal. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (limiar G1: as derivadas parciais analíticas são iguais a uma diferença finita central de cada modelo direto a { "1e-8" }; G2: a informação 5x5 é igual a uma montagem independente em numpy a { "1e-6" }; G4: a amplitude da maré do relógio e as suas sensibilidades a k2 e h2 são iguais a uma avaliação independente a { "1e-9" }; limiar G3 NOT MET na sua metade do traço, fixado: acrescentar uma família nunca reduz o menor autovalor ({ "28" } de { "28" }) mas o traço da pseudoinversa subiu em { "12" } de { "28" } acréscimos porque a família acrescentada elevou o posto)

# text
seg-3ead905e6a5c = verificado contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — A aritmética de DOP é o kernel crate::orbit::dop, validado externamente em separado contra o gnss_lib_py em tests/dop_reference.rs; esta linha não toma emprestado de novo o status daquela linha. O horizonte de visibilidade da baliza é a forma fechada L01, e sigma = DOP x sigma_URE é a relação padrão de GNSS (Kaplan e Hegarty, Understanding GPS/GNSS, seção { "7" }). Dentro desta linha, a própria ampliação é verificada contra um caminho de DOP independente no repositório e fixada a um golden registrado. POR QUE MODELLED: o projeto da constelação, a posição das balizas, as alturas das antenas e as três magnitudes do orçamento de erro são entradas ilustrativas, e não um levantamento em campo ou um enlace medido, de modo que os metros relatados são uma propriedade de um cenário escolhido e não de qualquer serviço implantado. NOTA SOBRE PROVENIÊNCIA: esta capacidade foi anunciada no README e exercitada por dois testes de validação, mas não tinha NENHUMA linha de matriz e nenhum tipo de cenário, de modo que não podia ser alcançada de modo algum a partir de uma execução. Ela foi alegada em prosa, ausente do registro e inalcançável no motor, tudo ao mesmo tempo. A linha e o tipo de cenário foram acrescentados juntos. { "0.30" } rodada { "2" } (pré-registrado db0eb9ec), bloqueado (permanece MODELLED): a visibilidade do ANISE { "0.10.6" } e um DOP em numpy sobre a geometria da linha concordam (conjuntos visíveis exatos, incluindo { "72" } casos próximos do horizonte e { "48" } próximos da máscara; DOP dentro de { "7.2e-13" }), mas os metros relatados são o DOP vezes um erro de alcance em soma quadrática ilustrativo de { "1.158" } m sem referência independente; o escopo que os excluiria aguarda uma decisão do responsável

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidade de horizonte contra a forma fechada L01; o DOP ampliado por balizas contra o simples; a soma quadrática do orçamento de erro; a relação de DOP para metros); tests/validate_p2_beacon_before_after_table.rs (a tabela inteira de antes/depois fixada a um golden registrado a { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (a mesma geometria por um caminho de DOP INDEPENDENTE, de modo que a ampliação não seja verificada contra o kernel que a produziu); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-b915c06fa3f1 = skyline::PRESETS: quatro geometrias REPRESENTATIVE com as dimensões declaradas na nota de projeto e uma linha de proveniência cada uma: city-street (um cânion, rua { "0" } deg, { "20" } m entre paredes de { "30" } m, antena { "1.5" } m), harbour-approach (setores: aberto para o mar ao longo de { "180" } deg, edifícios do cais { "8" } deg ao longo de { "90" } deg, o quebra-mar { "3" } deg), fjord (terreno: paredes { "600" } m acima da antena a { "1.5" } km de cada lado de um canal norte-sul, queda por curvatura aplicada), container-terminal (setores: pilhas { "12" } deg sobre a metade voltada para terra, lanças de guindaste { "35" } deg e { "25" } deg ao longo de dois setores estreitos); substituíveis campo a campo

# text
seg-7dfedc40da6a = O bloco opcional [time_lab] do cenário lunar-time-budget modela um relógio de estação de referência lunar (por padrão a classe miniRAFS, ou qualquer classe nomeada, ou uma ficha de dispositivo ajustada a pontos de estabilidade declarados) sincronizado ao Tempo Lunar Coordenado e depois em funcionamento livre ou ressincronizado a cada N segundos: a curva de erro de tempo x(t) como a raiz da soma dos quadrados do termo de lei de potência do relógio, de um resíduo constante de sincronização (ILLUSTRATIVE), de um resíduo constante de realização do LTC e de um termo opcional de taxa por altura da estação; o tempo após uma sincronização até { "1" }, { "10" } e { "100" } ns (ou limiares declarados) por bissecção, ao lado da inversa em forma fechada para o tipo de ruído dominante, e o termo dominante em cada horizonte declarado, tudo com unidades

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Fonte: <c1/>

# text
seg-34d1304c9555 = Capacidades modeladas — justificativa

# text
# c1: ExternalDataset
seg-144f441bf52b = Estas capacidades são implementadas a partir de física publicada ou de primeiros princípios, com testes, mas são <b>rotuladas com honestidade como MODELLED</b> — não conferidas com uma referência independente externa dentro de uma tolerância declarada. Os testes de invariantes da matriz impõem que apenas linhas apoiadas em <c1/> possam ser VALIDATED, de modo que nada aqui pode ser promovido em silêncio. Cada linha declara por que permanece modelada.

# text
seg-0630e39b4de3 = Tipo de referência independente

# text
seg-bb023086bbe3 = Por que permanece modelada

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = conferida com sua própria identidade em forma fechada / analítica — pega erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: o Orekit { "12.2" } não tem razão de iluminação com escurecimento de limbo. Conferida apenas com formas fechadas da mesma lei

# text
seg-33d506570c1b = srp_shadow::tests (a forma fechada anular, a lei uniforme reproduzindo a sombra cônica, os limites de sol pleno e de umbra)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com ThirdBodyAttraction e SolarRadiationPressure sobre o leitor DE440 próprio do Orekit (orekit-data lnxp1990.440), executado como um programa separado; o kshana lê um recorte do NAIF de440s.bsp idêntico bit a bit e conferido com o SPICE. Limiares pré-registrados em xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). O limiar de órbita ({ "0.5" } m) e o controle de sensibilidade são atingidos, mas o limiar de posição do Sol/Lua ({ "3" } m / { "0.2" } m) falhou em { "6.39" } m / { "0.244" } m. O SPICE lendo o mesmo kernel em seu TDB exato erra o Orekit na mesma medida ({ "6.25" } m / { "0.240" } m), de modo que a diferença está entre o caminho do de440s do NAIF e o leitor DE440 ou a escala de tempo do Orekit; causa não isolada. Registrada e fixada, de modo que a linha permanece MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horários em { "24" } h, LEO, GEO e HEO, terceiro corpo e terceiro corpo + SRP: pior |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; o controle de série analítica erra por { "9.96" } m; Sol { "6.39" } m e Lua { "0.244" } m a partir das posições DE440 do Orekit, uma falha registrada); testes unitários do propagator (recusa do provedor, contagem de fallback compartilhada entre clones)

# text
seg-b55bcab6f986 = conferida com sua própria identidade em forma fechada / analítica — pega erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa para o efeito do geopotencial. Os { "24" } coeficientes são transcritos da Tabela { "1" } do GFZ STR06/01, modelo N1, e foram reconferidos linha a linha com o relatório (SHA-256 890865ae); os graus { "0" }, { "1" }, { "7" } e { "8" } não são usados. Ray e Ponte ({ "2003" }) não imprimem tabela de harmônicos esféricos, de modo que nenhuma segunda fonte foi comparada

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (o termo S1 é diurno, gira { "90" } deg em um quarto de dia e tem a amplitude de fator de carga de cada linha; magnitude física em LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel e pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, executados como programas separados; limiares pré-registrados em xval/high-degree-gravity/PREREGISTRATION.md (276c869f) e xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). O Orekit concorda em todo lugar onde está definido, mas o pyshtools não atinge seu limiar pré-registrado nos dois pontos próximos ao polo (até { "7.3e-10" } m/s^{ "2" }; uma conferência mpmath de 50 dígitos põe o erro no pyshtools), não há valor de referência independente exatamente sobre o eixo polar, e o controle de sensibilidade de grau 70 pré-registrado da órbita de { "24" } h falhou ({ "0.726" } m contra > { "1" } m). Cada falha é registrada, não ajustada para desaparecer, de modo que a linha permanece MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit em { "8" } pontos fora do eixo: máx. |da| { "2.2e-17" } m/s^{ "2" } em N = { "70" }, sempre executado; { "3.5e-17" }, { "3.9e-17" } e { "7.3e-17" } m/s^{ "2" } em N = { "200" }, { "360" }, { "2190" }, condicionado a dados em KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada a dados: pior |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; controle de grau 70 { "0.726" } m); testes unitários do gravity_sh (concordância com o avaliador clássico a { "1e-13" } no grau { "70" }, diferença finita e continuidade nos polos em um campo de grau 2190, um termo de grau 2190 com underflow contra um cálculo de expoente estendido)

# text
seg-84a9851b838c = uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) BatchLSEstimator com medições geométricas instantâneas personalizadas de RangeRate e AzEl (conferidas com o TopocentricFrame do Orekit), executado como um programa separado sobre observações idênticas, mascaradas e com semente. Limiares pré-registrados em xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Todo limiar atingido, exceto B4, a concordância de estado sem ruído de { "1" } cm, que falhou em { "2" } de { "4" } cenários ({ "1.46" }, { "1.74" } cm): a própria estimativa sem ruído do Orekit fica a essa distância de sua verdade simulada (causa do lado do Orekit não isolada). Registrada e fixada, de modo que a linha permanece MODELLED. Não modelados: tempo de luz, aberração, refração, rotação da Terra, um filtro sequencial para esses tipos de medição

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } cenários: taxa de variação da distância, az/el e mistos, LEO e MEO, sem ruído e com sigma semeado de { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } e { "10" } deg, contra o Orekit { "12.2" }: conjuntos visíveis idênticos; valores de medição dentro de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM dentro de { "1.2e-14" } relativo; estados ruidosos dentro de { "1.74" } cm e { "1.14e-5" } m/s; RMS pós-ajuste por tipo dentro de { "2.7e-4" } relativo; kshana sem ruído contra a verdade { "1.06e-8" } m; kshana sem ruído contra o Orekit { "1.464" } e { "1.740" } cm em dois cenários, um desvio registrado em relação ao limiar de { "1" } cm); testes unitários de orbit_determination e batch_ls

# text
seg-a5554f29b2d7 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: os pesos são uma escolha de modelagem (o formato SP3 define o código apenas como indicador de exatidão do produtor; aqui ele é lido como um sigma de um desvio-padrão por eixo). As execuções registradas existentes das agências permanecem inalteradas

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = testes unitários de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (fixture da ESOC de { "8" } h registrada no repositório, sigma de { "0.032" } m a partir do expoente do cabeçalho { "5" }: RMS 3D do Nível 1 de { "0.132" } m inalterado, Nível 2 de { "0.035" } m contra { "0.070" } m com sigma de { "1" } m, sendo a mudança decorrente da restrição empírica a priori reequilibrada); tests/agency_swarm.rs (o produto Swarm não traz códigos de exatidão e recorre ao valor padrão, fixado)

# text
seg-a5ad470a4816 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Apenas consistência interna. Cada campo publicado é definido no referencial fixo ao corpo de seu produtor (GMM-3 no referencial de Marte de Konopliv et al. { "2006" }, GL0660B no referencial de eixos principais lunar DE421), enquanto o campo é avaliado no referencial da IAU; o deslocamento não é modelado

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Apenas ida e volta interna e respostas conhecidas do ICD; nenhum decodificador de terceiros foi executado (o harness RTKLIB/GNSS-SDR que lê KSHANA_NAVMSG_ORACLE_JSON depende de dados). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de verificação do CRC-24Q 0xCDE703; resposta ao impulso convolucional; o Viterbi corrige erros injetados; larguras de layout); tests/gnss_navmsg_roundtrip.rs (os bits iniciais dos campos igualam os números de bit do ICD; codificar -> FEC -> entrelaçar -> Viterbi -> decodificar faz a ida e volta dentro de meio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registros Galileo do IGS BRDC 2018-133 na grade de LSB, pior caso { "3.6e-3" } LSB; limiar pré-registrado de contagem de satélites não atingido, { "15" } de { "20" }, FINDING)

# text
seg-81b76a6d1bcd = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — FINDING contra a coordenada ITRF2020 publicada de WTZR: os limiares pré-registrados (mediana e p95 suavizados no máximo { "0.6" } x o valor bruto; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) não foram atingidos, com razões de { "0.718" } e { "0.923" }; o erro residual de nível métrico é do tipo viés (viés de código C1C, antena, maré, multipercurso de longo período), não o ruído branco que a suavização remove. MODELLED: as estatísticas do filtro são verificadas internamente

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (passagem direta sem ruído; variância de ruído branco 1/(2N-1); reinícios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: erro 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Aderência à norma de formato em um arquivo RINEX { "4.00" } real publicado (os valores lidos de volta são iguais aos literais impressos no arquivo) e em um cabeçalho derivado da especificação; nenhum leitor independente foi executado, portanto MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeiras { "4" } épocas do arquivo RINEX { "4.00" } MGEX do IGS MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: os registros do cabeçalho e os valores da primeira época são iguais aos literais publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabeçalho sintético { "4.02" } a partir da especificação)

# text
seg-5afb3c4bf171 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Pré-registrado (7aa264b, 110fef9) contra uma órbita precisa MGEX do IGS com os GEOs; nenhum produto desse tipo estava acessível a partir da sessão que o construiu, portanto a comparação está pendente e a linha é MODELLED (verificada apenas contra as posições GEO nominais publicadas)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registros reais C01-C04: raio geoestacionário, longitudes 140.02/80.04/110.55/159.99 deg nas posições publicadas, |latitude| de { "2.13" } deg com a inclinação contra { "6.65" } sem ela; a comparação pré-registrada entre a transmissão e o SP3 preciso depende de dados em KSHANA_BDS_GEO_SP3 e não foi executada); rinex::tests

# text
seg-70f61250d256 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: as medições são sintetizadas a partir dos modelos que o filtro usa (χ² NEES/NIS ao longo de sementes, uma convergência sem ruído, injeção de saltos de ciclo). MODELLED; nenhum dado de receptor real nem filtro de terceiros é comparado

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (percurso em figure-8: RMS 3-D em regime permanente de { "0.025" } m com a portadora contra { "0.470" } m com o código nas mesmas medições; { "12" } sementes com NIS/dof médio de { "1.00" } e NEES/dof em regime permanente de { "0.92" }; um salto de 1 ciclo detectado em sua época, sem falsos alarmes e com a solução intacta; desligar as correções transmitidas eleva o erro do código de { "0.51" } m para { "19.6" } m (ionosfera) e { "8.0" } m (troposfera); a execução sem ruído converge para { "0.3" } mm)

# text
seg-6f3f6483690e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Interno: as figuras de mérito de cada pacote contra a sua própria verdade e uma comparação entre acoplamento frouxo e estreito nas mesmas entradas. MODELLED; a comparação NaveGo da auditoria não foi executada

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), cenários gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada pacote: fusão abaixo do INS livre durante a interrupção para ambos os sensores; ferrovia: estreito { "5.3" } m contra frouxo { "12.9" } m em grau de navegação e { "15.6" } m contra { "18.8" } m em grau tático durante a interrupção, disponibilidade { "0.97" } contra { "0.95" }; tabela estreita validada); tests/gnss_ins_legacy_trajectory_pin.rs (o padrão de acoplamento frouxo idêntico bit a bit)

# text
seg-2c7c37506aab = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: verdade simulada a partir dos próprios modelos dos filtros (χ² NEES ao longo de sementes de Monte Carlo, o pacote desacoplado nos mesmos sensores). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D ao longo de { "60" } sementes: NEES médio da segunda metade de { "8.12" } para { "8" } estados, soma de χ² da última época dentro de sua faixa de { "95" } %; uma correção de relógio de { "0.1" } ns reduz o sigma de posição 3-D de { "5.58" } m para { "3.07" } m; filtro de viés ao longo de { "60" } sementes: soma de χ²({ "5" }) dentro da faixa, viés dentro de { "3" } sigma em { "59" } de { "60" }; fusion-pnt-coupled com acelerômetros enviesados: p95 de posição de { "18.7" } m / { "90.0" } m e integridade de { "1.00" } / { "0.97" } acoplado contra { "430" } m / { "4060" } m e { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sem [coupled] idênticos bit a bit)

# text
seg-0866862d2264 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Interno: identidades de cinemática de corpo rígido, a ida e volta em CSV e a covariância do próprio filtro. MODELLED (nenhum registro de percurso real é comparado)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (a curva coordenada não tem força lateral e o fator de carga é 1/cos φ; a importação de CSV reproduz um perfil voado com { "1e-3" } m/s e { "1" } m); tests/gnss_ins_trajectory_library.rs (todo perfil é executado e a fusão supera o INS livre durante a interrupção; cada um executa o seu movimento nomeado; observabilidade do rumo: sigma de guinada após { "240" } s de { "1.27" } deg em cruzeiro reto contra { "0.039" } deg em figure-8 e { "0.062" } deg em anda e para); tests/gnss_ins_legacy_trajectory_pin.rs (resultado legado e hashes da verdade idênticos bit a bit)

# text
seg-5cb3b7bba7be = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Medido contra as efemérides reconstruídas do CAPSTONE do JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado na Lua, 2023-03-01..31 a cada { "10" } min), registradas no repositório byte a byte (tests/fixtures/capstone_horizons/, NOTICE.md), pré-registradas em { "4e868170" } antes de serem obtidas, como uma medição com limiares sobre a geometria média. Não é uma validação: o CR3BP omite o Sol, a excentricidade da Lua e a manutenção de órbita que o CAPSTONE realizou, de modo que os limiares descrevem o quanto a órbita do modelo é representativa, não uma exatidão. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE março de { "2023" }, { "4" } perilunas e { "5" } apolunas: período { "6.5004" } d contra { "6.5699" } d ({ "1.07" } %, limiar { "3" } %), apolua { "71 182" } contra { "71 215" } km ({ "0.05" } %, limiar { "5" } %), perilua { "3 385" } contra { "3 245" } km ({ "4.1" } %, limiar { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna com uma forma fechada: sob o modelo gaussiano linear, a covariância de mínimos quadrados é sigma^{ "2" } (H^T H)^-1 (Kaplan e Hegarty (eds.), Understanding GPS: Principles and Applications, 2ª ed., Artech House, { "2006" }, cap. { "7" }). Método e tolerâncias da nota de projeto de geometria { "0.36" }, seção { "5.2" }, fixados em um commit de pré-registro antes da primeira execução: cada variância dentro de { "5" } % ({ "5" } erros-padrão de uma variância amostral com N = { "20,000" }), cada RMS dentro de { "2.5" } %, a correlação leste-norte dentro de { "0.035" } (5/sqrt(N)), cada média dentro de { "5" } erros-padrão, a fração da elipse de { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } erros-padrão binomiais); os controles negativos (PDOP dobrado; erros crescendo como 1/sin(elevação) contra o Q não ponderado) devem falhar. COMO SE COMPÕE: Q é o fator de covariância do kernel orbit::dop, VALIDATED contra o gnss_lib_py { "1.0.4" } nestas mesmas { "8" } geometrias em tests/dop_reference.rs (linha 'GNSS geometry / dilution of precision'); esta linha acrescenta o passo desses fatores até metros pelo solucionador do motor e não toma emprestado o status daquela linha. POR QUE MODELLED: nenhum conjunto de dados externo está envolvido; a concordância mostra que o estimador e o ruído realizam sigma x DOP sob o modelo de livro-texto, não que o erro de algum receptor seja igual a UERE x DOP, e sigma_UERE é uma entrada

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: todas as { "104" } verificações passam na primeira execução após o pré-registro e50c88d2, pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros-padrão, fração da elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos os controles falham como exigido; position_error_is_sigma_times_dop_on_masked_skies: as duas geometrias de horizonte mascarado da nota de projeto, o céu 10sat-mixed sob as predefinições de rua urbana ({ "4" } satélites, PDOP { "16.6" }) e de terminal de contêineres ({ "9" } satélites, PDOP { "2.5" }), todas as { "26" } verificações passam na primeira execução após o pré-registro 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (uma primeira verificação, separada, em quatro céus escolhidos à mão (aberto, agrupado, cânion, meio céu; sigma de { "1" } m, semente 0x0D0B5EED) com intervalos de confiança de qui-quadrado a { "1e-6" } no total ao longo de { "20" } verificações: razões de { "0.987" } a { "1.009" }, PDOP/GDOP do próprio solucionador iguais aos do kernel até { "2.5e-12" }, e controles negativos para um erro de DOP de { "10" } % e erros de 1/sin(elevação); executada antes do pré-registro, portanto é relatada, não pré-registrada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-d40d54b79e58 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a classificação é verificada contra as regras que enuncia e contra razões derivadas à mão em edições sintéticas do registro de demonstração publicado no repositório, e os pinos de não alteração mantêm as saídas da { "0.35.0" }: nenhuma pontuação muda, a menos que a geometria seja ruim; o rótulo é sempre informado. POR QUE MODELLED: os limiares são escolhidos, não ajustados (a proveniência está no geometry_model de cada execução; os valores da IEC 61108-1 e do GPS SPS como citados, a serem conferidos com o texto das normas), e não existe um conjunto de dados externo rotulado de degradação natural da geometria contra ataques com o qual validar a classificação. O DOP derivado reutiliza o kernel orbit::dop, VALIDATED contra o gnss_lib_py, cujo status esta linha não toma emprestado. Uma classe de geometria é uma afirmação sobre o céu, não uma constatação de que nenhum ataque ocorreu

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: na passagem sintética por um fiorde de scenarios/training/fjord-natural-degradation.toml, as mesmas { "624" } épocas são deduzidas com e sem o [skyline] declarado; com ele, sky-blocked é informado em { "680" } épocas ({ "0" } sem ele: a alternativa de lacuna de azimute não vê nada em um fiorde de dois lados), open_fraction é { "0.758" } e as épocas da classe de ambiente caem de { "78" } para { "33" }, sendo o restante perdas de satélites que o horizonte declarado deixa a céu aberto; fora do evento o horizonte não altera nenhuma pontuação); receiver_trust::geometry::tests (razões derivadas à mão nos limiares, as bordas dos limiares, a rampa e o teto, o piso, as bordas dos rótulos, as substituições de [geometry], o DOP sobre o kernel validado, céus mantidos e expirados, desconhecido não presumido, perda de sinal, a tolerância à geometria ruim, sentinelas de ausência de posição); tests/geometry_trust.rs (um céu mascarado razoável rotulado e não pontuado, um céu mascarado ruim, uma perda em baixa elevação, uma queda de potência, um HDOP forjado, perda total de sinal, um arrastamento durante geometria ruim, geometria desconhecida, substituições de sessão, o esquema ao vivo); tests/geometry_trust_no_change.rs (ambas as sessões de exemplo idênticas byte a byte à { "0.35.0" } depois de removidas as chaves acrescentadas); tests/geometry_corpus_identity.rs (todo corpus NMEA de embarcação publicado no repositório, também como céu aberto apenas com GPS, e os cenários de treinamento de tripulação: idênticos byte a byte à { "0.35.0" } exceto nas épocas ruins, que diferem apenas pela dedução de geometria)

# text
seg-7e9cae219d72 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Interno: as formas fechadas são verificadas contra valores calculados à mão (elevações do topo das paredes de uma rua declarada, a condição de extremidade aberta, a queda de curvatura de um ponto declarado). Nenhuma referência independente externa: a nota de projeto delimita essas reduções como MODELLED, e o ElevationMask do Orekit recebe uma tabela, de modo que a comparação da linha 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' lê as tabelas de 360 pontos como entradas e não as verifica

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma: dimensões escolhidas e declaradas, não um levantamento de nenhuma rua, porto, fiorde ou terminal (a razão de aspecto da rua está dentro da faixa de 0.5-2 de Oke ({ "1988" }); o fiorde é da ordem dos fiordes do oeste da Noruega; as pilhas usam a altura high-cube da ISO { "668" }). O teste verifica as predefinições contra as suas próprias dimensões declaradas, uma verificação de transcrição, que a regra de validação não conta

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Os fatores de DOP de relógio único repousam sobre o kernel validado contra o gnss_lib_py { "1.0.4" } (linha 'GNSS geometry / dilution of precision (DOP)'); as verificações próprias desta linha são internas: sky_geometry reproduz orbit::dop e dop_cov na mesma geometria, a elipse reproduz uma decomposição em autovalores analítica 2x2, as entradas ECEF e azimute/elevação concordam, e o RMS e a contenção de { "95" } % da nuvem semeada concordam com a geometria. A covariância ENU com um relógio por sistema e a elipse são VALIDATED na linha 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); o que permanece MODELLED aqui é a composição: a propagação das predefinições até um céu representativo, a nuvem de Monte Carlo (verificada contra a geometria que ela amostra, uma verificação de autoconsistência) e as superfícies. As predefinições de constelação dão um céu representativo, não um céu datado; o modelo de erro gaussiano e o UERE são entradas declaradas, não uma exatidão medida nem um limite de integridade

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (o kernel de relógio único contra o gnss_lib_py)

# text
seg-0b5caf359b15 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Recursão de covariância de clock_state em vários passos (verificação cruzada na mesma base de código); o kernel subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). As figuras de holdover por classe com piso de ruído vermelho permanecem MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (contra a recursão de covariância de Kalman em vários passos; FM branco exato; ida e volta); kernel de variância de deriva validado externamente em tests/gnss_denied_clock_holdover_reference.rs (contra scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Registros medidos, mantidos fora do ajuste: relógios combinados finais de { "30" } s do IGS dos { "11" } satélites GPS Block IIF de 2026-03-01 a { "14" } (uma janela que nenhum teste havia aberto; IGS, aberto com atribuição) e o receptor u-blox ZED-F9P do JammerTest { "2024" } em suas sessões estacionárias não pontuadas (GPL-3.0-or-later). Comparação externa D9 (pré-registrada 2ec76864, desvio de Allan previsto / medido de cada cartão dentro de [1/1.5, { "1.5" }] em seus tempos de média ajustados), uma constatação (permanece MODELLED): { "10" } dos { "11" } cartões GPS IIF estão dentro do limiar; G27 é otimista na escala de duas horas ({ "0.662" } a { "7680" } s, pior fator { "1.510" }), o erro periódico em escala de hora que um cartão de lei de potência não carrega. O cartão do TCXO do receptor está bloqueado: fora das transmissões registradas, as outras sessões do conjunto de dados deixam { "167" } épocas contra as { "3600" } exigidas. Relatado, não cego (registros abertos por linhas anteriores): o cartão do césio 5071A está dentro do limiar (pior { "1.070" } até { "4096" } s), o cartão do OCXO é conservador e está fora dele ({ "2.348" } a { "128" } s; seu piso de ruído muda durante o registro), e o cartão do estrôncio de Norcia, ajustado nos três pontos publicados mais curtos, está dentro dele nos dois pontos pontuados ({ "1.291" }, { "1.405" }). Os masers de hidrogênio passivos do Galileo (nenhuma fonte acessível sem login de relógios finais do Galileo) e o Deep Space Atomic Clock (um valor aberto em órbita) estão bloqueados. D9 rodada { "2" }, o TCXO do receptor ZED-F9P como classe de modelo em { "14" } dias de { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; pré-registrada fb475550), uma constatação: com o pipeline registrado, { "11" } das { "12" } estações não eram avaliáveis (o RAIM rejeitou a maioria das épocas livres de ionosfera) e a BX14 falhou; uma nova execução divulgada, com um pipeline corrigido (pré-registrada c9cc0d49), passa em { "1" } das { "11" } estações cegas (BX12, { "1.412" }; BX07 { "1.532" } e BX13 { "1.542" } logo fora), porque relógios de receptor de ponto único obtidos de arquivos intermitentes de { "30" } s não são um registro limpo de oscilador

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pré-registrada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; depende de dados)

# text
seg-a2202f0e06b2 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Registros medidos, mantidos fora do ajuste: relógios combinados finais de { "30" } s do IGS dos { "11" } satélites GPS Block IIF de 2026-04-01 a { "14" } (uma janela que nenhum teste havia aberto; IGS, aberto com atribuição). Comparação externa D9 (pré-registrada fb475550, desvio de Allan previsto / medido dentro de [1/1.5, { "1.5" }] em todo tempo de média ajustado em todo satélite), uma constatação (permanece MODELLED): { "9" } dos { "11" } cartões estão dentro do limiar; G03 ({ "1.947" }) e G25 ({ "1.581" }) são otimistas entre { "60" } s e { "2000" } s porque seus registros mantidos fora do ajuste são mais ruidosos que os terços usados no ajuste (a parte mantida fora do ajuste de G25 traz { "16" } lacunas e { "29" } outliers de fase), uma mudança do relógio em vez de um termo periódico ausente. Retirar os termos periódicos da previsão faz falhar todos os { "11" } cartões ({ "1.77" } a { "4.96" }), de modo que os termos sustentam a previsão

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pré-registrada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van-Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio e a calibração de Allan não são validadas externamente, portanto isto permanece MODELLED. Comparação externa { "0.30" }, uma constatação (permanece MODELLED): em relógios finais de { "30" } s do IGS de { "11" } satélites GPS Block IIF (2025-08-17 a { "30" }), com Q ajustado ao ADEV da primeira metade e o filtro pontuado na segunda metade mantida fora do ajuste, o filtro é consistente um passo à frente ({ "0.906" } a { "0.971" } das épocas dentro de sua faixa de { "95" } %, limiar { "90" } %), mas é superconfiante em uma hora em { "9" } de { "11" } relógios ({ "0.486" } a { "0.829" }) e suas somas de inovação ficam fora de [{ "2.4" }, { "3.6" }] em { "5" }. O ruído de fase branco ajustado é zero em todo satélite, e o erro em escala de hora (termos periódicos, FM flicker) não está no modelo de 3 estados. { "0.30" } rodada { "2" }, um filtro estendido (FM flicker e estados de uma e duas vezes por revolução) em relógios novos do IGS mantidos fora do ajuste de 2025-09-01 a { "14" } (pré-registrada 4b1a841e), uma constatação (permanece MODELLED): os critérios de consistência de um passo e de uma hora valem em todos os { "11" } satélites ({ "0.948" } a { "0.988" } e { "0.907" } a { "0.996" }), mas o critério da soma de inovação falha em G24 ({ "0.964" }) e G30 ({ "1.929" }) contra [{ "2.4" }, { "3.6" }]. D9 rodada { "3" }, o filtro estendido da rodada 2, com ajuste e critérios inalterados após o detector de condicionamento congelado de clock_library, em relógios novos do IGS de 2026-04-01 a { "14" } (pré-registrada fb475550), uma constatação (permanece MODELLED): (a) um passo { "0.941" } a { "0.968" } e (c) média do NIS triplo { "2.641" } a { "3.549" } valem em todos os { "11" } satélites; (b) uma hora falha em G09 ({ "0.894" }) e G26 ({ "0.876" }) contra { "0.90" }

# text
seg-3016100a7015 = clock_state::tests (Q analítico de van-Loan; NEES; positividade da PSD); tests/clock_state_reference.rs (trajetória completa de predição + atualização — estado x e covariância P de { "3" }×{ "3" } ao longo de { "1925" } passos / { "4" } conjuntos de parâmetros contra o filterpy { "1.4.5" }; pior |relΔ| de { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fixa a constatação); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 rodada { "3" })

# text
seg-27554b73549b = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Magnitude de Sagnac verificada contra um VALOR PUBLICADO de autoridade — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pelo geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O orçamento composto de transponder/visada comum/PPP do TWSTFT do BIPM não tem referência independente externa, portanto a capacidade permanece modelada

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelamento recíproco; identidade de Sagnac em duas formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circum-navegação equatorial = { "207.386" } ns contra os { "207.4" } ns publicados por Ashby, com diferença < { "0.05" } ns; além disso, a geometria de Sagnac/geodist verificada de forma cruzada contra o geodist() do RTKLIB { "2.4.3" } compilado a partir do código-fonte em C)

# text
seg-a5714c98b299 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — A correlação cruzada/autocorrelação de Gold do GPS C/A coincidiu EXATAMENTE (inteiros ±65/−1/63) com a geração de código independente do IS-GPS-200; o formato da PSD de BPSK-R({ "1" })/BOC({ "1,1" }) contra um periodograma independente do scipy. As formas fechadas de modulação/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) permanecem analíticas, portanto a linha permanece MODELLED — mas a subafirmação de correlação de código é verificada externamente. { "0.30" } rodada { "2" }, contra os valores impressos de Betz { "2001" } e Hein et al. { "2006" } (pré-registrada 9f4f2ce8, meia unidade impressa), uma constatação (permanece MODELLED): todas as { "45" } células espectrais da Tabela { "1" }, os valores de correlação de { "1" } GHz, as figuras de interferência do MBOC e { "2" } de { "3" } deslocamentos da Fig. { "17" } concordam; os primeiros lóbulos laterais de { "24" } MHz, o deslocamento do BOC({ "8,4" }) da Fig. { "17" } e todo viés de multipercurso de pior caso das Figs. 18-21 ({ "11" } a { "15" } % abaixo) não concordam. O Kshana e uma avaliação independente em NumPy da leitura pré-registrada concordam, portanto a diferença está nessa leitura ou em um detalhe não declarado do artigo; causa não resolvida

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (SSC próprio do BPSK = 2/3R_c; PSD de área unitária; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (correlação cruzada/autocorrelação de Gold do GPS C/A com coincidência exata de inteiros contra a geração de código independente do IS-GPS-200; PSD de BPSK-R({ "1" })/BOC senoidal({ "1,1" }) contra um periodograma independente do scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fixado)

# text
seg-9fe0ec8c4531 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Vetores numéricos dos artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincidiu exatamente, a ASD do ruído de disparo é um piso unilateral dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais trazem ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } rodada { "2" } (pré-registrada fcb9ac64), uma constatação (permanece MODELLED): o ruído de rotação apenas por QPN contra os pontos medidos da Fig. { "14" } de Gauguet et al. { "2009" } dá razões de { "0.695" } a { "0.788" } nos três pontos admitidos ({ "0.751" } no ponto de operação), ficando { "0.5" } ponto aquém do limiar pré-registrado de { "30" } %; o piso de QPN fica { "21" } a { "31" } % abaixo do ruído medido, como esperado de um modelo sem ruído de laser e de detecção. A composição do gradiômetro coincide com a linha do modelo de QPN de Janvier et al. { "2022" } (razão { "1.013" } a { "1.017" }, Reference). O teste medido não consegue discriminar um erro de composição de sqrt({ "2" }); apenas a linha de Janvier de contraste desigual consegue

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; T² de Mach-Zehnder; intervalo do piso de Freier-2016); tests/quantum_inertial_sensor_reference.rs (função de transferência |H(ω)|, k_eff·T² e ASD do ruído de disparo contra os vetores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fixado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Autoconsistência do modelo de franjas do interferômetro: a borda de meia franja, a estrutura de aliasing 2π-periódica e o cancelamento do fator de escala na razão faixa/resolução são identidades algébricas de forma fechada verificadas contra as próprias funções de fase e de sensibilidade de Mach–Zehnder do motor — verificações de consistência interna, NÃO um conjunto de dados externo, portanto a linha permanece InternalConsistency. Ambiguidade de franja ideal de três pulsos MODELLED; sem limites de aberração de frente de onda nem de perda de contraste sobre a faixa não ambígua

# text
seg-81802510f112 = quantum_imu::tests (a_max fica na borda de meia franja de ±π com o escalonamento de faixa 1/T²; a recuperação da fase desdobrada é exata dentro de [−a_max,a_max] e sofre aliasing de exatamente { "2" }·a_max fora dela; a faixa dinâmica não ambígua a_max/σ_a=π/σ_Φ é idêntica para dois fatores de escala de comprimento de onda/T muito diferentes; os métodos de CaiAccelerometer coincidem com as funções livres)

# text
seg-91728172ea50 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Integração independente por SDE de Monte Carlo em numpy do ruído de aceleração branca duplamente integrado (valida a variância analítica de VRW por um algoritmo genuinamente independente) + uma âncora de valor publicado de Groves { "2013" } para os termos de viés/fator de escala; os números dos dispositivos CAI quantificam hardware do parceiro e permanecem MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (viés contra o integrador AccelModel; VRW contra a integral analítica); tests/quantum_inertial_dead_reckoning_reference.rs (VRW contra uma dupla integração de Monte Carlo independente em numpy do ruído de aceleração branca, desvio máximo de { "0.42" }% dentro de ±{ "3" }% ao longo de { "6" } tempos de deriva; viés/fator de escala contra um valor de forma fechada de Groves { "2013" }; ida e volta do holdover)

# text
seg-8bc5bc7d553c = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Equação de orçamento de enlace de C/N₀ antijamming verificada de forma cruzada contra uma nova dedução independente em numpy (compartilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } rodada { "2" }, bloqueada (permanece MODELLED): a queda medida de C/N0 do JammerTest { "2024" } contra uma previsão de orçamento de enlace (pré-registrada 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e a direção da antena F8.1 em Bleik e a parcela de L1 da potência da rampa multibanda { "1.6.4" } não estão documentadas no catálogo de testes nem no registro oficial

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form e cw_q_equals_the_spectral_separation_closed_form: a tabela de Q, CW e banda estreita { "1" }, banda larga e varrido { "2" }, fixada às formas fechadas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efetivo contra uma nova dedução independente em numpy do orçamento de enlace de Kaplan & Hegarty §{ "9.4" }; o C/N₀ real do JammerTest cai monotonicamente através do limiar de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (pré-registrado, bloqueado, não executado)

# text
seg-26b6c4436ca0 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. { "0.30" } comparação externa, uma constatação (permanece MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores em nível de observável (qui-quadrado auxiliado por relógio, RAIM, falha de solução) não emitiram alarme em até { "10" } s de nenhum dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela pré-início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o início publicado do intervalo), e três janelas pré-início traziam falsos alarmes do monitor de relógio ({ "81" }, { "64" } e { "173" } épocas). O primeiro efeito observável foi uma perda do rastreamento GPS de dupla frequência, não uma inconsistência do RAIM. Os inícios publicados são inícios de intervalos de cronograma com resolução de minuto; que eles precedam a captura de RF é uma interpretação, não uma medição. { "0.30" } rodada { "2" }, contra o registro oficial JammerTest { "2024" } dos organizadores (resolução de segundo; pré-registrada 6a66994b com um monitor de relógio de três estados calibrado por Hadamard, sem travamento), uma constatação (permanece MODELLED): o monitor alarma em até { "10" } s em { "4" } dos { "10" } inícios registrados; nos outros seis ele chega { "18" } a { "211" } s atrasado ou emite falsos alarmes de relógio pré-início ({ "1" } em { "2.1.4" }, { "85" } em { "2.3.15" }). D9 rodada { "3" } (um cartão de receptor das outras sessões da unidade do JammerTest, pré-registrada 2ec76864) bloqueada: { "167" } épocas de treinamento contra { "3600" }. D9 rodadas { "4" } e 4b (níveis de ruído de um cartão de classe de modelo u-blox ZED-F9P, Wroclaw { "2021" }, pré-registrada fb475550; 4b uma nova execução divulgada com uma extração corrigida, c9cc0d49), uma constatação (permanece MODELLED): zero falsos alarmes pré-início em todos os { "10" } inícios registrados e { "6" } dos { "10" } dentro de { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } e { "2.6.1" } permanecem atrasados (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sem mudança com o nível de ruído do relógio

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterização dos parâmetros do TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fixa a constatação); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-964d859381f5 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Compõe primitivas validadas (allan/holdover van-Loan, piso de segurança); calibrado no cenário { "2.1.1" } do JammerTest { "2024" } (~{ "1.01" } ms de arrasto real do tempo servido contra ≤{ "51" } ns declarados). Ponte sobre partes validadas — não é, em si, uma validação externa. { "0.30" } comparação externa, uma constatação (permanece MODELLED): nos cenários de spoofing do JammerTest { "2024" } o erro medido e não detectado do tempo servido excede o TPL nominal em { "3" } de { "8" } inícios detectados: { "184.3" } contra { "34.6" } ns ({ "2.1.4" }), { "295.7" } contra { "159.3" } ns ({ "2.3.5" }) e { "143.0" } contra { "69.0" } ns ({ "2.3.11" }); três dos cinco dentro do limite são triviais (um falso alarme pré-início travado). Causa provável: o termo de deriva de uma calibração de { "60" } s com ruído de desvio zero não cobre a oscilação de frequência do TCXO do receptor ao longo de { "15" } a { "39" } s. O erro medido é a estimativa de relógio de ponto único do próprio Kshana contra uma reta ajustada às suas próprias estimativas pré-início, portanto mesmo a concordância não teria sido totalmente independente. { "0.30" } rodada { "2" }, contra os inícios do registro oficial do JammerTest { "2024" } e o erro de tempo do receptor medido (pré-registrada 6a66994b), uma constatação (permanece MODELLED): em { "4" } dos { "10" } inícios registrados o erro não detectado excede o TPL de estado de deriva ({ "634.7" } contra { "458.5" } ns em { "2.1.1" }, { "232.6" } contra { "16.2" } ns em { "2.3.5" }, { "41.3" } contra { "6.0" } ns em { "2.3.10" }, { "218.6" } contra { "47.4" } ns em { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referências independentes de forma fechada + CUSUM); examples/tpl_jammertest.rs (calibração de spoofing real do JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fixa a constatação); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Coeficientes do IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade de campo real é verificado externamente (linha 'Gravity-anomaly synthesis from a spherical-harmonic model'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondência de mapa; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (o benchmark de 60 min sem GPS sobre o campo real de grau 70 do EGM2008, pré-registrado em xval/icgem-egm2008/: correspondido { "3106" } m, portanto o limiar de < { "500" } m é NOT MET e afirmado como não atingido, e o corte de dez vezes sobre a deriva de { "70.6" } km é MET; além do Monte Carlo semeado de erro de mapa); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel e tests/emag2_real_grid.rs (leitor EMAG2v3 dependente de dados sobre um recorte real; nenhum resultado de navegação afirmado sobre ele); tests/terrain_slam_rbpf.rs (estimação conjunta de mapa, um RBPF no estilo FastSLAM, contra o SITAN de mapa conhecido sobre um erro de mapa correlacionado de { "15" } m ao longo de { "20" } sementes, pré-registrado em xval/terrain-slam-rbpf/: ganho médio de { "1.5" }% e melhor em { "10" } de { "20" }, portanto os limiares de { "10" }% e de 12 de 20 são NOT MET e afirmados como não atingidos; nenhum prejuízo em um mapa perfeito, MET)

# text
seg-d7fd40dc37c6 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Aderência à norma do SBOM ao esquema JSON oficial do CycloneDX { "1.5" } (+ identificadores SPDX válidos) — um padrão externo publicado, zero erros de validação em todo o grafo de dependências; a parte de determinismo de FoM / reprodutibilidade byte a byte permanece uma verificação de autoconsistência fixada, portanto a linha permanece MODELLED

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (o SBOM gerado valida com zero erros contra o esquema JSON oficial do CycloneDX { "1.5" } em todo o grafo distribuído de 66 componentes: recursos default + python + wasm, dependências de desenvolvimento excluídas)

# text
seg-a014f82f28b0 = Avaliação de detecção de degradações de RF por aprendizado de máquina ({ "13494" })

# text
seg-400e45e7e700 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Limites de AUC de forma fechada (Mann–Whitney) + um detector de referência independente perfeito; o corpus é SINTÉTICO (fundamentado em parâmetros, não de campo/IQ)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfeita=1/idêntica=0.5/empate={ "0.125" }, ROC monótona, fusionado>{ "0.8" }, separação de camadas por classe, proteção contra vazamento, corpus reproduzível, sinalizadores de mudança de distribuição indicam otimismo); dominance_demonstrators (alcançável + reproduzível + MODELLED-não-VALIDATED + lacuna de otimismo autoconsistente)

# text
seg-7566da9904ba = Estudo da lacuna de otimismo da detecção de degradações de RF por aprendizado de máquina e preditor da lacuna apenas a partir de ID

# text
seg-0d7f46d20a0d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Estatísticas deduzidas à mão contra formas fechadas (AUC binormal Φ(d'/√{ "2" }), variância de DeLong, Spearman com postos empatados, recuperação exata de MQO) + validação cruzada leave-one-out contra a linha de base de prever a média. O corpus é SINTÉTICO (fundamentado em parâmetros, nunca de campo/IQ) e a lacuna de otimismo é uma mudança de severidade sintético→sintético, NÃO um resultado de simulação para campo

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC da referência independente por classe≈{ "1" }, lacuna de otimismo aprendida>{ "0" }, formato da grade + IC bootstrap contém a média + tendência de escala positiva, características de ID finitas, o preditor da lacuna supera o de prever a média sob AMBAS as validações cruzadas leave-one-detector-out e leave-one-class-out + determinístico); impairment_ml::tests (logreg separa + determinístico + perda↓, o MLP resolve o XOR que um modelo linear não resolve + semeado); eval_stats::tests (bootstrap/DeLong/Spearman/ridge contra formas fechadas)

# text
seg-590ec8589ce6 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — O kernel de ajuste de ADEV medido→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um kernel externo independente; mas os NÚMEROS do trade quantificam (nunca validam) um relógio/CAI do parceiro, portanto o próprio trade permanece MODELLED, sem aura de validação

# text
seg-e0f68f57399d = quantum_trade::tests (recuperação de ida e volta do ADEV, não negatividade do NNLS, ressalva de piso presente/ausente, benefício>{ "1" }, envelope monótono + limite de alt-PNT); dominance_demonstrators (o ADEV medido é guiado por dados e não presumido por piso, a classe presumida sinaliza piso + ressalva, curva malformada rejeitada, MODELLED-não-VALIDATED)

# text
seg-7d1d24d8f8f5 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Tabela definicional Kp↔ap + forma fechada de temperatura exosférica de Jacchia-1971 (coincidente a <{ "1" } K com as âncoras publicadas, tests/space_weather_reference.rs); a densidade é caracterizada contra o pymsis NRLMSISE-00 (um modelo independente do NRL): a oscilação do ciclo solar a { "800" } km é de 10.4x contra 13.6x do NRLMSISE-00. { "0.30" } revisão: o fator de atividade de primeira ordem calibrado foi substituído por Jacchia { "1971" } (densidade do cenário padrão a { "400" } km de { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k acrescentado). { "0.30" } rodada { "2" }, densidades medidas por acelerômetro TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; pré-registrada 20eed695), uma constatação (permanece MODELLED): as médias por órbita a { "400" } a { "500" } km estão dentro de um fator { "2" } no máximo solar fora de tempestades (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mas Jacchia { "1971" } é cerca de 1.7x denso demais no mínimo solar de { "2008" } (GRACE-A 412/544 dentro de um fator { "2" }), portanto a densidade não é validada

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exato nos pontos da grade + ida e volta + monótono, média de Ap diário, T exosférica contra âncoras publicadas de mínimo/média/máximo solar + incremento de tempestade, densidade igual a um na referência, oscilação do ciclo solar dentro da faixa observada de { "5" }–{ "10" }×, cenário reproduzível + MODELLED-não-VALIDATED + rejeição de fora da faixa); dominance_demonstrators (alcançável + reproduzível + T física + MODELLED-não-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Geometria de lançamento por trigonometria esférica de forma fechada contra âncoras de exemplos resolvidos publicados (Vallado, Fundamentals of Astrodynamics 4ª ed., Algoritmo { "37" } de azimute de lançamento + mudança de plano do cap. 6; tests/launch_window_ascent_geometry_reference.rs). Estes reutilizam a mesma forma fechada que o kshana implementa (uma verificação de paridade de valor publicado / transcrição, InternalConsistency); dois corpos MODELLED, sem modelo de triângulo de velocidades com Terra em rotação / de ascensão / de perda por arrasto. { "0.30" } comparação externa contra o Orekit { "12.2" } (Apache-2.0), uma constatação (permanece MODELLED): a geometria concorda até o arredondamento (inclinação lida de volta a partir do azimute de fim de queima em { "158" } casos, pior { "2.6e-15" } rad; inclinação mínima, velocidade circular e delta-v de dogleg até { "3e-16" }), mas a velocidade do local por rotação da Terra não atinge o limiar pré-registrado de { "1e-6" } relativo na latitude de { "62.9" } deg ({ "1.12e-6" }). A diferença cresce como tan(lat), coerente com um deslocamento do polo por movimento polar de cerca de { "5.8e-7" } rad no referencial terrestre do Orekit, que o ω·R·cos(lat) esférico omite. A afirmação não foi restringida antes da execução, portanto a linha não pode ser promovida com base nesta comparação. { "0.30" } rodada { "2" } (pré-registrada 71bebf63): com uma época e linhas do IERS, a velocidade do local com polo verdadeiro (campo de cenário site_rotation_speed_true_pole_m_s) concorda com o Orekit dentro de { "1e-6" } em { "24" } locais ao longo de quatro longitudes (pior { "4.9e-8" }), mas a velocidade nominal sem época que o cenário emite por padrão como bônus de rotação da Terra ainda erra por { "1.12e-6" }, portanto a linha permanece MODELLED até uma decisão sobre a saída padrão

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (lançamento para leste alcança i=latitude, KSC→ISS = { "45" }° de livro-texto, polar = N/S, i<lat inalcançável, bônus equatorial de { "465" } m/s, mudança de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, contagens de oportunidades diárias, cenário reproduzível/MODELLED + trajetória dogleg); dominance_demonstrators (alcançável + reproduzível + KSC→ISS { "45" }° + MODELLED-não-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Entrada analítica de Allen–Eggers de forma fechada, adicionalmente verificada de forma cruzada contra uma integração numérica com solve_ivp (DOP853) do scipy { "1.18" } da MESMA EDO de entrada apenas com arrasto (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior a_max relativo de { "2.9e-9" }) — uma verificação de integral numérica contra a própria forma analítica, portanto ainda InternalConsistency, NÃO uma validação externa. Balístico MODELLED (sem sustentação), sem aerotérmica/TPS — a saída de aquecimento é uma velocidade, não um fluxo de calor. { "0.30" } comparação externa, uma constatação (permanece MODELLED): contra a reconstrução da entrada da SRC Stardust (Desai e Qualls, NASA NTRS { "20080008567" }), a desaceleração de pico de Allen–Eggers para o estado de entrada inercial impresso ({ "12.9" } km/s, -8.2 deg, H { "7200" } m) é de { "61.8" } g contra os { "32.89" } g da melhor trajetória estimada, +{ "88" } % contra uma tolerância de { "15" } %: a solução de ângulo de trajetória constante e sem gravidade praticamente dobra o pico de uma entrada rasa e mais rápida que a velocidade de escape. A Stardust não levava acelerômetro, portanto a reconstrução é uma estimativa de trajetória. { "0.30" } rodada { "2" }, bloqueada (permanece MODELLED): uma solução integrada de massa pontual planar (reentry::simulate_planar_entry, US76, gravidade de inverso do quadrado, curvatura) concorda com as melhores trajetórias estimadas da Stardust e da Genesis dentro de { "15" } % (+{ "11.3" } %, +{ "5.6" } %), mas esses máximos são saídas de simulação de agências, não medições, portanto isto é apenas uma verificação cruzada. A comparação com acelerômetro (pré-registrada a94a283d) está bloqueada à espera de uma cópia legível da análise REMM da Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (g de pico independente do coeficiente balístico + faixa física de g, cresce com γ mais íngreme / entrada mais rápida, a velocidade do g de pico = V_e·e^(−1/2) e o aquecimento de pico = V_e·e^(−1/6) mais rápido, a altitude do g de pico física + mais profunda para B maior, cenário reproduzível/MODELLED + geometria degenerada rejeitada); dominance_demonstrators (alcançável + reproduzível + fração V_e·e^(−1/2) + MODELLED-não-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (apenas verificação cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueado, não executado)

# text
seg-f40cd1b25160 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a eficiência espectral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de quadro concorda com as eficiências que a Tabela { "13" } imprime (uma verificação de transcrição da tabela de limiares); as partes do orçamento de enlace concordam com suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM move pelo menos o volume da codificação constante. A geometria da passagem vem do preditor de passagem aparente, VALIDATED separadamente. O QUE NÃO É: nenhuma ferramenta externa nem enlace medido foi comparado; os limiares são os valores AWGN ideais da norma, não os de um modem; o desvanecimento por chuva, a perda de apontamento ao longo da passagem e os pilotos não são modelados.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: o ramificar e limitar exato concorda com a enumeração por força bruta em pequenos conjuntos aleatórios, todo plano é verificado como viável contra as regras de conflito, e o guloso nunca supera o ótimo exato. O QUE NÃO É: nenhum escalonador externo nem plano operacional foi comparado; os contatos são tomados inteiros (sem divisão), o backlog é fixado no início da janela, o tempo de reorientação além da rotatividade fixa e o armazenamento a bordo não são modelados.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Aritmética de custo de forma fechada contra valores deduzidos à mão; um ENQUADRAMENTO econômico de um valor de cobertura modelado, não uma cotação nem um modelo de custo validado

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (custo por cobertura deduzido à mão 48/96={ "0.5" }, razão de ROI { "2.667" }, ordenação dos intervalos + proteções contra cobertura zero)

# text
seg-8204455973cc = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Compõe a classificação de Stanford do RAIM validada externamente (raim::classify_stanford); o mapeamento de detecção perdida→AL em si é modelado, não é uma alocação de integridade certificada

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (a mesma detecção perdida passa de Available→MI→HMI à medida que o contexto se aperta; PL conservador→Unavailable; HMI por eixo; proteções de entrada)

# text
seg-7bb58c89a1fb = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: o intervalo de VRW citado verificado de forma cruzada contra a física de CaiAccelerometer::accel_asd + a faixa dinâmica bruta calculada a partir do limite de ambiguidade de franja; os números são intervalos MODELLED de levantamento da literatura (needs_source_confirmation), nenhum dispositivo validado, sem aura de validação

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (o VRW físico cai dentro do intervalo de VRW citado em todos os { "3" } níveis; faixa bruta de ambiguidade de franja calculada a partir de k_eff·T²; o orçamento conservador deriva mais que o melhor; todo intervalo com fonte + sinalizado para confirmação; proteções de ordenação dos intervalos)

# text
seg-3f5094fa7a30 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Reimplementação independente em numpy da regra de quatro regiões (scripts/gen_tib_scorer_reference.py) sobre o mesmo conjunto de amostras; método Citado do diagrama de integridade Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) e do RTCA DO-229 WAAS MOPS. NÃO é uma referência independente de exatidão de ExternalDataset — o benchmark é imune à honestidade.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatro regiões + fronteiras inclusivas + |erro| + indisponibilidade por PL>AL); tests/tib_scorer_reference.rs (contagens de classificação contra numpy independente em um conjunto sintético fixo)

# text
seg-10befbc6faae = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Recontagem independente de regiões em numpy em tests/fixtures/tib/reference.json; apenas verificação cruzada da maquinaria do pontuador, nenhuma afirmação de exatidão.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpo/subdelimitado/tudo indisponível/vazio); tests/tib_scorer_reference.rs (contagens + taxas + coverage_ok contra numpy até { "1e-12" })

# text
seg-cee919e2058e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Geradores paramétricos de falhas representativos (modelados); o conjunto indetectável (atraso simétrico, repetição dentro da validade) é Citado de Mizrahi RFC { "7384" } e Narula & Humphreys (IEEE JSTSP { "2018" }). Nenhuma referência independente externa — um catálogo de falhas não faz nenhuma afirmação medida.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfis de deslocamento, deriva monótona, sinalização do conjunto indetectável, consistência de max_offset, exatamente duas classes indetectáveis)

# text
seg-0cc84aedee42 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Verificação de propriedade de que o enum Verdict estruturalmente não pode relatar uma falha indetectável como detectada (Mizrahi RFC { "7384" }); absorvida ⟺ PL ≥ deslocamento. Nenhuma referência independente de exatidão.

# text
seg-f8ac8be96a63 = cmpl_horizontal delimita o erro horizontal de posição de k sigma contribuído pela classe cega de modo comum, formando blind_position_covariance = S<em>Cov</em>S^T e projetando-a em ENU; integrity_envelope informa hpl_total = hpl_araim + cmpl. A distinção que o par existe para fazer: o teste de RESÍDUO do RAIM/ARAIM é comprovadamente cego a erros em range(G), mas o NÍVEL DE PROTEÇÃO do ARAIM não é — o seu termo livre de falhas já os delimita até uma URA do provedor mais o viés nominal. O CMPL é, portanto, apenas o EXCESSO entre provedores que a URA/ISM por provedor de um único provedor não sobredelimita, e a soma é um limite conservador por desigualdade triangular, e não uma RSS, válido apenas onde esse excesso ainda não está dentro da URA.

# text
seg-753412b4c8f3 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Álgebra analítica de projetores verificada contra si mesma: uma covariância confinada a range(G) deve dar um CMPL positivo, uma covariância confinada ao espaço de paridade deve dar aproximadamente zero, e o envelope deve somar duas contribuições ortogonais no espaço de medição. A covariância de modo comum, a geometria da constelação e k são entradas representativas modeladas, NÃO um orçamento certificado, e não se afirma que o limite triangular seja justo. NOTA SOBRE A PROVENIÊNCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope são públicos e distribuídos, e seus testes unitários já eram citados pela linha de cegueira de modo comum, mas a AFIRMAÇÃO DO ENVELOPE em si não tinha linha — de modo que a única ressalva que a mantém honesta, a de que a soma é um limite triangular e não uma RSS, não estava declarada em lugar nenhum do registro. A linha registra a afirmação e a ressalva juntas.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Estrutura analítica de defeito de datum — o modo absoluto de referencial inobservável está no espaço nulo da informação de Fisher (forma fechada), o limiar de posto coincide com a justificativa de projeto publicada de 3 estações, e o estimador atinge o CRLB resultante em Monte Carlo. A geometria lunar em si é uma rede representativa (não uma efeméride voada), portanto a linha permanece MODELLED; o motor subjacente de FIM/CRLB é verificado separadamente contra as formas fechadas de Kay ({ "1993" }). { "0.30" } rodada { "2" } (pré-registrada fab02df9), bloqueada (permanece MODELLED): NumPy/SciPy recalculam o posto e o defeito no limiar declarado de { "1e-9" }, a parcela dos eixos das estações no espaço nulo (dentro de { "8.4e-10" }) e o CRLB das estações (dentro de { "1.2e-10" }) em { "17" } configurações publicadas no repositório e geradas pelo Kshana (P2). Não promovida: a afirmação de que o estimador atinge o limite (eficiência de Monte Carlo de cerca de { "0.98" }) não tem referência independente, e a delimitação que a deixaria MODELLED aguarda uma decisão do responsável

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (posto deficiente sem linhas de base com a Terra; três linhas de base restauram o posto completo — o limiar de 3 estações vem do posto da informação, não de erro de solução; CRLB das estações atingido pelo estimador com eficiência { "0.98" }; o CRLB se aperta monotonicamente com as linhas de base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Referência: os valores que o LSIS V1.0 imprime para validação (Tabelas C-1 a C-5, D-1 a D-6, E-1 a E-6) e seus arquivos de código eletrônicos do Anexo { "3" }, sob um critério de zero divergências fixado antes da comparação. O critério não é atingido por uma célula impressa que é internamente inconsistente com o próprio arquivo do Anexo { "3" } da norma, portanto a linha permanece MODELLED; uma nota de errata está redigida. Os mesmos chips também são iguais aos do LANS-AFS-SIM (linha 'LunaNet AFS baseband rendering against an independent generator, given its channel state')

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices do IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registradores de comprimento máximo, balanço de Legendre, ida e volta do atraso de G2, composição de níveis); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sem o cache do LSIS: quatro números citados fixam a constatação; com ele: { "2 937 232" } chips e bits contra os arquivos do Anexo { "3" } do LSIS, primeiros/últimos { "24" } chips impressos, as Tabelas D-1 e E-1 de Legendre e as inicializações de G2 dão exatamente um item divergente, a célula 'últimos { "24" } chips' do PRN { "147" } da Tabela E-5, que duplica a do PRN { "151" }, enquanto o arquivo do Anexo { "3" } concorda com o gerador); o teste estrito pré-registrado afs_codes_match_lsis_v1_tables_and_annex3_bit_exact é ignorado com essa lacuna

# text
seg-f30130dca525 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Biblioteca: PocketSDR-AFS (T. Ebinuma a partir do PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, build de banda S, cópia com nível de log somente de impressão), sob critérios fixados antes de cada execução. A terceira comparação pré-registrada atinge integralmente seus limiares de decodificação e rastreamento C1 e C2, mas não sua proteção G0 como escrita (duas execuções do receptor sem modificação diferem nos mesmos quatro registros de aquisição), e a segunda não atingiu por { "5" } violações, portanto a linha permanece MODELLED. O LANS-AFS-SIM e o PocketSDR-AFS compartilham um autor e contam como uma única implementação independente; as verificações de vetores impressos da linha de codificação de quadro protegem contra uma leitura equivocada compartilhada

# text
seg-8cd700abad59 = lunar_afs::waveform (gravação e rótulos de verdade), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (terceiro pré-registro: { "2" } nós, { "4" } canais rastreados, pior erro de Doppler { "0.57" } Hz, pior erro de deslocamento de código { "0.008" } chip, todos os { "6" } quadros decodificados com o TOI correto através da virada de { "99" } -> { "0" } e subquadro { "2" } coincidente; G0 não atingido como escrito, a própria variação entre execuções do receptor em seus registros de aquisição); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segundo: { "5" } violações); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primeiro: nulo); os testes estritos dos três arquivos são ignorados com suas lacunas

# text
seg-2f05d26e8be6 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — gps-sdr-sim (MIT, commit 28ca29a6, executado como programa separado por meio de um harness publicado no repositório), pré-registrado f88f2969 com um limiar exato bit a bit em (A) chips C/A, (B) todo campo LNAV calculado, (C) todo bit de paridade. FINDING: (A) { "0" } de { "32 736" } chips diferem, (C) a paridade de { "0" } de { "1 920" } palavras difere, (B) { "230" } de { "1 152" } campos calculados diferem por uma unidade: o eph2sbf do gps-sdr-sim trunca em direção a zero com conversões de C onde o inteiro transmitido exige arredondamento (todo valor divergente fica a menos de { "0.01" } de uma unidade do inteiro arredondado do Kshana). Permanece MODELLED: o limiar registrado era a conjunção

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (constatação fixada); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (estrito, ignorado com a lacuna); gps_lnav::tests

# text
seg-d61a6fd7896c = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Amostras I/Q do gps-sdr-sim (MIT, commit 28ca29a6) e seu próprio estado de canal, pré-registrado 7777da53: (B1) todo PRN simulado adquirido, (B2) nenhum outro PRN adquirido, (B3) fase de código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. FINDING: B1, B3 e B4 valem nas duas janelas (pior { "0.195" } chip, { "72" } Hz), mas B2 falha: todos os { "21" } PRNs que o gps-sdr-sim não simulou também cruzam o limiar (estatística de { "151" } a { "206" } contra { "79.5" }; PRNs simulados { "1 300" } e acima). O limiar é definido para ruído gaussiano da potência de amostra medida; o gps-sdr-sim não acrescenta ruído, de modo que as células de um PRN ausente contêm a correlação cruzada dos outros satélites. Permanece MODELLED: o limiar registrado era a conjunção

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (constatação fixada); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (estrito, ignorado com a lacuna)

# text
seg-9f9b58158cde = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — As próprias formas fechadas dos monitores sobre as próprias cenas GPS L1 C/A do Kshana (ruído e sinais legítimos; eventos de atenuação dos próprios sinais dos satélites), contra limiares pré-registrados em docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). FINDING: M1, M2 e M4 atingidos. M3 atingido na detecção ({ "18" } de { "18" } atenuações, P_md { "0" }) e NOT MET em sua cláusula de tempo: a mediana do tempo até detectar é { "1.001" } s contra { "2" } x ARL1 amostras = { "0.433" } s. O CUSUM vê uma estimativa por janela de { "1" } s, de modo que o limite em contagem de amostras fica abaixo de uma amostra. Apenas consistência interna: nenhum receptor real nem interferência registrada é verificado

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } blocos contra o intervalo binomial de { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razão { "0.0131" } contra { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } contra { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estrito, ignorado com a lacuna); testes de iq::campaign::detect; testes de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (os digests fixados permanecem inalterados sem a tabela)

# text
seg-491de717dd05 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Campanhas sintéticas a partir das próprias cenas GPS L1 C/A do Kshana (atenuações dos próprios sinais dos satélites), contra limiares pré-registrados em docs/design/DETECTION-ROC.md (b47e358d). FINDING: R2 atingido (nível de acaso sem nada a detectar). R1 NOT MET: AUC de cn0_drop { "0.7855" } contra { "0.95" }, porque toda janela negativa após um evento herda o decaimento do CUSUM a partir da detecção (todos os { "18" } negativos pós-evento chegam a { "81" } ou mais; todos os { "18" } pré-evento ficam em { "0" }). Apenas consistência interna: nenhum receptor real nem interferência registrada é verificado

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } em eventos declarados que não atenuam nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estrito, ignorado com a lacuna); testes de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Recuperação sintética de parâmetros nas próprias cenas GPS L1 C/A do Kshana com um perfil conhecido de C/N0 imposto a partir da fórmula da seção { "3.1" }, rastreado e pontuado por kshana iq campaign, contra limiares pré-registrados em docs/design/LABFIT-FROM-IQ.md (seção { "5.1" }, emendada em 2026-10-12 em b7117bf, seção { "13" }). O estimador de C/N0 das campanhas (M2M4) foi fixado em 5b13e3c2, enviado antes da primeira avaliação de limiar (registrado junto com o código de ajuste, não sozinho), após uma execução diagnóstica de rastreamento divulgada. FINDING na campanha de limiares de 18 eventos: (c) PASS; (a') NOT MET, erro de delta_eff de -1.097 dB contra { "0.5" } dB (ainda -0.89 dB em faixas de { "38" } dB-Hz e acima); (b') NOT MET, { "0" } de { "50" } campanhas cobrem a verdade (erro -1.189 +/- { "0.093" } dB, intervalo de cerca de { "0.3" } dB); (d) NOT MET, forma fechada { "2.20" } dB abaixo do J/S direto na perda, cerca dos tempos de permanência da queda ajustados vezes a taxa da rampa ({ "2.09" } dB); as cláusulas originais de Q de (a) e (b) são NOT MET porque Q não é identificável. ACOMPANHAMENTO (limiares pré-registrados em 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): em uma campanha de J/S em degraus, delta_eff é recuperado dentro de +{ "0.185" } dB (S1 MET: o erro da rampa é atraso do estimador); (d) como escrito nela é atingido pelo modelo de malha de rastreamento ({ "0.45" } dB), mas não pelo empírico ({ "6.42" } dB), portanto S2 é NOT MET; em uma nova campanha de rampa, (d) com os tempos de permanência da queda ajustados somados à taxa de rampa de cada evento fica dentro de { "1" } dB para ambos os modelos (R1 MET), e (a') e (d) como escritos voltam a não atingir (-1.25 dB; { "2.32" } e { "9.47" } dB). O método é verificado, não qualquer receptor: ele não pode ser VALIDATED a partir de dados sintéticos

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura de PI90 de { "0.891" } sobre { "558" } faixas, { "0.900" } sobre { "10" } eventos de tempo até a perda sob cada modelo de travamento), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash e vereditos de [validation], auditoria do bloco de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db e bar_b_prime_ci_subset (estrito, ignorado com a lacuna); bar_b_prime_full_set_of_50_campaigns (ignorado, executado antes do lançamento); testes de iq::labfit::cn0 (degenerescência exata Q-delta, recuperação de delta no Q declarado, inversa do limiar de forma fechada); testes de iq::labfit::iqfit (as condições do modelo de travamento reproduzem exatamente o modelo de C/N0); tests/iq_labfit_followup.rs (o acompanhamento registrado em 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign afirmando o NOT MET registrado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, em release)

# text
seg-52d2a721c38a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — decode_word/decode_frame do RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) como programa separado, pré-registrado ca5f0142: R1 paridade e decodificação, R2 valor decodificado igual ao inteiro do Kshana vezes a escala do IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de meio quantum da entrada. FINDING: R1 { "960" } de { "960" } palavras e { "96" } de { "96" } subquadros; R3 todo parâmetro, semana e tempos de referência exatos; R2 falha em { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades na última casa porque o P2_43 do RTKLIB é o decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo a partir de { "2" }^-43; dividir pela constante do RTKLIB devolve o inteiro do Kshana em todos os casos. Permanece MODELLED: o limiar R2 registrado era apertado demais para a constante da própria referência independente

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constatação fixada); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estrito, ignorado com a lacuna)

# text
seg-d0d7bf57aa68 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — readrnx do RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) lendo o arquivo diário de transmissão do IGS BRDC00IGS_R_20250610000_01D_MN.rnx e decode_word/decode_frame decodificando as palavras do Kshana, executados como programa separado; pré-registrado d4d9eb9d antes de o arquivo ser obtido, limiar de inteiros exatos. Mutação: truncar em vez de arredondar dá { "235" } falhas. Comparações anteriores do mesmo codificador estão registradas como constatações: contra o gps-sdr-sim, que trunca ({ "230" } campos), e contra os valores escalados do RTKLIB, cuja constante decimal { "2" }^-43 não atingiu um limiar de um ulp ({ "41" } valores). Pós-verificação do integrador (permanece MODELLED): a comparação concorda e uma mutação do conjunto de paridade também a torna vermelha, mas o pré-registro d4d9eb9d chegou ao ramo público às { "20" }:{ "02" }:{ "29" } UTC, dois segundos após o commit de resultado 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) que já contém a saída do RTKLIB para o arquivo, de modo que a ordem 'registrado antes de o arquivo ser obtido' não pode ser demonstrada; um novo registro enviado antes de um arquivo de transmissão ainda não visto ser obtido resolveria a questão

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites do arquivo de transmissão do IGS de { "2" } de março de { "2025" }: { "960" } de { "960" } palavras passam na paridade do RTKLIB, { "96" } de { "96" } subquadros decodificam, { "608" } de { "608" } inteiros transmitidos decodificados são iguais aos do Kshana, toda entrada dentro de meio quantum, semana e tempos exatos); gps_lnav::tests

# text
seg-407f33fff57c = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — GNSS-SDR { "0.0.19" } (GPL-3.0, programa separado, configuração fixada) nos nove lotes L1 fora da superfície e no C/N0 BRUTO do receptor de voo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), pré-registrado 768cb62b. FINDING: o leitor do Kshana decodifica todos os { "288" } trechos comparados de forma idêntica a um conversor independente; o GNSS-SDR declara { "266" } de { "288" } buscas positivas e o Kshana concorda em todas as { "266" } decisões, mas apenas { "250" } são localizadas na célula do GNSS-SDR (A2 falha); o ramo de C/N0 é vazio, sem nenhuma época BRUTA de voo a menos de { "30" } s de qualquer lote (a mais próxima a { "141" } s). A maioria dos positivos são artefatos: os níveis simples em complemento de dois trazem uma média de -0.5 em I e Q, uma linha de frequência zero { "32" } dB acima do ruído em uma faixa de { "1" } kHz, que ambos os receptores adquirem. Dois lotes (OP5, OP12) foram excluídos por engano: uma leitura de seus metadados sem dígitos foi tomada por uma contradição com seus cabeçalhos; a causa real era que o leitor não conseguia ler uma amostra mais larga que uma palavra (desde então corrigido). Permanece MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constatação fixada, depende de dados); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estrito, ignorado com a lacuna); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-90535435d10d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registrado 0d1839d2. FINDING: todas as { "288" } buscas cruzam o limiar com ruído (estatísticas de potência de amostra de cerca de { "430" } a { "520" } contra { "346.3" }), portanto P1 vale trivialmente e P3 vale ({ "274" } de { "288" } previstos visíveis) enquanto P2 falha em { "4033" } de { "4036" } pares. O front end de banda limitada eleva o ruído de cada célula cerca de { "1.46" } vezes (fixado: piso de ruído { "292" } contra o ruído branco { "200" } no OP2 PRN { "1" }), o que a estatística de potência de amostra não vê. Permanece MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constatação fixada, depende de dados); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estrito, ignorado com a lacuna)

# text
seg-46dbb16e2ba8 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registrado a81a9a4e. FINDING: P1 e P3 valem ({ "4" } lotes, { "12" } de { "12" } aquisições previstas visíveis), mas P2 falha em { "8" } de { "8" } pares. Os dois pares mais fortes coincidem com a previsão em magnitude com o sinal invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medido, -7693.9 previsto; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), de modo que a ordem registrada com I no nibble baixo é a conjugada da dos lotes; as seis detecções logo acima do limiar não coincidem com nenhum dos sinais. A dispersão de Doppler do refinamento ({ "30" } a { "50" } Hz entre duas execuções) também foi subestimada pelo registro. Permanece MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constatação fixada, depende de dados); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-e10ffc7f4280 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e do kernel do local de pouso do Firefly NAIF CLPS (xval/lugre-predicted-doppler/predict_surface.py, independente do Kshana), pré-registrado 2108e6ff em lotes nunca abertos antes. FINDING: a não vacuidade falha; nenhum lote contém duas aquisições. OP40 excluído (os metadados citam um arquivo ausente); OP38, OP73, OP77_0, OP77_1 não adquirem nada e não mostram falso alarme a { "1e-7" } (estatísticas máximas de { "325" } a { "356" } contra { "385.9" }); OP74 e OP76 adquirem o PRN { "31" } e OP78_0 e OP78_1 o PRN { "12" }, cada um isolado, todos previstos visíveis. Permanece MODELLED. Desvios divulgados: o limiar de Doppler de { "10" } Hz registrado repousa em um Monte Carlo sintético do refinamento coerente, não na dispersão dos lotes já vistos que o integrador pediu; OP40 foi excluído antes da execução porque seus metadados citam um arquivo de amostras que o conjunto de dados não distribui

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constatação fixada, depende de dados); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-9b89d7ff555a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidade diferencial de cancelamento de erros + reutilização da maquinaria de PL de SBAS do DO-229E; a diferença simples + solução por WLS é adicionalmente verificada de forma cruzada contra lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de solucionador independente, mas a mesma álgebra de primeira ordem de diferença de LOS, portanto ainda InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (o modo comum do relógio cancela exatamente; o resíduo cresce com a linha de base; reutiliza o PL de SBAS; a contagem de satélites é respeitada até o limite de { "24" } do construtor, de modo que uma constelação maior não pode devolver silenciosamente uma menor); tests/lunar_differential_pnt_reference.rs (resíduo de diferença simples + solução de posição por WLS contra lsq() do RTKLIB compilado a partir do código-fonte em C)

# text
# c1: oem
seg-4d32db579be8 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — a exportação OEM lunar do kshana relida pela biblioteca independente de terceiros <c1/> (R. J. Anderson): os tokens de referencial/tempo e o estado por época concordam até a precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — uma ida e volta estrutural de intercâmbio; a semântica física de referencial/tempo lunar é validada por suas próprias linhas, portanto isto permanece MODELLED. { "0.30" } comparação externa, uma constatação (permanece MODELLED): um segundo leitor independente, o analisador CCSDS OEM do Orekit { "12.2" } (Apache-2.0, padrões estritos), recusa ambos os arquivos lunares porque não implementa os sistemas de tempo LTC e TCL (ele decodifica a exportação OEM EME2000/UTC do crate, e decodifica os arquivos lunares quando TIME_SYSTEM é substituído por TDB); o oem { "0.4.5" } os decodifica dentro da precisão escrita apenas recorrendo a uma alternativa ao sistema de tempo não suportado. O intercâmbio desses arquivos lunares com leitores CCSDS convencionais não está estabelecido

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (o OEM traz REF_FRAME/TIME_SYSTEM lunares; os metadados de tempo fazem a ida e volta; envelope KIF); tests/lunar_interoperability_export_reference.rs (o OEM lunar emitido pelo kshana relido pela biblioteca Python independente <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época até a precisão do formato; uma exportação corrompida é rejeitada); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Fórmulas por métrica deduzidas à mão: diversidade de Simpson inversa, composto de média ponderada, durações de linha do tempo limitadas/ilimitadas, escada de Level do elo mais fraco

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonicidade, limites do composto, teto de nível, proveniência modelada); resilience::diversity::tests (Simpson inverso, modo comum, SPOF)

# text
seg-173a6b137751 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de estatísticas de postos de forma fechada (tau em [-1,{ "1" }] com valores calculados à mão; Dirichlet semeado determinístico) e testemunhas estáveis/instáveis construídas

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemplo manual de tau de Kendall, simplex de Dirichlet, taxa de inversão); resilience::study::tests (controle de estabilidade, testemunha de instabilidade, declarado contra medido, colapso de diversidade)

# text
seg-6ee8465d60c7 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Invariantes de forma fechada mapeados para a disciplina de compliance de 'representatividade justificada + lacunas até o voo identificadas'; vinculado à fronteira entre status de verificação e tipo de referência independente

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validado-exige-âncora-externa, modelado-exige-lacuna, modelado-teto-de-TRL, faixa malformada, campos JSON)

# text
seg-177c7c6f506a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de benefício/vencedor de forma fechada + encapsulamento fiel do quantum_trade::TradeResult existente; honestidade vinculada ao registro de representatividade e aos rótulos de verificação

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridade do benefício maior/menor é melhor, encapsula fielmente um TradeResult real, evidência desonesta rejeitada, FoM validado exige âncora externa, JSON determinístico)

# text
seg-05e779241ded = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Coeficientes de relógio/CAI reutilizados (holdover/clock_state, valores publicados) + identidades de forma fechada de ruído de disparo/perda para o enlace de emaranhamento

# text
seg-fe77856b9e9d = quantum_devices::tests (cartões de relógio honestos + ordenados; precisão do emaranhamento ~1/sqrt(tau); taxa detectada -10x/10dB; contagens no escuro degradam; limites do piso sistemático; cartão modelado + válido)

# text
seg-06a01a48fcad = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Orçamento em quadratura de forma fechada sobre kernels validados reutilizados (ADEV contra Stable32/NIST; limite de TPL; detecção analytic_pd/pmd); honestidade vinculada ao registro de representatividade

# text
seg-65f4bc801f94 = timetransfer_chain::tests (a precisão melhora com a integração; o quântico pode ganhar E perder; PL finito-positivo; FoM de segurança em [{ "0,1" }] e cresce com o atraso do ataque; Pd de anomalia monótono; o trade is_honest)

# text
seg-6ccf2bd93426 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Orçamentos inerciais reutilizados verificados de forma cruzada contra uma dupla integração independente em Octave da mesma EDO de navegação estimada (outro ambiente de execução, modelo compartilhado → ReferenceImpl) mais o ruído de curto prazo publicado de Freier-2016 como âncora unilateral; o composto quântico contra clássico permanece MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (o quântico supera o clássico em uma interrupção longa; a vantagem depende da interrupção; o trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (crescimento da posição por navegação estimada contra uma dupla integração independente em Octave + a âncora de ruído publicada de Freier-2016)

# text
seg-a06ba11bd079 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — AUC gaussiana de forma fechada = Phi(mu/(sigma*sqrt2)) verificada de forma cruzada contra o eval_stats::bootstrap_auc_ci validado externamente (contra scikit-learn) + limiares analíticos de detecção

# text
seg-8e49ee940482 = quantum_faults::tests (valores conhecidos da AUC analítica; a AUC bootstrap empírica contém a forma fechada; o quântico detecta falhas menores / AUC maior; a vantagem desaparece para falhas enormes; catálogo de 5 classes; o trade is_honest)

# text
seg-c38a05cc3fdb = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Autoconsistência do estimador e da geometria: idas e voltas direta→inversa, a identidade de Fisher/CRLB J·CRLB=I, monotonicidade do GDOP e o estimador atingindo o seu próprio limite de Cramér–Rao sob ruído de Monte Carlo — verificações de consistência interna, NÃO um conjunto de dados externo, portanto a linha permanece InternalConsistency. Geolocalização passiva MODELLED — modelo de linha de visada de fonte pontual; sem termos de multipercurso / NLOS, de viés de relógio do receptor nem de refração atmosférica. { "0.30" } rodada { "2" }, contra Ho e Chan { "1993" } e Ho e Xu { "2004" } (pré-registrada f89018b8, { "1" } % de cada valor impresso), uma constatação (permanece MODELLED): o limite de TDOA com restrição de superfície reproduz os fatores geométricos de { "40" } N (-0.11 %, -0.02 %) e o TDOA máximo; o limite conjunto de TDOA+FDOA reproduz a Fig. { "6" } (+{ "0.06" } %, -0.17 %) e, na fonte que o código dos próprios autores indica para a Fig. { "7" } (emenda escrita depois de o resultado ser visto, divulgada), a Fig. { "7" } (+{ "0.11" } %, -0.02 %); ele é igual ao código do limite publicado pelos autores (estilo BSD, executado sob GNU Octave) até { "3e-12" }; o solucionador de máxima verossimilhança ponderado pela covariância atinge o limite impresso (+{ "0.3" } a +{ "0.4" } %). Os fatores de Ottawa que o artigo imprime a partir de um Monte Carlo ({ "251" }, { "7.1" }) diferem em +{ "1.3" } % e +{ "4.4" } %, fora do limiar de { "1" } %

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA direto→inverso sem ruído até { "1e-6" } m; J·CRLB=I com uma covariância simétrica definida positiva; o traço da variância de posição do CRLB não aumenta quando um receptor é acrescentado; TDOA+FDOA conjunto recupera posição+velocidade de um emissor em movimento; < { "4" } receptores rejeitados); tests/geolocation_reference.rs (idas e voltas sobre quatro geometrias com uma rede 3-D diversa; o estimador de Gauss–Newton atinge o seu limite de Cramér–Rao — a covariância empírica do erro acompanha o limite analítico ao longo de { "4000" } ensaios de Monte Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound e finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fixados)

# text
seg-8ac63d14e24b = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a relação e as constantes como impressas no NASA TR R-376, uma verificação de convergência por meio passo e a ordenação esperada dos picos de aquecimento e de desaceleração. O QUE NÃO É: nenhum valor de aquecimento publicado foi comparado (os artigos da Stardust dão um limite de projeto e uma estimativa convectiva mais radiativa de cerca de { "1200" } W/cm2, que uma relação apenas convectiva não consegue reproduzir); nenhuma correção de aquecimento radiativo, de temperatura de parede ou de catalicidade, nem resposta da proteção térmica.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registra { "746" } W/cm2 para a Stardust sem um limiar)

# text
seg-1f6aec0085c2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas: a MTF de difração em meio corte, a borda em rampa de um pixel de uma abertura pura de detector (RER { "1" }), a borda de CDF normal de um borramento gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), o escalonamento do ruído de disparo e os coeficientes do GIQE { "4" } como publicados (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). O QUE NÃO É: nenhum gerador de imagens externo, MTF medida ou imagem classificada foi comparado; o GIQE é uma regressão empírica com seu próprio erro; sem luz parasita, MTF atmosférica, compensação de MTF nem aliasing.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a identidade exata velocidade de fim de queima = soma de Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo abaixo de { "1e-6" } m/s), a equação de Tsiolkovsky em uma queima vertical no vácuo com a gravidade como única perda, e as pressões do US76 ao nível do mar e na tropopausa. O QUE NÃO É: as perdas de nenhum veículo publicado foram comparadas; sem rotação da Terra, fase balística, aceleração controlada nem guiamento além do chute; C_D constante; não é um otimizador de trajetória.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: o modelo direto e a equação resolvida concordam até { "1e-15" } s, o termo de Sagnac é igual à forma de laço independente 2A omega/c^{ "2" } do BIPM do módulo, o termo ionosférico é { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, e os processos de ruído mostram os formatos de TDEV esperados. O QUE NÃO É: nenhuma medição TWSTFT real nem relatório de calibração foi comparado; os atrasos e as incertezas declarados são entradas, não medidos; as estabilidades das séries fornecidas são relatadas, não validadas.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (a equação de duas vias recupera o deslocamento exatamente; o termo de Sagnac é igual à forma fechada de laço do BIPM; o termo ionosférico segue a divisão de frequência e a troposfera cancela; a fase flicker tem um TDEV plano; um resíduo diurno eleva o TDEV perto de meio dia; um viés de reciprocidade desloca o deslocamento e não o TDEV; a estabilidade da série remove uma taxa); time_transfer_budget::tests

# text
seg-4ca4b46b128c = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — A numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } com { "30" } dígitos, quadratura tanh-sinh sobre a variável de altura original e densidades gama-gama de Bessel-K) que não compartilha código com o Kshana, sob limiares fixados antes de existir qualquer implementação (xval/optical-atmosphere/PREREGISTRATION.md). POR QUE MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, portanto verifica a implementação das fórmulas declaradas e não a atmosfera; nenhum exemplo de validação da ITU-R e nenhum registro medido de cintilação ou de extinção em trajeto oblíquo é usado (os valores da ITU são uma decisão de licença em aberto e são mantidos fora do repositório). O nível do perfil de Cn2, a visibilidade, as alturas de escala de aerossol e molecular, o comprimento de trajeto da média de abertura e o ajuste de momentos usado para aplicar a média de abertura aos parâmetros gama-gama são entradas ou convenções declaradas. Uma linha de fonte no módulo registra que um levantamento amplamente copiado imprime o segundo expoente de cintilação como 7/6 onde Andrews e Phillips dão 5/6; a forma 5/6 é a implementada

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (limiares pré-registrados A1-A3 contra a referência independente mpmath: { "216" } pontos da grade de Rytov, pior erro relativo { "3.4e-7" } contra um limiar de { "1e-6" }, cintilação pior { "4.5e-16" }, fator de abertura pior { "5.7e-16" }, { "96" } probabilidades de desvanecimento gama-gama, pior { "1.3e-12" } em log10, profundidade óptica de nuvem e de ar limpo pior { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (limiar A5: o orçamento de enlace de perda agrupada e as saídas existentes de disponibilidade de local são idênticos bit a bit ao commit base ao longo de { "1,000" } conjuntos de parâmetros)

# text
seg-6cf381ac2e3d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: limites de forma fechada e monotonicidade do modelo de diversidade, a forma fechada do teto de nuvens e as identidades de indisponibilidade log-normal. NENHUMA referência independente externa é alegada e nenhuma foi comparada: nenhum registro medido de disponibilidade de estação óptica de solo nem de linha de visada livre de nuvens é usado. POR QUE MODELLED: o clima de nuvens (probabilidade de nuvem, mediana e dispersão da coluna de água líquida, durações de indisponibilidade), a independência entre nuvem e turbulência, a forma de cópula gaussiana, o comprimento de decorrelação e todo ganho de técnica são suposições; os cenários incluídos declaram climas ILLUSTRATIVE, não um conjunto de dados. Promover esta linha exige um registro medido de disponibilidade citado e um limiar registrado antes da comparação

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (limiar A4: rho = { "0" } é igual à união independente e rho = { "1" } ao melhor local único até { "1e-12" }, e zero violações de monotonicidade no número de locais e na correlação; a primeira execução deste limiar errou por { "3e-9" } porque a CDF normal em uso era a forma de Abramowitz-Stegun de { "1.5e-7" }, um defeito de implementação substituído pela CDF da gama incompleta com o limiar inalterado); optical_weather::tests e optical_sitediv::tests (margem monótona, o teto de nuvens como forma fechada, as identidades de duração de indisponibilidade, inversão da busca de margem)

# text
seg-1d817d8409d3 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna com o módulo de holdover, bit a bit; NENHUMA referência independente externa é alegada. As PSDs de classe são os pisos sintetizados de tau longo que o módulo de holdover já traz, portanto as figuras herdam a sua ressalva declarada de que o holdover até um limiar apertado é governado pelo piso de ruído vermelho presumido e não pelo desvio de Allan citado. As durações de indisponibilidade são um modelo log-normal com parâmetros declarados, não um registro medido de permanência de nuvens

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (limiar A6: o erro de temporização por indisponibilidade é igual a holdover::coast_phase_sigma e o erro de distância é igual a phase_to_range_m bit a bit ao longo de { "9" } relógios, { "3" } durações médias, { "3" } dispersões e { "4" } quantis); optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Apenas consistência interna; NENHUMA referência independente externa é alegada e nenhuma existe para uma realização meteorológica. As verificações comparam um sorteio com a saída estatística do mesmo modelo, de modo que um resultado positivo diz que o gerador amostra as distribuições declaradas (a disponibilidade e a fração de nuvens do sorteio ficam dentro de tolerâncias pré-registradas dos valores declarados), não que algum local real se comporte assim. A série é uma realização, não o clima: sua disponibilidade difere da declarada pelo erro de amostragem do sorteio, e as amostras de cintilação em passos diferentes são independentes, uma simplificação declarada de um processo que se decorrelaciona em milissegundos. As entradas meteorológicas permanecem suposições do cenário.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (limiares T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixados antes da primeira execução: mesma semente mesmos bytes e outra semente outros bytes; nenhuma chave sem a tabela; ao longo de { "8760" } h a { "600" } s, sementes { "37" } e { "38" }, a disponibilidade realizada de cada um dos três locais padrão dentro de { "6" } pontos da declarada (pior { "3.3" }) e a fração de nuvens realizada dentro de { "5" } pontos da probabilidade declarada (pior { "2.1" }); a margem é igual ao orçamento menos os dois desvanecimentos e up é igual a margem não negativa em todo passo; nenhuma chamada matemática não portátil no módulo; execuções longas demais e passos inválidos recusados)

# text
seg-4dfa142a94c4 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — O rótulo PDS3 que o processo de condicionamento de dados de navegação da DSN produziu com o arquivo (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), verificado contra limiares pré-registrados em xval/mro-odf/PREREGISTRATION.md antes de o leitor existir. MODELLED porque um limiar registrado (as linhas da tabela de fim de arquivo, { "121" } no arquivo contra { "120" } no rótulo) não foi atingido; o rótulo é internamente inconsistente aí. Etapa { "2" } (xval/mro-od/PREREGISTRATION.md, emendas A1 e A2 antes do resultado pontuado): o Doppler previsto a partir da reconstrução da equipe de navegação da MRO (mro_psp5, NAIF) coincide com o Doppler de 2 vias em rampa observado até { "12.5" } mHz em passagens não usadas no desenvolvimento, limiar atingido; a determinação de órbita registrada falhou no arco pontuado (matriz normal não definida positiva) e não produziu órbita, portanto os limiares de órbita não foram atingidos. A execução { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, um estimador amortecido, o mesmo arco e os mesmos limiares, uma emenda de pontuação R2-A1 divulgada em docs/revisions) convergiu: a órbita estimada fica a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução, limiares atingidos, mas o RMS de Doppler pós-ajuste é de { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido, portanto a linha permanece MODELLED. O QUE NÃO É: nenhuma órbita estimada atingiu todos os limiares registrados; ionosfera, plasma solar e a maior parte do deslocamento da antena (um deslocamento radial de { "1.5" } m é ajustado na passagem de desenvolvimento) não são modelados.

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK tipo { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (um ODF real da MRO, 2007-304/305, contra o seu rótulo PDS: contagem de registros, posições de grupos, estações, horários de início e fim e tipos de dados conferem; a contagem de linhas da tabela de fim de arquivo erra por um, uma inconsistência do rótulo, fixada como constatação); odf::tests (ida e volta de registro construído à mão, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (depende de dados, entradas com SHA-256 fixado, CI mensal com dados reais exigido: Doppler previsto a partir da reconstrução de navegação da MRO mro_psp5 nas passagens pontuadas DSS { "63" } e DSS { "14" }, { "12.5" } mHz RMS, limiar { "30" } mHz, atingido; a determinação de órbita registrada não produziu órbita, fixada como constatação; execução { "2" } com um estimador amortecido, registrada separadamente: órbita { "0.36" } km RMS e { "0.53" } km no máximo contra mro_psp5, atingido, Doppler pós-ajuste { "48.6" } mHz contra { "30" } mHz, não atingido, fixado como constatação; leitor de SPK tipo { "1" } contra o CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-8566593647ee = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: o erro de estimação normalizado ao quadrado do filtro contra a verdade simulada a partir dos mesmos modelos de sensor ao longo de sementes de Monte Carlo, e a convergência das estimativas de atitude e de viés. O QUE NÃO É: nenhum estimador externo nem dados de voo foram comparados (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensor são os de livro-texto, sem desalinhamento, fator de escala nem efeitos do campo de visão do rastreador estelar.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } sementes, NEES médio de seis graus de liberdade na segunda metade dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna, a partir de três grandezas calculadas por expressões diferentes na mesma varredura e então exigidas a fechar. Os segundos de abertura de navegação, os segundos de abertura de comunicações e os segundos de abertura ociosos são acumulados separadamente — o ocioso a partir de (aberturas − |atendido|) por intervalo elementar, nunca como um resto — e a sua soma é afirmada contra aberturas × horizon_s, o que uma fronteira mal delimitada, um intervalo contado em dobro ou um descartado quebra imediatamente; os tempos atendidos por sessão são exigidos separadamente a somar de volta os dois totais de serviço. As propriedades estruturais do escalonador são medidas em vez de presumidas: afirma-se que o tempo atendido é não decrescente na contagem de aberturas ao longo de { "200" } planos pseudoaleatórios para as três políticas (não óbvio para a política não preemptiva, em que uma abertura extra muda quem detém o quê em cada fronteira posterior), e a aritmética de fronteira é fixada no par de contato/sobreposição de um segundo, onde um erro de uma unidade se esconderia de outro modo. A ponte do preditor de passagens é verificada contra a saída de <c1/>: com uma abertura e nenhum serviço concorrente, os segundos de abertura de navegação são iguais às somas das próprias durações de passagem do preditor. Nenhuma referência independente externa é alegada e nenhuma existe: a capacidade substitui a aritmética manual em vez de ser verificada contra ela, o plano de contatos incluído é ilustrativo em vez de voado, e nenhum escalonador operacional publica um par plano-mais-resposta com a sua regra de arbitragem declarada — um dever calculado sob uma política não declarada não é comparável a um calculado sob uma política declarada, e a dependência da política é medida (deveres de navegação de 100/150 contra 50/150 no mesmo plano). Tempo de reorientação e de troca, volume de dados, estado do buffer, energia e fechamento de enlace são excluídos no rótulo do relatório em vez de modelados silenciosamente

# text
seg-4da98593fe6a = aperture_duty::tests (uma janela que termina exatamente quando a seguinte começa não disputa, e adiantá-la em um segundo custa exatamente um segundo — a proteção contra erro de uma unidade; janelas sobrepostas além da contagem de aberturas colocam a sessão de menor prioridade em indisponibilidade, com o intervalo de disputa fixado; a política de arbitragem decide qual serviço detém a abertura, com os números das três políticas fixados em um único plano; o primeiro a chegar, primeiro a ser atendido não preempta uma sessão que já detém uma abertura; uma sessão que perde a arbitragem em seu início adquire uma abertura quando uma é liberada; os três deveres contabilizam cada segundo de abertura disponível em { "3" } políticas × { "4" } contagens de aberturas; acrescentar uma abertura nunca aumenta a indisponibilidade de nenhuma sessão, medido em { "200" } planos pseudoaleatórios × { "3" } políticas × toda contagem de aberturas; aberturas suficientes para todas as sessões não deixam nenhuma indisponibilidade; o horizonte de relatório recorta o plano e define o denominador do dever; uma lista de passagens previstas se torna um plano de contatos sem um segundo tipo de janela; os números de dever do plano incluído são saídas do motor para uma e duas aberturas; o relatório declara a política que produziu os números; toda figura relatada traz uma unidade e uma classe de proveniência; o cenário é reproduzível e se declara MODELLED; o cenário rejeita um plano que não consegue escalonar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Verificação cruzada de composição contra um caminho de código independente no próprio repositório: todo J/S por enlace é rededuzido como a diferença de dois orçamentos de enlace calculados com linkbudget::received_signal_power_dbw, cuja perda no espaço livre é a expressão única { "20" }·log10(4πRf/c) em vez da soma de três termos que jamming::free_space_path_loss_db usa — os dois concordam a < { "1e-9" } dB em toda linha (pior caso medido { "7.11e-14" } dB, isto é, arredondamento de ponto flutuante). A cadeia de interferência subjacente que ela compõe está ancorada externamente, em separado, em tests/gnss_denied_jamming_resilience_reference.rs (rededução independente em numpy/scipy de J/S e C/N₀ efetivo fixada em Kaplan & Hegarty §{ "9.4" }, mais o C/N₀ medido do JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); a geometria lunar que ela compõe é a geometria de lunar_service/lunar com suas próprias referências independentes. Identidades de forma fechada verificadas aqui: um afastamento do interferidor reduzido à metade acrescenta exatamente { "20" }·log10({ "2" }) dB a toda linha; o J/S é exatamente invariante ao ganho no eixo da antena do usuário, enquanto o C/N₀ se move exatamente por esse ganho; uma máscara de elevação não altera nenhuma linha restante, bit a bit. A própria linha permanece ReferenceImpl/modelada: não existe campanha medida de interferência lunar contra a qual validar, e a constelação é uma geometria ilustrativa de fonte pública de classe Moonlight/LCNS, não uma efeméride voada

# text
seg-875ebc4e1cc4 = lunar_jamming (compondo jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } testes de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna contra as próprias funções diretas do motor, que é tudo o que esta capacidade pode honestamente afirmar. Todo ponto do contorno é uma inversão de forma fechada, e cada inversão é verificada devolvendo a sua resposta pela função DIRETA com que as próprias linhas do relatório foram pontuadas: a coluna de J/S por jamming::effective_cn0_dbhz (que deve devolver tracking_threshold_dbhz a < { "1e-9" } dB-Hz), a coluna de afastamento por jamming::free_space_path_loss_db e jamming::j_over_s_db (o mesmo J/S a < { "1e-9" } dB), a coluna de EIRP por jamming::j_over_s_db no afastamento do próprio cenário. Verifica-se ainda que o contorno é o LIMITE do conjunto de negação, e não um ponto dentro dele — lock_status perde o travamento com uma desigualdade estrita, de modo que se mede o veredito passar de DEGRADED para LOST ao longo de { "1e-4" } dB de J/S de cada lado do contorno, o que um contorno errado por um epsilon reprovaria. A verificação mais forte é por enlace, e não por quantil: aplicar o mesmo mapa ao C/N₀ de cada linha reproduz exatamente a coluna de status do relatório — { "0" } divergências em { "38" } de { "38" } linhas no ponto de operação documentado (kind = lunar-jamming, toda entrada padrão exceto jammer.range_m = { "25 000" } m), onde { "26" } linhas são LOST e { "12" } não são. A monotonicidade é medida, não presumida: { "20 001" } amostras em [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violações de um afastamento estritamente decrescente e de uma potência exigida estritamente crescente, de modo que a ordenação dos quantis da faixa é demonstrada em vez de afirmada. ExternalDataset é recusado, e validada junto com ele: não existe campanha medida de interferência lunar com a qual comparar um raio de negação, a constelação é uma geometria ilustrativa de fonte pública de classe Moonlight/LCNS em vez de uma efeméride voada, e as entradas do contorno (EIRP, potência do interferidor, ganhos de antena, temperatura de ruído) são magnitudes representativas. ReferenceImpl também foi considerada e recusada — a inversa e a expressão direta são a MESMA álgebra lida em dois sentidos, de modo que a ida e volta detecta erros de transcrição e de sinal, mas não é uma implementação independente; chamá-la de verificação cruzada seria o movimento de independência emprestada que as invariantes da matriz existem para impedir. O que a faixa traz é medido e citado em vez de afirmado: nesse ponto de operação, o contorno de escalar único é { "27.402916" } km e coloca { "25" } km do lado negado para todas as { "38" } linhas, enquanto a faixa { "21.256108" } .. { "29.921360" } km contém o ponto de operação e portanto relata a divisão que a tabela de fato mostra. Os dois critérios também são medidos como discordantes — a faixa de razão de potência ({ "38.186527" } .. { "53.691675" } km) não contém { "25" } km de modo algum — e é por isso que ambos são impressos

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; invertendo jamming::effective_cn0_dbhz, jamming::j_over_s_db e jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } testes de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Duas referências independentes internas, nenhum conjunto de dados externo. ({ "1" }) Ida e volta de forma fechada: o viés mínimo detectável é produzido invertendo a cauda do qui-quadrado não central sobre a não centralidade (raim::pbias) e é verificado devolvendo a não centralidade resultante por raim::noncentral_chi2_cdf no limiar do próprio monitor, o que deve devolver P_md. ({ "2" }) Injeção contra análise: um viés é escrito na estimativa de RF de um eixo e cross_raim::run_cross_raim é executado de novo, de modo que a estatística comparada com a não centralidade analítica é a que o monitor calculou, não uma rededução. Um Monte Carlo semeado da própria estatística é mantido nos testes como terceira verificação; ele deliberadamente NÃO está no relatório, porque uma estimativa amostrada seria mais lenta e não reproduzível bit a bit. ExternalDataset é recusado: a grandeza é o poder de detecção DESTE monitor na alocação de sigma DESTE cenário, e as magnitudes de sigma pelas quais o MDB é escalonado são entradas representativas modeladas, não medições. ReferenceImpl também foi considerada e recusada — o Monte Carlo amostra a mesma estatística que a análise descreve, de modo que detecta erros de transcrição e de coeficiente, mas não é uma implementação independente do monitor. { "0.30" } rodada { "2" } (pré-registrada 0135a9e4), bloqueada (permanece MODELLED): chi2/ncx2/brentq do SciPy { "1.18.1" } reproduzem o limiar do relatório (dentro de { "5.4e-12" }), o MDB por eixo, a curva de potência, o múltiplo de cruzamento e o tempo de detecção da rampa (dentro de { "5.3e-10" }) em cinco configurações; as estatísticas de falha injetada não têm referência independente e as magnitudes de sigma são entradas modeladas, portanto a delimitação aguarda uma decisão do responsável

# text
seg-83724a2a8e06 = hybrid_integrity::tests (a curva de poder de detecção vai da taxa de falso alarme com falha zero até { "1" } − P_md no viés mínimo detectável; o viés mínimo detectável devolvido por noncentral_chi2_cdf no limiar que o próprio monitor aplicou devolve P_md a { "1e-9" }, em todo eixo e pelo auxiliar público; um viés realmente injetado na estimativa de RF desloca a própria estatística do monitor exatamente por b²/(σ_rf² + σ_opt²) calculado à mão; um viés sem ruído é capturado acima de √(T/λ*)×MDB e perdido abaixo dele, com a escada injetada atravessando esse cruzamento; o poder de detecção é monótono na magnitude da falha e idêntico nos quatro eixos em múltiplos do MDB; um Monte Carlo semeado de 200,000 amostras da estatística do monitor reproduz o poder analítico dentro de 4σ em quatro pontos da curva; o MDB de temporização é fixado acima do limite de alerta de temporização, o que é uma fraqueza medida e não uma característica; mede-se que o quantil de Wilson-Hilferty discorda do limiar exato do monitor em ~{ "4" }%, registrando por que não foi usado; a figura de rampa é exatamente MDB/taxa e escala inversamente com a taxa, e uma taxa não positiva relata nulo em vez de zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma referência independente externa. O cruzamento é uma solução de forma fechada do crescimento de variância por passeio aleatório, e os testes o recalculam de forma independente a partir dos valores que o próprio relatório publica, e não a partir dos componentes internos do emissor. A covariância inicial é fixada bit a bit ao traço que o bloco de transferência existente já relatava, de modo que a deriva não pode propagar uma covariância que ninguém mais viu. As PSDs de ruído de processo são entradas representativas MODELLED e os tempos de cruzamento escalam diretamente com elas, o que o teste de escala declara como propriedade medida e não como afirmação. ExternalDataset é recusado deliberadamente: o tempo de deriva é uma função direta de duas PSDs modeladas e de limites de alerta que são, eles próprios, representativos, e não existe deriva medida de transferência óptica/RF lunar com a qual comparar. Uma referência independente externa aqui exigiria uma curva publicada de crescimento de covariância pós-transferência ou de exatidão de holdover para um receptor comparável, com o seu modelo de ruído de processo declarado, verificada até uma tolerância

# text
seg-f9767a6109d5 = hybrid_integrity::tests (a deriva começa exatamente do traço de covariância que o bloco de transferência relata, nos dois sentidos, de modo que a diagonal reproduzida não pode divergir da transferência relatada; o tempo de cruzamento relatado é recalculado a partir do sigma de transferência, da PSD de ruído de processo e do fator de cobertura do próprio relatório, e o limite fica dentro do limite de alerta logo antes dele e fora logo depois; o tempo de deriva escala exatamente de forma inversa à PSD de ruído de processo e encurta quando o limite de alerta se aperta; uma deriva com PSD zero relata nulo em vez de um tempo zero, porque nunca não é imediatamente; o perfil emitido cruza exatamente uma vez e delimita o cruzamento relatado; o tempo de duplicação da variância e o tempo de cruzamento do limite de alerta são fixados separados, diferindo em oito ordens de grandeza após o estágio óptico apertado e em menos de uma ordem de grandeza após o estágio de RF frouxo; deixar a modalidade óptica rende mais tempo de deriva do que deixar a de RF, exatamente pela diferença de covariância dividida pela taxa de crescimento horizontal; e random_walk_time_to_limit distingue já-fora, cruza-em-t e nunca-cruza)

# text
seg-903acaa666a9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Misto, e separado em vez de agrupado. O PADRÃO subjacente é validado externamente e mantém a sua própria linha (uma fixture scipy.special.j1 a < { "0.05" } dB em tests/validate_p1_orbital_footprint.rs, mais aqui a abscissa de meia potência de Airy publicada x = { "1.61634" } localizada por bisseção e não presumida). A GEOMETRIA é verificada contra a trigonometria de triângulos de forma fechada escrita como uma expressão diferente do produto escalar sob teste. A CONTENÇÃO do feixe real pelo cone aproximado é álgebra derivada (28.019/√η contra { "29.479" } graus por λ/D), de modo que a correção só pode ser não positiva para η ≤ { "0.9035" }. Mas as CONTAGENS dentro do feixe em si não têm referência independente externa: nenhuma tabela publicada diz quantos satélites de uma casca de classe Moonlight/LCNS mantêm um local do polo sul dentro do feixe de meia potência de um dado prato, e a constelação é uma aproximação ilustrativa de fonte pública, não uma efeméride voada. A discordância medida no ponto de trabalho documentado — { "0" } enlaces no feixe com o padrão real contra { "28" } com a aproximação, −{ "2.33" } satélites por época, pior época { "3" }, em { "76" } enlaces avaliados — é portanto uma constatação MODELLED sobre a aproximação, fixada como literal de regressão (a linha mais próxima fica a { "0.069" }° de qualquer borda do feixe, quatro ordens de grandeza acima de qualquer discordância no último dígito), não um número de cobertura validado externamente. Rotular a linha como ExternalDataset com base na própria âncora externa do padrão seria validação emprestada, que é o movimento que as invariantes da matriz existem para impedir. { "0.30" } rodada { "2" } (pré-registrada d9755d28), bloqueada (permanece MODELLED): a geometria SPICE e as funções de Bessel do SciPy reproduzem o ângulo fora do eixo (pior { "3.0e-5" } deg), o ganho de Airy e os sinalizadores de dentro do feixe em { "6 336" } linhas de estados de orbitadores voados e do ponto de trabalho documentado; mas em geometria voada os sinalizadores se dividem por identidade de satélite (o enlace mais próximo fica a { "1.66" } deg da borda do feixe), a visibilidade de { "5" } deg é verificada como sinalizador, não como elevação numérica, o sinalizador de aproximação simétrica aplica a regra prática de 31000/G a um ângulo validado sem validar a regra, e as eficiências implícitas não têm referência independente; a delimitação aguarda uma decisão do responsável

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests e lunar_service::tests (o cruzamento de meia potência localizado por bisseção sobre o padrão coincide com o x de Airy publicado = { "1.61634" } e produz a largura exata de { "1.02899" }·λ/D, registrando que o coeficiente convencional { "1.02" } fica em −{ "2.955" } dB e não em −{ "3.010" } dB; o padrão é estritamente decrescente em { "400" } pontos do eixo até o primeiro nulo; a álgebra de eficiência implícita faz a ida e volta até { "1e-12" } e reproduz { "0.641" } / { "0.920" }; o ângulo fora do eixo coincide com tan θ = R·sin γ/(r − R·cos γ) em { "20" } pontos e ambos os limites até { "1e-12" }; o cone aproximado contém o feixe real linha a linha; as contagens principais são iguais aos sinalizadores por linha que resumem e a correção é igual à sua diferença; todo veredito de linha é recalculável apenas a partir do relatório emitido; todo campo numérico e booleano emitido tem uma unidade e uma classe de proveniência; uma abertura impossível não emite bloco; sem antena configurada a exportação mantém exatamente as suas seis chaves preexistentes, { "0" } folhas alteradas e { "0" } removidas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — O correlator sdr do próprio motor (sdr::correlate / synth_if / CaCode) avançado passo a passo sobre FI sintética semeada a um C/N₀ calibrado — um caminho de código separado que chega aos mesmos números por correlação numérica de IQ amostrado e não por uma expressão algébrica de jitter, de modo que é uma rota diferente e não uma reafirmação — mais valores tabelados padrão de I₀ de Bessel modificada para o termo de salto de ciclo. Teoria de malha segundo Kaplan & Hegarty cap. { "8" } e Viterbi/Gardner para o tempo de salto. A linha permanece ReferenceImpl/MODELLED: a verificação cruzada vive nesta mesma base de código, e a verificação de bessel_i0 valida uma função especial e não o modelo de rastreamento, portanto promover a linha com esse fundamento seria um rótulo interesseiro. ExternalDataset exigiria um conjunto de dados de FI bruta gravada com C/N₀ de verdade de referência e um instante de perda de travamento anotado (classe TEXBAT/OAKBAT); nenhum acompanha esta árvore, e mesmo com o IQ esses conjuntos de dados não publicam verdade de estado de malha por época, de modo que um tempo declarado de perda de travamento só poderia ser validado contra o detector de travamento de algum outro receptor, o que é uma escolha modelada e não uma referência independente. As larguras de banda de malha, o tempo de integração, o espaçamento do correlator, a razão de captura, as permanências, a potência do interferidor e os ganhos de antena são valores representativos de faixa, não de uma folha de dados. { "0.30" } rodada { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, executado como programa) sobre FI gerada de forma independente (pré-registrada 6ef7698c, emendas ao método de medição divulgadas), uma constatação (permanece MODELLED): o jitter de PLL e DLL em malha fechada concorda dentro de { "8" } % a { "35" } a { "45" } dB-Hz, o estresse dinâmico de { "10" } Hz/s dentro de { "1" } % e o atraso de rampa de código de primeira ordem dentro de { "2" } %; a { "30" } dB-Hz o jitter do PLL é { "21" } % maior e o do DLL { "32" } % menor, os limiares medidos da regra de 15 graus ficam { "1.5" } dB acima do motor, e a malha de segunda ordem salta de { "0.5" } a { "2" } décadas mais vezes que o limite de tempo de salto de primeira ordem. { "0.30" } revisão: o tempo de salto de Costas agora usa a SNR de malha rho/4 (saltos de meio ciclo); o log10_mean_time_to_cycle_slip_s padrão de jitter_table cai de { "11.58" } para { "2.10" } no limiar de { "25.47" } dB-Hz

# text
seg-9910640b7886 = tracking_loop (compondo sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter do discriminador de Costas em malha aberta contra sdr::correlate avançado passo a passo sobre FI sintética semeada, { "3" } realizações de ruído agrupadas × { "900" } épocas, concordando a { "0.63" }% em 35-45 dB-Hz, com o termo de perda de elevação ao quadrado exigido a se ajustar pelo menos { "3" }× melhor que a forma sem perda de elevação ao quadrado onde quer que seja resolvível; a saturação do discriminador atan em ~{ "32" } dB-Hz afirmada e não apenas declarada, de modo que o limite de validade é fixado; σ em malha fechada contra uma malha de Costas sdr avançada passo a passo ao longo de { "4000" } épocas a { "3.7" }%; atraso de rampa do DLL de primeira ordem contra um DLL sdr avançado passo a passo a { "0.17" }%; bessel_i0 contra I₀ tabelado a { "7.4e-8" }; a largura de histerese exigida a cair em [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] em { "4" } razões × { "2" } tempos de integração × { "3" } larguras de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Identidades de forma fechada, sem referência independente externa alegada nem disponível. O braço de alavanca é verificado contra ρ/B e as duas formas de equipartição entre si a { "1e-15" } — identidades algébricas, de modo que detectam um erro de ligação e nada mais, e são rotuladas como tal. O resultado substantivo é MEASURED em vez de afirmado: um atraso a partir de uma linha de base fixa restringe a DIREÇÃO do farol, de modo que a componente de linha de visada chega à matriz de informação apenas pelo termo de distância de campo próximo, e o teste lê a anisotropia resultante do espectro emitido em vez de deduzi-la. A desigualdade AM-HM faz de √(p/trace(M)) um piso rígido, de modo que um enlace de equipartição isotrópica só pode SUBESTIMAR, e a razão calculado-sobre-equipartição é exatamente a anisotropia que ele descartou. MEASURED no par tipo Goldstone/tipo Canberra cuja corda é { "10726.748" } km: em { "112" } dias amostrados, { "36" } não admitem nenhuma época de visibilidade mútua a uma máscara de { "10" }°, o máximo de visibilidade mútua já obtido é { "17" } de uma programação de 49 amostras, e nos { "73" } dias viáveis a razão de três componentes vai de { "113.9" }× a quatro ordens de grandeza a mais, mediana { "1513" }×, enquanto restringir às duas direções transversais que a linha de visada não deixa sem informação dá { "3.94" }× a { "25.8" }×, mediana { "7.8" }×. O QUE ESTA LINHA NÃO AFIRMA: qualquer uma dessas figuras como propriedade de uma campanha real. Ela estabelece que a grandeza do ponto de superfície agora é CALCULADA em vez de presumida, e que não pode ser trocada silenciosamente pela de nível de estação. Permanece ReferenceImpl/MODELLED: não existe covariância publicada de ponto de superfície de VLBI lunar contra a qual validar, as estações e o local do farol são ilustrativos e não levantados, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, de modo que este é um limite de Cramér-Rao para um conjunto reduzido de parâmetros e otimista por si só. A mesma grandeza no caminho do kernel (farol na Lua DE440) é validada em sua própria linha, "…, kernel path"; neste caminho analítico o menor sigma do farol fica { "3.9" } % abaixo da referência independente SPICE dessa linha, e é por isso que esta linha permanece MODELLED

# text
seg-e6236f142dae = lunar_vlbi_fim (compondo lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } testes de biblioteca: toda grafia de datum faz a ida e volta por parse/as_str e uma desconhecida é recusada; manter fixas todas as estações sem o farol é recusado com um erro que nomeia <c1/>; o braço de alavanca é afirmado IGUAL a ρ/B e a equipartição do farol IGUAL à equipartição da estação multiplicada por ele, ambos a { "1e-15" }, com uma afirmação adicional de que o braço de alavanca excede { "10" }, de modo que os dois orçamentos não sejam confundíveis nesta geometria; a linha de base publicada da fixture é fixada em { "10726.748" } km e afirma-se que a sua programação de 49 amostras produz estritamente menos de { "49" } observações de visibilidade mútua; mede-se que o espectro do farol em uma única linha de base abrange pelo menos cinco décadas e a razão resultante é afirmada acima de { "1" } por AM-HM e acima de { "100" } de fato; afirma-se que o layout estação-mais-farol tem posto deficiente com AMBOS os campos calculados nulos enquanto o termo de comparação modelado ainda é relatado. Mais uma proteção sobre a própria fixture: uma chave de nível superior inserida depois de um array de tabelas passa a ser dado de estação, de modo que o ponto de inserção é afirmado e verifica-se que o cenário analisado traz a chave — o modo de falha é uma execução que usa silenciosamente uma configuração diferente da que o teste nomeia)

# text
seg-27b8c06d7d01 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de forma fechada e autoconsistência: a variância de passo²/12 do quantizador uniforme, a propagação exata de covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ colapsando em σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fechamento em quadratura ao desligar. A verificação cruzada do PDOP contra orbit::dop compartilha a matriz normal [−û, { "1" }], de modo que é uma verificação de consistência e é rotulada como tal, e não como referência independente. Nenhum ExternalDataset está disponível ou é alegado: nenhuma estação de superfície lunar tem exatidão levantada publicada, nenhum enlace lunar de correção diferencial tem latência ou formato de mensagem publicado, e o resultado de quantização é uma forma fechada e não uma medição. O RTKLIB — já a referência independente de código externo para o kernel de diferença simples e de mínimos quadrados ponderados — poderia ser conduzido com uma base deliberadamente mal levantada para confirmar a transferência de levantamento { "1" }:{ "1" }, mas isso é código independente sobre a mesma álgebra de linha de visada de primeira ordem. AS MAGNITUDES SÃO MODELLED: o padrão de levantamento é a própria alocação de realização de referencial lunar deste crate e não uma estação medida, a latência e a contagem de bits são entradas ILLUSTRATIVE, e o crescimento do próprio VETOR de erro de efemérides transmitidas não é modelado de modo algum — declarado na string da lei de envelhecimento emitida, porque é o termo mais provável de dominar um enlace real

# text
seg-08708f044bb5 = lunar_dpnt::tests (uma proteção puramente aditiva cujo delta de conjunto de chaves é exatamente { "{" }correction_link, units{ "}" } com todo valor preexistente idêntico bit a bit contra literais capturados antes da mudança; o erro de levantamento NÃO se descorrelaciona com a linha de base enquanto o termo de órbita sim, e sobrevive a uma linha de base zero onde o termo de órbita é exatamente zero — a verificação estrutural que detecta ligar o termo no lugar errado; um erro de estação de { "1" } m transfere { "1" }:{ "1" } e comprova-se que não é amplificado pelo DOP; latência zero reproduz o resíduo não envelhecido bit a bit e o resíduo é monótono na latência, com a curva emitida igual a execuções diretas; o passo de quantização cai exatamente pela metade por bit e σ² = passo²/12, e o fundo de escala acompanha as magnitudes injetadas; cada termo desligado por vez recupera os outros dois em quadratura; σ igual por satélite se propaga exatamente em σ·PDOP e esse PDOP concorda com orbit::dop; todo campo emitido traz uma unidade e uma classe de proveniência, verificado nos dois sentidos)

# text
seg-37f07885bbf0 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Aritmética recalculada por um script numpy independente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; pré-registrada em tests/fixtures/lunar_station/PREREGISTRATION.md, registrada sozinha em 9caedf97 antes da primeira execução): em { "20" } casos com todo termo de erro ativado, os conjuntos visíveis e o status são idênticos, os erros brutos de distância concordam a { "1.4e-14" } m, os vetores e as magnitudes de erro de posição a { "1.4e-9" } m contra um limiar de { "1e-6" } m, e o p95 de cada ponto é igual ao de numpy.percentile bit a bit; as correções da estação NÃO ATINGIRAM o seu limiar de { "1e-9" } m (pior { "3.73e-9" } m, { "15" } de { "20" } casos), e com elas os erros de distância corrigidos: verificado em aritmética de 60 dígitos, ambos os lados estão dentro do arredondamento de precisão dupla do valor exato, sendo o termo de levantamento uma diferença de duas distâncias de { "1e7" } m cuja unidade na última casa é { "1.86e-9" } m; registrado, não ajustado. O tipo de cenário se reduz exatamente ao tipo de cenário lunar-differential-pnt com um ponto, uma época e um ensaio. O modelo de erro, o modelo de descorrelação e todo limiar são próprios deste projeto ou ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-810a6946b5cd = lunar_station (sobre lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: a { "1e-12" } m com e sem ruído do receptor; zero_baseline_floor_is_zero_in_every_trial: { "0" } a { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro da faixa de { "5" } % declarada antes da execução; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (o recálculo numpy pré-registrado, registrado com a sua falha); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs e os goldens do registro e de plataforma cruzada inalterados (aditividade); tests/field_units_global.rs (todo campo emitido descrito, sem isenção)

# text
seg-bfee8a9a8b64 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Superfícies de forma fechada (InternalConsistency): a depressão da esfera nua, uma cratera em um platô sobre a esfera com um observador no centro e fora dele, e um cone analítico contra a sua própria rasterização. No recorte real, um lançamento de raios em numpy independente (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; pré-registrado em tests/fixtures/lunar_terrain/PREREGISTRATION.md, registrado sozinho em edbb9b02 antes de o script existir) concorda em cinco locais: alturas dos locais a { "1.0e-11" } m e todas as { "1800" } elevações de horizonte a { "5.5e-10" } deg contra limiares de { "1e-6" }, contagens de raios truncados exatas; isto verifica a aritmética, não o terreno. Nenhuma figura publicada de horizonte polar ou de iluminação foi reproduzida: o recorte incorporado de { "1200" } m suaviza o relevo submétrico que os estudos publicados de iluminação resolvem, de modo que os horizontes do DEM são uma linha de visada MODELLED sobre um DEM real reamostrado, não um horizonte validado. O local da estação e a constelação permanecem ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-641b41572fd9 = lunar_terrain (sobre skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: a marcha do raio reproduz -acos(R / (R + a)) a { "1e-3" } deg em todo azimute; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: o mesmo cone amostrado em um ladrilho de latitude/longitude de { "0.005" } deg concorda com o cone analítico a { "0.25" } deg; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: uma cratera de fundo plano sobre a esfera, observador no centro e a { "4" } km e { "7" } km dele, contra a elevação da borda de forma fechada atan2((R + H) cos s - (R + a), (R + H) sin s) com s da equação esférica de cruzamento da borda, a { "0.01" } deg em todo azimute; rasterised_cone_matches_the_analytic_cone: um cone rasterizado em uma grade estereográfica polar de { "200" } m e lido pelo amostrador da grade concorda com o cone analítico a { "0.25" } deg; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos os tipos de cenário; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 mantém a sua contagem plana e as épocas que um horizonte custa são terrain_masked (a própria disponibilidade pode subir, porque um horizonte pode esconder um satélite que a estação não vê), e um horizonte de { "89" } deg na estação não deixa nada disponível; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: os fundos das crateras Shackleton e Haworth baixos, o maciço de Malapert alto, a imagem espelhada não; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: um ladrilho reamostrado a partir do recorte incorporado dá à estação o horizonte do recorte a { "0.22" } deg (limite { "0.5" } deg, fixado antes da execução), com o eco do ladrilho e as unidades, e dem_path com dem_tile_path recusado; the_export_site_is_masked_by_the_terrain: toda linha de exportação libera o terreno exatamente quando está visível e no horizonte do local ou acima dele em seu azimute, a geometria não se move, o CSV ganha a coluna apenas com terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs e os goldens do registro e de plataforma cruzada inalterados (aditividade)

# text
seg-f7719057f56b = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas e estatísticas dos próprios sorteios do modelo (InternalConsistency): a fórmula do DLL contra um cálculo à mão, a forma do DO-229, a diferença de linha de base zero de dois receptores, a correlação de lag 1 de Gauss-Markov. Não existe medição de multipercurso lunar nem de receptor com a qual comparar; os valores são ILLUSTRATIVE e nada aqui é uma afirmação sobre qualquer receptor real

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma amostral sqrt({ "2" }) a dentro de { "6" } %; station_multipath_is_gauss_markov: correlação de lag 1 exp(-dt / tau) dentro de { "0.01" }, variância unitária dentro de { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs e os goldens inalterados (aditividade)

# text
seg-3c6a533c15dc = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — O sigma de forma fechada do termo de crescimento e a verificação de propagação de primeira ordem (InternalConsistency). O adendo K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, pré-registrado sozinho em 59d88248): K5 falha em toda taxa, p95 3-D corrigido de { "369.8" } m, { "2315" } m e { "22797" } m contra um limiar de { "1.5" } m ({ "292.96" } m registrado sem crescimento), como declarado antes da execução. Nenhuma fonte pública dá uma taxa de crescimento lunar: ILLUSTRATIVE

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: o erro de enlace com crescimento ativado menos o com crescimento desativado tem sigma amostral taxa tau / sqrt({ "3" }) dentro de { "6" } % em { "1600" } sorteios; linear_growth_is_the_first_order_propagated_error: um erro de velocidade dv propagado com o integrador de dois corpos do repositório a partir da órbita do cenário move a posição por dv tau até { "1" } % a { "60" } s e { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorado, o adendo registrado)

# text
seg-f55331e7b5af = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A redução de instantâneo e os casos de forma fechada do solucionador (InternalConsistency). O adendo (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, pré-registrado sozinho em 001ca100) com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (configurações ILLUSTRATIVE; as fontes declaram um filtro, uma restrição de altura e três satélites, mas não as suas configurações): K1 a K5 falham e K6 passa, { "1" } de { "6" } como na execução registrada; o erro 3-D p95 corrigido de R300 cai de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não pontuado) e a cobertura permanece { "0" }. A suposição de independência da janela a favorece. Não é uma afirmação sobre qualquer sistema real

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: igual a lunar_dpnt::position_error_vector_from_range_errors a { "1e-8" } m, uma linha de altura frouxa não altera nada, uma apertada fixa o erro de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: toda figura a { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorado, o adendo registrado)

# text
seg-6613341c6bc0 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe partes modeladas, de modo que a capacidade permanece modelada — Referência: as afirmações numéricas de cinco fontes públicas registradas com URL, data de recuperação, SHA-256 e licença em tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; slides do IOAG Cislunar PNT Workshop { "2025" } e { "2026" }; UNOOSA ICG WG-B Lunar PNT, junho de { "2024" }), transcritas com referências de página em tests/fixtures/lunar_station_published/CLAIMS.md. Limiares, casos e entradas foram pré-registrados em tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisão { "2" }, 05bf9a19, registrada sozinha antes da execução). { "0.36" } primeira execução, uma constatação (permanece MODELLED): { "1" } de { "6" } limiares passa. A cobertura é { "0.00" } nos dois círculos contra >= { "0.95" }, e o erro 3-D p95 corrigido é { "280.6" } m ({ "300" } km), e { "293.0" } m com latência de { "600" } s, contra <= { "1.5" } m. O limiar decimétrico (K4) não poderia ser atingido com o ruído de código de { "0.30" } m das fontes, o que reflete um conflito entre as fontes e não um resultado do modelo. K6 passa (razão { "1.39" } contra <= { "1.5" }), mas, como razão entre duas figuras dominadas pela geometria, não é evidência sobre a descorrelação em nenhum dos sentidos. Causa: os elementos dos satélites não são públicos, e com os elementos ILLUSTRATIVE do repositório um usuário e a estação compartilham quatro satélites acima de { "5" } deg em apenas { "8.2" } % ({ "300" } km) e { "6.3" } % ({ "600" } km) das épocas, com geometria quase singular (p95 não corrigido de { "3.8" } km contra < { "10" } m das fontes). As simulações das fontes usaram um filtro, uma restrição de altura e três satélites em visibilidade comum, o que o tipo de cenário de instantâneo não modela. A comparação, portanto, nem confirma nem refuta o 'submétrico em todo o polo sul' publicado. Ela mostra que o resultado deste modelo depende de órbitas que não são publicadas. Não é uma afirmação sobre qualquer sistema real; sem afiliação a nenhuma agência nem endosso por ela

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (as figuras registradas contra os limiares registrados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorado, cerca de { "7" } s em release: reexecuta os seis casos registrados e afirma as figuras registradas)

# text
seg-f4648485be52 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna (InternalConsistency): a redução de ordem 2 para o caminho ADD v4.2 verificado pelo MAAST, rededução independente das probabilidades a priori e uma falha construída de dois satélites. Nenhuma execução de MAAST ou RTKLIB além de pares foi feita, portanto os conjuntos de hipóteses mais profundos e os níveis de proteção do RAIM de subconjuntos não são verificados externamente. araim_subset_raim compartilha as simplificações de araim_dual_raim (um sigma para integridade e exatidão, um relógio, a cauda normal simples): não é aderente à norma ADD

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, o risco não monitorado dentro de P_THRES, um subconjunto que remove três ou mais satélites monitorado, e mais de dez probabilidades a priori monitoradas rededuzidas de forma independente como P_no fault q^k a { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: nenhum alarme sem falha, e um viés de { "30" } m em dois satélites detectado com o par como o subconjunto de maior separação normalizada); tests/araim_reference_vectors.rs e tests/integrity_araim_stanford_oracle.rs inalterados (o caminho de ordem 2 é o verificado pelo MAAST)

# text
seg-a2b978f8bb5a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna (InternalConsistency): os níveis de proteção são os de snapshot_raim, que é validado contra o RTKLIB em sua própria linha, recalculados na mesma geometria; comportamento sem falha e com falha injetada. O céu é uma geometria predefinida representativa (não um almanaque datado), os resíduos são sintéticos e o sigma, os limites de alerta e as probabilidades são entradas declaradas; nada aqui é uma afirmação sobre a disponibilidade de um receptor real

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (despacho de clock)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: figuras de holdover inalteradas, { "111" } épocas negadas indisponíveis sem nível de proteção, recusado com execuções > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: o HPL e o VPL de toda época amostrada são exatamente iguais aos de um snapshot_raim de resíduo zero no mesmo céu predefinido, e a execução sem falha não levanta alarme; a_stated_bias_is_detected_while_it_lasts: um viés de { "60" } m alarma exatamente nas { "10" } épocas que cobre; every_integrity_field_has_a_unit); clock_integrity::tests; os goldens de clock inalterados

# text
seg-6a7d171f880f = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Um posto independente por forma escalonada por eliminação gaussiana com pivoteamento parcial confirma todo veredito de posto de seis estados — um algoritmo diferente que não compartilha código com a rota de autovalores/SVD sob teste. A matriz de transição de estados do CR3BP de { "6" }×{ "6" } que isto compõe traz a sua própria referência independente ReferenceImpl contra a integração variacional do SciPy, e as condições iniciais de halo/NRHO vêm de um corretor que reproduz a órbita publicada do Gateway no L2 sul { "9" }:{ "2" }. A perna existente do filtro de informação em raiz quadrada NÃO é contada explicitamente como corroboração: ela consome os mesmos jacobianos e se reduz à mesma matriz normal, de modo que é uma verificação de consistência entre duas máquinas numéricas, e o rótulo de extensão emitido diz isso. NÃO ancorada externamente, e ExternalDataset é portanto recusado em vez de tomado emprestado da linha da STM: os comprimentos de arco do limiar dependem eles próprios do projeto de constelação MODELLED, da grade de épocas e — mensuravelmente, em até { "40" }× — da tolerância de valores singulares. O { "2.09" } h planar publicado é reproduzido exatamente em rel_tol = { "1e-6" } e é ele próprio dependente da tolerância ({ "10.25" } h a { "1e-4" }, { "0.42" } h a { "1e-8" }), o que é uma propriedade do critério e não da órbita. Nenhum conjunto de dados público publica um limiar de observabilidade por comprimento de arco para uma constelação cislunar escolhida. RESULTADO MEASURED: o limiar espacial de seis estados é { "22.17" } h para a NRHO L2 e { "40.42" } h para o halo L2, e NÃO EXISTE para a família DRO planar sobre a qual a afirmação publicada foi derivada — posto { "4" } de { "6" } com defeito de datum { "2" } e dois autovalores exatamente zero, um defeito estrutural que nenhum comprimento de arco recupera

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests e observability_gramian::tests (o documento padrão fixado bit a bit por FNV-1a de seu JSON, resumo e SVG, com valores padrão explícitos afirmados como não alterando nada e as oito chaves de extensão afirmadas AUSENTES, de modo que a captura não possa ser regenerada em uma autocomparação; o bloco aditivo <c1/> excluído do congelamento por ser removido e recalculado o hash contra a constante fixada antes de ele existir, o que prova, em vez de presumir, que nada já lançado se moveu; invariância do posto sob um sigma homoscedástico afirmada em σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado como escalando exatamente de forma linear com σ a { "1e-6" } relativo; o espaço nulo da DRO afirmado como sendo exatamente os eixos de coordenadas z e ż com as duas causas separadas — uma linha de distância entre espaçonaves coplanares tem û_z = { "0" }, e o bloco fora do plano do CR3BP se desacopla exatamente em z = { "0" }; jacobianos espaciais contra diferenças finitas centrais e contra o observável independente de taxa de variação da distância 3-D do crate; famílias fora do plano recusadas no modo planar)

# text
seg-d1770a478184 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Três rotas independentes, nenhuma delas uma figura publicada de exatidão de predição. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única maneira de exercitar a maquinaria periódica, já que nenhuma série publicada no repositório é longa o bastante para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados de forma fechada de livro-texto, álgebra diferente da resolução matricial sob teste, em linhas reais. ({ "3" }) As linhas genuínas arquivadas de predição do Bulletin A que o produto real de { "2026" } publica, comparadas por antecedência como uma estatística de CONCORDÂNCIA e explicitamente não como um erro: { "0.256" } ms a { "1" } dia, { "0.695" } ms a { "2" } dias, { "1.252" } ms a { "3" } dias, derivando para { "3.885" } ms a { "9" } dias. Portanto esta é a CLASSE do Bulletin A, próxima em curta antecedência, e não o Bulletin A. Os resíduos previsto-versus-final são grandezas medidas reais sobre linhas reais do IERS, mas a sua magnitude é verificada apenas contra a DIREÇÃO da comparação, nunca contra um número de exatidão publicado pelo IERS — ler um produto real é proveniência, não uma referência independente. MEASURED: no dia { "1" } o preditor operacional dá { "3.78" } m de erro no referencial lunar contra { "11.39" } m da persistência ({ "3.01" }×), no dia { "2" } { "10.23" } m contra { "21.72" } m ({ "2.12" }×), no dia { "3" } { "20.33" } m contra { "30.57" } m ({ "1.50" }×) — e é PIOR além de três dias ({ "0.87" }× a { "5" } dias, { "0.43" }× a { "10" }), o que o relatório emite em vez de mostrar apenas os horizontes que o favorecem. NÃO reproduzidos: o filtro autorregressivo de resíduos e a redução tabulada de marés zonais, a janela operacional de 365 dias é inalcançável com os dados publicados no repositório, e NENHUMA versão anterior arquivada da série existe neste repositório — de modo que a tabela de versões arquivadas não relata nenhuma linha em vez de pontuar uma sintetizada. { "0.30" } comparação externa, uma constatação (permanece MODELLED): pontuado contra os mesmos finais em { "178" } emissões arquivadas do Bulletin A com a janela padrão de 15 dias do crate, o MAE de UT1 do preditor é de 2.4x a 12.6x o do Bulletin A em { "1" } a { "10" } dias (limiar 1.5x) e { "5.32" } ms em { "10" } dias, fora da faixa de { "0.36" } a { "3.13" } ms do 2º EOP PCC; o polo é de 1.5x a 1.85x o do Bulletin A (dentro de 1.5x apenas em { "6" } e { "7" } dias); { "19" } de { "21" } condições pré-registradas falham. Correção à rota ({ "3" }): as linhas do produto de { "2026" } com que foi comparada trazem o sinalizador I (medido) do IERS, e não P, de modo que essas figuras de concordância são contra valores rápidos medidos, não contra predições do Bulletin A. { "0.30" } rodada { "2" }, um preditor de mínimos quadrados mais autorregressivo com as marés zonais removidas analiticamente, contra { "178" } emissões arquivadas do Bulletin A no limiar da rodada 1 (pré-registrada c93605b4), uma constatação (permanece MODELLED): { "12" } de { "21" } condições valem; o MAE de UT1 é de { "1.73" } a 2.11x o do Bulletin A em { "2" } a { "10" } dias (limiar 1.5x), enquanto o polo fica dentro de 1.27x em toda antecedência. { "0.30" } revisão: com a entrada offline agora classificada pelo sinalizador do IERS, as figuras de concordância da rota ({ "3" }) são contra predições reais do Bulletin A (0.256/0.695/1.252/3.885 ms em 1/2/3/9 dias contra linhas rápidas -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests e tests/operational_eop_predictor_reference.rs (recuperação de coeficientes de sinal analítico a { "1e-9" } em uma janela de 365 dias; um ajuste de viés mais taxa igual à inclinação e ao intercepto de mínimos quadrados ordinários de forma fechada a { "1e-12" } em linhas reais; DOIS detectores de antecipação que destroem as colunas rápidas de UT1 e de polo de toda linha após a época de emissão — deixando intactos os finais do Bulletin B — e exigem saída idêntica bit a bit, verificados por mutação a deixar { "10" } testes vermelhos quando a barreira do ajuste é afrouxada em exatamente um dia; uma lista de épocas reconstruída de forma independente; o bloco do Bulletin B de um alvo apagado e a época mostrada saindo da tabela; admissão de termos verificada em janelas de { "6" }, { "15" }, { "150" } e 365 dias; contagens de linhas monótonas; e uma captura congelada anterior à mudança do relatório padrão afirmada campo a campo sem tolerância, que afirma adicionalmente que a captura não contém as novas chaves, de modo que não possa ser regenerada silenciosamente em uma autocomparação); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (a extensão opcional EopSeries::with_ls_ar_prediction além da última linha: respostas dentro da tabela idênticas bit a bit, linhas de previsão iguais a ls_ar_predict, argumentos de referencial além da tabela seguem a previsão em vez de saturar; consistência interna)

# text
seg-546d8034c488 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Identidades de forma fechada e uma rota independente no repositório, sem referência independente externa alegada. O projeto de Helmert — a única derivada nova no módulo — é rededuzido por diferença finita central de lunar_frame_realise::apply_helmert, um caminho que não compartilha nenhuma expressão com a forma analítica. A acumulação que ele compõe é a do lunar-vlbi-fim, cujo jacobiano é diferenciado por diferenças finitas contra lunar_vlbi::vlbi_delay_s ali, e cujo kernel de álgebra linear é ancorado externamente, em separado, contra o numpy em tests/fim_observability_reference.rs — esta linha não toma emprestado nenhum dos dois status. A referência independente de física é estrutural e não numérica: uma derivada parcial de atraso do farol é a DIFERENÇA de campo próximo de dois vetores unitários quase paralelos, de modo que a direção de translação pior determinada DEVE ser a direção fixa ao corpo até a Terra, e o teste afirma a resposta calculada contra a direção medida separadamente. MEASURED: sigma de translação derivado da campanha de { "6.3975" } m contra o erro de recuperação de { "0.3125" } m do cenário de transformação injetada ({ "20.5" }× mais apertado), enquanto rotação e escala vão no sentido OPOSTO, { "2.32" }× e { "13.5" }× mais frouxas — o caminho injetado presume um sigma isotrópico único e portanto espalha o seu erro uniformemente por sete parâmetros, o que o observável de atraso não faz. Posto 7/7 mas condição { "3.8e5" }, com uma direção { "99.57" } % pura de translação em direção à Terra e quarenta vezes pior que qualquer outra. O QUE ESTA LINHA NÃO AFIRMA: que a figura da campanha esteja certa em termos absolutos. Ela estabelece que a figura agora DERIVA de um cronograma, de uma geometria e de um modelo de erro, e não de uma resposta plantada. Permanece ReferenceImpl/MODELLED: não existe par publicado de campanha de VLBI lunar mais covariância de datum, a rede de estações e o sigma de atraso são entradas ILLUSTRATIVE (o catálogo de faróis tem fonte, a campanha não), as observações são tratadas como independentes enquanto a troposfera e o relógio de uma sessão real são correlacionados entre varreduras próximas, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS. { "0.30" } comparação externa, uma constatação (permanece MODELLED): com toda linha do jacobiano do farol reconstruída a partir de tempos de luz do NAIF SPICE (DE440, ITRF93, MOON_ME; pré-registrada { "50863551" }), o cronograma, o posto de Helmert, os sigmas de datum (dentro de { "4.7e-3" }), a condição, a direção mais fraca ({ "0.07" } deg), a varredura de libração e a ordenação de arcos concordam em seis cenários dentro dos { "1" } % / { "0.2" } / { "0.05" } deg pré-registrados. O NumPy sobre o jacobiano publicado do motor concorda a { "3e-14" } onde as estações são fixas. Com as estações estimadas, difere em { "6.8e-6" } contra um { "1e-9" } pré-registrado, cuja premissa do número de condição estava errada (condição de Helmert { "2.1e8" }; rotas independentes de NumPy discordam em { "3e-6" }; não se exclui uma contribuição da alternativa de pseudoinversa de { "1e-9" } do motor), de modo que a linha não é promovida com base nesse pré-registro. { "0.36" } novo registro com um limiar escalado pela condição (pré-registrado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir do condicionamento da informação conjunta e de sua redução de Helmert), uma constatação (permanece MODELLED, NOT MET): o passo { "0" } descarta FORA a alternativa de pseudoinversa para a diferença de { "6.8e-6" } (nenhuma matriz a montante da matriz de Helmert recorre à alternativa nos seis cenários originais, margem mais apertada de um fator { "2.6" }), a perna SPICE ainda vale nos seis, e o NumPy concorda dentro do limiar em seis de oito cenários (padrão, os dois arcos, o sigma de atraso 3x, o defeito colinear e a nova execução de estações fixas em 2026-12-01; pior { "0.13" } do seu limiar). Falha em stations_estimated (sigmas de datum até { "6.8e-6" }, condição { "9.1e-6" }, norma com independência descartada { "3.5e-6" }, contra t = { "5.9e-7" }), e na data nova o farol do polo sul não tem observação, de modo que a informação do farol tem posto deficiente (alternativa de pseudoinversa a montante da matriz de Helmert nos dois cenários novos) e a referência independente NumPy inalterada não consegue avaliar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-c77bd56a0619 = lunar_frame_campaign (compondo lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } testes de biblioteca: o projeto de Helmert contra uma diferença finita central de lunar_frame_realise::apply_helmert — o módulo para o qual o datum existe, que não calcula nenhuma derivada e, por isso, fixa a convenção de sinal de [p]ₓ — com todas as { "84" } entradas do projeto concordando a < { "1e-6" }; uma translação pura da rede lida de volta como translação pura com vazamento < { "1e-6" } para os outros seis parâmetros; o sigma do datum exatamente linear no sigma do atraso até { "1e-8" } numa variação de { "3" }× em todos os sete parâmetros; um arco de { "16" } h medido como pior e um arco de { "48" } h medido como melhor do que { "24" } h, com a varredura de libração emitida ordenada da mesma forma; o pior eixo de translação afirmado como o eixo dominante da direção fixa ao corpo, medida separadamente, até a Terra e pior que os demais por > { "5" }×, uma referência independente de física sobre a qual nada no solucionador foi informado; três faróis colineares produzindo um defeito com todos os sigmas do datum NULL e as direções nulas emitidas na base de sete parâmetros; offblock_fraction e a correlação entre faróis exatamente { "0.0" } com as estações fixas e ambos > { "0" } com elas estimadas; as cifras de transformação injetada do bloco de comparação mostradas iguais a uma execução independente desse cenário até { "1e-14" } relativo, em vez de transcritas; uma salvaguarda de que nenhum datum injetado/recuperado aparece em lugar algum do documento; a emissão da realização do referencial lunar fixada byte a byte por FNV-1a-64 sobre json‖summary‖svg para três formatos de entrada, com impressão digital registrada antes de o trabalho começar); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (condicionado; o estrito lunar_frame_campaign_matches_spice_geometry_and_numpy continua ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (achado; decisão do fundador de 2026-10-02, opção A: esta linha permanece MODELLED e não toma emprestado o status da linha separada; contra uma referência independente mpmath de 50 dígitos, pré-registrada 804662d5, os sigmas do datum do motor com estações estimadas estão dentro do seu limite de erro retroativo a priori, { "9.7e-6" } de diferença em 2024-01-01, e o limiar de { "1e-9" } estava abaixo do que qualquer rota de precisão dupla alcança, sendo a melhor, uma projeção QR do NumPy, { "5.5e-9" } de diferença; a evidência respalda a linha separada 'Lunar frame datum covariance with the stations estimated, against 50-digit extended precision'); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fixado); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fixado)

# text
seg-114007ecc9fe = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um estimador separado nesta base de código, com algoritmo diferente e caminho de código disjunto: Gauss-Newton ponderado não linear com derivadas parciais por diferenças finitas, cujo veredito é lido como um erro de recuperação de estado medido, em km e mm/s. Não tem nenhuma expressão em comum com a rota de posto e covariância do Gramiano, e a separação é IMPOSTA por uma salvaguarda sobre o texto-fonte, e não apenas afirmada. MEASURED na grade DRO plana publicada: o critério de ESTIMABILIDADE é CORROBORATED — o limite medido por Monte Carlo é { "5.739130" } h contra o formal { "5.739130" } h (razão { "1.0000" }), e o RMS medido reproduz o 1σ formal ao longo de { "21" } comprimentos de arco com uma razão de média geométrica de { "0.9804" }. O critério de POSTO NÃO é corroborado como limite de recuperabilidade: o estimador recupera a partir de { "0.782609" } h contra { "2.086957" } h do Gramiano, razão { "0.375" }, e em { "1.826087" } h — o último prefixo que a leitura de posto avalia em { "3" } de { "4" } — recupera até { "1.96e-5" } do deslocamento a priori. O limite de recuperação permanece imóvel ao longo de três décadas do seu próprio limite, enquanto o limiar de posto varia de 'nunca' a { "0.782609" } h ao longo de quatro décadas de rel_tol, e os dois coincidem exatamente em rel_tol = { "1e-8" }. Essa variação foi registrada inicialmente como chegando a { "0.260870" } h; essa cifra era um ARTEFATO, produzido por uma leitura de posto que contou { "4" } direções a partir de { "2" } linhas de medição abaixo do piso de ruído de f64, e é corrigida aqui em vez de deixada de pé. A leitura de posto agora é limitada pela desigualdade de Sylvester, com o motivo emitido, e a variação corrigida satura exatamente no arco em que o estimador independente recupera, o que reforça a validação cruzada desta linha em vez de enfraquecê-la: o { "1e-6" } publicado é uma CONVENÇÃO conservadora de valor singular, e não uma afirmação sobre recuperabilidade. O mesmo padrão no espaço: NRHO { "9.290323" } h contra { "21.677419" } h, halo { "22.978723" } h contra { "39.829787" } h, com a estimabilidade concordando exatamente em ambos. O DRO plano de seis estados não recupera em nenhum arco, reproduzindo de forma independente o defeito estrutural de datum dessa família a partir de um estimador que nada sabia sobre ele. NÃO ancorado externamente — a dinâmica e as condições iniciais são compartilhadas com a análise sob teste e nenhum conjunto de dados público publica tal limiar —, portanto ExternalDataset é recusado

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests e tests/cislunar_arc_recovery_reference.rs (ambos os limites e suas razões fixados na grade publicada; a curva de erro medida comparada à linha de covariância formal linha a linha, com um limite de fator dois por linha e um limite de média geométrica; um CONTROLE NEGATIVO — o DRO plano de seis estados — afirmando que o critério PODE falhar e que o estimador não regularizado diverge além de { "1e6" } km em vez de devolver um erro pequeno plausível; invariância de parametrização afirmada em cada prefixo a { "1e-3" } relativo; uma salvaguarda sobre o texto-fonte que remove comentários, literais de cadeia e o módulo de teste e depois falha diante de qualquer menção ao Jacobiano, à STM, ao posto por SVD ou à maquinaria SRIF, verificada por mutação mediante a injeção de uma chamada proibida; uma verificação apenas de teste de que as diferenças finitas são iguais às linhas analíticas, de modo que a linearização é sabidamente boa enquanto a rota analítica permanece ausente do estimador; determinismo afirmado byte a byte; o documento cislunar-observability publicado fixado por conjunto de chaves, impressão digital canônica e linha de resumo)

# text
seg-03751f09c5c9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A GEOMETRIA é externa e com hash: três fixtures cujos números vêm somente de documentos obtidos com URL, data de obtenção e SHA-256, regeneráveis por geradores versionados que verificam o hash de origem e ABORTAM em vez de emitir um número — a constelação de referência da demonstração de interoperabilidade da LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), os estudos de caso da LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) e uma efeméride genuína de espaçonaves em voo para LRO, Danuri, Chandrayaan-2 e CAPSTONE, avaliada a partir dos próprios kernels reconstruídos do JPL via Horizons. NÃO existe publicamente nenhum kernel de constelação de navegação lunar — Moonlight/LCNS, LCRNS e LNSS não estão em voo e o NAIF não publica nada para elas — e nenhum foi inventado. O requisito de σ_URE DERIVED NÃO tem referência independente externa (ninguém publica a exatidão de medição de distância que um HPL lunar de { "50" } m exige neste volume de serviço); por isso é verificado em relação à sua própria identidade algébrica e, de forma independente, reexecutando toda a varredura no requisito calculado e confirmando que a disponibilidade muda ali. MEASURED: o projeto publicado de 8 satélites precisa de σ_URE { "2.9044" } m com cobertura de { "100" } % contra { "0.3591" } m a { "37.85" } % da constelação ilustrativa — uma revisão de { "8.09" }× de um número publicado sob a regra de programa R4. A conclusão qualitativa se mantém (o { "30" } m da classe LNIS ainda não fecha um HPL polar sul de { "50" } m), mas a insuficiência foi superestimada oito vezes. A demonstração LANS de 5 satélites rende ZERO amostras de nível de proteção — cinco satélites não conseguem dar os seis em vista de que um conjunto de hipóteses de falha única precisa — e o campo de requisito é AUSENTE em vez de fabricado; o mesmo vale para as quatro espaçonaves reais com { "0" } % de cobertura. InternalConsistency é o tipo honesto: os dados de ENTRADA são externos e com hash, mas a grandeza de que esta linha trata é validada apenas contra si mesma. { "0.30" } comparação externa, um achado (permanece MODELLED): contra as estatísticas dos estudos de caso da LNCSS de navi.613 em { "346" } pontos de grade, { "4" } de { "12" } estatísticas de disponibilidade ficam fora dos { "2" } pontos percentuais pré-registrados (caso A: -4.0, +{ "22.5" } e -3.6 pp; caso B: -12.1 pp). Causas prováveis: elementos lidos no referencial errado, Kepler de dois corpos ao longo de { "15" } dias contra o modelo de forças não declarado do artigo e uma grade não reproduzível a partir do texto. A metade do PDOP não pôde ser avaliada (a LANS não imprime nenhuma estatística numérica); o teste de comparação está versionado como ignorado. { "0.30" } rodada { "2" }, um achado (permanece MODELLED): contra uma referência independente Orekit { "12.2" } / Hipparchus { "3.1" } que calcula o relatório inteiro (propagação Orekit, visibilidade e DOP por DOPComputer, níveis de proteção MHSS compostos por Hipparchus, o requisito resolvido por amostra; pré-registrada d3ce97b2) em todas as cinco geometrias obtidas e duas grades, { "155" } de { "160" } valores concordam dentro dos limiares pré-registrados ({ "2" } pp, { "5" } %, { "1" } %), incluindo o requisito sigma_URE para LNCSS A e C ({ "3.879072208" } m em ambos os lados para o caso A) e o requisito ausente para a LANS e os orbitadores. LNCSS B na grade densa falha nas suas estatísticas de pior amostra (sigma_required { "0.000923" } contra { "0.001511" } m, hpl_max { "1.63e6" } contra { "0.99e6" } m), onde geometrias quase singulares (PDOP em torno de { "1e6" }) amplificam a concordância de posição em nível de metro; seu requisito p95 concorda ({ "1.6343" } contra { "1.6357" } m). O requisito de pior amostra é mal posto em geometria degenerada. Contra navi.613: { "4" } de { "12" } ainda fora de { "2" } pp (fixado)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análise de formato e de referencial; interpolação de Lagrange exata nos nós e numa trajetória linear fora dos nós; elementos ICRF recebem a redução IAU { "2015" } e são idênticos byte a byte a uma aplicação explícita de icrf_to_iau_moon; anomalia verdadeira↔média com ida e volta contra uma solução direta de Kepler; arquivos malformados recusados com o motivo indicado). lunar_service::tests (com <c1/> não definido, o conjunto de chaves do relatório e o SHA-256 são fixados; a linha kepleriana é igual à execução kepleriana autônoma campo a campo; a identidade σ_required · HPL_max / σ_URE = AL, depois uma nova execução DE PONTA A PONTA no requisito calculado atingindo { "100" } % de disponibilidade de nível de proteção e uma nova execução { "1" } % acima dele não a atingindo; todo campo numérico emitido dos dois novos blocos percorrido a partir do JSON produzido quanto a uma unidade e a uma classe de proveniência; as fixtures versionadas conferidas com suas tabelas de origem satélite a satélite; um horizonte além do fim de uma tabela recusado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-1e414b2a33b2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — O próprio documento emitido: toda folha numérica deve resolver para uma entrada no bloco de unidades do próprio documento. Não existe registro externo de unidades contra o qual conferir uma unidade DECLARADA, de modo que uma unidade declarada é uma afirmação revista e não verificada — o portão verifica COMPLETUDE e BOA FORMAÇÃO, não a verdade, e 'validado' estaria errado porque nada externo confirma que <c1/> é a unidade correta para um campo chamado <c2/>. Uma verificação cruzada independente por sufixo de nome foi executada sobre os { "1,434" } campos descritos NAQUELE MOMENTO: dos { "691" } que carregam um sufixo indicativo de unidade, { "40" } discordam da unidade declarada e todos os { "40" } são explicados (sufixos por segundo, mínimos, segundos de abertura, newton-metros contra um sufixo que parece nanômetro), de modo que nenhuma unidade errada veio à tona. Essa verificação cruzada não foi reexecutada desde então, e a cobertura cresceu além dela — a cifra é deixada no que foi realmente medido, em vez de reafirmada no total atual. No momento dessa mudança ({ "0.27.0" }), a cobertura passou de { "7" } de { "56" } tipos de cenário para { "60" } de { "61" }, e de { "389" } de { "1354" } campos para { "1,742" } de { "1,744" } (docs/field-units-schema.json, que uma verificação de obsolescência mantém atualizado). NENHUM tipo de cenário permanece sem cobertura (teto { "0" }, FUT-28, { "0.36" }): o último era <c3/>, duas de cujas colunas são indexadas pelo chamador, de modo que suas unidades são dados; agora são descritas como <c4/> e a unidade de cada posição é lida da própria tabela de unidades do pacote VARRIDO para <c5/> e <c6/> (ou tomada da <c7/> declarada do eixo, que deve concordar com a do pacote quando ambas existem; nula quando nenhuma existe, declarada em vez de adivinhada). <c8/> era o penúltimo e saiu da lista quando seu documento publicado ganhou um bloco de unidades: o pino de aditividade que havia nomeado <c9/> como chave proibida agora PROVA que a adição é aditiva — retire o bloco de volta e o documento ainda gera hash para as duas constantes congeladas antes de ele existir, de modo que um valor publicado que se movesse por baixo da adição ainda falharia. O trabalho também trouxe à tona doze defeitos de unidade ou de documentação em código existente, relatados em vez de corrigidos sob R1

# text
seg-34bff3218a01 = tests/field_units_global.rs (todos os { "61" } tipos de cenário registrados executados, um formato de documento cada: toda folha numérica deve resolver para uma entrada no bloco de unidades do próprio documento; uma entrada malformada conta como ausente para TODO tipo de cenário, isento ou não, de modo que um marcador de posição não compra cobertura; a lista de isenção não pode exceder seu teto fixado, um tipo de cenário listado que se revele totalmente coberto FAZ o portão FALHAR para que a lista não possa ser inflada, e um tipo de cenário registrado ausente da tabela do executor faz o portão falhar para que um novo pacote não possa entrar sem ser examinado — o que aconteceu, apanhando os dois tipos de cenário adicionados depois que este trabalho começou; uma catraca de mão única sobre o passivo de descrito-mas-indefinido; e uma verificação de obsolescência do documento de esquema versionado); field_schema::tests

# text
seg-8efc76b4ee1d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Apenas consistência interna: cada sítio adicionado é um ponto distinto e uma medição de distância a laser ou um atraso de VLBI de estação fixa toca um ponto, de modo que sua informação A_p^T M_p A_p é semidefinida positiva e se soma; o teste verifica a diferença de Fisher e toda variância contra isso. O resultado de cinco arranjos é a linha de dados reais existente e permanece inalterado. O refletor adicionado reutiliza épocas programadas para os cinco arranjos existentes, um cronograma ILLUSTRATIVE, e a rede, o cronograma e o sigma de atraso do farol adicionado são as entradas ILLUSTRATIVE da campanha de referencial lunar; o sítio é uma posição polar sul ILLUSTRATIVE. Um sítio polar sul vê a Terra baixa no horizonte ou nem sequer a vê, o que os testes de ângulo de visada existentes expressam; nenhum dos sítios é medido continuamente. As cifras são limites de Cramer-Rao para um conjunto reduzido de parâmetros, não um datum resolvido e não uma afirmação sobre nenhuma estação real

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for e solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: listas vazias e o exemplo de linha de base dão o relatório e o resumo padrão byte a byte; an_added_site_never_increases_any_variance: o menor autovalor de H_after - H_before é não negativo até { "1e-9" } do maior, toda razão de sigma depois/antes é no máximo um, e ambos os sítios adicionados são observados; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml e scenarios/lunar-station-geodesy-with-station.toml (mesmo cronograma arquivado e mesmo bloco de campanha VLBI)

# text
seg-cc6113ce33c0 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Forma fechada: cada salvaguarda é executada sobre um trecho fixo sabidamente defeituoso que deve disparar e um trecho fixo sabidamente correto que deve permanecer em silêncio, ambos constantes literais que o detector não pode influenciar. Os dois trechos defeituosos são os defeitos F22 e F25 na sua forma original. Esta é uma referência INTERNA e a linha é MODELLED em conformidade: prova que as salvaguardas distinguem o defeito da sua correção, não que as classes que descrevem sejam exaustivas. Seus pontos cegos declarados — estado compartilhado que não é um caminho, um pino mantido numa constante nomeada curta, uma condição de corrida rara que três execuções não amostram e um recibo que qualquer pessoa capaz de escrever o arquivo pode forjar — estão escritos na documentação do módulo de tests/source_guards.rs e no cabeçalho de cada script, em vez de deixados para serem descobertos.

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testes: ambas as salvaguardas sobre toda a árvore de código-fonte, mais fixtures de mutação que avaliam cada salvaguarda nos dois sentidos — o padrão F22 relatado nos dois caminhos em colisão, a correção de sequência atômica entregue aceita, uma meia correção relatada exatamente no caminho que perdeu seu componente único, um identificador de arquivo temporário e um diretório único herdado aceitos, um relógio de parede rejeitado; um pino não declarado relatado, um declarado aceito, um escopo sem exclusão rejeitado, uma declaração no comentário de documentação do teste envolvente aceita e demonstrado que não vaza para o teste seguinte; e cada grafia de pino — hexadecimal, decimal, cadeia de digest, comprimento em bytes, contagem de bytes nomeada, arquivo golden — vista, enquanto constantes de algoritmo, sementes de RNG e pequenas verificações de cardinalidade não são)

# text
seg-b99e60173863 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Testes de propriedade (monotonicidade, sem queda na transferência) + lint de expoentes contra holdover::coast_phase_variance

# text
seg-416def055790 = integrity::composed_pl::tests (monótono, piso P0, K(IR/2), expoentes, semicontinuidade inferior)

# text
seg-5b20d21462cb = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidade de forma fechada do envelope quase certo √(2Dt·lnln t) + verificação de dominância do HPL; costura de impossibilidade de Baweja arXiv:{ "2606.24210" }

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergência, limiar, dominância do aperto por IR)

# text
seg-b286777831de = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Reprodução independente em numpy + stdlib-statistics da forma fechada do sobrelimite (InternalConsistency). A série BIPM Circular-T [UTC-UTC(USNO)] é uma entrada apenas CITADA — é a MESMA série já validada para a linha de cobertura de holdover R4 e NÃO é revalidada aqui; reproduzir seus valores não prova nada sobre R2. A cauda profunda de integridade é modelada. { "0.30" } comparação externa, um achado (permanece MODELLED): nos arquivos UTC-UTC(k) por laboratório do BIPM ({ "102" } laboratórios, { "105 024" } linhas com incertezas publicadas), o sobrelimite b = { "2.576" } u na cauda de { "1e-2" } é excedido por { "50.8" } % das linhas (Clopper-Pearson de { "95" } %: { "50.4" } a { "51.1" } %) e em mais de { "1" } % em { "101" } de { "102" } laboratórios. A incerteza publicada u é a incerteza da determinação de UTC-UTC(k) pelo BIPM, e não um limite para o deslocamento, que rotineiramente chega a muitas vezes u; o sobrelimite como especificado não limita o viés de rastreabilidade real de UTC(k). { "0.30" } rodada { "2" }, um sobrelimite dos deslocamentos UTC-UTC(k) realizados, treinado com dados da Circular T do BIPM de 2015-2022 e testado em 2023-2026 (pré-registrado ca0921a4, excedência agrupada de no máximo { "1e-2" }), um achado (permanece MODELLED): a excedência agrupada é { "0.0333" } ({ "694" } de { "20 826" } linhas em { "82" } laboratórios; { "0.0127" } sem as { "430" } linhas que, por regra, não têm limite). D9 rodada { "3" }, um limite hierárquico agrupado de envelhecimento (utck_bound), pré-registrado fb475550 e avaliado de forma prospectiva em edições da Circular T a partir de { "465" }: ainda não executado (a edição { "465" } foi publicada em 2026-10-12 com cerca de { "285" } valores de teste; a regra pré-registrada de 1000 valores exige edições até cerca de { "468" }, e a execução precisa dos arquivos por laboratório arquivados de 2026-09-30, pois o BIPM reescreveu desde então { "87" } dos { "113" })

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionado a dados: é ignorado com uma mensagem quando a série do BIPM está ausente); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 rodada { "3" }, prospectivo, ainda não executado: a Circular T { "465" } apareceu em 2026-10-12, e a regra pré-registrada de 1000 valores exige edições até cerca de { "468" })

# text
seg-98b92da9ce83 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Reprodução independente em numpy da covariância cruzada e da desigualdade de viés fundido correlacionado versus independente (InternalConsistency). Conjunto de fontes representativo; cenário modelado.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Reprodução independente em numpy da estatística + teste de propriedade de que uma injeção de modo comum a infla (InternalConsistency). Cenário modelado. { "0.30" } rodada { "2" } (pré-registrada f9aa360d), bloqueada (permanece MODELLED): o gesv do LAPACK no numpy { "2.3.5" } reproduz o valor da estatística em { "261" } casos versionados (dentro de { "3.5e-15" } com bom condicionamento, { "1.2e-9" } com condição até { "6.1e7" }); a lei nula qui-quadrado({ "1" }) é um teorema citado e as separações pareadas planas são uma identidade sem saída do motor para comparar, de modo que o escopo aguarda uma decisão do responsável

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Estrutura geométrica reproduzida pelo motor mais a identidade fechada do complemento de Schur 2x2; consistente na ESTRUTURA com Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cujas magnitudes relatadas NÃO são reproduzidas aqui. A classificação é estrutural; as magnitudes de correlação/CRLB sob geometria real são MODELLED (coordenadas e orientação dos refletores mantidas fixas). { "0.30" } comparação externa, um achado (permanece MODELLED): contra Sosnica et al. { "2025" }, a correlação origem-escala de Fisher de distância (-0.993 / -0.988) está a { "0.05" } do -0.97 publicado, mas na geometria própria de cinco refletores do artigo a correlação de Helmert de 7 parâmetros com pesos iguais é -0.78 (o valor publicado depende de erros por refletor que o artigo não imprime), e o CRLB da origem ({ "0.6" } a { "1.2" } mm com ruído de distância de { "3" } mm) está { "96" } a { "98" } % abaixo dos { "3.07" } cm do artigo, contra uma tolerância de { "20" } %. Magnitudes não reproduzidas

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Verificações cruzadas analítico versus diferenças finitas das derivadas parciais de cada técnica (internas); a DIREÇÃO da melhoria é um fato geométrico. As posições dos faróis, os cronogramas e o ruído são MODELLED/representativos (ver tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (derivadas parciais analíticas de LLR/VLBI/orbitador versus diferenças finitas); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverso versus radial via crlb_diag)

# text
seg-b5169f1f17d9 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — O cálculo é verificado internamente: toda derivada parcial analítica contra uma diferença finita, e o caso de datum zero contra a distância nominal. O CATÁLOGO é verificado externamente e de forma independente - as coordenadas de eixos principais DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) são conferidas com a Tabela { "6" } do memorando de coordenadas de superfície DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído por máquina de um PDF com SHA-256 verificado por tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) e concordam a { "1.12" } m, enquanto a realização de Terra média dos mesmos cinco arranjos difere em { "672" } a { "871" } m. A ESTRUTURA DE DEGENERESCÊNCIA é verificada contra um resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que relata, para o referencial lunar de eixos principais, um coeficiente de correlação entre X do lunocentro e escala de r = -0.97, e que o LLR não alcança o centro de massa real da Lua com exatidão melhor que { "12" } cm por causa dessa correlação. Este módulo recupera a mesma estrutura (|corr(t_x, scale)| entre { "0.9" } e { "0.9999" }, defeito de datum <= { "1" }) a partir de um projeto de Fisher só com LLR. A corroboração se dá entre efemérides, não é uma ida e volta: o artigo combina INPOP21a, DE430 e EPM2021, enquanto este módulo é conduzido pela libração DE440. O que NÃO é reproduzido é a magnitude - a correlação aqui é cerca de -0.988 contra -0.97 deles, e o CRLB de 4 parâmetros é submilimétrico contra o piso alcançado de { "12" } cm deles, porque a orientação e as coordenadas dos refletores são mantidas fixas aqui e resolvidas lá. Apenas geometria e estrutura de degenerescência; nenhuma afirmação de exatidão sobre um datum resolvido. { "0.30" } comparação externa: as partes de distância medida deste módulo (reflectors(), stations_itrf(), a colocação PA DE440 e o tempo de luz baricêntrico llr_bcrs_one_way_m) são validadas na sua própria linha, modelo de distância medida de LLR, contra { "192" } pontos normais do ILRS (RMS { "2.81" } m contra { "10" } m). Esta linha permanece MODELLED porque a comparação medida não exercita o restante da sua afirmação. O catálogo de estações geodésicas stations() arredonda APOLLO para { "0.001" } grau; com um tempo de luz geocêntrico ele dá { "22.7" } m nos mesmos pontos (teste reflector_ranges_against_ilrs_normal_points; { "96" } m com a interpolação de orientação elemento a elemento anterior). As derivadas parciais analíticas de distância e o Fisher só com LLR são calculados por llr_range_m e reflector_inertial com a série lunar analítica (ephem::moon_position, cerca de { "0.3" } grau do GCRS) e sem tempo de luz

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Fisher marginal por complemento de Schur da matriz de informação acoplada, em álgebra linear de forma fechada, verificado contra os dois regimes-limite que ele prevê. A equivalência de { "1" } m a { "3.336" } ns é a definição do metro por meio de c e não é um resultado empírico. As redes de observação são geometria modelada representativa, de modo que a lei de projeto é uma afirmação sobre a geometria que lhe é apresentada e não carrega nenhuma afirmação sobre qualquer rede lunar em operação.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A aditividade da informação de Fisher entre medições independentes é uma propriedade de forma fechada, verificada aqui contra uma soma elemento a elemento escrita de forma independente e contra a invariância de ordem e a monotonicidade que dela decorrem. NOTA SOBRE A EVIDÊNCIA: o combinador antes não tinha teste algum, e o único teste do módulo somava as duas matrizes de informação em linha em vez de chamá-lo, de modo que um combinador defeituoso teria deixado o módulo verde; o teste agora passa por combine e falha quando ele é mutado. Todas as posições de faróis, a geometria do orbitador, as precisões por técnica e os custos relativos são escolhas representativas e não valores de missão (ver tests/fixtures/llr_geometry/NOTICE.md), de modo que toda métrica de degenerescência e toda cifra de CRLB alcançadas por este menu herdam o status modelado de lunar_identifiability::decompose.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - a seleção vazia dá a matriz zero, uma seleção única é a identidade, um par é igual a uma soma elemento a elemento escrita de forma independente, e o resultado é invariante à ordem de seleção; adding_a_block_never_reduces_the_degeneracy_metric - monotonicidade sob informação adicionada; radial_diversity_beats_transverse_for_breaking_the_degeneracy - o bloco do orbitador do lado oculto eleva a métrica de degenerescência mais que o bloco VLBI transverso)

# text
seg-66020d555be6 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Limite triangular de pior caso sobre a ação do Jacobiano de ponto de Helmert (forma fechada)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonicidade no orçamento; redução do orçamento RSS sob um CRLB por provedor; tolerância de rotação calculada no braço de alavanca lunar; termo vinculante = rotação)

# text
seg-da0791f2edc4 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Agregação RMS das divisões por par validadas sob cada convenção (forma fechada)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris zera o orçamento; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } nas divisões reais; ordenação das convenções)

# text
seg-303947e00325 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Instanciação geométrica do limite de spark em blocos / estimação segura de estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; spark em blocos de Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NÃO é o limiar de consenso 3f+{ "1" } de Lamport–Shostak–Pease ('Byzantine' nomeia apenas o MODELO de falha arbitrária/conluiada). A contagem específica de falhas toleradas é uma propriedade modelada da geometria representativa da rede, verificada quanto à autoconsistência por casos analíticos construídos à mão e pelas fórmulas de contagem

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloco não nulo porém deficiente de posto ⇒ block_spark { "1" }, f_detect { "0" }; colunas independentes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (um par que detém todas as medições de um nó = um erro de deslocamento de relógio ∈ range(G), indetectável, com uma lacuna espectral de Gram clara), byzantine_redundant_net_identifies_at_least_one (seis pares independentes de medição única ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (casos manuais com P⊥ = I fixam f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-c4b1731814f5 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Argumento de parâmetro livre do tempo de ensemble (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado na rede por nó representativa com DE440 real: um teste nulo de resíduo relativo do gerador analítico de taxa comum contra GᵀWG, com o contraste de desempate distinguindo o gauge genuíno de um artefato do modelo de oscilador. Geometria modelada representativa, não um orçamento de temporização certificado

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (rede autorreferencial: a taxa comum está em N(GᵀWG), temporal_gauge_dim { "2" }; após uma linha externa de amarração de taxa: taxa expulsa do gauge, temporal_gauge_dim { "1" } com o deslocamento comum sobrevivendo)

# text
seg-1b1f761bd9a9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Álgebra de forma fechada de projetor de paridade / pseudoinversa na rede por nó representativa com DE440 real: a divisão comum/diferencial, a unificação N(G) ⊕ range(G) e a inclinação da lacuna de proteção de Brown ({ "1992" }) decorrem todas da aniquilação de distância P⊥·G = { "0" }. Geometria modelada representativa, não um nível de proteção certificado

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (viés comum indetectável, diferencial detectável), slope_infinity_in_range_finite_detectable (g7: inclinação ∞ para b ∈ range(G), finita para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: posto(GᵀWG) = state_dim − { "8" }, o gauge de 8 dimensões é todo o espaço nulo, com uma lacuna espectral > { "1e6" })

# text
seg-1ac1dc1c053d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Transcrição das Recomendações nomeadas (baixáveis gratuitamente em itu.int), cada limite acompanhado de sua tabela ou cláusula, listada com todo item não confirmado ou não implementado em docs/TELECOM-TIMING.md; as identidades de continuidade nos pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de norma com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } rodada { "2" } (pré-registrada 970003ee), bloqueada (permanece MODELLED): os dez valores de máscara e treze valores de holdover ePRTC-A que as Recomendações imprimem como números calculados (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } e Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 a 7-4) são reproduzidos dentro de meia unidade impressa, a maioria deles constantes de tabela ou pontos de quebra; G.8271.1 Fig. 7-2 rotula { "200" } ns em { "1.3" } s contra a sua própria Tabela 7-1 ({ "197.5" } ns). Os limites das classes A-D da G.8273.2 não têm valor calculado impresso, e os rótulos dos pontos de quebra travados do ePRTC da G.8272.1 (em linhas de construção contínuas) foram excluídos pela regra de seleção pré-registrada, de modo que permanecem transcrições

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremos abertos e fechados, a lacuna de τ = { "400" } s da G.8271.1 Tabela 7-3, continuidade em todo ponto de quebra que as tabelas implicam; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Transcrição das Recomendações nomeadas (baixadas de itu.int em 2026-10-13), cada linha relida contra o texto, com a continuidade nos pontos de quebra que os coeficientes impressos implicam limitada nos testes (por exemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contra o patamar de { "100" } ns da G.812 Tabela { "4" }). Uma transcrição de norma com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. A G.812 (06/2004) consta como substituída por uma edição pré-publicada de 08/2026 e a G.811 tem uma Amd. { "1" } (04/2016); nenhuma das duas pôde ser lida, portanto nenhuma é verificada. O cenário de OCXO em marcha livre superestima a contribuição do oscilador em intervalos de observação longos em relação à constante de tempo de uma malha; ele nada diz sobre o relógio de nenhum equipamento

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Pré-registrado em tests/fixtures/clock_log/PREREGISTRATION.md (versionado sozinho, 159334f2, antes de a fixture existir); registrado em RESULTS.md. Três logs sintéticos com semente, um por formato (uma lacuna de três épocas num TICC, um segundo relógio RINEX a ignorar), lidos de volta por um leitor independente escrito a partir de docs/CLOCK-LOG-FORMATS.md pelo mesmo autor: contagens de grade, de lacuna e de preenchimento iguais e a maior diferença de fase { "0" } s (limiar { "1e-13" } s). O oadev, tdev e mtie do allantools { "2024.6" } sobre essa fase concordam dentro de { "2.5e-14" } relativo (limiar { "1e-10" }) em todo fator de média que ele avalia; ele não avalia o MTIE sobre o registro inteiro, que o motor relata, de modo que esse ponto por log não tem valor como referência independente e o limiar, como redigido, não é atingido ali. MODELLED: logs sintéticos, e a referência independente do leitor compartilha o autor; arquivos reais de relógio TimeLab, TICC e RINEX provenientes de instrumentos não foram comparados

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de cenário clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (logs escritos à mão por formato: cabeçalhos, separadores, unidades, integração de frequência, canais e modos do TICC, lacunas e políticas, recusas); tests/clock_log_allantools.rs (a comparação pré-registrada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Fixtures escritas para o Kshana a partir dos layouts de linha públicos dos daemons, com valores inventados (NOTICE.md na pasta da fixture); nenhum log de uma instalação real foi lido e nenhuma referência independente compara a análise com outro leitor, de modo que um layout que difira entre versões do daemon ainda pode ser recusado ou lido de forma errada. Os estimadores alimentados pela série de fase são os validados contra o allantools nas linhas acima

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) nas fixtures em tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Cálculo manual sobre registros construídos a partir de fórmulas cuja inclinação, degrau, extremo e tempo de recuperação são conhecidos antes da execução (os testes os declaram), e as máscaras, o envelope e os orçamentos das linhas de temporização de telecomunicações acima. Nenhuma medição laboratorial de um holdover real foi avaliada e nenhuma referência independente externa foi comparada, de modo que o tipo de cenário não faz nenhuma afirmação sobre nenhum relógio ou sistema; é necessário um parceiro de laboratório de temporização antes que qualquer cifra por classe de relógio possa ser promovida

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — O livreto do Volume de Serviço Espacial do ICG (UN OOSA ST/SPACE/75, { "2018" }), ele próprio uma simulação, comparado sob um pré-registro versionado antes da execução (xval/gnss-ssv/PREREGISTRATION.md; resultados em xval/gnss-ssv/RESULTS.md, fixados por tests/ssv_booklet_results.rs, falhas incluídas). Execução { "1" } na leitura pré-registrada: as constantes de potência irradiada mínima e o limiar lunar concordam (S0, S6 atingidos); os limiares do SSV superior e inferior, do limiar de RF, de GEO e de HEO são NOT MET, quase todos por causa do GLONASS, para o qual o livreto dá { "20" } e { "28" } graus nas tabelas B2 e B6 e { "26" } e { "34" } graus na tabela { "4.2" }. Uma variante de diagnóstico com os ângulos da tabela { "4.2" } concorda em toda célula do SSV superior, do SSV inferior e das seis missões GEO (ela não substitui a execução { "1" }; as células de RF, HEO e lunares ainda falham). Os padrões medidos do painel GPS L1 não são reproduzidos pelo substituto paramétrico (RMS de { "6" } a { "9" } dB contra um limiar de { "3" } dB). A concordância mostra que o método declarado do livreto é reproduzido, não que os sinais GNSS se comportem assim

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas e magnitudes publicadas nos testes (o pico de uma camada de Chapman e a curvatura do limbo da superfície, alguns TECU de plasmasfera num raio de GPS a GEO); o projeto do receptor reutiliza os modelos de aquisição e de malha de rastreamento e seus testes. Nenhum dado medido de sondagem do limbo ou de recepção de sinal fraco é comparado com ele

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Verdade simulada contra a estimativa do próprio filtro (o erro de estimação normalizado quadrático médio de um filtro consistente é cerca de { "3" } para a posição) e determinismo para uma semente fixa. Nenhum dado de voo ou gravado de GNSS em órbita alta é comparado; o Sol e a Lua são substitutos circulares de baixa precisão

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A mesma verdade simulada do filtro absoluto: o erro do filtro relativo contra o estado relativo verdadeiro, e a verificação de que ele se sai pelo menos tão bem quanto subtrair duas soluções absolutas independentes. Nenhum dado de formação em voo é comparado

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Cada forma fechada contra uma rota numérica independente nos testes (quadratura no domínio da frequência da função de transferência exata e do filtro de atraso, um Monte Carlo sobre átomos para o viés de frente de onda, um Monte Carlo sobre disparos para o índice de franja) e seus casos-limite. Um valor calculado publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) afirmam que em tau_R = { "20" } us é necessário um ruído de fase Raman branco abaixo de -111 dB rad^2/Hz para { "1" } mrad por disparo; o termo branco sozinho dá { "0.99" } mrad (o artigo deriva o nível com sua Eq. { "17" }, flicker mais branco). Consistência interna e um valor calculado, não uma validação externa; aberrações de ordem superior e o ruído de qualquer laser específico não são modelados

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — As quatro folhas de dados da Microchip nomeadas (números de documento e URLs em cada predefinição e em docs/TELECOM-TIMING.md) para as cifras de entrada; a rampa de envelhecimento de forma fechada e a propriedade de envelope do ajuste como verificações internas. Como as cifras se tornam um modelo de ruído — o ajuste, a regra do piso, o mês de 30 dias, a leitura linear de temperatura — é uma escolha de modelagem; nenhuma predefinição é uma medição de uma unidade. { "0.30" } rodada { "2" }, limiares unilaterais contra unidades medidas (pré-registrados a01c491c), um achado (permanece MODELLED): a estação IGS THU2 Symmetricom 8040C nos relógios finais MGEX da ESA tem um desvio de Allan de { "0.35" } a { "0.87" } da predefinição de rubídio, mas um erro de holdover de { "1.07" } a { "1.60" } dela; o registro do 5071A fica fora da predefinição de césio até { "1000" } s (ruído branco de fase da medição, 30x a { "1" } s) e em holdover ({ "1.15" } a { "8.74" }); o pior SA.45s de produção de { "2011" } é 1.26x a predefinição de CSAC a { "1" } s; o OX-208 não tem registro medido (bloqueado)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — a rampa de envelhecimento discreta dentro de { "0.1" } % de (1/2)·D·t² ao longo de um dia; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas para cada termo isolado e a busca de raiz independente holdover::holdover_seconds; as cifras das folhas de dados são os documentos nomeados (docs/SLOT-TIMING.md). Um padrão de classe se apoia num piso de ruído vermelho presumido e uma fonte de folha de dados é um envelope de máximos, de modo que nenhum dos dois é uma medição de qualquer unidade

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relógios de satélites GPS Block IIF, { "14" } dias de relógios finais do IGS: { "8" } dentro do limiar de { "1.5" }, G25 e G30 otimistas em até cerca de 2x, fixado); tests/slot_timing_ocxo_holdout.rs (um OCXO medido: a predição retida nunca otimista, de { "0.59" } a { "0.70" } da violação medida; na amostra dentro de { "0.98" } a { "1.17" }; sem o termo de frequência de correção a predição na amostra é otimista em todo limiar); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — toda classe contra holdover::holdover_seconds a { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Redução ao nível de proteção de temporização existente e às formas fechadas de visibilidade de órbita circular e Terra esférica. Condicionado à detecção, um falsificador terrestre numa taxa de rampa declarada, uma passagem sobre a vertical numa Terra sem rotação; não validado num receptor falsificado em órbita

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exatamente tpl::timing_protection_level_ns quando o relógio não tem termo de flicker, de fase branca nem de passeio aleatório; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Redução à equação anti-jam e ao orçamento de enlace do tipo de cenário <c1/> existente (o mesmo código, chamado com as mesmas entradas), e à forma fechada do piso de ruído k T0 F. Os espectros de sinal subjacentes são a linha validada acima; as potências dos jammers, a linha do tempo e as larguras de banda do front-end são entradas do cenário, os espectros são contínuos (sem linhas de código de espalhamento), e nenhum controle automático de ganho, supressão ou padrão de antena age sobre o jammer. Nenhum espectro medido sob jamming está no repositório para conferir o composto. A tabela Q do tipo de cenário <c2/> (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde { "0.36" }: os valores de manual, fixados às formas fechadas do navsignal) concorda com o valor CW deste modelo e difere do que ele deriva para ruído casado ao C/A ({ "1.5" }) e para ruído plano de nulo a nulo sem normalização em banda ({ "2.2" }); o relatório imprime ambos

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db e C/N0 efetivo igual a jamming::effective_cn0_dbhz com Q = 1/(R_c kappa) a { "1e-9" } dB, e a âncora de { "32.105" } dB do próprio teste do tipo de cenário jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — Medido contra o JPL Horizons DE441 (as mesmas fixtures versionadas), mas não validado: as cifras declaradas na Tabela { "1" } para Urano e Netuno são excedidas em até { "2.0" } e { "5.2" } vezes contra as posições heliocêntricas do DE441 (Netuno as atinge contra posições baricêntricas, o que sugere que o ajuste não era heliocêntrico), a página não declara erro para Plutão, e não existe limite publicado para as velocidades. As Tabelas 2a/2b atingem suas próprias cifras para Urano e Netuno e são cobertas pela linha validada

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fixado em { "2.04" } e { "5.16" } vezes o erro nominal de longitude, abaixo de seis vezes; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } segundos de arco e { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: pior { "3.7e-3" } da velocidade); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — Medido contra as efemérides de satélites do JPL Horizons (DE441, MAR099, JUP365, SAT441) versionadas em tests/fixtures/solar_system/horizons_satellites_icrf.csv com a consulta e a data de obtenção; não existe exatidão publicada para elementos médios nem para a colocação por modelo de rotação, de modo que os limiares fixados detectam regressões e não validam. Os elementos médios omitem as perturbações ressonantes e solares, e a aceleração secular de Fobos não é modelada

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: pior erro angular visto do planeta de { "2000" } a { "2040" }, Fobos { "5.65" } graus, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titã { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } graus); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-d0dd931332c8 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Transcrição de constantes publicadas, cada uma citada onde é definida: parâmetros gravitacionais dos registros de corpos do JPL Horizons e da tabela de parâmetros físicos de satélites do JPL, raios das tabelas de parâmetros físicos do JPL (IAU WGCCRE { "2015" }), polos e meridianos de origem do Grupo de Trabalho da IAU sobre Coordenadas Cartográficas e Elementos de Rotação (valores médios, sem os termos de taxa T e periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } e { "2019" }, e Jacobson { "2009" } e { "2014" }. Verificadas quanto à consistência interna (o período de rotação de Júpiter contra a taxa do Sistema III, cada J2 contra o seu raio de referência), não contra uma referência independente externa. { "0.30" } rodada { "2" }: os valores de GM foram adotados de gm_de440 e os elementos de Fobos e Deimos de pck00011, de modo que { "0" } de { "84" } constantes dos catorze corpos adicionados agora diferem do NAIF (eram { "12" }), o que é uma verificação de transcrição e não é contado. { "0.36" }: a orientação fixa ao corpo da IAU e o GM dos catorze corpos adicionados foram separados em sua própria linha VALIDATED ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); esta linha mantém o que sobrou. J2 e o raio médio são citados, não validados; as posições no relatório se apoiam em suas próprias linhas; e o prime_meridian_deg do relatório para a Terra, a Lua e Marte permanece em constantes convencionais (até { "6.6e-3" }, { "2.8e-2" } e { "9.6e-4" } rad de IAU_<BODY>). { "0.30" } revisões: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Netuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutão { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; raio equatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg agora inclui os termos quadráticos e periódicos

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas e autoconsistência: a terceira lei de Kepler para o período do relé, o raio da órbita e o raio da superfície mantidos ao longo da execução, o acréscimo de uma medição nunca aumentando a incerteza formal, e os erros semeados concordando com a covariância. As órbitas dos relés ignoram terceiros corpos (a atração de Júpiter sobre relés em torno de Europa não é modelada), o ruído é gaussiano em níveis declarados e o modelo de medição é instantâneo, de modo que isto não é validado contra os dados de navegação de nenhuma missão

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: a raiz do valor quadrático médio de cada erro de solução sobre o seu próprio sigma formal em [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a varredura de elevação por força bruta, as reduções calculadas à mão e por orbit::dop, e a geometria de forma fechada de Walker e geossíncrona. Órbitas de dois corpos com um J2 secular opcional, um corpo esférico com a vertical local ao longo do raio, apenas visibilidade geométrica (sem potência de sinal, saúde de satélite, terreno ou perturbação de terceiro corpo), e a fase relativa entre sistemas tomada de épocas de referência diferentes, de modo que não é um instantâneo de nenhuma data. { "0.30" } revisão, um achado (permanece MODELLED): as predefinições atingem os pisos publicados unilaterais de disponibilidade de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) a { "100" } %, mas com o PDOP do motor dobrado numa cópia de trabalho elas ainda os atingem (pior ponto { "99.36" } %), de modo que os pisos não conseguem detectar nem um erro de { "100" } % na grandeza que esta linha calcula; apertá-los depois da execução seria uma tolerância post hoc. A promoção exige uma comparação bilateral de valores de DOP em geometria idêntica com uma tolerância preestabelecida. { "0.30" } rodada { "2" } (tests/coverage_dop_full_oracle.rs, pré-registrada add671d6), um achado (permanece MODELLED): posições, elevação, azimute e trajetórias no solo do Orekit { "12.2" } com GDOP/PDOP/HDOP/VDOP do gnss_lib_py { "1.0.4" } (relógio comum) e uma inversa em numpy (um relógio por constelação) concordam em todo limiar nos projetos Galileo, GPS, BeiDou, Galileo+GPS (um relógio cada) e de uma Terra com 1584 satélites (DOP dentro de { "2e-14" } relativo, solução, disponibilidade e contagens de visibilidade idênticas). Nos projetos da Lua e de Marte os elementos, as posições, a visibilidade e as trajetórias concordam, mas o DOP excede o limiar relativo preestabelecido de { "1e-9" } em células cujo maior PDOP é { "1434" } ou mais (até { "8e-6" }), e { "4" } células diferem por uma época de solução em geometria numericamente singular (pivô do motor { "1e-10" } contra o posto do numpy), de modo que a linha não é validada. { "0.30" } revisões: o relógio de referência de TDOP/GDOP é agora a constelação de menor numeração à vista (constellation-multi-gnss-coverage GDOP global máximo { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }), e as contagens visíveis por constelação são somadas como inteiros

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — todo mapa e todo contador é igual a uma varredura com o teste direto de elevação; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime o tempo de execução e os testes de par mantidos; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (apenas verificação de regressão); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressão)

# text
seg-41b300bb888a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de composição contra as execuções autônomas dos mesmos tipos de cenário: uma campanha de uma fase reproduz a saída autônoma bit a bit, o deslocamento transportado é igual à própria última amostra da execução anterior, e a fase encerrada por end_at tem exatamente o tempo de detecção da execução como seu comprimento. O transporte aditivo através de uma fronteira de fase e a retenção de ordem zero são escolhas de modelagem, e cada fase é tão boa quanto o tipo de cenário que a executou; nenhuma missão encadeada foi conferida com uma medida

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — o resultado do membro idêntico byte a byte à execução autônoma e todo valor alinhado igual à série autônoma; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A forma fechada do passeio aleatório de fase sob ruído branco de frequência, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções autônomas para a semeadura. Ela verifica a aritmética do ensemble sobre o próprio modelo de relógio do motor, não um conjunto de dados externo

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } sementes de um relógio de ruído branco de frequência em deriva livre tau = { "3010" } s: a média verdadeira { "0" } dentro do intervalo relatado, a meia-largura do intervalo dentro de { "25" }% de { "1.96" } sigma/sqrt(n), e a variância amostral dentro do intervalo qui-quadrado bilateral de { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; ensemble de calibração (CAP-10, pré-registrado ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): em { "200" } ensembles independentes o intervalo cobre a média verdadeira em { "192" } (dentro da região de { "99" } % da Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) e a verificação qui-quadrado passa em { "196" }, enquanto a tolerância de percentil de semente única (p05 e p95 dentro de { "0.3" } sigma) passa em apenas { "183" } de { "200" }, NOT MET contra os { "190" } pré-registrados, uma verificação frágil quanto à semente, registrada em vez de afrouxada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidade de composição contra a execução autônoma. A aritmética de condições compartilhadas é contabilidade; a física é a dos tipos de cenário membros, cada um com a sua própria linha

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — uma composição de um membro lê o número autônomo e o digest do resultado)

# text
seg-ef402841914e = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Apenas interno: a forma fechada exata -20 log10(distância) da equação de enlace, uma grade independente de força bruta sobre o mesmo tipo de cenário, e a função de Rosenbrock. O limiar 1-D da rodada { "1" } é NOT MET (a caixa pré-registrada excluía a solução de { "3" } dB; o otimizador parou no limite), registrado em docs/design/evidence/cap32-optimize/RESULTS.md e não reavaliado. O ótimo é local à caixa e ao ponto de partida; nenhuma afirmação de ótimo global

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (pré-registrado fbe6c8b3 e, após uma falha de protocolo na rodada 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — solução de alvo 1-D dentro de { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) em { "96" } avaliações; p3_prime_contour_target_grid_and_nelder_mead e p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — o melhor do método de grade idêntico bit a bit a um laço independente de força bruta { "41" } x { "41" } sobre run_toml, Nelder-Mead pelo menos tão bom em { "177" } e { "161" } avaliações; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fixa a falha registrada da rodada 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } em { "234" } avaliações; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos em si são entradas: as predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espectros de QPSK de Feher aprimorado, de chaveamento por deslocamento de código e de OFDM são aproximados, e as verificações de forma comparam formas, não níveis calibrados.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (todo cenário agnóstico de sistema incluído roda sem dados de workshop, as razões ionosféricas da troca de banda são iguais a (f_ref/f)^{ "2" } e suas diferenças de espaço livre a { "20" } log10(f/f_ref), o jitter no C/N0 de referência fica entre o seu limite de Gabor e a sua forma de banda ilimitada, as verificações de forma E5 do cenário com parâmetros de workshop são consistentes quando esse arquivo está presente, e nenhum arquivo-fonte compila esse arquivo)

# text
seg-c83f81eb8726 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Redução à cadeia de espectro existente e à equação anti-jam do tipo de cenário jamming (uma banda de componente único dá os mesmos números de antes da extensão) e aos espectros de sinal das linhas validadas. As potências dos jammers, a linha do tempo, as larguras de banda do front-end e os sinais projetados são entradas, e um sinal projetado é truncado na sua banda de transmissão (sem emissão fora da banda).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (a cascata multibanda roda com quatro painéis, os jammers UHF, banda L5, S e C negam cada um apenas a sua própria banda, e uma execução de banda simples não é alterada pela extensão); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas e autoconsistência: as identidades de taxa de variação e de aceleração da distância contra derivadas numéricas, o ganho isofluxo cancelando o crescimento da distância, os limites de perda de polarização de manual, a observação qualitativa LEO versus GNSS (uma passagem em forma de sino de minutos, com pico vários dB acima das portadoras GNSS planas de 44-51 dB-Hz). Os EIRPs e os padrões são potências recebidas publicadas convertidas em EIRP ou escolhas representativas, o termo gasoso é o método simplificado superado da P.676-10, e nada é comparado com um C/N0 de LEO medido

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: abaixo de { "0.01" } Hz e { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-d9e965c108ea = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Transcrição das cifras públicas citadas e uma verificação de consistência: um EIRP definido a partir de uma potência mínima recebida publicada prevê o máximo publicado dentro de { "0.5" } dB com um padrão plano. Isso é uma verificação da dispersão de distância, não uma validação da antena de nenhum satélite; as predefinições representativas não fazem nenhuma afirmação sobre um sistema real

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: dentro de { "0.5" } dB de -139.1 e -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna de um modelo de projeto declarado: toda escolha de potência, limiar e busca é uma entrada, e o modelo ignora a ambiguidade de borda de bit, a detecção perdida e a readquisição. Não comparado com um receptor medido

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna (a identidade do salto e o limite do cone contra amostragem de força bruta). O limiar é uma entrada; nenhum requisito publicado de continuidade para LEO é fixado

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (o salto de distância de cada troca é igual à variação do erro de distância, e um ajuste corrigido de { "300" } s atualizado a cada { "150" } s passa um limiar de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (a forma fechada limita uma amostragem densa do cone)

# text
seg-bae9c4665c45 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades de ida e volta e o próprio orçamento. O formato é o próprio do Kshana, modelado sobre os componentes de mensagem publicados e o conjunto de campos do ICD do Galileo; não é o layout de bits do Celeste nem de qualquer outro sistema (nenhum é público), de modo que não há layout externo contra o qual validar

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (todo modelo dentro de { "2" } mm da mensagem exata após a decodificação, recodificação idêntica bit a bit, um bit invertido rejeitado pelo CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Idas e voltas e a aritmética de calendário. O RINEX { "4.02" } não define registros de navegação LEO (IGS RINEX { "4.02" }), de modo que o layout é uma extensão documentada, com arXiv { "2401.17767" } citado como estado da arte anterior; não existe leitor externo dele para conferir

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (todo modelo dentro de { "0.1" } mm após o bloco de texto, o CSV exato)

# text
seg-9c1e46397382 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Fatos do modelo ATÔMICO do InsideGNSS (polinômio de 6ª ordem, cerca de um minuto de validade, atualização a cada { "30" } s, relógio conduzido, erro de relógio de { "24" } cm). São fatos descritivos, sem números publicados para comparar. A tabela de cinco altitudes imprime o SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } e { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } e { "1336" } km num arco de 20 minutos) ao lado do ajuste do Kshana sobre a sua própria órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } e { "0.51" } cm; razões de { "0.46" } a { "0.77" }), não fixado, porque o artigo ajustou órbitas precisas reais e as verdades diferem. O modelo de 22 parâmetros e o ajuste em si são validados contra órbitas reais na linha Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. { "0.30" } revisão: as cifras da tabela mudaram com o ajuste na convenção do artigo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: recuperação sem ruído, a identidade cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho diferenciada numericamente, Doppler zero na maior aproximação, a solução espelhada de uma única passagem, e erros semeados contra a covariância formal. A cifra do Starlink de Kozhaya, Saroufim e Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: cerca de { "2" } m em { "20" } s com três satélites) é apenas uma comparação: o receptor modelado, com uma efeméride perfeita e todo erro num sigma de Doppler de { "30" } Hz, é várias vezes menos exato na mesma janela, e o receptor e a taxa de medição do artigo não são reproduzidos

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: a { "1" } mm e a deriva a { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: o RMS do resíduo ponderado em [{ "0.8" }, { "1.2" }] e o erro abaixo de quatro sigmas formais); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (um proxy pré-registrado contra os percentis publicados do conjunto de dados 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: com { "3" } satélites (máscara de { "47" } graus), sem auxílio de altura e { "30" } Hz, o erro 3-D p90 é { "92.2" } m a { "20" } s e { "870" } m a { "8" } s contra os { "2" } m e { "10" } m publicados, de modo que ambos os limiares de fator dois são NOT MET, pelo lado alto, e afirmados como não atingidos; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Um DOP de quatro satélites derivado à mão (um satélite no zênite e três no horizonte separados por { "120" } graus, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com relógio próprio e um satélite não acrescenta geometria, recuperação sem ruído de posição, relógio e viés, e erros semeados contra a covariância. Apenas verificações internas; não comparado com a saída de um receptor. { "0.30" } comparação externa, um achado (permanece MODELLED): num dia IGS multi-GNSS (ABMF 2018-05-13, GPS e Galileo C1C, efeméride de transmissão, Klobuchar) o viés entre sistemas concorda com o rnx2rtkp do RTKLIB v2.4.2-p13 (diferença mediana de -0.11 ns após a correção do atraso de grupo de transmissão { "0.30" }, -0.35 ns antes; limiar { "1" } ns), mas apenas { "93.6" } % de { "280" } épocas ({ "93.2" } % antes da correção) ficam a { "3" } m da coordenada ITRF2020 contra os { "95" } % pré-registrados. O próprio RTKLIB alcança { "88.2" } % nos mesmos dados, de modo que o limiar está além do posicionamento de transmissão de frequência única nesta estação e neste dia, e não é uma discrepância do solucionador; o teste de comparação está versionado como ignorado. { "0.30" } rodada { "2" }, entradas mais estritas com o limiar inalterado de { "3" } m / { "95" } % / { "1" } ns, um achado (permanece MODELLED): com o par livre de ionosfera Galileo E1/E5a (pré-registrado { "6927e039" }) { "79.9" } % das épocas ficam a { "3" } m (RTKLIB { "67.9" } %); com órbitas, relógios, deslocamentos de antena de satélite e vieses de código precisos do CODE MGEX (pré-registrado 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), e o viés entre sistemas difere do RTKLIB em -1.03 ns porque o modo simples do RTKLIB ignora os deslocamentos de antena de satélite (+{ "0.04" } ns quando ambos os omitem)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) a { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-e86eb864ba1a = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — O teste qui-quadrado de NEES é uma verificação de consistência interna (a verdade e o filtro compartilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS de { "9.6" } min encurtado para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário incluído dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com as suas próprias camadas representativas de { "1000" } km e { "60" } graus, ruído e estações; as constelações, o ruído e a definição de convergência do artigo não são reproduzidos, de modo que isto é uma consistência MODELLED da tendência (encurtamento monótono, a maior constelação abaixo de um terço do tempo só com GNSS), não uma validação

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } sementes, média de NEES média das execuções em [{ "2.4" }, { "3.6" }] e pelo menos { "75" }% das épocas dentro da faixa qui-quadrado bilateral de { "95" }%; medido com { "150" } sementes, média { "2.84" } só com GNSS e { "2.87" } com LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna: a expressão publicada do deslocamento calculada à mão, o erro normalizado em { "40" } sementes, e o piso definido pela incerteza do deslocamento. A cifra do NIST para receptores de temporização Iridium com um relógio atômico miniatura (abaixo de { "40" } ns em relação ao UTC(NIST) ao longo de { "40" } dias) é apenas uma comparação; o cenário Iridium incluído dá { "10" } a { "11" } ns RMS em potência nominal com o seu erro de distância representativo de { "5" } m. O ruído de frequência flicker e o atraso ionosférico não são simulados

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Transcrição dos valores públicos citados, verificados quanto à estrutura (toda fonte pública tem uma URL, os padrões Walker se dividem igualmente, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não contra uma referência independente externa. Os valores representativos são nomeados em cada predefinição e são ilustrativos

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: varreduras de texto-fonte de src, scenarios e tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Autoconsistência das passagens de bastão: cada valor repassado é igual à própria saída da etapa a montante, e mutar uma entrada a montante move toda cifra a jusante que depende dela. As etapas mantêm seus próprios rótulos; a cadeia não acrescenta física nem referência independente externa

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: um EIRP mais forte, um intervalo de ajuste mais longo e um termo maior de determinação de órbita movem cada um o valor repassado e a solução fundida; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Formas fechadas e identidades, não uma medição externa: o gradiente da taxa de variação da distância contra uma diferença central, a estatística em forma de informação contra a forma de covariância densa, uma deriva de relógio pura dando zero, um empurrão explicado pelo prior dando no máximo |dx|^2/sigma_p^{ "2" }, a estatística quadrática num salto. Nenhuma cifra de detecção é comparada com um ataque medido; o falsificador é idealizado (sem assinatura de potência, de ângulo de chegada ou de pico de correlação)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Identidades: o degrau de início de um falsificador livre de ionosfera é igual à diferença de atraso ionosférico modelada do par, o limiar é o quantil normal bilateral vezes o desvio padrão do degrau mais o limite de taxa. O modelo ionosférico do receptor é o do motor, de modo que o resíduo autêntico é zero na média por construção; nenhuma referência independente externa

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — A identidade de dispersão de primeira ordem, exata por construção contra o próprio atraso de primeira ordem do motor (cuja escala 1/f^{ "2" } é VALIDATED contra a IS-GPS-200 em sua própria linha); a precisão é apenas o ruído térmico de código, sem multipercurso nem vieses entre frequências. { "0.30" } rodada { "2" }, medida (pré-registrada 5e795f93), um achado (permanece MODELLED): o mapa global de ionosfera do CODE CODG1330.18I contra o código C1C/C2W do ABMF com os vieses do CODE dá { "33" } de { "36" } médias de arco dentro de { "3" } TECU (pior +{ "6.84" } TECU num arco vespertino; RMS por época { "3.95" } TECU), contra um limiar de todo arco; não validado

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: igual ao TEC oblíquo da passagem no pico a { "1e-9" } e seu sigma é igual ao ruído de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Implementação contra especificação, NÃO uma referência independente externa: uma reimplementação em Python de sala limpa (scripts/maritime_score_cleanroom.py), escrita por um leitor que recebeu apenas docs/RECEIVER-TRUST.md e docs/MARITIME-TRUST.md e não o código-fonte em Rust, concorda com score_from_ratios em { "600" } vetores de razões (pontuação, faixa, pontos e a ordem das deduções, diferença { "0" }), depois que a documentação foi completada onde o primeiro leitor a encontrou omissa ou inconsistente (ordem de desempate, arredondamento, a razão de um monitor de passa-ou-falha, dois exemplos cujos números não correspondiam à fórmula). Isso mostra que a documentação é suficiente e que o código faz o que diz. O QUE NÃO É VERIFICADO, e por que a linha permanece MODELLED: a regra em si (os pesos, a rampa, os limites das faixas, a retenção de evidência) é própria deste projeto, pré-registrada mas sem fonte externa, e nada aqui mostra que uma pontuação de { "80" } ou { "40" } signifique o que um navegador gostaria que significasse diante de interferência real; nenhuma cifra desse tipo é dada. Os limiares dos monitores são igualmente próprios deste projeto (a Linha A verifica apenas a sua aritmética).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótono em toda estatística, acrescentar um monitor nunca eleva a pontuação, estatísticas saudáveis permanecem em { "100" })

# text
seg-26753cc49103 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — O QUE É VERIFICADO: os testes de cadeia exata deste crate sobre o mapeamento de campos LEEF documentado e os campos do envelope RFC { "5424" }; não existe nenhum analisador LEEF de código aberto mantido (uma busca no índice de pacotes Python não encontrou nenhum), de modo que o formato é verificado contra a sua própria especificação lida pelo mesmo autor, não contra uma referência independente externa. O QUE NÃO É: se as cargas LEEF são aceitas pelo analisador ou SIEM de algum fornecedor; as regras de escape além das documentadas; o comportamento de um coletor syslog real.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadeias LEEF exatas, escape, severidade, envelope RFC { "5424" }, tempos limite de entrega e reconexão); tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — Os registros de eventos publicados do conjunto de dados (janelas de attack_log), como verdade de eventos, sob o pré-registro xval/jammertest-trust/PREREGISTRATION.md (versionado sozinho, 0fa012b, antes de o harness ser executado). Primeira e única execução (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } pastas avaliáveis ({ "7" } com jamming), { "3,502" } épocas limpas e { "9,560" } com jamming. Probabilidade de falso alarme em dados limpos retidos: cn0_drop_db { "0.0231" } (81/3502) contra um limiar de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, passa; jam_ind_threshold { "0.0094" }, passa; união dos três: falsos alarmes { "0.0328" }, detecção { "0.807" } contra { "0.05" } e { "0.50" }, passa. Pela regra registrada a linha é MODELLED (um limiar falhou). Estreito: um tipo de receptor (u-blox ZED-F9P), um evento, janelas agendadas de um minuto como verdade (a detecção é um limite inferior; limpo significa fora das janelas registradas); calibrado nos logs CSV, e o leitor UBX dá mais falsos alarmes em duas pastas. As faixas de pontuação de confiança marítima não são calibradas

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorado, condicionado a dados por KSHANA_JAMMERTEST_DIR: a seleção registrada, as contagens retidas, os vereditos dos limiares e o veredito); receiver_trust::calibration::tests (carimbos de tempo, pareamento de janelas e a mudança de fuso horário, rótulos, faixas de guarda, exclusão, seleção); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — As contagens de slots do plano por área de teste ({ "76" }, { "77" } e { "45" } slots, dos quais { "61" }, { "63" } e { "32" } transmitem) foram contadas de forma independente com um script sobre o mesmo JSON; as janelas de attack_log do conjunto de dados de { "2024" } como verdade de eventos, sob xval/jammertest-score/PREREGISTRATION.md (versionado sozinho, c2e6d3b, antes de o avaliador ser executado). Primeira e única execução (xval/jammertest-score/RESULTS.md): a regra registrada de dados mínimos FALHOU ({ "4" } janelas de jamming avaliáveis de { "4" } de { "12" } pastas UBX contra um mínimo de { "10" } janelas de { "2" } pastas: { "5" } pastas descartadas pela regra de linha de base, { "3" } logs UBX trazem apenas a semana GPS e o tempo da semana), de modo que os limiares B1 a B4 não são avaliáveis; nada foi afrouxado ou reexecutado. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, versionado sozinho, apenas tratamento de dados: logs apenas com tempo GPS posicionados a partir da data, as { "12" } pastas só com CSV, uma sessão de plataforma móvel para rovers em movimento; mesmos limiares e mesma regra de dados mínimos): { "14" } de { "24" } pastas mantidas, mas { "7" } janelas de jamming avaliáveis, regra de dados mínimos novamente falhou, nenhum limiar avaliável (RESULTS-v2.md). Verdade agendada: um slot planejado não é um registro de transmissão no ar, uma falha de detecção pode ser um teste que nunca foi executado, uma latência é contada a partir do início planejado, e limpo significa fora dos slots planejados. A detecção por monitores no domínio da medição nada diz sobre um falsificador de baixa potência. Um tipo de receptor (u-blox ZED-F9P). O conjunto de dados NMEA da SimulaMet de { "2025" } não é usado (sem licença declarada, acesso condicionado a assinatura)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionado a dados por KSHANA_JAMMERTEST_PLAN_DIR: contagens de slots por área de teste do plano de { "2025" }, ids de catálogo, ida e volta em TOML); tests/jammertest_score.rs (um log sintético com uma queda conhecida: detectada, perdida, não avaliável, execução de falso alarme, pacote assinado carregando o boletim); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionado a dados por KSHANA_JAMMERTEST_DIR: a execução registrada)

# text
seg-c70f3f97d479 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Referências verificadas contra um índice de títulos extraído por script dos documentos públicos citados, lidos em 2026-10-10 (tests/compliance_references.rs). O QUE É VERIFICADO: { "49" } referências citadas de cláusula, seção, parágrafo ou título existem no documento citado, e { "7" } URLs citadas foram resolvidas na data registrada ({ "2" } por uma segunda rota); controles negativos falham. O QUE NÃO É: que qualquer paráfrase, mapeamento ou lacuna esteja correta; as cláusulas da EN { "16803" } (paga, apenas o texto do catálogo); revisões posteriores; o índice não é uma implementação independente.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = exercitado contra uma aplicação hospedeira real; uma execução de integração não é uma referência independente — O QUE É VERIFICADO, declarado de forma estreita: que estas integrações funcionam contra o software real para o qual foram escritas. A EVIDÊNCIA está versionada em integrations/signalk/evidence/README.md (com seus arquivos JSON) e em integrations/opencpn/evidence/README.md (com suas capturas de tela e logs), cada uma com o script que a reproduz. ({ "1" }) Signal K: o plugin carregado no pacote npm signalk-server { "2.33.0" } fixado, num espaço de nomes de rede privado somente de loopback, alimentado com dados sintéticos. As próprias interfaces REST e WebSocket do servidor mostraram os caminhos publicados, os metadados de pontuação e uma notificação que passou por ausente, warn, alarm, normal (após a retenção) e warn de novo quando os dados pararam. Com o kshana real executado pelo plugin sobre o NMEA que o próprio servidor recebeu, a notificação foi de warn a alarm e a posição relatada foi publicada; o navigation.position do próprio servidor foi escrito pelo seu provedor NMEA, nunca pelo plugin. Reexecutado contra o esquema JSON ao vivo { "1.2" }. ({ "2" }) OpenCPN: o plugin compilado contra o cabeçalho da API de plugins do OpenCPN e o wxWidgets { "3.2.4" }, carregado no pacote Ubuntu { "24.04" } do OpenCPN { "5.8.4" } sob uma tela virtual; o OpenCPN o carregou, executou sua inicialização e entregou a ele as sentenças PKSHT do fluxo filtrado, e o painel ficou vermelho na faixa não confiável. Numa execução limpa, a própria posição do navio no OpenCPN deixou de atualizar, e o seu indicador de solução caiu, quando o gate marcou a solução como inválida. Uma segunda execução alimentada diretamente pelo listener TCP do gate mostrou a entrega ao plugin, mas não um antes-e-depois limpo. ({ "3" }) Os testes de relé reproduzem um trecho gravado do fluxo filtrado por um socket TCP real e verificam o que um consumidor recebe (os bytes inalterados, checksums válidos em toda sentença, inclusive nas reescritas, GGA e RMC concordando, um PKSHT por ciclo com o campo do gate onde a solução é inválida), e o script de ponta a ponta verifica que um consumidor do listener do gate recebe exatamente os bytes que o mesmo gate escreve na saída padrão. ({ "4" }) Os analisadores PKSHT (JavaScript e C++) são executados sobre sentenças gravadas da saída do kshana e rejeitam um checksum errado, uma versão errada ou uma pontuação fora de { "0" } a { "100" }. ({ "5" }) As unidades do systemd são verificadas com systemd-analyze verify (systemd { "255" }, binários substituídos por stubs) e com salvaguardas para um shell em ExecStart, a política de reinício e as chaves de sandbox; o tratamento de argumentos do ponto de entrada do contêiner é verificado com um binário stub. O QUE NÃO É: não há referência independente externa para nenhum valor que estas integrações mostram. Os valores de confiança em si são as linhas acima, e uma execução de integração mostra apenas que a tubulação os transporta; é por isso que esta linha é MODELLED e não VALIDATED (docs/VALIDATION.md). Nenhuma embarcação real, receptor, execução longa, outra versão de qualquer hospedeiro, outro sistema operacional ou ambiente de desktop foi usado; todos os dados são texto sintético e nada aqui é uma medição. O tratamento sonoro e visual da notificação por um cliente Signal K real, o botão da barra de ferramentas do OpenCPN, as preferências e o estado obsoleto, e o empacotamento para o gerenciador de plugins do OpenCPN não foram exercitados. As chaves de sandbox do systemd foram verificadas apenas quanto à sintaxe, não executadas sob um systemd ao vivo, e a construção da imagem do contêiner e sua verificação de saúde não têm evidência versionada aqui. Nenhuma cifra de detecção ou de falso alarme é afirmada. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); fora do crate: integrations/signalk (JavaScript), integrations/opencpn (relé JavaScript, plugin nativo C++), deploy/reference-build (unidades systemd, contêiner)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (o gate e seu listener TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } testes Node sobre saída sintética gravada); integrations/opencpn/test/relay.test.mjs ({ "5" } testes Node); integrations/opencpn/test/e2e-live.mjs (o binário real até um consumidor TCP, executado à mão e na CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (verificações em C++ do analisador PKSHT e do estado do painel); deploy/reference-build/check-units.sh e deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna contra a verdade injetada e formas fechadas, sob limiares pré-registrados em 6b68f6cc (docs/design/evidence/boc-bump-jump/). Um sinal de dados BeiDou B1C (PRN { "19" }, { "5" } MS/s) gerado por iq::scene: com a opção desligada, uma partida em pico lateral permanece com falso travamento no ±({ "0.5" } + d/4) chip previsto (medido ±{ "0.549" }); com ela ligada, um salto em direção ao pico principal em { "0.08" } s e um RMS de janela tardia de { "0.0008" } chip a { "45" } dB-Hz e { "0.0048" } chip a { "35" } dB-Hz; nenhum salto a partir do pico principal a { "35" }, { "40" } e { "45" } dB-Hz ao longo de { "4" } s; a inclinação escalada do EMLP de { "0.94" } a { "0.99" } sobre o sinal amostrado (sem escala { "3.6" } a { "3.8" }). O detector de bump-jump sozinho, sobre trincas de correlador com a covariância de ruído exata de BOC({ "1,1" }), não fez nenhum salto falso em { "100 000" } atualizações a { "25" } a { "45" } dB-Hz e detectou { "1000" } de { "1000" } partidas em pico lateral a { "35" } dB-Hz. NOT MET (achado F1): a grade de testes unitários pré-registrada para o escalonamento inclui deslocamentos fora da faixa linear dos discriminadores, onde as leituras escaladas erram o deslocamento em até { "48" } %. O QUE NÃO É VERIFICADO: IQ de campo, front ends de banda limitada, réplicas compostas MBOC/QMBOC e qualquer receptor externo.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); testes unitários de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: o limiar de teste unitário B4 pré-registrado mantido como escrito, suas falhas registradas afirmadas como achado F1)

# text
seg-d2d08312c05d = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — Dados medidos sob limiares pré-registrados em b6ccb499 (xval/scint-malindi/): registro Zenodo { "16941224" } (INGV, Malindi, { "18" } de março de { "2023" }, GPS PRN { "26" }, intensidade e fase da portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 verificado). { "22" } janelas qualificadas de { "60" } s (N1 atingido). MET: a distribuição de intensidade (Kolmogorov-Smirnov D { "0.0415" }, limiar { "0.05" }) e a cintilação de fase vinculada a S4 (sigma-phi medido/modelo mediano { "0.779" }, limiar 2/3 a 3/2). NOT MET (achado F1): a fração de desvanecimento profundo do modelo é { "2.38" } vezes a medida (limiar { "0.5" } a { "2" }) e o seu desvanecimento médio dura { "3.51" } vezes mais (limiar 2/3 a 3/2). Achado F2: o processamento registrado lê a fase embrulhada do modelo, o que uma autoverificação expôs; B3 repetido a posteriori com a fase desembrulhada dá { "0.804" }. O QUE NÃO É VERIFICADO: outras noites, estações, latitudes ou sinais; ruído do receptor no modelo. A linha permanece MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, o veredito registrado afirmado como registrado, achado F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, apenas relatado; condicionado a dados, obtido por scripts/fetch_scint_malindi.sh); testes unitários de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, achado F2)

# text
seg-16578e7dd2fe = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Forma fechada, sob limiares pré-registrados em 3724aefa (docs/design/evidence/acq-cfar/). A probabilidade de falso alarme do CA-CFAR para células Gamma(M), contra Monte Carlo do modelo exato: { "18" } de { "18" } casos dentro de { "3" } sigmas binomiais. Em toda célula das buscas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } células cada) num projeto de { "1" } %: { "0.977" } % e { "0.969" } % em ruído gaussiano e { "1.006" } % e { "0.999" } % em ruído quantizado em 2 bits (M = { "1" } e { "4" }; limiar mais ou menos { "20" } %); decisões inalteradas quando a entrada é reescalada. NOT MET (achado F1): num sinal de 2 bits sem ruído a detecção e a sua célula estão corretas, mas { "1.28" } % das células fora do pico da linha do pico (limiar { "1" } %) excedem o limiar de decisão, nos lóbulos laterais determinísticos de correlação do código. O QUE NÃO É VERIFICADO: outras variantes de CFAR, janelas bidimensionais, front ends de banda limitada, dados de campo.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, o veredito registrado afirmado como registrado, achado F1, fixado por finding_noise_free_sidelobes_exceed_the_cfar_rate); teste unitário de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Documentos de controle de interface publicados e formas fechadas, sob limiares pré-registrados em 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } e B3I { "1.0" }, Galileo OS SIS ICD Issue { "2.1" }. MET: toda portadora, taxa de chip e potência recebida como transcrita ({ "28" } canais GLONASS), primeiros nulos de BPSK na taxa de chip, o composto B1C igual a MBOC(6,1,1/11) como dá a tabela de potência do seu ICD, a identidade do caminho de C/N0 e cenários de espectro idênticos byte a byte. NOT MET: o limiar de área unitária, que era inatingível como escrito (achado F1; as áreas são iguais à fração em banda de forma fechada), e a concordância por bin das formas de onda B1I e B1C da camada IQ com o envelope do modelo ({ "1.26" } e { "1.56" } dB contra { "0.5" } dB, achado F2; GLONASS { "0.07" } dB), porque os códigos Gold e Weil têm espectros de linhas irregulares; com média sobre a banda os lóbulos principais concordam dentro de { "0.25" } dB. O QUE NÃO É VERIFICADO: IQ gravado, outros sinais, interferência intrassistema.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, achado F1, fixado por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, achado F2, fixado por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, apenas relatado)

# text
seg-07554505b56b = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — LSIS-AFS V1.0 (como acima): a sequência de Legendre de comprimento 1499 (Tabela E-1, idêntica) e os primeiros e últimos { "24" } chips terciários (Tabelas E-2 a E-6: { "419" } de { "420" } colunas idênticas; o documento imprime os mesmos últimos { "24" } chips, A14850, para o PRN { "147" } e o PRN { "151" } e o gerador reproduz os do PRN { "151" }, de modo que a entrada do PRN { "147" } é muito provavelmente um erro de impressão; o limiar de { "420" } de { "420" } é NOT MET e a falha é fixada); o exemplo calculado da Figura { "8" } do código SB1 (um exemplo: 0x045 codifica para 0x229F61DBB84A0); CRC-24Q contra o valor de verificação do catálogo 0xCDE703 para o ASCII { "123456789" }; a própria aritmética de quadro do documento. Limiares pré-registrados em b3ba5d5. Uma falha registrada e um exemplo calculado para a camada de mensagem, de modo que a linha permanece MODELLED. O QUE NÃO É VERIFICADO: LDPC e as palavras CRC dentro dos subquadros { "2" } a { "4" }, o conteúdo das mensagens e qualquer fluxo gravado

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-3a9a9d15186c = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa para os resultados de cenário: todo teste de pacote executa um tipo de cenário MODELLED. Os limiares são o perfil declarado pelo autor do pacote (a estrutura do DHS não declara valores; os limites de exatidão da IMO são a Tabela C-1 da MSC.1/Circ.1575, lida por inteiro; o pacote da ICAO segue a própria apresentação do Plano de Mitigação de RFI da ICAO porque o Doc { "9849" } é uma publicação paga e não foi lido), versionados antes de qualquer execução avaliada em arquivos PREREGISTRATION.md ao estilo xval sob standards/. Um limiar MET diz que um cenário modelado atingiu um limiar declarado, nada sobre um produto

# text
seg-662887e17adb = standards_pack; compliance (fatos do pacote de normas no compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: o status de cada teste, incluindo as falhas L4-T1 e os quatro testes de exatidão da IMO); standards_pack::tests

# text
seg-37b0efd0a7e5 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: o pacote vincula hashes e uma pontuação MODELLED de registro de receptor, verificada em dados sintéticos (o NMEA exportado de um cenário incluído tratado como o registro do receptor). Nenhuma execução em laboratório é afirmada

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-e9bde2e0a342 = uma subafirmação é verificada externamente, mas a capacidade como um todo compõe peças modeladas, de modo que a capacidade permanece modelada — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, o pacote Ubuntu { "24.04" }, executado como programa separado; apenas números derivados versionados) rastreando as mesmas gravações em numpy (independentes do motor), ambos medidos contra a verdade analítica. Limiares pré-registrados em 48edd4a5, emendados antes de qualquer gravação de teste em 1e4288c4 (um FLL de { "10" } Hz apenas durante a captura inicial em ambos os receptores, depois que a calibração registrada falhou por uma passagem de bastão errada do GNSS-SDR, achado F3). MET a { "30" }, { "35" }, { "40" } e { "45" } dB-Hz: jitter de portadora dentro de { "4.3" } %, jitter de código dentro de { "4.6" } % e média e dispersão do Doppler as do GNSS-SDR. NOT MET: o C/N0 NWPR do motor lê { "2.3" } a { "7.1" } dB abaixo do SNV do GNSS-SDR (achado F4, o limite conhecido do NWPR; o seu M2M4 está a { "0.06" } dB da verdade); os indicadores de travamento de fase diferem por definição (F5); a { "30" } dB-Hz o GNSS-SDR escorregou duas vezes e o motor não (F6). A própria passagem de bastão do GNSS-SDR travou numa frequência errada em { "3" } de { "30" } execuções de calibração. O QUE NÃO É VERIFICADO: outros sinais, remoção de bits de dados, readquisição, gravações de campo. A linha permanece MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sobre números derivados por tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-5d76e6627df0 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um recálculo independente em numpy (xval/crpa-jamming/oracle.py, sem código compartilhado: vetores de direcionamento em numpy, numpy.linalg.solve e inv) de cada elo da geometria da demonstração de jamming com um arranjo quadrado de 4 elementos, sob as duas ponderações. Limiares pré-registrados em 08d83b4d. MET: A1 (todos os { "150" } resultados de cenário idênticos byte a byte sem a seção, após uma correção: a primeira versão acrescentava as unidades crpa à tabela de unidades de toda execução de jamming), A2 (um elemento é igual a nenhum arranjo a { "1e-12" } dB), A3 no ganho de ruído do arranjo e no C/N0 efetivo ({ "912" } ponderações de enlace dentro de { "1e-9" } dB, pior { "2.1e-14" } dB) e no nulo do jammer com direcionamento de nulo (abaixo de -200 dB dos dois lados), A4 (MVDR a { "0.1" } dB do direcionamento de nulo com um JNR de { "80" } dB). NOT MET: A3 no ganho de jammer do MVDR, { "194" } de { "456" } enlaces acima de { "1e-9" } dB com a matemática portátil de { "0.36" } ({ "202" } com a matemática do hospedeiro; docs/revisions/STUDIO15-batch4-rebaseline.md) (pior { "1.7e-6" } dB) em resíduos de -100 a -188 dB, onde o cancelamento em float64 limita ambas as implementações (o inv e o solve do numpy discordam entre si em { "169" } enlaces, pior { "7.9e-7" } dB); o C/N0 efetivo que eles alimentam não é afetado. O QUE NÃO É VERIFICADO: acoplamento mútuo, descasamento de elementos, processamento de banda larga, múltiplos jammers, qualquer hardware de antena. Um recálculo das mesmas equações, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), contra xval/crpa-jamming/expected.json de xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um recálculo independente em numpy (xval/jamming-terrain/oracle.py, sem código compartilhado: leitura própria de .hgt, interpolação bilinear, ida e volta WGS { "84" }, perfil, abaulamento, nu e J(nu)) de dez posições de jammer em torno de um receptor em Badwater Basin sobre o tile SRTM real versionado tests/fixtures/terrain/N36W117_sub6.hgt. Limiares e posições pré-registrados em 92cd2bfd. Todos MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem a seção); os pontos de perfil e o obstáculo de cada posição iguais, e nu e perda dentro de { "1.6e-10" } (limiar { "1e-9" }); a perda nunca sobe quando o jammer sobe de { "2" } a { "4902" } m; a perda reduz cada J/S exatamente por si mesma e por nada mais; J(nu) a { "1e-12" } dB do da referência independente. Achados: posições através das montanhas Black e Funeral perdem { "44" } a { "48" } dB; duas posições no fundo do vale perdem { "8" } e { "15" } dB somente pelo abaulamento da Terra com antenas a { "2" } m de altura, o caso rasante do modelo de gume único. O QUE NÃO É VERIFICADO: qualquer propagação medida, difração em múltiplos gumes, reflexão no solo, desordem (clutter), o erro do próprio DEM. Um recálculo do mesmo modelo, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), contra xval/jamming-terrain/expected.json de xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Um recálculo independente em Python de cada flag de aquisição (xval/jamming-acq-agc/hysteresis.py) a partir do C/N0 efetivo por época do motor, um Monte Carlo independente em numpy da perda do quantizador (xval/jamming-acq-agc/quantiser_mc.py, com sua própria busca do passo ótimo, { "2" }^{ "22" } amostras), e o laço de AGC da camada IQ. Limiares pré-registrados em 70c72fcc, com um conjunto suplementar de execuções em { "37793290" }. MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem as seções); toda flag igual nas execuções suplementares ({ "1824" } enlaces, { "732" } deles mostrando a histerese); monótono no limiar; a perda do quantizador a { "0.0007" } dB do Monte Carlo com { "1" } a { "4" } bits (limiar { "0.02" } dB); a leitura de AGC a { "0.012" } dB do laço de AGC (limiar { "0.05" } dB). NOT MET: as execuções de histerese registradas (jamming-demo a { "10" } a { "30" } dBW) foram pouco informativas, com todos os enlaces perdidos, e seus H2 e H4 são atingidos apenas de forma trivial. Achado: com um jammer CW um ADC de 1 bit perde cerca de { "5" } dB a mais que a cifra gaussiana que o motor aplica, e é sinalizado como não válido. O QUE NÃO É VERIFICADO: a própria busca de aquisição, a dinâmica do AGC no tempo, qualquer hardware de receptor. Recálculos do mesmo modelo, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), contra xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json e expected_quantiser.json

# text
seg-19788df00e45 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Consistência interna contra a verdade injetada: uma fonte sintética GPS L1 C/A sem dados (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dez sementes de ruído) cuja fase da portadora é conhecida, sob limiares pré-registrados em 58789af0 (docs/design/evidence/fll-handover-floor/). MET: o controle (o padrão sem limite nunca faz a transferência em { "9" } de { "10" } sementes a { "33" } dB-Hz); aditividade (hash padrão e os testes de rastreamento existentes inalterados); captura inicial de uma transferência com { "100" } Hz de erro a { "45" } dB-Hz. NOT MET: com um limite de { "1.0" } s, transferência e retenção em toda execução ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; as demais alternam entre transferências forçadas e o retorno do FLL) e jitter de fase dentro de { "25" } % do PLL sozinho ({ "10.8" } contra { "6.1" } graus a { "33" } dB-Hz). O QUE NÃO É VERIFICADO: bits de dados, outros sinais e taxas de amostragem, gravações de campo. O padrão é inalterado; a linha permanece MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sobre tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: nenhum arquivo produzido pelo RTKLIB foi lido, e o layout de colunas vem do manual do RTKLIB. Verificado apenas em arquivos escritos pelo próprio autor; a conversão ECEF reutiliza frames::ecef_to_geodetic, que tem suas próprias linhas

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (épocas lat/lon, semana/TOW e ECEF, dms recusado, entrada hostil); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa como limiar de passagem. Os layouts de campos e o CRC seguem a documentação pública do OEM7 (docs.novatel.com); a rotina de CRC foi conferida uma vez com o CRC que a documentação declara para o seu próprio exemplo BESTPOSA (citado, não transcrito). As fixtures são escritas pelo próprio autor; nenhum log de um receptor real foi lido

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fixado, registros ASCII e binários, CRC inválido ignorado, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = verificado em relação a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — ReferenceImpl numa verificação avulsa, não num teste da suíte: o decodificador do pyrtcm { "1.2.0" } lê os mesmos quadros escritos pelo próprio autor e chega ao mesmo C/N0 e ao mesmo tempo de época. Ele compartilha a origem de suas tabelas com este leitor, de modo que verifica o tratamento de bits, não o layout. Nenhuma captura de um receptor real ou de uma estação base foi lida

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de verificação do catálogo CRC-24Q, C/N0 MSM4/MSM7 e fusão de épocas, tempo GLONASS e mapeamento de id SBAS, CRC inválido e outras mensagens)

# text
seg-15841bb986fe = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: os nomes dos campos vêm da documentação do GNSS-SDR; nem o leitor nem o relay.py foram executados contra um GNSS-SDR ao vivo ou uma captura real

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: o ajuste é verificado em logs sintéticos de ruído branco com coeficientes conhecidos, o rumo em logs de taxa de guinada constante. Nenhum log real de IMU foi ajustado, e q_aa não é ajustado

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes conhecidos de ruído branco recuperados dentro de { "10" } %, recusas, o TOML é analisado como AccelCfg); tests/receiver_trust_machines.rs (concordância e discordância de rumo, portadora em linha, imu_fit)

# text
seg-93283b08d1f9 = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: os pacotes foram lidos por um listener de loopback escrito para o teste, não por um broker real, e o Home Assistant não foi executado

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes dos pacotes, broker de loopback, broker morto contado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = verificado em relação à sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficiente, mas não é uma referência independente externa — Nenhuma externa: o nó ROS não foi executado num grafo ROS { "2" } ao vivo, e os nomes de campos de ublox_ubx_msgs não foram conferidos contra um driver em execução. O gnss_lib_py (MIT) foi executado para o teste da ponte

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: o formato que a ponte gnss_lib_py escreve, executado por receiver-trust); os testes Python das pontes são integrations/ros2/kshana_trust/test/test_bridge.py (ponte com um motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (o wheel real pontua uma solução estável como nominal e um salto de { "1.1" } km como não confiável) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } e o wheel), executados com pytest, não por cargo

# text
seg-e7d71a9d77a6 = { "208" } capacidades rotuladas MODELLED.

# text
seg-7a0503f925c1 = <s1>Anterior</s1>Referência de capacidades

# text
seg-b5832e94f926 = <s1>Próximo</s1>Afirmações confrontadas com a realidade
