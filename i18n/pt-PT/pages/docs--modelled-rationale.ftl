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
seg-ab633d191396 = PSD de BPSK-R/BOC, separação espetral κ, largura de banda de Gabor, jitter do DLL, multipercurso

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
seg-4d9690207607 = inertial::cai_error_terms (funções de biblioteca, ainda não acessíveis a partir de um tipo de cenário): a função de ponderação da fase Raman de um interferómetro de três pulsos de pulsos quadrados (Cheinet et al. { "2008" }, Eq. { "8" }) com a forma fechada de fase branca (pi/2)^{ "2" } S_phi0/tau_R e um caminho numérico para qualquer espetro; o ruído de frequência do laser que o atraso da retrorreflexão não cancela (Le Gouet et al. { "2007" }, Eqs. { "9" } a { "11" }); o viés de frente de onda de desfocagem pura sigma_v^2/R de uma nuvem térmica e a sua redução por um raio de deteção; a probabilidade de índice de franja errado erfc(pi/(sqrt({ "2" }) s)) para um auxílio de acelerómetro clássico e para dois tempos de interrogação, e a sua inversa

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
seg-f134975d4ffa = Cascata de espetro em banda L com J/S por banda e C/N0 efetivo sob uma cronologia de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = O tipo de cenário <c1/>: uma grelha frequência por tempo da densidade espetral de potência em banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais às suas potências mínimas recebidas da especificação de interface, e jammers de onda contínua, de banda estreita, chirp e de ruído adaptado com instantes de ligar/desligar), cada célula com a média sobre o seu intervalo e linha (chirps exatamente sobre varrimentos completos e parciais, jammers pelo ciclo de trabalho), C/N0 efetivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por linha, J/S por banda, J/S em banda e uma cascata SVG com barras de C/N0. O relatório inclui uma verificação cruzada com a cadeia do tipo de cenário <c2/> nas mesmas entradas de ligação

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
seg-c0ba5c7e708e = O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição ITU; componentes de aquisição, de dados e piloto com espetros BPSK(n), BOC(m,n), MBOC ou planos, partilhas de potência, subportadoras FDMA, comprimentos de código e taxas de dados) a partir de ficheiros de predefinições públicas compilados (Xona Pulsar, Iridium STL, sinal de oportunidade Starlink, CentiSpace, um projeto genérico de banda C e projetos genéricos UHF/L/S/C/C larga, cada um com o seu URL de fonte e os valores não publicados etiquetados REPRESENTATIVE) ou escritos em linha; por sinal a densidade espetral de potência de banda limitada, as frações de potência em banda, a largura de banda de Gabor, o jitter de código face a C/N0 e espaçamento e a exatidão de medição de distâncias, o espaço de busca de aquisição, a probabilidade de deteção de lei quadrática e o tempo médio de aquisição serial e paralela de código, o coeficiente de separação espetral para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a degradação de C/N0, e a tolerância de J/S CW, de banda larga e adaptada a partir da cadeia SSC do tipo de cenário spectrum; um compromisso de banda de atraso ionosférico, perda em espaço livre, exatidão de medição de distâncias a C/N0 igual e EIRP igual e tolerância a jammers; e verificações qualitativas de forma de um projeto face a uma medição descrita

# text
seg-c2b9c8e4a364 = Cascata de espetro multibanda (UHF, L, S, C) com sinais projetados e jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = O tipo de cenário <c1/> alargado para além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com cada componente, de banda limitada à largura de banda de transmissão, C/N0 e J/S referidos à componente seguida) ou como uma portadora e modulação personalizadas; painéis de cascata adicionais sobre qualquer intervalo de frequências na mesma cronologia e escala de cor; um jammer de banda larga (barragem) ao lado de ruído CW, de banda estreita, chirp e adaptado; J/S por banda e C/N0 efetivo a partir da cadeia inalterada do coeficiente de separação espetral

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
seg-2fdcb373ab25 = iq::channel::scint, o modelo de cintilação de Cornell (intensidade de Rice, espetro de Butterworth de segunda ordem, fase arg z) conduzido com o S4 e o tempo de decorrelação da intensidade de uma janela medida, comparado naquilo que gera para além dessas duas entradas; realdata::scint50 lê o registo medido, retira-lhe a tendência e executa a comparação.

# text
seg-160507ac3702 = Opção CFAR de média de células na aquisição IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar e ca_cfar_cells (opcional): uma célula de uma grelha de aquisição é comparada com a média de células de referência da sua linha de Doppler (desfasamentos de guarda e de passo, a dar a volta ao período), com um fator alpha definido a partir da probabilidade de falso alarme CA-CFAR em forma fechada para M blocos não coerentes (ca_cfar_pfa, ca_cfar_alpha). O detetor de potência de amostra continua a ser o predefinido e todas as saídas existentes permanecem inalteradas.

# text
seg-5bd3bf0c22a7 = Modelo de espetro: bandas GLONASS, BeiDou e Galileo E6 (opcional)

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

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Fonte: <c1/>

# text
seg-34d1304c9555 = Capacidades modeladas — justificação

# text
# c1: ExternalDataset
seg-144f441bf52b = Estas capacidades estão implementadas a partir de física publicada ou de primeiros princípios, com testes, mas estão <b>honestamente etiquetadas MODELLED</b> — não verificadas face a uma referência independente externa até uma tolerância declarada. Os testes de invariantes da matriz garantem que apenas as linhas apoiadas por <c1/> podem ser VALIDATED, pelo que nada aqui pode ser promovido em silêncio. Cada linha indica porque permanece modelada.

# text
seg-0630e39b4de3 = Tipo de referência independente

# text
seg-bb023086bbe3 = Porque permanece modelada

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: o Orekit { "12.2" } não tem razão de iluminação com escurecimento de limbo. Verificado apenas face a formas fechadas da mesma lei

# text
seg-33d506570c1b = srp_shadow::tests (a forma fechada anular, a lei uniforme que reproduz a sombra cónica, limites de pleno sol e de umbra)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com ThirdBodyAttraction e SolarRadiationPressure sobre o leitor DE440 do próprio Orekit (orekit-data lnxp1990.440), executado como programa separado; o kshana lê um recorte do NAIF de440s.bsp, idêntico bit a bit e verificado por SPICE. Limiares pré-registados em xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). O limiar de órbita ({ "0.5" } m) e o controlo de sensibilidade são atingidos, mas o limiar de posição do Sol/Lua ({ "3" } m / { "0.2" } m) falhou com { "6.39" } m / { "0.244" } m. O SPICE a ler o mesmo kernel ao seu TDB exato falha o Orekit pela mesma margem ({ "6.25" } m / { "0.240" } m), pelo que a diferença está entre o caminho de440s do NAIF e o leitor DE440 ou a escala de tempo do Orekit; causa não isolada. Registado e fixado, pelo que a linha permanece MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horários ao longo de { "24" } h, LEO, GEO e HEO, terceiro corpo e terceiro corpo + SRP: pior |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; o controlo de série analítica falha por { "9.96" } m; Sol { "6.39" } m e Lua { "0.244" } m a partir das posições DE440 do Orekit, uma falha registada); testes unitários do propagator (recusa do fornecedor, contagem de recurso partilhada entre clones)

# text
seg-b55bcab6f986 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa para o efeito do geopotencial. Os { "24" } coeficientes são transcritos da Tabela { "1" } do GFZ STR06/01, modelo N1, e foram reverificados linha a linha face ao relatório (SHA-256 890865ae); os graus { "0" }, { "1" }, { "7" } e { "8" } não são usados. Ray e Ponte ({ "2003" }) não imprimem nenhuma tabela de harmónicos esféricos, pelo que não foi comparada nenhuma segunda fonte

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (o termo S1 é diurno, roda { "90" } graus num quarto de dia e tem a amplitude do fator de carga de cada linha; magnitude física em LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel e pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, executados como programas separados; limiares pré-registados em xval/high-degree-gravity/PREREGISTRATION.md (276c869f) e xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). O Orekit concorda em todo o lado onde está definido, mas o pyshtools falha o seu limiar pré-registado nos dois pontos próximos do polo (até { "7.3e-10" } m/s^{ "2" }; uma verificação mpmath com 50 dígitos põe o erro no pyshtools), não há valor da referência exatamente sobre o eixo polar, e o controlo de sensibilidade pré-registado de grau 70 da órbita de { "24" } h falhou ({ "0.726" } m face a > { "1" } m). Cada falha é registada, não afinada para desaparecer, pelo que a linha permanece MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit em { "8" } pontos fora do eixo: máx |da| { "2.2e-17" } m/s^{ "2" } com N = { "70" }, sempre executado; { "3.5e-17" }, { "3.9e-17" } e { "7.3e-17" } m/s^{ "2" } com N = { "200" }, { "360" }, { "2190" }, condicionado por dados em KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada por dados: pior |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; controlo de grau 70 { "0.726" } m); testes unitários de gravity_sh (concordância com o avaliador clássico até { "1e-13" } no grau { "70" }, diferença finita e continuidade no polo num campo de grau 2190, um termo de grau 2190 com subdepassamento face a um cálculo com expoente alargado)

# text
seg-84a9851b838c = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Orekit { "12.2" } (Apache-2.0) BatchLSEstimator com medições geométricas instantâneas personalizadas de RangeRate e AzEl (verificadas cruzadamente com o TopocentricFrame do Orekit), executado como programa separado sobre observações idênticas, mascaradas e com semente. Limiares pré-registados em xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Todos os limiares atingidos exceto B4, a concordância de estado sem ruído de { "1" } cm, falhada em { "2" } de { "4" } cenários ({ "1.46" }, { "1.74" } cm): a própria estimativa sem ruído do Orekit está tão afastada da sua referência simulada (causa do lado do Orekit não isolada). Registado e fixado, pelo que a linha permanece MODELLED. Não modelados: tempo de luz, aberração, refração, rotação da Terra, um filtro sequencial para estes tipos de medição

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } cenários: range-rate, az/el e misto, LEO e MEO, sem ruído e com sigma com semente { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } e { "10" } graus, face ao Orekit { "12.2" }: conjuntos visíveis idênticos; valores de medição a menos de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM a menos de { "1.2e-14" } relativo; estados com ruído a menos de { "1.74" } cm e { "1.14e-5" } m/s; RMS pós-ajuste por tipo a menos de { "2.7e-4" } relativo; kshana sem ruído face à referência { "1.06e-8" } m; kshana sem ruído face ao Orekit { "1.464" } e { "1.740" } cm em dois cenários, uma falha registada do limiar de { "1" } cm); testes unitários de orbit_determination e batch_ls

# text
seg-a5554f29b2d7 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: os pesos são uma escolha de modelação (o formato SP3 define o código apenas como o indicador de exatidão do produtor; aqui é lido como um desvio-padrão por eixo). As execuções de agências já registadas não se alteram

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = testes unitários de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (ficheiro de ensaio ESOC de { "8" } h submetido, sigma { "0.032" } m a partir do expoente de cabeçalho { "5" }: RMS 3D do nível 1 { "0.132" } m inalterado, nível 2 { "0.035" } m face a { "0.070" } m com sigma { "1" } m, vindo a alteração da restrição empírica a priori reequilibrada); tests/agency_swarm.rs (o produto Swarm não traz códigos de exatidão e recorre à alternativa, fixado)

# text
seg-a5ad470a4816 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas consistência interna. Cada campo publicado é definido no referencial solidário com o corpo do seu produtor (GMM-3 no referencial de Marte de Konopliv et al. { "2006" }, GL0660B no referencial de eixos principais lunar do DE421), enquanto o campo é avaliado no referencial IAU; o desvio não é modelado

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Ida e volta interna e respostas conhecidas do ICD; nenhum descodificador de terceiros foi executado (o conjunto de teste RTKLIB/GNSS-SDR que lê KSHANA_NAVMSG_ORACLE_JSON é condicionado por dados). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de verificação do CRC-24Q 0xCDE703; resposta impulsional convolucional; o Viterbi corrige erros injetados; larguras da disposição); tests/gnss_navmsg_roundtrip.rs (os bits de início dos campos igualam os números de bit do ICD; codificar -> FEC -> entrelaçar -> Viterbi -> descodificar ida e volta a menos de meio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registos Galileo IGS BRDC 2018-133 na grelha de LSB, pior { "3.6e-3" } LSB; limiar pré-registado de contagem de satélites falhado, { "15" } de { "20" }, FINDING)

# text
seg-81b76a6d1bcd = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — FINDING face à coordenada WTZR ITRF2020 publicada: os limiares pré-registados (mediana e p95 suavizados no máximo { "0.6" } x o bruto; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) foram falhados, com razões { "0.718" } e { "0.923" }; o erro residual ao nível do metro é do tipo desvio (viés do código C1C, antena, maré, multitrajeto de período longo), não o ruído branco que a suavização remove. MODELLED: as estatísticas do filtro são verificadas internamente

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (passagem sem ruído; variância de ruído branco 1/(2N-1); reinícios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: erro 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Aderência à norma do formato num ficheiro RINEX { "4.00" } real publicado (os valores lidos de volta igualam os literais impressos no ficheiro) e um cabeçalho derivado da especificação; nenhum leitor independente foi executado, pelo que MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeiras { "4" } épocas do ficheiro IGS MGEX RINEX { "4.00" } MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: os registos do cabeçalho e os valores da primeira época igualam os literais publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabeçalho sintético { "4.02" } a partir da especificação)

# text
seg-5afb3c4bf171 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Pré-registado (7aa264b, 110fef9) face a uma órbita precisa IGS MGEX com os GEO; nenhum produto desse tipo estava acessível a partir da sessão que o construiu, pelo que a comparação está pendente e a linha é MODELLED (verificada apenas face às posições GEO nominais publicadas)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registos reais C01-C04: raio geoestacionário, longitudes 140.02/80.04/110.55/159.99 graus nas posições publicadas, |latitude| { "2.13" } graus com a inclinação contra { "6.65" } sem ela; a comparação pré-registada entre SP3 difundido e preciso é condicionada por dados em KSHANA_BDS_GEO_SP3 e não foi executada); rinex::tests

# text
seg-70f61250d256 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: as medições são sintetizadas a partir dos modelos que o filtro usa (NEES/NIS de χ² sobre sementes, uma convergência sem ruído, injeção de saltos de ciclo). MODELLED; não é comparado nenhum dado de recetor real nem filtro de terceiros

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (percurso em figure-8: RMS 3-D estacionário de { "0.025" } m com portadora contra { "0.470" } m com código nas mesmas medições; { "12" } sementes, NIS/gl médio { "1.00" } e NEES/gl estacionário { "0.92" }; um salto de 1 ciclo detetado na sua época sem falsos alarmes e com a solução intacta; desligar as correções difundidas faz subir o erro de código de { "0.51" } m para { "19.6" } m (iono) e { "8.0" } m (tropo); a execução sem ruído converge para { "0.3" } mm)

# text
seg-6f3f6483690e = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Interno: as figuras de mérito de cada pacote face à sua própria referência e uma comparação solto/apertado sobre entradas idênticas. MODELLED; a comparação NaveGo da auditoria não foi executada

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), cenários gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada pacote: fundido abaixo do INS livre durante a falha para ambos os sensores; ferroviário: apertado { "5.3" } m contra solto { "12.9" } m de classe de navegação e { "15.6" } m contra { "18.8" } m de classe tática durante a falha, disponibilidade { "0.97" } contra { "0.95" }; tabela apertada validada); tests/gnss_ins_legacy_trajectory_pin.rs (a predefinição de acoplamento solto idêntica bit a bit)

# text
seg-2c7c37506aab = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: referência simulada a partir dos modelos próprios dos filtros (NEES de χ² sobre sementes de Monte Carlo, o pacote desacoplado sobre sensores idênticos). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D sobre { "60" } sementes: NEES médio da segunda metade { "8.12" } para { "8" } estados, soma de χ² da última época dentro da sua banda de { "95" } %; uma correção de relógio de { "0.1" } ns reduz o sigma de posição 3-D de { "5.58" } m para { "3.07" } m; filtro de desvio sobre { "60" } sementes: soma de χ²({ "5" }) dentro da banda, desvio dentro de { "3" } sigma em { "59" } de { "60" }; fusion-pnt-coupled com acelerómetros com desvio: p95 de posição { "18.7" } m / { "90.0" } m e integridade { "1.00" } / { "0.97" } acoplado contra { "430" } m / { "4060" } m e { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sem [coupled] idênticos bit a bit)

# text
seg-0866862d2264 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Interno: identidades de cinemática de corpo rígido, a ida e volta em CSV e a própria covariância do filtro. MODELLED (não é comparado nenhum registo de percurso real)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (a viragem coordenada não tem força lateral e tem fator de carga 1/cos φ; a importação de CSV reproduz um perfil voado a { "1e-3" } m/s e { "1" } m); tests/gnss_ins_trajectory_library.rs (todos os perfis são executados e a fusão supera o INS livre durante a falha; cada um voa o seu movimento nomeado; observabilidade do rumo: sigma de guinada após { "240" } s { "1.27" } graus em cruzeiro em linha reta contra { "0.039" } graus em figure-8 e { "0.062" } graus em arranca-e-para); tests/gnss_ins_legacy_trajectory_pin.rs (resultado herdado e hashes da referência idênticos bit a bit)

# text
seg-5cb3b7bba7be = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Medido face às efemérides reconstruídas CAPSTONE do JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado na Lua, 2023-03-01..31 a { "10" } min), submetidas byte a byte (tests/fixtures/capstone_horizons/, NOTICE.md), pré-registado { "4e868170" } antes de serem obtidas, como uma medição com limiares sobre a geometria média. Não é uma validação: o CR3BP omite o Sol, a excentricidade da Lua e a manutenção de posição que o CAPSTONE realizou, pelo que os limiares descrevem quão representativa é a órbita do modelo, não uma exatidão. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE março de { "2023" }, { "4" } perilunas e { "5" } apolunas: período { "6.5004" } d contra { "6.5699" } d ({ "1.07" } %, limiar { "3" } %), apolua { "71 182" } contra { "71 215" } km ({ "0.05" } %, limiar { "5" } %), perilua { "3 385" } contra { "3 245" } km ({ "4.1" } %, limiar { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna face a uma forma fechada: sob o modelo gaussiano linear, a covariância de mínimos quadrados é sigma^{ "2" } (H^T H)^-1 (Kaplan e Hegarty (eds.), Understanding GPS: Principles and Applications, 2.ª ed., Artech House, { "2006" }, cap. { "7" }). Método e tolerâncias da nota de conceção de geometria de { "0.36" }, secção { "5.2" }, fixados num commit de pré-registo antes da primeira execução: cada variância a menos de { "5" } % ({ "5" } erros-padrão de uma variância amostral com N = { "20,000" }), cada RMS a menos de { "2.5" } %, a correlação este-norte a menos de { "0.035" } (5/sqrt(N)), cada média a menos de { "5" } erros-padrão, a fração da elipse de { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } erros-padrão binomiais); os controlos negativos (PDOP duplicado; erros a crescer como 1/sin(elevação) face ao Q não ponderado) têm de falhar. COMO SE COMPÕE: Q é o fator de covariância do núcleo orbit::dop, VALIDATED face ao gnss_lib_py { "1.0.4" } nestas mesmas { "8" } geometrias em tests/dop_reference.rs (linha 'GNSS geometry / dilution of precision'); esta linha acrescenta o passo desses fatores para metros através do solucionador do motor e não toma emprestado o estado daquela linha. PORQUE É MODELLED: não está envolvido nenhum conjunto de dados externo; a concordância mostra que o estimador e o ruído realizam sigma x DOP sob o modelo de manual, não que o erro de qualquer recetor seja igual a UERE x DOP, e sigma_UERE é uma entrada

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: todas as { "104" } verificações passam na primeira execução após o pré-registo e50c88d2, pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros-padrão, fração da elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos os controlos falham como exigido; position_error_is_sigma_times_dop_on_masked_skies: as duas geometrias de linha do horizonte mascarada da nota de conceção, o céu 10sat-mixed sob as predefinições city-street ({ "4" } satélites, PDOP { "16.6" }) e container-terminal ({ "9" } satélites, PDOP { "2.5" }), todas as { "26" } verificações passam na primeira execução após o pré-registo 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (uma primeira verificação, separada, em quatro céus escolhidos à mão (aberto, concentrado, desfiladeiro, meio céu; sigma { "1" } m, semente 0x0D0B5EED) com intervalos de confiança de qui-quadrado a { "1e-6" } no total sobre { "20" } verificações: razões de { "0.987" } a { "1.009" }, o PDOP/GDOP do próprio solucionador igual ao do núcleo até { "2.5e-12" }, e controlos negativos para um erro de DOP de { "10" } % e erros de 1/sin(elevação); executada antes do pré-registo, pelo que é registada, não pré-registada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-d40d54b79e58 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a classificação é verificada face às regras que declara e face a razões derivadas à mão em edições sintéticas do registo de demonstração submetido, e as fixações de ausência de alteração mantêm as saídas de { "0.35.0" }: nenhuma pontuação muda a menos que a geometria seja fraca; a etiqueta é sempre indicada. PORQUE É MODELLED: os limiares são escolhidos, não ajustados (proveniência no geometry_model de cada execução; os valores da IEC 61108-1 e do GPS SPS tal como citados, a verificar face ao texto das normas), e não existe nenhum conjunto de dados externo etiquetado de degradação natural da geometria face a ataques com que validar a classificação. O DOP derivado reutiliza o núcleo orbit::dop, VALIDATED face ao gnss_lib_py, cujo estado esta linha não toma emprestado. Uma classe de geometria é uma afirmação sobre o céu, não uma conclusão de que não ocorreu nenhum ataque

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: na travessia sintética de fiorde de scenarios/training/fjord-natural-degradation.toml as mesmas { "624" } épocas são deduzidas com e sem o [skyline] declarado; com ele, sky-blocked é indicado em { "680" } épocas ({ "0" } sem ele: o recurso à lacuna de azimute não vê nada num fiorde de dois lados), open_fraction é { "0.758" }, e as épocas de classe ambiente descem de { "78" } para { "33" }, sendo as restantes perdas de satélites que o skyline declarado deixa a céu aberto; fora do evento o skyline não altera nenhuma pontuação); receiver_trust::geometry::tests (razões derivadas à mão nos limiares, os limites dos limiares, a rampa e o limite máximo, o piso, os limites das etiquetas, substituições de [geometry], o DOP sobre o núcleo validado, céus retidos e expirados, desconhecido não adivinhado, perda de sinal, a tolerância de geometria fraca, sentinelas de ausência de solução de posição); tests/geometry_trust.rs (um céu mascarado razoável etiquetado e não pontuado, um céu mascarado fraco, uma perda a baixa elevação, uma queda de potência, um HDOP falsificado, perda total de sinal, um arrastamento durante geometria fraca, geometria desconhecida, substituições de sessão, o esquema em direto); tests/geometry_trust_no_change.rs (as duas sessões de exemplo idênticas byte a byte a { "0.35.0" } depois de removidas as chaves acrescentadas); tests/geometry_corpus_identity.rs (todos os corpora NMEA de embarcação submetidos, também como céu aberto só GPS, e os cenários de formação de tripulações: idênticos byte a byte a { "0.35.0" } exceto as épocas fracas, que diferem apenas pela dedução de geometria)

# text
seg-7e9cae219d72 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Interno: as formas fechadas são verificadas face a valores calculados à mão (elevações do topo das paredes de uma rua declarada, a condição de extremidade aberta, a queda por curvatura de um ponto declarado). Sem referência independente externa: a nota de conceção delimita estas reduções como MODELLED, e o ElevationMask do Orekit recebe uma tabela, pelo que a comparação da linha 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' lê as suas tabelas de 360 pontos como entradas e não as verifica

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma: dimensões escolhidas e declaradas, não um levantamento de nenhuma rua, porto, fiorde ou terminal (a razão de aspeto da rua está dentro da banda 0.5-2 de Oke ({ "1988" }); o fiorde é da ordem dos fiordes do oeste da Noruega; as pilhas usam a altura high-cube da ISO { "668" }). O teste verifica as predefinições face às suas próprias dimensões declaradas, uma verificação de transcrição, que a regra de validação não conta

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Os fatores de DOP de relógio único assentam no núcleo validado face ao gnss_lib_py { "1.0.4" } (linha 'GNSS geometry / dilution of precision (DOP)'); as verificações desta linha são internas: sky_geometry reproduz orbit::dop e dop_cov na mesma geometria, a elipse reproduz uma decomposição própria analítica 2x2, as entradas ECEF e de azimute/elevação concordam, e o RMS da nuvem com semente e a contenção de { "95" } % concordam com a geometria. A covariância ENU com um relógio por sistema e a elipse são VALIDATED na linha 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); o que aqui permanece MODELLED é a composição: a propagação de predefinições até um céu representativo, a nuvem de Monte Carlo (verificada face à geometria que amostra, uma verificação de autoconsistência) e as superfícies. As predefinições de constelação dão um céu representativo, não um céu datado; o modelo de erro gaussiano e o UERE são entradas declaradas, não uma exatidão medida nem um limite de integridade

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (o núcleo de relógio único face ao gnss_lib_py)

# text
seg-0b5caf359b15 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — Recursão da covariância de clock_state em vários passos (verificação cruzada na mesma base de código); o núcleo subjacente de variância de deriva e de inversão de holdover é validado externamente face ao scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com piso de ruído vermelho permanecem MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (face à recursão de covariância de Kalman em vários passos; white-FM exato; ida e volta); núcleo de variância de deriva validado externamente em tests/gnss_denied_clock_holdover_reference.rs (face ao scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Registos medidos, reservados: relógios combinados finais IGS de { "30" } s dos { "11" } satélites GPS Block IIF entre 2026-03-01 e { "14" } (uma janela que nenhum teste tinha aberto; IGS, aberto com atribuição) e o recetor u-blox ZED-F9P do JammerTest { "2024" } nas suas sessões estacionárias não pontuadas (GPL-3.0-or-later). Comparação externa D9 (pré-registada 2ec76864, desvio de Allan previsto / medido de cada cartão dentro de [1/1.5, { "1.5" }] nos seus tempos de média ajustados), uma constatação (permanece MODELLED): { "10" } de { "11" } cartões GPS IIF estão dentro do limiar; o G27 é otimista à escala de duas horas ({ "0.662" } a { "7680" } s, pior fator { "1.510" }), o erro periódico à escala da hora que um cartão de lei de potência não traz. O cartão de TCXO do recetor está bloqueado: fora das transmissões registadas, as outras sessões do conjunto de dados deixam { "167" } épocas face às { "3600" } exigidas. Indicado, não cego (registos abertos por linhas anteriores): o cartão de césio 5071A está dentro do limiar (pior { "1.070" } até { "4096" } s), o cartão OCXO é conservador e está fora dele ({ "2.348" } a { "128" } s; o seu piso de ruído muda durante o registo) e o cartão de estrôncio de Norcia ajustado aos três pontos publicados mais curtos está dentro dele nos dois pontos pontuados ({ "1.291" }, { "1.405" }). Os masers de hidrogénio passivos do Galileo (não há fonte acessível sem login de relógios finais do Galileo) e o Deep Space Atomic Clock (um valor aberto no espaço) estão bloqueados. D9 ronda { "2" }, o TCXO do recetor ZED-F9P como classe de modelo em { "14" } dias de { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; pré-registada fb475550), uma constatação: com o encadeamento registado, { "11" } de { "12" } estações não foram avaliáveis (o RAIM rejeitou a maioria das épocas livres de ionosfera) e a BX14 falhou; uma nova execução divulgada com um encadeamento corrigido (pré-registada c9cc0d49) passa { "1" } de { "11" } estações cegas (BX12, { "1.412" }; BX07 { "1.532" } e BX13 { "1.542" } logo fora), porque os relógios de recetor de ponto único a partir de ficheiros intermitentes de { "30" } s não são um registo limpo de oscilador

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pré-registada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; condicionado por dados)

# text
seg-a2202f0e06b2 = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Registos medidos, reservados: relógios combinados finais IGS de { "30" } s dos { "11" } satélites GPS Block IIF entre 2026-04-01 e { "14" } (uma janela que nenhum teste tinha aberto; IGS, aberto com atribuição). Comparação externa D9 (pré-registada fb475550, desvio de Allan previsto / medido dentro de [1/1.5, { "1.5" }] em todos os tempos de média ajustados de todos os satélites), uma constatação (permanece MODELLED): { "9" } de { "11" } cartões estão dentro do limiar; o G03 ({ "1.947" }) e o G25 ({ "1.581" }) são otimistas entre { "60" } s e { "2000" } s porque os seus registos reservados são mais ruidosos do que os seus terços de ajuste (a parte reservada do G25 traz { "16" } lacunas e { "29" } valores atípicos de fase), uma alteração do relógio e não um termo periódico em falta. Retirar os termos periódicos da previsão faz falhar todos os { "11" } cartões ({ "1.77" } a { "4.96" }), pelo que os termos sustentam a previsão

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pré-registada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa — filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), com F através de scipy.linalg.expm e Q através da matriz por blocos de Van-Loan { "1978" } — uma implementação de referência independente que reproduz toda a trajetória do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, pelo que permanece MODELLED. Comparação externa de { "0.30" }, uma constatação (permanece MODELLED): em relógios finais IGS de { "30" } s de { "11" } satélites GPS Block IIF (2025-08-17 a { "30" }), com Q ajustado ao ADEV da primeira metade e o filtro pontuado na segunda metade reservada, o filtro é consistente um passo à frente (de { "0.906" } a { "0.971" } das épocas dentro da sua banda de { "95" } %, limiar { "90" } %) mas excessivamente confiante a uma hora em { "9" } de { "11" } relógios (de { "0.486" } a { "0.829" }) e as suas somas de inovação ficam fora de [{ "2.4" }, { "3.6" }] em { "5" }. O ruído de fase branco ajustado é zero em todos os satélites, e o erro à escala da hora (termos periódicos, flicker FM) não está no modelo de 3 estados. { "0.30" } ronda { "2" }, um filtro alargado (flicker FM e estados de uma e de duas vezes por revolução) em relógios IGS reservados novos de 2025-09-01 a { "14" } (pré-registado 4b1a841e), uma constatação (permanece MODELLED): os critérios de consistência a um passo e a uma hora verificam-se em todos os { "11" } satélites (de { "0.948" } a { "0.988" } e de { "0.907" } a { "0.996" }), mas o critério da soma de inovação falha no G24 ({ "0.964" }) e no G30 ({ "1.929" }) face a [{ "2.4" }, { "3.6" }]. D9 ronda { "3" }, o filtro alargado da ronda 2, com afinação e critérios inalterados após o detetor de condicionamento clock_library congelado, em relógios IGS novos de 2026-04-01 a { "14" } (pré-registado fb475550), uma constatação (permanece MODELLED): (a) um passo de { "0.941" } a { "0.968" } e (c) média do NIS triplo de { "2.641" } a { "3.549" } verificam-se em todos os { "11" } satélites; (b) uma hora falha no G09 ({ "0.894" }) e no G26 ({ "0.876" }) face a { "0.90" }

# text
seg-3016100a7015 = clock_state::tests (Q de van-Loan analítico; NEES; positividade da PSD); tests/clock_state_reference.rs (trajetória completa de previsão + atualização — estado x e covariância P de { "3" }×{ "3" } ao longo de { "1925" } passos / { "4" } conjuntos de parâmetros face ao filterpy { "1.4.5" }; pior |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fixa a constatação); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ronda { "3" })

# text
seg-27554b73549b = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Magnitude de Sagnac verificada face a um VALOR PUBLICADO com autoridade — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pela geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O orçamento composto BIPM TWSTFT de transponder/vista comum/PPP não tem referência independente externa, pelo que a capacidade permanece modelada

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelamento recíproco; identidade de Sagnac de duas formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circum-navegação equatorial = { "207.386" } ns face ao valor publicado de Ashby { "207.4" } ns a menos de <{ "0.05" } ns; mais a geometria de Sagnac/geodist verificada cruzadamente com a geodist() do RTKLIB { "2.4.3" } compilada a partir de código-fonte C)

# text
seg-a5714c98b299 = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — A correlação cruzada/autocorrelação de Gold do GPS C/A coincidiu EXATAMENTE (inteiros ±65/−1/63) com a geração de códigos independente do IS-GPS-200; a forma da PSD de BPSK-R({ "1" })/BOC({ "1,1" }) face a um periodograma independente em scipy. As formas fechadas de modulação/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) permanecem analíticas, pelo que a linha permanece MODELLED — mas a subalegação de correlação de código é correspondida externamente. { "0.30" } ronda { "2" }, face aos valores impressos de Betz { "2001" } e de Hein et al. { "2006" } (pré-registada 9f4f2ce8, meia unidade impressa), uma constatação (permanece MODELLED): todas as { "45" } células espetrais da Tabela { "1" }, os valores de correlação a { "1" } GHz, os valores de interferência MBOC e { "2" } de { "3" } desvios da Fig. { "17" } concordam; os primeiros lóbulos laterais a { "24" } MHz, o desvio da Fig. { "17" } de BOC({ "8,4" }) e todos os desvios de multitrajeto do pior caso das Figs. 18-21 (de { "11" } a { "15" } % abaixo) não concordam. O Kshana e uma avaliação independente em NumPy da leitura pré-registada concordam, pelo que a diferença está nessa leitura ou num pormenor não declarado do artigo; causa por resolver

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (auto-SSC de BPSK = 2/3R_c; PSD de área unitária; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (correspondência exata em inteiros da correlação cruzada/autocorrelação de Gold do GPS C/A face à geração de códigos independente do IS-GPS-200; PSD de BPSK-R({ "1" })/sine-BOC({ "1,1" }) face a um periodograma independente em scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fixado)

# text
seg-9fe0ec8c4531 = uma subalegação é verificada externamente, mas toda a capacidade compõe peças modeladas, pelo que a capacidade permanece modelada — Vetores numéricos publicados do artigo principal de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincidiu exatamente, a ASD do ruído de disparo é um piso unilateral a menos de ~{ "2" }× de cada instrumento publicado (os dispositivos reais trazem ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } ronda { "2" } (pré-registada fcb9ac64), uma constatação (permanece MODELLED): o ruído de rotação apenas QPN face aos pontos medidos da Fig. { "14" } de Gauguet et al. { "2009" } dá razões de { "0.695" } a { "0.788" } nos três pontos admitidos ({ "0.751" } no ponto de funcionamento), falhando o limiar pré-registado de { "30" } % por { "0.5" } pontos; o piso QPN fica { "21" } a { "31" } % abaixo do ruído medido, como esperado de um modelo sem ruído de laser e de deteção. A composição do gradiómetro coincide com a linha do modelo QPN de Janvier et al. { "2022" } (razão { "1.013" } a { "1.017" }, Referência). O teste medido não consegue discriminar um erro de composição de sqrt({ "2" }); só a linha de Janvier com contraste desigual o consegue

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; limite inferior de Freier-2016 como intervalo); tests/quantum_inertial_sensor_reference.rs (função de transferência |H(ω)|, k_eff·T² e ASD de ruído de disparo face aos vetores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fixado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Autoconsistência do modelo de franjas do interferómetro: o limite da meia franja, a estrutura de aliasing periódica em 2π e o cancelamento do fator de escala na razão alcance/resolução são identidades algébricas de forma fechada verificadas face às funções de fase e de sensibilidade de Mach–Zehnder do próprio motor — verificações de consistência interna, NÃO um conjunto de dados externo, pelo que a linha continua a ser InternalConsistency. Ambiguidade de franja ideal de três impulsos MODELLED; sem limites para a aberração de frente de onda nem para a perda de contraste no alcance não ambíguo

# text
seg-81802510f112 = quantum_imu::tests (a_max situa-se no limite de meia franja ±π com o escalonamento de alcance 1/T²; a recuperação da fase enrolada é exata dentro de [−a_max,a_max] e produz aliasing de exatamente { "2" }·a_max fora dele; o alcance dinâmico não ambíguo a_max/σ_a=π/σ_Φ é idêntico para dois fatores de escala de comprimento de onda/T muito diferentes; os métodos de CaiAccelerometer coincidem com as funções livres)

# text
seg-91728172ea50 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Integração SDE de Monte-Carlo independente em numpy do ruído de aceleração branco duplamente integrado (valida a variância VRW analítica por um algoritmo genuinamente independente) + uma âncora de valor publicado de Groves { "2013" } para os termos de enviesamento/fator de escala; os números do dispositivo CAI quantificam hardware do parceiro e continuam MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (enviesamento face ao integrador AccelModel; VRW face ao integral analítico); tests/quantum_inertial_dead_reckoning_reference.rs (VRW face a uma dupla integração de Monte-Carlo independente em numpy do ruído de aceleração branco, pior desvio { "0.42" }% dentro de ±{ "3" }% ao longo de { "6" } tempos de deriva livre; enviesamento/fator de escala face a um valor de forma fechada de Groves { "2013" }; ciclos completos de holdover)

# text
seg-8bc5bc7d553c = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Equação do orçamento de ligação C/N₀ antiinterferência verificada por confronto com uma nova derivação independente em numpy (partilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } ronda { "2" }, bloqueada (continua MODELLED): a queda de C/N0 medida no JammerTest { "2024" } face a uma previsão do orçamento de ligação (pré-registada 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e a orientação da antena F8.1 em Bleik e a parte L1 da potência da rampa multibanda { "1.6.4" } não estão documentadas no catálogo de testes nem no registo oficial

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form e cw_q_equals_the_spectral_separation_closed_form: a tabela de Q, CW e banda estreita { "1" }, banda larga e varrida { "2" }, fixada às formas fechadas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efetivo face a uma nova derivação independente em numpy do orçamento de ligação de Kaplan & Hegarty §{ "9.4" }; o C/N₀ real do JammerTest desce monotonicamente através do limiar de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (pré-registado, bloqueado, não executado)

# text
seg-26b6c4436ca0 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Parâmetros de cenário TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. { "0.30" } comparação externa, uma constatação (continua MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores ao nível das observáveis (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não emitiram qualquer alarme nos { "10" } s seguintes a qualquer um dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme surgiu { "10.2" } a { "39" } s após o início do intervalo publicado), e três janelas anteriores ao início apresentaram falsos alarmes do monitor de relógio ({ "81" }, { "64" } e { "173" } épocas). O primeiro efeito observável foi uma perda de seguimento GPS de dupla frequência, não uma inconsistência RAIM. Os inícios publicados são inícios de intervalos de um horário com resolução de minuto; que precedam a captura de RF é uma interpretação, não uma medição. { "0.30" } ronda { "2" }, face ao registo oficial do JammerTest { "2024" } dos organizadores (resolução de segundo; pré-registada 6a66994b com um monitor de relógio de três estados calibrado por Hadamard sem bloqueio), uma constatação (continua MODELLED): o monitor emite alarme nos { "10" } s em { "4" } de { "10" } inícios registados; nos outros seis chega com um atraso de { "18" } a { "211" } s ou emite falsos alarmes de relógio anteriores ao início ({ "1" } em { "2.1.4" }, { "85" } em { "2.3.15" }). D9 ronda { "3" } (um cartão de recetor das outras sessões da unidade do JammerTest, pré-registado 2ec76864) bloqueada: { "167" } épocas de treino contra { "3600" }. D9 rondas { "4" } e 4b (níveis de ruído de um cartão de classe de modelo u-blox ZED-F9P, Wroclaw { "2021" }, pré-registado fb475550; 4b uma repetição divulgada com uma extração corrigida, c9cc0d49), uma constatação (continua MODELLED): zero falsos alarmes anteriores ao início em todos os { "10" } inícios registados e { "6" } de { "10" } nos { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } e { "2.6.1" } continuam atrasados (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sem alteração pelo nível de ruído do relógio

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterização dos parâmetros TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fixa a constatação); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-964d859381f5 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Compõe primitivas validadas (allan/holdover van-Loan, limiar de segurança); calibrado no cenário { "2.1.1" } do JammerTest { "2024" } (~{ "1.01" } ms de desvio real do tempo servido face a ≤{ "51" } ns declarados). Ponte sobre partes validadas — não é, em si, uma validação externa. { "0.30" } comparação externa, uma constatação (continua MODELLED): nos cenários de spoofing do JammerTest { "2024" } o erro medido do tempo servido não detetado excede o TPL nominal em { "3" } de { "8" } inícios detetados: { "184.3" } contra { "34.6" } ns ({ "2.1.4" }), { "295.7" } contra { "159.3" } ns ({ "2.3.5" }) e { "143.0" } contra { "69.0" } ns ({ "2.3.11" }); três dos cinco dentro do limite são triviais (um falso alarme anterior ao início, com bloqueio). Causa provável: o termo de deriva livre de uma calibração de { "60" } s com ruído de deriva nulo não cobre a flutuação de frequência do TCXO do recetor ao longo de { "15" } a { "39" } s. O erro medido é a estimativa de relógio de ponto único do próprio Kshana face a uma reta ajustada às suas próprias estimativas anteriores ao início, pelo que mesmo uma concordância não teria sido totalmente independente. { "0.30" } ronda { "2" }, face aos inícios do registo oficial do JammerTest { "2024" } e ao erro de tempo do recetor medido (pré-registada 6a66994b), uma constatação (continua MODELLED): em { "4" } de { "10" } inícios registados o erro não detetado excede o TPL de estado de deriva ({ "634.7" } contra { "458.5" } ns em { "2.1.1" }, { "232.6" } contra { "16.2" } ns em { "2.3.5" }, { "41.3" } contra { "6.0" } ns em { "2.3.10" }, { "218.6" } contra { "47.4" } ns em { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referências de forma fechada + CUSUM); examples/tpl_jammertest.rs (calibração com spoofing real do JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fixa a constatação); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Coeficientes IGRF-14; CRLB de filtro adaptado a partir de primeiros princípios. O campo do bench de gravidade de campo real é verificado externamente (linha «Síntese de anomalias da gravidade a partir de um modelo de harmónicas esféricas»), mas o seu resultado de navegação não tem referência independente externa

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondência de mapas; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (o bench de 60 min sem GPS no campo real EGM2008 de grau 70, pré-registado em xval/icgem-egm2008/: correspondência { "3106" } m, pelo que o limiar de < { "500" } m é NOT MET e afirmado como falhado, e a redução de dez vezes na deriva de { "70.6" } km é MET; mais o Monte Carlo de erro de mapa com semente); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel e tests/emag2_real_grid.rs (leitor EMAG2v3 condicionado por dados num recorte real; nenhum resultado de navegação é afirmado com ele); tests/terrain_slam_rbpf.rs (estimação conjunta do mapa, um RBPF ao estilo FastSLAM, face ao SITAN de mapa conhecido com um erro de mapa correlacionado de { "15" } m ao longo de { "20" } sementes, pré-registado em xval/terrain-slam-rbpf/: ganho médio de { "1.5" }% e melhor em { "10" } de { "20" }, pelo que os limiares de { "10" }% e de 12 em 20 são NOT MET e afirmados como falhados; sem prejuízo num mapa perfeito, MET)

# text
seg-d7fd40dc37c6 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Aderência do SBOM à norma, o esquema JSON oficial CycloneDX { "1.5" } (+ identificadores SPDX válidos) — uma norma publicada externa, zero erros de validação em todo o grafo de dependências; a parte de determinismo da FoM / reprodutibilidade ao byte continua a ser uma verificação de autoconsistência fixada, pelo que a linha continua MODELLED

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (o SBOM gerado valida sem erros face ao esquema JSON oficial CycloneDX { "1.5" } em todo o grafo distribuído de 66 componentes: funcionalidades predefinidas + python + wasm, dependências de desenvolvimento excluídas)

# text
seg-a014f82f28b0 = Avaliação da deteção de perturbações de RF por aprendizagem automática ({ "13494" })

# text
seg-400e45e7e700 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Limites de AUC de forma fechada (Mann–Whitney) + um detetor de referência perfeita; o corpus é SYNTHETIC (fundamentado em parâmetros, não em campo/IQ)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfeita=1/idêntica=0.5/empate={ "0.125" }, ROC monótona, fundida>{ "0.8" }, separação de camadas por classe, proteção contra fugas, corpus reprodutível, indicadores de mudança de distribuição apontam otimismo); dominance_demonstrators (alcançável + reprodutível + MODELLED-not-VALIDATED + lacuna de otimismo autoconsistente)

# text
seg-7566da9904ba = Estudo da lacuna de otimismo na deteção de perturbações de RF por aprendizagem automática e preditor da lacuna só com ID

# text
seg-0d7f46d20a0d = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Estatísticas derivadas à mão face a formas fechadas (AUC binormal Φ(d'/√{ "2" }), variância de DeLong, Spearman com postos empatados, recuperação exata por OLS) + validação cruzada leave-one-out face à linha de base de prever a média. O corpus é SYNTHETIC (fundamentado em parâmetros, nunca campo/IQ) e a lacuna de otimismo é uma mudança de severidade sintético→sintético, NÃO um resultado de simulação para campo

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de referência por classe≈{ "1" }, lacuna de otimismo aprendida>{ "0" }, forma da grelha + o IC bootstrap contém a média + tendência de escala positiva, características de ID finitas, o preditor da lacuna supera o de prever a média tanto na validação cruzada leave-one-detector-out como na leave-one-class-out + determinístico); impairment_ml::tests (a regressão logística separa + determinística + perda↓, o MLP resolve o XOR que um modelo linear não resolve + com semente); eval_stats::tests (bootstrap/DeLong/Spearman/ridge face a formas fechadas)

# text
seg-590ec8589ce6 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — O núcleo do ajuste ADEV medido→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um núcleo externo independente; mas os NÚMEROS da comparação quantificam (nunca validam) um relógio/CAI do parceiro, pelo que a própria comparação continua MODELLED, sem halo de validação

# text
seg-e0f68f57399d = quantum_trade::tests (recuperação por ciclo completo de ADEV, não negatividade de NNLS, aviso de limite inferior presente/ausente, benefício>{ "1" }, envolvente monótona + limite alt-PNT); dominance_demonstrators (o ADEV medido é orientado por dados e não assumido pelo limite inferior, a classe assumida sinaliza limite inferior + aviso, curva malformada rejeitada, MODELLED-not-VALIDATED)

# text
seg-7d1d24d8f8f5 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Tabela definicional Kp↔ap + forma fechada da temperatura exosférica de Jacchia-1971 (coincide a <{ "1" } K com as âncoras publicadas, tests/space_weather_reference.rs); a densidade é caracterizada face ao pymsis NRLMSISE-00 (um modelo NRL independente): a oscilação do ciclo solar a { "800" } km é de 10.4x contra 13.6x no NRLMSISE-00. { "0.30" } revisão: o fator de atividade de primeira ordem calibrado foi substituído por Jacchia { "1971" } (densidade do cenário predefinido a { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k acrescentado). { "0.30" } ronda { "2" }, densidades medidas por acelerómetro TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; pré-registada 20eed695), uma constatação (continua MODELLED): as médias orbitais entre { "400" } e { "500" } km ficam dentro de um fator { "2" } no máximo solar fora de tempestades (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mas Jacchia { "1971" } é cerca de 1.7x demasiado denso no mínimo solar de { "2008" } (GRACE-A 412/544 dentro de um fator { "2" }), pelo que a densidade não está validada

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exato nos pontos da grelha + ciclo completo + monótono, média diária de Ap, T exosférica face às âncoras publicadas de mínimo/média/máximo solar + incremento de tempestade, densidade unitária na referência, oscilação do ciclo solar na banda observada de { "5" }–{ "10" }×, cenário reprodutível + MODELLED-not-VALIDATED + rejeição de valores fora do intervalo); dominance_demonstrators (alcançável + reprodutível + T física + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Geometria de lançamento de trigonometria esférica de forma fechada face a âncoras de exemplos resolvidos publicados (Vallado, Fundamentals of Astrodynamics 4.ª ed., Algoritmo { "37" } de azimute de lançamento + mudança de plano do cap. 6; tests/launch_window_ascent_geometry_reference.rs). Estas reutilizam a mesma forma fechada que o kshana implementa (uma verificação de paridade com valores publicados / de transcrição, InternalConsistency); MODELLED de dois corpos, sem triângulo de velocidades da Terra em rotação / subida / modelo de perda por resistência. { "0.30" } comparação externa com o Orekit { "12.2" } (Apache-2.0), uma constatação (continua MODELLED): a geometria concorda até ao arredondamento (inclinação lida de volta a partir do azimute de fim de queima em { "158" } casos, pior { "2.6e-15" } rad; inclinação mínima, velocidade circular e delta-v de dogleg até { "3e-16" }), mas a velocidade do local por rotação da Terra falha o limiar pré-registado de { "1e-6" } relativo a { "62.9" } graus de latitude ({ "1.12e-6" }). A diferença cresce como tan(lat), o que é consistente com um desvio do polo por movimento polar de cerca de { "5.8e-7" } rad no referencial terrestre do Orekit que o ω·R·cos(lat) esférico omite. A afirmação não foi restringida antes da execução, pelo que a linha não pode ser promovida com base nesta comparação. { "0.30" } ronda { "2" } (pré-registada 71bebf63): com uma época e linhas IERS, a velocidade do local com polo verdadeiro (campo de cenário site_rotation_speed_true_pole_m_s) concorda com o Orekit dentro de { "1e-6" } em { "24" } locais ao longo de quatro longitudes (pior { "4.9e-8" }), mas a velocidade nominal sem época que o cenário emite por predefinição como bónus de rotação da Terra continua a falhar por { "1.12e-6" }, pelo que a linha continua MODELLED até haver uma decisão sobre a saída predefinida

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (o lançamento para leste atinge i=latitude, KSC→ISS = { "45" }° de manual, polar = N/S, i<lat inatingível, bónus equatorial de { "465" } m/s, mudança de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, contagens de oportunidades diárias, cenário reprodutível/MODELLED + trajetória dogleg); dominance_demonstrators (alcançável + reprodutível + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Entrada analítica de Allen–Eggers de forma fechada, adicionalmente verificada por confronto com uma integração numérica scipy { "1.18" } solve_ivp (DOP853) da MESMA EDO de entrada só com resistência (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior rel. de a_max { "2.9e-9" }) — uma verificação de integral numérico face à própria forma analítica, pelo que continua a ser InternalConsistency, NÃO uma validação externa. MODELLED balístico (sem sustentação), sem aerotérmica/TPS — a saída de aquecimento é uma velocidade, não um fluxo de calor. { "0.30" } comparação externa, uma constatação (continua MODELLED): face à reconstrução da entrada da SRC da Stardust (Desai e Qualls, NASA NTRS { "20080008567" }), a desaceleração máxima de Allen–Eggers para o estado de entrada inercial impresso ({ "12.9" } km/s, -8.2 graus, H { "7200" } m) é de { "61.8" } g contra { "32.89" } g da melhor trajetória estimada, +{ "88" } % contra uma tolerância de { "15" } %: a solução de ângulo de trajetória constante e sem gravidade quase duplica o pico de uma entrada rasa e mais rápida do que a velocidade de escape. A Stardust não levava acelerómetro, pelo que a reconstrução é uma estimativa de trajetória. { "0.30" } ronda { "2" }, bloqueada (continua MODELLED): uma solução planar integrada de massa pontual (reentry::simulate_planar_entry, US76, gravidade de inverso do quadrado, curvatura) concorda com as melhores trajetórias estimadas da Stardust e da Genesis dentro de { "15" } % (+{ "11.3" } %, +{ "5.6" } %), mas esses máximos são saídas de simulação de agências, não medições, pelo que isto é apenas uma verificação cruzada. A comparação com o acelerómetro (pré-registada a94a283d) está bloqueada à espera de uma cópia legível da análise REMM da Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (g de pico independente do coeficiente balístico + banda física de g, cresce com γ mais íngreme / entrada mais rápida, velocidade do g de pico = V_e·e^(−1/2) e aquecimento de pico = V_e·e^(−1/6) mais rápido, altitude do g de pico física + mais profunda para B mais elevado, cenário reprodutível/MODELLED + geometria degenerada rejeitada); dominance_demonstrators (alcançável + reprodutível + fração V_e·e^(−1/2) + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (apenas verificação cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueado, não executado)

# text
seg-f40cd1b25160 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a eficiência espetral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de trama concorda com as eficiências que a Tabela { "13" } imprime (uma verificação de transcrição da tabela de limiares); as partes do orçamento de ligação concordam com as suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM move pelo menos o volume de codificação constante. A geometria da passagem provém do previsor de passagens aparentes, validado em separado, VALIDATED. O QUE NÃO É: não foi comparada nenhuma ferramenta externa nem ligação medida; os limiares são os valores AWGN ideais da norma, não os de um modem; o desvanecimento por chuva, a perda de apontamento ao longo da passagem e os pilotos não são modelados.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: o ramo-e-limite exato concorda com a enumeração por força bruta em pequenos conjuntos aleatórios, cada plano é verificado como exequível face às regras de conflito, e o algoritmo guloso nunca supera o ótimo exato. O QUE NÃO É: não foi comparado nenhum escalonador externo nem plano operacional; os contactos são tomados inteiros (sem divisão), a carga pendente é fixada no início da janela, o tempo de reorientação além do tempo de viragem fixo e o armazenamento a bordo não são modelados.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Aritmética de custos de forma fechada face a valores derivados à mão; um ENQUADRAMENTO económico de um valor de cobertura modelado, não uma cotação nem um modelo de custos validado

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (custo por cobertura derivado à mão 48/96={ "0.5" }, razão de ROI { "2.667" }, ordenação de intervalos + proteções de cobertura nula)

# text
seg-8204455973cc = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Compõe a classificação Stanford de RAIM validada externamente (raim::classify_stanford); o próprio mapeamento de falha de deteção para AL é modelado, não uma alocação de integridade certificada

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (a mesma falha de deteção passa de Available→MI→HMI à medida que o contexto se aperta; PL conservador→Unavailable; HMI por eixo; proteções de entrada)

# text
seg-7bb58c89a1fb = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: o intervalo VRW citado verificado face à física de CaiAccelerometer::accel_asd + alcance dinâmico bruto calculado a partir do limite de ambiguidade de franja; os números são intervalos MODELLED de levantamento bibliográfico (needs_source_confirmation), nenhum dispositivo validado, sem halo de validação

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (o VRW físico situa-se dentro do intervalo VRW citado nos { "3" } níveis; alcance bruto de ambiguidade de franja calculado a partir de k_eff·T²; o orçamento conservador deriva mais do que o melhor; cada intervalo tem fonte e está sinalizado para confirmação; proteções de ordenação de intervalos)

# text
seg-3f5094fa7a30 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Reimplementação independente em numpy da regra de quatro regiões (scripts/gen_tib_scorer_reference.py) sobre o conjunto de amostras idêntico; método citado do diagrama de integridade Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) e do RTCA DO-229 WAAS MOPS. NÃO é uma referência independente de exatidão ExternalDataset — o benchmark é imune à honestidade.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatro regiões + limites inclusivos + |erro| + indisponibilidade PL>AL); tests/tib_scorer_reference.rs (contagens de classificação face a numpy independente num conjunto sintético fixo)

# text
seg-10befbc6faae = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Recontagem independente de regiões em numpy em tests/fixtures/tib/reference.json; apenas verificação cruzada da maquinaria do avaliador, sem afirmação de exatidão.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpo/subdelimitado/tudo indisponível/vazio); tests/tib_scorer_reference.rs (contagens + taxas + coverage_ok face a numpy até { "1e-12" })

# text
seg-cee919e2058e = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Geradores de falhas paramétricos representativos (modelados); o conjunto não detetável (atraso simétrico, repetição dentro da frescura) é citado de Mizrahi RFC { "7384" } e de Narula & Humphreys (IEEE JSTSP { "2018" }). Sem referência independente externa — um catálogo de falhas não faz qualquer afirmação medida.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfis de desvio, deriva livre monótona, sinalização do conjunto não detetável, consistência de max_offset, exatamente duas classes não detetáveis)

# text
seg-0cc84aedee42 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Verificação de propriedade de que a enumeração Verdict estruturalmente não consegue declarar como detetada uma falha não detetável (Mizrahi RFC { "7384" }); absorvida ⟺ PL ≥ desvio. Sem referência independente de exatidão.

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (PL de referência absorve; PL quebrado não absorvido-nunca detetado; veredicto de cobertura detetável; a propriedade de honestidade de que nenhum veredicto de cobertura/deteção é alcançável para um cenário não detetável)

# text
# c1: variance
seg-350aaf43f349 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Sem referência independente externa, e nenhuma é possível: isto é autodescrição, não uma medição. Fica registado porque a sua ausência era um defeito -- o P5 teve de citar o comprimento de onda da portadora e a abertura de transmissão a partir de valores predefinidos do código-fonte, e de inferir, a partir de uma verificação de consistência interna, que um simples <c1/> estava em metros quadrados. A inferência estava correta, o que é precisamente a razão pela qual importava: nada teria detetado que estivesse errada

# text
seg-6d963d838eed = hybrid_integrity::tests (a configuração resolvida é devolvida tanto para os valores predefinidos como para as substituições, sem passar o comprimento de onda por metros e de volta; cada entrada de unidades traz uma unidade e uma classe de proveniência; cada campo que o bloco de unidades nomeia é efetivamente emitido, pelo que não pode documentar um fantasma)

# text
seg-cbd0ee1c1e97 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Sem referência independente externa, e ExternalDataset é recusado. As duas entradas são uma margem de Eb/N0 e uma passagem de limiar de C/N0, ambas funções de um EIRP, uma figura de mérito e uma alocação de perdas agregadas MODELLED; não existe registo de disponibilidade medida de um serviço híbrido ótico/RF Terra-Lua face ao qual verificar o valor composto. As verificações que existem são internas e são declaradas como tal: a composição é recalculada a partir das margens publicadas pelo próprio relatório e não a partir dos internos do emissor, e o alcance de fecho é verificado voltando a executar a equação da ligação NESSE alcance e exigindo que a margem se anule -- um ciclo completo de inversão, não uma implementação independente. O limite honesto do valor fica registado no próprio relatório: é um indicador determinístico 0/1, não uma probabilidade, porque nada neste motor mede uma distribuição de indisponibilidade da ligação RF nesta banda e geometria. Essa entrada em falta é nomeada em rf_availability.factors_not_included em vez de inventada, e fornecê-la é o que uma disponibilidade RF probabilística exigiria

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (a disponibilidade é igual ao produto dos dois indicadores recalculados a partir das margens do próprio relatório, e essas margens são elas próprias reconstituídas a partir do EIRP, da perda no espaço livre, da perda agregada, da figura de mérito, do termo de Boltzmann, do débito e do requisito do próprio relatório até { "1e-9" } dB; o valor é medido como { "0" } ou { "1" } enquanto a disponibilidade ótica na mesma execução é medida como estritamente entre ambos; cada linha de fator traz uma classe de proveniência do vocabulário fechado de field_schema; o alcance de fecho comunicado, executado de novo através do orçamento de ligação, devolve uma margem de { "0" } a { "1e-9" } dB e é medido como independente do alcance a que a execução estava ao longo de quatro décadas, enquanto a utilização do alcance se move exatamente pela razão de alcances; uma ligação de -40 dBW comunica disponibilidade { "0" }, LOST, e uma utilização acima de { "1" } em vez de uma fração; a nota substituída «nenhuma contrapartida de disponibilidade RF é calculada por este motor» é afirmada como removida e a substituta é afirmada como nomeando o novo campo; uma entrada RF malformada é recusada em vez de limitada)

# text
seg-6471f38fc505 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Sem referência independente externa para a RAZÃO, e ExternalDataset é deliberadamente recusado. A cadeia RF subjacente tem uma -- tests/validate_p5_rf_ranging_precision.rs verifica linkbudget::link_budget e navsignal::dll_code_jitter_chips face a um ficheiro de teste independente em Python/NumPy e face ao valor resolvido de Kaplan & Hegarty codificado no código ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz) -- e o CRLB ótico tem a sua própria linha de forma fechada. Reclamar qualquer das âncoras para esta linha seria validação emprestada, o que as invariantes da matriz existem para impedir: a quantidade aqui é uma RAZÃO numa configuração com EIRP, figura de mérito, potência de transmissão e abertura MODELLED, e não existe comparação medida de alcance ótico versus RF num ponto de operação comum face à qual a verificar. O que é verificado internamente é aquilo em que a razão pode realmente errar: que os dois ramos estejam no mesmo ponto de operação. Isso é medido escalando o tempo de acumulação comum e exigindo que ambos os ramos se movam pela mesma lei da raiz quadrada e que a razão se mantenha, e é imposto recusando liminarmente a razão quando os tempos de média divergem. Ambos os ramos são limites de ruído térmico/de disparo e ambos excluem o atraso do meio, o erro de relógio e a ambiguidade, pelo que a exclusão é idêntica em cada lado; o relatório di-lo em vez de o deixar por inferir

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (a razão é igual aos dois ramos emitidos divididos, até { "1e-15" } relativo, e as suas formas recíproca e em decibéis concordam; o alcance e o sigma de tempo de cada ramo relacionam-se exatamente por c; a configuração comum emitida é afirmada igual ao alcance e ao tempo de integração do próprio cenário e o alcance do ramo RF é afirmado igual ao do ramo ótico; o C/N0 do ramo RF é, bit a bit, o do bloco de disponibilidade, a partir de um único orçamento de ligação, não de uma nova derivação; a propriedade LIKE-FOR-LIKE é MEASURED em vez de afirmada -- quadruplicar o tempo de acumulação comum reduz a metade o ramo ótico até { "1e-12" } e o ramo RF até { "1e-7" } e deixa a razão inalterada até { "3.19e-9" } relativo, o que um ramo que calculasse secretamente a média sobre outra coisa não poderia fazer; uma substituição de rf_dll_bandwidth_hz que quebra o tempo de média comum torna a razão nula com um motivo que nomeia ambos os tempos, enquanto ambos os ramos continuam a ser emitidos; uma execução num só sentido torna o ramo de comparação, bit a bit, o resultado principal divulgado com um fator de penalização de exatamente { "1" }, e uma execução nos dois sentidos reproduz a penalização 0.5/sqrt(perda geométrica do percurso de retorno) recalculada a partir do geometric_loss_db do próprio relatório até { "1e-12" })

# text
seg-7c14f0734623 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Sem referência independente externa: isto é autodescrição sobre uma equação já validada face a uma tabela de controlo de projeto publicada (ver a linha do orçamento de ligação num só sentido). Fica registado porque a sua ausência era um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv divulgado exigia resolver por retrocálculo uma constante efetiva até { "0.0034" } dB a partir das trinta linhas, e o motor passa agora a nomear essa combinação e a provar, por teste, que nenhuma tabela divulgada poderia alguma vez ter separado os seus três componentes

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (em três bandas, quatro décadas de alcance e ambos os veredictos de fecho, a margem e a perda no espaço livre subjacente são recalculadas apenas a partir do relatório com melhor que { "1e-9" } dB; o G/T necessário montado a partir dos termos da equação concorda com a mesma quantidade obtida como G/T menos margem, e voltar a executar com ele anula a margem; três orçamentos com EIRP, perda e limiar muito diferentes mas uma constante de ligação igual dão um requisito idêntico, enquanto { "1" } dB na constante o move exatamente { "1" } dB; a divisão do ganho está ausente a menos que seja indicada uma temperatura de ruído e uma não positiva é recusada; cada campo que o bloco de unidades nomeia é efetivamente emitido)

# text
seg-5a05659a1cbb = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Dois cálculos diferentes na mesma base de código da mesma quantidade, não um só reformulado: a bissecção sobre a curva de lei de potência IEEE-1139 nada sabe sobre o tipo de ruído, enquanto a forma fechada inverte algebricamente o tipo dominante, pelo que um tipo de ruído mal classificado ou um intervalo inicial errado surge como uma diferença relativa não ínfima. Os quatro valores reproduzem também a tabela publicada do artigo até metade do seu último dígito impresso -- mas essa tabela foi ela própria reconstruída a partir da mesma forma fechada, pelo que é uma verificação de reprodutibilidade e não uma referência independente externa, e o termo de referencial face ao qual é medida é uma alocação modelada

# text
seg-d9742b5a3a48 = lunar_time_budget::tests e lunar_time_budget_scenario::tests (as quatro classes presentes numa só execução e numa ordem de subconjunto pedida; cada linha concorda com a sua própria forma fechada com melhor que { "1e-12" } relativo; escalar o erro de referencial por k escala o cruzamento por k para um relógio flicker-FM e por k^{ "2" } para um white-FM, verificado com k={ "2" } e k={ "3" }, o que separa as duas classes de ruído; cada linha reproduz o cruzamento de relógio único que o orçamento já tinha comunicado; cada linha recupera o único termo de referencial partilhado; um nome de relógio desconhecido é rejeitado)

# text
seg-75715af43b8b = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Inclusão de conjuntos: a razão interferente-sinal entra como um desvio uniforme em decibéis, pelo que o conjunto capturado a uma potência de transmissão mais elevada contém o conjunto a uma mais baixa e a fração só pode aumentar -- uma propriedade que o padrão de Airy NÃO dá na largura de feixe ou na altitude, onde a região capturada se quebra em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada dá a fração de disco capturado de um transmissor orbital lunar em função da altitude e da largura de feixe, pelo que não há nada externo face ao qual verificar estas células; o padrão subjacente é validado em separado face a valores de Bessel publicados e mantém a sua própria linha

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests e attack_surface::tests (a grelha está completa e cada fração capturada situa-se em [{ "0,1" }]; a fração capturada é não decrescente na potência de transmissão em cada nó; NÃO é monótona na largura de feixe nem na altitude, o que é fixado por um teste próprio para que a varredura não possa vir a ser suavizada; o nó de linha de base reproduz a fração capturada existente bit a bit; a avaliação apenas no limbo é idêntica bit a bit ao último ponto da varredura completa; um cruzamento localizado situa-se no limiar até { "1e-9" } dB e é enquadrado)

# text
seg-eebb00692020 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas autoconsistência: o total publicado é verificado face à raiz da soma dos quadrados dos termos no mesmo ficheiro, e a curva emitida reproduz o p3_time_budget_curve.csv divulgado em todos os { "57" } pontos. Ambas as verificações partilham as definições de termos do próprio motor, pelo que nenhuma é independente. O termo de relógio assenta em especificações de relógio publicadas, mas as MAGNITUDES do limite inferior de ligação, referencial, relativista e efemérides são alocações de orçamento documentadas sem referência independente externa

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (todos os { "57" } tempos de média x { "8" } termos presentes, o índice da grelha vai de { "0" }..={ "56" } e traz { "8" } linhas cada; a linha <c1/> é igual à raiz da soma dos quadrados dos sete termos ao seu lado em cada tau; a tabela segue uma grelha pedida em vez de uma codificada no código; emiti-la deixa o JSON do relatório idêntico ao byte)

# text
seg-af88df24ce81 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas consistência interna: o tempo até ao limiar por bissecção é verificado face ao inverso de forma fechada do tipo de ruído dominante do relógio, e o termo de relógio em marcha livre face ao termo de relógio do próprio orçamento. As classes de relógio assentam em especificações publicadas a um dia (as suas próprias linhas); a taxa LTC não é aqui rederivada e mantém a sua própria linha VALIDATED (Tempo coordenado lunar); o resíduo de correção é ILLUSTRATIVE, o resíduo de realização é uma alocação de orçamento e nenhum modelo térmico está incluído. O objetivo ao nível do nanossegundo descrito no material Lunar PNT do ICG WG-B de junho de { "2024" } é citado como declaração da fonte, não adotado como afirmação; nada aqui é uma declaração sobre qualquer relógio de estação real

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: com a correção desligada o termo de relógio é igual ao termo de relógio do orçamento ao bit para as quatro classes; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas as classes de ruído; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: o documento predefinido, a tabela e o resumo ficam inalterados e o bloco acrescenta apenas o seu próprio objeto e unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: ótico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, com as curvas PHM e RAFS a cruzarem-se entre { "7e5" } e { "8e5" } s fixadas como propriedade divulgada dos modelos de relógio de tipo de ruído único; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — delta_dor de onda plana (mesma base de código) no limite de campo distante; derivadas parciais por diferenças finitas. { "0.30" } comparação externa, uma constatação (continua MODELLED): face aos tempos de luz convergidos do ANISE { "0.10" } através do DE440 ({ "75" } atrasos em 2024-01-01 em três linhas de base da DSN, gerados por xval/anise-lunar-od sem código do Kshana), nenhum atraso está dentro da tolerância de { "1" } ps. A maior diferença é de { "24" } µs, devida ao centro analítico da Lua (a cerca de { "200" } km do DE440), à geometria instantânea única sem iteração do tempo de luz ({ "3.6" } µs) e ao movimento polar omitido; as derivadas parciais da baliza diferem até { "2.9e-3" } relativo contra { "1e-6" }. A afirmação da documentação do módulo de que as aproximações do referencial estão abaixo da fidelidade do modelo não se sustenta a este nível. { "0.30" } ronda { "2" }: o caminho por núcleos (lunar_vlbi::KernelGeometry) é validado face aos tempos de luz do NAIF SPICE na sua própria linha, VLBI geodésico lunar, caminho por núcleos; a comparação do ANISE desse caminho (75/75 dentro de { "1" } ps, pior { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) é apenas uma verificação cruzada da avaliação do núcleo, porque a resolução do tempo de luz nesse ambiente de teste é do próprio projeto. Esta linha (o caminho analítico predefinido) continua MODELLED com a constatação acima

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (o limite de campo distante coincide com delta_dor; correção de campo próximo; derivadas parciais por DF); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de forma fechada e consistência interna; NÃO é reclamada qualquer referência independente externa. O semiângulo do limbo é verificado face a asin(R_earth/r_orbit) e a geometria face a ele; a perda no espaço livre, o núcleo DOP e a propagação SGP4 que isto compõe são cada um validados externamente nas suas próprias linhas e esta linha não toma de empréstimo o seu estatuto. PORQUE É MODELLED, e é o padrão de transmissão: o ganho em função do ângulo é uma abertura circular uniformemente iluminada, o padrão de Airy, enquanto uma antena GPS L1 real é uma agregação helicoidal de doze elementos com um lóbulo principal moldado e com pico fora do eixo para uniformizar a potência sobre o disco da Terra e lóbulos laterais que não são de Airy. Existem padrões medidos publicados e não estão aqui incluídos, pelo que as ordenações e as ordens de grandeza se mantêm, mas os dB de qualquer satélite individual não. UMA PRIMEIRA IMPLEMENTAÇÃO DESTA LINHA ESTAVA ERRADA DE UMA FORMA QUE VALE A PENA REGISTAR: a expressão de Airy só é válida no hemisfério frontal, o seu argumento vai como sin(theta), e para theta perto de { "180" } graus dá a volta e devolve o GANHO TOTAL NO EIXO atrás da abertura - pelo que as duas ligações mais fortes do primeiro relatório eram satélites a apontar as suas antenas para longe da Lua, e eram os únicos dois que ultrapassavam o limiar. Atrás da abertura o modelo aplica agora um piso plano de lóbulo posterior, declarado como um limite e não como uma forma de padrão fabricada. Deliberadamente ausentes, cada uma tornando o orçamento OPTIMISTA: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda de polarização, de apontamento ou de implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA, não uma consulta de efemérides, porque a quantidade em teste é a ligação e a geometria do feixe. Promover esta linha a validada exige um padrão de transmissão medido e pontos normais do LuGRE face aos quais verificar; nenhum está no repositório e nenhum é aqui inventado. { "0.30" } ronda { "2" }, uma constatação (continua MODELLED): um caminho de ligação com entradas medidas (posições SP3 reais, potência de transmissão por bloco, padrões de transmissão e de receção tabelados, histerese de aquisição e seguimento) foi verificado face à Tabela { "3" } de Montenbruck et al. { "2023" } para o GENESIS a { "6000" } km (pré-registada 5b414f0a): as médias com antena para o zénite concordam em { "5" } de { "6" } dentro de um dB da sensibilidade do artigo; as médias com antena para o nadir são { "1.0" } a { "2.4" } satélites superiores às impressas, plausivelmente porque o artigo usou padrões de lóbulos laterais GPS dependentes do azimute que não são publicados. Os valores a distância lunar desta linha continuam a usar o substituto de Airy. { "0.30" }+ D7, uma constatação (continua MODELLED): a quantidade reformulada, a DIFERENÇA de C/N0 entre satélites Block IIR/IIR-M seguidos numa só época, prevista com os padrões L1 medidos por SVN do NAVCEN (bidimensionais, referencial de orientação por guinada) face ao C/N0 de voo do LuGRE (pré-registada 768cb62b: { "99" } % visíveis, RMS dos pares <= { "3.0" } dB, mediana <= { "2.0" } dB, pelo menos { "50" } registos e { "30" } pares) tem poucos dados: as { "26" } épocas de trânsito e de órbita lunar qualificantes contêm { "15" } registos IIR/IIR-M seguidos (são seguidos sobretudo IIF e III) e um par. Todos os { "15" } são previstos como visíveis e o resíduo do único par é -0.06 dB; nada é afirmado

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } testes de biblioteca: o semiângulo do limbo da Terra face à sua forma fechada asin(R/r) com uma afirmação adicional de que TODA a ligação não ocultada fica fora desse cone, para que o teste de ocultação e o ângulo do limbo não possam discordar; o predicado de ocultação verificado no lado próximo, no lado distante e no caso em que o corpo está ATRÁS do transmissor; perda de percurso limitada à banda plausível de alcance lunar em cada ligação; o conjunto seguível mostrado como um subconjunto do conjunto geometricamente visível e disjunto do ocultado; monotonia nos dois sentidos - mais ganho de receção nunca reduz a contagem, um limiar mais estrito nunca a aumenta; nenhuma ligação creditada com mais do que o ganho no eixo; um recetor dentro da Terra recusado; a varredura afirmada como efetivamente VARIÁVEL com a época; e a disponibilidade de sinal versus solução de posição afirmada como distinta, corretamente ordenada e consistente com as linhas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fixado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constatação fixada)

# text
seg-5242a1ecb1f9 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Um programa independente em scipy/numpy integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente verifica a numérica de fórmulas declaradas, não a física, pelo que a linha continua MODELLED. Modelo restrito de três corpos: sem Sol, sem harmónicas lunares, o eixo de rotação da Terra ao longo da normal da órbita, entradas de recetor e de estação ILLUSTRATIVE.

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (limiar O1: a matriz de transição de estado encadeada ao longo de três dias e ao longo de um período é igual ao scipy DOP853 até um relativo de { "1e-6" }; limiar C1: q médio e a fração dentro de 95 %; limiar C2: amostra sobre traço formal de cada estimador; limiar C3, NOT MET e fixado: com { "3e-10" } m/s2 de aceleração não modelada o excedente dentro de 95 % é { "0.0525" }, não pelo menos { "0.5" } - a estimativa a bordo é conhecida apenas até centenas de metros, pelo que cerca de dez metros de deslocamento se escondem dentro da sua covariância); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Uma resolução independente em numpy das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração inteira por força bruta (Q4). Não é comparada nenhuma medição de fase da portadora GNSS ou lunar. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (limiar Q1: sucesso de Monte Carlo pelo menos o limite de bootstrap menos três erros-padrão; Q2: nenhuma queda com o comprimento do arco além de três erros-padrão; Q4: LAMBDA é igual à enumeração por força bruta para { "200" } sorteios de dimensão até cinco; Q3: o projeto flutuante é igual a uma resolução independente em numpy até { "1e-9" } para as covariâncias de ambiguidade e de posição, e a taxa por bootstrap é NOT MET a { "1e-9" }, fixada: difere por um relativo de { "1.7e-6" } porque a CDF normal do LAMBDA é uma aproximação de Abramowitz e Stegun)

# text
seg-ee535014d898 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Uma diferença finita independente em numpy do modelo direto (F2). Nada é comparado com soluções reais de referencial lunar. O fator é condicional à órbita conhecida assumida e ao sigma de alcance de { "1" } m. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (limiar F1: o traço do CRLB não sobe e o menor valor próprio não desce com ligações do orbitador, no exemplo e em { "20" } conjuntos aleatórios com semente; limiar F2: as derivadas parciais de alcance são iguais a uma diferença finita independente em numpy longdouble do modelo direto de Rodrigues em { "50" } geometrias; limiar F3: o menor valor próprio sobe pelo menos 2.0x, encontrado cerca de 111x)

# text
seg-8d70ea5318fa = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Um sistema empilhado independente em numpy com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Não são comparados dados de GRASP, Genesis ou de qualquer outra missão. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (limiar T1: os sigmas de translação não descem à medida que a ligação local se afrouxa; T2: com os sigmas das técnicas escalados por { "1e-6" } o sigma de translação de cada par está dentro de { "1" } % de sqrt({ "2" }) vezes o sigma da ligação local, encontrado dentro de { "3e-7" }; T3: a matriz de informação é igual a uma montagem empilhada independente em numpy até { "1e-9" }). A primeira execução de T2 com inversão das equações normais falhou ({ "1.3" } % com uma ligação de { "0.1" } m, valores abaixo do piso a { "1" } m); a causa foi numérica e a covariância passou para a via da raiz quadrada antes de o limiar ser reavaliado.

# text
seg-6c1a6dc96a6a = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Uma montagem independente por diferenças finitas em numpy (G2) e uma avaliação de forma fechada (G4). A sensibilidade a k2 da família do orbitador é um valor do extremo superior (o estado orbital absorve aqui apenas uma constante e uma tendência). Não é comparada nenhuma medição de maré ou de libração lunar; k2 é citado de Lemoine et al. { "2014" } como nominal. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (limiar G1: as derivadas parciais analíticas são iguais a uma diferença finita central de cada modelo direto até { "1e-8" }; G2: a informação 5x5 é igual a uma montagem independente em numpy até { "1e-6" }; G4: a amplitude da maré de relógio e as suas sensibilidades a k2 e h2 são iguais a uma avaliação independente até { "1e-9" }; limiar G3 NOT MET na sua metade do traço, fixado: acrescentar uma família nunca baixa o menor valor próprio ({ "28" } de { "28" }) mas o traço da pseudoinversa subiu em { "12" } de { "28" } acréscimos porque a família acrescentada elevou o posto)

# text
seg-3ead905e6a5c = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — A aritmética DOP é o núcleo crate::orbit::dop, validado externamente em separado face ao gnss_lib_py em tests/dop_reference.rs; esta linha não volta a tomar de empréstimo o estatuto dessa linha. O horizonte de visibilidade da baliza é a forma fechada L01, e sigma = DOP x sigma_URE é a relação GNSS padrão (Kaplan e Hegarty, Understanding GPS/GNSS, secção { "7" }). Dentro desta linha, a própria aumentação é verificada face a um caminho DOP independente no repositório e fixada a um golden consolidado. PORQUE É MODELLED: o projeto da constelação, a colocação das balizas, as alturas das antenas e as três magnitudes do orçamento de erro são entradas ilustrativas e não um levantamento no terreno ou uma ligação medida, pelo que os metros comunicados são uma propriedade de um cenário escolhido e não de qualquer serviço implantado. NOTA SOBRE PROVENIÊNCIA: esta capacidade era anunciada no README e exercitada por dois testes de validação, mas NÃO tinha linha na matriz nem tipo de cenário, pelo que não podia ser alcançada de todo a partir de uma execução. Era afirmada em prosa, ausente do registo e inalcançável no motor ao mesmo tempo. A linha e o tipo de cenário foram acrescentados em conjunto. { "0.30" } ronda { "2" } (pré-registada db0eb9ec), bloqueada (continua MODELLED): a visibilidade do ANISE { "0.10.6" } e um DOP em numpy sobre a geometria da linha concordam (conjuntos visíveis exatos, incluindo { "72" } casos junto ao horizonte e { "48" } junto à máscara; DOP até { "7.2e-13" }), mas os metros comunicados são DOP vezes um erro de alcance de raiz da soma dos quadrados ilustrativo de { "1.158" } m sem referência independente; a delimitação que os excluiria aguarda uma decisão do responsável

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidade do horizonte face à forma fechada L01; o DOP aumentado por balizas face ao simples; a raiz da soma dos quadrados do orçamento de erro; a relação DOP-para-metros); tests/validate_p2_beacon_before_after_table.rs (toda a tabela antes/depois fixada a um golden consolidado até { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (a mesma geometria através de um caminho DOP INDEPENDENTE, pelo que a aumentação não é verificada face ao núcleo que a produziu); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal limita o erro de posição horizontal a k-sigma contribuído pela classe cega de modo comum, formando blind_position_covariance = S<em>Cov</em>S^T e projetando-a em ENU; integrity_envelope comunica hpl_total = hpl_araim + cmpl. A distinção que o par existe para fazer: o teste de RESÍDUO RAIM/ARAIM é demonstravelmente cego a erros em range(G), mas o NÍVEL DE PROTEÇÃO ARAIM não é - o seu termo sem falhas já os limita até um URA do fornecedor mais o enviesamento nominal. O CMPL é, portanto, apenas o EXCESSO entre fornecedores que o URA/ISM por fornecedor de um único fornecedor não sobrelimita, e a soma é um limite conservador pela desigualdade triangular e não uma RSS, válido apenas quando esse excesso ainda não está dentro do URA.

# text
seg-753412b4c8f3 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Álgebra analítica do projetor verificada face a si própria: uma covariância confinada a range(G) tem de dar um CMPL positivo, uma covariância confinada ao espaço de paridade tem de dar aproximadamente zero, e a envolvente tem de somar duas contribuições ortogonais no espaço de medição. A covariância de modo comum, a geometria da constelação e k são entradas representativas e modeladas, NÃO um orçamento certificado, e não é feita qualquer afirmação de que o limite triangular seja justo. NOTA SOBRE PROVENIÊNCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope são públicos e distribuídos, e os seus testes unitários já eram citados pela linha de cegueira de modo comum, mas a AFIRMAÇÃO DA ENVOLVENTE em si não tinha linha - pelo que a única ressalva que a mantém honesta, a de que a soma é um limite triangular e não uma RSS, não estava declarada em lado nenhum no registo. A linha regista a afirmação e a ressalva em conjunto.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Estrutura analítica do defeito de datum — o modo de referencial absoluto não observável situa-se no espaço nulo da informação de Fisher (forma fechada), o limiar de posto coincide com a justificação de projeto de 3 estações publicada, e o estimador atinge o CRLB resultante em Monte-Carlo. A própria geometria lunar é uma rede representativa (não uma efeméride voada), pelo que a linha continua MODELLED; o motor FIM/CRLB subjacente é verificado em separado face às formas fechadas de Kay ({ "1993" }). { "0.30" } ronda { "2" } (pré-registada fab02df9), bloqueada (continua MODELLED): NumPy/SciPy recalculam o posto e o defeito ao limiar declarado de { "1e-9" }, a parte dos eixos das estações no espaço nulo (dentro de { "8.4e-10" }) e o CRLB das estações (dentro de { "1.2e-10" }) em { "17" } configurações consolidadas geradas pelo Kshana (P2). Não promovida: a afirmação de que o estimador atinge o limite (eficiência de Monte Carlo de cerca de { "0.98" }) não tem referência independente, e a delimitação que a deixaria MODELLED aguarda uma decisão do responsável

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (com deficiência de posto sem linhas de base com a Terra; três linhas de base restauram o posto completo — o limiar de 3 estações a partir do posto da informação, não do erro de solução; CRLB das estações atingido pelo estimador com eficiência { "0.98" }; o CRLB aperta-se monotonicamente com as linhas de base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Referência: os valores que o LSIS V1.0 imprime para validação (Tabelas C-1 a C-5, D-1 a D-6, E-1 a E-6) e os seus ficheiros de código eletrónico do Anexo { "3" }, sob um critério de zero discrepâncias fixado antes da comparação. O critério é falhado por uma célula impressa que é internamente inconsistente com o próprio ficheiro do Anexo { "3" } da norma, pelo que a linha continua MODELLED; está redigida uma nota de errata. Os mesmos chips são também iguais aos do LANS-AFS-SIM (linha «Renderização em banda de base do LunaNet AFS face a um gerador independente, dado o seu estado de canal»)

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registos de comprimento máximo, equilíbrio de Legendre, ciclo completo do atraso G2, composição de níveis); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sem a cache LSIS: quatro números citados fixam a constatação; com ela: { "2 937 232" } chips e bits face aos ficheiros do Anexo { "3" } do LSIS, primeiros/últimos { "24" } chips impressos, Tabelas de Legendre D-1 e E-1 e inicializações de G2 dão exatamente um item diferente, a célula «últimos { "24" } chips» do PRN { "147" } da Tabela E-5, que duplica a do PRN { "151" } enquanto o ficheiro do Anexo { "3" } concorda com o gerador); o teste estrito pré-registado afs_codes_match_lsis_v1_tables_and_annex3_bit_exact é ignorado com essa lacuna

# text
seg-f30130dca525 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Biblioteca: PocketSDR-AFS (T. Ebinuma a partir do PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, compilação em banda S, cópia só de impressão com nível de registo), sob critérios fixados antes de cada execução. A terceira comparação pré-registada satisfaz plenamente os seus limiares de descodificação e de seguimento C1 e C2, mas não a sua salvaguarda G0 tal como escrita (duas execuções do recetor não modificado diferem nos mesmos quatro registos de aquisição), e a segunda falhou por { "5" } violações, pelo que a linha continua MODELLED. O LANS-AFS-SIM e o PocketSDR-AFS partilham um autor e contam como uma única implementação independente; as verificações da linha de codificação de tramas com vetores impressos protegem contra uma leitura errada partilhada

# text
seg-8cd700abad59 = lunar_afs::waveform (gravação e etiquetas de referência), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (terceiro pré-registo: { "2" } nós, { "4" } canais seguidos, pior erro de Doppler { "0.57" } Hz, pior erro de desvio de código { "0.008" } chip, todas as { "6" } tramas descodificadas com o TOI correto através da passagem { "99" } -> { "0" } e com a subtrama { "2" } coincidente; G0 não satisfeita tal como escrita, a variação do próprio recetor entre execuções nos seus registos de aquisição); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segunda: { "5" } violações); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primeira: nula); os testes estritos dos três ficheiros são ignorados com as suas lacunas

# text
seg-2f05d26e8be6 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — gps-sdr-sim (MIT, commit 28ca29a6, executado como programa separado através de um ambiente de teste consolidado), pré-registado f88f2969 com um limiar exato ao bit em (A) chips C/A, (B) cada campo LNAV calculado, (C) cada bit de paridade. CONSTATAÇÃO: (A) { "0" } de { "32 736" } chips diferem, (C) a paridade de { "0" } de { "1 920" } palavras difere, (B) { "230" } de { "1 152" } campos calculados diferem de uma unidade: o eph2sbf do gps-sdr-sim trunca para zero com conversões de C onde o inteiro difundido exige arredondamento (cada valor diferente situa-se a menos de { "0.01" } de uma unidade do inteiro arredondado do Kshana). Continua MODELLED: o limiar registado era a conjunção

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (constatação fixada); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (estrito, ignorado com a lacuna); gps_lnav::tests

# text
seg-d61a6fd7896c = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Amostras I/Q do gps-sdr-sim (MIT, commit 28ca29a6) e o seu próprio estado de canal, pré-registado 7777da53: (B1) cada PRN simulado adquirido, (B2) nenhum outro PRN adquirido, (B3) fase de código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. CONSTATAÇÃO: B1, B3 e B4 mantêm-se em ambas as janelas (pior { "0.195" } chip, { "72" } Hz), mas B2 falha: todos os { "21" } PRN que o gps-sdr-sim não simulou também ultrapassam o limiar (estatística { "151" } a { "206" } contra { "79.5" }; PRN simulados { "1 300" } e superiores). O limiar é definido para ruído gaussiano da potência de amostra medida; o gps-sdr-sim não acrescenta ruído, pelo que as células de um PRN ausente contêm a correlação cruzada dos outros satélites. Continua MODELLED: o limiar registado era a conjunção

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (constatação fixada); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (estrito, ignorado com a lacuna)

# text
seg-9f9b58158cde = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — As formas fechadas próprias dos monitores em cenas GPS L1 C/A do próprio Kshana (ruído e sinais legítimos; eventos de atenuação dos sinais dos próprios satélites), face a limiares pré-registados em docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). CONSTATAÇÃO: M1, M2 e M4 atingidos. M3 atingido na deteção ({ "18" } de { "18" } atenuações, P_md { "0" }) e NOT MET na sua cláusula de temporização: o tempo mediano até à deteção é { "1.001" } s contra { "2" } x ARL1 amostras = { "0.433" } s. O CUSUM vê uma estimativa por janela de { "1" } s, pelo que o limite em número de amostras é inferior a uma amostra. Apenas consistência interna: não é verificado nenhum recetor real nem interferência gravada

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } blocos face ao intervalo binomial a { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razão { "0.0131" } face a { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } face a { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estrito, ignorado com a lacuna); testes de iq::campaign::detect; testes de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (os resumos fixados ficam inalterados sem a tabela)

# text
seg-491de717dd05 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Campanhas sintéticas a partir de cenas GPS L1 C/A do próprio Kshana (atenuações dos sinais dos próprios satélites), face a limiares pré-registados em docs/design/DETECTION-ROC.md (b47e358d). CONSTATAÇÃO: R2 atingido (nível de acaso sem nada a detetar). R1 NOT MET: AUC de cn0_drop { "0.7855" } face a { "0.95" }, porque cada janela negativa posterior a um evento herda da deteção o decaimento do CUSUM (todos os { "18" } negativos posteriores ao evento chegam a { "81" } ou mais; todos os { "18" } anteriores ao evento ficam em { "0" }). Apenas consistência interna: não é verificado nenhum recetor real nem interferência gravada

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } em eventos declarados que não atenuam nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estrito, ignorado com a lacuna); testes de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Recuperação sintética de parâmetros em cenas GPS L1 C/A do próprio Kshana com um perfil de C/N0 conhecido imposto a partir da fórmula da secção { "3.1" }, seguido e avaliado por kshana iq campaign, face a limiares pré-registados em docs/design/LABFIT-FROM-IQ.md (secção { "5.1" }, alterada em 2026-10-12 em b7117bf, secção { "13" }). O estimador de C/N0 das campanhas (M2M4) foi fixado em 5b13e3c2, enviado antes da primeira avaliação de limiares (consolidado em conjunto com o código de ajuste, não isoladamente), após uma execução de seguimento de diagnóstico divulgada. CONSTATAÇÃO na campanha de limiares de 18 eventos: (c) PASS; (a') NOT MET, erro de delta_eff -1.097 dB face a { "0.5" } dB (ainda -0.89 dB em intervalos a { "38" } dB-Hz e acima); (b') NOT MET, { "0" } de { "50" } campanhas cobrem a referência (erro -1.189 +/- { "0.093" } dB, intervalo de cerca de { "0.3" } dB); (d) NOT MET, forma fechada { "2.20" } dB abaixo do J/S direto na perda, cerca do tempo de permanência da queda ajustado vezes a taxa da rampa ({ "2.09" } dB); as cláusulas originais de Q de (a) e (b) são NOT MET porque Q não é identificável. SEGUIMENTO (limiares pré-registados em 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): numa campanha de J/S em degraus, delta_eff é recuperado dentro de +{ "0.185" } dB (S1 MET: o erro da rampa é atraso do estimador); (d) tal como escrito nela é atingido pelo modelo do ciclo de seguimento ({ "0.45" } dB) mas não pelo empírico ({ "6.42" } dB), pelo que S2 é NOT MET; numa nova campanha de rampa, (d) com os tempos de permanência da queda ajustados mais a taxa de rampa de cada evento fica dentro de { "1" } dB para ambos os modelos (R1 MET), e (a') e (d) tal como escritos falham de novo (-1.25 dB; { "2.32" } e { "9.47" } dB). O método é verificado, não qualquer recetor: não pode ser VALIDATED a partir de dados sintéticos

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura PI90 { "0.891" } em { "558" } intervalos, { "0.900" } em { "10" } eventos de tempo até à perda sob cada modelo de bloqueio), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash e veredictos de [validation], auditoria do bloco de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db e bar_b_prime_ci_subset (estritos, ignorados com a lacuna); bar_b_prime_full_set_of_50_campaigns (ignorado, executado antes da publicação); testes de iq::labfit::cn0 (degenerescência exata Q-delta, recuperação de delta ao Q declarado, inverso de limiar de forma fechada); testes de iq::labfit::iqfit (as condições do modelo de bloqueio reproduzem exatamente o modelo de C/N0); tests/iq_labfit_followup.rs (o seguimento registado em 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign a afirmar o NOT MET registado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, em release)

# text
seg-52d2a721c38a = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — decode_word/decode_frame do RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) como programa separado, pré-registado ca5f0142: R1 paridade e descodificação, R2 valor descodificado igual ao inteiro do Kshana vezes a escala da IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de meio quantum da entrada. CONSTATAÇÃO: R1 { "960" } de { "960" } palavras e { "96" } de { "96" } subtramas; R3 todos os parâmetros, semana e tempos de referência exatos; R2 falha em { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades na última casa porque o P2_43 do RTKLIB é o decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo a { "2" }^-43; dividir pela constante do RTKLIB devolve o inteiro do Kshana em todos os casos. Continua MODELLED: o limiar R2 registado era demasiado apertado para a própria constante da referência independente

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constatação fixada); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estrito, ignorado com a lacuna)

# text
seg-d0d7bf57aa68 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — readrnx do RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) a analisar o ficheiro de difusão diário do IGS BRDC00IGS_R_20250610000_01D_MN.rnx e decode_word/decode_frame a descodificar as palavras do Kshana, executados como programa separado; pré-registado d4d9eb9d antes de o ficheiro ser obtido, limiar de inteiro exato. Mutação: truncar em vez de arredondar dá { "235" } falhas. Comparações anteriores do mesmo codificador estão registadas como constatações: face ao gps-sdr-sim, que trunca ({ "230" } campos), e face aos valores escalados do RTKLIB, cuja constante decimal { "2" }^-43 falhou um limiar de uma ulp ({ "41" } valores). Pós-verificação do integrador (continua MODELLED): a comparação concorda e uma mutação do conjunto de paridade também a torna vermelha, mas o pré-registo d4d9eb9d chegou ao ramo público às { "20" }:{ "02" }:{ "29" } UTC, dois segundos depois do commit de resultado 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) que já contém a saída do RTKLIB para o ficheiro, pelo que a ordem «registado antes de o ficheiro ser obtido» não pode ser demonstrada; um novo registo enviado antes de um ficheiro de difusão nunca visto ser obtido resolveria a questão

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites do ficheiro de difusão do IGS de { "2" } de março de { "2025" }: { "960" } de { "960" } palavras passam a paridade do RTKLIB, { "96" } de { "96" } subtramas descodificam, { "608" } de { "608" } inteiros difundidos descodificados são iguais aos do Kshana, cada entrada dentro de meio quantum, semana e tempos exatos); gps_lnav::tests

# text
seg-407f33fff57c = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — GNSS-SDR { "0.0.19" } (GPL-3.0, programa separado, configuração fixada) nos nove lotes L1 sem superfície e no C/N0 RAW do recetor de voo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), pré-registado 768cb62b. CONSTATAÇÃO: o leitor do Kshana descodifica todos os { "288" } intervalos comparados de forma idêntica à de um conversor independente; o GNSS-SDR declara { "266" } de { "288" } pesquisas positivas e o Kshana concorda em todas as { "266" } decisões, mas apenas { "250" } são localizadas na célula do GNSS-SDR (A2 falha); a parte do C/N0 é vazia, sem nenhuma época RAW de voo a menos de { "30" } s de qualquer lote (a mais próxima a { "141" } s). A maioria dos positivos são artefactos: os níveis simples em complemento para dois têm uma média de -0.5 em I e Q, uma linha de frequência zero { "32" } dB acima do ruído num intervalo de { "1" } kHz, que ambos os recetores adquirem. Dois lotes (OP5, OP12) foram excluídos por engano: uma leitura dos seus metadados com os dígitos retirados foi tomada por uma contradição com os cabeçalhos; a causa real era que o leitor não conseguia ler uma amostra mais larga do que uma palavra (entretanto corrigido). Continua MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constatação fixada, condicionada por dados); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estrito, ignorado com a lacuna); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-90535435d10d = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registado 0d1839d2. CONSTATAÇÃO: todas as { "288" } pesquisas ultrapassam o limiar com ruído (estatísticas de potência de amostra de cerca de { "430" } a { "520" } contra { "346.3" }), pelo que P1 se verifica trivialmente e P3 se verifica ({ "274" } de { "288" } previstos como visíveis) enquanto P2 falha em { "4033" } de { "4036" } pares. O front-end de banda limitada eleva o ruído de cada célula cerca de { "1.46" } vezes (fixado: piso de ruído { "292" } contra o ruído branco de { "200" } no OP2 PRN { "1" }), o que a estatística de potência de amostra não vê. Continua MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constatação fixada, condicionada por dados); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estrito, ignorado com a lacuna)

# text
seg-46dbb16e2ba8 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registado a81a9a4e. CONSTATAÇÃO: P1 e P3 verificam-se ({ "4" } lotes, { "12" } de { "12" } aquisições previstas como visíveis) mas P2 falha em { "8" } de { "8" } pares. Os dois pares mais fortes coincidem com a previsão em magnitude com o sinal invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medido, -7693.9 previsto; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), pelo que a ordem registada com I no nibble inferior é o conjugado da dos lotes; as seis deteções logo acima do limiar não coincidem com nenhum dos sinais. A dispersão de Doppler do refinamento ({ "30" } a { "50" } Hz entre duas execuções) foi também subestimada pelo registo. Continua MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constatação fixada, condicionada por dados); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-e10ffc7f4280 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Doppler previsto a partir das órbitas finais ESA/ESOC e do núcleo do local de alunagem NAIF CLPS Firefly (xval/lugre-predicted-doppler/predict_surface.py, independente do Kshana), pré-registado 2108e6ff em lotes nunca abertos antes. CONSTATAÇÃO: a não vacuidade falha; nenhum lote contém duas aquisições. OP40 excluído (os metadados nomeiam um ficheiro em falta); OP38, OP73, OP77_0, OP77_1 não adquirem nada e não mostram falso alarme a { "1e-7" } (estatísticas máximas { "325" } a { "356" } contra { "385.9" }); OP74 e OP76 adquirem o PRN { "31" } e OP78_0 e OP78_1 o PRN { "12" }, cada um isolado, todos previstos como visíveis. Continua MODELLED. Desvios divulgados: o limiar de Doppler de { "10" } Hz registado assenta num Monte Carlo sintético do refinamento coerente, e não na dispersão dos lotes já vistos que o integrador pedira; OP40 foi excluído antes da execução porque os seus metadados nomeiam um ficheiro de amostras que o conjunto de dados não distribui

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constatação fixada, condicionada por dados); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-9b89d7ff555a = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidade diferencial de cancelamento de erros + reutilização da maquinaria PL SBAS da DO-229E; a diferença simples + solução WLS é adicionalmente verificada face a lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de resolução independente, mas a mesma álgebra de primeira ordem de diferenças de LOS, pelo que continua a ser InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (o modo comum do relógio cancela-se exatamente; o resíduo cresce com a linha de base; reutiliza o PL SBAS; a contagem de satélites é respeitada até ao limite de { "24" } do construtor, pelo que uma constelação maior não pode devolver silenciosamente uma menor); tests/lunar_differential_pnt_reference.rs (resíduo de diferença simples + solução de posição WLS face a lsq() do RTKLIB compilado a partir do código-fonte em C)

# text
# c1: oem
seg-4d32db579be8 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — a exportação OEM lunar do kshana relida pela biblioteca independente de terceiros <c1/> (R. J. Anderson): os tokens de referencial/tempo e o estado por época concordam até à precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — um ciclo completo de intercâmbio estrutural; a semântica física de referencial/tempo lunar é validada pelas suas próprias linhas, pelo que isto continua MODELLED. { "0.30" } comparação externa, uma constatação (continua MODELLED): um segundo leitor independente, o analisador CCSDS OEM do Orekit { "12.2" } (Apache-2.0, predefinições estritas), recusa ambos os ficheiros lunares porque não implementa os sistemas de tempo LTC e TCL (descodifica o OEM EME2000/UTC da crate, e descodifica os ficheiros lunares quando TIME_SYSTEM é substituído por TDB); o oem { "0.4.5" } descodifica-os dentro da precisão escrita apenas ao recorrer ao sistema de tempo não suportado como alternativa. O intercâmbio destes ficheiros lunares com leitores CCSDS convencionais não está estabelecido

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (o OEM transporta REF_FRAME/TIME_SYSTEM lunares; os metadados de tempo fazem ciclo completo; envelope KIF); tests/lunar_interoperability_export_reference.rs (o OEM lunar emitido pelo kshana relido pela biblioteca Python independente <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época até à precisão do formato; uma exportação corrompida é rejeitada); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Fórmulas por métrica derivadas à mão: diversidade de Simpson inversa, compósito de média ponderada, durações de cronologia limitadas/ilimitadas, escada de níveis pelo elo mais fraco

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonia, limites do compósito, teto de nível, proveniência modelada); resilience::diversity::tests (Simpson inversa, modo comum, SPOF)

# text
seg-173a6b137751 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de estatísticas de postos de forma fechada (tau em [-1,{ "1" }] com valores calculados à mão; Dirichlet determinístico com semente) e testemunhos estáveis/instáveis construídos

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemplo à mão de tau de Kendall, simplex de Dirichlet, taxa de inversões); resilience::study::tests (controlo de estabilidade, testemunho de instabilidade, declarado-versus-medido, colapso da diversidade)

# text
seg-6ee8465d60c7 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Invariantes de forma fechada que correspondem à disciplina de compliance «representatividade justificada + lacunas até ao voo identificadas»; ligado à fronteira entre estado de verificação e tipo de referência independente

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, campos JSON)

# text
seg-177c7c6f506a = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de benefício/vencedor de forma fechada + envolvimento fiel do quantum_trade::TradeResult existente; honestidade ligada ao registo de representatividade e às etiquetas de verificação

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridade do benefício maior/menor-é-melhor, envolve fielmente um TradeResult real, evidência desonesta rejeitada, FoM validada precisa de âncora externa, JSON determinístico)

# text
seg-05e779241ded = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Coeficientes de relógio/CAI reutilizados (holdover/clock_state, valores publicados) + identidades de forma fechada de ruído de disparo/perda para a ligação de entrelaçamento

# text
seg-fe77856b9e9d = quantum_devices::tests (cartões de relógio honestos+ordenados; precisão do entrelaçamento ~1/sqrt(tau); taxa detetada -10x/10dB; contagens no escuro degradam; limites do piso sistemático; cartão modelado+válido)

# text
seg-06a01a48fcad = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Orçamento em quadratura de forma fechada sobre núcleos validados reutilizados (ADEV face a Stable32/NIST; limite TPL; deteção analytic_pd/pmd); honestidade ligada ao registo de representatividade

# text
seg-65f4bc801f94 = timetransfer_chain::tests (a precisão melhora com a integração; o quântico pode ganhar E perder; PL finito-positivo; FoM de segurança em [{ "0,1" }] e cresce com o atraso do ataque; Pd de anomalia monótona; a comparação is_honest)

# text
seg-6ccf2bd93426 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Orçamentos inerciais reutilizados verificados face a uma dupla integração independente em Octave da mesma EDO de navegação estimada (tempo de execução diferente, modelo partilhado → ReferenceImpl) mais o ruído de curto prazo publicado de Freier-2016 como âncora unilateral; o compósito quântico-versus-clássico continua MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (o quântico supera o clássico numa falha longa; a vantagem depende da duração da falha; a comparação is_honest); tests/gnss_free_quantum_navigation_reference.rs (crescimento da posição por navegação estimada face a uma dupla integração independente em Octave + a âncora de ruído publicada de Freier-2016)

# text
seg-a06ba11bd079 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — AUC gaussiana de forma fechada = Phi(mu/(sigma*sqrt2)) verificada face ao eval_stats::bootstrap_auc_ci validado externamente (face a scikit-learn) + limiares analíticos de deteção

# text
seg-8e49ee940482 = quantum_faults::tests (valores conhecidos da AUC analítica; a AUC bootstrap empírica contém a forma fechada; o quântico deteta falhas menores / AUC mais elevada; a vantagem desaparece para falhas enormes; catálogo de 5 classes; a comparação is_honest)

# text
seg-c38a05cc3fdb = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Autoconsistência do estimador e da geometria: ciclos completos direto→inverso, a identidade de Fisher/CRLB J·CRLB=I, monotonia do GDOP, e o estimador a atingir o seu próprio limite de Cramér–Rao sob ruído de Monte-Carlo — verificações de consistência interna, NÃO um conjunto de dados externo, pelo que a linha continua a ser InternalConsistency. Geolocalização passiva MODELLED — modelo de linha de vista de fonte pontual; sem termos de multipercurso / NLOS, de enviesamento do relógio do recetor ou de refração atmosférica. { "0.30" } ronda { "2" }, face a Ho e Chan { "1993" } e Ho e Xu { "2004" } (pré-registada f89018b8, { "1" } % de cada valor impresso), uma constatação (continua MODELLED): o limite TDOA com restrição de superfície reproduz os fatores geométricos de { "40" } N (-0.11 %, -0.02 %) e o TDOA máximo; o limite conjunto TDOA+FDOA reproduz a Fig. { "6" } (+{ "0.06" } %, -0.17 %) e, na fonte que o código dos próprios autores nomeia para a Fig. { "7" } (alteração escrita depois de o resultado ter sido visto, divulgada), a Fig. { "7" } (+{ "0.11" } %, -0.02 %); é igual ao código do limite publicado pelos autores (estilo BSD, executado em GNU Octave) até { "3e-12" }; o resolvedor de máxima verosimilhança ponderado pela covariância atinge o limite impresso (+{ "0.3" } a +{ "0.4" } %). Os fatores de Ottawa que o artigo imprime a partir de um Monte Carlo ({ "251" }, { "7.1" }) diferem em +{ "1.3" } % e +{ "4.4" } %, fora do limiar de { "1" } %

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sem ruído direto→inverso até { "1e-6" } m; J·CRLB=I com uma covariância PD simétrica; o traço da variância de posição do CRLB não aumenta quando se acrescenta um recetor; TDOA+FDOA conjunto recupera a posição+velocidade de um emissor em movimento; <{ "4" } recetores rejeitados); tests/geolocation_reference.rs (ciclos completos em quatro geometrias com uma rede diversificada em 3-D; o estimador de Gauss–Newton atinge o seu limite de Cramér–Rao — a covariância do erro empírico acompanha o limite analítico ao longo de { "4000" } ensaios de Monte-Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound e finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fixados)

# text
seg-8ac63d14e24b = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a relação e as constantes tal como impressas no NASA TR R-376, uma verificação de convergência de meio passo, e a ordenação esperada dos picos de aquecimento e de desaceleração. O QUE NÃO É: nenhum valor de aquecimento publicado foi comparado (os artigos da Stardust dão um limite de projeto e uma estimativa convectiva mais radiativa de cerca de { "1200" } W/cm2, que uma relação só convectiva não consegue igualar); sem aquecimento radiativo, sem correção de temperatura de parede ou de catalicidade, nem resposta da proteção térmica.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (regista { "746" } W/cm2 para a Stardust sem limiar)

# text
seg-1f6aec0085c2 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas: a MTF de difração a meio da frequência de corte, o bordo em rampa de um píxel de uma abertura de detetor pura (RER { "1" }), o bordo de CDF normal de um desfocado gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), o escalonamento do ruído de disparo, e os coeficientes do GIQE { "4" } tal como publicados (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). O QUE NÃO É: nenhum gerador de imagem externo, MTF medida ou imagem classificada foi comparado; o GIQE é uma regressão empírica com o seu próprio erro; sem luz parasita, MTF atmosférica, compensação de MTF nem aliasing.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a identidade exata velocidade de fim de queima = soma de Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo abaixo de { "1e-6" } m/s), a equação de Tsiolkovsky numa queima vertical no vácuo com a gravidade como única perda, e as pressões US76 ao nível do mar e na tropopausa. O QUE NÃO É: as perdas de nenhum veículo publicado foram comparadas; sem rotação da Terra, deriva livre, regulação de tração nem guiamento além do pontapé; C_D constante; não é um otimizador de trajetória.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: o modelo direto e a equação resolvida concordam até { "1e-15" } s, o termo de Sagnac é igual à forma de ciclo omega/c^{ "2" } independente do BIPM 2A do módulo, o termo ionosférico é { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, e os processos de ruído mostram as suas formas de TDEV esperadas. O QUE NÃO É: nenhuma medição TWSTFT real nem relatório de calibração foi comparado; os atrasos e incertezas indicados são entradas, não medidos; as estabilidades de séries fornecidas são comunicadas, não validadas.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (a equação bidirecional recupera exatamente o desvio; o termo de Sagnac é igual à forma fechada de ciclo do BIPM; o termo ionosférico segue a divisão de frequências e a troposfera cancela-se; a fase flicker tem um TDEV plano; um resíduo diurno eleva o TDEV perto de meio dia; um enviesamento de reciprocidade desloca o desvio e não o TDEV; a estabilidade da série remove uma taxa); time_transfer_budget::tests

# text
seg-4ca4b46b128c = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — A numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } a { "30" } dígitos, quadratura tanh-sinh na variável de altura original e densidades gama-gama de Bessel-K) que não partilha código com o Kshana, sob limiares fixados antes de qualquer implementação existir (xval/optical-atmosphere/PREREGISTRATION.md). PORQUE É MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, pelo que verifica a implementação das fórmulas declaradas e não a atmosfera; não é usado nenhum exemplo de validação ITU-R nem nenhum registo medido de cintilação ou de extinção em percurso oblíquo (os valores ITU são uma decisão de licença em aberto e são mantidos fora do repositório). O nível do perfil de Cn2, a visibilidade, as alturas de escala de aerossóis e moleculares, o comprimento de percurso de média de abertura e o ajuste de momentos usado para aplicar a média de abertura aos parâmetros gama-gama são entradas ou convenções declaradas. Uma linha de fonte no módulo regista que um levantamento amplamente copiado imprime o segundo expoente de cintilação como 7/6 onde Andrews e Phillips dão 5/6; a forma 5/6 é a implementada

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (limiares pré-registados A1-A3 face à referência independente mpmath: { "216" } pontos da grelha de Rytov pior erro relativo { "3.4e-7" } face a um limiar de { "1e-6" }, cintilação pior { "4.5e-16" }, fator de abertura pior { "5.7e-16" }, { "96" } probabilidades de desvanecimento gama-gama pior { "1.3e-12" } em log10, profundidade ótica de nuvem e de céu limpo pior { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (limiar A5: o orçamento de ligação de perda agregada e as saídas existentes de disponibilidade de local são idênticos ao bit ao commit base em { "1,000" } conjuntos de parâmetros)

# text
seg-6cf381ac2e3d = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: limites de forma fechada e monotonia do modelo de diversidade, a forma fechada do teto de nuvens e as identidades de indisponibilidade log-normal. NÃO é reclamada nenhuma referência independente externa e nenhuma foi comparada: não é usado nenhum registo medido de disponibilidade de estação terrestre ótica nem de linha de vista sem nuvens. PORQUE É MODELLED: o clima de nuvens (probabilidade de nuvem, mediana e dispersão da coluna de água líquida, durações de indisponibilidade), a independência entre nuvens e turbulência, a forma de cópula gaussiana, o comprimento de descorrelação e cada ganho de técnica são pressupostos; os cenários incluídos declaram climas ILLUSTRATIVE, não um conjunto de dados. Promover esta linha exige um registo de disponibilidade medido e citado e um limiar registado antes da comparação

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (limiar A4: rho = { "0" } é igual à união independente e rho = { "1" } ao melhor local isolado até { "1e-12" }, e zero violações de monotonia no número de locais e na correlação; a primeira execução deste limiar falhou por { "3e-9" } porque a CDF normal em uso era a forma de Abramowitz-Stegun de { "1.5e-7" }, um defeito de implementação substituído pela CDF da gama incompleta com o limiar inalterado); optical_weather::tests e optical_sitediv::tests (margem monótona, o teto de nuvens como forma fechada, as identidades de duração de indisponibilidade, inversão da pesquisa de margem)

# text
seg-1d817d8409d3 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna com o módulo de holdover, bit a bit; NÃO é reclamada nenhuma referência independente externa. Os PSD das classes são os pisos sintetizados de tau longo que o módulo de holdover já traz, pelo que os valores herdam a sua ressalva declarada de que o holdover até um limiar apertado é governado pelo piso de ruído vermelho assumido e não pelo desvio de Allan citado. As durações de indisponibilidade são um modelo log-normal com parâmetros declarados, não um registo medido de permanência de nuvens

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (limiar A6: o erro de temporização por indisponibilidade é igual a holdover::coast_phase_sigma e o erro de alcance é igual a phase_to_range_m bit a bit em { "9" } relógios, { "3" } durações médias, { "3" } dispersões e { "4" } quantis); optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas consistência interna; NÃO é reclamada nenhuma referência independente externa e nenhuma existe para uma realização meteorológica. As verificações comparam uma extração com a saída estatística do mesmo modelo, pelo que um resultado positivo diz que o gerador amostra as distribuições declaradas (a disponibilidade e a fração de nuvens da extração situam-se dentro de tolerâncias pré-registadas dos valores declarados), não que qualquer local real se comporte assim. A série é uma realização, não o clima: a sua disponibilidade difere da declarada pelo erro de amostragem da extração, e as amostras de cintilação em passos diferentes são independentes, uma simplificação declarada de um processo que se descorrelaciona em milissegundos. As entradas meteorológicas continuam a ser os pressupostos do cenário.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (limiares T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixados antes da primeira execução: a mesma semente dá os mesmos bytes e outra semente dá outros bytes; nenhuma chave sem a tabela; ao longo de { "8760" } h a { "600" } s, sementes { "37" } e { "38" }, a disponibilidade realizada de cada um dos três locais predefinidos dentro de { "6" } pontos da declarada (pior { "3.3" }) e a fração de nuvens realizada dentro de { "5" } pontos da probabilidade declarada (pior { "2.1" }); a margem é igual ao orçamento menos os dois desvanecimentos e «up» é igual a margem não negativa em cada passo; nenhuma chamada matemática não portável no módulo; execuções demasiado longas e passos inválidos recusados)

# text
seg-4dfa142a94c4 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — A etiqueta PDS3 que o processo de condicionamento de dados de navegação da DSN produziu com o ficheiro (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), verificada face a limiares pré-registados em xval/mro-odf/PREREGISTRATION.md antes de o leitor existir. MODELLED porque um limiar registado (as linhas da tabela de fim de ficheiro, { "121" } no ficheiro contra { "120" } na etiqueta) falhou; a etiqueta é internamente inconsistente aí. Fase { "2" } (xval/mro-od/PREREGISTRATION.md, alterações A1 e A2 antes do resultado avaliado): o Doppler previsto a partir da reconstrução da equipa de navegação da MRO (mro_psp5, NAIF) coincide com o Doppler de 2 vias com rampa observado até { "12.5" } mHz em passagens não usadas no desenvolvimento, limiar atingido; a determinação de órbita registada falhou no arco avaliado (matriz normal não definida positiva) e não produziu órbita, pelo que os limiares de órbita não foram atingidos. A execução { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, um estimador amortecido, o mesmo arco e limiares, uma alteração de avaliação R2-A1 divulgada em docs/revisions) convergiu: a órbita estimada está a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução, limiares atingidos, mas o RMS do Doppler após o ajuste é de { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido, pelo que a linha continua MODELLED. O QUE NÃO É: nenhuma órbita estimada atingiu todos os limiares registados; a ionosfera, o plasma solar e a maior parte do desvio de antena (um desvio radial de { "1.5" } m é ajustado na passagem de desenvolvimento) não são modelados.

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK tipo { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (um ODF real da MRO, 2007-304/305, face à sua etiqueta PDS: a contagem de registos, as posições dos grupos, as estações, as horas de início e de fim e os tipos de dados verificam-se; a contagem de linhas da tabela de fim de ficheiro falha por uma, uma inconsistência da etiqueta, fixada como constatação); odf::tests (ciclo completo de registo construído à mão, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (condicionado por dados, entradas fixadas por SHA-256, CI mensal com dados reais obrigatório: Doppler previsto a partir da reconstrução de navegação da MRO mro_psp5 nas passagens avaliadas DSS { "63" } e DSS { "14" }, { "12.5" } mHz RMS, limiar { "30" } mHz, atingido; a determinação de órbita registada não produziu órbita, fixada como constatação; execução { "2" } com um estimador amortecido, registada em separado: órbita { "0.36" } km RMS e { "0.53" } km no máximo face a mro_psp5, atingido, Doppler após o ajuste { "48.6" } mHz contra { "30" } mHz, não atingido, fixado como constatação; leitor SPK tipo { "1" } face ao CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-8566593647ee = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: o erro de estimação normalizado ao quadrado do filtro face à verdade simulada a partir dos mesmos modelos de sensores ao longo de sementes de Monte Carlo, e a convergência das estimativas de atitude e de enviesamento. O QUE NÃO É: nenhum estimador externo nem dados de voo foram comparados (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensores são os de manual, sem desalinhamento, fator de escala nem efeitos de campo de visão do seguidor de estrelas.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } sementes, NEES médio de seis graus de liberdade na segunda metade dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna, a partir de três quantidades calculadas por expressões diferentes na mesma varredura e depois exigidas a fechar. Os segundos de abertura de navegação, os segundos de abertura de comunicações e os segundos de abertura ociosos são acumulados separadamente — os ociosos a partir de (aberturas − |servido|) por intervalo elementar, nunca como um resto — e a sua soma é afirmada face a aberturas × horizon_s, o que uma fronteira mal delimitada, um intervalo contado duas vezes ou omitido quebra de imediato; os tempos servidos por sessão são exigidos em separado a somar de volta os dois totais de serviço. As propriedades estruturais do escalonador são medidas e não assumidas: o tempo servido é afirmado não decrescente no número de aberturas ao longo de { "200" } planos pseudoaleatórios para as três políticas (não óbvio para a política sem preempção, em que uma abertura adicional muda quem detém o quê em cada fronteira posterior), e a aritmética de fronteira é fixada no par tangente/sobreposição de um segundo onde um erro de uma unidade se esconderia de outro modo. A ponte do previsor de passagens é verificada face à saída de <c1/>: com uma abertura e nenhum serviço concorrente, os segundos de abertura de navegação são iguais à soma das durações de passagem do próprio previsor. Não é reclamada nenhuma referência independente externa e nenhuma existe: a capacidade substitui a aritmética manual em vez de ser verificada face a ela, o plano de contactos incluído é ilustrativo e não voado, e nenhum escalonador operacional publica um par plano-mais-resposta com a sua regra de arbitragem declarada — um ciclo de trabalho calculado sob uma política não declarada não é comparável com um calculado sob uma declarada, e a dependência da política é medida (ciclos de trabalho de navegação de 100/150 contra 50/150 no plano idêntico). O tempo de reorientação e de mudança, o volume de dados, o estado dos buffers, a energia e o fecho da ligação são excluídos na etiqueta do relatório em vez de modelados silenciosamente

# text
seg-4da98593fe6a = aperture_duty::tests (uma janela que termina exatamente quando a seguinte começa não disputa, e movê-la um segundo para trás custa exatamente um segundo — a proteção contra erro de uma unidade; janelas sobrepostas além do número de aberturas põem a sessão de classificação inferior em indisponibilidade, com o intervalo de disputa fixado; a política de arbitragem decide qual serviço detém a abertura, com os números das três políticas fixados num só plano; o primeiro a chegar é o primeiro a ser servido não faz preempção de uma sessão que já detém uma abertura; uma sessão que perde a arbitragem no seu início adquire uma abertura quando uma fica livre; os três ciclos de trabalho contabilizam cada segundo de abertura disponível em { "3" } políticas × { "4" } números de aberturas; acrescentar uma abertura nunca aumenta a indisponibilidade de nenhuma sessão, medido em { "200" } planos pseudoaleatórios × { "3" } políticas × cada número de aberturas; aberturas suficientes para cada sessão não deixam qualquer indisponibilidade; o horizonte de relatório corta o plano e define o denominador do ciclo de trabalho; uma lista de passagens previstas torna-se um plano de contactos sem um segundo tipo de janela; os números de ciclo de trabalho do plano incluído são saídas do motor para uma e duas aberturas; o relatório declara a política que produziu os números; cada valor comunicado traz uma unidade e uma classe de proveniência; o cenário é reprodutível e declara-se MODELLED; o cenário rejeita um plano que não consegue escalonar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Verificação cruzada da composição face a um caminho de código independente no repositório: cada J/S por ligação é rederivado como a diferença de dois orçamentos de ligação calculados com linkbudget::received_signal_power_dbw, cuja perda no espaço livre é a única expressão { "20" }·log10(4πRf/c) e não a soma de três termos que jamming::free_space_path_loss_db usa — as duas concordam a < { "1e-9" } dB em cada linha (pior caso medido { "7.11e-14" } dB, isto é, arredondamento de vírgula flutuante). A cadeia de interferência subjacente que compõe está ancorada externamente em separado em tests/gnss_denied_jamming_resilience_reference.rs (rederivação independente em numpy/scipy de J/S e C/N₀ efetivo fixada a Kaplan & Hegarty §{ "9.4" }, mais C/N₀ medido do JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); a geometria lunar que compõe é a geometria lunar_service/lunar com as suas próprias referências independentes. Identidades de forma fechada verificadas aqui: uma distância do interferente reduzida a metade acrescenta exatamente { "20" }·log10({ "2" }) dB a cada linha; J/S é exatamente invariante ao ganho no eixo da antena do utilizador enquanto o C/N₀ se move exatamente esse ganho; uma máscara de elevação não altera nenhuma linha restante ao bit. A própria linha continua ReferenceImpl/modelada: não existe nenhuma campanha medida de interferência lunar face à qual validar, e a constelação é uma geometria ilustrativa de fonte pública de classe Moonlight/LCNS, não uma efeméride voada

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } testes de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna face às funções diretas do próprio motor, que é tudo o que esta capacidade pode honestamente afirmar. Cada ponto do contorno é uma inversão de forma fechada, e cada inversão é verificada empurrando a sua resposta de volta através da função DIRETA com que as linhas do próprio relatório foram avaliadas: a coluna de J/S através de jamming::effective_cn0_dbhz (que tem de devolver tracking_threshold_dbhz a < { "1e-9" } dB-Hz), a coluna de distância através de jamming::free_space_path_loss_db e jamming::j_over_s_db (o mesmo J/S a < { "1e-9" } dB), a coluna de EIRP através de jamming::j_over_s_db à distância do próprio cenário. O contorno é ainda verificado como sendo a FRONTEIRA do conjunto de negação e não um ponto no seu interior — lock_status perde o bloqueio numa desigualdade estrita, pelo que o veredicto é medido a passar de DEGRADED para LOST ao longo de { "1e-4" } dB de J/S de cada lado do contorno, o que um contorno com um erro de um épsilon falharia. A verificação mais forte é por ligação e não por quantil: aplicar o mesmo mapa ao C/N₀ de cada linha reproduz exatamente a coluna de estado do relatório — { "0" } discordâncias em { "38" } de { "38" } linhas no ponto de operação documentado (kind = lunar-jamming, todas as entradas predefinidas exceto jammer.range_m = { "25 000" } m), onde { "26" } linhas estão LOST e { "12" } não estão. A monotonia é medida, não assumida: { "20 001" } amostras ao longo de [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violações de uma distância estritamente decrescente e de uma potência necessária estritamente crescente, pelo que a ordenação por quantis da banda é demonstrada e não afirmada. ExternalDataset é recusado e o estado validado com ele: não existe nenhuma campanha medida de interferência lunar face à qual comparar um raio de negação, a constelação é uma geometria ilustrativa de fonte pública de classe Moonlight/LCNS e não uma efeméride voada, e as entradas do contorno (EIRP, potência do interferente, ganhos de antena, temperatura de ruído) são magnitudes representativas. ReferenceImpl também foi considerado e recusado — a inversa e a expressão direta são a MESMA álgebra lida em dois sentidos, pelo que o ciclo completo deteta erros de transcrição e de sinal mas não é uma implementação independente; chamar-lhe verificação cruzada seria o movimento de independência emprestada que as invariantes da matriz existem para impedir. O que a banda traz é medido e citado e não afirmado: nesse ponto de operação o contorno de escalar único é { "27.402916" } km e coloca { "25" } km do lado negado para todas as { "38" } linhas, enquanto a banda { "21.256108" } .. { "29.921360" } km contém o ponto de operação e por isso comunica a divisão que a tabela efetivamente mostra. Os dois critérios são também medidos como discordantes — a banda de razão de potências ({ "38.186527" } .. { "53.691675" } km) não contém de todo { "25" } km — razão pela qual ambos são impressos

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } testes de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Duas referências independentes internas, nenhum conjunto de dados externo. ({ "1" }) Ciclo completo de forma fechada: o viés mínimo detetável é produzido invertendo a cauda do qui-quadrado não central sobre o parâmetro de não centralidade (raim::pbias) e é verificado devolvendo a não centralidade resultante através de raim::noncentral_chi2_cdf ao limiar do próprio monitor, que tem de devolver P_md. ({ "2" }) Injeção versus análise: um viés é escrito na estimativa de RF de um eixo e cross_raim::run_cross_raim é executado de novo, pelo que a estatística comparada com a não centralidade analítica é a que o monitor calculou, não uma rederivação. Um Monte-Carlo com semente da própria estatística é incluído nos testes como terceira verificação; está deliberadamente FORA do relatório, porque uma estimativa amostrada seria mais lenta e não reprodutível bit a bit. ExternalDataset é recusado: a quantidade é a potência de deteção DESTE monitor na alocação de sigma DESTE cenário, e as magnitudes de sigma pelas quais o MDB é escalado são entradas representativas modeladas, não medições. ReferenceImpl também foi considerado e recusado — o Monte-Carlo amostra a mesma estatística que a análise descreve, pelo que deteta erros de transcrição e de coeficientes mas não é uma implementação independente do monitor. { "0.30" } ronda { "2" } (pré-registada 0135a9e4), bloqueada (continua MODELLED): chi2/ncx2/brentq do SciPy { "1.18.1" } reproduzem o limiar do relatório (dentro de { "5.4e-12" }), o MDB por eixo, a curva de potência, o múltiplo de cruzamento e o tempo até à deteção em rampa (dentro de { "5.3e-10" }) em cinco configurações; as estatísticas de falhas injetadas não têm referência independente e as magnitudes de sigma são entradas modeladas, pelo que a delimitação aguarda uma decisão do responsável

# text
seg-83724a2a8e06 = hybrid_integrity::tests (a curva de potência de deteção vai da taxa de falso alarme com falha nula até { "1" } − P_md no viés mínimo detetável; o viés mínimo detetável devolvido através de noncentral_chi2_cdf ao limiar que o próprio monitor aplicou devolve P_md até { "1e-9" }, em todos os eixos e através do auxiliar público; um viés efetivamente injetado na estimativa de RF desloca a própria estatística do monitor exatamente de b²/(σ_rf² + σ_opt²) calculado à mão; um viés sem ruído é detetado acima de √(T/λ*)×MDB e falhado abaixo, com a escada injetada a enquadrar esse cruzamento; a potência de deteção é monótona na magnitude da falha e idêntica nos quatro eixos em múltiplos de MDB; um Monte-Carlo com semente de 200,000 amostras da estatística do monitor reproduz a potência analítica dentro de 4σ em quatro pontos da curva; o MDB de temporização é fixado acima do limite de alerta de temporização, o que é uma fraqueza medida e não uma funcionalidade; o quantil de Wilson-Hilferty é medido como discordante do limiar exato do monitor em ~{ "4" }%, registando por que não foi usado; o valor da rampa é exatamente MDB/taxa e escala inversamente com a taxa, e uma taxa não positiva comunica nulo em vez de zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Sem referência independente externa. O cruzamento é uma solução de forma fechada do crescimento da variância de passeio aleatório, e os testes recalculam-no de forma independente a partir dos valores que o próprio relatório publica e não a partir dos internos do emissor. A covariância inicial é fixada bit a bit ao traço que o bloco de transferência já existente comunicava, para que a deriva livre não possa propagar uma covariância que mais ninguém viu. Os PSD do ruído de processo são entradas representativas MODELLED e os tempos de cruzamento escalam diretamente com eles, o que o teste de escalonamento declara como propriedade medida e não como afirmação. ExternalDataset é deliberadamente recusado: o tempo de deriva livre é uma função direta de dois PSD modelados e de limites de alerta que são eles próprios representativos, e não existe nenhuma deriva livre de transferência ótica/RF lunar medida com que comparar. Uma referência independente externa aqui precisaria de uma curva publicada de crescimento de covariância pós-transferência ou de exatidão de holdover para um recetor comparável com o seu modelo de ruído de processo declarado, verificada até uma tolerância

# text
seg-f9767a6109d5 = hybrid_integrity::tests (a deriva livre começa exatamente do traço de covariância que o bloco de transferência comunica, nos dois sentidos, para que a diagonal reproduzida não possa divergir da transferência comunicada; o tempo de cruzamento comunicado é recalculado a partir do sigma de transferência, do PSD de ruído de processo e do fator de cobertura do próprio relatório, e o limite está dentro do limite de alerta imediatamente antes e fora imediatamente depois; o tempo de deriva livre escala exatamente de forma inversa com o PSD de ruído de processo e encurta-se quando o limite de alerta se aperta; uma deriva livre com PSD zero comunica nulo em vez de um tempo zero, porque nunca não é imediatamente; o perfil emitido cruza exatamente uma vez e enquadra o cruzamento comunicado; o tempo de duplicação da variância e o tempo de cruzamento do limite de alerta são fixados separados, sendo oito ordens de grandeza diferentes após a fase ótica apertada e dentro de uma ordem de grandeza após a fase RF laxa; abandonar a modalidade ótica dá mais tempo de deriva livre do que abandonar a RF, exatamente pela diferença de covariância dividida pela taxa de crescimento horizontal; e random_walk_time_to_limit separa já-fora, cruza-em-t e nunca-cruza)

# text
seg-903acaa666a9 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Misto, e separado em vez de agregado. O PADRÃO subjacente é validado externamente e mantém a sua própria linha (um ficheiro de teste scipy.special.j1 a < { "0.05" } dB em tests/validate_p1_orbital_footprint.rs, mais aqui a abcissa de meia potência de Airy publicada x = { "1.61634" } localizada por bissecção e não assumida). A GEOMETRIA é verificada face a trigonometria de triângulos de forma fechada escrita como uma expressão diferente do produto escalar em teste. A CONTENÇÃO do feixe real pelo cone aproximado é álgebra derivada (28.019/√η contra { "29.479" } graus por λ/D), pelo que a correção só pode ser não positiva para η ≤ { "0.9035" }. Mas as próprias CONTAGENS dentro do feixe não têm referência independente externa: nenhuma tabela publicada dá quantos satélites de uma camada de classe Moonlight/LCNS mantêm um local polar sul dentro do feixe de meia potência de um dado prato, e a constelação é uma aproximação ilustrativa de fonte pública, não uma efeméride voada. A discordância medida no ponto de trabalho documentado — { "0" } ligações no feixe com o padrão real contra { "28" } com a aproximação, −{ "2.33" } satélites por época, pior época { "3" }, em { "76" } ligações avaliadas — é, portanto, uma constatação MODELLED sobre a aproximação, fixada como literal de regressão (a linha mais próxima situa-se a { "0.069" }° de qualquer um dos bordos do feixe, quatro ordens de grandeza acima de qualquer discordância no último dígito), não um valor de cobertura validado externamente. Etiquetar a linha como ExternalDataset com base na âncora externa do próprio padrão seria validação emprestada, que é o movimento que as invariantes da matriz existem para impedir. { "0.30" } ronda { "2" } (pré-registada d9755d28), bloqueada (continua MODELLED): a geometria SPICE e as funções de Bessel do SciPy reproduzem o ângulo fora do eixo (pior { "3.0e-5" } graus), o ganho de Airy e os indicadores de dentro do feixe em { "6 336" } linhas de estados de orbitadores voados e do ponto de trabalho documentado; mas em geometria voada os indicadores dividem-se por identidade de satélite (a ligação mais próxima está a { "1.66" } graus do bordo do feixe), a visibilidade de { "5" } graus é verificada como indicador e não como elevação numérica, o indicador de aproximação simétrica aplica a regra empírica 31000/G a um ângulo validado sem validar a regra, e as eficiências implícitas não têm referência independente; a delimitação aguarda uma decisão do responsável

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests e lunar_service::tests (o cruzamento de meia potência localizado por bissecção no padrão coincide com o x = { "1.61634" } de Airy publicado e dá a largura exata de { "1.02899" }·λ/D, registando que o coeficiente convencional { "1.02" } se situa a −{ "2.955" } dB e não a −{ "3.010" } dB; o padrão é estritamente decrescente ao longo de { "400" } pontos desde o eixo até ao primeiro nulo; a álgebra da eficiência implícita faz ciclo completo até { "1e-12" } e reproduz { "0.641" } / { "0.920" }; o ângulo fora do eixo coincide com tan θ = R·sin γ/(r − R·cos γ) em { "20" } pontos e ambos os limites até { "1e-12" }; o cone aproximado contém o feixe real linha a linha; as contagens principais são iguais aos indicadores por linha que resumem e a correção é igual à sua diferença; cada veredicto de linha é recalculável apenas a partir do relatório emitido; cada campo numérico e booleano emitido tem uma unidade e uma classe de proveniência; uma abertura impossível não emite bloco; sem antena configurada a exportação mantém exatamente as suas seis chaves preexistentes, { "0" } folhas alteradas e { "0" } removidas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — O correlacionador sdr do próprio motor (sdr::correlate / synth_if / CaCode) avançado sobre IF sintética com semente a um C/N₀ calibrado — um caminho de código separado que chega aos mesmos números por correlação numérica de IQ amostrado e não por uma expressão algébrica de jitter, pelo que é um percurso diferente e não uma reformulação — mais valores tabelados normalizados de I₀ de Bessel modificada para o termo de salto de ciclo. Teoria de malha segundo Kaplan & Hegarty cap. { "8" } e Viterbi/Gardner para o tempo de salto. A linha continua ReferenceImpl/MODELLED: a verificação cruzada vive nesta mesma base de código, e a verificação de bessel_i0 valida uma função especial e não o modelo de seguimento, pelo que promover a linha com esse fundamento seria uma etiquetagem em benefício próprio. ExternalDataset precisaria de um conjunto de dados IF bruto gravado com C/N₀ de referência e um instante de perda de bloqueio anotado (classe TEXBAT/OAKBAT); nenhum é distribuído nesta árvore, e mesmo com o IQ esses conjuntos de dados não publicam verdade de estado de malha por época, pelo que um tempo declarado de perda de bloqueio só poderia ser validado face ao detetor de bloqueio de outro recetor, o que é uma escolha modelada e não uma referência independente. As larguras de banda das malhas, o tempo de integração, o espaçamento do correlacionador, a razão de captura, as permanências, a potência do interferente e os ganhos de antena são valores representativos de banda, não uma ficha técnica. { "0.30" } ronda { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, executado como programa) sobre IF gerada de forma independente (pré-registada 6ef7698c, alterações ao método de medição divulgadas), uma constatação (continua MODELLED): o jitter de PLL e DLL em malha fechada concorda dentro de { "8" } % a { "35" } a { "45" } dB-Hz, a tensão dinâmica de { "10" } Hz/s dentro de { "1" } % e o atraso de rampa de código de primeira ordem dentro de { "2" } %; a { "30" } dB-Hz o jitter de PLL é { "21" } % superior e o jitter de DLL { "32" } % inferior, os limiares medidos da regra dos 15 graus situam-se { "1.5" } dB acima do motor, e a malha de segunda ordem salta ciclos { "0.5" } a { "2" } décadas mais vezes do que o limite de tempo de salto de primeira ordem. { "0.30" } revisão: o tempo de salto de Costas usa agora o SNR de malha rho/4 (saltos de meio ciclo); o log10_mean_time_to_cycle_slip_s predefinido da tabela de jitter desce de { "11.58" } para { "2.10" } ao limiar de { "25.47" } dB-Hz

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter do discriminador de Costas em malha aberta face a sdr::correlate avançado sobre IF sintética com semente, { "3" } realizações de ruído agregadas × { "900" } épocas, concordando a { "0.63" }% em 35-45 dB-Hz, com o termo de perda por elevação ao quadrado exigido a ajustar pelo menos { "3" }× melhor do que a forma sem perda por elevação ao quadrado onde quer que seja resolúvel; a saturação do discriminador atan a ~{ "32" } dB-Hz afirmada e não apenas declarada, para que o limite de validade seja fixado; σ em malha fechada face a uma malha de Costas sdr avançada ao longo de { "4000" } épocas até { "3.7" }%; atraso de rampa do DLL de primeira ordem face a um DLL sdr avançado até { "0.17" }%; bessel_i0 face a I₀ tabelado até { "7.4e-8" }; a largura de histerese exigida a cair em [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] em { "4" } razões × { "2" } tempos de integração × { "3" } larguras de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Identidades de forma fechada, sem referência independente externa reclamada nem disponível. O braço de alavanca é verificado face a ρ/B e as duas formas de equipartição entre si até { "1e-15" } — identidades algébricas, pelo que detetam um erro de ligação e mais nada, e são etiquetadas como tal. O resultado substantivo é MEASURED e não afirmado: um atraso de uma linha de base fixa restringe a DIREÇÃO da baliza, pelo que a componente de linha de vista chega à matriz de informação apenas através do termo de alcance de campo próximo, e o teste lê a anisotropia resultante a partir do espetro emitido em vez de a derivar. A AM-HM faz de √(p/trace(M)) um piso rígido, pelo que uma ligação de equipartição isotrópica só pode SUBESTIMAR, e a razão calculado-sobre-equipartição é exatamente a anisotropia que descartou. MEASURED no par tipo Goldstone/tipo Canberra cuja corda é { "10726.748" } km: em { "112" } dias amostrados, { "36" } não admitem nenhuma época de visibilidade mútua a uma máscara de { "10" }°, o máximo de visibilidade mútua alguma vez obtido é { "17" } de um horário de 49 amostras, e nos { "73" } dias viáveis a razão de três componentes vai de { "113.9" }× a quatro ordens de grandeza mais, mediana { "1513" }×, enquanto restringir às duas direções transversais que a linha de vista não esfomeia dá { "3.94" }× a { "25.8" }×, mediana { "7.8" }×. O QUE ESTA LINHA NÃO AFIRMA: qualquer um desses valores como propriedade de uma campanha real. Estabelece que a quantidade de ponto de superfície é agora CALCULADA e não assumida, e que não pode ser silenciosamente permutada com a de nível de estação. Continua ReferenceImpl/MODELLED: não existe nenhuma covariância publicada de ponto de superfície de VLBI lunar face à qual validar, as estações e o local da baliza são ilustrativos e não levantados, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, pelo que este é um limite de Cramér-Rao para um conjunto reduzido de parâmetros e otimista por direito próprio. A mesma quantidade no caminho por núcleos (baliza na Lua DE440) é validada na sua própria linha, «…, caminho por núcleos»; neste caminho analítico o menor sigma da baliza é { "3.9" } % inferior ao da referência independente SPICE dessa linha, razão pela qual esta linha continua MODELLED

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } testes de biblioteca: cada grafia de datum faz ciclo completo por parse/as_str e uma desconhecida é recusada; manter fixas todas as estações sem a baliza é recusado com um erro que nomeia <c1/>; o braço de alavanca é afirmado IGUAL a ρ/B e a equipartição da baliza IGUAL à equipartição da estação vezes ele, ambos até { "1e-15" }, com uma afirmação adicional de que o braço de alavanca excede { "10" } para que os dois orçamentos não sejam confundíveis nesta geometria; a linha de base publicada do ficheiro de teste é fixada em { "10726.748" } km e o seu horário de 49 amostras afirmado como dando estritamente menos de { "49" } observações de visibilidade mútua; o espetro da baliza numa única linha de base é medido como abrangendo pelo menos cinco décadas e a razão resultante afirmada acima de { "1" } pela AM-HM e acima de { "100" } de facto; a disposição estação-mais-baliza é afirmada com deficiência de posto com AMBOS os campos calculados nulos enquanto o termo de comparação modelado continua a comunicar. Mais uma proteção sobre o próprio ficheiro de teste: uma chave de nível superior inserida depois de uma matriz de tabelas passa a ser dados da estação, pelo que o ponto de inserção é afirmado e o cenário analisado verificado como contendo a chave — o modo de falha é uma execução que usa silenciosamente uma configuração diferente da que o teste nomeia)

# text
seg-27b8c06d7d01 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de forma fechada e autoconsistência: a variância step²/12 do quantificador uniforme, a propagação exata de covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que colapsa para σ·PDOP com σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fecho em quadratura ao desligar termos. A verificação cruzada do PDOP face a orbit::dop partilha a matriz normal [−û, { "1" }], pelo que é uma verificação de consistência e é etiquetada como tal e não como referência independente. Nenhum ExternalDataset está disponível ou é reclamado: nenhuma estação de superfície lunar tem uma exatidão de levantamento publicada, nenhuma ligação de correção diferencial lunar tem latência ou formato de mensagem publicados, e o resultado de quantização é uma forma fechada e não uma medição. O RTKLIB — já a referência de código externo para o núcleo de diferença simples e de mínimos quadrados ponderados — poderia ser conduzido com uma base deliberadamente mal levantada para confirmar a transferência { "1" }:{ "1" } do levantamento, mas isso é código independente sobre a mesma álgebra de linha de vista de primeira ordem. AS MAGNITUDES SÃO MODELLED: o valor predefinido de levantamento é a própria alocação de realização de referencial lunar desta crate e não uma estação medida, a latência e o número de bits são entradas ILLUSTRATIVE, e o crescimento do próprio VETOR de erro de efemérides difundidas não é de todo modelado — declarado na cadeia emitida da lei de envelhecimento, porque é o termo com maior probabilidade de dominar uma ligação real

# text
seg-08708f044bb5 = lunar_dpnt::tests (uma proteção puramente aditiva cujo delta de conjunto de chaves é exatamente { "{" }correction_link, units{ "}" } com cada valor preexistente idêntico ao bit a literais capturados antes da alteração; o erro de levantamento NÃO se descorrelaciona com a linha de base enquanto o termo de órbita o faz, e sobrevive a uma linha de base zero onde o termo de órbita é exatamente zero — a verificação estrutural que deteta o termo ligado no sítio errado; um erro de estação de { "1" } m transfere-se { "1" }:{ "1" } e prova-se não ser amplificado pelo DOP; latência zero reproduz o resíduo não envelhecido bit a bit e o resíduo é monótono na latência, com a curva emitida igual a execuções diretas; o passo de quantização reduz-se exatamente a metade por bit e σ² = passo²/12, e o fundo de escala acompanha as magnitudes injetadas; cada termo desligado por sua vez recupera os outros dois em quadratura; σ igual por satélite propaga-se exatamente para σ·PDOP e esse PDOP concorda com orbit::dop; cada campo emitido traz uma unidade e uma classe de proveniência, verificado nos dois sentidos)

# text
seg-37f07885bbf0 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Aritmética recalculada por um script numpy independente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; pré-registado em tests/fixtures/lunar_station/PREREGISTRATION.md, consolidado isoladamente em 9caedf97 antes da primeira execução): em { "20" } casos com todos os termos de erro ligados, os conjuntos visíveis e o estado são idênticos, os erros de alcance brutos concordam até { "1.4e-14" } m, os vetores e as magnitudes do erro de posição até { "1.4e-9" } m face a um limiar de { "1e-6" } m, e o p95 de cada ponto é igual a numpy.percentile bit a bit; as correções de estação FALHARAM o seu limiar de { "1e-9" } m (pior { "3.73e-9" } m, { "15" } de { "20" } casos), e com elas os erros de alcance corrigidos: verificado em aritmética de 60 dígitos, ambos os lados estão dentro do arredondamento de precisão dupla do valor exato, sendo o termo de levantamento uma diferença de dois alcances de { "1e7" } m cuja unidade na última casa é { "1.86e-9" } m; registado, não afinado. O tipo de cenário reduz-se exatamente ao tipo de cenário lunar-differential-pnt com um ponto, uma época e um ensaio. O modelo de erro, o modelo de descorrelação e cada limiar são do próprio projeto ou ILLUSTRATIVE; nada aqui é uma declaração sobre qualquer sistema real

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: até { "1e-12" } m com e sem ruído do recetor; zero_baseline_floor_is_zero_in_every_trial: { "0" } até { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro da banda de { "5" } % declarada antes da execução; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (o recálculo numpy pré-registado, registado com a sua falha); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs e os golden de registo e multiplataforma inalterados (aditividade); tests/field_units_global.rs (cada campo emitido descrito, sem isenção)

# text
seg-bfee8a9a8b64 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Superfícies de forma fechada (InternalConsistency): o mergulho da esfera nua, uma cratera num planalto sobre a esfera com um observador no seu centro e fora dele, e um cone analítico face à sua própria rasterização. No recorte real, um lançamento de raios independente em numpy (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; pré-registado em tests/fixtures/lunar_terrain/PREREGISTRATION.md, consolidado isoladamente em edbb9b02 antes de o script existir) concorda em cinco locais: alturas dos locais até { "1.0e-11" } m e todas as { "1800" } elevações do horizonte até { "5.5e-10" } graus face a limiares de { "1e-6" }, contagens de raios truncados exatas; isto verifica a aritmética, não o terreno. Nenhum valor publicado de horizonte ou de iluminação polar foi reproduzido: o recorte incluído de { "1200" } m suaviza o relevo sub-quilométrico que os estudos de iluminação publicados resolvem, pelo que os horizontes do DEM são uma linha de vista MODELLED sobre um DEM real reamostrado, não um horizonte validado. O local da estação e a constelação continuam ILLUSTRATIVE; nada aqui é uma declaração sobre qualquer sistema real

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: o avanço do raio reproduz -acos(R / (R + a)) até { "1e-3" } graus em cada azimute; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: o mesmo cone amostrado num mosaico de latitude/longitude de { "0.005" } graus concorda com o cone analítico até { "0.25" } graus; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: uma cratera de fundo plano sobre a esfera, observador no centro e a { "4" } km e { "7" } km dele, face à elevação de bordo de forma fechada atan2((R + H) cos s - (R + a), (R + H) sin s) com s da equação esférica de cruzamento do bordo, até { "0.01" } graus em cada azimute; rasterised_cone_matches_the_analytic_cone: um cone rasterizado numa grelha estereográfica polar de { "200" } m e lido através do amostrador da grelha concorda com o cone analítico até { "0.25" } graus; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos os tipos de cenário; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 mantém a sua contagem plana e as épocas que um horizonte custa são terrain_masked (a própria disponibilidade pode subir, porque um horizonte pode esconder um satélite que a estação não vê), e um horizonte de { "89" } graus na estação não deixa nada disponível; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: fundos das crateras Shackleton e Haworth baixos, o maciço Malapert alto, a imagem em espelho não; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: um mosaico reamostrado do recorte incluído dá à estação o horizonte do recorte até { "0.22" } graus (limite { "0.5" } graus, fixado antes da execução), com o eco do mosaico e as unidades, e dem_path com dem_tile_path recusado; the_export_site_is_masked_by_the_terrain: cada linha exportada passa o terreno exatamente quando é visível e está à altura do horizonte do local ou acima dele no seu azimute, a geometria não se move, o CSV ganha a coluna apenas com terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs e os golden de registo e multiplataforma inalterados (aditividade)

# text
seg-f7719057f56b = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas e estatísticas das próprias extrações do modelo (InternalConsistency): a fórmula do DLL face a um cálculo à mão, a forma DO-229, a diferença de linha de base zero de dois recetores, a correlação de desfasamento 1 de Gauss-Markov. Não existe nenhuma medição lunar de multipercurso ou de recetor com que comparar; os valores são ILLUSTRATIVE e nada aqui é uma declaração sobre qualquer recetor real

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma amostral sqrt({ "2" }) a dentro de { "6" } %; station_multipath_is_gauss_markov: correlação de desfasamento 1 exp(-dt / tau) dentro de { "0.01" }, variância unitária dentro de { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs e os golden inalterados (aditividade)

# text
seg-3c6a533c15dc = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — O sigma de forma fechada do termo de crescimento e a verificação de propagação de primeira ordem (InternalConsistency). O adendo K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, pré-registado isoladamente em 59d88248): K5 falha a todas as taxas, p95 3-D corrigido { "369.8" } m, { "2315" } m e { "22797" } m face a um limiar de { "1.5" } m ({ "292.96" } m registado sem crescimento), tal como declarado antes da execução. Nenhuma fonte pública dá uma taxa de crescimento lunar: ILLUSTRATIVE

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: o erro de ligação com crescimento ligado menos o erro com crescimento desligado tem sigma amostral taxa tau / sqrt({ "3" }) dentro de { "6" } % em { "1600" } extrações; linear_growth_is_the_first_order_propagated_error: um erro de velocidade dv propagado com o integrador de dois corpos da própria árvore a partir da órbita do cenário desloca a posição de dv tau até { "1" } % a { "60" } s e { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorado, o adendo registado)

# text
seg-f55331e7b5af = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A redução instantânea e os casos de forma fechada do resolvedor (InternalConsistency). O adendo (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, pré-registado isoladamente em 001ca100) com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (definições ILLUSTRATIVE; as fontes indicam um filtro, uma restrição de altura e três satélites mas não as suas definições): K1 a K5 falham e K6 é satisfeito, { "1" } de { "6" } como na execução registada; o erro p95 3-D corrigido de R300 desce de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não avaliado) e a cobertura continua em { "0" }. O pressuposto de independência da janela favorece-a. Não é uma declaração sobre qualquer sistema real

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: é igual a lunar_dpnt::position_error_vector_from_range_errors até { "1e-8" } m, uma linha de altura frouxa não altera nada, uma apertada fixa o erro de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: cada valor até { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorado, o adendo registado)

# text
seg-6613341c6bc0 = uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe partes modeladas, pelo que a capacidade continua a ser modelada — Referência: as afirmações numéricas de cinco fontes públicas registadas com URL, data de obtenção, SHA-256 e licença em tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; diapositivos do IOAG Cislunar PNT Workshop { "2025" } e { "2026" }; UNOOSA ICG WG-B Lunar PNT, junho de { "2024" }), transcritas com referências de página em tests/fixtures/lunar_station_published/CLAIMS.md. Os limiares, os casos e as entradas foram pré-registados em tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisão { "2" }, 05bf9a19, consolidada isoladamente antes da execução). { "0.36" } primeira execução, uma constatação (continua MODELLED): { "1" } de { "6" } limiares é atingido. A cobertura é { "0.00" } em ambos os círculos contra >= { "0.95" }, e o erro p95 3-D corrigido é { "280.6" } m ({ "300" } km), e { "293.0" } m com { "600" } s de latência, contra <= { "1.5" } m. O limiar decimétrico (K4) não podia ser atingido com o ruído de código de { "0.30" } m das fontes, o que reflete um conflito entre as fontes e não um resultado do modelo. K6 é atingido (razão { "1.39" } contra <= { "1.5" }), mas, sendo uma razão de duas grandezas dominadas pela geometria, não é evidência sobre a descorrelação em nenhum dos sentidos. Causa: os elementos orbitais dos satélites não são públicos, e com os elementos ILLUSTRATIVE da própria árvore um utilizador e a estação partilham quatro satélites acima de { "5" } graus em apenas { "8.2" } % ({ "300" } km) e { "6.3" } % ({ "600" } km) das épocas, com geometria quase singular (p95 não corrigido { "3.8" } km contra < { "10" } m das fontes). As simulações das fontes usaram um filtro, uma restrição de altura e três satélites em vista comum, o que o tipo de cenário instantâneo não modela. A comparação, portanto, nem confirma nem refuta o «submétrico em todo o polo sul» publicado. Mostra que o resultado deste modelo depende de órbitas que não são públicas. Não é uma declaração sobre qualquer sistema real; sem afiliação nem aval de qualquer agência

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (os valores registados face aos limiares registados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorado, cerca de { "7" } s em release: volta a executar os seis casos registados e afirma os valores registados)

# text
seg-f4648485be52 = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna (InternalConsistency): a redução de ordem 2 ao caminho ADD v4.2 verificado pelo MAAST, rederivação independente dos priores, e uma falha construída de dois satélites. Não foi feita nenhuma execução de MAAST ou RTKLIB além dos pares, pelo que os conjuntos de hipóteses mais profundos e os níveis de proteção do RAIM de subconjuntos não são verificados externamente. araim_subset_raim partilha as simplificações de araim_dual_raim (um sigma para integridade e exatidão, um relógio, a cauda normal simples): não é aderente à norma ADD

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, o risco não monitorizado dentro de P_THRES, um subconjunto que remove três ou mais satélites monitorizado, e mais de dez priores monitorizados rederivados de forma independente como P_no fault q^k até { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: sem alarme sem falhas, e um viés de { "30" } m em dois satélites detetado com o par como o subconjunto de maior separação normalizada); tests/araim_reference_vectors.rs e tests/integrity_araim_stanford_oracle.rs inalterados (o caminho de ordem 2 é o verificado pelo MAAST)

# text
seg-a2b978f8bb5a = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna (InternalConsistency): os níveis de proteção são os de snapshot_raim, que é validado face ao RTKLIB na sua própria linha, recalculados na mesma geometria; comportamento sem falhas e com falha injetada. O céu é uma geometria predefinida representativa (não um almanaque datado), os resíduos são sintéticos e o sigma, os limites de alerta e as probabilidades são entradas declaradas; nada aqui é uma declaração sobre a disponibilidade de um recetor real

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: valores de holdover inalterados, { "111" } épocas negadas indisponíveis sem nível de proteção, recusado com execuções > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: o HPL e o VPL de cada época amostrada são exatamente iguais a um snapshot_raim de resíduo zero no mesmo céu predefinido, e a execução sem falhas não emite alarme; a_stated_bias_is_detected_while_it_lasts: um viés de { "60" } m emite alarme exatamente nas { "10" } épocas que cobre; every_integrity_field_has_a_unit); clock_integrity::tests; os golden de relógio inalterados

# text
seg-6a7d171f880f = verificado face à sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Um posto em forma escalonada por eliminação de Gauss com pivotagem parcial confirma cada veredicto de posto de seis estados — um algoritmo diferente que não partilha código com a via de valores próprios/SVD em teste. A matriz de transição de estado do CR3BP de { "6" }×{ "6" } que isto compõe traz a sua própria referência independente ReferenceImpl face à integração variacional do SciPy, e as condições iniciais de halo/NRHO provêm de um corretor que reproduz a órbita Gateway L2 sul { "9" }:{ "2" } publicada. A parte existente do filtro de informação de raiz quadrada NÃO é contada explicitamente como corroboração: consome as mesmas jacobianas e reduz-se à mesma matriz normal, pelo que é uma verificação de consistência entre duas máquinas numéricas, e a etiqueta de extensão emitida di-lo. NÃO está ancorada externamente, e ExternalDataset é por isso recusado em vez de emprestado da linha da STM: os próprios comprimentos de arco limiar dependem do projeto da constelação MODELLED, da grelha de épocas e — de forma mensurável, em até { "40" }× — da tolerância de valores singulares. Os { "2.09" } h planares publicados são reproduzidos exatamente com rel_tol = { "1e-6" } e dependem eles próprios da tolerância ({ "10.25" } h a { "1e-4" }, { "0.42" } h a { "1e-8" }), o que é uma propriedade do critério e não da órbita. Nenhum conjunto de dados público publica um limiar de observabilidade de comprimento de arco para uma constelação cislunar escolhida. RESULTADO MEASURED: o limiar espacial de seis estados é { "22.17" } h para a NRHO L2 e { "40.42" } h para o halo L2, e NÃO EXISTE para a família de DRO planar em que a afirmação publicada foi derivada — posto { "4" } de { "6" } com defeito de datum { "2" } e dois valores próprios exatamente nulos, um defeito estrutural que nenhum comprimento de arco recupera

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests e observability_gramian::tests (o documento predefinido fixado bit a bit por FNV-1a do seu JSON, resumo e SVG, com valores predefinidos explícitos afirmados como operação nula e as oito chaves de extensão afirmadas AUSENTES para que a captura não possa ser regenerada numa autocomparação; o bloco aditivo <c1/> excluído do congelamento por ser retirado e voltar a ser calculado o hash face à constante fixada antes de existir, o que prova em vez de assumir que nada do que foi divulgado se moveu; invariância do posto sob um sigma homocedástico afirmada em σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado escalar exatamente de forma linear com σ até { "1e-6" } relativo; o espaço nulo da DRO afirmado como sendo exatamente os eixos de coordenadas z e ż com as duas causas separadas — uma linha de alcance entre veículos espaciais coplanares tem û_z = { "0" }, e o bloco fora do plano do CR3BP desacopla-se exatamente em z = { "0" }; jacobianas espaciais face a diferenças finitas centrais e face à observável independente 3-D de taxa de alcance da crate; famílias fora do plano recusadas em modo planar)

# text
seg-d1770a478184 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Três vias independentes, nenhuma delas um valor publicado de exatidão de previsão. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única maneira de exercitar a maquinaria periódica, dado que nenhuma série consolidada é longa o bastante para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados de forma fechada de manual, uma álgebra diferente da resolução matricial em teste, em linhas reais. ({ "3" }) As linhas de previsão do Bulletin A arquivadas genuínas que o produto real de { "2026" } publica, comparadas por antecedência como estatística de CONCORDÂNCIA e explicitamente não como erro: { "0.256" } ms a { "1" } dia, { "0.695" } ms a { "2" } dias, { "1.252" } ms a { "3" } dias, a derivar para { "3.885" } ms a { "9" } dias. Isto é, portanto, a CLASSE do Bulletin A, próxima a curta antecedência, não o Bulletin A. Os resíduos previsto-versus-final são grandezas reais medidas sobre linhas reais do IERS, mas a sua magnitude é verificada apenas face à DIREÇÃO da comparação, nunca face a um valor de exatidão publicado pelo IERS — ler um produto real é proveniência, não uma referência independente. MEASURED: no dia { "1" } o previsor operacional dá { "3.78" } m de erro no referencial lunar contra { "11.39" } m da persistência ({ "3.01" }×), no dia { "2" } { "10.23" } m contra { "21.72" } m ({ "2.12" }×), no dia { "3" } { "20.33" } m contra { "30.57" } m ({ "1.50" }×) — e é PIOR além de três dias ({ "0.87" }× a { "5" } dias, { "0.43" }× a { "10" }), o que o relatório emite em vez de mostrar apenas os horizontes que o favorecem. NÃO reproduzido: o filtro autorregressivo de resíduos e a redução tabelada de marés zonais, a janela operacional de 365 dias é inalcançável com os dados consolidados, e NÃO existe nenhuma versão anterior arquivada da série neste repositório — pelo que a tabela de versões arquivadas não comunica linhas em vez de avaliar uma sintetizada. { "0.30" } comparação externa, uma constatação (continua MODELLED): avaliado face aos mesmos finais em { "178" } emissões arquivadas do Bulletin A com a janela predefinida de 15 dias da crate, o MAE de UT1 do previsor é de 2.4x a 12.6x o do Bulletin A a { "1" } a { "10" } dias (limiar 1.5x) e { "5.32" } ms a { "10" } dias, fora do intervalo de { "0.36" } a { "3.13" } ms do 2.º EOP PCC; o polo é de 1.5x a 1.85x o do Bulletin A (dentro de 1.5x apenas a { "6" } e { "7" } dias); { "19" } das { "21" } condições pré-registadas falham. Correção à via ({ "3" }): as linhas do produto de { "2026" } com que foi comparada trazem o indicador I (medido) do IERS, não P, pelo que esses valores de concordância são face a valores rápidos medidos, não a previsões do Bulletin A. { "0.30" } ronda { "2" }, um previsor de mínimos quadrados mais autorregressivo com as marés zonais removidas analiticamente, face a { "178" } emissões arquivadas do Bulletin A ao limiar da ronda 1 (pré-registada c93605b4), uma constatação (continua MODELLED): { "12" } das { "21" } condições verificam-se; o MAE de UT1 é de { "1.73" } a 2.11x o do Bulletin A a { "2" } a { "10" } dias (limiar 1.5x) enquanto o polo está dentro de 1.27x em cada antecedência. { "0.30" } revisão: com a entrada offline agora classificada pelo indicador do IERS, os valores de concordância da via ({ "3" }) são face a previsões reais do Bulletin A (0.256/0.695/1.252/3.885 ms a 1/2/3/9 dias face a linhas rápidas -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests e tests/operational_eop_predictor_reference.rs (recuperação de coeficientes de sinal analítico até { "1e-9" } com uma janela de 365 dias; um ajuste de viés mais taxa igual ao declive e à ordenada na origem de mínimos quadrados ordinários de forma fechada até { "1e-12" } em linhas reais; DOIS detetores de antecipação que destroem as colunas rápidas de UT1 e de polo de cada linha posterior à época de emissão — deixando intactos os finais do Bulletin B — e exigem saída idêntica ao bit, verificados por mutação a pôr { "10" } testes a vermelho quando a barreira do ajuste é afrouxada em exatamente um dia; uma lista de épocas reconstruída de forma independente; o bloco do Bulletin B de um alvo em branco e a época mostrada a sair da tabela; admissão de termos verificada com janelas de { "6" }, { "15" }, { "150" } e 365 dias; contagens de linhas monótonas; e uma captura prévia congelada do relatório predefinido afirmada campo a campo sem tolerância, que afirma adicionalmente que a captura não contém as chaves novas para que não possa ser regenerada silenciosamente numa autocomparação); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (a extensão opcional EopSeries::with_ls_ar_prediction além da última linha: respostas dentro da tabela idênticas ao bit, linhas de previsão iguais a ls_ar_predict, argumentos de referencial além da tabela seguem a previsão em vez de truncar; consistência interna)

# text
seg-546d8034c488 = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Identidades de forma fechada e um caminho independente no repositório, sem referência independente externa reclamada. O projeto de Helmert — a única derivada nova no módulo — é rederivado por diferença finita central de lunar_frame_realise::apply_helmert, um caminho que não partilha nenhuma expressão com a forma analítica. A acumulação que compõe é a de lunar-vlbi-fim, cuja jacobiana é diferenciada por diferenças finitas face a lunar_vlbi::vlbi_delay_s aí, e cujo núcleo de álgebra linear está ancorado externamente em separado face ao numpy em tests/fim_observability_reference.rs — esta linha não toma de empréstimo nenhum dos estatutos. A referência independente de física é estrutural e não numérica: uma derivada parcial do atraso da baliza é a DIFERENÇA de campo próximo de dois vetores unitários quase paralelos, pelo que a direção de translação pior determinada TEM de ser a direção fixa ao corpo para a Terra, e o teste afirma a resposta calculada face à direção medida em separado. MEASURED: sigma de translação derivado da campanha { "6.3975" } m contra o erro de recuperação de { "0.3125" } m do cenário de transformação injetada ({ "20.5" }× mais apertado), enquanto a rotação e a escala vão no sentido CONTRÁRIO, { "2.32" }× e { "13.5" }× mais laxas — o caminho injetado assume um sigma isotrópico único e por isso distribui o seu erro uniformemente por sete parâmetros, o que a observável de atraso não faz. Posto 7/7 mas condição { "3.8e5" }, com uma direção { "99.57" } % pura translação em direção à Terra e quarenta vezes pior do que qualquer outra. O QUE ESTA LINHA NÃO AFIRMA: que o valor da campanha esteja certo em termos absolutos. Estabelece que o valor agora DERIVA de um horário, de uma geometria e de um modelo de erro e não de uma resposta plantada. Continua ReferenceImpl/MODELLED: não existe nenhum par publicado campanha-mais-covariância de datum de VLBI lunar, a rede de estações e o sigma de atraso são entradas ILLUSTRATIVE (o catálogo de balizas tem fonte, a campanha não), as observações são tratadas como independentes enquanto a troposfera e o relógio de uma sessão real são correlacionados entre varrimentos próximos, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS. { "0.30" } comparação externa, uma constatação (continua MODELLED): com cada linha jacobiana de baliza reconstruída a partir de tempos de luz do NAIF SPICE (DE440, ITRF93, MOON_ME; pré-registada { "50863551" }), o horário, o posto de Helmert, os sigmas de datum (dentro de { "4.7e-3" }), a condição, a direção mais fraca ({ "0.07" } graus), a varredura de libração e a ordenação dos arcos concordam em seis cenários dentro dos { "1" } % / { "0.2" } / { "0.05" } graus pré-registados. O NumPy sobre a jacobiana consolidada do motor concorda até { "3e-14" } onde as estações são fixas. Com as estações estimadas difere em { "6.8e-6" } contra um { "1e-9" } pré-registado, cuja premissa do número de condição estava errada (condição de Helmert { "2.1e8" }; vias NumPy independentes discordam em { "3e-6" }; não se exclui uma contribuição do recurso de pseudoinversa de { "1e-9" } do motor), pelo que a linha não é promovida com base nesse pré-registo. { "0.36" } novo registo a um limiar escalado pela condição (pré-registado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir do condicionamento da informação conjunta e da sua redução de Helmert), uma constatação (continua MODELLED, NOT MET): o passo { "0" } exclui o recurso de pseudoinversa para a diferença de { "6.8e-6" } (nenhuma matriz a montante da matriz de Helmert recorre a ele nos seis cenários originais, margem mais apertada um fator { "2.6" }), a parte SPICE continua a verificar-se nos seis, e o NumPy concorda dentro do limiar em seis de oito cenários (predefinido, os dois arcos, o sigma de atraso 3x, o defeito colinear e a nova execução com estações fixas em 2026-12-01; pior { "0.13" } do seu limiar). Falha em stations_estimated (sigmas de datum até { "6.8e-6" }, condição { "9.1e-6" }, norma de independência descartada { "3.5e-6" }, contra t = { "5.9e-7" }), e na data nova a baliza do polo sul não tem observação, pelo que a informação da baliza tem deficiência de posto (recurso de pseudoinversa a montante da matriz de Helmert nos dois cenários novos) e a referência independente NumPy inalterada não consegue avaliar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-c77bd56a0619 = lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } testes de biblioteca: o projeto de Helmert face a uma diferença finita central de lunar_frame_realise::apply_helmert — o módulo PARA que o datum serve, que não calcula nenhuma derivada e por isso fixa a convenção de sinal [p]ₓ — todas as { "84" } entradas do projeto concordam a < { "1e-6" }; uma translação pura da rede relida como translação pura com < { "1e-6" } de fuga para os outros seis parâmetros; o sigma de datum exatamente linear no sigma de atraso até { "1e-8" } numa variação de { "3" }× em todos os sete parâmetros; um arco de { "16" } h medido pior e um arco de { "48" } h medido melhor do que { "24" } h, com a varredura de libração emitida ordenada da mesma maneira; o pior eixo de translação afirmado como SENDO o eixo dominante da direção fixa ao corpo para a Terra medida em separado e pior do que os outros em > { "5" }×, uma referência independente de física de que nada no resolvedor foi informado; três balizas colineares a produzir um defeito com cada sigma de datum NULO e as direções nulas emitidas na base de sete parâmetros; offblock_fraction e a correlação entre balizas exatamente { "0.0" } com as estações fixas e ambas > { "0" } com elas estimadas; os valores de transformação injetada do bloco de comparação mostrados iguais a uma execução independente desse cenário até { "1e-14" } relativo em vez de transcritos; uma proteção de que nenhum datum injetado/recuperado aparece em lado nenhum do documento; a emissão de realização do referencial lunar fixada byte a byte por FNV-1a-64 sobre json‖summary‖svg para três formas de entrada, registada por impressão digital antes de o trabalho começar); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (condicionado; o estrito lunar_frame_campaign_matches_spice_geometry_and_numpy continua ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (constatação; decisão do fundador 2026-10-02, opção A: esta linha continua MODELLED e não toma de empréstimo o estatuto da linha separada; face a uma referência independente mpmath de 50 dígitos, pré-registada 804662d5, os sigmas de datum do motor com estações estimadas estão dentro do seu limite de erro retrógrado a priori, a { "9.7e-6" } em 2024-01-01, e o limiar de { "1e-9" } estava abaixo do que qualquer via de precisão dupla atinge, sendo a melhor, uma projeção QR em NumPy, { "5.5e-9" } a mais; a evidência sustenta a linha separada «Covariância de datum do referencial lunar com as estações estimadas, face a precisão estendida de 50 dígitos»); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fixado); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fixado)

# text
seg-114007ecc9fe = verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa — Um estimador separado nesta base de código com um algoritmo diferente e um caminho de código disjunto: Gauss-Newton ponderado não linear com derivadas parciais por diferenças finitas, cujo veredicto é lido como erro medido de recuperação de estado em km e mm/s. Não tem nenhuma expressão em comum com a via de posto e covariância do Gramiano, e a separação é IMPOSTA por uma proteção sobre o texto-fonte e não afirmada. MEASURED na grelha de DRO planar publicada: o critério de ESTIMABILIDADE é CORROBORATED — a fronteira de Monte-Carlo medida é { "5.739130" } h face aos { "5.739130" } h formais (razão { "1.0000" }), e o RMS medido reproduz o 1σ formal ao longo de { "21" } comprimentos de arco com uma razão média geométrica de { "0.9804" }. O critério de POSTO NÃO é corroborado como fronteira de recuperabilidade: o estimador recupera a partir de { "0.782609" } h contra os { "2.086957" } h do Gramiano, razão { "0.375" }, e a { "1.826087" } h — o último prefixo a que a leitura de posto atribui { "3" } de { "4" } — recupera até { "1.96e-5" } do deslocamento a priori. A fronteira de recuperação não se move ao longo de três décadas do seu próprio limite, enquanto o limiar de posto vai de «nunca» a { "0.782609" } h ao longo de quatro décadas de rel_tol, e os dois coincidem exatamente em rel_tol = { "1e-8" }. Esse intervalo foi primeiro registado como chegando a { "0.260870" } h; esse valor era um ARTEFACTO, produzido por uma leitura de posto que contou { "4" } direções a partir de { "2" } linhas de medição abaixo do piso de ruído de f64, e é aqui corrigido em vez de deixado de pé. A leitura de posto é agora limitada pela desigualdade de Sylvester com o motivo emitido, e o intervalo corrigido satura exatamente no arco em que o estimador independente recupera, o que reforça a validação cruzada desta linha em vez de a enfraquecer: o { "1e-6" } publicado é uma CONVENÇÃO conservadora de valores singulares, não uma declaração sobre recuperabilidade. O mesmo padrão espacialmente: NRHO { "9.290323" } h contra { "21.677419" } h, halo { "22.978723" } h contra { "39.829787" } h, com a estimabilidade a concordar exatamente em ambos. O DRO planar de seis estados não recupera em nenhum arco, reproduzindo de forma independente o defeito estrutural de datum dessa família a partir de um estimador a quem nada foi dito sobre ele. NÃO está ancorado externamente — a dinâmica e as condições iniciais são partilhadas com a análise em teste e nenhum conjunto de dados público publica tal limiar — pelo que ExternalDataset é recusado

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests e tests/cislunar_arc_recovery_reference.rs (ambas as fronteiras e os respetivos rácios fixados na grelha publicada; a curva do erro medido comparada com a covariância formal linha a linha, com um limite de fator dois por linha e um limite de média geométrica; um CONTROLO NEGATIVO — o DRO planar de seis estados — que afirma que o critério PODE falhar e que o estimador não regularizado diverge para além de { "1e6" } km em vez de devolver um erro pequeno plausível; invariância de parametrização afirmada em cada prefixo até { "1e-3" } em termos relativos; uma salvaguarda sobre o texto-fonte que remove os comentários, os literais de cadeia e o módulo de testes e depois falha perante qualquer menção da jacobiana, da STM, do posto SVD ou da maquinaria SRIF, verificada por mutação através da injeção de uma chamada proibida; uma verificação apenas de teste de que as diferenças finitas são iguais às linhas analíticas, de modo que a linearização é sabidamente boa enquanto a via analítica continua ausente do estimador; determinismo afirmado byte a byte; o documento publicado de observabilidade cisluar fixado por conjunto de chaves, impressão digital canónica e linha de resumo)

# text
seg-03751f09c5c9 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A GEOMETRIA é externa e protegida por hash: três ficheiros de teste cujos números provêm apenas de documentos obtidos com URL, data de obtenção e SHA-256, regeneráveis por geradores versionados que verificam o hash de origem e ABORTAM em vez de emitirem um número — a constelação de referência da demonstração de interoperabilidade LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), os estudos de caso LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) e efemérides genuínas de naves em voo para LRO, Danuri, Chandrayaan-2 e CAPSTONE, avaliadas a partir dos próprios kernels reconstruídos do JPL através do Horizons. NÃO existe publicamente nenhum kernel de constelação de navegação lunar — Moonlight/LCNS, LCRNS e LNSS não estão em voo e a NAIF não publica nada para eles — e nenhum foi inventado. O requisito DERIVED de σ_URE NÃO tem referência independente externa (ninguém publica a exatidão de medição de distância que um HPL lunar de { "50" } m exige sobre este volume de serviço), pelo que é verificado face à sua própria identidade algébrica e, de forma independente, ao repetir todo o varrimento no requisito calculado e ao confirmar que a disponibilidade se inverte aí. MEASURED: o projeto publicado de 8 satélites precisa de σ_URE de { "2.9044" } m com { "100" } % de cobertura, contra { "0.3591" } m com { "37.85" } % na constelação ilustrativa — uma revisão de { "8.09" }× de um número publicado, ao abrigo da regra R4 do programa. A conclusão qualitativa mantém-se (a classe LNIS de { "30" } m continua a não fechar um HPL polar sul de { "50" } m), mas o défice estava sobrestimado em oito vezes. A demonstração LANS de 5 satélites produz ZERO amostras de nível de proteção — cinco satélites não podem dar os seis em vista de que um conjunto de hipóteses de falha única necessita — e o campo do requisito está AUSENTE em vez de fabricado; o mesmo vale para as quatro naves reais com { "0" } % de cobertura. InternalConsistency é o tipo honesto: os dados de ENTRADA são externos e protegidos por hash, mas a grandeza a que esta linha diz respeito é validada apenas face a si própria. { "0.30" } comparação externa, uma constatação (continua MODELLED): face às estatísticas do estudo de caso LNCSS de navi.613 em { "346" } pontos da grelha, { "4" } das { "12" } estatísticas de disponibilidade ficam fora dos { "2" } pontos percentuais fixados antecipadamente (caso A: -4.0, +{ "22.5" } e -3.6 pp; caso B: -12.1 pp). Causas prováveis: elementos lidos no referencial errado, Kepler de dois corpos ao longo de { "15" } dias face ao modelo de forças não indicado do artigo, e uma grelha que não é reproduzível a partir do texto. A metade do PDOP não pôde ser avaliada (o LANS não imprime nenhuma estatística numérica); o teste de comparação está versionado como ignorado. { "0.30" } ronda { "2" }, uma constatação (continua MODELLED): face a uma referência independente Orekit { "12.2" } / Hipparchus { "3.1" } que calcula o relatório completo (propagação Orekit, visibilidade e DOP com DOPComputer, níveis de proteção MHSS compostos com Hipparchus, o requisito resolvido por amostra; pré-registo d3ce97b2) em todas as cinco geometrias obtidas e em duas grelhas, { "155" } de { "160" } valores concordam dentro dos limiares fixados antecipadamente ({ "2" } pp, { "5" } %, { "1" } %), incluindo o requisito sigma_URE para LNCSS A e C ({ "3.879072208" } m em ambos os lados para o caso A) e o requisito ausente para o LANS e para os orbitadores. O LNCSS B na grelha densa falha nas estatísticas da pior amostra (sigma_required { "0.000923" } contra { "0.001511" } m, hpl_max { "1.63e6" } contra { "0.99e6" } m), onde geometrias quase singulares (PDOP de cerca de { "1e6" }) amplificam a concordância de posição ao nível do metro; o requisito de p95 concorda ({ "1.6343" } contra { "1.6357" } m). O requisito da pior amostra é mal posto em geometria degenerada. Face a navi.613: { "4" } das { "12" } continuam fora dos { "2" } pp (fixado)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análise de formato e de referencial; interpolação de Lagrange exata nos nós e numa trajetória linear fora dos nós; os elementos ICRF recebem a redução IAU { "2015" } e são iguais byte a byte a uma aplicação explícita de icrf_to_iau_moon; ida e volta anomalia verdadeira↔média face a uma resolução de Kepler direta; ficheiros malformados recusados com o motivo indicado). lunar_service::tests (com <c1/> não definido, o conjunto de chaves do relatório e o SHA-256 ficam fixados; a linha kepleriana é igual à execução kepleriana autónoma campo a campo; a identidade σ_required · HPL_max / σ_URE = AL, depois uma repetição DE PONTA A PONTA no requisito calculado que atinge { "100" } % de disponibilidade do nível de proteção e uma repetição { "1" } % acima dele que não a atinge; cada campo numérico emitido dos dois novos blocos percorrido a partir do JSON produzido quanto a uma unidade e a uma classe de proveniência; os ficheiros de teste versionados confrontados com as respetivas tabelas de origem satélite a satélite; um horizonte para além do fim de uma tabela recusado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

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
seg-1e414b2a33b2 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — O próprio documento emitido: cada folha numérica tem de resolver para uma entrada no bloco de unidades desse mesmo documento. Não existe nenhum registo externo de unidades face ao qual verificar uma unidade DECLARADA, pelo que uma unidade declarada é uma afirmação revista e não uma verificada — a barreira verifica a COMPLETUDE e a BOA FORMAÇÃO, não a verdade, e «validado» seria incorreto porque nada externo confirma que <c1/> é a unidade certa para um campo chamado <c2/>. Foi feita uma verificação cruzada independente por sufixo do nome sobre os { "1,434" } campos descritos NESSE MOMENTO: dos { "691" } que têm um sufixo indicativo de unidade, { "40" } discordam da unidade declarada e todos os { "40" } estão explicados (sufixos por segundo, mínimos, segundos de abertura, newton-metros face a um sufixo semelhante a nanómetro), pelo que não surgiu nenhuma unidade errada. Essa verificação cruzada não foi repetida desde então e a cobertura cresceu para além dela — o valor é deixado no que foi efetivamente medido em vez de ser reformulado com o total atual. No momento dessa alteração ({ "0.27.0" }), a cobertura passou de { "7" } de { "56" } tipos de cenário para { "60" } de { "61" }, e de { "389" } de { "1354" } campos para { "1,742" } de { "1,744" } (docs/field-units-schema.json, que uma verificação de obsolescência mantém atualizado). NENHUM tipo de cenário permanece por cobrir (teto { "0" }, FUT-28, { "0.36" }): o último foi <c3/>, em que duas das colunas são indexadas pelo chamador, pelo que as suas unidades são dados; passam agora a ser descritas como <c4/> e a unidade de cada posição é lida da tabela de unidades do pacote VARRIDO para <c5/> e <c6/> (ou tomada do <c7/> declarado do eixo, que tem de concordar com o do pacote quando ambos existem; nulo quando nenhum existe, declarado em vez de adivinhado). <c8/> foi o anterior e saiu da lista quando o seu documento publicado ganhou um bloco de unidades: a fixação de aditividade que tinha nomeado <c9/> como chave proibida passa agora a PROVAR que o acréscimo é aditivo — retirando de novo o bloco, o documento continua a produzir o hash das duas constantes congeladas antes de ele existir, de modo que um valor publicado que se tenha movido por baixo do acréscimo continua a falhar. O trabalho fez também emergir doze defeitos de unidades ou de documentação no código existente, comunicados e não corrigidos ao abrigo de R1

# text
seg-34bff3218a01 = tests/field_units_global.rs (todos os { "61" } tipos de cenário registados são executados, uma forma de documento cada: cada folha numérica tem de resolver para uma entrada no bloco de unidades desse mesmo documento; uma entrada malformada conta como em falta para TODOS os tipos de cenário, isentos ou não, pelo que um marcador de posição não compra cobertura; a lista de isenções não pode exceder o seu teto fixado, um tipo de cenário da lista que se revele totalmente coberto FAZ FALHAR a barreira, para que a lista não possa ser inflacionada, e um tipo de cenário registado ausente da tabela do executor faz falhar, para que um novo pacote não possa entrar sem ser examinado — o que aconteceu, apanhando ambos os tipos de cenário acrescentados depois de este trabalho ter começado; um mecanismo de sentido único sobre o acumulado de descrito-mas-indefinido; e uma verificação de obsolescência do documento de esquema versionado); field_schema::tests

# text
seg-8efc76b4ee1d = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas consistência interna: cada local acrescentado é um ponto distinto e uma distância laser ou um atraso VLBI de estação fixa toca num só ponto, pelo que a sua informação A_p^T M_p A_p é semidefinida positiva e soma-se; o teste verifica a diferença de Fisher e cada variância face a isso. O resultado das cinco matrizes é a linha de dados reais existente e não se altera. O refletor acrescentado reutiliza épocas agendadas para as cinco matrizes existentes, um calendário ILLUSTRATIVE, e a rede, o calendário e o sigma de atraso do farol acrescentado são as entradas ILLUSTRATIVE da campanha de referencial lunar; o local é uma posição polar sul ILLUSTRATIVE. Um local polar sul vê a Terra baixa no horizonte ou nem sequer a vê, o que os testes de ângulo de visada existentes expressam; nenhum dos locais é medido continuamente. Os valores são limites de Cramér-Rao para um conjunto reduzido de parâmetros, não um datum resolvido e não uma afirmação sobre nenhuma estação real

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for e solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: listas vazias e o exemplo de linha de base dão o relatório e o resumo por omissão byte a byte; an_added_site_never_increases_any_variance: o menor valor próprio de H_after - H_before é não negativo até { "1e-9" } do maior, todos os rácios sigma depois/antes são no máximo um e ambos os locais acrescentados são observados; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml e scenarios/lunar-station-geodesy-with-station.toml (o mesmo calendário arquivado e o mesmo bloco de campanha VLBI)

# text
seg-cc6113ce33c0 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Forma fechada: cada salvaguarda é executada sobre um fragmento fixo conhecidamente mau que tem de disparar e um fragmento fixo conhecidamente bom que tem de permanecer em silêncio, ambos constantes literais sobre as quais o detetor não pode influir. Os dois fragmentos conhecidamente maus são os defeitos F22 e F25 na sua forma original. Esta é uma referência INTERNA e a linha é, por isso, MODELLED: prova que as salvaguardas distinguem o defeito da sua correção, não que as classes que descrevem sejam exaustivas. Os seus pontos cegos declarados — estado partilhado que não é um caminho, uma fixação mantida numa constante nomeada curta, uma corrida rara que três execuções não amostram e um recibo que qualquer pessoa que possa escrever o ficheiro pode falsificar — estão escritos na documentação do módulo de tests/source_guards.rs e no cabeçalho de cada script em vez de ficarem para ser descobertos.

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testes: ambas as salvaguardas sobre toda a árvore de código-fonte, mais ficheiros de teste de mutação que avaliam cada salvaguarda nos dois sentidos — o padrão F22 comunicado nos dois caminhos em colisão, a correção de sequência atómica entregue aceite, uma correção parcial comunicada exatamente no caminho que perdeu o seu componente único, um identificador de ficheiro temporário e um diretório único herdado aceites, um relógio de parede rejeitado; uma fixação não declarada comunicada, uma declarada aceite, um âmbito sem exclusão rejeitado, uma declaração no comentário de documentação do teste envolvente aceite e demonstrado que não passa para o teste seguinte; e cada grafia de fixação — hexadecimal, decimal, cadeia de digest, comprimento em bytes, contagem de bytes nomeada, ficheiro de referência — detetada, enquanto constantes de algoritmos, sementes de RNG e pequenas verificações de cardinalidade não o são)

# text
seg-b99e60173863 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Testes de propriedades (monotonia, ausência de quebra na transferência) + verificação de expoentes face a holdover::coast_phase_variance

# text
seg-416def055790 = integrity::composed_pl::tests (monótono, piso P0, K(IR/2), expoentes, semicontinuidade inferior)

# text
seg-5b20d21462cb = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidade da envolvente quase certa de forma fechada √(2Dt·lnln t) + verificação de dominância do HPL; junção de impossibilidade de Baweja arXiv:{ "2606.24210" }

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergência, limiar, dominância do aperto por IR)

# text
seg-b286777831de = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Reprodução independente em numpy + statistics da biblioteca padrão da forma fechada do sobrelimite (InternalConsistency). A série BIPM Circular-T [UTC-UTC(USNO)] é apenas uma entrada CITADA — é a MESMA série já validada para a linha de cobertura de holdover R4 e NÃO é revalidada aqui; reproduzir os seus valores nada prova sobre R2. A cauda profunda de integridade é modelada. { "0.30" } comparação externa, uma constatação (continua MODELLED): nos ficheiros UTC-UTC(k) por laboratório do BIPM ({ "102" } laboratórios, { "105 024" } linhas com incertezas publicadas), o sobrelimite b = { "2.576" } u na cauda de { "1e-2" } é excedido por { "50.8" } % das linhas (Clopper-Pearson de { "95" } %: { "50.4" } a { "51.1" } %) e em mais de { "1" } % em { "101" } de { "102" } laboratórios. A incerteza publicada u é a incerteza da determinação de UTC-UTC(k) pelo BIPM, não um limite do desvio, que regularmente atinge muitas vezes u; o sobrelimite tal como especificado não limita o enviesamento real de rastreabilidade de UTC(k). { "0.30" } ronda { "2" }, um sobrelimite dos desvios UTC-UTC(k) realizados, treinado em 2015-2022 e testado em dados de 2023-2026 da Circular T do BIPM (pré-registo ca0921a4, excedência agregada de no máximo { "1e-2" }), uma constatação (continua MODELLED): a excedência agregada é { "0.0333" } ({ "694" } de { "20 826" } linhas em { "82" } laboratórios; { "0.0127" } sem as { "430" } linhas que não têm limite por regra). D9 ronda { "3" }, um limite hierárquico agregado de envelhecimento (utck_bound), pré-registo fb475550 e pontuado de forma prospetiva nas edições da Circular T a partir de { "465" }: ainda não executado (a edição { "465" } foi publicada em 2026-10-12 com cerca de { "285" } valores de teste; a regra pré-registada de 1000 valores precisa de edições até cerca de { "468" }, e a execução precisa dos ficheiros por laboratório arquivados de 2026-09-30, uma vez que o BIPM entretanto reescreveu { "87" } dos { "113" })

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionado por dados: é ignorado com uma mensagem quando a série BIPM está ausente); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 ronda { "3" }, prospetivo, ainda não executado: a Circular T { "465" } apareceu em 2026-10-12 e a regra pré-registada de 1000 valores precisa de edições até cerca de { "468" })

# text
seg-98b92da9ce83 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Reprodução independente em numpy da covariância cruzada e da desigualdade do enviesamento fundido correlacionado face ao independente (InternalConsistency). Conjunto de fontes representativo; cenário modelado.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Reprodução independente em numpy da estatística + teste de propriedade de que uma injeção de modo comum a infla (InternalConsistency). Cenário modelado. { "0.30" } ronda { "2" } (pré-registo f9aa360d), bloqueada (continua MODELLED): o gesv do LAPACK em numpy { "2.3.5" } reproduz o valor da estatística em { "261" } casos versionados (dentro de { "3.5e-15" } com bom condicionamento, { "1.2e-9" } com condição até { "6.1e7" }); a lei nula do qui-quadrado({ "1" }) é um teorema citado e as separações pareadas planas uma identidade sem saída do motor com que comparar, pelo que a delimitação aguarda uma decisão do responsável

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Estrutura geométrica reproduzida pelo motor mais a identidade de Schur 2x2 de forma fechada; consistente na ESTRUTURA com Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cujas grandezas comunicadas NÃO são aqui reproduzidas. A classificação é estrutural; as grandezas de correlação/CRLB sob geometria real são MODELLED (coordenadas e orientação dos refletores mantidas fixas). { "0.30" } comparação externa, uma constatação (continua MODELLED): face a Sosnica et al. { "2025" }, a correlação origem-escala da Fisher de distâncias (-0.993 / -0.988) está a { "0.05" } do -0.97 publicado, mas na geometria de cinco refletores do próprio artigo a correlação de Helmert de 7 parâmetros com pesos iguais é -0.78 (o valor publicado assenta em erros por refletor que o artigo não imprime), e o CRLB da origem ({ "0.6" } a { "1.2" } mm com ruído de distância de { "3" } mm) está { "96" } a { "98" } % abaixo dos { "3.07" } cm do artigo, face a uma tolerância de { "20" } %. Grandezas não reproduzidas

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Verificações cruzadas analítico versus diferenças finitas das derivadas parciais de cada técnica (internas); o SENTIDO da melhoria é um facto geométrico. As localizações dos faróis, os calendários e o ruído são MODELLED/representativos (ver tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (derivadas parciais analíticas de LLR/VLBI/orbitador versus diferença finita); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-b5169f1f17d9 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — O cálculo é verificado internamente: cada derivada parcial analítica face a uma diferença finita, e o caso de datum nulo face à distância nominal. O CATÁLOGO é verificado externamente e de forma independente - as coordenadas de eixos principais DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) são confrontadas com a Tabela { "6" } do memorando de coordenadas de superfície DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído automaticamente de um PDF verificado por SHA-256 através de tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) e concordam até { "1.12" } m, enquanto a realização de Terra média das mesmas cinco matrizes difere em { "672" } a { "871" } m. A ESTRUTURA DE DEGENERESCÊNCIA é verificada face a um resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que comunica para o referencial lunar de eixos principais um coeficiente de correlação entre lunocentro-X e escala de r = -0.97, e que o LLR não consegue alcançar o centro de massa real da Lua com uma exatidão melhor do que { "12" } cm por causa dessa correlação. Este módulo recupera a mesma estrutura (|corr(t_x, scale)| entre { "0.9" } e { "0.9999" }, defeito de datum <= { "1" }) a partir de um projeto de Fisher só com LLR. A corroboração é entre efemérides, não uma ida e volta: o artigo combina INPOP21a, DE430 e EPM2021, ao passo que este módulo é conduzido pela libração DE440. O que NÃO é reproduzido é a grandeza - a correlação aqui é de cerca de -0.988 contra -0.97 deles, e o CRLB de 4 parâmetros é submilimétrico contra o seu piso alcançado de { "12" } cm, porque aqui a orientação e as coordenadas dos refletores são mantidas fixas e lá são resolvidas. Apenas estrutura de geometria e de degenerescência; nenhuma afirmação de exatidão sobre um datum resolvido. { "0.30" } comparação externa: as partes de distância medida deste módulo (reflectors(), stations_itrf(), a colocação PA DE440 e o tempo de luz baricêntrico llr_bcrs_one_way_m) são validadas na sua própria linha, modelo de distância medida de LLR, face a { "192" } pontos normais do ILRS (RMS { "2.81" } m contra { "10" } m). Esta linha continua MODELLED porque a comparação medida não exercita o resto da sua afirmação. O catálogo geodésico de estações stations() arredonda o APOLLO a { "0.001" } graus; com um tempo de luz geocêntrico dá { "22.7" } m nos mesmos pontos (teste reflector_ranges_against_ilrs_normal_points; { "96" } m com a interpolação de orientação elemento a elemento anterior). As derivadas parciais analíticas da distância e a Fisher só com LLR são calculadas através de llr_range_m e reflector_inertial com a série analítica da Lua (ephem::moon_position, a cerca de { "0.3" } graus do GCRS) e sem tempo de luz

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Fisher marginal por complemento de Schur da matriz de informação acoplada, em álgebra linear de forma fechada, verificada face aos dois regimes-limite que prevê. A equivalência de { "1" } m a { "3.336" } ns é a definição do metro através de c e não é um resultado empírico. As redes de observação são geometria modelada representativa, pelo que a lei de projeto é uma afirmação sobre a geometria que lhe é apresentada e não traz nenhuma afirmação sobre qualquer rede lunar em operação.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A aditividade da informação de Fisher entre medições independentes é uma propriedade de forma fechada, verificada aqui face a uma soma elemento a elemento escrita de forma independente e face à invariância de ordem e à monotonia que dela decorrem. NOTA SOBRE A EVIDÊNCIA: o combinador não tinha anteriormente qualquer teste, e o único teste do módulo somava as duas matrizes de informação em linha em vez de o chamar, de modo que um combinador estragado teria deixado o módulo verde; o teste passa agora por combine e falha quando este é sujeito a mutação. Todas as localizações de faróis, a geometria do orbitador, as precisões por técnica e os custos relativos são escolhas representativas e não valores de missão (ver tests/fixtures/llr_geometry/NOTICE.md), pelo que cada métrica de degenerescência e cada valor de CRLB alcançado através deste menu herda o estatuto modelado de lunar_identifiability::decompose.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - a seleção vazia dá a matriz nula, uma seleção única é a identidade, um par é igual a uma soma elemento a elemento escrita de forma independente, e o resultado é invariante face à ordem de seleção; adding_a_block_never_reduces_the_degeneracy_metric - monotonia sob informação acrescentada; radial_diversity_beats_transverse_for_breaking_the_degeneracy - o bloco do orbitador do lado oculto eleva a métrica de degenerescência mais do que o bloco VLBI transversal)

# text
seg-66020d555be6 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Limite triangular do pior caso sobre a ação do jacobiano de pontos de Helmert (forma fechada)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonia no orçamento; redução do orçamento RSS sob um CRLB por fornecedor; tolerância de rotação calculada ao braço de alavanca lunar; termo vinculativo = rotação)

# text
seg-da0791f2edc4 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Agregação RMS das divisões por par validadas sob cada convenção (forma fechada)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris anula o orçamento; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } nas divisões reais; ordenação das convenções)

# text
seg-303947e00325 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Instanciação geométrica do limite de spark por blocos / estimação segura de estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; spark por blocos de Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NÃO o limiar de consenso 3f+{ "1" } de Lamport–Shostak–Pease («Byzantine» designa apenas o MODELO de falhas arbitrárias/em conluio). O número específico de falhas toleradas é uma propriedade modelada da geometria representativa da rede, verificada quanto à autoconsistência por casos analíticos construídos à mão e pelas fórmulas de contagem

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloco não nulo mas de posto deficiente ⇒ block_spark { "1" }, f_detect { "0" }; colunas independentes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (um par que possui todas as medições de um nó = um erro de desvio de relógio ∈ range(G), indetetável, com um claro intervalo espetral de Gram), byzantine_redundant_net_identifies_at_least_one (seis pares independentes de medição única ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (os casos manuais P⊥ = I fixam f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-c4b1731814f5 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Argumento de parâmetro livre no tempo de conjunto (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado na rede representativa real por nó com DE440: um teste nulo de resíduo relativo do gerador analítico de taxa comum face a GᵀWG, com o contraste desempatado a distinguir o verdadeiro calibre de um artefacto do modelo de oscilador. Geometria modelada representativa, não um orçamento de temporização certificado

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (rede autorreferencial: a taxa comum situa-se em N(GᵀWG), temporal_gauge_dim { "2" }; depois de uma linha de ligação de taxa externa: taxa expulsa do calibre, temporal_gauge_dim { "1" } com o desvio comum a subsistir)

# text
seg-1b1f761bd9a9 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Álgebra de forma fechada de projetor de paridade / pseudoinversa na rede representativa real por nó com DE440: a divisão comum/diferencial, a unificação N(G) ⊕ range(G) e o declive da lacuna de proteção de Brown ({ "1992" }) decorrem todos da aniquilação do espaço de imagem P⊥·G = { "0" }. Geometria modelada representativa, não um nível de proteção certificado

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (enviesamento comum indetetável, diferencial detetável), slope_infinity_in_range_finite_detectable (g7: declive ∞ para b ∈ range(G), finito para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, o calibre de 8 dimensões é todo o espaço nulo com um intervalo espetral >{ "1e6" })

# text
seg-1ac1dc1c053d = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Transcrição das Recomendações nomeadas (descarregáveis livremente em itu.int), cada limite com a sua tabela ou cláusula, listadas com todos os itens não confirmados ou não implementados em docs/TELECOM-TIMING.md; as identidades de continuidade dos pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de normas com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } ronda { "2" } (pré-registo 970003ee), bloqueada (continua MODELLED): os dez valores de máscara e os treze valores de holdover ePRTC-A que as Recomendações imprimem como números trabalhados (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } e Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 a 7-4) são reproduzidos dentro de meia unidade impressa, a maioria deles constantes de tabela ou pontos de quebra; a Fig. 7-2 da G.8271.1 rotula { "200" } ns a { "1.3" } s face à sua própria Tabela 7-1 ({ "197.5" } ns). Os limites das classes A-D da G.8273.2 não têm valor trabalhado impresso, e os rótulos dos pontos de quebra bloqueados de ePRTC da G.8272.1 (em linhas de construção contínuas) foram excluídos pela regra de seleção pré-registada, pelo que continuam a ser transcrições

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremidades abertas e fechadas, a lacuna τ = { "400" } s da Tabela 7-3 da G.8271.1, continuidade em cada ponto de quebra que as tabelas implicam; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Transcrição das Recomendações nomeadas (descarregadas de itu.int em 2026-10-13), cada linha relida face ao texto, com a continuidade dos pontos de quebra que os coeficientes impressos implicam limitada nos testes (por exemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns face ao patamar de { "100" } ns da Tabela { "4" } da G.812). Uma transcrição de normas com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. A G.812 (06/2004) está listada como substituída por uma edição pré-publicada de 08/2026 e a G.811 tem uma Amd. { "1" } (04/2016); nenhuma pôde ser lida, pelo que nenhuma é verificada. O cenário do OCXO em marcha livre sobrestima a contribuição do oscilador em intervalos de observação longos face à constante de tempo de uma malha; nada diz sobre o relógio de qualquer equipamento

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Pré-registado em tests/fixtures/clock_log/PREREGISTRATION.md (versionado isoladamente, 159334f2, antes de o ficheiro de teste existir); registado em RESULTS.md. Três registos sintéticos com semente, um por formato (uma lacuna TICC de três épocas, um segundo relógio RINEX a ignorar), lidos de volta por um leitor independente escrito a partir de docs/CLOCK-LOG-FORMATS.md pelo mesmo autor: contagens de grelha, de lacunas e de preenchimentos iguais e a maior diferença de fase { "0" } s (limiar { "1e-13" } s). O oadev, o tdev e o mtie de allantools { "2024.6" } sobre essa fase concordam dentro de um valor relativo de { "2.5e-14" } (limiar { "1e-10" }) em cada fator de média que avalia; não avalia o MTIE sobre todo o registo, que o motor comunica, pelo que esse ponto por registo não tem valor de referência independente e o limiar tal como formulado não é atingido aí. MODELLED: registos sintéticos, e a referência independente do leitor partilha o autor; não foram comparados ficheiros de relógio reais de instrumentos TimeLab, TICC e RINEX

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de cenário clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (registos escritos à mão por formato: cabeçalhos, separadores, unidades, integração de frequência, canais e modos TICC, lacunas e políticas, recusas); tests/clock_log_allantools.rs (a comparação pré-registada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Ficheiros de teste escritos para o Kshana a partir dos formatos de linha públicos dos daemons, com valores inventados (NOTICE.md na pasta dos ficheiros de teste); não foi lido nenhum registo de uma instalação real e nenhuma referência independente compara a análise com outro leitor, pelo que um formato que difira entre versões do daemon ainda pode ser recusado ou mal lido. Os estimadores alimentados pela série de fase são os validados face ao allantools nas linhas acima

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) nos ficheiros de teste em tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Cálculo manual sobre registos construídos a partir de fórmulas cujo declive, degrau, extremo e tempo de recuperação são conhecidos antes da execução (os testes indicam-nos), e as máscaras, a envolvente e os orçamentos das linhas de temporização de telecomunicações acima. Não foi pontuada nenhuma medição laboratorial de um holdover real e não foi comparada nenhuma referência independente externa, pelo que o tipo de cenário não faz nenhuma afirmação sobre qualquer relógio ou sistema; é necessário um parceiro de laboratório de temporização antes de qualquer valor por classe de relógio poder ser promovido

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — O manual do Volume de Serviço Espacial do ICG (UN OOSA ST/SPACE/75, { "2018" }), ele próprio uma simulação, comparado ao abrigo de um pré-registo versionado antes da execução (xval/gnss-ssv/PREREGISTRATION.md; resultados em xval/gnss-ssv/RESULTS.md, fixados por tests/ssv_booklet_results.rs, falhas incluídas). Execução { "1" } sobre a leitura pré-registada: as constantes de potência radiada mínima e o limiar lunar concordam (S0, S6 atingidos); os limiares do SSV superior e inferior, do limiar de RF, de GEO e de HEO são NOT MET, quase todos por causa do GLONASS, para o qual o manual dá { "20" } e { "28" } graus nas tabelas B2 e B6 e { "26" } e { "34" } graus na tabela { "4.2" }. Uma variante de diagnóstico com os ângulos da tabela { "4.2" } concorda em todas as células do SSV superior, do SSV inferior e das seis missões GEO (não substitui a execução { "1" }; as células de RF, HEO e lunar continuam a falhar). Os diagramas medidos do painel L1 do GPS não são reproduzidos pelo substituto paramétrico (RMS { "6" } a { "9" } dB face a um limiar de { "3" } dB). A concordância mostra que o método declarado no manual é reproduzido, não que os sinais GNSS se comportem assim

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas e grandezas publicadas nos testes (o pico de uma camada de Chapman e a curvatura do limbo da superfície, alguns TECU de plasmasfera num raio de GPS para GEO); o projeto do recetor reutiliza os modelos de aquisição e de malha de seguimento e os respetivos testes. Não são comparados com ele dados medidos de sondagem do limbo nem de receção de sinais fracos

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Referência simulada face à própria estimativa do filtro (o erro quadrático médio normalizado de estimação de um filtro consistente é de cerca de { "3" } para a posição) e determinismo para uma semente fixa. Não são comparados dados de voo nem dados GNSS gravados em órbita alta; o Sol e a Lua são substitutos circulares de baixa precisão

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A mesma referência simulada que o filtro absoluto: o erro do filtro relativo face ao estado relativo verdadeiro, e a verificação de que faz pelo menos tão bem como subtrair duas soluções de posição absolutas independentes. Não são comparados dados de voo em formação

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Cada forma fechada face a uma via numérica independente nos testes (quadratura no domínio da frequência da função de transferência exata e do filtro de atraso, um Monte Carlo sobre átomos para o enviesamento da frente de onda, um Monte Carlo sobre disparos para o índice de franja) e os seus casos-limite. Um valor trabalhado publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) afirmam que, com tau_R = { "20" } us, é necessário um ruído de fase Raman branco inferior a -111 dB rad^2/Hz para { "1" } mrad por disparo; o termo branco por si só dá { "0.99" } mrad (o artigo deriva o nível com a sua Eq. { "17" }, flicker mais branco). Consistência interna e um valor trabalhado, não uma validação externa; as aberrações de ordem superior e o ruído de qualquer laser específico não são modelados

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — As quatro folhas de dados da Microchip nomeadas (números de documento e URL em cada predefinição e em docs/TELECOM-TIMING.md) para os valores de entrada; a rampa de envelhecimento de forma fechada e a propriedade de envolvente do ajuste como verificações internas. A forma como os valores se tornam um modelo de ruído — o ajuste, a regra do piso, o mês de 30 dias, a leitura linear da temperatura — é uma escolha de modelação; nenhuma predefinição é uma medição de uma unidade. { "0.30" } ronda { "2" }, limiares unilaterais face a unidades medidas (pré-registo a01c491c), uma constatação (continua MODELLED): a estação IGS THU2 Symmetricom 8040C nos relógios finais MGEX da ESA tem um desvio de Allan de { "0.35" } a { "0.87" } da predefinição de rubídio, mas um erro de holdover de { "1.07" } a { "1.60" } dessa predefinição; o registo do 5071A fica fora da predefinição de césio até { "1000" } s (ruído de fase branco de medição, 30x a { "1" } s) e em holdover ({ "1.15" } a { "8.74" }); o pior SA.45s de produção de { "2011" } é 1.26x a predefinição CSAC a { "1" } s; o OX-208 não tem registo medido (bloqueado)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — a rampa de envelhecimento discreta dentro de { "0.1" } % de (1/2)·D·t² ao longo de um dia; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas para cada termo isolado e a procura de raízes independente holdover::holdover_seconds; os valores das folhas de dados são os dos documentos nomeados (docs/SLOT-TIMING.md). Uma predefinição de classe assenta num piso de ruído vermelho assumido e uma fonte de folha de dados é uma envolvente de máximos, pelo que nenhuma é uma medição de qualquer unidade

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relógios de satélites GPS Block IIF, { "14" } dias de relógios finais IGS: { "8" } dentro do limiar de { "1.5" }, G25 e G30 otimistas até cerca de 2x, fixado); tests/slot_timing_ocxo_holdout.rs (um OCXO medido: previsão reservada nunca otimista, { "0.59" } a { "0.70" } da quebra medida; na amostra dentro de { "0.98" } a { "1.17" }; sem o termo de frequência de fixação, a previsão na amostra é otimista em todos os limiares); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — cada classe face a holdover::holdover_seconds até { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Redução ao nível de proteção de temporização existente e às formas fechadas de visibilidade de órbita circular e Terra esférica. Condicional à deteção, um spoofer terrestre a uma taxa de rampa indicada, uma passagem sobre o zénite numa Terra sem rotação; não validado num recetor sujeito a spoofing em órbita

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exatamente tpl::timing_protection_level_ns quando o relógio não tem termo de flicker, de fase branca nem de passeio aleatório; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Redução à equação antijamming e ao orçamento de ligação do tipo de cenário <c1/> existente (o mesmo código, chamado com as mesmas entradas), e à forma fechada do piso de ruído k T0 F. Os espetros de sinal subjacentes são os da linha validada acima; as potências do emissor de jamming, a cronologia e as larguras de banda do front-end são entradas do cenário, os espetros são contínuos (sem linhas de código de espalhamento) e nenhum controlo automático de ganho, supressão ou diagrama de antena atua sobre o emissor de jamming. Não existe no repositório nenhum espetro medido sob jamming com que verificar o compósito. A tabela Q do tipo de cenário <c2/> (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde { "0.36" }: os valores de manual, fixados às formas fechadas de navsignal) concorda com o valor CW deste modelo e difere do que este deriva para ruído adaptado ao C/A ({ "1.5" }) e para ruído plano de nulo a nulo sem normalização na banda ({ "2.2" }); o relatório imprime ambos

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db e C/N0 efetivo igual a jamming::effective_cn0_dbhz com Q = 1/(R_c kappa) até { "1e-9" } dB, e a âncora de { "32.105" } dB do teste do próprio tipo de cenário jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — Medido face ao JPL Horizons DE441 (os mesmos ficheiros de teste versionados), mas não validado: os valores indicados na Tabela { "1" } para Úrano e Neptuno são excedidos até { "2.0" } e { "5.2" } vezes face às posições heliocêntricas DE441 (Neptuno satisfaz-os face às posições baricêntricas, o que sugere que o ajuste não era heliocêntrico), a página não indica nenhum erro para Plutão, e não existe nenhum limite publicado para as velocidades. As Tabelas 2a/2b satisfazem os seus próprios valores para Úrano e Neptuno e são cobertas pela linha validada

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fixado em { "2.04" } e { "5.16" } vezes o erro nominal de longitude, abaixo de seis vezes; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } arcsec e { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: pior { "3.7e-3" } da velocidade); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — Medido face às efemérides de satélites do JPL Horizons (DE441, MAR099, JUP365, SAT441) versionadas em tests/fixtures/solar_system/horizons_satellites_icrf.csv com a consulta e a data de obtenção; não existe nenhuma exatidão publicada para elementos médios nem para a colocação por modelo de rotação, pelo que os limiares fixados detetam regressões e não validam. Os elementos médios omitem as perturbações ressonantes e solares, e a aceleração secular de Fobos não é modelada

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: pior erro angular visto do planeta entre { "2000" } e { "2040" }, Fobos { "5.65" } graus, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titã { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } graus); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-d0dd931332c8 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Transcrição de constantes publicadas, cada uma citada onde é definida: parâmetros gravitacionais dos registos de corpos do JPL Horizons e da tabela de parâmetros físicos de satélites do JPL, raios das tabelas de parâmetros físicos do JPL (IAU WGCCRE { "2015" }), polos e meridianos de referência do Grupo de Trabalho da IAU sobre Coordenadas Cartográficas e Elementos de Rotação (valores médios, sem os termos de taxa T e periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } e { "2019" }, e Jacobson { "2009" } e { "2014" }. Verificado quanto à consistência interna (o período de rotação de Júpiter face à taxa do Sistema III, cada J2 face ao seu raio de referência), não face a uma referência independente externa. { "0.30" } ronda { "2" }: os valores de GM foram adotados de gm_de440 e os elementos de Fobos e Deimos de pck00011, pelo que { "0" } de { "84" } constantes dos catorze corpos acrescentados diferem agora da NAIF (eram { "12" }), o que é uma verificação de transcrição e não é contado. { "0.36" }: a orientação fixa ao corpo da IAU e o GM dos catorze corpos acrescentados foram separados para a sua própria linha VALIDATED («IAU body orientation and gravitational parameter of the fourteen added solar-system bodies»); esta linha mantém o que resta. O J2 e o raio médio são citados, não validados; as posições no relatório assentam nas suas próprias linhas; e o prime_meridian_deg do relatório para a Terra, a Lua e Marte continua em constantes convencionais (até { "6.6e-3" }, { "2.8e-2" } e { "9.6e-4" } rad de IAU_<BODY>). Revisões de { "0.30" }: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Úrano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutão { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; raio equatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg inclui agora os termos quadrático e periódico

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas e autoconsistência: a terceira lei de Kepler para o período do relé, o raio da órbita e o raio da superfície mantidos ao longo da execução, o facto de acrescentar uma medição nunca aumentar a incerteza formal, e os erros com semente concordarem com a covariância. As órbitas dos relés ignoram corpos terceiros (a atração de Júpiter sobre relés em torno de Europa não é modelada), o ruído é gaussiano a níveis indicados e o modelo de medição é instantâneo, pelo que isto não é validado face a dados de navegação de nenhuma missão

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: a raiz do valor quadrático médio de cada erro de posição sobre o seu próprio sigma formal em [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a varredura de elevação por força bruta, as reduções calculadas à mão e por orbit::dop, e a geometria de forma fechada de Walker e geossíncrona. Órbitas de dois corpos com um J2 secular opcional, um corpo esférico com a vertical local ao longo do raio, apenas visibilidade geométrica (sem potência de sinal, estado de saúde do satélite, terreno nem perturbação de corpo terceiro), e a fase relativa entre sistemas tomada de épocas de referência diferentes, pelo que não é um instantâneo de nenhuma data. { "0.30" } revisão, uma constatação (continua MODELLED): as predefinições satisfazem os pisos publicados unilaterais de disponibilidade de DOP (Norma de Desempenho do Serviço Aberto BeiDou { "3.0" }, SDD do OS Galileo) a { "100" } %, mas com o PDOP do motor duplicado numa cópia de trabalho continuam a satisfazê-los (pior ponto { "99.36" } %), pelo que os pisos não conseguem detetar sequer um erro de { "100" } % na grandeza que esta linha calcula; apertá-los depois da execução seria uma tolerância a posteriori. A promoção exige uma comparação bilateral de valores de DOP em geometria idêntica com uma tolerância fixada previamente. { "0.30" } ronda { "2" } (tests/coverage_dop_full_oracle.rs, pré-registo add671d6), uma constatação (continua MODELLED): posições, elevação, azimute e traços no solo do Orekit { "12.2" } com GDOP/PDOP/HDOP/VDOP de gnss_lib_py { "1.0.4" } (relógio comum) e uma inversa em numpy (um relógio por constelação) concordam em todos os limiares nos desenhos Galileo, GPS, BeiDou, Galileo+GPS (um relógio cada) e numa constelação terrestre de 1584 satélites (DOP dentro de { "2e-14" } em termos relativos, solução de posição idêntica, contagens de disponibilidade e de visibilidade idênticas). Nos desenhos da Lua e de Marte, os elementos, as posições, a visibilidade e os traços concordam, mas o DOP excede o limiar relativo de { "1e-9" } fixado previamente em células cujo maior PDOP é { "1434" } ou superior (até { "8e-6" }), e { "4" } células diferem por uma época de solução de posição em geometria numericamente singular (pivô do motor { "1e-10" } face ao posto do numpy), pelo que a linha não é validada. { "0.30" } revisões: o relógio de referência de TDOP/GDOP é agora a constelação de numeração mais baixa à vista (constellation-multi-gnss-coverage GDOP global máx. { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }), e as contagens visíveis por constelação são somadas como inteiros

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — cada mapa e contador é igual a uma varredura com o teste de elevação direto; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime o tempo de execução e os testes de pares mantidos; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (apenas verificação de regressão); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressão)

# text
seg-41b300bb888a = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de composição face às execuções autónomas dos mesmos tipos de cenário: uma campanha de uma só fase reproduz bit a bit o resultado autónomo, o desvio transportado é igual à última amostra da própria execução anterior, e a fase terminada por end_at tem exatamente o tempo de deteção da execução como duração. O transporte aditivo através da fronteira de uma fase e a retenção de ordem zero são escolhas de modelação, e cada fase vale tanto quanto o tipo de cenário que a executou; nenhuma missão encadeada foi verificada face a uma medida

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — o resultado do membro idêntico byte a byte à execução autónoma e cada valor alinhado igual à série autónoma; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções autónomas para a semeadura. Verifica a aritmética do conjunto sobre o próprio modelo de relógio do motor, não um conjunto de dados externo

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } sementes de um relógio de ruído de frequência branco em marcha livre tau = { "3010" } s: a média verdadeira { "0" } dentro do intervalo comunicado, a meia-largura do intervalo dentro de { "25" }% de { "1.96" } sigma/sqrt(n), e a variância amostral dentro do intervalo qui-quadrado bilateral de { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; conjunto de calibração (CAP-10, pré-registo ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): em { "200" } conjuntos independentes o intervalo cobre a média verdadeira em { "192" } (dentro da região de { "99" } % de Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) e a verificação do qui-quadrado passa em { "196" }, enquanto a tolerância de percentil de semente única (p05 e p95 dentro de { "0.3" } sigma) passa em apenas { "183" } de { "200" }, NOT MET face aos { "190" } fixados previamente, uma verificação frágil face à semente registada em vez de afrouxada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidade de composição face à execução autónoma. A aritmética de condições partilhadas é contabilidade; a física é a dos tipos de cenário membros, cada um com a sua própria linha

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — uma composição de um só membro lê o número autónomo e o digest do resultado)

# text
seg-ef402841914e = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Apenas interno: a forma fechada exata -20 log10(range) da equação de ligação, uma grelha independente de força bruta sobre o mesmo tipo de cenário, e a função de Rosenbrock. O limiar 1-D da ronda { "1" } é NOT MET (a caixa fixada previamente excluiu a solução de { "3" } dB; o otimizador parou no limite), registado em docs/design/evidence/cap32-optimize/RESULTS.md e não repontuado. O ótimo é local à caixa e ao ponto de partida; nenhuma afirmação de ótimo global

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (pré-registados fbe6c8b3 e, após uma falha de protocolo na ronda 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — resolução de alvo 1-D dentro de { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) em { "96" } avaliações; p3_prime_contour_target_grid_and_nelder_mead e p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — o melhor do método de grelha igual bit a bit a um ciclo independente de força bruta { "41" } x { "41" } sobre run_toml, Nelder-Mead pelo menos tão bom em { "177" } e { "161" } avaliações; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fixa a falha registada da ronda 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } em { "234" } avaliações; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário de espetro (o mesmo código Jammer::ssc). Os projetos em si são entradas: as predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espetros de QPSK de Feher melhorado, de modulação por deslocamento de código e de OFDM são aproximados, e as verificações de forma comparam formas, não níveis calibrados.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (todo o cenário agnóstico quanto ao sistema fornecido corre sem dados do workshop, os rácios ionosféricos da troca de banda são iguais a (f_ref/f)^{ "2" } e as suas diferenças de espaço livre a { "20" } log10(f/f_ref), o jitter no C/N0 de referência situa-se entre o seu limite de Gabor e a sua forma de banda ilimitada, as verificações de forma E5 do cenário com parâmetros do workshop são consistentes quando esse ficheiro está presente, e nenhum ficheiro de código-fonte compila esse ficheiro)

# text
seg-c83f81eb8726 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Redução à cadeia de espetro existente e à equação antijamming do tipo de cenário jamming (uma banda de um só componente dá os mesmos números que antes da extensão) e aos espetros de sinal das linhas validadas. As potências do emissor de jamming, a cronologia, as larguras de banda do front-end e os sinais projetados são entradas, e um sinal projetado é truncado na sua banda de transmissão (sem emissão fora de banda).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (a cascata multibanda corre com quatro painéis, os emissores de jamming UHF, de banda L5, S e C negam cada um apenas a sua própria banda, e uma execução de banda simples não é alterada pela extensão); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas e autoconsistência: as identidades de taxa de variação da distância e de aceleração da distância face a derivadas numéricas, o ganho isofluxo a cancelar o crescimento da distância, os limites de perda de polarização de manual, a observação qualitativa LEO versus GNSS (uma passagem em forma de sino de minutos com pico vários dB acima de portadoras GNSS planas de 44-51 dB-Hz). As EIRP e os diagramas são potências recebidas publicadas convertidas em EIRP ou escolhas representativas, o termo gasoso é o método simplificado P.676-10 entretanto substituído, e nada é comparado com um C/N0 de LEO medido

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: abaixo de { "0.01" } Hz e { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-d9e965c108ea = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Transcrição dos valores públicos citados e uma verificação de consistência: uma EIRP definida a partir de uma potência recebida mínima publicada prevê o máximo publicado a menos de { "0.5" } dB com um diagrama plano. Isto é uma verificação da dispersão de distância, não uma validação da antena de nenhum satélite; as predefinições representativas não fazem nenhuma afirmação sobre um sistema real

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: a menos de { "0.5" } dB de -139.1 e -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna de um modelo de projeto indicado: cada potência, limiar e escolha de pesquisa é uma entrada, e o modelo ignora a ambiguidade de limite de bit, a deteção falhada e a reaquisição. Não comparado com um recetor medido

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna (a identidade de salto e o limite do cone face a amostragem por força bruta). O limiar é uma entrada; nenhum requisito publicado de continuidade LEO está fixado

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (o salto de distância de cada comutação é igual à variação do erro de distância, e um ajuste corrigido de { "300" } s atualizado a cada { "150" } s passa um limiar de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (a forma fechada limita uma amostragem densa do cone)

# text
seg-bae9c4665c45 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades de ida e volta e o próprio orçamento. O formato é do próprio Kshana, modelado sobre os componentes de mensagem publicados e o conjunto de campos do ICD do Galileo; não é a disposição de bits do Celeste nem de qualquer outro sistema (nenhuma é pública), pelo que não existe nenhuma disposição externa face à qual validar

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (cada modelo a menos de { "2" } mm da mensagem exata após a descodificação, recodificação idêntica bit a bit, um bit invertido rejeitado pelo CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Idas e voltas e a aritmética do calendário. O RINEX { "4.02" } não define registos de navegação LEO (IGS RINEX { "4.02" }), pelo que a disposição é uma extensão documentada com arXiv { "2401.17767" } citado como estado da arte anterior; não existe nenhum leitor externo dela face ao qual verificar

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (cada modelo a menos de { "0.1" } mm após o bloco de texto, o CSV exato)

# text
seg-9c1e46397382 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Factos do modelo ATOMIC do InsideGNSS (polinómio de 6.ª ordem, cerca de um minuto de validade, atualização a cada { "30" } s, relógio controlado, erro de relógio de { "24" } cm). São factos descritivos sem números publicados face aos quais comparar. A tabela de cinco altitudes imprime o SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } e { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } e { "1336" } km num arco de 20 minutos) ao lado do ajuste do Kshana sobre a sua própria órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } e { "0.51" } cm; rácios { "0.46" } a { "0.77" }), não fixado, porque o artigo ajustou órbitas precisas reais e as referências diferem. O modelo de 22 parâmetros e o próprio ajuste são validados face a órbitas reais na linha Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. { "0.30" } revisão: os valores da tabela mudaram com o ajuste na convenção do artigo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: recuperação sem ruído, a identidade cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivada numericamente, Doppler nulo na aproximação máxima, a solução em espelho de uma única passagem, e erros com semente face à covariância formal. O valor do Starlink de Kozhaya, Saroufim e Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: cerca de { "2" } m em { "20" } s com três satélites) é apenas uma comparação: o recetor modelado, com efemérides perfeitas e todo o erro num sigma de Doppler de { "30" } Hz, é várias vezes menos exato na mesma janela, e o recetor e a taxa de medição do artigo não são reproduzidos

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: até { "1" } mm e a deriva até { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: o RMS do resíduo ponderado em [{ "0.8" }, { "1.2" }] e o erro abaixo de quatro sigmas formais); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (um substituto pré-registado face aos percentis publicados do conjunto de dados 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: com { "3" } satélites (máscara de { "47" } graus), sem auxílio de altura e a { "30" } Hz, o erro 3-D p90 é de { "92.2" } m a { "20" } s e de { "870" } m a { "8" } s face aos { "2" } m e { "10" } m publicados, pelo que ambos os limiares de fator dois são NOT MET, pelo lado alto, e afirmados como falhados; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Um DOP de quatro satélites derivado à mão (um satélite no zénite e três no horizonte a { "120" } graus uns dos outros, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com o seu próprio relógio e um satélite não acrescenta geometria, recuperação sem ruído da posição, do relógio e do enviesamento, e erros com semente face à covariância. Apenas verificações internas; não comparado com a saída de um recetor. { "0.30" } comparação externa, uma constatação (continua MODELLED): num dia IGS multi-GNSS (ABMF 2018-05-13, GPS e Galileo C1C, efemérides de difusão, Klobuchar) o enviesamento intersistemas concorda com o rnx2rtkp do RTKLIB v2.4.2-p13 (diferença mediana -0.11 ns após a correção de atraso de grupo de difusão de { "0.30" }, -0.35 ns antes; limiar { "1" } ns), mas apenas { "93.6" } % de { "280" } épocas ({ "93.2" } % antes da correção) estão a menos de { "3" } m da coordenada ITRF2020 face aos { "95" } % fixados previamente. O próprio RTKLIB atinge { "88.2" } % nos mesmos dados, pelo que o limiar está para além do posicionamento por difusão de frequência única nesta estação e neste dia, e não é uma discrepância do solucionador; o teste de comparação está versionado como ignorado. { "0.30" } ronda { "2" }, entradas mais estritas com o limiar inalterado de { "3" } m / { "95" } % / { "1" } ns, uma constatação (continua MODELLED): com o par sem ionosfera Galileo E1/E5a (pré-registado { "6927e039" }) { "79.9" } % das épocas estão a menos de { "3" } m (RTKLIB { "67.9" } %); com órbitas, relógios, desvios de antena de satélite e enviesamentos de código precisos CODE MGEX (pré-registado 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), e o enviesamento intersistemas difere do RTKLIB em -1.03 ns porque o modo simples do RTKLIB ignora os desvios de antena de satélite (+{ "0.04" } ns quando ambos os omitem)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) até { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-e86eb864ba1a = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — O teste qui-quadrado de NEES é uma verificação de consistência interna (a referência e o filtro partilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min encurtados para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário fornecido dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com as suas próprias camadas representativas de { "1000" } km e { "60" } graus, ruído e estações; as constelações, o ruído e a definição de convergência do artigo não são reproduzidos, pelo que isto é uma consistência MODELLED da tendência (encurtamento monótono, a maior constelação abaixo de um terço do tempo só com GNSS), não uma validação

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } sementes, média de NEES promediada por execução em [{ "2.4" }, { "3.6" }] e pelo menos { "75" }% das épocas dentro da banda qui-quadrado bilateral de { "95" }%; medido com { "150" } sementes, média { "2.84" } só com GNSS e { "2.87" } com LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna: a expressão publicada do desvio avaliada à mão, o erro normalizado em { "40" } sementes, e o piso definido pela incerteza do desvio. O valor do NIST para recetores de temporização Iridium com um relógio atómico miniatura (menos de { "40" } ns face a UTC(NIST) ao longo de { "40" } dias) é apenas uma comparação; o cenário Iridium fornecido dá { "10" } a { "11" } ns RMS a potência nominal com o seu erro de distância representativo de { "5" } m. O ruído de frequência flicker e o atraso ionosférico não são simulados

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Transcrição dos valores públicos citados, verificada quanto à estrutura (cada fonte pública tem um URL, os padrões de Walker dividem-se uniformemente, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não face a uma referência independente externa. Os valores representativos são nomeados em cada predefinição e são ilustrativos

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: análises de texto-fonte de src, scenarios e tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Autoconsistência das passagens entre fases: cada valor transmitido é igual à saída da própria fase a montante, e alterar uma entrada a montante move todos os valores a jusante que dela dependem. As fases mantêm os seus próprios rótulos; a cadeia não acrescenta nem física nem referência independente externa

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: uma EIRP mais forte, um intervalo de ajuste mais longo e um termo de determinação de órbita maior movem cada um o valor transmitido e a solução de posição fundida; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Formas fechadas e identidades, não uma medição externa: o gradiente da taxa de variação da distância face a uma diferença central, a estatística em forma de informação face à forma densa da covariância, uma deriva de relógio pura a dar zero, um empurrão explicado pela informação a priori a dar no máximo |dx|^2/sigma_p^{ "2" }, a estatística quadrática num salto. Nenhum valor de deteção é comparado com um ataque medido; o emissor de spoofing é idealizado (sem assinatura de potência, de ângulo de chegada nem de pico de correlação)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Identidades: o degrau de início de um emissor de spoofing sem ionosfera é igual à diferença de atraso ionosférico modelado do par, o limiar é o quantil normal bilateral vezes o desvio-padrão do degrau mais o limite da taxa. O modelo ionosférico do recetor é o do motor, pelo que o resíduo autêntico é nulo em média por construção; nenhuma referência independente externa

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — A identidade de dispersão de primeira ordem, exata por construção face ao próprio atraso de primeira ordem do motor (cuja escala 1/f^{ "2" } é VALIDATED face à IS-GPS-200 na sua própria linha); a precisão é apenas o ruído térmico de código, sem multipercurso nem enviesamentos entre frequências. { "0.30" } ronda { "2" }, medida (pré-registo 5e795f93), uma constatação (continua MODELLED): o mapa global da ionosfera do CODE CODG1330.18I face ao código ABMF C1C/C2W com os enviesamentos do CODE dá { "33" } de { "36" } médias de arco a menos de { "3" } TECU (pior +{ "6.84" } TECU num arco ao fim da tarde; RMS por época { "3.95" } TECU), face a um limiar de todos os arcos; não validado

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: é igual ao TEC oblíquo da passagem no pico até { "1e-9" } e o seu sigma é igual ao ruído de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Implementação face à especificação, NÃO uma referência independente externa: uma reimplementação em Python de sala limpa (scripts/maritime_score_cleanroom.py), escrita por um leitor a quem foram dados apenas docs/RECEIVER-TRUST.md e docs/MARITIME-TRUST.md e não o código-fonte em Rust, concorda com score_from_ratios em { "600" } vetores de rácios (pontuação, banda, pontos e a ordem das deduções, diferença { "0" }), depois de a documentação ter sido completada onde o primeiro leitor a encontrou omissa ou inconsistente (ordem de empates, arredondamento, o rácio de um monitor de passa-ou-falha, dois exemplos cujos números não correspondiam à fórmula). Isso mostra que a documentação é suficiente e que o código faz o que diz. O QUE NÃO É VERIFICADO, e porque é que a linha continua MODELLED: a própria regra (os pesos, a rampa, os limites das bandas, a retenção de evidência) é do próprio projeto, pré-registada mas sem fonte externa, e nada aqui mostra que uma pontuação de { "80" } ou { "40" } signifique o que um navegador quereria que significasse perante interferência real; não é dado nenhum valor desse tipo. Os limiares dos monitores são igualmente do próprio projeto (a Linha A verifica apenas a sua aritmética).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótona em cada estatística, acrescentar um monitor nunca aumenta a pontuação, estatísticas saudáveis mantêm-se em { "100" })

# text
seg-26753cc49103 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — O QUE É VERIFICADO: os testes de cadeia exata deste crate do mapeamento de campos LEEF documentado, e os campos do envelope RFC { "5424" }; não existe nenhum analisador LEEF de código aberto mantido (uma pesquisa no índice de pacotes Python não encontrou nenhum), pelo que o formato é verificado face à sua própria especificação lida pelo mesmo autor, não face a uma referência independente externa. O QUE NÃO É: se as cargas LEEF são aceites pelo analisador de algum fornecedor ou por um SIEM; as regras de escape para além das documentadas; o comportamento de um coletor syslog real.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadeias LEEF exatas, escape, severidade, envelope RFC { "5424" }, tempos limite de entrega e religação); tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — Os registos de eventos publicados do conjunto de dados (janelas attack_log), como referência de eventos, ao abrigo do pré-registo xval/jammertest-trust/PREREGISTRATION.md (versionado isoladamente, 0fa012b, antes de o arnês correr). Primeira e única execução (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } pastas avaliáveis ({ "7" } com jamming), { "3,502" } épocas limpas e { "9,560" } de jamming. Probabilidade de falso alarme em limpo reservada: cn0_drop_db { "0.0231" } (81/3502) face a um limiar de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, satisfaz; jam_ind_threshold { "0.0094" }, satisfaz; união dos três: falsos alarmes { "0.0328" }, deteção { "0.807" } face a { "0.05" } e { "0.50" }, satisfaz. Pela regra registada, a linha é MODELLED (um limiar falhou). Estreito: um tipo de recetor (u-blox ZED-F9P), um evento, janelas de um minuto agendadas como referência (a deteção é um limite inferior; limpo significa fora das janelas registadas); calibrado nos registos CSV, e o leitor UBX dá mais falsos alarmes em duas pastas. As bandas de pontuação de confiança marítima não estão calibradas

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorado, condicionado por dados por KSHANA_JAMMERTEST_DIR: a seleção registada, as contagens reservadas, os veredictos dos limiares e o veredicto); receiver_trust::calibration::tests (marcas temporais, emparelhamento de janelas e o desvio de fuso horário, rótulos, bandas de guarda, exclusão, seleção); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — As contagens de slots do plano por área de ensaio ({ "76" }, { "77" } e { "45" } slots, dos quais { "61" }, { "63" } e { "32" } transmitem) foram contadas de forma independente com um script sobre o mesmo JSON; as janelas attack_log do conjunto de dados de { "2024" } como referência de eventos, ao abrigo de xval/jammertest-score/PREREGISTRATION.md (versionado isoladamente, c2e6d3b, antes de o avaliador correr). Primeira e única execução (xval/jammertest-score/RESULTS.md): a regra registada de dados mínimos FAILED ({ "4" } janelas de jamming avaliáveis de { "4" } de { "12" } pastas UBX face a um mínimo de { "10" } janelas de { "2" } pastas: { "5" } pastas excluídas pela regra da linha de base, { "3" } registos UBX só trazem a semana GPS e o tempo da semana), pelo que os limiares B1 a B4 não são avaliáveis; nada foi afrouxado nem repetido. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, versionado isoladamente, apenas tratamento de dados: registos só com tempo GPS colocados a partir da data, as { "12" } pastas só com CSV, uma sessão de plataforma móvel para rovers em movimento; os mesmos limiares e a mesma regra de dados mínimos): { "14" } de { "24" } pastas mantidas mas { "7" } janelas de jamming avaliáveis, regra de dados mínimos falhada de novo, nenhum limiar avaliável (RESULTS-v2.md). Referência agendada: um slot planeado não é um registo de emissão, uma falha pode ser um ensaio que nunca correu, uma latência conta-se desde o início planeado, e limpo significa fora dos slots planeados. A deteção por monitores no domínio da medição nada diz sobre um emissor de spoofing de baixa potência. Um tipo de recetor (u-blox ZED-F9P). O conjunto de dados NMEA SimulaMet de { "2025" } não é utilizado (sem licença indicada, condicionado a subscrição)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionado por dados por KSHANA_JAMMERTEST_PLAN_DIR: contagens de slots por área de ensaio do plano de { "2025" }, identificadores de catálogo, ida e volta em TOML); tests/jammertest_score.rs (um registo sintético com uma queda conhecida: detetada, falhada, não avaliável, execução de falso alarme, pacote assinado com o cartão de pontuação); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionado por dados por KSHANA_JAMMERTEST_DIR: a execução registada)

# text
seg-c70f3f97d479 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Referências verificadas face a um índice de títulos extraído por script dos documentos públicos citados, lidos em 2026-10-10 (tests/compliance_references.rs). O QUE É VERIFICADO: { "49" } referências citadas a cláusulas, secções, parágrafos ou títulos existem no documento citado, e { "7" } URL citados resolveram na data registada ({ "2" } por uma segunda via); os controlos negativos falham. O QUE NÃO É: que qualquer paráfrase, mapeamento ou lacuna esteja correto; as cláusulas da EN { "16803" } (pagas, apenas o texto do catálogo); revisões posteriores; o índice não é uma implementação independente.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = exercitado face a uma aplicação anfitriã real; uma execução de integração não é uma referência independente — O QUE É VERIFICADO, indicado de forma estreita: que estas integrações funcionam com o software real para que foram escritas. A EVIDÊNCIA está versionada em integrations/signalk/evidence/README.md (com os seus ficheiros JSON) e em integrations/opencpn/evidence/README.md (com as suas capturas de ecrã e registos), cada uma com o script que a reproduz. ({ "1" }) Signal K: o plugin carregado no pacote npm signalk-server { "2.33.0" } fixado, num espaço de nomes de rede privado apenas de loopback, alimentado com dados sintéticos. As próprias interfaces REST e WebSocket do servidor mostraram os caminhos publicados, os metadados da pontuação e uma notificação que passou por ausente, aviso, alarme, normal (após a retenção) e aviso de novo quando os dados pararam. Com o kshana real executado pelo plugin sobre o NMEA que o próprio servidor recebeu, a notificação passou a aviso e depois a alarme e a posição comunicada foi publicada; o navigation.position do próprio servidor foi escrito pelo seu fornecedor NMEA, nunca pelo plugin. Repetido face ao esquema JSON em direto { "1.2" }. ({ "2" }) OpenCPN: o plugin compilado face ao cabeçalho da API de plugins do OpenCPN e ao wxWidgets { "3.2.4" }, carregado no pacote Ubuntu { "24.04" } do OpenCPN { "5.8.4" } sob um ecrã virtual; o OpenCPN carregou-o, executou a sua inicialização e entregou-lhe as frases PKSHT do fluxo filtrado, e o painel ficou vermelho na banda não fiável. Numa execução limpa, a posição do próprio navio do OpenCPN deixou de se atualizar, e o seu indicador de posição caiu, quando a barreira marcou a posição como inválida. Uma segunda execução alimentada diretamente pelo recetor TCP da barreira mostrou entrega ao plugin mas não um antes-e-depois limpo. ({ "3" }) Os testes de retransmissão repetem um excerto gravado do fluxo filtrado através de um socket TCP real e verificam o que um consumidor recebe (os bytes inalterados, somas de verificação válidas em todas as frases incluindo as reescritas, GGA e RMC concordantes, uma PKSHT por ciclo com o campo da barreira onde a posição é inválida), e o script de ponta a ponta verifica que um consumidor do recetor da barreira recebe exatamente os bytes que a mesma barreira escreve na saída padrão. ({ "4" }) Os analisadores de PKSHT (JavaScript e C++) são executados sobre frases gravadas da saída do kshana e rejeitam uma soma de verificação errada, uma versão errada ou uma pontuação fora de { "0" } a { "100" }. ({ "5" }) As unidades systemd são verificadas com systemd-analyze verify (systemd { "255" }, binários simulados) e com salvaguardas para uma shell em ExecStart, a política de reinício e as chaves da sandbox; o tratamento de argumentos do ponto de entrada do contentor é verificado com um binário simulado. O QUE NÃO É: não existe nenhuma referência independente externa para nenhum valor que estas integrações mostram. Os valores de confiança propriamente ditos são as linhas acima, e uma execução de integração mostra apenas que a canalização os transporta; é por isso que esta linha é MODELLED e não VALIDATED (docs/VALIDATION.md). Não foi usado nenhum navio real, recetor real, execução longa, outra versão de qualquer dos anfitriões, outro sistema operativo nem outro ambiente de trabalho; todos os dados são texto sintético e nada aqui é uma medição. O tratamento sonoro e visual da notificação por um cliente Signal K real, o botão da barra de ferramentas do OpenCPN, as preferências e o estado obsoleto, e o empacotamento para o gestor de plugins do OpenCPN não foram exercitados. As chaves da sandbox do systemd foram verificadas apenas quanto à sintaxe, não executadas sob um systemd ativo, e a construção da imagem do contentor e a sua verificação de estado não têm aqui evidência versionada. Não é afirmado nenhum valor de deteção ou de falso alarme. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); fora do crate: integrations/signalk (JavaScript), integrations/opencpn (relé em JavaScript, plugin nativo em C++), deploy/reference-build (unidades systemd, contentor)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (a barreira e o seu recetor TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } testes Node sobre saída sintética gravada); integrations/opencpn/test/relay.test.mjs ({ "5" } testes Node); integrations/opencpn/test/e2e-live.mjs (o binário real para um consumidor TCP, executado à mão e em CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (verificações em C++ do analisador PKSHT e do estado do painel); deploy/reference-build/check-units.sh e deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna face à referência injetada e a formas fechadas, sob limiares pré-registados em 6b68f6cc (docs/design/evidence/boc-bump-jump/). Um sinal de dados BeiDou B1C (PRN { "19" }, { "5" } MS/s) gerado por iq::scene: com a opção desligada, um arranque num pico lateral permanece bloqueado em falso no ±({ "0.5" } + d/4) chip previsto (medido ±{ "0.549" }); com ela ligada, um salto em direção ao pico principal aos { "0.08" } s e um RMS de janela tardia de { "0.0008" } chip a { "45" } dB-Hz e de { "0.0048" } chip a { "35" } dB-Hz; nenhum salto a partir do pico principal a { "35" }, { "40" } e { "45" } dB-Hz ao longo de { "4" } s; o declive do EMLP escalado de { "0.94" } a { "0.99" } sobre o sinal amostrado (sem escala { "3.6" } a { "3.8" }). O detetor de bump-jump isolado, sobre tripletos de correlacionadores com a covariância de ruído exata de BOC({ "1,1" }), não fez nenhum falso salto em { "100 000" } atualizações a { "25" } a { "45" } dB-Hz e detetou { "1000" } de { "1000" } arranques em pico lateral a { "35" } dB-Hz. NOT MET (constatação F1): a grelha de testes unitários pré-registada para o escalamento inclui desvios fora do intervalo linear dos discriminadores, onde as leituras escaladas falham o desvio em até { "48" } %. O QUE NÃO É VERIFICADO: IQ de campo, front-ends de banda limitada, réplicas compostas MBOC/QMBOC e qualquer recetor externo.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); testes unitários de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: o limiar de teste unitário B4 pré-registado mantido tal como escrito, as suas falhas registadas afirmadas como constatação F1)

# text
seg-d2d08312c05d = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — Dados medidos sob limiares pré-registados em b6ccb499 (xval/scint-malindi/): registo Zenodo { "16941224" } (INGV, Malindi, { "18" } de março de { "2023" }, GPS PRN { "26" }, intensidade e fase da portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 verificado). { "22" } janelas qualificadas de { "60" } s (N1 atingido). MET: a distribuição da intensidade (Kolmogorov-Smirnov D { "0.0415" }, limiar { "0.05" }) e a cintilação de fase ligada a S4 (mediana de sigma-phi medido/modelo { "0.779" }, limiar 2/3 a 3/2). NOT MET (constatação F1): a fração de desvanecimentos profundos do modelo é { "2.38" } vezes a medida (limiar { "0.5" } a { "2" }) e o seu desvanecimento médio é { "3.51" } vezes mais longo (limiar 2/3 a 3/2). Constatação F2: o processamento registado lê a fase enrolada do modelo, o que uma autoverificação revelou; B3 repetido a posteriori com a fase desenrolada dá { "0.804" }. O QUE NÃO É VERIFICADO: outras noites, estações, latitudes ou sinais; ruído do recetor no modelo. A linha continua MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, o veredicto registado afirmado tal como registado, constatação F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, apenas comunicado; condicionado por dados, obtido por scripts/fetch_scint_malindi.sh); testes unitários de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, constatação F2)

# text
seg-16578e7dd2fe = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Forma fechada, sob limiares pré-registados em 3724aefa (docs/design/evidence/acq-cfar/). A probabilidade de falso alarme do CA-CFAR para células Gamma(M), face a Monte Carlo do modelo exato: { "18" } de { "18" } casos dentro de { "3" } sigma binomial. Em cada célula das pesquisas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } células cada) com um { "1" } % de projeto: { "0.977" } % e { "0.969" } % em ruído gaussiano e { "1.006" } % e { "0.999" } % em ruído quantizado a 2 bits (M = { "1" } e { "4" }; limiar de mais ou menos { "20" } %); decisões inalteradas quando a entrada é escalada. NOT MET (constatação F1): num sinal de 2 bits sem ruído a deteção e a sua célula estão certas, mas { "1.28" } % das células fora do pico da linha do pico (limiar { "1" } %) excedem o limiar, nos lóbulos laterais de correlação determinísticos do código. O QUE NÃO É VERIFICADO: outras variantes de CFAR, janelas bidimensionais, front-ends de banda limitada, dados de campo.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, o veredicto registado afirmado tal como registado, constatação F1, fixada por finding_noise_free_sidelobes_exceed_the_cfar_rate); teste unitário de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Documentos de controlo de interface publicados e formas fechadas, sob limiares pré-registados em 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edição { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } e B3I { "1.0" }, Galileo OS SIS ICD Edição { "2.1" }. MET: cada portadora, taxa de chip e potência recebida tal como transcritas ({ "28" } canais GLONASS), primeiros nulos de BPSK à taxa de chip, o compósito B1C igual a MBOC(6,1,1/11) como a tabela de potências do seu ICD indica, a identidade do caminho C/N0 e cenários de espetro idênticos byte a byte. NOT MET: o limiar de área unitária, que era inatingível tal como escrito (constatação F1; as áreas são iguais à fração em banda de forma fechada), e a concordância por bin das formas de onda B1I e B1C da camada IQ com a envolvente do modelo ({ "1.26" } e { "1.56" } dB face a { "0.5" } dB, constatação F2; GLONASS { "0.07" } dB), porque os códigos Gold e Weil têm espetros de linhas irregulares; em média por banda, os lóbulos principais concordam a { "0.25" } dB. O QUE NÃO É VERIFICADO: IQ gravado, outros sinais, interferência intrassistema.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, constatação F1, fixada por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, constatação F2, fixada por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, apenas comunicado)

# text
seg-07554505b56b = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — LSIS-AFS V1.0 (como acima): a sequência de Legendre de comprimento 1499 (Tabela E-1, idêntica) e os primeiros e últimos { "24" } chips terciários (Tabelas E-2 a E-6: { "419" } de { "420" } colunas idênticas; o documento imprime os mesmos últimos { "24" } chips, A14850, para o PRN { "147" } e o PRN { "151" } e o gerador reproduz os do PRN { "151" }, pelo que a entrada do PRN { "147" } é muito provavelmente uma gralha; o limiar de { "420" } de { "420" } é NOT MET e a falha está fixada); o exemplo trabalhado da Figura { "8" } do código SB1 (um exemplo: 0x045 codifica para 0x229F61DBB84A0); CRC-24Q face ao valor de verificação do catálogo 0xCDE703 para ASCII { "123456789" }; a própria aritmética de tramas do documento. Limiares pré-registados em b3ba5d5. Uma falha registada e um exemplo trabalhado para a camada de mensagem, pelo que a linha continua MODELLED. O QUE NÃO É VERIFICADO: LDPC e as palavras CRC dentro das subtramas { "2" } a { "4" }, o conteúdo da mensagem e qualquer fluxo gravado

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-3a9a9d15186c = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa para os resultados dos cenários: cada teste do pacote executa um tipo de cenário MODELLED. Os limiares são o perfil indicado pelo autor do pacote (o quadro do DHS não indica valores; os limites de exatidão da IMO são a Tabela C-1 da MSC.1/Circ.1575, lida na íntegra; o pacote da ICAO segue a própria apresentação do Plano de Mitigação de RFI da ICAO porque o Doc { "9849" } é uma publicação paga e não foi lido), versionados antes de qualquer execução pontuada em ficheiros PREREGISTRATION.md ao estilo xval em standards/. Um limiar MET diz que um cenário modelado satisfez um limiar indicado, nada sobre um produto

# text
seg-662887e17adb = standards_pack; compliance (factos do pacote de normas em compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: o estado de cada teste, incluindo as falhas L4-T1 e os quatro testes de exatidão da IMO); standards_pack::tests

# text
seg-37b0efd0a7e5 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: o pacote liga hashes e uma pontuação de registo de recetor MODELLED, verificada em dados sintéticos (o NMEA exportado de um cenário fornecido tratado como o registo do recetor). Não é afirmada nenhuma execução laboratorial

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-e9bde2e0a342 = uma subafirmação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, o pacote Ubuntu { "24.04" }, executado como programa separado; apenas números derivados versionados) a seguir as mesmas gravações em numpy (independentes do motor), ambos medidos face à referência analítica. Limiares pré-registados em 48edd4a5, alterados antes de qualquer gravação de teste em 1e4288c4 (um FLL de { "10" } Hz apenas durante a captura em ambos os recetores, depois de a calibração registada ter falhado por uma transferência errada do GNSS-SDR, constatação F3). MET a { "30" }, { "35" }, { "40" } e { "45" } dB-Hz: jitter de portadora a menos de { "4.3" } %, jitter de código a menos de { "4.6" } % e média e dispersão do Doppler dentro dos do GNSS-SDR. NOT MET: o C/N0 NWPR do motor lê { "2.3" } a { "7.1" } dB abaixo do SNV do GNSS-SDR (constatação F4, o limite conhecido do NWPR; o seu M2M4 está a { "0.06" } dB da referência); os indicadores de bloqueio de fase diferem por definição (F5); a { "30" } dB-Hz o GNSS-SDR deslizou duas vezes e o motor não (F6). A própria transferência do GNSS-SDR bloqueou numa frequência errada em { "3" } de { "30" } execuções de calibração. O QUE NÃO É VERIFICADO: outros sinais, remoção de bits de dados, reaquisição, gravações de campo. A linha continua MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sobre números derivados por tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-5d76e6627df0 = verificado face a uma implementação separada neste mesmo código — independente da unidade em teste, mas sem autoridade externa — Um recálculo independente em numpy (xval/crpa-jamming/oracle.py, sem código partilhado: vetores de direção em numpy, numpy.linalg.solve e inv) de cada elo da geometria da demonstração de jamming com uma agregação quadrada de 4 elementos, sob ambas as ponderações. Limiares pré-registados em 08d83b4d. MET: A1 (todos os { "150" } resultados de cenários idênticos byte a byte sem a secção, depois de uma correção: a primeira construção acrescentou as unidades crpa à tabela de unidades de todas as execuções de jamming), A2 (um elemento é igual a nenhuma agregação até { "1e-12" } dB), A3 no ganho de ruído da agregação e no C/N0 efetivo ({ "912" } ponderações de ligação a menos de { "1e-9" } dB, pior { "2.1e-14" } dB) e no nulo do emissor de jamming por direcionamento de nulos (abaixo de -200 dB em ambos os lados), A4 (MVDR a menos de { "0.1" } dB do direcionamento de nulos com um JNR de { "80" } dB). NOT MET: A3 no ganho do emissor de jamming do MVDR, { "194" } de { "456" } ligações acima de { "1e-9" } dB com a matemática portátil de { "0.36" } ({ "202" } com a matemática do anfitrião; docs/revisions/STUDIO15-batch4-rebaseline.md) (pior { "1.7e-6" } dB) em resíduos de -100 a -188 dB, onde o cancelamento em float64 limita ambas as implementações (o inv e o solve do numpy discordam um do outro em { "169" } ligações, pior { "7.9e-7" } dB); o C/N0 efetivo que estes alimentam não é afetado. O QUE NÃO É VERIFICADO: acoplamento mútuo, desadaptação de elementos, processamento de banda larga, vários emissores de jamming, qualquer hardware de antena. Um recálculo das mesmas equações, não uma referência independente externa; a linha continua MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), face a xval/crpa-jamming/expected.json de xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = verificado face a uma implementação separada neste mesmo código — independente da unidade em teste, mas sem autoridade externa — Um recálculo independente em numpy (xval/jamming-terrain/oracle.py, sem código partilhado: a sua própria leitura de .hgt, interpolação bilinear, ida e volta WGS { "84" }, perfil, curvatura, nu e J(nu)) de dez posicionamentos de emissor de jamming em torno de um recetor em Badwater Basin sobre o mosaico SRTM real versionado tests/fixtures/terrain/N36W117_sub6.hgt. Limiares e posicionamentos pré-registados em 92cd2bfd. Todos MET: aditividade (todos os { "150" } resultados de cenários idênticos byte a byte sem a secção); os pontos de perfil e o obstáculo de cada posicionamento iguais e nu e a perda a menos de { "1.6e-10" } (limiar { "1e-9" }); a perda nunca sobe quando o emissor de jamming sobe de { "2" } para { "4902" } m; a perda reduz todos os J/S exatamente em si própria e em nada mais; J(nu) a menos de { "1e-12" } dB do da referência independente. Constatações: os posicionamentos além das Montanhas Black e Funeral perdem { "44" } a { "48" } dB; dois posicionamentos no fundo do vale perdem { "8" } e { "15" } dB só pela curvatura da Terra com antenas a { "2" } m de altura, o caso rasante do modelo de gume de faca único. O QUE NÃO É VERIFICADO: qualquer propagação medida, difração de vários gumes, reflexão no solo, obstruções, o próprio erro do modelo digital de terreno. Um recálculo do mesmo modelo, não uma referência independente externa; a linha continua MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), face a xval/jamming-terrain/expected.json de xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = verificado face a uma implementação separada neste mesmo código — independente da unidade em teste, mas sem autoridade externa — Um recálculo independente em Python de cada indicador de aquisição (xval/jamming-acq-agc/hysteresis.py) a partir do C/N0 efetivo por época do motor, um Monte Carlo independente em numpy da perda do quantizador (xval/jamming-acq-agc/quantiser_mc.py, a sua própria pesquisa do passo ótimo, { "2" }^{ "22" } amostras) e o ciclo de AGC da camada IQ. Limiares pré-registados em 70c72fcc, com um conjunto suplementar de execuções em { "37793290" }. MET: aditividade (todos os { "150" } resultados de cenários idênticos byte a byte sem as secções); cada indicador igual nas execuções suplementares ({ "1824" } ligações, { "732" } delas a mostrar a histerese); monótono no limiar; a perda do quantizador a menos de { "0.0007" } dB do Monte Carlo com { "1" } a { "4" } bits (limiar { "0.02" } dB); a leitura de AGC a menos de { "0.012" } dB do ciclo de AGC (limiar { "0.05" } dB). NOT MET: as execuções de histerese registadas (jamming-demo a { "10" } a { "30" } dBW) foram pouco informativas, com todas as ligações perdidas, e o seu H2 e H4 só são satisfeitos de forma trivial. Constatação: com um emissor de jamming CW, um ADC de 1 bit perde cerca de { "5" } dB mais do que o valor gaussiano que o motor aplica, e assinala como não válido. O QUE NÃO É VERIFICADO: a própria pesquisa de aquisição, a dinâmica temporal do AGC, qualquer hardware de recetor. Recálculos do mesmo modelo, não uma referência independente externa; a linha continua MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), face a xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json e expected_quantiser.json

# text
seg-19788df00e45 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Consistência interna face à referência injetada: uma fonte sintética GPS L1 C/A sem dados (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dez sementes de ruído) cuja fase da portadora é conhecida, sob limiares pré-registados em 58789af0 (docs/design/evidence/fll-handover-floor/). MET: o controlo (a predefinição sem limite nunca transfere em { "9" } de { "10" } sementes a { "33" } dB-Hz); aditividade (hash predefinido e testes de seguimento existentes inalterados); captura de uma transferência com { "100" } Hz de desvio a { "45" } dB-Hz. NOT MET: com um limite de { "1.0" } s, transferência e manutenção em todas as execuções ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; as restantes alternam entre transferências forçadas e o regresso do FLL) e jitter de fase a menos de { "25" } % do PLL isolado ({ "10.8" } contra { "6.1" } graus a { "33" } dB-Hz). O QUE NÃO É VERIFICADO: bits de dados, outros sinais e taxas de amostragem, gravações de campo. A predefinição é inalterada; a linha continua MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sobre tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: não foi lido nenhum ficheiro produzido pelo RTKLIB, e a disposição das colunas é a do manual do RTKLIB. Verificado apenas em ficheiros escritos pelo próprio autor; a conversão ECEF reutiliza frames::ecef_to_geodetic, que tem as suas próprias linhas

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (épocas lat/lon, semana/TOW e ECEF, dms recusado, entrada hostil); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa como limiar de passagem. As disposições de campos e o CRC seguem a documentação pública do OEM7 (docs.novatel.com); a rotina de CRC foi verificada uma vez face ao CRC que a documentação indica para o seu próprio exemplo BESTPOSA (citado, não transcrito). Os ficheiros de teste são escritos pelo próprio autor; não foi lido nenhum registo de um recetor real

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fixado, registos ASCII e binários, CRC inválido ignorado, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = verificado face a uma implementação separada neste mesmo código — independente da unidade em teste, mas sem autoridade externa — ReferenceImpl numa verificação pontual, não um teste da bateria: o descodificador do pyrtcm { "1.2.0" } lê as mesmas tramas escritas pelo próprio autor até ao mesmo C/N0 e à mesma hora de época. Partilha com este leitor a origem das suas tabelas, pelo que verifica o tratamento de bits, não a disposição. Não foi lida nenhuma captura de um recetor real nem de uma estação de base

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de verificação do catálogo CRC-24Q, C/N0 e fusão de épocas MSM4/MSM7, hora GLONASS e mapeamento de identificadores SBAS, CRC inválido e outras mensagens)

# text
seg-15841bb986fe = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: os nomes dos campos provêm da documentação do GNSS-SDR; nem o leitor nem o relay.py foram executados contra um GNSS-SDR em direto ou uma captura real

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: o ajuste é verificado em registos sintéticos de ruído branco com coeficientes conhecidos, a orientação em registos de taxa de guinada constante. Nenhum registo IMU real foi ajustado, e q_aa não é ajustado

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes de ruído branco conhecidos recuperados a menos de { "10" } %, recusas, o TOML é analisado como AccelCfg); tests/receiver_trust_machines.rs (concordância e discordância de orientação, portadora em linha, imu_fit)

# text
seg-93283b08d1f9 = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: os pacotes foram lidos por um recetor de loopback escrito para o teste, não por um broker real, e o Home Assistant não foi executado

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes dos pacotes, broker de loopback, broker inativo contabilizado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = verificado face à sua própria identidade analítica de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa — Nenhuma externa: o nó ROS não foi executado num grafo ROS { "2" } em direto, e os nomes dos campos de ublox_ubx_msgs não foram verificados face a um controlador em execução. O gnss_lib_py (MIT) foi executado para o teste da ponte

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: o formato que a ponte gnss_lib_py escreve, processado por receiver-trust); os testes Python das pontes são integrations/ros2/kshana_trust/test/test_bridge.py (ponte com um motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (o wheel real pontua como nominal uma posição estável e como não fiável um salto de { "1.1" } km) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } e o wheel), executados com pytest, não com cargo

# text
seg-7a0503f925c1 = <s1>Anterior</s1>Referência de capacidades

# text
seg-b5832e94f926 = <s1>Seguinte</s1>Alegações face à realidade
