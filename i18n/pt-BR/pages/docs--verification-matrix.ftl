# docs--verification-matrix: translations (pt-BR)

# text
seg-619f89bf160c = Realização do referencial de referência lunar

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Mapeamento de compliance para frameworks públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Status

# text
seg-60a43431ebe0 = Requisito

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-1603e76bcf66 = Identificação de ruído de lei de potência por autocorrelação de defasagem 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: o identificador de ruído por autocorrelação de defasagem 1 de Riley e Greenhall ({ "2004" }) (fase decimada com seu termo quadrático removido, ou frequência com média por grupos com sua reta removida; diferenças primeiras repetidas até delta = r1/({ "1" }+r1) < { "0.25" } ou d = dmax), devolvendo o expoente de lei de potência alfa, inteiro e não arredondado (+{ "2" } PM branco a -2 FM de passeio aleatório), com qualquer fator de média; ele define os graus de liberdade por tipo de ruído dos cartões de dispositivo da biblioteca de relógios medidos

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin e colaboradores, LGPL-3.0-or-later, executado como um programa separado pelo gerador de fixtures): uma implementação independente do algoritmo publicado de Riley-Greenhall, uma grandeza definida de forma única sob as convenções declaradas. Valida o identificador, não o conteúdo de ruído de nenhum relógio real

# text
seg-aedf395f3597 = Autenticação, no lado do receptor, de dados de navegação do Galileo OSNMA

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: um verificador aberto, em Rust puro, no lado do receptor para o OSNMA do Galileo (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) a partir de páginas I/NAV ou de um fluxo UBX-RXM-SFRBX da u-blox: chaves públicas em árvore de Merkle (DSM-PKR), a assinatura ECDSA P-256/P-521 do DSM-KROOT, verificação da cadeia de chaves TESLA (SHA-256 ou SHA3-256), verificação de MACSEQ e de tags (HMAC-SHA-256 ou CMAC-AES) para ADKD { "0" }, { "4" } e { "12" } com autenticação cruzada, fim/revogação/renovação de cadeia, renovação e revogação de chave pública e a mensagem de alerta; estado por satélite Authenticated/Failed/Unavailable com um motivo para cada falha ou atraso. Consultivo: não é um equipamento de navegação homologado nem um serviço de integridade de navegação; nenhum desempenho anti-spoofing é afirmado

# text
seg-a6bd60ed728f = Os vetores de teste oficiais do Galileo OSNMA publicados pelo European GNSS Service Centre como anexo das Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } de { "18" } conjuntos, { "186,382" } tags autenticadas, { "0" } falhas, executados offline em 2026-10-10 (registro de evidências em kshana-pro docs/evidence). Escopo: os vetores validam a verificação criptográfica (Merkle, KROOT/ECDSA, cadeia TESLA, tags MACK, ADKD 0/4/12) e seus resultados nos cenários publicados; eles usam apenas HMAC-SHA-256, uma cadeia SHA-256, chaves de 128 bits, tags de 40 bits e entradas de consulta { "33" } e { "34" }, de modo que CMAC-AES, cadeias SHA3-256 e outros parâmetros são cobertos apenas por testes publicados de respostas conhecidas das primitivas e por testes sintéticos. O endurecimento de tempo confiável, vinculação de dados, expiração e confirmação de cabeçalho é testado por testes sintéticos de ataque, e não por uma referência independente externa. Não verificado: listas de revogação de certificados, sinais ao vivo ou um receptor ao vivo (o layout de palavras UBX é verificado apenas em quadros sintéticos), árvores de Merkle SHA3-256, frescor sem um tempo independente. Não é um serviço da UE

# text
seg-27a61718eb95 = Caracterização de estabilidade de frequência

# text
seg-56174d771190 = Desvio de Allan/modificado/de Hadamard + identificação de ruído de lei de potência com ICs de χ²

# text
seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / desvios de referência do Stable32 sobre o NBS14

# text
seg-25b78672c194 = Estabilidade de frequência em um relógio real medido

# text
seg-fd378f5fe04a = Desvio de Allan sobreposto + desvio de Hadamard sobreposto em um padrão de césio real

# text
seg-64fd49d58394 = ADEV/HDEV sobrepostos do Stable32 na série de fase medida do césio 5071A (allantools)

# text
seg-f305dbc83f2b = Paridade do estimador de Allan na série canônica de referência do Stable32

# text
seg-5bfca5dcfb7c = Allan sobreposto + Allan modificado + desvio de tempo em toda a escada de AF

# text
seg-327ab6dcf16a = Desvios de referência do Stable32 para PHASE.DAT (Riley; a série padrão de regressão)

# text
seg-96c4275f5a89 = Estabilidade de frequência de alcance estendido (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 e desvio total (TOTVAR): estimadores de estabilidade de tau longo de alcance estendido que chegam a ~{ "75" }% do registro, onde o desvio de Allan se esgota perto de ~{ "50" }%; o híbrido ThêoH com remoção de viés (allan::theoh_curve) construído sobre eles permanece MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" }, uma biblioteca independente de terceiros de estabilidade de frequência: theo1 (NIST SP { "1065" } eq { "30" }) e totdev (NIST SP { "1065" } eq { "25" }) no conjunto de dados LCG hermético do NIST SP { "1065" } §{ "12.4" }; regenerável offline por meio de tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

# text
seg-cc40472fbcbf = Erro Máximo de Intervalo de Tempo (MTIE): métrica de wander de telecomunicações

# text
seg-5c54ba2748f7 = MTIE(τ): a oscilação pico a pico máxima do erro de tempo sobre qualquer janela deslizante de τ = m·tau0, a estatística de wander da ITU-T G.810/G.823/G.8261 contra a qual são escritos os limites das redes de sincronização (máscaras de MTIE): uma figura extremal (máx/mín) distinta da família RMS de Allan

# text
seg-300fd3f945a0 = allantools { "2024.06" }, uma biblioteca independente de terceiros de estabilidade de frequência: mtie() na série de fase LCG hermética do NIST SP { "1065" } §{ "12.4" }; o MTIE é uma estatística puramente de máx/mín, de modo que a saída do estimador é exata bit a bit contra o allantools sobre o array de fase construído de forma idêntica (as constantes de referência versionadas, de 15 algarismos significativos, ficam a { "1" } ULP). Regenerável offline por meio de tests/fixtures/mtie/generate_mtie_reference.py

# text
seg-67d73f3ca14d = Allan modificado / desvio de tempo (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): o desvio de Allan modificado sobreposto (estimador de janela deslizante de segunda diferença que separa o ruído de fase branco do de fase flicker), e TDEV(τ) = τ/√{ "3" }·MDEV(τ), a estatística de wander no domínio do tempo da ITU-T G.811/G.812/G.823 contra a qual são escritas as máscaras de sincronização

# text
seg-24a441f32375 = allantools { "2024.06" }, uma biblioteca independente de terceiros de estabilidade de frequência: mdev() e tdev() na série de fase LCG hermética do NIST SP { "1065" } §{ "12.4" } (a mesma série das linhas Theo1/TOTDEV/MTIE), calculando os mesmos estimadores definidos de forma única; coincidência a <{ "1e-9" } relativo. Regenerável offline por meio de tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (O phasedat_reference.rs, condicionado a dados, também os verifica contra o Stable32 a { "1e-3" }; esta é a verificação cruzada hermética, apertada e sempre ativa)

# text
seg-e4b6d707cbf5 = Estabilidade de frequência de um relógio óptico em uma curva real medida

# text
seg-e9077554a08f = Recuperação por NNLS de lei de potência (FM branca + piso de ruído vermelho) a partir de um desvio de Allan medido e publicado da transição de relógio óptico do ⁸⁸Sr: reproduzindo σ_y(τ) e a escala principal de tau curto 4.7e-16/√τ, com um piso medido genuíno de tau longo, em vez do piso sintetizado de classe óptica que o holdover.rs de outro modo assume

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Fig. { "4" } ADEV medido; curva incorporada literalmente a partir do Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Restrito a reproduzir a curva de estabilidade medida e publicada; as figuras de dispositivo de holdover até o limiar por classe de relógio permanecem MODELLED

# text
seg-cc95c8615d39 = Integridade (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = Separação de soluções de múltiplas hipóteses do ARAIM segundo o ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels e add_v42_protection_levels_ecef: determinação de subconjuntos pelas regras P_THRES e FC_THRES, VPL, HPL, o limiar efetivo de monitor EMT e sigma_acc); detecção de falhas do RAIM instantâneo por qui-quadrado com exclusão de um único satélite (raim::snapshot_raim, raim::snapshot_raim_fde) e HPL/VPL baseados em inclinação no nível local geodésico; e a combinação de níveis de proteção do SBAS DO-229E (sbas::sbas_protection_level) no serviço L1. NÃO coberto, declarado de forma direta: as funções de conveniência de sigma uniforme raim::araim_raim e raim::araim_dual_raim NÃO são aderentes à norma ADD (em entradas equivalentes elas ficam a { "0.75" } m de VPL / { "4.04" } m de HPL e a { "0.39" } m de VPL / { "1.93" } m de HPL do Stanford MAAST, um achado); a comparação do SBAS L5 de dupla frequência e multiconstelação (DFMC) é um achado ({ "308" } pares usuário-época sem GEO em visada são protegidos pelo Kshana e não pelo MAAST, cujo critério de recepção de GEO o Kshana não modela); raim::solution_separation_raim não tem comparação externa

# text
seg-a83c68500982 = Três ferramentas independentes, com fixação antecipada (0123cee1) antes de existir qualquer fixture ou saída de referência independente, com tolerâncias fixadas então. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, executado como programa separado sob o GNU Octave { "8.4" } com uma camada de compatibilidade unique() do lado do driver (divulgada, sem alteração de algoritmo), com o TOL_PL do ADD de { "0.05" } m: o Rust reproduz a implementação de referência do ADD em { "270" } casos reais. Divulgado: o caminho ADD do Kshana foi escrito após o pré-registro, seguindo o ADD como o MAAST o implementa; um conjunto reservado independente feito pelo revisor ({ "270" } novas geometrias de usuário e uma segunda mensagem de suporte à integridade, com o MAAST executado de novo contra o código congelado) passou no mesmo limiar. ({ "2" }) RAIM instantâneo: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde em um harness separado em C para detecção e exclusão; o PL de inclinação a partir de matinv/xyz2enu do RTKLIB mais chi2/ncx2 do SciPy { "1.18.1" }, em que ambos os lados avaliam a mesma forma fechada (Brown; Parkinson e Axelrad), de modo que a verificação do PL cobre a implementação, não a fórmula. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, sem modificação, nas próprias transmissões WAAS gravadas do MAAST: níveis L1 a { "1e-4" } m após o reescalonamento de K e um conjunto protegido igual. As mesmas comparações produziram os achados declarados na capacidade: as funções de ARAIM de sigma uniforme não são aderentes à norma ADD, e a igualdade de conjuntos do L5 falha em { "308" } pares sem GEO em visada (os níveis nos { "3267" } pares que ambas as ferramentas protegem concordam a { "1e-13" } m). Os fatores K de DO-229E/DO-316 são constantes transcritas e a geometria real é uma entrada; nenhum dos dois é contado como referência independente. Revisão { "0.30" }: os níveis de proteção de snapshot_raim passaram do nível local radial para o geodésico (até { "0.31" } m de HPL e { "0.14" } m de VPL a { "16" } graus N)

# text
seg-1c37702cc5f2 = Propagação e determinação de órbita

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell com 6 DOF + perturbações, OD em lote/sequencial

# text
seg-c84585f43297 = Vetores de verificação AIAA 2006-6753 do SGP4

# text
seg-50c545872e4f = Propagador numérico de Cowell e modelo de forças

# text
seg-74f8c585bcfd = Propagador numérico de Cowell com um modelo hierárquico de forças (dois corpos, zonal J2–J6, terceiros corpos Sol/Lua, SRP de bola de canhão, arrasto exponencial); RK4 com duplicação de passo / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853: uma biblioteca independente, com um integrador e uma recursão de harmônicos esféricos diferentes. Os níveis conservativos (dois corpos → zonal J2–J6 → terceiros corpos Sol/Lua → SRP de bola de canhão) concordam a nível submétrico em um arco de { "24" } h, validando o integrador + a álgebra de forças; o nível de arrasto e a fidelidade absoluta das entradas de efemérides de Sol/Lua / densidade permanecem MODELLED (apenas caracterização)

# text
seg-d38c4be472ac = Sombra de SRP com Terra oblata (opcional)

# text
seg-ab8247c6b4d2 = Fração iluminada da SRP com o elipsoide WGS-84 como corpo oclusor (raio aparente da Terra do limbo do elipsoide em direção ao Sol, fórmula de lente de disco duplo; srp_shadow::oblate_conical_shadow), opcional no modelo de forças de Cowell por meio de propagator::ForceModel::srp_shadow (padrão: a sombra cônica esférica, inalterada)

# text
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio com um corpo oclusor WGS-84 e um OneAxisEllipsoid esférico, executado como programa separado com o Sol fixo na mesma posição inercial. Limiares fixados antecipadamente em xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } em ambos, e uma dispersão oblata versus esfera > { "1e-2" }; todos atingidos. O eixo do elipsoide é o eixo z inercial dos dois lados (sem precessão-nutação)

# text
seg-01066d639b39 = Pressão de radiação solar de caixa-asa e ECOM2, com derivadas parciais (opcional)

# text
seg-2a5fc9708bd0 = SRP que não é de bola de canhão: um modelo de placas planas de caixa-asa (Vallado eq. 8-44; painéis do corpo de face única, asas apontadas para o Sol) com as tabelas do Galileo FOC, IOV e fim de vida do IOV dos metadados de satélite do GSC, em direção de guinada nominal de GNSS, com derivadas parciais analíticas para o fator de radiação e para os coeficientes especular e difuso de cada painel; e o modelo empírico ECOM2 (D2/B1) com suas derivadas parciais. A caixa-asa é opcional no propagador de Cowell (propagator::ForceModel::box_wing_srp, definindo seu campo srp_boxwing) e no modelo de determinação precisa de órbita (precise_od::PreciseForceModel::box_wing_srp), substituindo o termo de bola de canhão com cr como fator de radiação; ambos têm None como padrão, deixando todo caminho existente idêntico byte a byte. O ECOM2 não está ligado a um modelo de forças

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft com FixedPanel e PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), guinada nominal GenericGNSS e ECOM2(nD = { "2" }, nB = { "1" }), executado como programa separado com o Sol em posições inerciais fixas; a derivada do fator de radiação a partir do Gradient do Hipparchus, derivadas por painel como diferenças centrais do Orekit (o Orekit não tem nenhuma). Limiares fixados antecipadamente em xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), antes de existir qualquer saída do Orekit: { "1e-12" } relativo ({ "1e-11" } de ponta a ponta, { "1e-9" } para as diferenças); todos atingidos (RESULTS.md). VALIDATED cobre apenas a avaliação do modelo: as tabelas do GSC são entradas transcritas, e a adequação de uma caixa-asa a órbitas reais do Galileo, a reemissão térmica, a lei modificada de guinada de beta baixo e as curvas de eclipse não são cobertas; a predição de SRP do Galileo permanece MODELLED

# text
seg-bde1b3a94a47 = Sombra de SRP com escurecimento de limbo solar (opcional)

# text
seg-eaaec545dd68 = Fração iluminada da SRP como a fração não ocultada do fluxo solar com escurecimento de limbo (lei de aproximação de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadratura de Gauss-Legendre) sobre uma Terra esférica ou WGS-84 (srp_shadow::limb_darkened_shadow, a variante OblateEarthLimbDarkened de ShadowModel)

# text
seg-76cb4b668ad5 = Nenhuma externa: o Orekit { "12.2" } não tem razão de iluminação com escurecimento de limbo. Verificado apenas contra formas fechadas da mesma lei

# text
seg-673b17e9dcf7 = Densidade termosférica NRLMSISE-00

# text
seg-09e997231de8 = Um porte da termosfera empírica NRLMSISE-00 (gtd7 e gtd7d: densidades de espécies, densidade de massa total com oxigênio anômalo, temperaturas; as { "24" } chaves; modos de Ap diário e de array ap de 3 horas) a partir da versão em C, de domínio público, do Fortran do NRL

# text
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, que executa o GTD7D em Fortran do NRL em precisão simples, e o porte em C do NRLMSISE-00 (versão { "20190709" }, domínio público) compilado como programa separado, além das { "17" } saídas de teste publicadas da distribuição em C. Limiares fixados antecipadamente em xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) antes de o porte existir; todos atingidos (RESULTS.md). Valida o porte, não a exatidão do modelo contra a densidade medida

# text
seg-12977f65b2ea = Nível de densidade de arrasto NRLMSISE-00 (opcional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential padrão, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) e propagator::ForceModel::drag_density: arrasto quadrático contra a atmosfera em co-rotação com a densidade NRLMSISE-00 no ponto geodésico WGS-84 (ângulo de rotação da Terra com UT1 = TT, hora solar local UT + lon/15), clima espacial constante por modelo; desativado por padrão e idêntico bit a bit

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com DragForce sobre a própria implementação NRLMSISE00 do Orekit, executado como programa separado com o mesmo referencial de ângulo de rotação da Terra, forma WGS-84, convenção de hora solar local (um Sol médio) e TT como UT; a configuração das convenções foi verificada de uma referência independente contra a outra (Orekit contra pymsis, { "5.2e-5" } em densidade). Limiares fixados antecipadamente em xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } do deslocamento de arrasto, e duas verificações de sensibilidade > { "100" } m; todos atingidos. Não coberto: a exatidão do modelo contra a densidade medida, o clima espacial variável no tempo, uma etapa com o GMAT

# text
seg-1ac7430e88fc = Arrasto exponencial padrão contra uma implementação independente (equatorial)

# text
seg-a9c41b03f2ca = O arrasto padrão do propagador de Cowell: arrasto quadrático contra a atmosfera em co-rotação com forces::atmospheric_density, a tabela exponencial por partes da Tabela 8-4 de Vallado na altitude esférica (propagator::ForceModel::drag com a variante Exponential padrão de forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole com a atmosfera Exponential (a mesma tabela de 28 faixas), Terra de massa pontual e PrinceDormand78, executado, nunca incorporado ao repositório. Limiares fixados antecipadamente em xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) sobre o deslocamento de arrasto de cada lado (execução com arrasto menos sem arrasto), que cancela os dois valores de mu da Terra e os integradores; todos atingidos (RESULTS.md). O GMAT usa altura geodésica e o kshana usa altitude esférica: elas só coincidem no equador, de modo que VALIDATED cobre órbitas equatoriais; fora do equador os modelos diferem por projeto ({ "10.4" } % do deslocamento de { "24" } h a { "51.6" } graus, { "400" } km). A compilação pública do GMAT não tem NRLMSISE-00 (plugin ausente), de modo que o nível NRLMSISE-00 tem apenas a referência independente do Orekit. A exatidão da tabela contra a densidade medida não é coberta

# text
seg-9e15970435c3 = Sol e Lua da DE440 no modelo de forças de Cowell (opcional)

# text
seg-de6831cf7785 = Nível opcional de efemérides para os termos de terceiros corpos e de SRP do ForceModel numérico de Cowell: o Sol e a Lua geocêntricos de qualquer EphemerisProvider (um kernel SPK DE440 por meio de KernelEphemeris) em TDB = TT + (TDB - TT), recusando um provedor que não consiga atender à época e contando qualquer recurso à série analítica; desativado por padrão

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com ThirdBodyAttraction e SolarRadiationPressure sobre o próprio leitor DE440 do Orekit (orekit-data lnxp1990.440), executado como programa separado; o kshana lê um recorte bit a bit, verificado com o SPICE, do NAIF de440s.bsp. Limiares fixados antecipadamente em xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). O limiar de órbita ({ "0.5" } m) e o controle de sensibilidade são atingidos, mas o limiar de posição do Sol/Lua ({ "3" } m / { "0.2" } m) não foi atingido, com { "6.39" } m / { "0.244" } m. O SPICE lendo o mesmo kernel no seu TDB exato erra em relação ao Orekit na mesma medida ({ "6.25" } m / { "0.240" } m), de modo que a diferença está entre o caminho de de440s do NAIF e o leitor DE440 ou a escala de tempo do Orekit; causa não isolada. Registrado e fixado, de modo que a linha permanece MODELLED

# text
seg-057c21daf4f2 = Maré atmosférica S1 (opcional)

# text
seg-f600a39f297e = A maré diurna S1 de pressão do ar como perturbação do geopotencial: modelo N1 de Biancale e Bode ({ "2006" }), graus { "2" } a { "6" }, pela fórmula de carga da Eq. { "6.21" } do IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional nos modelos de forças de Cowell e preciso (air_tide_s1, desativado por padrão)

# text
seg-7dd9fccac779 = Nenhuma externa para o efeito no geopotencial. Os { "24" } coeficientes são transcritos do modelo N1 da Tabela { "1" } do GFZ STR06/01 e foram reverificados linha a linha contra o relatório (SHA-256 890865ae); os graus { "0" }, { "1" }, { "7" } e { "8" } não são usados. Ray e Ponte ({ "2003" }) não imprimem tabela de harmônicos esféricos, de modo que nenhuma segunda fonte foi comparada

# text
seg-b150b1bdb599 = Coeficientes da maré atmosférica S2 na convenção do IERS

# text
seg-87e9238b8c53 = Harmônicos de pressão do ar S2 de Ray ({ "2001" }) (n <= { "4" }, prógrado e retrógrado) convertidos para a forma totalmente normalizada, com avanço em seno, das Eqs. 6.20-6.21 do IERS { "2010" } (amplitude dividida por N_nm, epsilon = { "90" } graus - psi) e aplicados como o termo S2 de tides::atmospheric_tide

# text
seg-4745148b6c60 = Biancale e Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Tabela { "5" }, modelo A2: Ray ({ "2001" }) publicado em harmônicos totalmente normalizados com fases em avanço de seno, uma representação independente do mesmo modelo. Fixado antecipadamente em xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) com a correção que ele valida. Cobre apenas a conversão de coeficientes; o efeito da maré atmosférica no geopotencial não tem referência independente externa

# text
seg-444f0a65b6fd = Geopotencial tesseral no propagador de Cowell

# text
seg-ad475816bc78 = Campo tesseral EGM2008 opcional (até grau/ordem { "70" }) como gravidade central do ForceModel de Cowell numérico, avaliado em um referencial fixo à Terra, rotacionado pelo ângulo de rotação da Terra da IAU { "2000" } (ou pela cadeia CIO GCRS-ITRS); desativado por padrão, de modo que nenhuma saída existente se altera

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 com HolmesFeatherstoneAttractionModel sobre os mesmos coeficientes (tools/egm2008_to70.gfc) em um referencial do corpo rotacionado pela mesma fórmula do ângulo de rotação da Terra, executado como um programa separado. Limiares fixados antecipadamente (f0e0e65, emendados antes de qualquer comparação em 2da899a): |dr| <= { "0.5" } m e |dv| <= { "5e-4" } m/s, e ambos os controles negativos errando por > { "100" } m; todos atingidos, e os limiares foram então apertados para { "0.1" } m e { "1e-4" } m/s. Não validado: a fidelidade da orientação da Terra (ambos os lados usam UT1 = TT sem precessão-nutação no referencial Era), a opção de referencial Cio (apenas verificação interna), graus acima de { "70" }

# text
seg-e8f5ff8c9149 = Gravidade por harmônicos esféricos de alto grau (EGM2008 até { "2190" })

# text
seg-d3b2f32dcecb = Avaliação, sem underflow e sem singularidade nos polos, de um campo totalmente normalizado até o grau { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, coluna direta modificada de Holmes-Featherstone { "2002" } com o gradiente livre de 1/cos phi), um carregador ICGEM .gfc em fluxo (from_gfc_file / from_gfc_reader; o EGM2008 completo é obtido em tempo de execução, não incluído no pacote) e o avaliador de Holmes-Featherstone selecionável no Geopotential de Cowell opcional

# text
seg-8651532685f3 = HolmesFeatherstoneAttractionModel do Orekit { "12.2" } (Apache-2.0) e MakeGravGridPoint do pyshtools { "4.14.1" } (BSD-3-Clause), executados como programas separados; limiares fixados antecipadamente em xval/high-degree-gravity/PREREGISTRATION.md (276c869f) e xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). O Orekit concorda em todos os pontos em que está definido, mas o pyshtools não atinge o limiar fixado antecipadamente nos dois pontos próximos ao polo (até { "7.3e-10" } m/s^{ "2" }; uma verificação em mpmath com 50 dígitos atribui o erro ao pyshtools), não há valor de referência independente exatamente sobre o eixo polar, e o controle de sensibilidade de grau 70, fixado antecipadamente, da órbita de { "24" } h não foi atingido ({ "0.726" } m contra > { "1" } m). Cada falha é registrada, não ajustada para desaparecer, de modo que a linha continua MODELLED

# text
seg-e81b7418c382 = Integrador DOP853

# text
seg-e6e3638aa68e = Runge-Kutta explícito DOP853 de Hairer { "8" }({ "5,3" }) com o estimador de erro combinado de 5ª/3ª ordem, o controlador de passo do SciPy/Hairer, passo inicial automático, uma proteção de passo com falha segura e saída densa de 7ª ordem; selecionável como a variante Dop853 do Integrator do propagador / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = solve_ivp(method=DOP853) do SciPy { "1.18.1" } (BSD-3-Clause) e suas rotinas de passo único, norma de erro, saída densa e passo inicial, uma implementação independente; estados exatos de dois corpos do mpmath { "1.3.0" } com { "40" } dígitos. Limiares fixados antecipadamente em xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) antes da primeira comparação; todos atingidos (xval/dop853-scipy/RESULTS.md). O primeiro passo do SciPy é dado a ambos os solucionadores nas execuções completas; a rotina de passo inicial é comparada separadamente. Não coberto: RKF7({ "8" }), detecção de rigidez, localização de eventos

# text
seg-9ad7c1f4da77 = Solucionador robusto da equação de Kepler

# text
seg-4b9d812fd13e = Solucionador de Kepler elíptico para todo { "0" } <= e < { "1" } e todas as anomalias médias: ponto de partida cúbico e correção de quinta ordem de Markley ({ "1995" }), um resíduo sem cancelamento (1-e)E + e(E - sin E) - M e refinamento de Newton protegido (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = Raízes com 50 dígitos do mpmath { "1.3.0" } (BSD-3-Clause) a partir das entradas binárias exatas. Limiares fixados antecipadamente em xval/kepler-mpmath/PREREGISTRATION.md (df22174), expressos em relação a |E| com o argumento de condicionamento e -> { "1" }, M -> { "0" }; todos atingidos (xval/kepler-mpmath/RESULTS.md). Os solucionadores legados (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) permanecem numericamente inalterados, porque as saídas versionadas dependem deles, e não são cobertos por esta linha

# text
seg-1960804ef2f4 = Determinação de órbita em lote com distância, taxa de distância e az/el, com máscara de estação

# text
seg-4c185244bc66 = Recuperar um estado de época a partir de rastreamento misto de distância, taxa de distância e azimute/elevação acima de uma máscara de elevação, por Gauss-Newton sobre H = (dh/dx(t)) Phi(t, t0): derivadas parciais analíticas das medições e uma matriz de transição de estado variacional com derivadas parciais analíticas de dois corpos + J2 (integrada por RK4, não uma STM em forma fechada)

# text
seg-6c6a42c25433 = BatchLSEstimator do Orekit { "12.2" } (Apache-2.0) com medições geométricas instantâneas personalizadas RangeRate e AzEl (conferidas com o TopocentricFrame do Orekit), executado como um programa separado sobre observações idênticas, com máscara e semente fixas. Limiares fixados antecipadamente em xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Todos os limiares atingidos, exceto B4, a concordância de estado sem ruído de { "1" } cm, não atingido em { "2" } de { "4" } cenários ({ "1.46" }, { "1.74" } cm): a própria estimativa sem ruído do Orekit fica a essa distância de sua verdade simulada (causa do lado do Orekit não isolada). Registrado e fixado, de modo que a linha continua MODELLED. Não modelado: tempo de luz, aberração, refração, rotação da Terra, um filtro sequencial para esses tipos de medição

# text
seg-bc3d1ee7c639 = Ponderação das observações por código de acurácia do SP3

# text
seg-63b1fab84f85 = Mapear os códigos de acurácia do SP3 (expoentes ++ do cabeçalho em { "2" }^n mm, a base %f, desvios-padrão base^n mm por registro) para sigmas de posição por observação para o motor de determinação precisa de órbita (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Nenhuma externa: os pesos são uma escolha de modelagem (o formato SP3 define o código apenas como o indicador de acurácia do produtor; aqui ele é lido como um sigma por eixo). As execuções de agências já registradas permanecem inalteradas

# text
seg-e35df6881c80 = Campos gravitacionais planetários a partir de tabelas SHADR do PDS

# text
seg-f78b73ae8742 = Ler tabelas de harmônicos esféricos SHADR do PDS (from_shadr, em SphericalHarmonicField em src/gravity_pds.rs: conversão de unidades, C00 = { "1" } fornecido, verificações de completude e normalização) e avaliar a gravidade fixa ao corpo de Marte GMM-3 (g/o { "120" }) e do campo lunar GRAIL GL0660B (g/o { "660" })

# text
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) lendo os mesmos arquivos do PDS e avaliando a gravidade pontual, executado como um programa separado, e os cabeçalhos e rótulos publicados dos produtos do PDS. Limiares fixados antecipadamente em xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); todos atingidos (RESULTS.md). Dados: NASA PDS Geosciences Node, domínio público; recortes de grau 20 incluídos com NOTICE, arquivos completos obtidos no momento do teste

# text
seg-ae3e8833a5ef = Associar um campo gravitacional publicado a um corpo

# text
seg-ffb2b20e5f32 = with_gravity_field (em Body, em src/gravity_pds.rs): associa qualquer campo de harmônicos esféricos carregado (por exemplo GMM-3 ou GL0660B) a um Body para que o propagador o avalie fixo ao corpo; opcional, corpos padrão inalterados

# text
seg-bcb731f7a9b5 = Apenas consistência interna. Cada campo publicado é definido no referencial fixo ao corpo de seu produtor (GMM-3 no referencial de Marte de Konopliv et al. { "2006" }, GL0660B no referencial de eixos principais lunar DE421), enquanto o campo é avaliado no referencial da IAU; a diferença não é modelada

# text
seg-659bfeba459c = Determinação de órbita em lote e sequencial

# text
seg-dbc98f498941 = Recuperar um estado de época [r,v] a partir de distâncias de estações terrestres por meio de um corretor diferencial em lote de Gauss–Newton e um filtro sequencial, sobre um modelo de forças de dois corpos+J2

# text
seg-ecfce82a4e3d = BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) do Orekit { "12.2" } (CS GROUP, Apache-2.0) — uma biblioteca de estimação de terceiros independente, sobre um modelo de forças equivalente; o estado de época recuperado e o RMS dos resíduos pós-ajuste concordam a <{ "1e-3" } m sem ruído e <{ "3" } m com um piso de ruído de { "5" } m

# text
seg-acdac055acb9 = Solucionador de tempo de luz radiométrico para o espaço profundo

# text
seg-62a478e40850 = Solução de tempo de luz unidirecional retardada (trecho de descida) τ = |r_rx − r_target(t−τ)|/c para navegação radiométrica no espaço profundo (Terra→Marte/Sol/Lua)

# text
seg-a38690bb69fa = Tempo de luz com aberração newtoniana convergida do ANISE { "0.10" } (Nyx Space, MPL-2.0) (Aberration::CN; equivalente ao spkapo do SPICE) sobre o JPL DE440 — uma implementação SPICE independente em Rust; o solucionador retardado de ponto fixo do kshana coincidiu em escala sub-nanossegundo. Os demais números de Doppler / Shapiro / DO de dinâmica reduzida continuam MODELLED

# text
seg-c69ef9342160 = Posição de satélite pelas efemérides de transmissão (RINEX multi-GNSS)

# text
seg-62702fc6f242 = Posição ECEF do satélite a partir das efemérides de transmissão keplerianas IS-GPS-200 / Galileo-OS / BeiDou-OS, a partir de um registro de navegação RINEX-3 interpretado

# text
seg-cb66d33b7ba7 = eph2pos() do RTKLIB v2.4.2-p13 compilado a partir do código-fonte em C (T. Takasu, BSD-2-Clause) — uma implementação independente do IS-GPS-200/SIS-ICD, alimentada com os mesmos registros de navegação RINEX-3; a posição ECEF do satélite coincidiu a ~{ "62" } nm. (A interpolação de efemérides precisas SP3 é validada separadamente — ver 'Interpolação de efemérides precisas SP3')

# text
seg-c807a782b20e = Interpolação de efemérides precisas SP3

# text
seg-238de70daab9 = Interpolação de Lagrange padrão do IGS das posições de satélite das efemérides precisas SP3 com a correção de rotação da Terra por nó (rotacionar cada nó por ω⊕·(t_node−t) para o referencial fixo à Terra do instante de consulta antes do ajuste polinomial)

# text
seg-e9249ae44a11 = peph2pos() do RTKLIB compilado a partir do código-fonte em C (preceph.c; T. Takasu, BSD-2-Clause) — a referência de fato do IGS, uma implementação independente; o interpolador do kshana (agora com a mesma correção de rotação da Terra por nó) coincidiu a ~{ "15" } nm em um produto SP3 real, contra ~{ "5.5" } cm antes da correção

# text
seg-9762cf428435 = Codificadores de mensagens de navegação além do GPS LNAV (GPS CNAV, Galileo I/NAV e F/NAV)

# text
seg-9b703b9607d8 = Tipos de mensagem GPS CNAV 10/11/30, tipos de palavra Galileo I/NAV 1-5 em páginas pares/ímpares nominais e tipos de página Galileo F/NAV 1-4: empacotamento e quantização dos campos do ICD, CRC-24Q, codificação convolucional de taxa 1/2 K={ "7" } (G2 invertido para o Galileo), entrelaçamento em blocos e padrões de sincronização, com decodificadores de teste correspondentes

# text
seg-7939b210e83c = Ciclo completo interno e respostas conhecidas do ICD; nenhum decodificador de terceiros foi executado (o arquivo de teste do RTKLIB/GNSS-SDR que lê KSHANA_NAVMSG_ORACLE_JSON é condicionado a dados). MODELLED

# text
seg-5ce7cd3d6011 = Leitor de mapas globais de ionosfera IONEX e interpolação em um GIM real do CODE

# text
seg-502656556ddf = Leitor IONEX { "1.0" } (cabeçalho, valores I5 de coluna fixa, mapas de TEC e RMS, épocas absolutas, valores ausentes) com interpolação espacial bilinear, a interpolação temporal do formato por mapa mais próximo / consecutivo / rotacionado (eqs. 1-3) e TEC oblíquo de casca fina

# text
seg-1575dc4cfb4a = Os valores impressos do GIM do CODE (exatos em cada nó; o mapa é obtido no momento do teste, não incluído no repositório, por sua licença não estar confirmada) e uma reimplementação independente em Python stdlib das fórmulas de interpolação do IONEX { "1.0" }, versionada com o fixture (limiares fixados antecipadamente e4d8b1f, { "1e-9" } TECU). Verificação de terceiros (B6, fixada antecipadamente, primeira execução): o iontec do RTKLIB v2.4.2-p13 (BSD-2-Clause, executado como ferramenta separada) em { "6885" } pontos de consulta concorda com IonexFile::vtec_at a { "3.6e-13" } TECU nos dois modos de interpolação, contra um limiar de { "1e-5" } TECU. Condicionado a dados: GIM do CODE obtido no momento do teste, com SHA fixado; o RTKLIB lê o arquivo completo porque seu getindex rejeita o recorte de latitude. tests/fixtures/ionex_code_gim/fetch.sh o obtém e confere o SHA-256, o teste falha com quaisquer outros bytes, e run_rtklib.sh é o caminho documentado de reprodução (requer acesso à rede). Promovido a VALIDATED por decisão do proprietário com base em evidências condicionadas a dados (2026-10-13)

# text
seg-974d8c1f7876 = Suavização do código pela portadora de Hatch em observações RINEX reais

# text
seg-f26b5da0f52e = Filtro de Hatch sem divergência (código livre de ionosfera conduzido pela portadora livre de ionosfera, janela de N épocas, reinício em caso de perda de travamento, salto livre de geometria ou lacuna) na montagem de posicionamento pontual preciso

# text
seg-fac84cb9b256 = CONSTATAÇÃO em relação à coordenada ITRF2020 publicada da WTZR: os limiares fixados antecipadamente (mediana e p95 suavizadas no máximo { "0.6" } x o bruto; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) não foram atingidos, razões { "0.718" } e { "0.923" }; o erro residual na escala de metros é do tipo viés (viés de código C1C, antena, maré, multicaminho de longo período), não o ruído branco que a suavização remove. MODELLED: as estatísticas do filtro são verificadas internamente

# text
seg-2eec513ae8c8 = Diferenças duplas de RTK com fixação de inteiros por LAMBDA em observações RINEX reais

# text
seg-6571676bf918 = Posicionamento relativo de linha de base curta a partir de código e fase da portadora GPS de dupla frequência reais: diferenças duplas em relação ao satélite mais alto com sua covariância completa, um filtro de Kalman float sobre a linha de base e as ambiguidades de diferença simples com reinicialização em caso de salto, mínimos quadrados inteiros LAMBDA com o teste de razão e a linha de base condicionada aos inteiros fixados

# text
seg-e50c5d4b65c7 = Coordenadas ITRF2020 publicadas de WTZR e WTZZ (IGN ITRF2020_GNSS.SSC, solução { "3" }, com as alturas de antena do RINEX) que fornecem a linha de base de referência; limiares fixados antecipadamente em tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md antes de o código ser escrito. Apenas linha de base curta: nenhuma diferença dupla ionosférica ou troposférica é modelada

# text
seg-f9aa0c529393 = Solução de tempo do relógio do receptor por PPP em relação ao relógio final de estação do IGS

# text
seg-83ad9e893db9 = O relógio do receptor estimado pelo filtro PPP float estático sobre código e fase GPS de dupla frequência reais, com órbitas e relógios finais do IGS: uma transferência de tempo do receptor para o tempo do IGS, a solução de tempo livre de ionosfera do PPP.

# text
seg-91a882dd71e8 = O relógio combinado final do IGS para a estação WTZR (registros AR de IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, uma combinação das soluções de rede de vários centros de análise; produtos do IGS, uso livre com atribuição); limiares fixados antecipadamente em xval/ppp-time/PREREGISTRATION.md antes de qualquer comparação; todos se mantiveram na primeira execução. O QUE NÃO É: uma estação e uma janela convergida de duas horas; tempo do IGS, não UTC(k); o deslocamento constante inclui vieses de código do receptor e é limitado, não calibrado; sem rastreabilidade à Circular T.

# text
seg-a9b2a93401a3 = Posicionamento pontual preciso float em observações RINEX reais

# text
seg-cc991ccec112 = Filtro de Kalman estendido de PPP float estático sobre código e fase da portadora GPS de dupla frequência reais com órbitas e relógios finais do IGS: combinação livre de ionosfera, deslocamentos de antena do satélite e do receptor (variações do receptor), maré da Terra sólida, phase wind-up, atraso de Shapiro, atraso úmido zenital estimado, ambiguidades float por arco com detecção de saltos por livre de geometria / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Coordenada ITRF2020 publicada da WTZR (IGN ITRF2020_GNSS.SSC, solução { "3" }, propagada com sua velocidade) — limiares fixados antecipadamente em tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md antes de o filtro ser escrito; desenvolvimento apenas na estação colocalizada WTZZ. Não modelado: carga oceânica, PCV do satélite, resolução de ambiguidade inteira

# text
seg-c8d87abed330 = Leitura de arquivos de navegação RINEX { "4" }

# text
# c1: > EPH
seg-28913a01af00 = Arquivos de navegação RINEX 4.00-4.02: registros <c1/> de GPS LNAV, Galileo I/NAV e F/NAV, BeiDou D1/D2 e QZSS LNAV decodificados no tipo de efemérides de transmissão; registros CNAV, CNV1-3, FDMA, SBAS, STO, EOP e ION ignorados até o próximo cabeçalho de registro; um registro cujo cabeçalho nomeia outro satélite, ou um registro truncado, recusado

# text
seg-687b3b159691 = O arquivo de transmissão mesclado RINEX { "3" } do mesmo dia do IGS (dados publicados, escritos por um gerador de arquivos diferente a partir das mesmas mensagens de transmissão); limiares fixados antecipadamente em tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) antes da primeira execução

# text
seg-278ca396127a = Leitura de arquivos de observação RINEX { "4" }

# text
seg-e0883aa933eb = Cabeçalhos de observação RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; rótulos identificados nas colunas 61-80 para a versão { "4" } e posteriores) e registros de época

# text
seg-971fb1203a6d = Aderência à norma de formato em um arquivo RINEX { "4.00" } real publicado (os valores lidos de volta são iguais aos literais impressos no arquivo) e em um cabeçalho derivado da especificação; nenhum leitor independente foi executado, portanto MODELLED

# text
seg-33e5c74720ff = Posição de satélite GEO do BeiDou pelas efemérides de transmissão

# text
seg-44b61449b65a = Posição de satélite geoestacionário segundo BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de efemérides de transmissão (referencial quase inercial, depois Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional por meio do campo include_beidou_geo de NavParseOptions, de modo que o leitor padrão continua ignorando os GEOs

# text
seg-06d500099814 = Fixado antecipadamente (7aa264b, 110fef9) em relação a uma órbita precisa IGS MGEX com os GEOs; nenhum produto desse tipo estava acessível na sessão que o construiu, portanto a comparação está pendente e a linha é MODELLED (verificada apenas em relação às posições nominais publicadas dos GEOs)

# text
seg-559814996a4c = Interpolação de relógio preciso SP3

# text
seg-8e7a0dbd1755 = Desvio do relógio do satélite entre os nós de relógio tabulados do SP3 por interpolação linear sobre os dois nós válidos que o delimitam (o esquema pephclk do RTKLIB; sentinela de relógio inválido ignorada), e os mesmos nós alimentados à cadeia de produtos precisos como registros equivalentes a relógio RINEX

# text
seg-1f4f0f841802 = Combinação final de relógios de satélite de { "30" } s do IGS (IGS0OPSFIN 30S CLK, 2025-02-24): estimativas de relógio publicadas nos instantes de consulta, não interpoladas a partir do SP3; limiares fixados antecipadamente em tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md antes da primeira execução (RMS { "0.15" } ns, p95 { "0.30" } ns, mediana por nó { "1e-12" } s, discriminação 2x)

# text
seg-71f48628ebb2 = GNSS/INS fortemente acoplado por fase da portadora com ambiguidades float

# text
seg-5a156aa81275 = EKF de estado de erro sobre { "15" } estados do INS, um relógio de receptor de dois estados e uma ambiguidade float de portadora por satélite rastreado; pseudodistância, fase da portadora e taxa de distância opcional a partir de uma constelação Walker SGP4 (tempo de luz e Sagnac), correções de Klobuchar e Saastamoinen/Niell aplicadas no laço na posição do próprio filtro; detecção de saltos por portadora diferenciada no tempo com um limiar por satélite ampliado pela incerteza de velocidade; reinicialização de ambiguidade em saltos e na readquirição

# text
seg-00576e8c1032 = Consistência interna: as medições são sintetizadas a partir dos modelos que o filtro usa (χ² NEES/NIS sobre sementes, uma convergência sem ruído, injeção de saltos). MODELLED; nenhum dado de receptor real nem filtro de terceiros é comparado

# text
seg-7d644516b1ec = Pacotes GNSS/INS marítimo, ferroviário e de aviação com opção de acoplamento forte

# text
seg-cbb03a8baf73 = Três cenários gnss-ins sobre a biblioteca de trajetórias (uma embarcação que serpenteia a { "8" } m/s com uma interrupção de cinco minutos; um trem que passa por um corte com dois satélites e por um túnel; uma aeronave cuja interrupção cobre uma curva inclinada de 25 graus) e a tabela opcional [tight] do pacote: pseudodistâncias de uma constelação Walker SGP4 fundidas pelo navegador de malha fechada, com todos os satélites acima da máscara quando nominal e os poucos mais altos quando degradado

# text
seg-273c14256d4c = Interno: as figuras de mérito de cada pacote em relação à sua própria verdade e uma comparação fraco/forte sobre entradas idênticas. MODELLED; a comparação da auditoria com o NaveGo não foi executada

# text
seg-f4dab73c4eda = Filtro PNT de pseudodistância acoplado com estado de viés e extensão 3-D no pacote de fusão

# text
seg-742b60089361 = Um único filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio, alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que carregam a covariância cruzada); uma variante de 1 grau de liberdade ampliada com um estado de viés constante do acelerômetro, que o pacote de fusão executa sob [coupled]; e a versão 3-D de 8 estados com linhas de linha de visada

# text
seg-9558d7aad3af = Consistência interna: verdade simulada a partir dos próprios modelos dos filtros (χ² NEES sobre sementes de Monte Carlo, o pacote desacoplado sobre sensores idênticos). MODELLED

# text
seg-4a64aa1fe3ca = EKF GNSS/INS fracamente acoplado com braço de alavanca no conjunto de dados KF-GINS

# text
seg-30f503856ac5 = O EKF de estado de erro de 15 estados em malha fechada, conduzido por incrementos de IMU, com posições de antena GNSS fundidas pelo modelo de braço de alavanca H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], configurado a partir de um arquivo YAML do KF-GINS (estado inicial e sigmas, ARW/VRW, vieses de Gauss-Markov)

# text
seg-b01d28a09abe = A trajetória de referência publicada do conjunto de dados e o programa C++ KF-GINS (GPL-3.0, commit 8291a93e, executado como ferramenta separada); limiares fixados antecipadamente em xval/kfgins/PREREGISTRATION.md, e o KF-GINS não foi executado nestes dados antes desse registro (verificado em seus Resultados). Todos os seis limiares se mantiveram na primeira execução. CONDICIONADO A DADOS: o conjunto de dados de demonstração do KF-GINS (IMU Leador-A15 real e GNSS RTK com uma trajetória de referência) não traz licença, portanto não é incluído no repositório; xval/kfgins/fetch.sh o obtém no momento do teste com o SHA-256 de cada arquivo fixado, e o teste falha em caso de divergência; o caminho de reprodução, que requer acesso à rede, está em xval/kfgins/PREREGISTRATION.md. Promovido a VALIDATED por decisão do proprietário com base em evidências condicionadas a dados (2026-10-13)

# text
seg-e6b6c605564c = Exportação de test bench lida pelos leitores de arquivos de movimento de um simulador (gps-sdr-sim)

# text
seg-a07429aa1998 = Os arquivos de movimento da exportação bench, entregues aos leitores próprios de um simulador GNSS de código aberto, retornam como a trajetória exportada: o arquivo NMEA GGA (-g), o recorte tempo/latitude/longitude/altura do CSV de movimento (-x) e seu recorte tempo/x/y/z (-u), em { "6" } cenários gnss-ins (incluindo os pacotes marítimo, ferroviário e de aviação, lidos até o limite de 3000 amostras do simulador) e { "2" } estacionários. Apenas movimento; nenhum sinal é escrito ou gerado.

# text
seg-07b5f46a900f = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: readNmeaGGA, readUserMotion e readUserMotionLLH do gps-sdr-sim (MIT, commit 28ca29a6) com seu próprio llh2xyz WGS { "84" }, chamados por meio de xval/testbench-gpssdrsim/driver.c (nenhuma função de sinal chamada), em relação às colunas fixas à Terra do CSV de movimento linha a linha, com limiares fixados antecipadamente em xval/testbench-gpssdrsim/PREREGISTRATION.md antes de qualquer execução: toda amostra lida em todos os { "8" } cenários; NMEA pior caso { "1.21" } mm (limiar { "1" } cm); recorte LLH pior caso { "0.145" } mm (limiar { "1" } mm); recorte de quatro colunas fixas à Terra exato (limiar { "1" } um, emenda { "1" }); linhas gnss-ins na grade de { "10" } Hz do simulador a { "2.3e-13" } s. CONSTATAÇÃO (execução { "1" }, fixada): o CSV de largura total sem cabeçalho não é legível por -u, porque o buffer de linha de 100 caracteres do leitor divide cada linha de 161 caracteres em duas amostras; docs/TEST-BENCH.md fornece o recorte de quatro colunas. O QUE NÃO É: a física da trajetória verdadeira do cenário; a saída de sinal do gps-sdr-sim; o leitor de qualquer outro simulador; qualquer receptor.

# text
seg-2db2b9dc3b45 = Biblioteca de trajetórias GNSS/INS e importação de verdade em CSV

# text
seg-e1fe83c75a6c = Perfis de movimento selecionáveis para o pacote gnss-ins (reta, figure-8, urbano com para-e-anda, subida e curva coordenada de aeronave, drone de levantamento), definidos por comandos de taxa de Euler e de aceleração ao longo da trajetória fechados sobre o estado verdadeiro com a IMU cinemática (termos centrípeto, gravitacional e de Coriolis), e verdade em CSV importada convertida na IMU que a reproduz; o percurso histórico inalterado quando nenhum perfil é dado

# text
seg-30ea002a06a0 = Interno: identidades de cinemática de corpo rígido, o ciclo completo em CSV e a própria covariância do filtro. MODELLED (nenhum registro de percurso real é comparado)

# text
seg-8685fd899e3c = Mecanização de INS strapdown

# text
seg-ba942e322f8a = Mecanização inercial strapdown WGS-84 NED com atitude em quaternion (compensada de coning/sculling) que propaga um estado de navegação a partir de incrementos (Δθ, Δv)

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) executado no Octave — uma ferramenta de INS publicada e independente, conduzida pelo mesmo fluxo de incrementos (Δθ,Δv). A atitude coincide bit a bit (mesmas convenções NED / quaternion com escalar primeiro / taxa de rotação da Terra / taxa de transporte); velocidade/posição concordam, exceto por duas diferenças documentadas — o termo de gravidade norte da deflexão da vertical, que o NaveGo inclui e o kshana omite por projeto (gravidade de prumo; coincidente com a forma fechada de Groves em todos os dígitos, com uma asserção de piso de sanidade) e diferenças de integrador de O(dt²) — não erros de mecanização

# text
seg-d1a5c8e7ca74 = Síntese de funcionais do campo gravitacional (mapa de navegação auxiliada por gravidade / sem GNSS)

# text
seg-8336eb12eb7b = Magnitude da gravidade por harmônicos esféricos + perturbação (mGal) a partir de qualquer modelo ICGEM .gfc; gravidade normal GRS80

# text
seg-b5a7fc986751 = Gravidade normal de Somigliana do GRS80 (Moritz { "1980" }, IAG) + γ_e/γ_p publicados; campo EGM2008 real do ICGEM

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } do CR3BP Terra-Lua em comparação com a órbita que o CAPSTONE voou

# text
seg-d4127cf241f3 = A órbita de halo quase retilínea sul L2 { "9" }:{ "2" } do problema circular restrito, que cr3bp::differential_correct_halo corrige (a família de órbitas do Gateway e do CAPSTONE), comparada, quanto à geometria média (período, raio de periluna, raio de apoluna), com a órbita que o CAPSTONE realmente voou. Uma medição de quão bem o membro do CR3BP descreve a órbita real; uma órbita do CR3BP não é uma órbita de modelo de efemérides e não é comparada época a época

# text
seg-e0cc33dfb10b = Medido em relação às efemérides reconstruídas do CAPSTONE do JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado na Lua, 2023-03-01..31 a cada { "10" } min), versionadas byte a byte (tests/fixtures/capstone_horizons/, NOTICE.md), fixadas antecipadamente em { "4e868170" } antes de serem obtidas, como uma medição com limiares sobre a geometria média. Não é uma validação: o CR3BP omite o Sol, a excentricidade da Lua e a manutenção de órbita que o CAPSTONE realizou, de modo que os limiares descrevem quão representativa é a órbita do modelo, não uma acurácia. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = Estados rotativos do CR3BP mapeados para o ICRF centrado na Lua na linha Terra-Lua do DE440

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf mapeia um estado rotativo adimensional do CR3BP Terra-Lua para uma posição e velocidade no ICRF centrado na Lua sobre a linha Terra-Lua instantânea (unidade de comprimento a distância Terra-Lua, unidade de tempo o inverso da taxa orbital, a velocidade angular completa do referencial, incluindo sua taxa fora do plano devida à aceleração da Lua), com a inversa from_moon_centred_icrf, e cr3bp::to_moon_centred_icrf_de440 lê o estado geocêntrico da Lua de um SPK do DE440. Ela mapeia estados; não faz de uma órbita do CR3BP uma órbita de modelo de efemérides

# text
seg-d91ce10ea439 = sxform do NAIF SPICE Toolkit (CSPICE N0067 por meio de spiceypy { "8.3.0" }) de um referencial dinâmico de dois vetores (primário +X ao longo da posição da Lua em relação à Terra, secundário +Y ao longo de sua velocidade, de440s), aplicado ao estado rotativo dimensional construído a partir do próprio estado da Lua do SPICE, por um programa separado que não chama nenhum código do Kshana (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Fixado antecipadamente em 2313eb1b, emendado antes de qualquer execução em d5ef79b3 para incluir a velocidade angular fora do plano do referencial (sem ela a velocidade ficaria até { "8e-2" } m/s fora). Uma verificação de biblioteca apenas da transformação. Resultados: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Tipo de cenário do sistema solar sobre um kernel do JPL (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = O tipo de cenário <c1/> com planetary_kernel_path: cada corpo informado cujo próprio código NAIF o SPK contém toma sua posição e velocidade heliocêntricas J2000 do kernel por meio do leitor próprio do motor (rótulo KERNEL), um enlace cujas duas extremidades estão no kernel é calculado nele, baricentros nunca são substituídos por um planeta, e todo outro corpo permanece analítico com seu próprio rótulo; o relatório ganha um bloco kernel (caminho, SHA-256, os corpos e enlaces tomados dele) somente quando a opção é definida. Com de440s.bsp são Mercúrio, Vênus, a Terra e a Lua

# text
seg-05cc6642285b = Estados heliocêntricos spkezr do NAIF SPICE Toolkit (CSPICE N0067 por meio de spiceypy { "8.3.0" }) sobre o de440s.bsp completo, um programa separado que não chama nenhum código do Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); o motor lê recortes de de440s bit a bit. Fixado antecipadamente em f8e946ea. Uma verificação de biblioteca da ligação: o DE440 em si e os corpos analíticos não são validados aqui. Resultados: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop sobre as efemérides DE440

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: a varredura data de lançamento x data de chegada do C3 de partida (km²/s²) e do V-infinito de chegada (km/s) com o solucionador de Lambert prógrado de revolução única e a proteção de colinearidade de { "0.5" } grau, sobre os estados heliocêntricos J2000 de quaisquer dois corpos NAIF lidos de um SPK JPL DE440 pelo leitor próprio do crate. Uma revolução, prógrada, sem restrições de veículo lançador ou de chegada: uma varredura, não um projeto de missão

# text
seg-bd19ca214f29 = Estados heliocêntricos do NAIF SPICE Toolkit (CSPICE N0067 por meio de spiceypy { "8.3.0" }) em de440s.bsp e lambert_problem do pykep { "3.0.1" } (ESA, o núcleo kep3 em C++, MPL-2.0), um solucionador de Lambert independente, executado como um programa separado que não chama nenhum código do Kshana (tests/fixtures/porkchop_de440/, NOTICE.md); o motor lê um recorte de de440s bit a bit. Fixado antecipadamente em 2d857fb1. Uma verificação de biblioteca da varredura. Resultados: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

# text
seg-b1401bed5da8 = Otimizador de transferência impulsiva sobre as efemérides DE440

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: as datas de partida e de chegada de uma transferência balística de dois impulsos e revolução única que minimizam o C3 de partida ou o V-infinito de chegada dentro do Tipo I ou do Tipo II, como um ótimo contínuo (uma grade de 2 dias sobre as duas janelas, depois Nelder-Mead 2-D), sobre estados heliocêntricos do SPK DE440. Um otimizador de datas para um único trecho, não um projeto de missão: sem opções de veículo lançador, órbita de estacionamento, manobra no espaço profundo ou múltiplas revoluções

# text
seg-6c695aef043b = Um otimizador independente: estados heliocêntricos do NAIF SPICE Toolkit (CSPICE N0067 por meio de spiceypy { "8.3.0" }) sobre o mesmo recorte de de440s, lambert_problem do pykep { "3.0.1" } (ESA, MPL-2.0) e Nelder-Mead do SciPy { "1.18.1" }, sem chamar nenhum código do Kshana. O manual da NASA Terra-Marte (MIDAS, efemérides não declaradas, grade de datas de 2 dias) é uma referência publicada secundária e não define o status

# text
seg-93f3cdbb7297 = Solucionador de transferência de Lambert com múltiplas revoluções

# text
seg-995a6a995b78 = Toda solução do problema de Lambert com até três revoluções completas (maneuver::lambert_multirev: a solução de revolução única, depois os ramos esquerdo e direito de cada número de revoluções, Izzo { "2015" }), com as velocidades de contorno v1 e v2, para transferências prógradas e retrógradas, em unidades canônicas e em SI heliocêntrico, incluindo transferências a menos de { "1" } % do tempo de voo mínimo de um número de revoluções e geometrias próximas de 180 graus. Apenas um solucionador de dois corpos (sem perturbações)

# text
seg-77c43836cafe = lambert_problem do pykep { "3.0.1" } (ESA, o núcleo kep3 em C++, MPL-2.0), uma biblioteca independente, executada como um programa separado por scripts/gen_lambert_multirev_ref.py; apenas sua saída numérica é versionada. Fixado antecipadamente em a75de851 (conjunto de casos, limiares, regra de resultado) antes de qualquer comparação; a referência foi regenerada de forma independente e é idêntica byte a byte. Resultados: docs/design/evidence/lambert-multirev/RESULTS.md

# text
seg-ff9c6140fe1c = Solucionador de transferência de Lambert de dois corpos

# text
seg-d8c39ced64b2 = Solucionador de Lambert de revolução única de Izzo-2015 (r1, r2, tempo de voo → velocidades de contorno) em transferências LEO→GEO→heliocêntricas, prógradas e retrógradas

# text
seg-d0470acf4f29 = izzo2015 do lamberthub { "1.0.0" } (J. Martínez Garrido, MIT) — um solucionador de Lambert de terceiros independente. O problema de Lambert de revolução única (M={ "0" }) tem solução única, de modo que a concordância entre bibliotecas é uma verificação externa genuína; coincidência a <{ "1e-4" } m/s (observado ~{ "1e-11" }), o mesmo tipo de validação que o DOP recebe em relação ao gnss_lib_py

# text
seg-347cece5df63 = Referenciais e escalas de tempo

# text
seg-5a4bc2c15eaa = Precessão-nutação IAU 2006/2000A, CIO GCRS↔ITRS, escalas de tempo com segundos intercalares

# text
seg-51d28ab9d256 = Vetores de referência IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Datas julianas de duas partes e segundos intercalares no caminho de tempo de órbita terrestre

# text
seg-5e859e3aa613 = Uma data e hora do calendário UTC para uma data juliana UTC de duas partes com a convenção dtf2d do SOFA para dias que terminam em um segundo intercalar ({ "86 401" } s de duração, { "23" }:{ "59" }:{ "60" }.x válido), UTC para TAI e de volta, e UT1 a partir do UTC por meio do TAI, em datas de duas partes a partir de 1972-01-01: o caminho de tempo que o SGP4 (Sgp4::propagate_at, medido a partir de uma época de duas partes) e a rotação fixa à Terra IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop com o ângulo de rotação da Terra de duas partes) utilizam

# text
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como liberados pelo projeto ERFA), uma biblioteca independente: erfa.dtf2d("UTC"), erfa.utctai e erfa.taiutc sobre os instantes versionados, a diferença formada parte a parte sobre as datas de duas partes, limiar de { "1e-6" } s fixado antes da execução (fixado antecipadamente em e947e69d). Pior diferença { "9.6e-12" } s (dtf2d) e { "1.9e-11" } s (utctai, taiutc). Tomar todo dia UTC como { "86 400" } s, ou deixar a fração do dia intercalar sem escala, faz o teste falhar. O UT1 por meio do TAI (iauUtcut1) é verificado pela etapa ERFA da linha do caminho de órbita terrestre. Escopo: UTC a partir de 1972-01-01; o UTC anterior, de taxa variável, não é modelado

# text
seg-f1c7bc235a6b = Datas julianas de duas partes até a rotação da Terra no caminho de órbita

# text
seg-cee11d4bad08 = Rotação da Terra a partir de uma data juliana UT1 de duas partes no caminho de órbita, de modo que a posição fixa à Terra preserva o microssegundo que uma data em f64 único perde (cerca de { "3e-9" } rad perto de { "2020" }): jd2::gmst82 (GMST IAU { "1982" }, a convenção TEME, sobre as duas partes), cio::gcrs_to_itrs_matrix_jd2 (a matriz CIO GCRS para ITRS com o ângulo de rotação da Terra a partir das duas partes) e, construídos sobre elas e verificados internamente, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 e own_jd2_utc, o two_part_jd opcional do cenário de efemérides (a posição ECEF, o traço no solo e a visão da estação; desativado por padrão, inalterado) e conversões From sem perdas entre jd2::Jd2 e timescales::TwoPartJd. A precessão-nutação e a época do modelo de forças de Cowell permanecem em f64 único, onde um arredondamento de { "40" } us está abaixo de { "1e-15" } rad ou muito abaixo do erro das efemérides analíticas do Sol/Lua

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como liberados pelo projeto ERFA), uma biblioteca independente: gmst82 e c2t06a sobre as datas de duas partes versionadas, movimento polar { "0.1" } e { "0.3" } segundos de arco. Fixado antecipadamente em b10475ee (datas, limiares) antes de as funções serem escritas e antes de a referência independente ser executada. Os testes internos (a opção do cenário, o ciclo completo TEME/ITRF, as conversões de tipo) são autoconsistência de apoio

# text
seg-096df3971f5f = Matrizes de referencial em relação aos vetores do ERFA: viés-precessão IAU { "2006" }, TEME para GCRS e a cadeia CIO com deslocamentos do polo celeste

# text
seg-731a5ed967b3 = Três matrizes de referencial comparadas elemento a elemento ou por ângulo de rotação com o ERFA em épocas arbitrárias: precession::precession_matrix (viés-precessão IAU { "2006" } por ângulos de Fukushima-Williams), nutation::teme_to_gcrs_matrix (a rotação TEME para GCRS P^T N^T Rz(-EE) com precessão IAU { "2006" }, nutação IAU 2000B e a equação dos equinócios com seus dois primeiros termos complementares) e cio::gcrs_to_cirs_matrix_with_offsets (a rotação GCRS para CIRS com os deslocamentos do polo celeste do IERS dX, dY somados ao CIP X, Y do modelo antes da rotação, a convenção do cookbook do SOFA; novo). As próprias escolhas de modelo (nutação 2000B no caminho TEME, a série complementar de dois termos) não são validadas, apenas sua implementação

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como liberados pelo projeto ERFA), uma biblioteca independente: pmat06; numat(obl06, nut00b) com a equação dos equinócios de eect00 (a série complementar completa), composta como P^T N^T Rz(-EE); xys06a e depois c2ixys(X + dX, Y + dY, s). Fixado antecipadamente em 979c1e39 (épocas, deslocamentos e limiares) antes de a referência independente ser executada. O resíduo TEME de { "1.1e-10" } rad é o efeito previsto de manter dois termos complementares (cerca de { "3" } mm em órbita GNSS)

# text
seg-4e2fe2e3dabb = UTC anterior a 1972 (era de taxa variável) no caminho de tempo de data juliana de duas partes

# text
seg-1d086e669f09 = UTC de 1960-01-01 a 1971-12-31, quando o UTC corria a uma taxa deslocada em relação ao TAI e dava saltos de frações de segundo, no caminho de data juliana de duas partes: TAI - UTC a partir da tabela de deriva de cada período (timescales::tai_minus_utc_on_date), a data do calendário UTC para uma data juliana UTC de duas partes com a duração do dia { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC para TAI com a fração do dia escalada de UTC para segundos SI (jd2::utc_to_tai) e TAI de volta para UTC (jd2::tai_to_utc), seguindo dtf2d, utctai e taiutc do SOFA. Antes de { "1960" }, TAI - UTC é tomado como { "0" } (valor do SOFA; UTC indefinido) e está fora da afirmação. O timescales::tai_minus_utc de f64 único ainda satura em { "10" } s antes de { "1972" } e não é coberto

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como liberados pelo projeto ERFA), uma biblioteca independente: erfa.dtf2d("UTC"), erfa.utctai e erfa.taiutc sobre os instantes versionados, a diferença formada parte a parte. Fixado antecipadamente em 23c40661 (instantes, tolerância e a soma de verificação de { "1972" }+) antes da mudança no motor e antes de a referência independente ser executada. A tabela de deriva é transcrita da mesma tabela iauDat do SOFA que a referência usa, de modo que a comparação cobre a aritmética de conversão (duração do dia, escala UTC para SI, iteração), não a tabela histórica em si

# text
seg-efacec095051 = Relógio de satélite GLONASS por transmissão e propagação da órbita de transmissão

# text
seg-821b9c01b56e = O viés do relógio de satélite GLONASS por transmissão -tau_n + gamma_n (t - t_b) em um instante lido no relógio do satélite (glonass::GlonassEphemeris::sv_clock_bias_s, o deslocamento corrigido do viés de relógio por duas iterações de ponto fixo), e a posição fixa à Terra PZ-90 do vetor de estado transmitido, propagado por RK4 pelas equações de movimento do ICD do GLONASS dentro de +/-15 min da época de referência (GlonassEphemeris::position_ecef), a partir de registros de navegação GLONASS RINEX { "3" } reais. Nenhuma transformação de PZ-90.11 para ITRF é aplicada (concordam no nível de centímetros desde { "2014" }; o RTKLIB também não aplica nenhuma). Não ligado a nenhuma saída de cenário: função de biblioteca

# text
seg-4478a2518341 = geph2clk e geph2pos do RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa), compilados a partir do código-fonte em C em um arquivo de teste separado (xval/rtklib-glonass) que lê o mesmo arquivo RINEX com o leitor próprio do RTKLIB, de modo que a leitura, o sinal de -tau_n, as unidades e a iteração são comparados, além do relógio e da órbita. Fixado antecipadamente em e099c42a antes de a função existir e antes de o arquivo de teste ser construído. Ambos os lados avaliam a mesma forma fechada do relógio, de modo que a comparação do relógio cobre a implementação, não a fórmula. Os integradores de órbita diferem (o RTKLIB avança { "60" } s e depois o restante, o Kshana em passos iguais de no máximo { "60" } s) e as constantes também (RTKLIB mu { "3.9860044e14" }, Kshana o PZ-90.11 { "3.986004418e14" }); o pior caso de { "1.1" } mm é essa diferença, como previsto antes da execução. Escopo: as efemérides de transmissão dentro de seu intervalo de validade, não a órbita ou o relógio verdadeiros (sem comparação com produtos precisos)

# text
seg-d3b72a6fbb18 = Um caminho de órbita terrestre: conjuntos de elementos SGP4 para o GCRS e o ITRS na cadeia IAU 2006/2000A com parâmetros de orientação da Terra

# text
seg-e4eca7205b5e = O caminho de propagação e de referenciais que todo tipo de cenário de órbita terrestre roteado compartilha: um conjunto de elementos médios SGP4 com uma época UTC de duas partes (sgp4::MeanElementSet, lido de elementos de projeto de constelação por MeanElementSet::from_earth_fixed) propagado por SGP4/SDP4 até o TEME (sgp4::SgpOrbit), e as rotações TEME -> ITRS e GCRS -> ITRS da cadeia IAU 2006/2000A com UT1 - UTC e movimento polar (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, as formas sem parâmetros teme_to_itrs_matrix e gcrs_to_itrs_matrix). O TEME é o equador verdadeiro da data com o equinócio médio, alcançado a partir do GCRS pelo viés-precessão IAU { "2006" }, pela nutação IAU 2000B e pela equação dos equinócios

# text
seg-44f28276f859 = Etapa { "1" }: python-sgp4 { "2.24" } (licença MIT; o SGP4 em C++ de referência de D. Vallado, o código que produziu os vetores de verificação AIAA 2006-6753), WGS-72, modo melhorado. Etapa { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, as rotinas SOFA): c2t06a com TT de utctai/taitt e UT1 de utcut1, e para o TEME c2t06a . pnm06a^T . rz(-ee06a). Limiares fixados antes da execução (fixados antecipadamente em 72ea9eb0). Divulgado: a primeira execução falhou na etapa { "2" } em 2016-12-31T23:{ "59" }:{ "59.5" } por um segundo de rotação (UT1 tomado da data juliana quase-UTC em um dia com segundo intercalar); o motor foi corrigido (jd2::utc_to_ut1) e a segunda execução concorda com os limiares inalterados. Descartar o movimento polar ({ "46" } falhas) ou usar constantes WGS-84 no lugar das WGS-72 ({ "4432" } falhas) faz o teste falhar. Este projeto de três etapas substituiu uma comparação de ponta a ponta com o Orekit que falhou no SDP4 do Orekit com e = { "0" } e em seu TEME IERS { "1996" } (a constatação permanece fixada em tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

# text
seg-f650a11458b8 = Compromisso de projeto do código de ranging

# text
seg-071e552a7179 = Lóbulos laterais e limites de correlação cruzada de sequências m/Gold, comprimento↔ambiguidade

# text
seg-65b7902a2d8f = Correlação cruzada Gold do GPS C/A publicada (−{ "23.9" } dB); limite de Gold { "1967" }

# text
seg-5ec4c0730280 = Geometria GNSS / diluição de precisão (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria da linha de visada via Q=(HᵀH)⁻¹ com uma separação ENU local

# text
seg-cecd882ec4e4 = DOP do gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independente, coincidência a { "1e-6" } relativo

# text
seg-1a5623c81b48 = Erro de posição a partir da geometria: erro RMS = sigma_UERE x DOP para a solução de mínimos quadrados do motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry e check: uma simulação de Monte Carlo com semente (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da própria solução iterada de mínimos quadrados do motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) nas { "8" } geometrias de tests/fixtures/dop/dop_reference.csv, comparando as variâncias do erro leste, norte, vertical e do relógio, o RMS H/V/P, a correlação leste-norte, os erros médios e a fração dentro da elipse horizontal de { "95" } % com sigma^{ "2" } Q, em que Q é o fator de covariância do kernel orbit::dop (orbit::dop_cofactor, a mesma aritmética) sobre a mesma geometria

# text
seg-90f18c774d57 = Consistência interna em relação a uma forma fechada: sob o modelo gaussiano linear, a covariância de mínimos quadrados é sigma^{ "2" } (H^T H)^-1 (Kaplan e Hegarty (eds.), Understanding GPS: Principles and Applications, 2ª ed., Artech House, { "2006" }, cap. { "7" }). Método e tolerâncias da nota de projeto de geometria { "0.36" }, seção { "5.2" }, fixados em um commit de pré-registro antes da primeira execução: cada variância dentro de { "5" } % ({ "5" } erros-padrão de uma variância amostral com N = { "20,000" }), cada RMS dentro de { "2.5" } %, a correlação leste-norte dentro de { "0.035" } (5/sqrt(N)), cada média dentro de { "5" } erros-padrão, a fração da elipse de { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } erros-padrão binomiais); controles negativos (PDOP dobrado; erros crescendo como 1/sin(elevação) contra o Q não ponderado) devem falhar. COMO SE COMPÕE: Q é o fator de covariância do kernel orbit::dop, VALIDATED em relação ao gnss_lib_py { "1.0.4" } nestas mesmas { "8" } geometrias em tests/dop_reference.rs (linha 'Geometria GNSS / diluição de precisão'); esta linha acrescenta o passo desses fatores até metros pelo solucionador do motor e não toma emprestado o status daquela linha. POR QUE MODELLED: nenhum conjunto de dados externo está envolvido; a concordância mostra que o estimador e o ruído realizam sigma x DOP sob o modelo de livro-texto, não que o erro de qualquer receptor seja igual a UERE x DOP, e sigma_UERE é uma entrada

# text
seg-9acfde1b57f7 = Classificação de confiança sensível à geometria: geometria de satélites ao lado da pontuação de confiança do receptor e uma classe em cada dedução

# text
seg-6138c41e13ff = receiver_trust::geometry: geometria de satélites por época (boa, degradada com os motivos few-satellites/high-pdop/high-hdop/sky-blocked, ou desconhecida quando o registro não traz GSV, NAV-SAT nem GSA) derivada das elevações e azimutes informados por orbit::dop ou tomada do GSA, com um rótulo sempre informado e nunca pontuado (good, fair, poor, unknown) e o HDOP, o PDOP, o VDOP, a contagem de satélites e a perda de sinal em palavras; um monitor de geometria da pontuação da embarcação que não deduz nada a menos que a geometria seja ruim (razão max(hdop/4, pdop/6, 5/n_used) acima de { "1" }), depois cresce em rampa até um teto de { "15" } pontos em { "1.5" } que a geometria sozinha não pode levar abaixo da faixa degradada (teto, fim da rampa e piso em [geometry]; sem alarme); uma classe em cada dedução (geometry, environment, inconsistency), com perda de travamento em satélites abaixo de { "15" } graus classificada como geometry, satélites à vista mas não rastreados classificados como environment, e uma dedução de geometria ruim cujo HDOP declarado esteja além de max({ "1.0" }, { "25" } % do HDOP derivado) do céu declarado classificada como inconsistency

# text
seg-6987737c5fe4 = Consistência interna: a classificação é conferida com as regras que ela declara e com razões derivadas à mão em edições sintéticas do registro de demonstração versionado, e os pontos de verificação de ausência de mudança mantêm as saídas da { "0.35.0" }: nenhuma pontuação muda a menos que a geometria seja ruim; o rótulo é sempre informado. POR QUE MODELLED: os limiares são escolhidos, não ajustados (procedência no geometry_model de cada execução; os números da IEC 61108-1 e do GPS SPS tal como citados, a serem conferidos com o texto das normas), e não há conjunto de dados externo rotulado de degradação natural da geometria contra ataques com o qual validar a classificação. O DOP derivado reutiliza o kernel orbit::dop, VALIDATED em relação ao gnss_lib_py, cujo status esta linha não toma emprestado. Uma classe de geometria é uma afirmação sobre o céu, não uma constatação de que nenhum ataque ocorreu

# text
seg-540420863a5a = Modelo de ionosfera de transmissão (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Atraso de grupo ionosférico oblíquo de L1 monofrequência de Klobuchar a partir dos oito coeficientes α/β transmitidos

# text
seg-0b0b02e8b0b8 = ionmodel do RTKLIB (tomojitakasu/RTKLIB, src/rtkcmn.c) — implementação de referência independente compilada a partir do código-fonte; coincidência a < { "1e-4" } m

# text
seg-0af6b1a073ce = Kernel estatístico de integridade RAIM/ARAIM (leis χ² / χ² não central / normal)

# text
seg-224a6c4200cd = O núcleo distribucional em que todo nível de proteção se apoia: o limiar de detecção de falha instantâneo χ²₁₋ₚfₐ(dof), a não centralidade de detecção perdida pbias=√λ e os multiplicadores de separação de soluções K_fa/K_md/K_V

# text
seg-03578217425f = Nível de proteção SBAS (HPL/VPL de mínimos quadrados ponderados do DO-229E)

# text
seg-df640d6c7a5d = Níveis de proteção de mínimos quadrados ponderados do Apêndice J do DO-229E: D=(GᵀWG)⁻¹ a partir da elevação/azimute por satélite e do orçamento de erro, eixo maior da elipse de erro horizontal e σ vertical, escalados pelos fatores K publicados

# text
seg-39aed7b4bffd = Fork SBAS-PL do RTKLIB — waasprotlevels() de zsiki/rtklib_ws (Siki & Takács { "2017" }, "DO-229D Appendix J"), executado por rnx2rtkp -ws sobre mensagens reais do EGNOS GEO-PRN120 + RINEX real de BUTE/Budapeste; implementação de terceiros independente, HPL com coincidência a < { "2e-3" } m. O gLAB { "v6.0.0" } (core/filter.c) confirmou convenção idêntica. Ambas as referências independentes arredondam K_V→{ "5.33" } contra o Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } exato do Kshana (~{ "0.06" }%), de modo que o vertical é verificado como o d_U livre do fator K

# text
seg-8f32eb9c8167 = Métricas de avaliação de detectores de ML (ROC/AUC/confusão/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, empates ½), matriz de confusão no limiar, P_d/P_md/P_fa/precisão/acurácia/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — biblioteca independente, coincidência exata

# text
seg-e7af87ce5e72 = Pontuação de detecção de anomalias em telemetria real de espaçonave

# text
seg-9659b33fca5b = AUC ROC + IC por bootstrap separando anomalias reais rotuladas; detector transparente (reproduz os rótulos)

# text
seg-b4ed67ce7e7e = roc_auc_score do scikit-learn sobre a divisão de teste OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — telemetria real do OPS-SAT

# text
seg-5c3f1057c6cc = Kernels numéricos do trade quântico (NNLS / faixas χ² / Q de van-Loan)

# text
seg-f82113ccb30b = Ajuste NNLS de ADEV medida, faixas de consistência χ² de NEES/NIS e a covariância de ruído de processo discreto de van-Loan do relógio (deriva em holdover) — a espinha computacional do motor de trade

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exatos, χ² <{ "5e-4" } nos graus de liberdade operacionais. Apenas kernels — os números de desempenho de dispositivos continuam modelados (próxima linha)

# text
seg-6f3099e7562c = Campo geomagnético de referência (síntese IGRF-14)

# text
seg-e9534723cb34 = Síntese por harmônicos esféricos do campo principal IGRF-14 — componentes X/Y/Z/F, declinação e inclinação — alimentando a camada alt-PNT de anomalia magnética

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — a implementação de referência IGRF em Python puro do IAGA-VMOD, que traz os coeficientes oficiais IGRF14.shc (14ª geração do IAGA, Zenodo 10.5281/zenodo.14012302); uma base de código de terceiros independente que calcula o campo IGRF-14 unicamente definido, com coincidência sobre uma grade global

# text
seg-cb3fea409de7 = Estatísticas de detecção — AUC gaussiana e falha mínima detectável

# text
seg-ca677becb465 = AUC ROC binormal analítica = Φ(μ/(σ√{ "2" })) e a falha mínima detectável σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentam os detectores de falha quântica e de anomalia

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + roc_auc_score do scikit-learn (Pedregosa et al., JMLR { "2011" }), ambos BSD-3-Clause — bibliotecas independentes que calculam as mesmas quantidades de cauda gaussiana / AUC unicamente definidas, com coincidência até o piso de A&S-erf (~{ "7e-8" }). A vantagem quântico-versus-clássico construída sobre isso continua MODELLED

# text
seg-1ed12110fb74 = Kernel de estatísticas de ordem (Kendall-τ / Dirichlet / percentil)

# text
seg-0fb003404a5b = Kernels de correlação de postos e de reamostragem sob o estudo de instabilidade de decisão de resiliência: τ-b de Kendall, média de Dirichlet, ranqueamento por competição e intervalos de confiança por percentil

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — implementações independentes (τ por merge-sort) das estatísticas de ordem unicamente definidas, com coincidência a { "1e-12" }. O estudo de instabilidade de decisão construído sobre esses kernels continua MODELLED

# text
seg-fdd2ba203d5b = Kernel de derivação de prioridades MCDA (autovetor AHP / razão de consistência)

# text
seg-d01c155fbddf = Pesos de prioridade do Analytic Hierarchy Process = autovetor principal (de Perron) normalizado de uma matriz de comparação pareada recíproca por iteração de potência, com o Índice de Consistência / Razão de Consistência de Saaty e o limite de aceitação CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Tabela canônica de Índice Aleatório de Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) reproduzida exatamente + scipy.linalg.eig do SciPy/LAPACK (BSD-3-Clause) como solucionador de autovalores independente que calcula o mesmo autovetor/autovalor de Perron unicamente definido, com coincidência a <{ "1e-9" }. A camada de decisão de Pareto / sensibilidade / MAUT construída sobre este kernel continua MODELLED (os agregadores WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE são validados externamente em separado — ver as linhas abaixo)

# text
seg-73e933220afb = Kernels de agregação ponderada MCDA (WSM / WPM)

# text
seg-c436cdc991a2 = Weighted Sum Model (agregado aditivo normalizado por mín–máx + ranqueamento) e Weighted Product Model (agregado multiplicativo normalizado pela soma, com recíproco para custo) — os dois pontuadores de estudos de trade de agregação de valor

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — uma biblioteca MCDA de terceiros em Python, independente e amplamente usada, que calcula os mesmos agregados ponderados unicamente definidos; coincidência a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_wsm/ e tests/fixtures/mcda_wpm/. Garbage-in-garbage-out nas entradas; a camada de sensibilidade/robustez continua MODELLED

# text
seg-f00bdb66a052 = Ranqueamento MCDA por distância ao ideal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — normalização mín–máx, soluções ideais positiva/negativa ponderadas, proximidade relativa Cᵢ = d⁻/(d⁺+d⁻) e ranqueamento

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — uma biblioteca MCDA de terceiros independente que calcula os mesmos coeficientes de proximidade unicamente definidos; coincidência a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = Ranqueamento de compromisso MCDA (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — utilidade de grupo Sᵢ, arrependimento individual Rᵢ e o índice de compromisso Qᵢ com peso de estratégia v={ "0.5" }, com o ranqueamento em que menor é melhor

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — uma biblioteca MCDA de terceiros independente que calcula a mesma agregação S/R/Q normalizada por amplitude, unicamente definida; coincidência a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = Ranqueamento MCDA por fluxo líquido de superclassificação (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — índice de preferência par a par com as seis formas padrão de critério generalizado, fluxos de superclassificação positivo/negativo e o ranqueamento completo por fluxo líquido (critério usual validado)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — uma biblioteca MCDA de terceiros independente que calcula o mesmo fluxo líquido de superclassificação unicamente definido; coincidência a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_promethee/generate_promethee_reference.py. As formas de preferência com limiares (q/p/σ) reduzem-se à mesma álgebra de critério generalizado e continuam verificadas por propriedades

# text
seg-72248291c388 = Kernel de escolha por superclassificação MCDA (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — matrizes de concordância / discordância, a relação de dominância de concordância-e-não-veto e o kernel de escolha por superclassificação (convenção de todos os critérios de benefício, pesos normalizados pela soma, escala global única)

# text
seg-bd625ceb90cc = algorithm.electre_i do pyDecision (Valdecy Pereira) — uma biblioteca de decisão multicritério de terceiros independente que calcula a mesma concordância/discordância/dominância/kernel unicamente definidos; coincidência elemento a elemento a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_electre/generate_electre_reference.py. As escolhas de limiares ĉ/d̂ são entradas do analista (a sensibilidade continua MODELLED)

# text
seg-95942c6a2689 = Kernels de agregação MCDA (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (mistura convexa normalizada linearmente λ·WSM+({ "1" }−λ)·WPM com λ={ "0.5" }) e o sistema de razões MOORA (total de benefícios ponderado normalizado vetorialmente menos total de custos ponderado) — a mistura de valores com estabilidade reforçada e o pontuador de sistema de razões com sinal

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; sistema de razões methods.MOORA, normalização vetorial) — uma biblioteca MCDA de terceiros em Python, independente e amplamente usada, que calcula os mesmos agregados unicamente definidos; coincidência a <{ "1e-9" }. Regenerável offline por meio de tests/fixtures/mcda_waspas/ e tests/fixtures/mcda_moora/. Garbage-in-garbage-out nas entradas; a camada de sensibilidade/robustez continua MODELLED

# text
seg-7de67fedc1da = Ranqueamento proporcional MCDA (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — significância de benefício S⁺ normalizada pela soma das colunas mais o termo de significância de custo inverso, a significância relativa Q e o grau de utilidade U = Q/max Q (melhor alternativa = { "1" })

# text
seg-49aeef0b79e4 = algorithm.copras_method do pyDecision (Valdecy Pereira) — uma biblioteca MCDA de terceiros independente que calcula a mesma significância relativa/utilidade do COPRAS unicamente definida. O pyDecision é usado deliberadamente: o COPRAS do pymcdm { "1.4.0" } colapsa algebricamente para o trivial S⁺+S⁻ e não é uma referência fiel, enquanto o pyDecision implementa o Q canônico = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Coincidência a <{ "1e-9" }; regenerável offline por meio de tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = Latência de detecção de mudança e ARL do CUSUM

# text
seg-302f5db625df = Latência de detecção no pior caso do detector CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) e comprimento médio de execução fora de controle, usados pelo nível de proteção de temporização e pelos monitores de spoofing

# text
seg-691a506ce13f = ARL do CUSUM tabular publicado: aproximação de movimento browniano de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, eq. { "3.7" }) ancorada de forma cruzada nas tabelas de ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) para k=½, h∈{ "{" }{ "4,5" }{ "}" }; latência determinística coincidente exatamente com uma referência independente de primeira passagem. O limite TPL composto continua MODELLED

# text
seg-d923a77bd31a = Variância de deriva em holdover do relógio e inversão de limiar

# text
seg-4fafaf5f919d = Crescimento da variância do erro de fase em deriva q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 e sua inversão monótona para um limiar de holdover de erro de temporização

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm calculando o ruído de processo discreto de Van-Loan { "1978" } Q₀₀ = ∫₀ᵗ ΦQcΦᵀds por escalonamento e quadratura de Padé sobre a matriz aumentada { "6" }×{ "6" } — um caminho independente que nunca vê os coeficientes polinomiais do kshana; mais optimize.brentq invertendo a mesma curva monótona em comparação com a bisseção do kshana. Os números do piso de ruído vermelho por classe (ClockClass) continuam MODELLED

# text
seg-eb3cd9e92d8d = Kernel de diversidade de Simpson inversa

# text
seg-244d57819f2b = Diversidade arquitetural efetiva = número de Simpson inverso / de Hill de ordem 2, 1/Σpᵢ², sobre as qualidades das fontes por grupo de independência (o termo de diversidade na pontuação de resiliência)

# text
seg-17d84876c2f5 = skbio.diversity.alpha.inv_simpson do scikit-bio { "0.7.3" } (McDonald et al., BSD-3-Clause) — uma biblioteca de terceiros independente que calcula o índice de Simpson inverso unicamente definido; reproduzido byte a byte. O arcabouço de pontuação DHS-RPCF (pesos/níveis) construído sobre ele continua MODELLED

# text
seg-c14b8fe46517 = Máscara de horizonte dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: o azimute e a elevação geodésicos (WGS-84) de um satélite a partir de um local em solo, uma tabela de máscara de azimute/elevação interpolada linearmente em azimute com retorno em { "360" } graus, o conjunto visível el >= max(mask_deg, mask(az)), e o DOP de relógio comum e a matriz cofatora ENU-e-relógio desse conjunto (o kernel por trás de orbit::dop). É assim que a seção [skyline] decide a visibilidade nos tipos de cenário gnss-sim, jamming, leo-pvt, leo-pass e nmea-scenario e, com o local em solo user_site, em orbit e integrity

# text
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): um TopocentricFrame sobre um OneAxisEllipsoid WGS-84 para os ângulos de visada e um ElevationMask por tabela, executado por xval/orekit-skyline/OrekitSkyline.java sobre estados fixos à Terra versionados (a propagação não é comparada), com get_dop do gnss_lib_py { "1.0.4" } (metadados do wheel MIT) para o DOP e a matriz DOP ENU-e-relógio dos conjuntos que o Orekit considera visíveis. Fixado antecipadamente (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) antes de qualquer das duas referências independentes ser executada sobre as entradas da comparação; a interpolação linear com retorno do Orekit foi confirmada de antemão em uma sonda sintética. Escopo: máscaras em tabela, ângulos de visada geodésicos, o conjunto visível mascarado e seu DOP de relógio comum e cofator. NÃO verificado aqui: as reduções de cânion, setor e terreno e as predefinições (suas tabelas de 360 pontos entraram como entradas; linhas 'Reduções de cânion urbano, setor e terreno a uma tabela' e 'Predefinições de horizonte'), os estados de relógio por sistema e a elipse de erro (linha 'Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria'), a rotação GMST do local em solo user_site em orbit/integrity e sua datação de cada propagador em um único instante (o Orekit recebe estados fixos à Terra), e qualquer obstrução real (apenas linha de visada)

# text
seg-bbb1828b3db1 = Reduções de cânion urbano, setor e terreno a uma tabela

# text
seg-2864aec7be88 = skyline: o cânion urbano em forma fechada (corte atan((h - a) / d) com d = (w/2) / abs(sin(az - s)), extremidades abertas para um comprimento finito), setores de bordas nítidas em sentido horário com retorno, e pontos de terreno reduzidos a uma tabela com a queda por curvatura d^2/({ "2" } * 4/3 R); o horizonte é o máximo ponto a ponto entre eles e qualquer tabela

# text
seg-50f1df206b30 = Interno: as formas fechadas são conferidas com valores calculados à mão (elevações do topo das paredes de uma rua declarada, a condição de extremidade aberta, a queda por curvatura de um ponto declarado). Nenhuma referência independente externa: a nota de projeto classifica essas reduções como MODELLED, e o ElevationMask do Orekit recebe uma tabela, de modo que a comparação da linha 'Máscara de horizonte dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara' lê suas tabelas de 360 pontos como entradas e não as verifica

# text
seg-3f3d657854ce = Predefinições de horizonte (rua urbana, aproximação portuária, fiorde, terminal de contêineres)

# text
seg-44ae9b6289d9 = Nenhuma: dimensões escolhidas e declaradas, não um levantamento de qualquer rua, porto, fiorde ou terminal (a razão de aspecto da rua está dentro da faixa de 0.5-2 de Oke ({ "1988" }); o fiorde é da ordem dos fiordes do oeste da Noruega; as pilhas usam a altura high-cube da ISO { "668" }). O teste confere as predefinições com suas próprias dimensões declaradas, uma verificação de transcrição, que a regra de validação não conta

# text
seg-2c53381d48ae = Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria

# text
seg-15fea5c05cbd = geometry::sky_geometry: o cofator ENU-e-relógio (H^T H)^-1 com um relógio de receptor comum ou um por sistema (o kernel orbit::cofactor_from_los), e a elipse de erro horizontal a partir de seu bloco leste-norte (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), o azimute do eixo maior a partir do norte)

# text
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv de G^T G e numpy.linalg.eigh de seu bloco horizontal sobre as entradas versionadas, uma biblioteca numérica independente que realiza a inversa e a decomposição em autovalores por seus próprios algoritmos (padrão P2). Fixado antecipadamente em xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) antes da execução; a formatação de saída do driver foi corrigida uma vez após o pré-registro (um escalar numpy escrito como np.float64(...)), sem alteração do protocolo nem das tolerâncias. A afirmação validada é a álgebra linear sobre essas entradas; o modelo de erro gaussiano e o UERE são entradas declaradas, não uma acurácia medida nem um limite de integridade

# text
seg-6012113b4836 = Funções de geometria do céu: visibilidade, DOP, covariância, elipse de erro, nuvem de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> e <c2/>, funções Python e WASM de mesmos nomes, MCP <c3/>): a partir de um local, um instante e predefinições de constelação (ou satélites como azimute/elevação ou ECEF), os satélites visíveis e mascarados sob um horizonte, GDOP/PDOP/HDOP/VDOP/TDOP, o cofator de variância unitária (H^T H)^-1 e a covariância em leste-norte-cima com um relógio de receptor por sistema ou um comum, a elipse de erro horizontal (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientação { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) a partir do norte) e n erros de mínimos quadrados com semente sob erros de distância gaussianos independentes, com sua covariância empírica, RMS e contenção de { "95" } %. O cofator é orbit::cofactor_from_los, o único kernel por trás de orbit::dop e orbit::dop_cov (dop é a redução de dop_cov): nenhuma segunda implementação de DOP

# text
seg-aa0da1028636 = Os fatores de DOP de relógio único se apoiam no kernel validado em relação ao gnss_lib_py { "1.0.4" } (linha 'Geometria GNSS / diluição de precisão (DOP)'); as verificações desta linha são internas: sky_geometry reproduz orbit::dop e dop_cov sobre a mesma geometria, a elipse reproduz uma decomposição analítica em autovalores 2x2, as entradas ECEF e azimute/elevação concordam, e o RMS e a contenção de { "95" } % da nuvem com semente concordam com a geometria. A covariância ENU com um relógio por sistema e a elipse são VALIDATED na linha 'Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria' (numpy, P2); o que continua MODELLED aqui é a composição: a propagação das predefinições até um céu representativo, a nuvem de Monte Carlo (conferida com a geometria que amostra, uma verificação de autoconsistência) e as superfícies. As predefinições de constelação dão um céu representativo, não um datado; o modelo de erro gaussiano e o UERE são entradas declaradas, não uma acurácia medida nem um limite de integridade

# text
seg-7f66be0f15c8 = Holdover do relógio sem GNSS

# text
seg-4d8f87668a0f = Crescimento do erro em deriva em forma fechada + holdover até o limiar; classes de relógio quântico

# text
seg-2d260626e3d2 = Recursão multietapas de covariância de clock_state (verificação cruzada na mesma base de código); o kernel subjacente de variância em deriva e inversão de holdover é validado externamente em relação ao scipy (ver 'Variância de deriva em holdover do relógio e inversão de limiar'). Os números de holdover do piso de ruído vermelho por classe continuam MODELLED

# text
seg-29b482d88916 = Cartões de dispositivo de relógio medidos (previsão com dados reservados)

# text
seg-8c68c5b25004 = clock_library: um cartão de dispositivo (ruído branco de fase, FM branco, de cintilação e de passeio aleatório mais uma deriva linear de frequência) ajustado a um terço de um registro de relógio medido nomeado após uma passagem de condicionamento registrada (lacunas, valores atípicos de fase, saltos de fase e rajadas removidos; saltos de frequência registrados), ponderado pelos graus de liberdade dos tipos de ruído identificados por lag-1, e seu desvio de Allan previsto avaliado sobre os dois terços reservados; leitores de arquivos de relógio RINEX e IGS, arquivos por laboratório do BIPM e da Seção { "1" } da Circular T; conversão de um cartão para o modelo de ruído de temporização de slots, o modelo de relógio de filtro de Kalman estendido e os níveis de ruído do monitor de spoofing

# text
seg-af2d78e2986c = Registros medidos, reservados: relógios combinados finais de { "30" } s do IGS dos { "11" } satélites GPS Bloco IIF de 2026-03-01 a { "14" } (uma janela que nenhum teste havia aberto; IGS, aberto com atribuição) e o receptor u-blox ZED-F9P do JammerTest { "2024" } em suas sessões estacionárias não pontuadas (GPL-3.0-or-later). Comparação externa D9 (fixada antecipadamente em 2ec76864, o desvio de Allan previsto / medido de cada cartão dentro de [1/1.5, { "1.5" }] em seus tempos de média ajustados), uma constatação (continua MODELLED): { "10" } de { "11" } cartões GPS IIF estão dentro do limiar; o G27 é otimista na escala de duas horas ({ "0.662" } em { "7680" } s, pior fator { "1.510" }), o erro periódico na escala de horas que um cartão de lei de potência não traz. O cartão do TCXO do receptor está bloqueado: fora das transmissões registradas, as outras sessões do conjunto de dados deixam { "167" } épocas contra as { "3600" } exigidas. Informado, não cego (registros abertos por linhas anteriores): o cartão do césio 5071A está dentro do limiar (pior { "1.070" } até { "4096" } s), o cartão do OCXO é conservador e está fora dele ({ "2.348" } em { "128" } s; seu piso de ruído muda durante o registro), e o cartão do estrôncio de Norcia, ajustado nos três pontos publicados mais curtos, está dentro dele nos dois pontos pontuados ({ "1.291" }, { "1.405" }). Os masers de hidrogênio passivos do Galileo (nenhuma fonte sem login de relógios finais do Galileo alcançável) e o Deep Space Atomic Clock (um único valor aberto no espaço) estão bloqueados. D9 rodada { "2" }, o TCXO do receptor ZED-F9P como classe de modelo em { "14" } dias de { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; fixada antecipadamente em fb475550), uma constatação: com o pipeline registrado, { "11" } de { "12" } estações não puderam ser avaliadas (o RAIM rejeitou a maioria das épocas livres de ionosfera) e a BX14 falhou; uma nova execução divulgada com um pipeline corrigido (fixada antecipadamente em c9cc0d49) passa em { "1" } de { "11" } estações cegas (BX12, { "1.412" }; BX07 { "1.532" } e BX13 { "1.542" } logo fora), porque relógios de receptor de posicionamento pontual obtidos de arquivos intermitentes de { "30" } s não são um registro limpo de oscilador

# text
seg-5097a0e6460d = Cartões de relógio medidos de GPS Bloco IIF com termos por revolução (previsão com dados reservados)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: um cartão de dispositivo que traz os termos de fase de uma a quatro por revolução (período T/k, T = { "43 082.05" } s), ajustados conjuntamente com a quadrática por mínimos quadrados sobre um terço de um registro medido de relógio de satélite, com a contribuição de Allan em forma fechada de cada termo { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } no desvio de Allan previsto

# text
seg-83981cd13a17 = Registros medidos, reservados: relógios combinados finais de { "30" } s do IGS dos { "11" } satélites GPS Bloco IIF de 2026-04-01 a { "14" } (uma janela que nenhum teste havia aberto; IGS, aberto com atribuição). Comparação externa D9 (fixada antecipadamente em fb475550, desvio de Allan previsto / medido dentro de [1/1.5, { "1.5" }] em cada tempo de média ajustado em cada satélite), uma constatação (continua MODELLED): { "9" } de { "11" } cartões estão dentro do limiar; o G03 ({ "1.947" }) e o G25 ({ "1.581" }) são otimistas entre { "60" } s e { "2000" } s porque seus registros reservados são mais ruidosos que seus terços de ajuste (a parte reservada do G25 traz { "16" } lacunas e { "29" } valores atípicos de fase), uma mudança do relógio e não a falta de um termo periódico. Retirar os termos periódicos da previsão faz falhar todos os { "11" } cartões ({ "1.77" } a { "4.96" }), de modo que os termos sustentam a previsão

# text
seg-0d72fcc0fbea = Estimação do estado do relógio de bordo

# text
seg-6db5391f8ebe = Relógio de Kalman de 3 estados (fase/frequência/deriva) de Van-Loan, estabilizado por Joseph

# text
seg-f41b4c81df2a = KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van-Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, portanto isto continua MODELLED. Comparação externa { "0.30" }, uma constatação (continua MODELLED): em relógios finais de { "30" } s do IGS de { "11" } satélites GPS Bloco IIF (2025-08-17 a { "30" }), com Q ajustado à ADEV da primeira metade e o filtro avaliado sobre a segunda metade reservada, o filtro é consistente um passo à frente ({ "0.906" } a { "0.971" } das épocas dentro de sua faixa de { "95" } %, limiar { "90" } %) mas excessivamente confiante em uma hora em { "9" } de { "11" } relógios ({ "0.486" } a { "0.829" }) e suas somas de inovação ficam fora de [{ "2.4" }, { "3.6" }] em { "5" }. O ruído branco de fase ajustado é zero em todos os satélites, e o erro na escala de horas (termos periódicos, FM de cintilação) não está no modelo de 3 estados. { "0.30" } rodada { "2" }, um filtro estendido (FM de cintilação e estados de uma e duas por revolução) sobre novos relógios reservados do IGS de 2025-09-01 a { "14" } (fixada antecipadamente em 4b1a841e), uma constatação (continua MODELLED): os critérios de consistência de um passo e de uma hora se mantêm em todos os { "11" } satélites ({ "0.948" } a { "0.988" } e { "0.907" } a { "0.996" }), mas o critério da soma de inovação falha no G24 ({ "0.964" }) e no G30 ({ "1.929" }) em relação a [{ "2.4" }, { "3.6" }]. D9 rodada { "3" }, o filtro estendido da rodada 2, com ajuste e critérios inalterados após o detector de condicionamento congelado do clock_library, sobre novos relógios do IGS de 2026-04-01 a { "14" } (fixada antecipadamente em fb475550), uma constatação (continua MODELLED): (a) um passo { "0.941" } a { "0.968" } e (c) média de NIS triplo { "2.641" } a { "3.549" } se mantêm em todos os { "11" } satélites; (b) uma hora falha no G09 ({ "0.894" }) e no G26 ({ "0.876" }) em relação a { "0.90" }

# text
seg-3f0a9d7c2971 = Orçamento de erro da transferência de tempo

# text
seg-216f46b43860 = Bidirecional/TWSTFT (Sagnac), visada comum GNSS, PPP; jitter do enlace→distância

# text
seg-e7b6aac2ec58 = Magnitude do Sagnac conferida com um VALOR PUBLICADO de referência reconhecida — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pelo geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O orçamento composto de transponder/visada comum/PPP do TWSTFT do BIPM não tem referência independente externa, de modo que a capacidade continua modelada

# text
seg-157fadeb5d67 = Modulação de sinal de navegação e análise de rastreamento de código

# text
seg-ab633d191396 = PSD de BPSK-R/BOC, separação espectral κ, largura de banda de Gabor, jitter do DLL, multicaminho

# text
seg-94f0c4fc2930 = Correlação cruzada/autocorrelação Gold do GPS C/A coincidente EXATAMENTE (inteiros ±65/−1/63) com a geração independente de códigos do IS-GPS-200; forma da PSD de BPSK-R({ "1" })/BOC({ "1,1" }) em relação a um periodograma scipy independente. As formas fechadas de modulação/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) permanecem analíticas, de modo que a linha continua MODELLED — mas a subafirmação de correlação de código é coincidente externamente. { "0.30" } rodada { "2" }, em relação aos valores impressos de Betz { "2001" } e Hein et al. { "2006" } (fixada antecipadamente em 9f4f2ce8, meia unidade impressa), uma constatação (continua MODELLED): todas as { "45" } células espectrais da Tabela { "1" }, os valores de correlação de { "1" } GHz, os números de interferência do MBOC e { "2" } dos { "3" } deslocamentos da Fig. { "17" } concordam; os primeiros lóbulos laterais de { "24" } MHz, o deslocamento do BOC({ "8,4" }) da Fig. { "17" } e todo viés de multicaminho no pior caso das Figs. 18-21 ({ "11" } a { "15" } % baixo) não concordam. O Kshana e uma avaliação NumPy independente da leitura fixada antecipadamente concordam, de modo que a diferença está nessa leitura ou em um detalhe não declarado do artigo; causa não resolvida

# text
seg-589e0053e3e8 = Geração do código de espalhamento GPS L1 C/A

# text
seg-782d4da75b59 = Gerador de código C/A por LFSR G1/G2 que reproduz os vetores octais de verificação publicados dos primeiros 10 chips do IS-GPS-200 para PRN { "1" }–{ "9" } (mais comprimento de 1023 chips, equilíbrio de 512 uns, autocorrelação periódica de três valores)

# text
seg-473f24d4e06a = IS-GPS-200 Tabela 3-Ia 'Code Phase Assignments' — os vetores octais de verificação dos primeiros 10 chips publicados e oficiais, de domínio público do governo dos EUA (GPS Directorate, navcen.uscg.gov); o próprio LFSR G1/G2 do kshana regenera exatamente todos os vetores de PRN { "1" }–{ "9" }. As formas fechadas de modulação/SSC/DLL a jusante continuam modeladas (linha separada)

# text
seg-e6c08e1e6ae3 = Desempenho de sensores inerciais quânticos

# text
seg-d28e1f6a430f = Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN)

# text
seg-57fd0a6e5d72 = Vetores numéricos publicados de artigos primários de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincidente exatamente, ASD de ruído de disparo um piso unilateral dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais trazem ruído técnico acima do piso quântico). Uma faixa, não uma paridade. { "0.30" } rodada { "2" } (fixada antecipadamente em fcb9ac64), uma constatação (continua MODELLED): o ruído de rotação somente de QPN em relação aos pontos medidos da Fig. { "14" } de Gauguet et al. { "2009" } dá razões de { "0.695" } a { "0.788" } nos três pontos admitidos ({ "0.751" } no ponto de operação), faltando { "0.5" } ponto para o limiar fixado antecipadamente de { "30" } %; o piso de QPN fica { "21" } a { "31" } % abaixo do ruído medido, como esperado de um modelo sem ruído de laser e de detecção. A composição do gradiômetro coincide com a linha do modelo QPN de Janvier et al. { "2022" } (razão { "1.013" } a { "1.017" }, referência). O teste medido não consegue discriminar um erro de composição de sqrt({ "2" }); apenas a linha de Janvier de contraste desigual consegue

# text
seg-4b79d03cecf5 = Ambiguidade de franja / faixa dinâmica de sensor inercial quântico

# text
seg-deb2850546d5 = Faixa dinâmica de ambiguidade de franja de Mach–Zehnder: a leitura de franja periódica em 2π fixa uma força específica máxima não ambígua a_max=π/(k_eff·T²), e a faixa não ambígua em células de resolução a_max/σ_a=π/σ_Φ é independente do fator de escala óptico — o ganho de sensibilidade em T² custa faixa não ambígua em exata proporção (o tempo de interrogação troca resolução por faixa, deixando o número de células fixado pelo ruído de fase da leitura)

# text
seg-7603ff7a7693 = Autoconsistência do modelo de franja do interferômetro: a borda de meia franja, a estrutura de aliasing periódica em 2π e o cancelamento do fator de escala na razão faixa/resolução são identidades algébricas em forma fechada conferidas com as próprias funções de fase e sensibilidade de Mach–Zehnder do motor — verificações de consistência interna, NÃO um conjunto de dados externo, de modo que a linha continua InternalConsistency. Ambiguidade de franja de três pulsos ideal MODELLED; sem limites de aberração de frente de onda ou perda de contraste sobre a faixa não ambígua

# text
seg-d04bf321d4a1 = Resiliência de navegação inercial quântica por estima

# text
seg-c4989abb5d40 = Orçamento composto de posição com viés + fator de escala + VRW + decaimento de estabilidade em holdover

# text
seg-bfe4085115c1 = Integração SDE de Monte Carlo independente em numpy do ruído de aceleração branca duplamente integrado (valida a variância analítica de VRW por um algoritmo genuinamente independente) + uma âncora de valor publicado de Groves { "2013" } para os termos de viés/fator de escala; os números do dispositivo CAI quantificam hardware do parceiro e continuam MODELLED

# text
seg-bc6e733c39b3 = Fusão de sensores GNSS/INS

# text
seg-16514286bb51 = EKF de estado de erro de 15 estados, fracamente acoplado (validado em um percurso real de IMU/GNSS em relação ao NaveGo); um UKF fortemente acoplado de pseudodistância/Doppler e um filtro acoplado de relógio+posição (apenas consistência, fora da afirmação validada)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, executado como ferramenta no GNU Octave, nunca ligado): seu ins_gnss fracamente acoplado sobre seu próprio percurso real de veículo terrestre com IMU/GNSS Ekinox, ambas as soluções avaliadas contra a trajetória de referência do Ekinox. Ambos os filtros leem a mesma entrada float32 de { "20" } Hz, e a configuração do Kshana é mapeada mecanicamente a partir dos parâmetros publicados do conjunto de dados. O RMS de posição horizontal e vertical do Kshana e seu RMS de inovação de posição estão dentro de 1.2x os do NaveGo (medido { "0.912" }, { "0.940" } e { "0.861" }) e sua inovação normalizada média é no máximo { "1.5" } (medido { "0.395" }: cerca de 2.5x sub-confiante, dados os sigmas de GNSS declarados do conjunto de dados); tolerâncias fixadas antes da comparação. Escopo: o GNSS está presente a { "5" } Hz durante todo o percurso, de modo que nenhuma interrupção ou deriva é testada e a verificação detecta defeitos grosseiros do filtro e não ajuste fino (soluções brutas corrigidas pelo braço de alavanca ficariam perto do limiar vertical); a transformação do braço de alavanca é calculada no arcabouço de teste. O UKF fortemente acoplado e o filtro acoplado de relógio+posição mantêm suas verificações de consistência do filterpy { "1.4.5" } (posteriores lineares a { "2.4e-12" }) e continuam fora da afirmação validada

# text
seg-5692c7b936b6 = Resiliência a jamming sem GNSS

# text
seg-f4ff77caa47b = Orçamento de enlace J/S geométrico, C/N₀ anti-jam, perda de travamento por satélite

# text
seg-daf317735edb = Equação do orçamento de enlace de C/N₀ anti-jam conferida com uma rederivação independente em numpy (compartilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. { "0.30" } rodada { "2" }, bloqueada (continua MODELLED): a queda de C/N0 medida do JammerTest { "2024" } em relação a uma previsão do orçamento de enlace (fixada antecipadamente em 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e a orientação da antena F8.1 em Bleik e a parcela de L1 da potência da rampa multibanda { "1.6.4" } não estão documentadas no catálogo de testes nem no registro oficial

# text
seg-ff90679d1de9 = Detecção de spoofing

# text
seg-b843f63e77e6 = χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos em uma figura de mérito de segurança por época

# text
seg-baeb1c3db11f = Parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, uma constatação (continua MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0), os monitores de nível de observável (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não emitiram nenhum alarme em até { "10" } s de qualquer um dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o início do slot publicado), e três janelas anteriores ao início trouxeram alarmes falsos do monitor de relógio ({ "81" }, { "64" } e { "173" } épocas). O primeiro efeito observável foi uma perda de rastreamento GPS de dupla frequência, não uma inconsistência do RAIM. Os inícios publicados são inícios de slots de cronograma com resolução de minuto; que eles precedam a captura de RF é uma interpretação, não uma medição. { "0.30" } rodada { "2" }, em relação ao registro oficial dos organizadores do JammerTest { "2024" } (resolução de segundo; fixada antecipadamente em 6a66994b com um monitor de relógio de três estados calibrado por Hadamard, sem travamento), uma constatação (continua MODELLED): o monitor alarma em até { "10" } s em { "4" } de { "10" } inícios registrados; nos outros seis ele atrasa de { "18" } a { "211" } s ou emite alarmes falsos de relógio antes do início ({ "1" } em { "2.1.4" }, { "85" } em { "2.3.15" }). D9 rodada { "3" } (um cartão de receptor das outras sessões da unidade do JammerTest, fixada antecipadamente em 2ec76864) bloqueada: { "167" } épocas de treinamento contra { "3600" }. D9 rodadas { "4" } e 4b (níveis de ruído de um cartão de classe de modelo u-blox ZED-F9P, Wroclaw { "2021" }, fixadas antecipadamente em fb475550; 4b uma nova execução divulgada com uma extração corrigida, c9cc0d49), uma constatação (continua MODELLED): zero alarmes falsos antes do início em todos os { "10" } inícios registrados e { "6" } de { "10" } em até { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } e { "2.6.1" } continuam atrasados (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), inalterados pelo nível de ruído do relógio

# text
seg-b10d07921f5e = Nível de proteção de temporização sob spoofing

# text
seg-2a829711b997 = Limite em forma fechada do erro de tempo não detectado no pior caso = piso do monitor + σ de deriva do oscilador sobre a latência de detecção do CUSUM, informado como uma faixa de piso de ruído vermelho

# text
seg-682251b2e3c7 = Compõe primitivas validadas (allan/holdover de van-Loan, piso de segurança); calibrado no cenário { "2.1.1" } do JammerTest { "2024" } (~{ "1.01" } ms de arrasto real do tempo servido contra ≤{ "51" } ns declarados). Ponte sobre partes validadas — não é, em si, uma validação externa. Comparação externa { "0.30" }, uma constatação (continua MODELLED): nos cenários de spoofing do JammerTest { "2024" }, o erro de tempo servido não detectado medido excede o TPL nominal em { "3" } de { "8" } inícios detectados: { "184.3" } contra { "34.6" } ns ({ "2.1.4" }), { "295.7" } contra { "159.3" } ns ({ "2.3.5" }) e { "143.0" } contra { "69.0" } ns ({ "2.3.11" }); três dos cinco dentro do limite são triviais (um alarme falso travado antes do início). Causa provável: o termo de deriva de uma calibração de { "60" } s com ruído de deriva zero não cobre a oscilação de frequência do TCXO do receptor ao longo de { "15" } a { "39" } s. O erro medido é a própria estimativa de relógio de ponto único do Kshana contra uma reta ajustada às suas próprias estimativas anteriores ao início, de modo que mesmo a concordância não teria sido totalmente independente. { "0.30" } rodada { "2" }, em relação aos inícios do registro oficial do JammerTest { "2024" } e ao erro de tempo do receptor medido (fixada antecipadamente em 6a66994b), uma constatação (continua MODELLED): em { "4" } de { "10" } inícios registrados, o erro não detectado excede o TPL de estado de deriva ({ "634.7" } contra { "458.5" } ns em { "2.1.1" }, { "232.6" } contra { "16.2" } ns em { "2.3.5" }, { "41.3" } contra { "6.0" } ns em { "2.3.10" }, { "218.6" } contra { "47.4" } ns em { "2.6.3" })

# text
seg-0ec37553bbc4 = Análise de missões cislunares

# text
seg-a47465f682ba = STM do CR3BP + corretor diferencial de tiro simples; NRHO L2 sul

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; família de halo sul L2 Terra–Lua, metodologia de Howell/Davis) — período T, Jacobi C e condições iniciais de cruzamento perpendicular publicados externamente; o corretor STM de tiro simples do kshana, semeado com a CI do catálogo e perturbado, converge de volta para os membros do catálogo

# text
seg-f1d49eac89f8 = PNT alternativo / complementar

# text
seg-023dda973f66 = Correspondência com mapa gravitacional, referenciado ao terreno (TERCOM/SITAN), anomalia magnética

# text
seg-da869d48e505 = Coeficientes IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade com campo real é verificado externamente (linha 'Síntese de anomalia gravitacional a partir de um modelo de harmônicos esféricos'), mas seu resultado de navegação não tem referência independente externa

# text
seg-db7767ab661d = Síntese de anomalia gravitacional a partir de um modelo de harmônicos esféricos

# text
seg-2db367c4a473 = Anomalia gravitacional em aproximação esférica (Barthelmes STR09/02 eq. { "126" }, gravity_anomaly_sa do ICGEM) a partir de coeficientes totalmente normalizados contra um elipsoide de nível em forma fechada (WGS84/GRS80), com o termo de grau zero, em grade para o correspondente de mapa gravitacional

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), uma implementação independente: EGM2008 truncado no grau { "70" }, gravity_anomaly_sa, WGS84, livre de maré, termo de grau zero, h = { "0" }. A saída do serviço não traz licença explícita, de modo que as grades são obtidas no momento do teste com SHA-256 fixado (tools/fetch_icgem_grid.sh) e apenas dez valores são citados com atribuição

# text
seg-31f51d4998cb = Leitor de modelo digital de elevação SRTM sobre terreno real

# text
seg-08ea4ae0b671 = Analisador .hgt do SRTM escrito à mão (16 bits big-endian, primeira linha ao norte, ciente de vazios) + amostrador bilinear que lê um tile real de DEM de domínio público e resolve um marco de levantamento documentado

# text
seg-791e7285c291 = Reprodutibilidade e garantia de software

# text
seg-7177355a482c = Determinístico, com hash de cenário, SBOM + portões golden multiplataforma

# text
seg-6cf9d570cc51 = Aderência à norma do SBOM ao JSON Schema oficial CycloneDX { "1.5" } (+ identificadores SPDX válidos) — um padrão externo publicado, zero erros de validação sobre todo o grafo de dependências; a parte de determinismo da FoM / reprodutibilidade byte a byte continua uma verificação de autoconsistência fixada, de modo que a linha continua MODELLED

# text
seg-89b2114542bb = Avaliação de detecção de degradações de RF por IA/ML ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético rotulado de degradações + arcabouço de ROC/AUC/confusão/Pfa-Pmd agnóstico ao detector; proteção contra vazamento, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro vs fora do regime). Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = Limites de AUC em forma fechada (Mann–Whitney) + um detector com referência independente perfeita; o corpus é SINTÉTICO (fundamentado em parâmetros, não de campo/IQ)

# text
seg-c38ebee794b3 = Estudo da lacuna de otimismo de degradações de RF por IA/ML e preditor de lacuna somente com ID

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudo sintético controlado da lacuna de otimismo de AUC entre distribuição interna→externa em detectores de métodos publicados e aprendidos (regressão logística / MLP de uma camada oculta): tendências de lei de escala por classe (ρ de Spearman + inclinação em { "1" }−severidade) e um preditor de crista somente com ID que estima a lacuna apenas a partir de diagnósticos da distribuição interna, avaliado deixando um detector de fora e deixando uma classe de fora. Reproduzível por meio de <c1/>

# text
seg-c46973920f5b = Estatísticas derivadas à mão contra formas fechadas (AUC binormal Φ(d'/√{ "2" }), variância de DeLong, Spearman com postos empatados, recuperação exata por OLS) + validação cruzada leave-one-out contra a linha de base de prever a média. O corpus é SINTÉTICO (fundamentado em parâmetros, nunca de campo/IQ) e a lacuna de otimismo é uma mudança de severidade sintético→sintético, NÃO um resultado de simulação para campo

# text
seg-fd6424213d1f = Compromisso PNT quântico vs clássico e resiliência sem GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestão de ADEV medida (NNLS), tabela de compromisso (holdover de temporização/inercial + benefício), envelope de resiliência por tempo; a ressalva do piso é carregada no artefato. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = O kernel de ajuste ADEV medida→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um kernel externo independente; mas os NÚMEROS do compromisso quantificam (nunca validam) um relógio/CAI de parceiro, de modo que o compromisso em si continua MODELLED, sem aura de validação

# text
seg-1fa865bfddd1 = Ambiente de clima espacial e densidade termosférica dirigida pela atividade

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfis de difusão estáticos que reproduzem sua Tabela { "7" }, com as variações diurna, geomagnética, semianual, sazonal-latitudinal e do hélio) contra a atmosfera estática USSA76. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/space-weather.toml)

# text
seg-1cad4329e226 = Tabela definicional Kp↔ap + forma fechada da temperatura exosférica de Jacchia-1971 (coincidência a <{ "1" } K em relação às âncoras publicadas, tests/space_weather_reference.rs); a densidade é caracterizada contra o pymsis NRLMSISE-00 (um modelo independente do NRL): a oscilação do ciclo solar a { "800" } km é de 10.4x contra 13.6x do NRLMSISE-00. Revisão { "0.30" }: o fator de atividade de primeira ordem calibrado foi substituído por Jacchia { "1971" } (densidade do cenário padrão a { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k adicionado). { "0.30" } rodada { "2" }, densidades medidas por acelerômetro TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; fixada antecipadamente em 20eed695), uma constatação (continua MODELLED): as médias por órbita a { "400" } a { "500" } km estão dentro de um fator { "2" } no máximo solar fora de tempestades (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mas o Jacchia { "1971" } é cerca de 1.7x denso demais no mínimo solar de { "2008" } (GRACE-A 412/544 dentro de um fator { "2" }), de modo que a densidade não é validada

# text
seg-29bedb28c34f = Interoperabilidade CCSDS OEM (importação de efemérides GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = Importador CCSDS { "502.0" } OEM (parse_oem), tolerante a linhas COMMENT / palavras-chave extras de metadados / blocos de covariância e a inversa exata do escritor; ciclo completo + ingestão de arquivo externo com verificação de consistência de velocidade. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Janela de lançamento e geometria de ascensão (análise de missão)

# text
# c1: launch-window
seg-6066c634faba = Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bônus de rotação da Terra para leste, Δv de mudança de plano em dogleg e oportunidades diárias e, dados uma época e linhas IERS finals2000A, a velocidade do local em torno do polo verdadeiro (launch::site_rotation_speed_at). Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Geometria de lançamento de trigonometria esférica em forma fechada contra âncoras de exemplos resolvidos publicados (Vallado, Fundamentals of Astrodynamics 4ª ed., Algoritmo { "37" } de azimute de lançamento + mudança de plano do Cap. 6; tests/launch_window_ascent_geometry_reference.rs). Estas reutilizam a mesma forma fechada que o kshana implementa (uma verificação de paridade com valores publicados / de transcrição, InternalConsistency); de dois corpos MODELLED, sem modelo de triângulo de velocidades com Terra em rotação / ascensão / perda por arrasto. Comparação externa { "0.30" } com o Orekit { "12.2" } (Apache-2.0), uma constatação (continua MODELLED): a geometria concorda até o arredondamento (inclinação lida de volta a partir do azimute de fim de queima em { "158" } casos, pior { "2.6e-15" } rad; inclinação mínima, velocidade circular e delta-v de dogleg a { "3e-16" }), mas a velocidade do local por rotação da Terra não atinge o limiar relativo de { "1e-6" } fixado antecipadamente a { "62.9" } graus de latitude ({ "1.12e-6" }). A diferença cresce como tan(lat), consistente com um deslocamento de polo por movimento polar de cerca de { "5.8e-7" } rad no referencial da Terra do Orekit que o ω·R·cos(lat) esférico omite. A afirmação não foi restringida antes da execução, de modo que a linha não pode ser promovida com base nesta comparação. { "0.30" } rodada { "2" } (fixada antecipadamente em 71bebf63): com uma época e linhas IERS, a velocidade do local no polo verdadeiro (campo de cenário site_rotation_speed_true_pole_m_s) concorda com o Orekit dentro de { "1e-6" } em { "24" } locais ao longo de quatro longitudes (pior { "4.9e-8" }), mas a velocidade nominal sem época que o cenário emite por padrão como bônus de rotação da Terra ainda erra por { "1.12e-6" }, de modo que a linha continua MODELLED à espera de uma decisão sobre a saída padrão

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Desaceleração de pico (independente do coeficiente balístico), velocidade + altitude no pico de g e velocidade de aquecimento de pico para uma entrada balística em atmosfera exponencial. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Entrada analítica de Allen–Eggers em forma fechada, conferida adicionalmente com uma integração numérica scipy { "1.18" } solve_ivp (DOP853) da MESMA EDO de entrada somente com arrasto (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior a_max rel { "2.9e-9" }) — uma verificação de integral numérica contra a própria forma analítica, portanto ainda InternalConsistency, NÃO uma validação externa. Balística MODELLED (sem sustentação), sem aerotermia/TPS — a saída de aquecimento é uma velocidade, não um fluxo de calor. Comparação externa { "0.30" }, uma constatação (continua MODELLED): em relação à reconstrução da entrada da SRC da Stardust (Desai e Qualls, NASA NTRS { "20080008567" }), a desaceleração de pico de Allen–Eggers para o estado inercial de entrada impresso ({ "12.9" } km/s, -8.2 graus, H { "7200" } m) é de { "61.8" } g contra { "32.89" } g da melhor trajetória estimada, +{ "88" } % contra uma tolerância de { "15" } %: a solução de ângulo de trajetória constante e sem gravidade praticamente dobra o pico de uma entrada rasa, mais rápida que a velocidade de escape. A Stardust não levava acelerômetro, de modo que a reconstrução é uma estimativa de trajetória. { "0.30" } rodada { "2" }, bloqueada (continua MODELLED): uma solução integrada de massa pontual planar (reentry::simulate_planar_entry, US76, gravidade do inverso do quadrado, curvatura) concorda com as melhores trajetórias estimadas da Stardust e da Genesis dentro de { "15" } % (+{ "11.3" } %, +{ "5.6" } %), mas esses máximos são saídas de simulação de agências, não medições, de modo que isto é apenas uma verificação cruzada. A comparação com acelerômetro (fixada antecipadamente em a94a283d) está bloqueada à espera de uma cópia legível da análise REMM da Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-8c10b50407d3 = Pegada de carga útil de OT e geometria de cobertura

# text
# c1: eo-coverage
seg-45c1e799c87c = Geometria de triângulo espacial do SMAD: raio angular da Terra, largura da faixa, GSD no nadir, acesso máximo fora do nadir e período circular, mais o período nodal com J2 de primeira ordem (eo_payload::j2_nodal_period) e o espaçamento do rastro no solo no equador R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) com um indicador de cobertura contígua, para uma altitude orbital, inclinação e FOV/IFOV do sensor. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/eo-coverage.toml); sua inclinação padrão é a heliossíncrona de eo_payload::sun_synchronous_inclination, um padrão de conveniência que não faz parte da afirmação validada

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) e GeographicLib { "2.1" } (MIT), ambos executados como programas separados, fixados antecipadamente (766823f3) antes da mudança no motor e de qualquer execução de referência independente: grandezas da esfera dentro de { "1e-9" } relativo (pior: raio angular { "5.4e-16" }, faixa { "7.0e-13" }, acesso { "1.9e-14" }), período { "1e-12" } ({ "1.6e-16" }), GSD no nadir { "1e-7" } ({ "2.9e-10" }), o período nodal com J2 e o espaçamento dos nós dentro de { "0.1" } % de uma propagação numérica J2 do Orekit com detector de nó ({ "1.2e-5" } e { "6.7e-5" }), o indicador de contiguidade exato (168/168) e, em relação ao elipsoide WGS-84, o limbo dentro de { "0.3" } grau ({ "0.186" } grau) e o alcance máximo no solo dentro de { "0.5" } % ({ "3.2e-3" }). Remover o termo de regressão nodal faz falhar { "35" } dos { "42" } pontos de nó. Escopo MODELLED: pegada em Terra esférica; sem radiometria, MTF, atmosfera, jitter ou glint; a inclinação heliossíncrona padrão não é comparada. A verificação cruzada anterior com Skyfield/SGP4 é mantida como regressão. Revisão { "0.30" }: o espaçamento agora traz a regressão nodal por J2 (cenário padrão { "2756.37" } -> { "2752.17" } km)

# text
seg-940692c550f3 = Enquadramento TM/TC do CCSDS Space Packet ({ "133.0" })

# text
# c1: space-packet
seg-bf06c7ffa875 = Codificação/decodificação do cabeçalho primário do CCSDS 133.0-B Space Packet (versão/tipo/sec-hdr/APID/seq-flags/contagem/comprimento dos dados) + um cenário de enquadramento. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — uma implementação independente de terceiros do CCSDS 133.0-B-2; o encode_packet/decode_packet do kshana coincidiu byte a byte (o cabeçalho primário de 6 octetos em { "33" } casos + o pacote codificado completo em { "12" })

# text
seg-5510c82f671a = Cabeçalho secundário, controle de erro de pacote e segmentação do CCSDS Space Packet

# text
seg-7503bf761df9 = Extensões do CCSDS 133.0-B-2 Space Packet ao lado do cabeçalho primário: um cabeçalho secundário que traz um código de tempo CCSDS 301.0-B (CUC ou CDS, campo P explícito ou implícito) e dados auxiliares, o campo de controle de erro de pacote CRC-16, a segmentação de uma unidade grande de dados do usuário e sua remontagem, decodificação de fluxo com verificações de lacuna e ordem de sequência, e pacotes PUS-TM. A saída do cabeçalho primário é idêntica byte a byte à anterior

# text
seg-4123d600477a = Fixado antecipadamente (003ef3eb) antes de qualquer comparação; quatro implementações independentes, nenhuma GPL, nada incluído no repositório: o ccsdspy { "2.0.1" } (BSD-3-Clause) decodifica { "34" } pacotes escritos pelo Kshana em { "5" } fluxos (cabeçalho primário, campo P, tempo grosso e fino, campos CDS, dados auxiliares, dados do usuário, PEC) e ambas as unidades segmentadas de 1000 octetos são reconstruídas a partir de seus dados do usuário com { "0" } divergências, e ele sinaliza os fluxos com pacote descartado e com pacotes trocados que o Kshana rejeita; o CRC de { "8" } mensagens e { "57" } campos PEC é igual ao binascii.crc_hqx do CPython e ao spacepackets-rs { "0.18.0" } (valor de verificação 0x29B1); { "66" } casos de código de tempo CUC e CDS são iguais, octeto a octeto, na escrita e na leitura do spacepackets-rs { "0.18.0" } ({ "3" } casos CDS também do spacepackets-py { "0.32.0" }); { "4" } pacotes PusTm do spacepackets-py { "0.32.0" } são idênticos byte a byte aos do Kshana. Não coberto: códigos de tempo de época de agência ({ "7" } casos se apoiam em testes unitários), quadros de transferência TC e qualquer camada de enlace abaixo do pacote

# text
seg-7c61da52b8f8 = Exportação SPICE SPK (tipos { "9" } e { "13" })

# text
seg-582ce23522f6 = Escritor e leitor de kernels NAIF SPICE SPK dos tipos { "9" } (Lagrange, passos de tempo desiguais) e { "13" } (Hermite, passos de tempo desiguais), com o layout DAF, descritores de segmento e diretórios de épocas, e a exportação de um CCSDS OEM para um kernel SPK (épocas UTC ou TDB para tempo de efemérides)

# text
seg-194c37ac787f = CSPICE N0067 por meio de spiceypy { "8.3.0" }, kernel de segundos intercalares naif0012.tls, fixado antecipadamente (5059fd2a) antes de o SPICE ler qualquer kernel do Kshana: o inventário do SPICE dos quatro kernels do Kshana é exato; spkpvn e spkgeo em { "5 516" } épocas e { "690" } avaliações de cadeia são iguais, bit a bit, à avaliação do próprio Kshana e ficam dentro do limiar em cada nó (pior { "0.022" } dele); o Kshana lê kernels escritos pelo SPICE de forma idêntica bit a bit; para as mesmas entradas, os kernels do Kshana são idênticos byte a byte aos do SPICE ({ "0" } bytes diferentes em quatro arquivos); as épocas do OEM convertem-se em tempo de efemérides dentro de { "6.0e-8" } s do str2et (limiar { "1e-6" } s) e o SPICE avalia a exportação do OEM dentro do limiar (pior { "0.060" }). Arcos de Kepler sintéticos: nada sobre acurácia física. Outros tipos de SPK não são escritos

# text
seg-d699104fc2af = Tipos SPICE SPK { "3" } e { "21" } (Chebyshev, linhas de diferença estendidas)

# text
seg-7d3e8b5b40af = Escritor e leitor de segmentos NAIF SPICE SPK do tipo { "3" } (polinômios de Chebyshev para posição e velocidade em intervalos fixos, grau { "0" } a { "27" }) e do tipo { "21" } (arranjos de diferenças modificadas estendidas, as linhas de diferença dos integradores do JPL, MAXDIM { "15" } a { "25" }), a partir de registros dados, em arquivos que também contêm segmentos dos tipos { "9" } e { "13" }; seleção de registros e avaliação na ordem dos leitores do SPICE. O Kshana não ajusta coeficientes de Chebyshev nem produz linhas de diferença

# text
seg-40323a2adce1 = CSPICE N0067 por meio de spiceypy { "8.3.0" } (spkw03, spkw13 e, da mesma biblioteca por seu símbolo f2c, spkw21; spkpvn, spkgeo), fixado antecipadamente (e1cf80d8) antes de o código existir, com os registros sintéticos gerados a partir do SHA-1 desse commit: para três arquivos (tipo { "3" } graus { "0" }, { "12" } e { "27" } com { "3" } a { "150" } registros; tipo { "21" } MAXDIM { "15" }, { "20" } e { "25" } com { "1" } a { "250" } linhas, zero a duas entradas de diretório e uma cadeia de centros; tipos { "3" }, { "21" } e { "13" } em um arquivo com comentários), o inventário do SPICE dos kernels do Kshana é exato, os kernels do Kshana são idênticos byte a byte aos que o SPICE escreve a partir dos mesmos registros, e spkpvn e spkgeo são iguais, bit a bit, ao leitor do Kshana nos arquivos do Kshana e nos do SPICE ({ "48 876" } componentes em cada sentido, limiar { "1e-12" } relativo). Registros sintéticos: nada sobre acurácia física; kernels reais do tipo { "21" } produzidos pelo JPL não estão no conjunto de casos

# text
seg-39517faae95c = Attitude Data Messages do CCSDS (AEM, APM)

# text
seg-f88f6ea002c8 = Escritor e leitor das Attitude Data Messages do CCSDS 504.0-B-2 em KVN e NDM/XML: AEM versão { "2.0" } (e { "1.0" } em KVN, com seus ATTITUDE_DIR, QUATERNION_TYPE e sequências de rotação numéricas) com tipos de atitude por quaternion, ângulos de Euler e spin e suas variantes de derivada, velocidade angular e nutação, vários segmentos; APM versão { "2.0" } com blocos de quaternion, Euler, velocidade angular, spin, inércia e manobra; o quaternion A-para-B de um registro (504.0-B-2 Anexo F)

# text
seg-8853058de1f3 = Analisadores e escritores do Orekit { "13.1.8" } (Apache-2.0), executados como um programa separado (xval/adm-orekit), fixados antecipadamente (7a6a05fe) antes de qualquer comparação: o Orekit analisa toda mensagem escrita pelo Kshana ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) e todo valor está dentro de seu limiar (quaternions { "1e-14" }, ângulos { "1e-9" } grau; pior { "0.054" } de um limiar); o Kshana analisa as { "31" } mensagens que o Orekit escreve a partir das mesmas entradas dentro de todos os limiares; a rotação de cada um dos { "135" } registros de quaternion, Euler e spin é igual a AemSegment.getAngularCoordinates dentro de { "1e-12" } (pior { "0.0071" } do limiar). Todas as { "15" } mensagens XML do Kshana são validadas pelo esquema NDM/XML { "4.0.0" } (condicionado a dados, obtido com SHA-256 fixado). Constatação: o escritor APM do Orekit recusa uma manobra sem MAN_DELTA_MASS (opcional na norma), de modo que as manobras APM são cobertas apenas no sentido em que o Kshana escreve. Fora do conjunto de casos: tipos */RATE e XML do AEM { "1.0" }, blocos APM repetidos

# text
seg-5f26f879037e = Orbit Data Messages do CCSDS (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Escritor e leitor das Orbit Data Messages do CCSDS 502.0-B-3 em KVN e NDM/XML: OPM { "3.0" } e { "2.0" } (vetor de estado, elementos keplerianos osculadores, parâmetros da espaçonave, covariância, manobras, parâmetros definidos pelo usuário), OMM { "3.0" } e { "2.0" } (elementos médios por movimento médio ou semieixo maior, parâmetros relacionados a TLE com BSTAR ou BTERM e AGOM, covariância) e OCM { "3.0" } com trajetória (CARTP, CARTPV, CARTPVA; épocas absolutas ou relativas), propriedades físicas, covariância (CARTP, CARTPV na ordem LTM), manobra e blocos definidos pelo usuário; uma OMM de precisão total a partir de um conjunto de elementos SGP4, ao lado do OmmFile::to_omm_kvn inalterado

# text
seg-d4c7896b5963 = Analisadores e escritores OPM, OMM e OCM do Orekit { "13.1.8" } (Apache-2.0), executados como um programa separado (xval/odm-orekit), fixados antecipadamente (cc6841da) antes de qualquer comparação: { "27" } das { "30" } mensagens escritas pelo Kshana ({ "6" } casos OPM, { "5" } OMM e { "5" } OCM em KVN, e XML para a versão { "3.0" }) são analisadas pelo Orekit com todo valor dentro de { "1e-14" } relativo e toda época dentro de { "1e-9" } s ({ "904" } valores, pior { "0.021" } de um limiar), e o Kshana lê todas as { "25" } mensagens que o Orekit escreve de volta dentro dos mesmos limiares ({ "858" } valores, pior { "0.020" }); todas as { "14" } mensagens XML do Kshana são validadas pelo esquema NDM/XML { "4.0.0" } (condicionado a dados). Constatações, fixadas, que restringem a afirmação: o Orekit exige ELEMENT_SET_NO (opcional na 502.0-B-3), recusa COMMENT em parâmetros definidos pelo usuário em XML (o esquema o permite), não escreve BTERM sem BSTAR (de modo que BTERM e AGOM são cobertos apenas no sentido em que o Kshana escreve) e soma épocas relativas do OCM como segundos SI, de modo que sob TDB elas diferem da leitura do calendário TDB em cerca de { "1.9e-10" } s/s (UTC, TAI e TT concordam). A saída legada OmmFile::to_omm_kvn, que envolve os metadados da OMM em META_START/META_STOP, é recusada pelo Orekit (registrado). Fora do escopo: blocos OCM PERT e OD, conjuntos de elementos não cartesianos, outras ordenações de covariância

# text
seg-1e5ea1d9918d = Orçamento de erro de atitude e apontamento de 3 DOF (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Torque perturbador de gradiente de gravidade no pior caso ((3/2)(μ/R³)ΔI) como o pico sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento RSS sobre contribuintes nomeados de 1σ com o termo dominante (uma soma em quadratura de números fornecidos pelo chamador, fora da afirmação validada). Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = GravityGradientEffector do Basilisk { "2.9.1" } (AVSLab, ISC), uma implementação independente em C++ do torque de gradiente de gravidade com tensor completo: o pico (3/2)(μ/R³)ΔI do Kshana é igual ao torque do Basilisk na atitude de { "45" } graus dentro de { "1e-12" } relativo (pior { "2.1e-15" }) em { "5" } altitudes e { "8" } tensores de inércia, e limita o torque do Basilisk em { "2000" } atitudes aleatórias por caso; tolerância fixada antes da comparação. Afirmação validada: o pico do torque de gradiente de gravidade. O orçamento de apontamento RSS é uma soma em quadratura de números fornecidos pelo chamador, sem verdade externa, e permanece fora dela; a maximização de tensor completo do Hipparchus, codificada à mão, permanece como autoconsistência de apoio. Nenhuma simulação de malha de controle/6-DoF/modos flexíveis

# text
seg-1461aa14a7ff = Previsão de passagens de estação terrestre (segmento de solo)

# text
# c1: passes
seg-e1cf1ec4f005 = Passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação máxima, duração) de um propagador do motor sobre uma estação acima de uma máscara de elevação, com cruzamentos de subida/descida interpolados e acesso total: passes::predict_passes, o escalonador geométrico (sem refração nem tempo de luz). O tipo de cenário <c1/> executa o preditor aparente da linha 'Previsão aparente de passagens de estação terrestre com refração e tempo de luz'

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — uma biblioteca de dinâmica de voo independente: ElevationDetector (buscador de raízes de Brent) + EventsLogger sobre uma efeméride ITRF, estação como um TopocentricFrame WGS-84. AOS/LOS/elevação máxima/número de passagens/acesso total coincidentes com órbita+estação+máscara+janela idênticas (fixture versionada; driver xval/orekit-passes)

# text
seg-1dd8b2655b18 = Previsão aparente de passagens de estação terrestre com refração e tempo de luz

# text
# c1: passes
seg-46f93d3c24d2 = Passagens de visibilidade (AOS, TCA, LOS, elevação aparente máxima, duração) de um conjunto de elementos SGP4 sobre uma estação WGS-84 no caminho validado de órbita terrestre (IAU 2006/2000A, parâmetros opcionais de orientação da Terra), com refração troposférica ITU-R P.834-9 (equações { "9" } a { "14" }, os coeficientes impressos na Recomendação) e o tempo de luz do enlace de descida, cada um comutável; cruzamentos resolvidos por bisseção a { "1e-7" } s e a culminação por busca de seção áurea. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/passes.toml), com ambas as correções ativadas por padrão

# text
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) com Hipparchus { "4.0.3" }: TLEPropagator sobre os mesmos conjuntos de elementos em um TEME que o Orekit constrói segundo a definição declarada (seu TOD IERS { "2010" } rotacionado por GAST - GMST), ElevationDetector e ElevationExtremumDetector com e sem ITURP834AtmosphericRefraction, e AngularAzEl com AngularRadioRefractionModifier para o caso de tempo de luz, cruzamentos e máximo resolvidos pelo Hipparchus; { "60" } casos (quatro órbitas, cinco estações ao nível do mar, máscaras { "0" }, { "5" } e { "10" } graus, { "24" } horas). Limiares fixados antes da execução (fixados antecipadamente em e947e69d, etapa { "3" } de 72ea9eb0). Ignorar o tempo de luz ({ "9777" } falhas) ou trocar a constante { "1.728" } da P.834 por { "1.828" } ({ "7883" } falhas) faz o teste falhar. Escopo: estações ao nível do mar; o coeficiente h*theta0^{ "2" } da P.834 no Orekit é { "0.011380" } onde a Recomendação imprime { "0.01380" } (fixado), de modo que alturas acima do nível do mar não são comparadas. A rodada { "1" }, contra o TEME IERS { "1996" } padrão do Orekit, manteve todos os limiares de passagem, mas não atingiu o limiar de direção por causa da diferença de convenção do TEME de { "72" } mas (fixada)

# text
seg-7b4a8e25c3c9 = Codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de enlace de descida em LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 do enlace de descida ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda no espaço livre, perda atmosférica pela lei da cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que supera o limiar de quase ausência de erros da Tabela { "13" } do ETSI EN { "302" } 307-1 V1.4.1 mais uma margem de implementação em cada passo, o volume de dados ACM da passagem e a linha de base de codificação constante que fecha na máscara e na maior distância. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-a7f26e3a6030 = Consistência interna: a eficiência espectral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de quadro concorda com as eficiências impressas na Tabela { "13" } (uma verificação de transcrição da tabela de limiares); as partes do orçamento de enlace concordam com suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM move pelo menos o volume da codificação constante. A geometria da passagem vem do preditor aparente de passagens, VALIDATED em separado. O QUE NÃO É: nenhuma ferramenta externa nem enlace medido foi comparado; os limiares são os valores AWGN ideais da norma, não os de um modem; desvanecimento por chuva, perda de apontamento ao longo da passagem e pilotos não são modelados.

# text
seg-19603a7e0fe8 = Escalonamento de contatos com o solo de vários satélites e várias estações com resolução de conflitos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contatos candidatos a partir de cada passagem satélite-estação com seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro de seu tempo de reposicionamento ou um satélite faria o downlink para duas estações ao mesmo tempo; um objetivo de entrega ponderado por prioridade limitado ao atraso acumulado de cada satélite; um plano guloso de valor marginal preguiçoso, uma linha de base de primeiro a chegar e um branch and bound exato com até { "26" } candidatos, com a lacuna de otimalidade do guloso informada. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-bc520db98f9a = Consistência interna: o branch and bound exato concorda com a enumeração por força bruta em conjuntos aleatórios pequenos, todo plano é verificado como viável contra as regras de conflito, e o guloso nunca supera o ótimo exato. O QUE NÃO É: nenhum escalonador externo nem plano operacional foi comparado; os contatos são tomados inteiros (sem divisão), o atraso acumulado é fixado no início da janela, o tempo de reposicionamento além do fixo e o armazenamento de bordo não são modelados.

# text
seg-ddf2bc2f13a9 = Orçamento de enlace unidirecional (comunicações / projeto de enlace)

# text
# c1: link-budget
seg-83331f513dba = Perda de percurso no espaço livre, C/N₀, Eb/N₀, margem e fechamento sobre a equação de enlace CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda contra um Eb/N₀ requerido. Executável pela CLI/bindings como o tipo de cenário <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Tabela publicada de controle de projeto de telecomunicações de espaço profundo como vetores numéricos fixados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabela 1-1 (Galileo banda X) — o kshana remonta os itens da tabela e reproduz seu L_fs de ponta a ponta publicado de { "290.54" } dB e Pr/N0 de { "54.6" } dB-Hz; a perda no espaço livre também é conferida com a ITU-R P.525

# text
seg-3742d2aea62a = Enquadramento frugal de custo por cobertura / ROI

# text
seg-4228311689f8 = Custo por ponto percentual de cobertura + ROI de cobertura por euro sobre o motor de dimensionamento de constelação; o custo por satélite é uma faixa baixo/nominal/alto fornecida pelo chamador (sem preços fabricados)

# text
seg-d542ac64c31c = Aritmética de custo em forma fechada contra valores derivados à mão; um ENQUADRAMENTO econômico de um número de cobertura modelado, não uma cotação nem um modelo de custo validado

# text
seg-8ba6ee9acc8a = Impacto de integridade de detecção perdida (HPL/VPL sensível ao contexto contra limite de alerta)

# text
seg-f5985399d0d5 = Mapeia um viés de spoofing/jamming não detectado em erro efetivo → região de Stanford (disponível/indisponível/MI/HMI) contra HAL/VAL específicos do contexto (céu aberto vs urbano)

# text
seg-124d0ffe959e = Compõe a classificação de Stanford do RAIM validada externamente (raim::classify_stanford); o mapeamento detecção perdida→AL em si é modelado, não uma alocação de integridade certificada

# text
seg-37d43b5b918a = Folha de parâmetros de modelo de erro citados do CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Desempenho delimitado (melhor/nominal/conservador) de interferômetro de átomos frios — instabilidade de viés, passeio aleatório de velocidade/ângulo, estabilidade do fator de escala, taxa de amostragem limitada pela interrogação, faixa dinâmica de ambiguidade de franja — cada um rastreável por citação; alimenta o QuantumNavBudget sem modelar hardware

# text
seg-4b66096727b8 = Consistência interna: a faixa de VRW citada conferida com a física de CaiAccelerometer::accel_asd + faixa dinâmica bruta calculada a partir do limite de ambiguidade de franja; os números são faixas MODELLED de levantamento de literatura (needs_source_confirmation), nenhum dispositivo validado, sem aura de validação

# text
seg-c93f2d3a3167 = Benchmark de aderência à norma de integridade de temporização — classificador de épocas do diagrama de integridade de Stanford

# text
seg-712d5c35a6a6 = Classificação de épocas do diagrama de integridade de Stanford do TIB (nominal / indisponível / MI / HMI)

# text
seg-93b913e60063 = Reimplementação independente em numpy da regra de quatro regiões (scripts/gen_tib_scorer_reference.py) sobre o mesmo conjunto de amostras; método citado do diagrama de integridade Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) e do RTCA DO-229 WAAS MOPS. NÃO é uma referência independente de acurácia ExternalDataset — o benchmark é imune à honestidade.

# text
seg-573aa0193cb3 = Benchmark de aderência à norma de integridade de temporização — pontuador de cobertura de integridade

# text
seg-4d86f3c2d8f5 = Pontuação de cobertura de integridade do TIB (taxas de HMI/MI/disponibilidade + veredicto de cobertura do overbound)

# text
seg-645eb084ae8e = Recontagem independente de regiões em numpy em tests/fixtures/tib/reference.json; apenas verificação cruzada da maquinaria do pontuador, sem afirmação de acurácia.

# text
seg-372dd0fdb025 = Benchmark de aderência à norma de integridade de temporização — catálogo de falhas (geradores paramétricos)

# text
seg-2604e7cf27d2 = Menu de falhas do TIB (divergência de domínio, clock-slam, deriva em holdover, atraso estático/incremental/simétrico/assimétrico, replay dentro da validade, seletivo por caminho, quórum k-de-N)

# text
seg-b907aecaccd0 = Geradores paramétricos de falhas representativos (modelado); o conjunto indetectável (atraso simétrico, replay dentro da validade) é citado de Mizrahi RFC { "7384" } e Narula & Humphreys (IEEE JSTSP { "2018" }). Nenhuma referência independente externa — um catálogo de falhas não faz afirmação medida.

# text
seg-90c0eb1e7c14 = Benchmark de aderência à norma de integridade de temporização — veredicto de absorção do indetectável

# text
seg-f713acf042ff = Veredicto de absorção do indetectável do TIB (simétrico/replay devem ser absorvidos pelo PL, nunca informados como detectados)

# text
seg-6840c2467c63 = Verificação de propriedade de que o enum Verdict estruturalmente não pode informar uma falha indetectável como detectada (Mizrahi RFC { "7384" }); absorvido ⟺ PL ≥ deslocamento. Nenhuma referência independente de acurácia.

# text
seg-3652a591eefc = Engenharia de plataforma de espaçonave (AOCS/térmica/estruturas/propulsão/energia)

# text
seg-50a9c1c7dff0 = Não fornecido — o Kshana é um simulador de desempenho de navegação, não um fabricante de plataformas

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Projeto de hardware de carga útil de RF de navegação e antenas

# text
seg-76c983a23e7b = Não fornecido — o Kshana modela o desempenho do sinal, não o hardware de carga útil/antena

# text
seg-7bba3b35214c = Projeto e maturação de hardware de carga útil quântica

# text
seg-15fcc200b859 = Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógio é de um parceiro

# text
seg-d69dd4c5167b = Garantia de produto de hardware de voo (radiação/EEE/MAIT)

# text
seg-b1540f78ffd4 = Não fornecido — o Kshana trata apenas da garantia de produto de software; a garantia de produto de voo é de um parceiro

# text
seg-1f200f8efc71 = Tempo coordenado lunar

# text
seg-2e6961dbffe9 = Taxa relativística de relógio Terra-Lua (LTC/TCL) + encadeamento TT/TAI/UTC + conjunto

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base do LTC do LunaNet da IAU/IAG): autopotencial na superfície da Lua L_m = { "3.13881e-11" } e total secular de { "56.02" } µs/dia coincidentes como valores numéricos publicados; velocidade geocêntrica da Lua conferida com o JPL DE440 (de440s.bsp via SPICE)

# text
seg-8adbbd2cdb74 = Autodescrição do relatório híbrido óptico/RF

# text
seg-2a5e48b558e1 = O relatório hybrid-optical-rf declara a configuração de enlace em que de fato foi executado (comprimento de onda da portadora, abertura de transmissão e de recepção, distância, largura de pulso, tempo de integração, eficiências e perdas, padrões resolvidos) e traz um bloco de unidades que dá a unidade e a classe de procedência de cada grandeza que um artigo provavelmente citará, incluindo os traços de covariância da transferência em metros quadrados

# text
# c1: variance
seg-23f0c10237f4 = Nenhuma referência independente externa, e nenhuma é possível: isto é autodescrição, não uma medição. Ela é registrada porque sua ausência era um defeito -- o P5 precisou citar o comprimento de onda da portadora e a abertura de transmissão a partir de padrões do código-fonte, e inferir que um <c1/> nu estava em metros quadrados a partir de uma verificação de consistência interna. A inferência estava correta, e é justamente por isso que importava: nada teria detectado que estivesse errada

# text
seg-0691f3dee8cb = Disponibilidade do enlace híbrido óptico/RF no lado de RF

# text
seg-72ccb655caf0 = O relatório hybrid-optical-rf declara uma disponibilidade do enlace de RF, composta a partir de grandezas que o motor já calcula, e não de uma climatologia importada, e declara a composição como uma regra nomeada: A_rf = I_closure * I_track, em que I_closure é o veredicto de fechamento do orçamento de enlace unidirecional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margem de Eb/N0 >= { "0" }) na distância do próprio cenário e I_track é o veredicto do laço de rastreamento (jamming::lock_status) sobre o C/N0 que esse MESMO orçamento retornou. Cada fator leva a classe de procedência de sua entrada até a saída, e os fatores deliberadamente NÃO incluídos no produto -- visibilidade geométrica, negação por interferência e uma climatologia de interrupção de RF -- são nomeados com o motivo, em vez de silenciosamente definidos como { "1" }. O trecho de RF resolvido é ecoado como seu próprio bloco rf_link_configuration, e os números contínuos ao lado do indicador (margem do enlace, margem de C/N0, as distâncias de fechamento e de rastreamento em forma fechada e a utilização da distância) são as inversões de distância do mesmo orçamento. O relatório declara por completo, no bloco e na entrada de unidades em que o leitor chega, que este número é LIMITADO POR MARGEM/GEOMETRIA e DETERMINÍSTICO, enquanto a disponibilidade óptica é LIMITADA POR CLIMA/CLIMATOLOGIA e probabilística, de modo que os dois nunca podem ser citados como um par comparável de porcentagens

# text
seg-319705ea0166 = Nenhuma referência independente externa, e ExternalDataset é recusado. As duas entradas são uma margem de Eb/N0 e um cruzamento de limiar de C/N0, ambos funções de um EIRP, uma figura de mérito e uma alocação de perdas agrupadas MODELLED; não há registro de disponibilidade medida para um serviço híbrido óptico/RF Terra-Lua contra o qual conferir o número composto. As verificações que existem são internas e são declaradas como tais: a composição é recalculada a partir das próprias margens publicadas do relatório, e não das entranhas do emissor, e a distância de fechamento é verificada reexecutando a equação de enlace NELA e exigindo que a margem se anule -- um ciclo completo de inversão, não uma implementação independente. O limite honesto do número é registrado no próprio relatório: é um indicador determinístico 0/1, não uma probabilidade, porque nada neste motor mede uma distribuição de interrupção de enlace de RF nesta banda e geometria. Essa entrada ausente é nomeada em rf_availability.factors_not_included em vez de inventada, e fornecê-la é o que uma disponibilidade de RF probabilística exigiria

# text
seg-22c5df9b6c7c = Comparação de ranging óptico versus RF em condições iguais

# text
seg-70eb396f40af = O relatório hybrid-optical-rf emite a razão de ranging óptico versus RF com a ÚNICA configuração em que ambos os trechos foram avaliados contida no mesmo objeto: o mesmo percurso unidirecional, a mesma distância e o mesmo tempo de acumulação. O trecho óptico é o CRLB de ToA limitado por fótons do motor sobre a contagem de fótons unidirecional; o trecho de RF é o jitter térmico de rastreamento de código early-late do DLL do motor no C/N0 que o próprio orçamento de enlace do motor retorna para essa mesma distância unidirecional. A largura de banda de ruído do laço é derivada, não escolhida: B_L = 1/({ "2" }*integration_s) coloca o trecho de RF exatamente no tempo de acumulação óptico, e se um chamador a substitui de modo que os dois tempos de média discordem, a razão é REFUSED -- nula, com a divergência e ambos os tempos nomeados -- em vez de citada em dois pontos de operação. Nenhuma razão é formada contra o rf_position_sigma_m paramétrico ESCOLHIDO do cenário, e a recusa diz por quê: essa entrada não traz nenhuma configuração. O resultado principal óptico bidirecional liberado e o fator exato que o liga ao trecho de comparação unidirecional são emitidos ao lado da razão, de modo que o relatório não pode ser lido como se trouxesse dois sigmas ópticos discordantes

# text
seg-acbb3ac98ee3 = Nenhuma referência independente externa para a RAZÃO, e ExternalDataset é recusado deliberadamente. A cadeia de RF subjacente tem uma — tests/validate_p5_rf_ranging_precision.rs confere linkbudget::link_budget e navsignal::dll_code_jitter_chips com uma fixture independente em Python/NumPy e com o valor trabalhado de Kaplan & Hegarty fixado no código ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz) — e o CRLB óptico tem sua própria linha em forma fechada. Reivindicar qualquer das duas âncoras para esta linha seria validação emprestada, o que as invariantes da matriz existem para impedir: a grandeza aqui é uma RAZÃO em uma configuração com EIRP, figura de mérito, potência de transmissão e abertura MODELLED, e não existe comparação medida de ranging óptico versus RF em um ponto de operação comum contra a qual conferi-la. O que é verificado internamente é aquilo em que a razão realmente pode errar: que os dois trechos estejam em um único ponto de operação. Isso é medido escalonando o tempo de acumulação comum e exigindo que ambos os trechos se movam pela mesma lei da raiz quadrada e que a razão permaneça onde está, e é imposto recusando a razão por completo quando os tempos de média discordam. Ambos os trechos são limites de ruído térmico/de disparo e ambos excluem atraso de meio, erro de relógio e ambiguidade, de modo que a exclusão é idêntica em cada lado; o relatório o declara em vez de deixá-lo inferido

# text
seg-3f26f598e013 = Autodescrição do relatório de orçamento de enlace

# text
seg-b88bf41d6d4c = O relatório de orçamento de enlace declara toda constante absoluta a partir da qual sua própria margem foi calculada -- a frequência da portadora usada na perda no espaço livre, o EIRP, a figura de mérito, a perda agrupada e o termo de Boltzmann -- mais o G/T requerido em que a margem é zero, a constante de enlace (EIRP - perdas - Eb/N0 requerido), que é a única combinação que uma tabela publicada de taxa/ganho pode fixar, e, quando um chamador declara uma temperatura de ruído do sistema, o ganho da antena receptora que essa figura de mérito implica

# text
seg-52f98f50522f = Nenhuma referência independente externa: isto é autodescrição sobre uma equação já validada contra uma tabela publicada de controle de projeto (ver a linha de orçamento de enlace unidirecional). Ela é registrada porque sua ausência era um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv liberado exigiu resolver de volta uma constante efetiva a { "0.0034" } dB a partir de todas as trinta linhas, e o motor agora tanto nomeia essa combinação quanto prova, por teste, que nenhuma tabela liberada poderia jamais ter separado seus três componentes

# text
seg-a7b192e27cb5 = Tabela de cruzamento de tempo lunar por classe de relógio

# text
seg-cab605dc6ea2 = Uma execução do orçamento de tempo lunar emite uma linha de cruzamento relógio-vs-referencial por classe de relógio contra um único termo de referencial compartilhado, de modo que o relógio é a única variável na comparação; cada linha traz o cruzamento alcançado de duas maneiras -- por bisseção a partir da curva geral de erro de tempo em lei de potência e invertido algebricamente a partir do tipo de ruído dominante da linha -- com a diferença relativa entre elas

# text
seg-ccec15f0b125 = Dois cálculos diferentes na mesma base de código da mesma grandeza, não um reenunciado: a bisseção sobre a curva em lei de potência da IEEE-1139 nada sabe sobre o tipo de ruído, enquanto a forma fechada inverte o tipo dominante algebricamente, de modo que um tipo de ruído mal classificado ou um intervalo ruim aparece como uma diferença relativa que não é minúscula. Os quatro valores também reproduzem a tabela publicada do artigo até metade do último dígito impresso — mas essa tabela foi ela própria reconstruída a partir da mesma forma fechada, de modo que é uma verificação de reprodutibilidade e não uma referência independente externa, e o termo de referencial contra o qual é medida é uma alocação modelada

# text
seg-ff32b78acb8c = Erro conjunto de UT1 e movimento polar sobre um conjunto comum de linhas

# text
seg-561e588153af = Uma tabela informa o erro de previsão de UT1, o erro do polo por movimento polar e sua combinação em quadratura na Lua sobre um conjunto de épocas IDÊNTICO por horizonte, emitindo as épocas em que cada componente foi medido. Separadamente, o cenário nomeia qualquer entrada de EOP que esteja em vigor e decompõe seu censo de linhas, e sempre emite a tabela de horizonte previsto-versus-final com uma declaração explícita do motivo de estar vazia quando estiver

# text
seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3) lendo o produto IERS finals2000A com sua própria regra Bulletin-B-senão-A, e rotações completas celeste-para-terrestre do pyerfa { "2.0.1.5" } (SOFA) (c2i06a, sp00, pom00, c2tcio; o ângulo de rotação da Terra segundo a IERS { "2010" } eq. { "5.15" } em aritmética exata), executados como programas separados sobre linhas literais do finals2000A.all congelado de 2026-09-30; fixado antecipadamente (455b8fb5) com as emendas A1 e A2, que fixam apenas a precisão numérica da referência independente (ambas divulgadas com as execuções que as seguiram): toda lista de épocas da Tabela { "3" } igual, estatísticas de UT1 e do polo dentro de { "6e-16" }, a combinação dentro de { "1.9e-7" }, 12/12 casos previsto-versus-final. A verificação da combinação não consegue resolver erros do termo do polo abaixo de cerca de { "1e-4" } relativo porque o UT1 a domina; a acurácia do polo se apoia na verificação de estatística do polo a { "1e-9" }. As regras de conjunto de épocas e de contingência são o gerador espelhando definições do Kshana, e os estados da tabela vazia são comportamento de projeto sem verdade externa. Magnitudes: erros de previsão realizados da Tabela 3a do IERS Annual Report { "2019" }, Kshana/IERS { "1.001" } a { "1.100" } em { "1" } a { "90" } dias (limiar [{ "0.8" }, { "1.25" }], medidas). Censo de linhas: astropy (linha de entrada offline). Rodada { "1" } (mantida como regressão): contra a fórmula de acurácia impressa em { "178" } edições do Bulletin A, o polo concorda dentro de 1.5x e o UT1 não, o que testa a fórmula do IERS contra seu erro realizado

# text
seg-3692f1fc89e6 = A entrada padrão offline de orientação da Terra é um produto real do IERS

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = O padrão de execução de <c1/> é a cópia embutida própria da biblioteca de um extrato literal do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } linhas diárias consecutivas, MJD 61224-61397, recortadas do finals2000A.all de 2026-09-30) que traz as três vintages de linha que o formato define, classificadas pelos indicadores I/P do IERS (eop::row_vintage): { "30" } finais do Bulletin B, { "54" } linhas rápidas medidas (indicador I sem bloco do Bulletin B) e { "90" } previsões do Bulletin A (indicador P). Uma execução simples sem argumento de arquivo e sem rede emite uma tabela por horizonte preenchida, o censo de linhas = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) e predicted_rows.n = { "90" } sobre MJD 61308-61397; o corte tal como emitido das comparações previsto-versus-final é a última linha medida. O extrato anterior de 32 linhas (tools/finals2000A_2026.txt, toda linha com indicador I) e o excerto de cinco linhas somente finais continuam distribuídos e exercitados: neles predicted_rows.n é { "0" }, uma propriedade do arquivo de entrada e não um resultado do analisador

# text
seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), lendo os mesmos bytes com seu próprio leitor, e a tabela do IERS Bulletin A Vol. XXXIX No. { "039" }, copiada número por número; fixado antecipadamente (6fdae01b) com seis critérios exatos antes de o astropy ser executado. Todos os seis se mantêm: { "30" } linhas finais, { "54" } rápidas e { "90" } previstas com listas de MJD iguais, todo indicador de linha prevista P, o censo da execução padrão igual, e as previsões iguais às do Bulletin A até o último dígito impresso. Divulgado: o recorte foi escolhido com um corte simples de colunas dos indicadores e do bloco do Bulletin B, que mostrou 30/54/90, antes do commit; o extrato é uma fatia literal que este repositório recortou de um produto do IERS (SHA-256 no NOTICE da fixture). A afirmação validada é a classificação de vintage e o censo da entrada padrão distribuída e de suas linhas previstas; entradas arbitrárias do usuário são classificadas pela mesma regra de indicador, mas não fazem parte da comparação. { "0.30" } rodada { "1" } (substituída): o padrão anterior chamava { "12" } linhas de indicador I de previsões do Bulletin A; o motor agora classifica pelo indicador. REVISÕES: as células da execução padrão que mudaram estão listadas do antigo para o novo em docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, o piso do polo { "0.06776" } -> { "0.05550" } mas, o termo de orientação da Terra { "14.01601" } -> { "14.01583" } m, o total { "20.09759" } -> { "20.09746" } m e { "67.03834" } -> { "67.03790" } ns, as linhas da Tabela { "2" } de tests/golden/realtime-frame-eop.csv e os números de concordância do preditor operacional); as anteriores em docs/revisions/G12-default-eop-cell-changes.md

# text
seg-18c72a7565d6 = Pegada de captura contra altitude e largura de feixe

# text
seg-9c30a0ab5233 = Varredura de dois eixos da pegada de captura de superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de operação com a largura de feixe de meia potência que cada diâmetro implica, e a captura do limbo informada como um LIMIAR -- por linha, o J/S do limbo, sua margem e a potência de transmissão que o fecharia; por grade, os cruzamentos localizados, ou uma declaração explícita de que o limbo não é alcançado em lugar nenhum da grade, com o déficit

# text
seg-4d866b62d4f7 = Inclusão de conjuntos: a razão interferente-sinal entra como um deslocamento uniforme em decibéis, de modo que o conjunto capturado a uma potência de transmissão maior contém o conjunto a uma menor e a fração só pode aumentar -- uma propriedade que o diagrama de Airy NÃO dá em largura de feixe ou altitude, onde a região capturada se rompe em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada dá a fração de disco capturada de um transmissor orbital lunar contra altitude e largura de feixe, de modo que não há nada externo contra o qual conferir estas células; o diagrama subjacente é validado em separado contra valores de Bessel publicados e mantém sua própria linha

# text
seg-fc0a64b9a280 = Reprodutibilidade do orçamento de erro de tempo lunar

# text
seg-5d5970506b9c = O cenário lunar-time-budget publica suas saídas em forma de arranjo como uma tabela em formato longo (índice da grade, tempo de média, termo) ao lado do relatório, de modo que as sete curvas x(tau) por termo e o total de raiz da soma dos quadrados são saída do motor e não algo que o leitor reconstrói a partir da seção de método

# text
seg-62df6258bc62 = Apenas autoconsistência: o total publicado é conferido com a raiz da soma dos quadrados dos termos no mesmo arquivo, e a curva emitida reproduz o p3_time_budget_curve.csv liberado em todos os { "57" } pontos. Ambas as verificações compartilham as definições de termos do próprio motor, de modo que nenhuma é independente. O termo do relógio se apoia em especificações de relógio publicadas, mas as MAGNITUDES dos pisos de enlace, referencial, relativístico e de efemérides são alocações de orçamento documentadas, sem referência independente externa

# text
seg-675887733454 = Laboratório de tempo de estação lunar: holdover do miniRAFS contra o LTC

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Atraso de VLBI de campo próximo para uma linha de base na Terra observando um farol lunar + derivadas parciais

# text
seg-d1943f9932af = delta_dor de onda plana (mesma base de código) no limite de campo distante; derivadas parciais por diferenças finitas. Comparação externa { "0.30" }, uma constatação (continua MODELLED): em relação aos tempos de luz convergidos do ANISE { "0.10" } pelo DE440 ({ "75" } atrasos em 2024-01-01 em três linhas de base da DSN, gerados por xval/anise-lunar-od sem código do Kshana), nenhum atraso fica dentro da tolerância de { "1" } ps. A maior diferença é de { "24" } µs, devida ao centro analítico da Lua (cerca de { "200" } km do DE440), à geometria instantânea única sem iteração de tempo de luz ({ "3.6" } µs) e ao movimento polar descartado; as derivadas parciais do farol diferem em até { "2.9e-3" } relativo contra { "1e-6" }. A afirmação da documentação do módulo de que as aproximações de referencial estão abaixo da fidelidade do modelo não se sustenta neste nível. { "0.30" } rodada { "2" }: o caminho por kernel (lunar_vlbi::KernelGeometry) é validado contra tempos de luz do NAIF SPICE em sua própria linha, VLBI geodésico lunar, caminho por kernel; a comparação do ANISE desse caminho (75/75 dentro de { "1" } ps, pior { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) é apenas uma verificação cruzada de avaliação de kernel, porque a solução de tempo de luz nesse arcabouço é do próprio projeto. Esta linha (o caminho analítico padrão) continua MODELLED com a constatação acima

# text
seg-d12d4565b01d = VLBI geodésico lunar, caminho por kernel

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Atraso de VLBI de campo próximo para uma linha de base na Terra observando um farol lunar, com derivadas parciais do farol e da estação, no caminho por kernel (lunar_vlbi::KernelGeometry): Terra e Lua do DE440, eixos principais lunares do DE440, orientação da Terra ITRF93 com UT1 e movimento polar, cada tempo de luz convergido no referencial baricêntrico, derivadas parciais com o fator de tempo de luz 1/(c - u.V). Executável como o cenário <c1/> com planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path definidos; as saídas validadas são a série geometric_delay_s do caminho por kernel e epoch_partials. No caminho por kernel, delay_s soma o termo de Shapiro diferenciado analítico, que não é comparado, e delay_rate e near_field_correction_us não são comparados

# text
seg-c7f6842b6019 = Tempos de luz newtonianos convergidos (spkcpt/spkcpo, CN) do NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) de um farol fixo em MOON_PA_DE440 até as estações DSN DSS-14, DSS-43 e DSS-63 a partir do kernel de estações do NAIF earthstns_itrf93_260814.bsp, com de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec e naif0012; as derivadas parciais são diferenças centrais de cinco pontos de tempos de luz do SPICE, não a fórmula 1/(c - u.V) do Kshana. Fixado antecipadamente (a689c797, épocas de { "2024" }) com limiares de { "1" } ps em todo atraso e de { "1e-6" } relativo em toda derivada parcial. Essa primeira execução falhou (17/75 atrasos dentro de { "1" } ps, pior { "1.03e-11" } s): o SPICE guarda o ET como um único double, cujo espaçamento em { "2024" } arredonda a época de emissão em até { "6e-8" } s, cerca de { "6" } ps de tempo de luz, e o resíduo coincide com esse arredondamento com correlação de { "0.99999" } (fixado; o revisor o reproduziu de forma independente). A emenda 66e365d4, escrita após esse resultado e antes de sua fixture existir, moveu a mesma referência independente e os mesmos limiares para { "25" } épocas horárias perto do J2000, onde o espaçamento do ET é de no máximo { "1.5e-11" } s: 75/75 atrasos dentro de { "1" } ps (pior { "6.2e-14" } s), 75/75 derivadas parciais do farol (pior { "7.4e-9" }), 150/150 derivadas parciais de estação (pior { "3.8e-11" }). Fora da afirmação: o caminho analítico padrão (Lua em série e referencial lunar médio, { "24" } µs do ANISE pelo DE440, a linha VLBI geodésico lunar), o termo de Shapiro diferenciado que o cenário soma analiticamente, o meio de propagação e a escala baricêntrico-para-geocêntrico

# text
seg-1f10810131be = Leitor de kernels NAIF: contêiner DAF, SPK tipo { "2" } e PCK binário tipo { "2" }

# text
seg-7da4847e7a28 = O leitor próprio do motor, em Rust puro, de kernels binários NAIF (naif_kernel): o contêiner DAF (ambas as ordens de bytes, registros de resumo encadeados), segmentos de posição Chebyshev SPK tipo 2 encadeados por seus centros até um ancestral comum mais baixo, e segmentos de ângulos de Euler PCK binário tipo 2 convertidos em uma rotação J2000-para-corpo, com épocas tomadas como ET de duas partes para que um deslocamento sub-microssegundo mantenha sua precisão. É por ele que o KernelEphemeris (ephem_provider) e os caminhos por kernel de lunar_vlbi, lunar_llr e lunar_vlbi_fim leem o DE440. A afirmação é que ele lê corretamente kernels do JPL; não é uma afirmação de que o DE440, ou as séries analíticas de Sol e Lua do motor, sejam acurados

# text
seg-09773b73d785 = Dois leitores de kernel independentes sobre os mesmos arquivos NAIF: NAIF SPICE Toolkit N0067 (CSPICE por meio de spiceypy { "8.2.0" }, MIT; spkezr e pxform) e ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate e Almanac.rotate), ambos executados como programas separados sobre de440s.bsp e moon_pa_de440_200625.bpc. Fixado antecipadamente (abcd9133) antes de existir qualquer fixture ou valor de referência independente: a semente da grade são os primeiros { "16" } dígitos hexadecimais do hash desse commit, de modo que nem as { "200" } épocas nem os pares de corpos puderam ser escolhidos com o resultado à vista; cada época também traz a Lua e o Sol em relação à Terra. Limiares fixados de antemão a partir da avaliação de Chebyshev em dupla precisão (no máximo { "15" } coeficientes, n^{ "2" } u = { "2.5e-14" } por avaliação, duas avaliações e até dois saltos por lado): posição { "1e-13" } R + { "1e-5" } m, velocidade { "1e-13" } V + { "1e-10" } m/s, com R e V a maior magnitude em relação ao ancestral comum mais baixo; elemento de rotação { "1e-13" } W + { "1e-15" }, com W a soma dos coeficientes do registro que cobre; o ANISE soma { "2" } ns de movimento relativo para suas épocas em nanossegundos. Resultado: cada um dos { "600" } estados e das { "200" } rotações dentro de seu limiar contra ambas as referências independentes, tanto nos recortes quanto nos kernels completos; pior { "6.0e-3" } do limiar (posição), { "5.9e-3" } (velocidade), { "3.7e-3" } (rotação). Mutação: avaliar cada registro em -s faz falhar { "3597" } comparações. Divulgado: uma verificação anterior de 25 épocas contra o SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) foi vista antes desta linha e não é sua evidência; a primeira execução do gerador de fixture abortou em um intervalo de grade vazio antes de produzir qualquer valor e foi corrigida. Ambos os lados leem o DE440, de modo que a concordância valida o leitor, não as efemérides

# text
seg-e08e98908f3a = GNSS da Terra à distância lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Recepção de GNSS da Terra à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época, calcula o ângulo fora do eixo em relação ao nadir do transmissor, se a Terra oculta o caminho reto, a distância oblíqua e sua perda no espaço livre, o ganho de transmissão nesse ângulo, a potência recebida e a densidade de portadora sobre ruído; depois agrega apenas os enlaces que superam um limiar de rastreamento e varre uma revolução completa da constelação, de modo que a resposta é uma DISTRIBUIÇÃO e não um único instantâneo. Três fatos determinam o resultado e o relatório declara cada um: a Terra subtende { "13.90" } graus a partir do raio da constelação, de modo que o PICO do feixe é geometricamente indisponível a qualquer raio dirigido à Lua; o que resta é a borda do lóbulo principal e os lóbulos laterais, o regime em que o LuGRE operou na Lua em { "2025" }; e a perda de percurso em L1 é de cerca de { "208" } dB, uns { "25" } dB a mais do que um usuário terrestre paga. MEASURED na geometria incluída de 24 satélites de classe GPS ao longo de { "64" } épocas de um período orbital: disponibilidade de SINAL { "0.375" } com um melhor enlace de { "30.93" } dB-Hz, e disponibilidade de SOLUÇÃO { "0.000" } - no máximo dois enlaces rastreáveis simultâneos, nunca os quatro de que uma posição precisa. A separação dessas duas disponibilidades é o ponto central, e o relatório se recusa a deixar que sejam confundidas: o GNSS da Terra à distância lunar é uma camada de classe de TEMPORIZAÇÃO, não de classe de posição, e um a priori de resiliência em camadas deve tomar a disponibilidade de solução. O condicionamento é emitido pela mesma razão - todo satélite visível fica dentro de um cone de poucos graus de largura visto da Lua, de modo que as linhas de visada são quase paralelas por construção. Executável como o tipo de cenário <c1/> Reformulado segundo D7: a afirmação à distância lunar é a densidade de portadora sobre ruído RELATIVA entre satélites em uma época, a partir de diagramas bidimensionais de transmissão medidos (NAVCEN Block IIR/IIR-M), mais visibilidade geométrica; o C/N0 absoluto não é afirmado (Parker et al. relatam uma perda comum de { "7" } a { "12" } dB).

# text
seg-bed2679f88e5 = Identidades em forma fechada e consistência interna; NENHUMA referência independente externa é afirmada. O semiângulo do limbo é conferido com asin(R_earth/r_orbit) e a geometria com ele; a perda no espaço livre, o kernel de DOP e a propagação SGP4 que isto compõe são cada um validados externamente em suas próprias linhas, e esta linha não toma emprestado o status deles. POR QUE MODELLED, e é o diagrama de transmissão: o ganho por ângulo é uma abertura circular uniformemente iluminada, o diagrama de Airy, enquanto uma antena GPS L1 real é um arranjo helicoidal de doze elementos com um lóbulo principal modelado, com pico fora do eixo para uniformizar a potência sobre o disco da Terra, e lóbulos laterais que não são de Airy. Existem diagramas medidos publicados e eles não são incluídos no repositório aqui, de modo que as ordenações e as ordens de grandeza se sustentam, mas o valor em dB de qualquer satélite isolado, não. UMA PRIMEIRA IMPLEMENTAÇÃO DESTA LINHA ESTAVA ERRADA DE UM MODO QUE VALE REGISTRAR: a expressão de Airy só é válida no hemisfério frontal, seu argumento varia como sin(theta) e, com theta perto de { "180" } graus, ela dá a volta e devolve o GANHO TOTAL NO EIXO atrás da abertura - de modo que os dois enlaces mais fortes do primeiro relatório eram satélites apontando suas antenas para longe da Lua, e eram os únicos dois que superavam o limiar. Atrás da abertura o modelo agora aplica um piso plano de lóbulo traseiro, declarado como um limite e não como uma forma de diagrama fabricada. Deliberadamente ausentes, cada um tornando o orçamento OTIMISTA: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda de polarização, de apontamento ou de implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA, não uma consulta a efemérides, porque a grandeza sob teste é o enlace e a geometria do feixe. Promover esta linha a validada exige um diagrama de transmissão medido e pontos normais do LuGRE para conferir; nenhum dos dois está no repositório e nenhum é inventado aqui. { "0.30" } rodada { "2" }, uma constatação (continua MODELLED): um caminho de enlace com entradas medidas (posições SP3 reais, potência de transmissão por bloco, diagramas de transmissão e de recepção tabulados, histerese de aquisição e rastreamento) foi conferido com a Tabela { "3" } de Montenbruck et al. { "2023" } para o GENESIS a { "6000" } km (fixada antecipadamente em 5b414f0a): as médias da antena no zênite concordam em { "5" } de { "6" } dentro de um dB da sensibilidade do artigo; as médias da antena no nadir são { "1.0" } a { "2.4" } satélites maiores do que as impressas, plausivelmente porque o artigo usou diagramas de lóbulos laterais do GPS dependentes do azimute que não são publicados. Os números à distância lunar desta linha ainda usam o substituto de Airy. { "0.30" }+ D7, uma constatação (continua MODELLED): a grandeza reformulada, a DIFERENÇA de C/N0 entre satélites Block IIR/IIR-M rastreados em uma época, prevista com os diagramas L1 medidos por SVN do NAVCEN (bidimensionais, no referencial de yaw-steering) contra o C/N0 de voo do LuGRE (fixada antecipadamente em 768cb62b: { "99" } % visíveis, RMS de pares <= { "3.0" } dB, mediana <= { "2.0" } dB, ao menos { "50" } registros e { "30" } pares) tem dados de menos: as { "26" } épocas qualificadas de trânsito e de órbita lunar contêm { "15" } registros rastreados de IIR/IIR-M (em sua maioria são rastreados IIF e III) e um par. Todos os { "15" } são previstos como visíveis e o resíduo do único par é -0.06 dB; nada é afirmado

# text
seg-29df5b40a3f9 = Determinação de órbita lunar: GNSS da Terra contra radiométrico em solo

# text
seg-647902ebcee3 = Determinação de órbita em uma órbita de halo quase retilínea (ou em uma órbita elíptica congelada) a partir de dois tipos de dados independentes: pseudodistâncias do GNSS da Terra recebidas a bordo (a regra de enlace da linha de GNSS da Terra à distância lunar, mais a ocultação pela Lua) e distância e taxa de distância bidirecionais em solo de três estações da Deep Space Network. Cada uma é um ajuste de mínimos quadrados em lote de um passo em torno da órbita de referência, com sua covariância formal; uma simulação de Monte Carlo com semente da diferença entre as duas estimativas testa se as duas covariâncias a explicam (q = d' (P_G + P_R)^-1 d, qui-quadrado com seis graus de liberdade quando os modelos coincidem) e o que uma aceleração não modelada faz com a estatística.

# text
seg-652bdc29deea = Resolução de ambiguidade de fase da portadora lunar: superfície e orbitador

# text
seg-02496f9e9af2 = Fase da portadora e código do GNSS da Terra em diferença simples entre receptores em uma estação de superfície lunar e em um orbitador, com a diferença de relógio por época eliminada por perfilamento, uma ambiguidade por passagem contínua e a passagem mais longa como gauge. A covariância da ambiguidade float é um complemento de Schur; o LAMBDA resolve os inteiros, a taxa por bootstrap é informada ao lado de uma taxa de sucesso de mínimos quadrados inteiros por Monte Carlo com semente e dos sigmas de posição float e fixa. Informado como encontrado: com os { "12" } dBi registrados, o problema de dupla diferença não é formável (a emenda { "1" } moveu o padrão para { "25" } dBi depois que apenas contagens de disponibilidade foram vistas), e com { "25" } dBi a fixação de inteiros NÃO é alcançada - fora de alcance (alguns por cento no máximo), embora a solução float melhore com o arco.

# text
seg-8d8296752eb8 = Uma resolução independente em numpy das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração inteira por força bruta (Q4). Nenhuma medição de fase da portadora de GNSS ou lunar é comparada. MODELLED.

# text
seg-11dd1bb8e4e1 = Co-estimação do referencial lunar: estações de superfície e orbitadores

# text
seg-a38c8d95e6c9 = Informação de Fisher do datum do referencial lunar de sete parâmetros a partir de telemetria a laser de estações da Terra para os cinco refletores isoladamente e com distâncias de orbitador a estação de superfície adicionadas: a matriz de informação, o posto, os sigmas de Cramer-Rao, a métrica de degenerescência do módulo de identificabilidade lunar e conjuntos aleatórios de estações com semente. A órbita é mantida conhecida nos eixos lunares (seu erro é carregado pelo sigma de distância do orbitador).

# text
seg-47d2afc53b3d = Uma diferença finita independente em numpy do modelo direto (F2). Nada é comparado com soluções reais de referencial lunar. O fator é condicional à órbita conhecida assumida e ao sigma de distância de { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Precisão do vínculo espacial de referenciais: GNSS, VLBI e telemetria a laser colocalizados

# text
seg-a9ae8e99f00d = Precisão de Cramer-Rao dos deslocamentos de translação, escala e rotação entre técnicas dos referenciais de GNSS, VLBI e telemetria a laser quando uma espaçonave carrega as três, com a posição da espaçonave eliminada em cada época e nove parâmetros de perturbação de vínculo local com um a priori, varridos sobre a acurácia do vínculo local. Covariâncias pela via da raiz quadrada (as equações normais perdem os dígitos quando as técnicas são quase perfeitas).

# text
seg-b37ac7294112 = Um sistema empilhado independente em numpy com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Nenhum dado de GRASP, Genesis ou de outra missão é comparado. MODELLED.

# text
seg-ae627996875e = Sensibilidade a números de Love lunares e à libração

# text
seg-28780d07c4a7 = Informação de Fisher de h2, k2, l2 e das amplitudes de libração física a partir de telemetria a laser (deslocamento de maré radial e horizontal, rotação do refletor), rastreamento de orbitador (a aceleração de k2 de grau 2 integrada ao longo da linha de visada, tendência removida), um gravímetro de superfície (fator gravimétrico { "1" } + h2 - { "1.5" } k2) e um relógio de superfície (taxa fracionária ({ "1" } + k2 - h2) W2/c2, vinculada às constantes de tempo lunar). Os valores nominais de h2 e l2 são pontos de linearização; o estudo diz o que é sensível a quê, não quais são os números.

# text
seg-180d74388339 = Uma montagem independente em numpy por diferenças finitas (G2) e uma avaliação em forma fechada (G4). A sensibilidade a k2 da família de orbitadores é um número de extremo superior (o estado da órbita absorve aqui apenas uma constante e uma tendência). Nenhuma medição de maré ou libração lunar é comparada; k2 é citado de Lemoine et al. { "2014" } como valor nominal. MODELLED.

# text
seg-da712b740519 = Aumento de DOP por faróis de superfície lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Diluição de precisão aumentada por faróis para um usuário na superfície lunar: as linhas de linha de visada dos satélites visíveis e as linhas de distância dos faróis de superfície visíveis são concatenadas em uma única matriz de projeto e avaliadas pelo kernel de DOP compartilhado, e o DOP resultante é mapeado em uma acurácia de 1 sigma realizada EM METROS por meio de um erro equivalente de distância do usuário por farol, montado como a raiz da soma dos quadrados dos termos de sincronização de relógio, multicaminho e levantamento. A visibilidade dos faróis é o horizonte geométrico de duas alturas da Lua sem atmosfera, que não tem extensão refrativa e é, portanto, exato e não aproximado. Executável como o tipo de cenário <c1/>, que informa só satélites, satélites mais faróis e uma constelação maior como a rota concorrente para a mesma geometria. MEASURED na geometria de referência incluída (usuário a -80 graus, três faróis levantados, LCNS ilustrativo de seis satélites em t={ "0" }, máscara de { "5" } graus): { "5" } satélites visíveis dão PDOP { "9.6941" } e um 1-sigma 3-D de { "11.222" } m; somar os faróis que de fato superam o horizonte dá PDOP { "4.1160" } e { "4.765" } m, um fator de { "2.355" }; o serviço de 24 satélites dá, em vez disso, PDOP { "2.4226" } e { "2.804" } m, um fator de { "4.002" }. O relatório imprime a contagem de faróis VISÍVEIS em vez da configurada, e nesta geometria apenas UM dos três faróis supera o horizonte: os dois locais laterais ficam a cerca de { "333" } km do usuário contra um horizonte de { "86" } km para uma antena de { "2" } m, de modo que o leitor nunca fica a supor que os três contribuíram

# text
seg-179fb996fc72 = A aritmética de DOP é o kernel crate::orbit::dop, validado externamente em separado em relação ao gnss_lib_py em tests/dop_reference.rs; esta linha não toma emprestado de novo o status daquela linha. O horizonte de visibilidade dos faróis é a forma fechada L01, e sigma = DOP x sigma_URE é a relação padrão de GNSS (Kaplan e Hegarty, Understanding GPS/GNSS, seção { "7" }). Dentro desta linha, o próprio aumento é conferido com um caminho de DOP independente no repositório e fixado a um golden versionado. POR QUE MODELLED: o projeto da constelação, a posição dos faróis, as alturas das antenas e as três magnitudes do orçamento de erro são entradas ilustrativas, não um levantamento de campo nem um enlace medido, de modo que os metros informados são uma propriedade de um cenário escolhido e não de qualquer serviço implantado. NOTA SOBRE PROCEDÊNCIA: esta capacidade era anunciada no README e exercitada por dois testes de validação, mas não tinha NENHUMA linha de matriz nem tipo de cenário, de modo que não podia ser alcançada por execução alguma. Estava afirmada em prosa, ausente do registro e inalcançável no motor, tudo ao mesmo tempo. A linha e o tipo de cenário foram adicionados juntos. { "0.30" } rodada { "2" } (fixada antecipadamente em db0eb9ec), bloqueada (continua MODELLED): a visibilidade do ANISE { "0.10.6" } e um DOP em numpy sobre a geometria da linha concordam (conjuntos visíveis exatos, incluindo { "72" } casos perto do horizonte e { "48" } perto da máscara; DOP dentro de { "7.2e-13" }), mas os metros informados são o DOP vezes um erro de distância em raiz da soma dos quadrados ilustrativo de { "1.158" } m, sem referência independente; o escopo que os excluiria aguarda uma decisão do proprietário

# text
seg-b0b618abf402 = Cegueira de integridade de modo comum

# text
seg-e732ac99a9ae = Divisão exata do subespaço de paridade de um erro de medição na parte que o RAIM não consegue ver e na parte que consegue. Para o modelo linearizado instantâneo y = G·x + e, qualquer erro dy se decompõe de forma única em um componente CEGO em range(G) — absorvido como erro de estado S·dy e anulado pelo projetor de resíduo Pperp = I − G·S, portanto invisível a QUALQUER teste de resíduo, e não apenas a um limiar particular — e um componente DETECTÁVEL no espaço de paridade. O módulo retorna o projetor, a divisão e a fração cega, de modo que um chamador pode quantificar quanto de um erro específico um monitor instantâneo é estruturalmente incapaz de informar. Aplicado ao piso real entre efemérides: a discordância de nível métrico DE440-vs-INPOP21a e DE440-vs-EPM2021 na posição geocêntrica da Lua é absorvida quase inteiramente como erro de posição do usuário (fração cega mediana { "1.000000" }; erro de posição cego mediano { "2.3955" } m e { "2.0050" } m) contra um resíduo de paridade no nível de { "1e-15" } m

# text
seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) recalcula a divisão de mínimos quadrados sobre entradas versionadas COM uma parte de paridade real (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), semente { "20261001" }) sobre a geometria de 8 satélites e um subconjunto de 6 satélites, { "1464" } casos sobre ambos os pares reais entre efemérides, fixado antecipadamente (f672a314): blind_dx, residual, blind_norm e detectable_norm dentro de { "1e-12" } relativo a |dy| e blind_fraction dentro de { "1e-12" } absoluto (pior blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). O numpy constrói o próprio G a partir das posições versionadas, enquanto o motor usa equações normais com Gauss-Jordan; uma inversa à esquerda oblíqua faz o teste falhar em { "5.5e-2" } |dy|. A emenda { "1" } (86c53301, após uma primeira execução, divulgada) relaxou apenas uma pré-condição de entrada sobre a fração de paridade (todo caso ao menos { "1e-3" } e { "95" } % de cada geometria ao menos { "0.05" }), não o limiar de concordância. Afirmação validada, como o P2 permite: a álgebra linear da divisão sobre essas entradas; as magnitudes do piso entre efemérides e a geometria lunar ilustrativa ({ "8" } nós do tipo LCNS a { "5000" } km) são entradas, não validadas, e a cegueira é uma propriedade conhecida de todo RAIM instantâneo. A comparação numpy da rodada 1 (tests/lunar_common_mode_integrity_reference.rs) verificou apenas a identidade S·G = I porque suas entradas estavam em range(G); é mantida como regressão. Procedência das efemérides: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Nível de proteção de modo comum e envelope total de integridade

# text
seg-ffc59a7ed497 = Álgebra analítica do projetor conferida com ela mesma: uma covariância confinada a range(G) deve dar um CMPL positivo, uma covariância confinada ao espaço de paridade deve dar aproximadamente zero, e o envelope deve somar duas contribuições ortogonais no espaço de medição. A covariância de modo comum, a geometria da constelação e k são entradas representativas modeladas, NÃO um orçamento certificado, e nenhuma afirmação é feita de que o limite triangular seja justo. NOTA SOBRE PROCEDÊNCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope são públicos e distribuídos, e seus testes unitários já eram citados pela linha de cegueira de modo comum, mas a AFIRMAÇÃO DO ENVELOPE em si não tinha linha — de modo que a única ressalva que a mantém honesta, a de que a soma é um limite triangular e não um RSS, não era declarada em lugar algum do registro. A linha registra a afirmação e a ressalva juntas.

# text
seg-5ed34a5b402e = OD conjunta multitécnica lunar + relógio

# text
seg-5ace1caff5a9 = Fusão em lote de VLBI + distância local lunar + distância entre satélites para recuperar posições e relógios de estações e de constelação

# text
seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq com LAPACK gelsd, numpy.linalg.inv; BSD-3) recalcula cada passo de Gauss-Newton, a solução convergida de mínimos quadrados ponderados, os sigmas formais e o erro de estação sobre os jacobianos e observações versionados de seis redes simuladas, fixado antecipadamente (5094bc31) em max({ "1e-8" }, { "100" } kappa eps) relativo. A primeira execução falhou na rede sem VLBI ({ "6.1e-7" } contra { "1e-8" }, uma inversa de equações normais com condição { "1.4e5" }); a correção do motor escrita após esse resultado (batch_ls::gauss_newton_qr, um passo de QR de Householder usado por estimate e formal_covariance) foi reexecutada com o limiar inalterado: passos { "1.1e-14" } a { "2.4e-11" }, sigmas no máximo { "1.3e-11" }. A afirmação validada é a álgebra linear da solução de fusão sobre essas entradas, não as magnitudes físicas da rede simulada nem seus modelos de observação: a linha de atraso de VLBI geodésico lunar continua MODELLED (seu caminho analítico difere do ANISE em até { "24" } µs), e os referenciais têm suas próprias linhas. A recuperação de uma verdade simulada injetada e a consistência NEES continuam verificações internas; a verificação cruzada anterior de Levenberg-Marquardt do Orekit { "12.2" } / Hipparchus (tests/lunar_joint_multi_technique_od_reference.rs) exercita batch_ls::gauss_newton, que estimate não chama mais, e é mantida como verificação dessa primitiva. Revisão { "0.30" }: os erros de estação padrão de lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m com VLBI e { "2183.119" } -> { "2183.558" } m sem (solução QR). Revisão { "0.36" } (STUDIO-15, matemática portátil; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m com VLBI e { "2183.558" } -> { "2184.021" } m sem, e a solução sem VLBI para após { "5" } iterações, não { "2" } (uma parada limitada por arredondamento na rede mal condicionada); a comparação fixada antecipadamente foi reexecutada sobre entradas reexportadas com o limiar inalterado (numpy { "2.4.6" }, as seis redes passam)

# text
seg-69fbe488dec5 = Informação de Fisher e observabilidade de Cramér–Rao

# text
seg-043d4c7a2d6a = Informação de Fisher M=HᵀWH, limite inferior de Cramér–Rao, posto de observabilidade / espaço nulo do defeito de datum (pseudoinversa de Moore–Penrose) e escalares de projeto de experimento ótimos D/A/E/T obtidos de um solucionador simétrico de autovalores de Jacobi

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, baseada em LAPACK) — uma referência independente de terceiros que calcula os mesmos autovalores definidos de forma única, a covariância de Cramér–Rao σ²(XᵀX)⁻¹ e os fatores de diluição de precisão do GNSS por um algoritmo diferente (divisão e conquista do LAPACK + LU) daquele da varredura cíclica de Jacobi e da pseudoinversa espectral do Kshana; concordância até { "1e-9" }. A mesma classe de biblioteca externa já valida o motor de DOP (em relação à gnss_lib_py) e os núcleos de χ²/erf (em relação ao SciPy). Verificado adicionalmente em relação aos CRLBs de forma fechada de Kay ({ "1993" }) e à obtenção do CRLB por Monte Carlo (interna)

# text
seg-e4ec41d0f5e1 = Observabilidade absoluta de estações lunares (defeito de datum)

# text
seg-b3e4160042d2 = Observabilidade, pela informação de Fisher, da solução lunar conjunta: sem linhas de base com a Terra, o datum do referencial absoluto fica no espaço nulo de HᵀWH (a posição da estação é inobservável); ≥{ "3" } linhas de base restauram o posto completo e limitam o erro de Cramér–Rao da estação, que o estimador atinge

# text
seg-238597f6aa01 = Estrutura analítica do defeito de datum — o modo inobservável do referencial absoluto fica no espaço nulo da informação de Fisher (forma fechada), o limiar de posto coincide com a justificativa de projeto publicada para 3 estações, e o estimador atinge o CRLB resultante em Monte Carlo. A geometria lunar em si é uma rede representativa (não uma efeméride de voo), portanto a linha permanece MODELLED; o motor de FIM/CRLB subjacente é verificado separadamente em relação às formas fechadas de Kay ({ "1993" }). { "0.30" } rodada { "2" } (pré-registrada fab02df9), bloqueada (permanece MODELLED): NumPy/SciPy recalculam o posto e o defeito no limiar declarado de { "1e-9" }, a parcela dos eixos da estação no espaço nulo (dentro de { "8.4e-10" }) e o CRLB da estação (dentro de { "1.2e-10" }) em { "17" } configurações confirmadas geradas pelo Kshana (P2). Não promovida: a afirmação de que o estimador atinge o limite (eficiência de Monte Carlo de cerca de { "0.98" }) não tem referência independente, e a delimitação que a deixaria MODELLED aguarda uma decisão do responsável

# text
seg-ae4b71d54dfa = Ajuste de datum de Helmert de 7 parâmetros + amarração de orientação ICRF a partir de uma rede de pontos

# text
seg-9e434924b34c = Solucionador independente de forma fechada de transformação de similaridade de Umeyama (Horn) ponderada (baseado em SVD do numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — um algoritmo diferente do ajuste iterativo de Gauss–Newton do kshana, que chega ao mesmo ótimo de mínimos quadrados ponderados definido de forma única em redes de pontos idênticas byte a byte

# text
seg-4bcec6e2dd9f = Volume de serviço de navegação lunar

# text
seg-dba98ad5df1c = DOP / cobertura / disponibilidade lunares de classe Moonlight + níveis de proteção de ARAIM lunar generalizado ao longo de um volume de serviço

# text
seg-7e981d90a806 = Referência independente de terceiros: propagador kepleriano astro::Orbit do ANISE { "0.10.2" } (Nyx Space, MPL-2.0) — um caminho de código bi-corpo equinocial distinto do Kepler por Newton-Raphson do kshana; a posição MCI por satélite concorda em menos de { "1e-3" } m e a contagem/conjunto derivado de satélites visíveis coincide exatamente em todos os pontos da grade. O núcleo de DOP é validado pela gnss_lib_py; a integridade usa parâmetros publicados do LunaNet/LCNS

# text
seg-2ed7181c97dd = Geração dos códigos de espalhamento do LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Os códigos do Augmented Forward Signal do LSIS V1.0 ({ "29" } de janeiro de { "2025" }): o primário de 10230 chips do AFS-Q, gerado a partir da construção do piloto L1C do IS-GPS-800 com os índices do IS-GPS-800J (as mesmas { "210" } atribuições que o Apêndice D do LSIS imprime), os códigos Gold de 2046 chips do AFS-I, gerados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } e g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, com o atraso de G2 de cada PRN recuperado do arquivo do Anexo { "3" } da norma, os quatro códigos secundários, os códigos terciários de 1500 chips, a atribuição provisória de nós da Tabela { "11" } e o código piloto em camadas. O conteúdo do LSIS é lido em tempo de execução a partir de um cache local verificado por SHA-256, preenchido a partir do PDF hospedado pela NASA, nunca redistribuído

# text
seg-dc1dd144b107 = Referência: os valores que o LSIS V1.0 imprime para validação (Tabelas C-1 a C-5, D-1 a D-6, E-1 a E-6) e seus arquivos eletrônicos de código do Anexo { "3" }, sob um critério de zero divergências fixado antes da comparação. O critério não é atingido por causa de uma célula impressa que é internamente inconsistente com o próprio arquivo do Anexo { "3" } da norma, portanto a linha permanece MODELLED; uma nota de errata está redigida. Os mesmos chips também são iguais aos do LANS-AFS-SIM (linha 'Renderização em banda base do LunaNet AFS em relação a um gerador independente, dado o seu estado de canal')

# text
seg-ea20909686ea = Renderização em banda base do LunaNet AFS em relação a um gerador independente, dado o seu estado de canal (LSIS V1.0)

# text
seg-c0f021c38842 = O núcleo de renderização da banda base do AFS (LSIS-130: envoltória complexa I + jQ, I = o código Gold do AFS-I vezes o quadro de { "500" } símbolos/s a { "1.023" } Mchip/s, Q = o piloto em camadas do AFS-Q a { "5.115" } Mchip/s, rotação da portadora, alinhamento de chip e de símbolo) reproduz as amostras de um gerador independente quando conduzido pelo próprio estado de canal registrado por esse gerador (fases e taxas de código, fase e frequência da portadora, amplitude por canal). Não coberto: o modelo de nó que deriva esse estado a partir de um Doppler, um atraso e uma densidade de portadora para ruído, a divisão de potência 50/50 calculada a partir da densidade de portadora para ruído (as amplitudes são tomadas do simulador) e os metadados SigMF e a gravação de amostras de 8 bits

# text
seg-dd1142957a05 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, compilação para banda S, executada como programa separado); as amostras do Kshana são conduzidas apenas pelo estado de canal registrado do simulador, e uma compilação com rastreio somente de impressão é verificada como idêntica byte a byte à não modificada. Limiares fixados antes da execução: zero divergências de chip e de símbolo, |rho| >= { "0.999" } ao longo da execução e >= { "0.99" } por bloco de { "2" } ms, fase dentro de { "0.05" } rad. Amplitudes I e Q iguais são uma entrada da comparação, portanto a divisão de potência não é testada por ela. O LANS-AFS-SIM lê seus códigos terciários do arquivo do Anexo { "3" } do LSIS, portanto essa parte não é independente da linha dos códigos. LANS-AFS-SIM e PocketSDR-AFS têm o mesmo autor e contam como uma única implementação independente. Condicionada a dados: a comparação com o LANS-AFS-SIM precisa do cache local do LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificado por SHA-256) e, sem ele, é ignorada com um aviso

# text
seg-5d79da539912 = Codificação de canal do quadro FID { "0" } do LunaNet AFS (LSIS V1.0)

# text
seg-6ed2b4c792e6 = O quadro FID { "0" } de { "12" } s e 6000 símbolos do LSIS V1.0: padrão de sincronização de 68 símbolos, subquadro { "1" } BCH ({ "51" }, { "8" }) (gerador octal 763), CRC-24 (({ "1" } + X)·P(X)) nos subquadros 2-4, codificação LDPC de taxa 1/2 com os A, B^-1, C, D impressos (Anexo { "1" } do LSIS, lido em tempo de execução a partir do cache local verificado por SHA-256) e a perfuração da norma, entrelaçador de blocos { "60" } x { "98" }; um decodificador exaustivo do subquadro 1 que sinaliza um TOI fora de { "0" }..99, e um decodificador LDPC min-sum normalizado escrito apenas a partir de H = [[A, B, { "0" }], [C, D, I]]

# text
seg-46879e2e8ab5 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), cujos próprios BCH, CRC, LDPC e entrelaçador produzem quadros idênticos símbolo a símbolo aos do Kshana para o mesmo conteúdo (zero divergências, limiar fixado antes da execução). Corroborada por valores de referência: o exemplo trabalhado de BCH da Figura { "8" } do LSIS V1.0 e o valor de verificação do CRC-24/LTE-A (catálogo de algoritmos CRC parametrizados de Greg Cook), ambos exatos ao bit; e pelo PocketSDR-AFS decodificando cada subquadro dos quadros que sincronizou em três execuções, com CRC válido e bits do subquadro 2 coincidentes. O teste de verificação de paridade é quase uma identidade interna (confirma que o B^-1 impresso inverte o B impresso) e não é contado como referência independente. Condicionada a dados: a comparação com o LANS-AFS-SIM precisa do cache local do LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificado por SHA-256) e, sem ele, é ignorada com um aviso

# text
seg-56c7aeac59c1 = Decodificabilidade em malha fechada do LunaNet AFS por um receptor independente (LSIS V1.0)

# text
seg-da2d29d437b0 = Uma gravação AFS do Kshana adquirida, rastreada e decodificada por um receptor de software independente e comparada com os rótulos de verdade da própria gravação. Isso demonstra apenas a aderência à norma e a consistência dos rótulos; não é uma afirmação sobre a física do canal, a propagação, a potência recebida ou os orçamentos de enlace, cujos valores na gravação são entradas escolhidas

# text
seg-8211583afc64 = Biblioteca: PocketSDR-AFS (T. Ebinuma a partir do PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, compilação para banda S, cópia com nível de log somente de impressão), sob critérios fixados antes de cada execução. A terceira comparação pré-registrada atinge integralmente seus limiares de decodificação e de rastreamento C1 e C2, mas não sua salvaguarda G0 como escrita (duas execuções do receptor não modificado diferem nos mesmos quatro registros de aquisição), e a segunda errou por { "5" } violações, portanto a linha permanece MODELLED. LANS-AFS-SIM e PocketSDR-AFS têm o mesmo autor e contam como uma única implementação independente; as verificações de vetores impressos da linha de codificação de quadro protegem contra uma leitura equivocada compartilhada

# text
seg-780369fb9a54 = Aderência à norma do GPS L1 C/A entre geradores

# text
seg-ee47b60515f1 = Códigos de espalhamento do GPS L1 C/A (sdr::CaCode) e subquadros LNAV 1-3 (gps_lnav: quantização dos campos do IS-GPS-200 com o pi da especificação, empacotamento em complemento de dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução de paridade das palavras { "2" } e { "10" }) comparados bit a bit com o gps-sdr-sim em seu brdc0010.22n incluído ({ "32" } satélites)

# text
seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, executado como programa separado por meio de um harness confirmado), pré-registrado f88f2969 com um limiar exato ao bit em (A) chips C/A, (B) todo campo LNAV calculado, (C) todo bit de paridade. RESULTADO: (A) { "0" } de { "32 736" } chips diferem, (C) a paridade de { "0" } de { "1 920" } palavras difere, (B) { "230" } de { "1 152" } campos calculados diferem em uma unidade: o eph2sbf do gps-sdr-sim trunca em direção a zero com conversões de C onde o inteiro transmitido exige arredondamento (todo valor divergente fica a menos de { "0.01" } de uma unidade do inteiro arredondado do Kshana). Permanece MODELLED: o limiar registrado era a conjunção

# text
seg-325900ed59ea = Geometria de sinal da cena IQ GNSS em relação a um gerador de banda base independente

# text
seg-ee5625b30ff2 = A verdade por satélite do gerador de cena IQ para uma cena GPS L1 C/A de efemérides de transmissão (iq::scene: uma SatGeometry de efemérides de transmissão, gerada em registros de verdade TruthRecord): quais satélites estão acima do horizonte, a pseudodistância, a fase do código na primeira amostra, o Doppler da portadora e os ângulos de visada, para um receptor estático, comparados com o estado de canal a partir do qual o gps-sdr-sim constrói o primeiro bloco de sua própria saída I/Q, para as mesmas efemérides, o mesmo receptor e o mesmo instante inicial (ionosfera desligada nos dois lados)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), um gerador independente de banda base GPS L1 C/A, compilado com seu próprio Makefile e executado como programa separado em seu brdc0010.22n incluído, no local de exemplo do texto de uso (scripts/gen_iq_gpssdrsim_ref.sh); um harness confirmado, ligado à mesma compilação, imprime o estado de canal (computeRange, computeCodePhase) por trás do primeiro bloco do programa. Limiares fixados antes de o gerador ser executado (pré-registrado 7777da53). Escopo: geometria GPS L1 C/A para um receptor estático sem ionosfera, troposfera nem relógio do receptor; os modelos de canal, o ruído e o conteúdo de dados de navegação da cena não fazem parte desta linha

# text
seg-bf429c8f00fb = Aquisição IQ GNSS em amostras I/Q geradas de forma independente

# text
seg-9a0c52bfb06e = iq::acq::acquire (busca paralela de fase do código por FFT com o limiar Marcum-Q de lei quadrática) com a réplica GpsL1Ca, em { "20" } ms da própria saída I/Q de 8 bits do gps-sdr-sim decodificada pelo decodificador de amostras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sem ruído): cada PRN de { "1" } a { "32" } pesquisado em duas janelas de { "10" } ms, com o resultado comparado à fase do código e ao Doppler que o gps-sdr-sim modulou

# text
seg-fb96290003e1 = Amostras I/Q do gps-sdr-sim (MIT, commit 28ca29a6) e seu próprio estado de canal, pré-registrado 7777da53: (B1) todo PRN simulado adquirido, (B2) nenhum outro PRN adquirido, (B3) fase do código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. RESULTADO: B1, B3 e B4 valem nas duas janelas (pior caso { "0.195" } chip, { "72" } Hz), mas B2 falha: todos os { "21" } PRNs que o gps-sdr-sim não simulou também cruzam o limiar (estatística de { "151" } a { "206" } contra { "79.5" }; PRNs simulados de { "1 300" } em diante). O limiar é definido para ruído gaussiano da potência de amostra medida; o gps-sdr-sim não adiciona ruído, de modo que as células de um PRN ausente contêm a correlação cruzada dos outros satélites. Permanece MODELLED: o limiar registrado era a conjunção

# text
seg-f40dc3dac990 = Monitores IQ avaliados em campanhas de reprodução em laboratório: detecção, perdas, falsos alarmes e valores de falso alarme em forma fechada

# text
seg-93fb3109728c = iq::campaign::detect e o executor de campanhas: uma tabela opcional [monitors] executa os monitores IQ em cada célula na passagem única do executor. Os monitores de potência e de espectro veem as amostras após cada cadeia de front-end; os monitores de C/N0, SQM e de travamento veem as atualizações de malha de cada canal rastreado. Cada alarme é avaliado em relação aos eventos declarados: detectado ou perdido por (evento, tipo de alarme, canal), tempo até a detecção e falsos alarmes fora dos eventos ao longo de sua exposição. O valor de falso alarme em forma fechada de cada teste é declarado: potência por bloco (cauda Gama exata), excesso espectral por bloco (aproximação), curtose (gaussiana unilateral), pulsos (teto binomial), SQM por atualização média (2Q(k) = Q(1/2, k^2/2), novo) e o ARL0 do CUSUM de C/N0 (Siegmund). Sem a tabela, células, chaves e resumos permanecem inalterados. Nenhuma forma de onda de interferência é sintetizada

# text
seg-4c4fff313585 = As próprias formas fechadas dos monitores em cenas GPS L1 C/A do próprio Kshana (ruído e sinais legítimos; eventos de atenuação dos sinais dos próprios satélites), em relação a limiares pré-registrados em docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). RESULTADO: M1, M2 e M4 atingidos. M3 atingido na detecção ({ "18" } de { "18" } atenuações, P_md { "0" }) e NOT MET em sua cláusula de temporização: o tempo mediano até a detecção é { "1.001" } s contra { "2" } x ARL1 amostras = { "0.433" } s. O CUSUM vê uma estimativa por janela de { "1" } s, de modo que o limite em número de amostras fica abaixo de uma amostra. Apenas consistência interna: nenhum receptor real nem interferência gravada é verificado

# text
seg-5b7eb7ddb474 = ROC de detecção dos monitores IQ a partir de uma campanha de reprodução em laboratório avaliada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada célula de uma campanha com monitores mantém, por tipo de alarme e canal, o máximo da estatística de teste do próprio monitor em cada janela de evento declarada (positivo) e em janelas roc_window_s ladrilhadas fora dos eventos (negativo). As estatísticas são o desvio da potência de bloco, o excesso de PSD, a curtose z, o |z| do SQM da métrica média e o CUSUM de C/N0. O relatório as agrupa por tipo em uma ROC empírica em nível de janela com sua AUC e o ponto de operação no limiar configurado, gravada como roc.json (kshana.campaign-roc/1) e uma seção Detection ROC do report.html. Uma campanha sem monitores não grava nenhum dos dois

# text
seg-e882dd678998 = Campanhas sintéticas a partir de cenas GPS L1 C/A do próprio Kshana (atenuações dos sinais dos próprios satélites), em relação a limiares pré-registrados em docs/design/DETECTION-ROC.md (b47e358d). RESULTADO: R2 atingido (nível de acaso quando não há nada a detectar). R1 NOT MET: AUC de cn0_drop { "0.7855" } contra { "0.95" }, porque toda janela negativa após um evento herda o decaimento do CUSUM a partir da detecção (todos os { "18" } negativos pós-evento chegam a { "81" } ou mais; todos os { "18" } pré-evento permanecem em { "0" }). Apenas consistência interna: nenhum receptor real nem interferência gravada é verificado

# text
seg-3a3cfa322f01 = Calibração dos modelos de C/N0 e de travamento do receptor aberto a resultados de campanhas IQ, com erro de predição declarado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) e <c1/> em <c2/>, o <c3/> do Python e a ferramenta labfit do MCP (apenas pastas de campanha dentro de seu diretório de trabalho): lê uma pasta de saída de <c4/> por seu DIGEST e agrupa as células avaliadas em unidades de ajuste (sinal x projeto de malha x cadeia de front-end x tipo de interferidor, nunca agrupados). Por unidade, ajusta o C/N0 medido ao J/S declarado com a forma de separação espectral. O Q_eff não é identificável a partir de dados de C/N0 sem uma medição independente das potências do interferidor e do sinal, portanto o Q é declarado, nunca ajustado (a tabela de tipos, o q do evento ou, para um tipo desconhecido, o valor declarado mais danoso, cw Q = { "1" }). O parâmetro ajustado é o deslocamento identificável delta_eff = delta - { "10" } log10 Q, com a salvaguarda de correlação relatando a degenerescência. Os intervalos de C/N0 travados em menos de { "90" } % são censurados e listados. O J/S limiar é dado diretamente e pela forma fechada; os modelos de malha de rastreamento e de travamento empírico são acoplados pelo modelo de C/N0, com tempos de permanência de queda e de retravamento. Um bootstrap de agrupamentos com semente sobre as gravações ({ "1000" } réplicas) fornece intervalos por percentis; intervalos de predição de { "90" } % vêm de sorteios de resíduos; as retenções leave-one-recording-out são divididas em interpolação e extrapolação; uma tabela [validation] pré-registrada recebe um hash e cada limiar é julgado PASS/FAIL. Relatório kshana.labfit-iq/1 em JSON, CSV e Markdown gerado, com um bloco de unidades. Somente sintético (nenhuma gravação de terceiros, nenhuma forma de onda de interferidor). O caminho de labfit por registro do receptor permanece inalterado

# text
seg-f9abecb1eea6 = Recuperação sintética de parâmetros em cenas GPS L1 C/A do próprio Kshana com um perfil de C/N0 conhecido imposto a partir da fórmula da seção { "3.1" }, rastreadas e avaliadas por kshana iq campaign, em relação a limiares pré-registrados em docs/design/LABFIT-FROM-IQ.md (seção { "5.1" }, emendada em 2026-10-12 em b7117bf, seção { "13" }). O estimador de C/N0 das campanhas (M2M4) foi fixado em 5b13e3c2, enviado antes da primeira avaliação de limiar (confirmado junto com o código de ajuste, não isoladamente), após uma execução de rastreamento de diagnóstico divulgada. RESULTADO na campanha de limiar de 18 eventos: (c) PASS; (a') NOT MET, erro de delta_eff de -1.097 dB contra { "0.5" } dB (ainda -0.89 dB nos intervalos a { "38" } dB-Hz e acima); (b') NOT MET, { "0" } de { "50" } campanhas cobrem a verdade (erro -1.189 +/- { "0.093" } dB, intervalo de cerca de { "0.3" } dB); (d) NOT MET, forma fechada { "2.20" } dB abaixo do J/S direto na perda, cerca do tempo de permanência de queda ajustado vezes a taxa de rampa ({ "2.09" } dB); as cláusulas originais de Q de (a) e (b) são NOT MET porque o Q não é identificável. ACOMPANHAMENTO (limiares pré-registrados em 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): em uma campanha de J/S em degraus, delta_eff é recuperado dentro de +{ "0.185" } dB (S1 MET: o erro da rampa é defasagem do estimador); (d) como escrito nela é atingido pelo modelo de malha de rastreamento ({ "0.45" } dB), mas não pelo empírico ({ "6.42" } dB), portanto S2 é NOT MET; em uma nova campanha de rampa, (d) com os tempos de permanência de queda ajustados mais a taxa de rampa de cada evento fica dentro de { "1" } dB para ambos os modelos (R1 MET), e (a') e (d) como escritos erram de novo (-1.25 dB; { "2.32" } e { "9.47" } dB). O método é verificado, não qualquer receptor: ele não pode ser VALIDATED a partir de dados sintéticos

# text
seg-9537d301c95e = Codificação GPS LNAV decodificada por uma biblioteca de receptor independente

# text
seg-909415621881 = Subquadros LNAV 1-3 do Kshana (gps_lnav::encode_subframes) para as efemérides { "32" } brdc0010.22n, fornecidas ao decode_word e ao decode_frame do RTKLIB: paridade de cada palavra, decodificação de subquadros com emissão de dados consistente e cada parâmetro decodificado em relação ao inteiro do Kshana e ao valor de entrada

# text
seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame como programa separado, pré-registrado ca5f0142: R1 paridade e decodificação, R2 valor decodificado igual ao inteiro do Kshana vezes a escala do IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de meio quantum do valor de entrada. RESULTADO: R1 { "960" } de { "960" } palavras e { "96" } de { "96" } subquadros; R3 todo parâmetro, semana e instantes de referência exatos; R2 falha em { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades na última casa porque o P2_43 do RTKLIB é o decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo a partir de { "2" }^-43; dividir pela constante do RTKLIB devolve o inteiro do Kshana em todos os casos. Permanece MODELLED: o limiar R2 registrado era apertado demais para a constante da própria referência independente

# text
seg-f66855e35c53 = Codificação da mensagem de navegação GPS LNAV

# text
seg-8caf8366e2f8 = Subquadros LNAV 1-3 do IS-GPS-200 (gps_lnav::encode_subframes: quantização por arredondamento ao mais próximo de cada parâmetro de relógio e de órbita nos fatores de escala da especificação e no valor de pi, empacotamento em complemento de dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução de paridade das palavras { "2" } e { "10" }), a mensagem que um gerador de sinal GPS L1 C/A transmite

# text
seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx analisando o arquivo de transmissão diário do IGS BRDC00IGS_R_20250610000_01D_MN.rnx e decode_word/decode_frame decodificando as palavras do Kshana, executado como programa separado; pré-registrado d4d9eb9d antes de o arquivo ser obtido, limiar de inteiro exato. Mutação: truncar em vez de arredondar produz { "235" } falhas. Comparações anteriores do mesmo codificador estão registradas como resultados: contra o gps-sdr-sim, que trunca ({ "230" } campos), e contra os valores escalados do RTKLIB, cuja constante decimal { "2" }^-43 errou um limiar de um ulp ({ "41" } valores). Pós-verificação do integrador (permanece MODELLED): a comparação concorda e uma mutação do conjunto de paridade também a deixa vermelha, mas o pré-registro d4d9eb9d chegou ao ramo público às { "20" }:{ "02" }:{ "29" } UTC, dois segundos depois do commit de resultado 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), que já contém a saída do RTKLIB para o arquivo, de modo que a ordem 'registrado antes de o arquivo ser obtido' não pode ser demonstrada; um novo registro enviado antes de um arquivo de transmissão não visto ser obtido resolveria a questão

# text
seg-c5c944357643 = Aquisição e estimativa de C/N0 em IQ lunar real

# text
seg-f5dcb5e06bf4 = Busca paralela de fase do código (acquisition::pcps_acquire: FFT portátil, dobramento coerente, acumulação não coerente, limiar de qui-quadrado para uma probabilidade de falso alarme em toda a busca), refinamento, correlação prompt em malha aberta com Doppler de código e o estimador de C/N0 M2M4, executados nos lotes IQ de 4 bits do LuGRE L1 lidos por meio de realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, programa separado, configuração fixada) nos nove lotes L1 fora da superfície e no C/N0 RAW do receptor de voo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), pré-registrado 768cb62b. RESULTADO: o leitor do Kshana decodifica todos os { "288" } trechos comparados de forma idêntica a um conversor independente; o GNSS-SDR declara { "266" } de { "288" } buscas positivas e o Kshana concorda em todas as { "266" } decisões, mas apenas { "250" } são localizadas na célula do GNSS-SDR (A2 falha); o ramo de C/N0 é vazio, pois nenhuma época RAW de voo fica a menos de { "30" } s de qualquer lote (a mais próxima, { "141" } s). A maioria dos positivos são artefatos: os níveis nus em complemento de dois trazem uma média de -0.5 em I e Q, uma linha de frequência zero { "32" } dB acima do ruído em um intervalo de { "1" } kHz, que ambos os receptores adquirem. Dois lotes (OP5, OP12) foram excluídos por engano: uma leitura de seus metadados sem os dígitos foi tomada por uma contradição com seus cabeçalhos; a causa real era que o leitor não conseguia ler uma amostra mais larga que uma palavra (já corrigido). Permanece MODELLED

# text
seg-709626569a5c = Aquisição em IQ lunar real em relação ao Doppler previsto pela órbita (decisão por potência da amostra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire com sua decisão por potência da amostra nos nove lotes L1 do LuGRE fora da superfície com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com diferenças previstas a partir das órbitas finais da ESA e da trajetória do Blue Ghost reconstruída pela Firefly

# text
seg-38b8127db267 = Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída CLPS da NAIF (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registrado 0d1839d2. RESULTADO: todas as { "288" } buscas cruzam o limiar sobre ruído (estatísticas de potência da amostra de cerca de { "430" } a { "520" } contra { "346.3" }), portanto P1 vale de modo trivial e P3 vale ({ "274" } de { "288" } previstos como visíveis), enquanto P2 falha em { "4033" } de { "4036" } pares. O front-end de banda limitada eleva o ruído de cada célula em cerca de { "1.46" } vez (fixado: piso de ruído { "292" } contra o ruído branco { "200" } no OP2 PRN { "1" }), o que a estatística de potência da amostra não vê. Permanece MODELLED

# text
seg-89875d67b253 = Aquisição em IQ lunar real avaliada pelo Doppler previsto pela órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire com a decisão por média de células (pico sobre a célula média da grade, robusta a ruído de banda limitada) nos nove lotes L1 do LuGRE fora da superfície com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com diferenças previstas a partir das órbitas finais da ESA e da trajetória do Blue Ghost reconstruída pela Firefly

# text
seg-f80a751bc49b = Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída CLPS da NAIF (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registrado a81a9a4e. RESULTADO: P1 e P3 valem ({ "4" } lotes, { "12" } de { "12" } aquisições previstas como visíveis), mas P2 falha em { "8" } de { "8" } pares. Os dois pares mais fortes coincidem com a previsão em módulo, com o sinal invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medido, -7693.9 previsto; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), de modo que a ordem registrada de I no nibble baixo é o conjugado dos lotes; as seis detecções logo acima do limiar não coincidem com nenhum dos sinais. A dispersão de Doppler do refinamento ({ "30" } a { "50" } Hz entre duas execuções) também foi subestimada pelo registro. Permanece MODELLED

# text
seg-8fa779dd1788 = Aquisição em IQ lunar real reservado em relação ao Doppler previsto pela órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisão por média de células, probabilidade de falso alarme { "1e-7" }) com refine_doppler_coherent nos lotes L1 do LuGRE gravados na superfície lunar (I no nibble alto, níveis mid-rise); diferenças de Doppler entre satélites adquiridos contra diferenças previstas a partir das órbitas finais da ESA e do kernel do local de pouso da Firefly

# text
seg-8bfd18bb6478 = Doppler previsto a partir das órbitas finais ESA/ESOC e do kernel do local de pouso da Firefly do NAIF CLPS (xval/lugre-predicted-doppler/predict_surface.py, independente do Kshana), pré-registrado 2108e6ff em lotes nunca abertos antes. RESULTADO: a não vacuidade falha; nenhum lote contém duas aquisições. OP40 excluído (os metadados nomeiam um arquivo ausente); OP38, OP73, OP77_0, OP77_1 não adquirem nada e não mostram falso alarme em { "1e-7" } (estatísticas máximas de { "325" } a { "356" } contra { "385.9" }); OP74 e OP76 adquirem o PRN { "31" } e OP78_0 e OP78_1 o PRN { "12" }, cada um isolado, todos previstos como visíveis. Permanece MODELLED. Desvios divulgados: o limiar de Doppler de { "10" } Hz registrado se apoia em um Monte Carlo sintético do refinamento coerente, e não na dispersão dos lotes já vistos que o integrador pediu; OP40 foi excluído antes da execução porque seus metadados nomeiam um arquivo de amostras que o conjunto de dados não fornece

# text
seg-758af035b3ce = Geometria conjunta de comunicações e navegação lunar

# text
seg-11f861bdc6bf = Ângulos de visada topocêntricos por satélite (azimute no sentido horário a partir do norte, elevação) e distância oblíqua em um local selenográfico nomeado, dado o satélite no referencial fixo à Lua do local (a afirmação validada). A exatidão de telemetria do sinal no espaço é exposta como parâmetro de cenário, de modo que a varredura do volume de serviço produza um REQUISITO de telemetria, e não um resultado de sucesso/falha em um sigma fixo; esse parâmetro é uma entrada de projeto fora da afirmação validada

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, executado como ferramenta a partir de xval/anise-service-geometry, binário lunar-look-angles-xval, que não chama nenhum código do Kshana): a própria rotina de azimute, elevação e distância do ANISE (azimuth_elevation_range_sez) a partir de locais construídos por seu construtor de latitude-longitude-altitude na Lua pck00011 (esfera de { "1737.4" } km), com os satélites rotacionados para MOON_PA_DE440 por meio de moon_pa_de440_200625.bpc. { "768" } amostras em { "8" } locais (os { "4" } locais nomeados e { "4" } outros, acima e abaixo do horizonte), { "12" } épocas e { "8" } satélites concordam dentro de { "1e-6" } grau em azimute e elevação e de { "1" } mm em distância e posição do local (fixado antes da comparação); medido { "2.2e-12" } grau, { "2.1e-13" } grau e { "5.6e-9" } m. Afirmação: posicionamento do local e ângulos de visada dado o satélite no referencial fixo ao corpo do local. A realização própria do Kshana do referencial fixo à Lua por rotação média e o parâmetro de exatidão de telemetria ficam fora dela; os testes unitários de geometria em forma fechada permanecem como verificações de apoio

# text
seg-10af60b488b9 = Estação de referência diferencial de classe NovaMoon: cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS

# text
seg-96b2627b388a = Identidade de cancelamento diferencial de erro + reutilização da maquinaria de PL do SBAS do DO-229E; a solução por diferença simples + WLS é verificada adicionalmente em relação ao lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de solucionador independente, mas com a mesma álgebra de primeira ordem da diferença de LOS, portanto ainda InternalConsistency

# text
seg-c04a3591074c = Exportação de interoperabilidade lunar

# text
seg-91f4a066b3c0 = Exportação de referencial lunar + tempo + efemérides alinhada ao LunaNet/IOAG (CCSDS OEM + KIF) com ida e volta e aderência à norma

# text
# c1: oem
seg-f5f8ed69bea7 = A exportação OEM lunar do kshana relida pela biblioteca <c1/> independente de terceiros (R. J. Anderson): os tokens de referencial/tempo e o estado por época concordam até a precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — uma ida e volta estrutural de intercâmbio; a semântica física do referencial/tempo lunar é validada por suas próprias linhas, portanto esta permanece MODELLED. { "0.30" } comparação externa, um resultado (permanece MODELLED): um segundo leitor independente, o analisador CCSDS OEM do Orekit { "12.2" } (Apache-2.0, padrões estritos), recusa os dois arquivos lunares porque não implementa os sistemas de tempo LTC e TCL (ele decodifica o OEM EME2000/UTC do crate e decodifica os arquivos lunares quando TIME_SYSTEM é substituído por TDB); o oem { "0.4.5" } os decodifica dentro da precisão escrita apenas recorrendo ao sistema de tempo não suportado. O intercâmbio desses arquivos lunares com leitores CCSDS convencionais não está estabelecido

# text
seg-8ab65cbefb75 = Pontuação de resiliência de PNT alinhada a referenciais

# text
seg-c48198f31d63 = Subpontuações por dimensão sobre as sete categorias de resiliência próprias do Kshana (não termos do DHS), funções RDRR do RethinkPNT e critérios de Yang, cada uma marcada como modelada com seu fator determinante; Nível RPCF provisório com uma porta de degradação limitada. Autoavaliação derivada de simulação, nunca uma certificação.

# text
seg-f905aeb203bb = Fórmulas por métrica derivadas à mão: diversidade de Simpson inversa, composto de média ponderada, durações de linha do tempo limitadas/ilimitadas, escada de Níveis pelo elo mais fraco

# text
seg-d7bdb6fe186e = Estudo de instabilidade de decisão da pontuação de resiliência

# text
seg-5fcf18a68bb1 = Quantifica como uma única pontuação composta / Nível RPCF reordena arquiteturas sob um simplex de ponderação defensável e um conjunto de ameaças (taxa de inversão do top-1, dispersão do tau de Kendall, taxa de inversão de Nível, intervalos de classificação); análises de declarado versus medido e de colapso de diversidade.

# text
seg-b6bf76a752a0 = Identidades de estatística de postos em forma fechada (tau em [-1,{ "1" }] com valores calculados à mão; Dirichlet determinístico com semente) e testemunhas estáveis/instáveis construídas

# text
seg-1bf03544a010 = Representatividade da demonstração e lacunas até o voo

# text
seg-db24d16d38c9 = Registro de honestidade por resultado que qualifica a saída de uma demonstração: suas âncoras externas, hipóteses modeladas, lacunas até o voo e a faixa de TRL representativa, com invariantes impostas (validado exige uma âncora externa; modelado exige uma lacuna e não pode reivindicar acima do TRL { "4" }).

# text
seg-81d3adb239c5 = Invariantes em forma fechada que correspondem à disciplina de compliance 'representatividade justificada + lacunas até o voo identificadas'; ligadas à fronteira entre o estado de verificação e o tipo de referência independente

# text
seg-52ab936eb5f5 = Evidência de trade quântico versus clássico (forma comum)

# text
seg-a6679ed5bed7 = Um objeto TradeEvidence reproduzível (referencial fixo: cenário+semente+motor; valores comuns de quântico versus clássico por FoM com benefício de polaridade correta, IC de { "95" }% opcional, rótulo validado/modelado) que carrega um registro de representatividade, de modo que toda vertical de PNT quântico relate o trade da mesma forma honesta.

# text
seg-70da3e15ea8b = Identidades de benefício/vencedor em forma fechada + encapsulamento fiel do quantum_trade::TradeResult existente; honestidade ligada ao registro de representatividade e aos rótulos de verificação

# text
seg-20fee61b3107 = Biblioteca de modelos de erro de dispositivos quânticos

# text
seg-e42eabe9bc2a = Fichas de dispositivos (óptico/íon aprisionado/íon de mercúrio + relógios clássicos reutilizados de holdover/clock_state; interferômetro de átomos frios; enlaces de transferência de tempo clássico + emaranhamento/fóton único), cada uma com um registro de representatividade; o enlace de emaranhamento acrescenta um modelo de precisão de temporização limitado por ruído de disparo (~jitter/sqrt(R*tau), penalidade de contagem de escuro, piso sistemático).

# text
seg-632600203e1f = Coeficientes reutilizados de relógio/CAI (holdover/clock_state, valores publicados) + identidades de ruído de disparo/perda em forma fechada para o enlace de emaranhamento

# text
seg-86d71fd89f26 = Temporização quântica confiável (transferência de tempo + disseminação segura + anomalia)

# text
seg-d2a3d37825ef = Cadeia de transferência de tempo quântica versus clássica de ponta a ponta (deriva do relógio + precisão do enlace em quadratura), um nível de proteção de temporização reutilizado, uma FoM de segurança contra ataques de atraso/reprodução (1-P_md) e uma probabilidade de detecção de anomalia de relógio + latência do CUSUM, emitidos como TradeEvidence honesta com um registro de representatividade.

# text
seg-ac95d112a17a = Orçamento em quadratura em forma fechada sobre núcleos validados reutilizados (ADEV em relação ao Stable32/NIST; limite de TPL; detecção analytic_pd/pmd); honestidade ligada ao registro de representatividade

# text
seg-eaf341ff4522 = Navegação quântica sem GNSS

# text
seg-908a44a9f7c7 = Navegação por estima de INS quântico (interferômetro de átomos frios) versus INS clássico de grau de navegação durante uma interrupção de GNSS: crescimento do erro de posição, holdover até um limite de posição e o trade quântico versus clássico como TradeEvidence honesta; nota honesta de observabilidade (o viés é inobservável sem uma correção, portanto o erro cresce).

# text
seg-508f2c8884e2 = Orçamentos inerciais reutilizados, verificados em relação a uma dupla integração independente em Octave da mesma EDO de navegação por estima (outro ambiente de execução, modelo compartilhado → ReferenceImpl), mais o ruído de curto prazo publicado de Freier-2016 como âncora unilateral; o composto quântico versus clássico permanece MODELLED

# text
seg-914132833f5a = Detecção de falhas/anomalias para sistemas de PNT quântico

# text
seg-f20392820b9d = Catálogo rotulado de falhas quânticas (salto de frequência/deriva/perda de travamento do relógio; salto de viés/perda de sinal do sensor), uma AUC de ROC da estatística de detecção com IC por bootstrap e uma falha mínima detectável a uma taxa de falso alarme fixa; um monitor auxiliado por relógio quântico detecta falhas menores que um clássico, emitido como TradeEvidence honesta.

# text
seg-a689ab2ebb84 = AUC gaussiana em forma fechada = Phi(mu/(sigma*sqrt2)) verificada em relação ao eval_stats::bootstrap_auc_ci validado externamente (em relação ao scikit-learn) + limiares analíticos de detecção

# text
seg-0633e05d393f = Dinâmica de atitude de corpo rígido sem torque

# text
seg-23f43007bcbf = Equações rotacionais de movimento de Euler (I ω̇ = τ − ω × Iω, eixos principais e tensor de inércia geral) acopladas à cinemática de atitude por quaternions (q̇ = ½ q ⊗ ω) e propagadas com um integrador RK4 de passo fixo que renormaliza o quaternion a cada passo

# text
seg-2d21a01ea132 = Propagação de corpo rígido do hub de espaçonave do Basilisk { "2.9.1" } (AVSLab, ISC; atitude MRP por suas próprias equações acopladas do hub, svIntegratorRKF78 com tolerância relativa { "1e-12" }), uma implementação independente das equações de corpo rígido sem torque: o quaternion RK4 do Kshana (dt { "0.01" } s) e as taxas no corpo concordam dentro de { "1e-9" } ao longo de { "1e4" } s em dois tensores de inércia gerais não diagonais (pior caso { "3.3e-11" } e { "3.4e-12" } rad/s); tolerância fixada antes da comparação. Afirmação validada: movimento sem torque; o termo de torque externo não é comparado. As verificações de leis de conservação e de pião simétrico permanecem como autoconsistência de apoio. Nenhum ambiente de corpo flexível / malha de controle / torque externo

# text
seg-93b8ba1ba0e5 = Dinâmica de movimento relativo de Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Movimento relativo de um perseguidor em torno de um alvo em uma órbita de referência circular no referencial LVLH: as equações linearizadas de Clohessy–Wiltshire (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) resolvidas pela matriz de transição de estados em forma fechada { "6" }×{ "6" } Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) com a condição de órbita relativa limitada ẏ₀=−2n·x₀, e uma correção de segunda ordem em forma fechada (cw_dynamics::second_order_correction, a resposta CW aos termos quadráticos das equações exatas do chefe circular; Karlgaard e Lutze { "2003" }, Newman, Lovell e Pratt { "2015" }) composta como cw_dynamics::propagate_second_order. A saída validada é propagate_second_order; a Φ linear isolada é caracterizada em relação à verdade não linear, não validada

# text
seg-29adc2d68a7b = NumericalPropagator do Orekit { "12.2" } (Apache-2.0), dois corpos, LOFType.QSW, executado como programa separado (fixture inalterada desde a rodada { "1" }). Limiar pré-registrado de { "1e-3" } m em toda amostra de todo caso; a correção de segunda ordem do motor foi executada novamente contra ele sem alterá-lo (emenda 8c8e768d, escrita antes de o propagador existir, divulgando que as lacunas de primeira ordem eram conhecidas). propagate_second_order concorda dentro de { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } e { "2.2e-8" } m; reduzir à metade o termo de segunda ordem falha em { "1.85e-3" } a { "3.14e-3" } m. A Φ linear isolada se afasta da verdade não linear em { "1.2" } a { "6.3" } mm a { "100" } m ao longo de um terço de órbita (o termo de segunda ordem omitido; seu teste estrito é mantido ignorado), portanto é caracterizada, não validada. Verificações internas mantidas: Φ em relação a uma integração RK4 das equações de Hill, Φ(t)Φ(−t)=I, as identidades de órbita limitada e de deriva −12π·x₀, e a escala do resíduo de terceira ordem do termo de segunda ordem. Escopo: chefe circular, separações próximas de { "100" } m, até um terço de órbita; sem excentricidade (Tschauner–Hempel), J2 ou termos de arrasto diferencial; hipótese de pequena separação

# text
seg-d31be81dfd8f = Geolocalização passiva de emissores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localiza um emissor (interferidor/falsificador de sinal, ou uma fonte oportunista para PNT reverso) a partir da diferença de tempo de chegada em uma rede de receptores — a interseção de hiperboloides τᵢ=(Rᵢ−R₀)/c resolvida por mínimos quadrados de Gauss–Newton — e, ao acrescentar a diferença de frequência de chegada (diferenças de taxa de variação de distância) com receptores em movimento, recupera conjuntamente posição e velocidade; com o limite inferior de Cramér–Rao sobre a covariância de posição a partir da geometria das medições

# text
seg-17b45796fd43 = Autoconsistência do estimador e da geometria: idas e voltas direto→inverso, a identidade de Fisher/CRLB J·CRLB=I, monotonicidade do GDOP e o estimador atingindo seu próprio limite de Cramér–Rao sob ruído de Monte Carlo — verificações de consistência interna, NÃO um conjunto de dados externo, portanto a linha permanece InternalConsistency. Geolocalização passiva MODELLED — modelo de linha de visada de fonte pontual; sem termos de multipercurso / NLOS, de viés do relógio do receptor ou de refração atmosférica. { "0.30" } rodada { "2" }, em relação a Ho e Chan { "1993" } e Ho e Xu { "2004" } (pré-registrado f89018b8, { "1" } % de cada valor impresso), um resultado (permanece MODELLED): o limite de TDOA restrito à superfície reproduz os fatores geométricos de { "40" } N (-0.11 %, -0.02 %) e o TDOA máximo; o limite conjunto de TDOA+FDOA reproduz a Fig. { "6" } (+{ "0.06" } %, -0.17 %) e, na fonte que o código dos próprios autores nomeia para a Fig. { "7" } (emenda escrita depois de esse resultado ser visto, divulgada), a Fig. { "7" } (+{ "0.11" } %, -0.02 %); é igual ao código de limite publicado dos autores (estilo BSD, executado no GNU Octave) até { "3e-12" }; o solucionador de máxima verossimilhança ponderado pela covariância atinge o limite impresso (+{ "0.3" } a +{ "0.4" } %). Os fatores de Ottawa que o artigo imprime a partir de um Monte Carlo ({ "251" }, { "7.1" }) diferem em +{ "1.3" } % e +{ "4.4" } %, fora do limiar de { "1" } %

# text
seg-36b74b49f82f = Desaceleração de pico em entrada balística de 3 graus de liberdade em relação ao nominal publicado do Stardust

# text
# c1: entry-heating
seg-a05ca2fde6fc = Uma entrada de massa pontual de 3 graus de liberdade sobre uma Terra esférica em rotação, através da Atmosfera Padrão dos EUA { "1976" }, integrada com RK4 a partir de um estado de entrada inercial, relatando a desaceleração de pico e sua altitude; o estado de entrada relativo ao planeta a partir do inercial. Executável como o tipo de cenário <c1/>.

# text
seg-5ab7065c0803 = O nominal do Stardust de Desai, Mitcheltree e Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): desaceleração máxima de { "33.4" } g a partir de { "12.6" } km/s relativos ao planeta com a massa de lançamento de { "45.8" } kg, uma trajetória POST de 6 graus de liberdade com o banco de dados aerodinâmico completo; interface de entrada de Desai, Lyons, Tooley e Kangas (NTRS { "20090004445" }): raio { "6503.14" } km, inercial { "12.9" } km/s a -8.2 graus. Limiares pré-registrados em xval/entry-stardust/PREREGISTRATION.md antes de qualquer execução com essas entradas; ambos atingidos na primeira execução. O QUE NÃO É: um caso publicado e uma grandeza (desaceleração de pico, que na aproximação balística não depende do coeficiente balístico); a latitude e o rumo de entrada são supostos; aquecimento, carga térmica e ponto de pouso não são verificados em relação a ele; massa pontual com C_D constante, não 6 graus de liberdade.

# text
seg-5bd3882531b6 = Aquecimento convectivo de entrada no ponto de estagnação (Sutton-Graves) em uma entrada de 3 graus de liberdade

# text
seg-4f97036ed72f = Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), seu pico e a carga térmica integrada ao longo de uma entrada de 3 graus de liberdade, balística ou sustentada com inclinação lateral constante, na Terra ou em Marte.

# text
seg-5a203ecfeaee = Consistência interna: a relação e as constantes como impressas no NASA TR R-376, uma verificação de convergência por meio passo e a ordenação esperada dos picos de aquecimento e de desaceleração. O QUE NÃO É: nenhum valor publicado de aquecimento foi comparado (os artigos do Stardust dão um limite de projeto e uma estimativa convectiva mais radiativa de cerca de { "1200" } W/cm2, que uma relação apenas convectiva não consegue igualar); sem aquecimento radiativo, correção de temperatura de parede ou de catalicidade, nem resposta da proteção térmica.

# text
seg-1b96577665fc = Radiometria de imageador eletro-óptico, MTF, resposta relativa de borda e NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Orçamento de relação sinal-ruído de imageador em nadir (radiância de cena lambertiana, equação da câmera, ruídos de disparo, de escuro, de leitura e de quantização), a MTF do sistema em Nyquist como o produto de difração de abertura desobstruída, abertura do detector, borrão linear e jitter gaussiano, a resposta de borda e a resposta relativa de borda integradas a partir dessa MTF, Q = lambda F / p, e o NIIRS do GIQE versão { "4" } sem compensação de MTF. Executável como o tipo de cenário <c1/>.

# text
seg-bb3a01edc95d = Formas fechadas: a MTF de difração à metade do corte, a borda em rampa de um pixel de uma abertura de detector pura (RER { "1" }), a borda de CDF normal de um borrão gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), a escala do ruído de disparo e os coeficientes do GIQE { "4" } como publicados (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). O QUE NÃO É: nenhum imageador externo, MTF medida ou imagem classificada foi comparado; o GIQE é uma regressão empírica com seu próprio erro; sem luz parasita, MTF atmosférica, compensação de MTF nem aliasing.

# text
seg-07ca77a67207 = Perdas de gravidade, arrasto, direcionamento e contrapressão na ascensão de lançamento

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascensão planar por curva gravitacional de um veículo de vários estágios sobre uma Terra esférica sem rotação, através da Atmosfera Padrão dos EUA { "1976" } (densidade e pressão), com um chute de arfagem, empuxo reduzido pela contrapressão do bocal, fins de queima de estágio em limites exatos de passo e as perdas de gravidade, arrasto, direcionamento e contrapressão integradas junto ao estado. Executável como o tipo de cenário <c1/>.

# text
seg-174ed29adbbe = Consistência interna: a identidade exata velocidade de fim de queima = soma Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo abaixo de { "1e-6" } m/s), a equação de Tsiolkovsky em uma queima vertical no vácuo com a gravidade como única perda, e as pressões ao nível do mar e na tropopausa da US76. O QUE NÃO É: as perdas de nenhum veículo publicado foram comparadas; sem rotação da Terra, fase inercial, aceleração controlada nem orientação além do chute; C_D constante; não é um otimizador de trajetória.

# text
seg-55e8345def8b = Equação bidirecional do TWSTFT, orçamento de incerteza e estabilidade do enlace com não reciprocidade de flicker e diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = A equação bidirecional do TWSTFT resolvida para T_A - T_B com atrasos de transmissão e recepção da estação, a assimetria ionosférica de subida/descida na banda Ku, a diferença de atraso do transponder e os termos de Sagnac, em relação ao seu modelo direto exato; um orçamento de incerteza em quadratura com o TDEV do enlace como termo do tipo A; uma série bidirecional com ruído de fase branco e de flicker (Kasdin-Walter), uma não reciprocidade diurna e um resíduo de reciprocidade constante; e a taxa, o RMS residual, o TDEV e o ADEV de séries de relógio de estação fornecidas em Circular T, MJD-CSV ou RINEX do IGS. Executável como o tipo de cenário <c1/>.

# text
seg-244f7396ac25 = Consistência interna: o modelo direto e a equação resolvida concordam até { "1e-15" } s, o termo de Sagnac é igual à forma de laço omega/c^{ "2" } da BIPM 2A independente do módulo, o termo ionosférico é { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, e os processos de ruído mostram suas formas esperadas de TDEV. O QUE NÃO É: nenhuma medição real de TWSTFT ou relatório de calibração foi comparado; os atrasos e as incertezas declarados são entradas, não medidos; as estabilidades das séries fornecidas são relatadas, não validadas.

# text
seg-2f9be02c92bc = Numérica de atmosfera em trajeto óptico oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade óptica de nuvem e de ar limpo

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrado ao longo de um trajeto oblíquo para a variância de Rytov de onda plana e esférica (enlace de subida e de descida), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, o fator de média de abertura em turbulência fraca, a profundidade óptica de nuvem de uma coluna de água líquida e a profundidade óptica de ar limpo de Kim-visibilidade mais Rayleigh, substituindo a perda atmosférica agregada do orçamento de enlace óptico quando uma atmosfera é fornecida. Executável dentro do tipo de cenário <c1/>.

# text
seg-7ca512adff99 = A numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } com { "30" } dígitos, quadratura tanh-sinh na variável de altura original e densidades gama-gama de Bessel-K) que não compartilha código com o Kshana, sob limiares fixados antes de existir qualquer implementação (xval/optical-atmosphere/PREREGISTRATION.md). POR QUE MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, portanto verifica a implementação das fórmulas declaradas e não a atmosfera; nenhum exemplo de validação da ITU-R e nenhum registro medido de cintilação ou de extinção em trajeto oblíquo é usado (os valores da ITU são uma decisão de licença em aberto e ficam fora do repositório). O nível do perfil de Cn2, a visibilidade, as alturas de escala de aerossol e molecular, o comprimento de trajeto da média de abertura e o ajuste de momentos usado para aplicar a média de abertura aos parâmetros gama-gama são entradas ou convenções declaradas. Uma linha de fonte no módulo registra que um levantamento muito copiado imprime o segundo expoente de cintilação como 7/6 onde Andrews e Phillips dão 5/6; a forma 5/6 é a implementada

# text
seg-a2faab92e760 = Disponibilidade de sítios ópticos em solo dirigida pelo clima e diversidade de sítios correlacionada com a distância

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilidade de um enlace óptico em relação a uma margem de enlace declarada a partir de um clima log-normal de água líquida em nuvens (quantidade da ITU-R P.840, extinção por óptica geométrica) e o desvanecimento por turbulência gama-gama independente, a margem de enlace necessária para disponibilidades-alvo e o teto que nenhuma margem eleva, durações de interrupção log-normais, cenários hipotéticos de técnicas de melhoria e uma disponibilidade de rede por cópula gaussiana de um fator cuja correlação entre pares é exp(-distância/comprimento de decorrelação). Executável como o tipo de cenário <c1/>.

# text
seg-20eab6e9b925 = Consistência interna: limites em forma fechada e monotonicidade do modelo de diversidade, a forma fechada do teto de nuvens e as identidades log-normais de interrupção. NENHUMA referência independente externa é reivindicada e nenhuma foi comparada: nenhum registro medido de disponibilidade de estação óptica em solo ou de linha de visada livre de nuvens é usado. POR QUE MODELLED: o clima de nuvens (probabilidade de nuvem, mediana e dispersão da coluna de água líquida, durações de interrupção), a independência entre nuvem e turbulência, a forma de cópula gaussiana, o comprimento de decorrelação e todo ganho de técnica são hipóteses; os cenários incluídos declaram climas ILLUSTRATIVE, não um conjunto de dados. Elevar esta linha exige um registro de disponibilidade medido e citado e um limiar registrado antes da comparação

# text
seg-043ece801e72 = Continuidade de temporização e de telemetria através de interrupções ópticas

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = A distribuição de duração de interrupções de um sítio óptico acoplada à variância de deriva em forma fechada do modelo de holdover do relógio: erro de temporização e de telemetria em quantis de interrupção declarados, o holdover até um limite de temporização, a fração das interrupções e do tempo de interrupção dentro dele e a disponibilidade de temporização A + U E[min(D, T_h)]/E[D], para as classes de relógio clássica e quântica. Executável dentro do tipo de cenário <c1/>.

# text
seg-ab2a33c1b1a4 = Consistência interna com o módulo de holdover, bit a bit; NENHUMA referência independente externa é reivindicada. As PSDs das classes são os pisos sintetizados de tau longo que o módulo de holdover já carrega, portanto os valores herdam sua ressalva declarada de que o holdover até um limite estreito é governado pelo piso de ruído vermelho suposto e não pelo desvio de Allan citado. As durações de interrupção são um modelo log-normal com parâmetros declarados, não um registro medido de permanência de nuvens

# text
seg-b119df65d2a7 = Margem de enlace óptico ao longo do tempo: uma realização com semente do clima de um sítio

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Uma tabela opcional <c1/> (duração, passo, semente) faz o tipo <c2/> gravar também, por sítio, uma realização com semente do modelo de sítio declarado ao longo do tempo: episódios de nuvem (períodos claros exponenciais, interrupções por nuvem log-normais com a média e a dispersão declaradas, a parcela de tempo sob nuvem definida pela probabilidade de nuvem declarada), uma coluna de água líquida log-normal por episódio de nuvem, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem de enlace, os desvanecimentos por nuvem e por cintilação e o indicador de enlace ativo, com a disponibilidade realizada, a fração de nuvem, a contagem de interrupções e a interrupção mais longa. Sem a tabela, o resultado é o documento { "0.37" }. Os sorteios passam por rotas portáteis de distribuição e de matemática, de modo que native e wasm32 dão os mesmos bytes.

# text
seg-d25e5d2449bd = Apenas consistência interna; NENHUMA referência independente externa é reivindicada e não existe nenhuma para uma realização de clima. As verificações comparam um sorteio com a saída estatística do mesmo modelo, portanto um resultado positivo diz que o gerador amostra as distribuições declaradas (a disponibilidade e a parcela de nuvem do sorteio ficam dentro de tolerâncias pré-registradas dos valores declarados), não que algum sítio real se comporte assim. A série é uma realização, não o clima: sua disponibilidade difere da declarada pelo erro amostral do sorteio, e amostras de cintilação em passos diferentes são independentes, uma simplificação declarada de um processo que se decorrelaciona em milissegundos. As entradas de clima permanecem hipóteses do cenário.

# text
seg-58cbf576c959 = Leitor de Orbit Data File TRK-2-18 e modelo de Doppler de 2 vias com rampa em Marte

# text
seg-d1055650a77f = Um leitor de Orbit Data Files (TRK-2-18) da DSN: os grupos de registros de 36 bytes (rótulo de arquivo, identificador, dados de órbita, rampas por estação, deslocamentos de relógio, resumo, fim de arquivo) e, em cada registro de dados de órbita, a marca de tempo desde { "1950" }, atrasos de descida e de subida, observável, estações, tipo de dado, bandas, validade, canal, espaçonave, a frequência de referência de 46 bits e o tempo de compressão; instantes de início e de fim das rampas, taxas e frequências iniciais. Sobre ele, um modelo de Doppler de 2 vias em banda X com rampa (rampas de subida integradas, tempo de luz de ida e volta com Shapiro e troposfera, estações da DSN pela cadeia CIO IAU 2006/2000A e EOP do IERS, tempo da estação) e uma determinação de órbita em lote de orbitador de Marte (campo GMM-3, terceiros corpos, SRP, arrasto).

# text
seg-6d533149f6f0 = O rótulo PDS3 que o processo de condicionamento de dados de navegação da DSN produziu com o arquivo (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), verificado em relação a limiares pré-registrados em xval/mro-odf/PREREGISTRATION.md antes de o leitor existir. MODELLED porque um limiar registrado (as linhas da tabela de fim de arquivo, { "121" } no arquivo contra { "120" } no rótulo) não foi atingido; o rótulo é internamente inconsistente aí. Etapa { "2" } (xval/mro-od/PREREGISTRATION.md, emendas A1 e A2 antes do resultado avaliado): o Doppler previsto a partir da reconstrução da equipe de navegação do MRO (mro_psp5, NAIF) coincide com o Doppler de 2 vias com rampa observado até { "12.5" } mHz em passagens não usadas no desenvolvimento, limiar atingido; a determinação de órbita registrada falhou no arco avaliado (matriz normal não definida positiva) e não produziu órbita, portanto os limiares de órbita não foram atingidos. A rodada { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, um estimador amortecido, o mesmo arco e os mesmos limiares, uma emenda de avaliação R2-A1 divulgada em docs/revisions) convergiu: a órbita estimada fica a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução, limiares atingidos, mas o RMS do Doppler pós-ajuste é { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido, portanto a linha permanece MODELLED. O QUE NÃO É: nenhuma órbita estimada atingiu todos os limiares registrados; ionosfera, plasma solar e a maior parte do deslocamento de antena (um deslocamento radial de { "1.5" } m é ajustado na passagem de desenvolvimento) não são modelados.

# text
seg-c7d292f14693 = Controle de atitude por realimentação MRP em malha fechada com rodas de reação

# text
# c1: aocs
seg-f33781b74cc2 = Controle de atitude de apontamento inercial de um hub rígido com três ou mais rodas de reação balanceadas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e Junkins), torques de motor das rodas de norma mínima G_s u = -L_r limitados ao limite de cada roda, a dinâmica acoplada do hub e das rodas com a inércia do hub incluindo a inércia de rotação das rodas, cinemática por quaternions, RK4 com retenção de ordem zero. Executável como o tipo de cenário <c1/> (laço de estado verdadeiro).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; a roda bsk executada como ferramenta separada, nunca ligada nem incorporada): hub de espaçonave, reactionWheelStateEffector (BalancedWheels, limite de torque ligado), simpleNav, inertial3D, attTrackingError, mrpFeedback (sem termo integral) e rwMotorTorque com dt = { "0.1" } s e seu RK4, em relação à implementação própria do Kshana em três casos (três rodas ortogonais; uma pirâmide de quatro rodas; um caso de quatro rodas com saturação), limiares pré-registrados em xval/aocs-basilisk/PREREGISTRATION.md antes do código e da execução. Todos os limiares foram atingidos na primeira execução. O QUE NÃO É: ruído de sensor na malha, realimentação integral, orientação de rastreamento, atrito das rodas, jitter, limites de velocidade e potência, os ganhos de qualquer espaçonave real; a comparação verifica a implementação da lei e da dinâmica em relação a uma independente, não um controlador de voo.

# text
seg-455dc946c965 = Estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um rastreador de estrelas

# text
# c1: aocs
seg-553d043438b4 = O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa de viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de taxa), atualizações do rastreador de estrelas com o resíduo { "2" } vec(q^-1 q_st) na forma de Joseph e a reinicialização multiplicativa; um simulador discreto de Farrenkopf de giroscópio e rastreador de estrelas. O tipo <c1/> pode fechar a malha de controle sobre a sua estimativa.

# text
seg-846cb1eeb35c = Consistência interna: o erro de estimação normalizado ao quadrado do filtro em relação à verdade simulada a partir dos mesmos modelos de sensor ao longo de sementes de Monte Carlo, e a convergência das estimativas de atitude e de viés. O QUE NÃO É: nenhum estimador externo nem dados de voo foram comparados (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensor são os de livro-texto, sem desalinhamento, fator de escala nem efeitos do campo de visão do rastreador de estrelas.

# text
seg-059732bda693 = Determinação de atitude de Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Atitude ótima de três eixos a partir de observações vetoriais ponderadas (direções de estrelas/Sol/magnetômetro): o TRIAD determinístico de dois vetores, o método q de Davenport (o minimizador exato da perda de Wahba — o quaternion ótimo é o autovetor de maior autovalor da matriz de Davenport K de { "4" }×{ "4" }, resolvido por uma decomposição simétrica de autovalores de Jacobi) e o QUEST (raiz de Newton/secante da equação característica de K inicializada em Σ pesos, seguida da recuperação do quaternion pelo vetor de Gibbs)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — a solução SVD de Kabsch/Markley do problema de Wahba, um algoritmo realmente independente (SVD da matriz de perfil de atitude) e uma base de código distinta da decomposição de autovalores de Davenport-K / método da raiz característica do QUEST do kshana, calculando a MESMA atitude ótima de Wahba definida de forma única. Em conjuntos de observações vetoriais ponderadas sem ruído, o TRIAD, o método q e o QUEST reproduzem a rotação ótima do scipy a menos de { "1e-9" } rad (comparada pelo ângulo de erro de atitude invariante ao sinal). A afirmação estatística de Monte Carlo com ruído de que 'o ótimo supera o TRIAD' permanece MODELLED (sem referência independente externa); apenas observações de vetores unitários de direção pontual — sem modelagem de campo de visão/viés/correlação temporal do sensor, e o QUEST é singular em { "180" }° (o método q cobre esse caso)

# text
seg-cd342cc48afc = Estatísticas de detecção de aquisição GNSS por lei quadrática

# text
seg-6d97452de33e = Detector de aquisição por lei quadrática (não coerente) sobre uma busca de fase do código × Doppler: probabilidade de falso alarme (χ² central com 2M graus de liberdade), o limiar que atinge uma P_fa alvo (CDF de χ² invertida por bisseção) e a probabilidade de detecção (χ² não central com parâmetro de não centralidade 2M·ρ para a SNR pós-correlação ρ por célula), com a função Q de Marcum generalizada Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — um algoritmo independente (χ² não central/central por fração contínua) em relação à série da gama incompleta do kshana (raim::chi2_cdf / noncentral_chi2_cdf), calculando o mesmo NÚCLEO de estatísticas de detecção definido de forma única: a Q de Marcum generalizada Q_M(a,b)=ncx2.sf(b²,2M,a²), a probabilidade de detecção P_d, a probabilidade de falso alarme P_fa e a inversão P_fa→limiar, concordando até ~{ "1e-6" } — a mesma base de independência da linha validada 'núcleo estatístico de integridade RAIM/ARAIM'. Apenas o NÚCLEO: o CFAR por média de células e a perda por cavalgamento de intervalos de código/Doppler permanecem MODELLED

# text
seg-77f425a38aa2 = Resolução de ambiguidade inteira da fase da portadora GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fixação de ambiguidades por mínimos quadrados inteiros ao modo LAMBDA: uma transformação decorrelacionadora inteira (Z) que preserva volume (redução de tamanho integer-Gauss do fator L D Lᵀ) + uma busca exata de mínimos quadrados inteiros por ramificação e limite em profundidade de Schnorr–Euchner, com o teste de razão sobre os dois melhores candidatos (a afirmação validada); mais a taxa de sucesso bootstrapped em forma fechada P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), verificada apenas internamente e fora da afirmação validada

# text
seg-5aeb95f59f07 = lambda() do RTKLIB v2.4.2-p13 (seu arquivo-fonte lambda.c, T. Takasu, BSD-2-Clause), uma redução LAMBDA e uma busca MLAMBDA independentes, compiladas a partir de C e executadas como ferramenta, em { "300" } covariâncias aleatórias (n de { "2" } a { "10" }): os mínimos quadrados inteiros têm um minimizador único, portanto os inteiros fixados devem ser idênticos ({ "0" } divergências) e as duas melhores normas ao quadrado, que alimentam o teste de razão, concordam até { "1e-9" } relativo (medido { "5.6e-13" }); tolerância fixada antes da comparação. Afirmação validada: a solução ILS e suas duas melhores normas. O RTKLIB não calcula a taxa de sucesso bootstrapped, que permanece verificada internamente em relação a um Monte Carlo do processo de arredondamento; os invariantes da transformação Z e a enumeração por força bruta permanecem como verificações de apoio. Apenas decorrelação integer-Gauss (as permutações de reordenação da redução LAMBDA completa aceleram a busca, mas não alteram nem a resposta exata do ILS nem a taxa bootstrapped)

# text
seg-4ad1ec05610f = Direcionamento no plano B e assistência gravitacional por cônicas conectadas

# text
seg-d249aea7c3ea = Geometria de sobrevoo hiperbólico (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, ângulo de deflexão δ={ "2" }·asin(1/e), parâmetro de impacto |B|=|a|·√(e²−{ "1" })), o referencial de ponto de mira Ŝ/T̂/R̂ do plano B e a decomposição B·T̂/B·R̂, e uma assistência gravitacional por cônicas conectadas (módulo de v∞ conservado, direção defletida por δ, Δv heliocêntrico={ "2" }·v∞·sin(δ/2) sem custo de propelente) com o parâmetro de Tisserand T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, executado como programa separado) em { "192" } estados hiperbólicos da Terra: B.T, B.R e |B| dentro de { "1e-6" } km (pior caso { "1.35e-8" } km), o ângulo de deflexão e ambas as assíntotas dentro de { "1e-9" } rad (pior caso { "9.3e-15" } rad); a variação de velocidade da assistência a partir do C3 e das assíntotas do GMAT dentro de { "1e-9" } v_inf (pior caso { "5.6e-14" }); SMA, ECC e INC heliocêntricos em { "350" } estados centrados no Sol antes e depois da assistência dentro de { "1e-9" } relativo e { "1e-12" } rad (pior caso { "2.2e-14" } e { "4.1e-14" } rad); o parâmetro de Tisserand em relação ao sbpy { "0.6.0" } (BSD-3) sobre elementos do GMAT dentro de { "1e-9" } (pior caso { "1.3e-15" }) e em relação a { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }); e a forma fechada de Tisserand em relação à Tabela { "8.1" } de Kasuga e Jewitt ({ "2019" }) para { "12" } objetos dentro do limite de arredondamento impresso (pior caso { "0.39" } dele; um valor trabalhado publicado de P1). Pré-registrado (436293bf; reparo heliocêntrico 6fd9f5e6); a emenda 374c806b, escrita depois de os arquivos da referência independente serem gerados e antes de qualquer valor do Kshana, ampliou o filtro de entrada de inclinação de { "1e-2" } para { "1e-3" } rad, mantendo estados mais numerosos e pior condicionados. Escopo MODELLED: sobrevoo por cônicas conectadas de dois corpos em órbita planetária circular, sem transição de esfera de influência, perturbações do encontro nem efemérides

# text
seg-8e82da17a463 = Conformação de feixe de arranjo antijamming CRPA

# text
seg-1744f527b4d1 = Anulação em antena de padrão de recepção controlado: vetores de direcionamento complexos do arranjo a(û)=exp(j·k·pₙ·û), direcionamento determinístico de nulos (ganho unitário em direção ao SV, nulos exatos em direção a até N−{ "1" } interferidores pela norma mínima w=Aᴴ(AAᴴ)⁻¹b) e pesos adaptativos MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) que direcionam sozinhos nulos profundos sobre interferentes fortes (com um núcleo de álgebra linear complexa escrito do zero)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (solução complexa zgesv do LAPACK) — uma base de código de álgebra linear independente do núcleo complexo escrito do zero do kshana, calculando os MESMOS pesos definidos de forma única: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) e direcionamento de nulos de norma mínima w=Aᴴ(AAᴴ)⁻¹b, mais os ganhos de resposta do arranjo resultantes, concordando até ~{ "1e-9" } — a mesma classe de referência independente das linhas validadas de DOP (gnss_lib_py) e de informação de Fisher (numpy). Arranjo MODELLED de banda estreita, campo distante, de elementos isotrópicos idênticos — sem acoplamento mútuo, descasamento por elemento, largura de banda finita (STAP) nem erro de estimação do vetor de direcionamento

# text
seg-f2c973f14d52 = Ruído de relógio de lei de potência IEEE-1139 + piso de flicker-FM

# text
seg-4a0159558671 = A conversão IEEE-1139 de PSD↔variância de Allan de cinco coeficientes S_y(f)=Σh_α f^α → σ_y²(τ) (PM branco/flicker, FM branco/flicker/passeio aleatório), o piso de flicker-FM σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) como termo ajustável de primeira classe e um ajuste não negativo da família FM na base { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } que recupera o piso que a base de deriva { "{" }1/τ,τ,τ³{ "}" } não consegue representar

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; coeficientes de Kasdin & Walter { "1992" } / Vernotte { "2015" }) — uma base de código de terceiros independente e uma linhagem de citações que calcula a MESMA conversão IEEE-1139 de PSD→Allan σ_y(τ), definida de forma única, para cada um dos cinco tipos de ruído de lei de potência. O powerlaw::allan_deviation do kshana concorda com as formas fechadas do allantools (FM branco/flicker, RW-FM e PM branco a menos de { "5e-9" } relativo; PM flicker até ~{ "1e-5" } — o sinal genuíno de independência, pois o kshana usa a constante { "1.038" } tabulada na NIST-SP-1065 contra o 3γ−ln2 completo do allantools), e o piso de flicker-FM √({ "2" } ln2·h_{ "{" }-1{ "}" }) concorda com o allantools ao longo de toda a escada — o mesmo limiar que as linhas validadas de MDEV/TDEV/Theo1/MTIE superam. Modelo estacionário de lei de potência MODELLED — sem termo de deriva determinística (τ²); coeficientes por dispositivo / pisos medidos permanecem modelados

# text
seg-cc1ac065e684 = Intercâmbio de bloco de covariância do CCSDS OEM

# text
seg-ec4d44e7cf78 = Serializa e analisa o bloco COVARIANCE_START…COVARIANCE_STOP do CCSDS { "502.0" } OEM — a covariância de posição/velocidade de { "6" }×{ "6" } escrita como seu triângulo inferior de 21 elementos (ordem canônica CX_X … CZ_DOT_Z_DOT) com o COV_REF_FRAME opcional, complementando o escritor/analisador existente de vetores de estado do OEM, de modo que covariâncias de determinação de órbita e de filtros façam ida e volta no formato padrão

# text
seg-ae061c7f082c = Crescimento de erro em deriva de INS/TRN e cruzamentos de limiar

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Orçamento de erro de posição versus duração de deriva construído a partir de coeficientes de IMU, cada fonte de erro (viés do acelerômetro, viés do giroscópio, passeio aleatório de velocidade, passeio aleatório de ângulo, fator de escala em cruzeiro e sob força específica sustentada) propagada por um modelo de erro de INS de nove estados em nível local com a realimentação de Schuler (inertial::coast::ErrorDynamics segundo Groves 2ª ed. cap. { "14" }: erros de atitude, velocidade e posição, o canal vertical com seu gradiente de gravidade, raios do WGS-84 e gravidade normal, uma plataforma nivelada rumo ao norte na velocidade configurada, latitude_deg e height_m; termos sistemáticos por uma exponencial de matriz aumentada, passeios aleatórios por Van Loan), os monômios de Terra plana mantidos apenas como leading_order_m; contribuições combinadas sob uma regra declarada (rss / soma linear / soma determinística com rss estocástico); as durações de deriva que atingem limiares de posição fornecidos pelo chamador ({ "10" } m e { "50" } m por padrão) localizadas por uma varredura progressiva até o primeiro cruzamento (first_crossing_s, pois as curvas limitadas por Schuler não são monótonas), com a fonte dominante em cada cruzamento; e um modo limitado por TRN que fornece o maior intervalo de correção de terreno que mantém cada limiar. Executável como o tipo de cenário <c1/>

# text
seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), executado como programa separado sob GNU Octave { "8.4.0" }: execuções de deriva inercial livre com o mesmo perfil de erro de IMU, com uma zona morta numérica corrigida em sua atualização de quaternion (qua_update.m: a proteção sobre uma taxa abaixo de { "1e-8" } rad/s substituída por wnorm == { "0" }, aplicada a uma cópia em tempo de execução e verificada uma vez quanto à coincidência; com a proteção no lugar, uma atitude de plataforma com deriva lenta congelava e interrompia a realimentação de Schuler). Pré-registrado (4262b969) com o gerador corrigido antes de ser executado; o motor (440b3877) foi confirmado antes de qualquer saída corrigida ser aberta; mesmo limiar de { "5" } %, { "48" } pontos, termos, sementes e estatística da rodada { "1" }. Resultado: 48/48 dentro de { "5" } % (pior +{ "3.70" } % de passeio aleatório de velocidade a { "1200" } s, +{ "3.33" } % de passeio aleatório de ângulo a { "1800" } s); a { "3600" } s o NaveGo/Kshana dão 2375.4/2376.2 m para o viés do acelerômetro e { "130" } 885/131 { "675" } m para o viés do giroscópio. Zerar a realimentação da taxa de transporte de Schuler falha no teste (+{ "695" } % a { "3600" } s). Divulgado: as previsões de Schuler de canal único e os valores do NaveGo da rodada 1 eram conhecidos; o modelo não tem parâmetro ajustado. Escopo: as curvas de erro por termo em grau Tactical, { "45" } graus N, nivelada e apontando para o norte, até { "3600" } s; os cruzamentos, a regra de combinação e o modo TRN são funções determinísticas dessas curvas. Os coeficientes da classe de IMU (valores de faixa da Tabela { "4.1" } de Groves { "2013" }) e o resíduo de correção de TRN permanecem entradas MODELLED. Rodada { "1" } (substituída): os monômios de Terra plana, agora leading_order_m, superestimam além de { "600" } s (2.2x a 8x em uma hora). { "0.30" } revisão: toda saída de ins-trn-coast muda (o pico de TRN do cenário distribuído { "52.932679" } -> { "44.711834" } m)

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
# c1: passes::predict_passes
seg-656fd7d44a9e = Consistência interna, a partir de três grandezas calculadas por expressões diferentes na mesma varredura e depois exigidas a fechar. Os segundos de abertura de navegação, de comunicações e ociosos são acumulados separadamente — o ocioso a partir de (aberturas − |atendidas|) por intervalo elementar, nunca como um resto — e sua soma é verificada contra aberturas × horizon_s, o que uma fronteira mal delimitada, um intervalo contado em dobro ou um descartado quebra de imediato; os tempos atendidos por sessão são exigidos separadamente a somar de volta os dois totais de serviço. As propriedades estruturais do escalonador são medidas, não supostas: o tempo atendido é verificado como não decrescente na contagem de aberturas ao longo de { "200" } planos pseudoaleatórios para as três políticas (não óbvio para a política não preemptiva, em que uma abertura extra muda quem detém o quê em cada fronteira posterior), e a aritmética de fronteira é fixada no par que se toca / com sobreposição de um segundo, onde um erro de um a mais ou a menos de outro modo se esconderia. A ponte com o preditor de passagens é verificada em relação à saída de <c1/>: com uma abertura e nenhum serviço concorrente, os segundos de abertura de navegação são iguais à soma das durações de passagem do próprio preditor. Nenhuma referência independente externa é reivindicada e nenhuma existe: a capacidade substitui a aritmética manual em vez de ser verificada em relação a ela, o plano de contatos distribuído é ilustrativo e não de voo, e nenhum escalonador operacional publica um par plano-mais-resposta com sua regra de arbitragem declarada — um ciclo calculado sob uma política não declarada não é comparável a um calculado sob uma declarada, e a dependência da política é medida (ciclos de navegação de 100/150 contra 50/150 no mesmo plano). Tempo de reorientação e de troca, volume de dados, estado de buffer, energia e fechamento de enlace são excluídos no rótulo do relatório, e não modelados silenciosamente

# text
seg-43cd7aa7ab53 = Interferência de RF na navegação de superfície lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Razão interferidor-sinal nativa lunar, C/N₀ efetivo e perda de travamento para um usuário de superfície selenográfico sob um interferidor na superfície lunar (ou elevado), sobre a constelação ilustrativa de fontes públicas de classe Moonlight/LCNS. Compõe a cadeia aberta de interferência (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) com a geometria aberta do céu lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rederivada. Diferentemente do tipo <c1/> da Terra, a perna do sinal não é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é seu próprio EIRP do orçamento de enlace − FSPL(distância oblíqua), de modo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Emite UMA LINHA POR ENLACE VISÍVEL (época, satélite) em JSON e como artefato *.table.csv, com as duas potências recebidas cuja diferença é o J/S impressas ao lado; as figuras de mérito agregadas ficam ao lado dessa tabela, nunca no lugar dela. Executável como o tipo de cenário <c2/>

# text
seg-2a4393ae7c52 = Verificação cruzada de composição em relação a um caminho de código independente no próprio repositório: cada J/S por enlace é rederivado como a diferença de dois orçamentos de enlace calculados com linkbudget::received_signal_power_dbw, cuja perda no espaço livre é a expressão única { "20" }·log10(4πRf/c) e não a soma de três termos que jamming::free_space_path_loss_db usa — as duas concordam a menos de { "1e-9" } dB em cada linha (pior caso medido { "7.11e-14" } dB, isto é, arredondamento de ponto flutuante). A cadeia de interferência subjacente que ela compõe tem âncora externa separada em tests/gnss_denied_jamming_resilience_reference.rs (rederivação independente em numpy/scipy do J/S e do C/N₀ efetivo fixada em Kaplan & Hegarty §{ "9.4" }, mais o C/N₀ medido do JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); a geometria lunar que ela compõe é a geometria lunar_service/lunar com suas próprias referências independentes. Identidades em forma fechada verificadas aqui: um afastamento do interferidor reduzido à metade soma exatamente { "20" }·log10({ "2" }) dB a toda linha; o J/S é exatamente invariante ao ganho no eixo da antena do usuário, enquanto o C/N₀ se move exatamente esse ganho; uma máscara de elevação não altera nenhuma linha restante, bit a bit. A própria linha permanece ReferenceImpl/Modelled: não existe campanha medida de interferência lunar com a qual validar, e a constelação é uma geometria ilustrativa de fontes públicas de classe Moonlight/LCNS, não uma efeméride de voo

# text
seg-4c116e25c5c5 = Contorno de negação lunar com uma faixa de incerteza a partir da dispersão medida de C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = O relatório <c1/> não apoia mais seu contorno de negação em um único escalar. Ele emite a distribuição completa medida de C/N₀ do sinal desejado sobre a tabela por satélite — n, mín, p05, p25, mediana, p75, p95, máx, média, desvio padrão amostral e a própria assimetria da amostra (p95 − mediana) − (mediana − p05) — ao lado das linhas por enlace, que permanecem inalteradas. O contorno é então relatado em cada uma dessas estatísticas de ordem sob AMBOS os critérios de negação que o motor reconhece, nunca um no lugar do outro: o critério incumbente de razão de potência (J/S = { "30" } dB, o mesmo limite que attack_surface e tracking_loop usam, e o critério por trás da coluna <c2/> da tabela publicada de interferência em enlaces lunares), e o critério de perda de travamento (o C/N₀ efetivo caindo a tracking_threshold_dbhz), que é o critério com que a própria coluna links[].status deste relatório é avaliada. Cada ponto do contorno é dado nos dois eixos do plano de negação — o EIRP do interferidor necessário no afastamento do cenário, e o afastamento de negação no EIRP do cenário — de modo que a faixa é um intervalo nos mesmos eixos em que um gráfico de contorno é desenhado. As bordas da faixa SÃO contour(p05) e contour(p95): o mesmo mapa em forma fechada aplicado aos próprios quantis da amostra, não um sigma ajustado à amostra e não mediana ± k·desvio padrão, e o relatório diz isso em uma string band_definition ao lado dos números. O desvio padrão é emitido por continuidade e não é usado por nada. Um quantil cujo C/N₀ já está no limiar de rastreamento ou abaixo dele não tem J/S de negação finito; essas colunas são emitidas como null com um motivo contado, e não como um infinito nem como um raio limitado

# text
seg-f7457156f960 = Consistência interna em relação às próprias funções diretas do motor, que é tudo o que esta capacidade pode honestamente afirmar. Cada ponto do contorno é uma inversão em forma fechada, e cada inversão é verificada devolvendo sua resposta pela função DIRETA com que as próprias linhas do relatório foram avaliadas: a coluna de J/S por jamming::effective_cn0_dbhz (que deve devolver tracking_threshold_dbhz a menos de { "1e-9" } dB-Hz), a coluna de afastamento por jamming::free_space_path_loss_db e jamming::j_over_s_db (o mesmo J/S a menos de { "1e-9" } dB), a coluna de EIRP por jamming::j_over_s_db no afastamento do próprio cenário. Verifica-se ainda que o contorno é a FRONTEIRA do conjunto de negação, e não um ponto dentro dele — lock_status perde o travamento por uma desigualdade estrita, de modo que o veredicto é medido invertendo de DEGRADED para LOST ao longo de { "1e-4" } dB de J/S de cada lado do contorno, o que um contorno errado por um epsilon falharia. A verificação mais forte é por enlace, e não por quantil: aplicar o mesmo mapa ao C/N₀ próprio de cada linha reproduz exatamente a coluna de status do relatório — { "0" } discordâncias em { "38" } de { "38" } linhas no ponto de operação documentado (kind = lunar-jamming, toda entrada no padrão exceto jammer.range_m = { "25 000" } m), onde { "26" } linhas são LOST e { "12" } não são. A monotonicidade é medida, não suposta: { "20 001" } amostras ao longo de [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violações de um afastamento estritamente decrescente e de uma potência necessária estritamente crescente, de modo que a ordenação por quantis da faixa é demonstrada, e não afirmada. ExternalDataset é recusado e, com ele, a classificação como validada: não existe campanha medida de interferência lunar com a qual comparar um raio de negação, a constelação é uma geometria ilustrativa de fontes públicas de classe Moonlight/LCNS e não uma efeméride de voo, e as entradas do contorno (EIRP, potência do interferidor, ganhos de antena, temperatura de ruído) são magnitudes representativas. ReferenceImpl também foi considerado e recusado — a inversa e a expressão direta são a MESMA álgebra lida em dois sentidos, de modo que a ida e volta detecta erros de transcrição e de sinal, mas não é uma implementação independente; chamá-la de verificação cruzada seria a manobra de independência emprestada que as invariantes da matriz existem para impedir. O que a faixa traz é medido e citado, e não afirmado: nesse ponto de operação o contorno de escalar único é { "27.402916" } km e coloca { "25" } km do lado negado para todas as { "38" } linhas, enquanto a faixa { "21.256108" } .. { "29.921360" } km contém o ponto de operação e, portanto, relata a divisão que a tabela de fato mostra. Os dois critérios também são medidos como discordantes — a faixa de razão de potência ({ "38.186527" } .. { "53.691675" } km) não contém { "25" } km de modo algum — razão pela qual ambos são impressos

# text
seg-2d3944107ba0 = Poder de detecção do monitor de integridade entre modalidades

# text
seg-38bc7c0bfe57 = O relatório hybrid-optical-rf declara o que o monitor de qui-quadrado entre modalidades realmente consegue DETECTAR, e não apenas que ele passa em um caso sem falhas: o viés mínimo detectável por eixo monitorado (leste, norte, vertical, relógio) nas probabilidades de falso alarme e de detecção perdida declaradas do cenário, a curva de poder de detecção de cada lado dele, o múltiplo do viés sem ruído em que a estatística realizada cruza pela primeira vez o limiar e o tempo até a detecção para uma rampa de viés a uma taxa declarada. Falhas também são injetadas através do monitor real e a estatística que ele devolve é relatada ao lado da previsão analítica

# text
seg-b6b8dec4dcff = Duas referências internas, nenhum conjunto de dados externo. ({ "1" }) Ida e volta em forma fechada: o viés mínimo detectável é produzido invertendo a cauda do qui-quadrado não central sobre o parâmetro de não centralidade (raim::pbias) e é verificado devolvendo a não centralidade resultante por raim::noncentral_chi2_cdf no limiar do próprio monitor, o que deve devolver P_md. ({ "2" }) Injeção versus análise: um viés é escrito na estimativa de RF de um eixo e cross_raim::run_cross_raim é executado de novo, de modo que a estatística comparada com a não centralidade analítica é a que o monitor calculou, e não uma rederivação. Um Monte Carlo com semente da própria estatística é mantido nos testes como terceira verificação; ele NÃO está no relatório de propósito, porque uma estimativa amostrada seria mais lenta e não reproduzível bit a bit. ExternalDataset é recusado: a grandeza é o poder de detecção DESTE monitor na alocação de sigma DESTE cenário, e as magnitudes de sigma pelas quais o MDB é escalado são entradas representativas modeladas, não medições. ReferenceImpl também foi considerado e recusado — o Monte Carlo amostra a mesma estatística que a análise descreve, de modo que detecta erros de transcrição e de coeficiente, mas não é uma implementação independente do monitor. { "0.30" } rodada { "2" } (pré-registrada 0135a9e4), bloqueada (permanece MODELLED): chi2/ncx2/brentq do SciPy { "1.18.1" } reproduzem o limiar do relatório (dentro de { "5.4e-12" }), o MDB por eixo, a curva de poder, o múltiplo de cruzamento e o tempo até a detecção da rampa (dentro de { "5.3e-10" }) em cinco configurações; as estatísticas de falhas injetadas não têm referência independente e as magnitudes de sigma são entradas modeladas, portanto a delimitação aguarda uma decisão do responsável

# text
seg-38cabd4921c1 = Recrescimento da covariância pós-handover em relação ao limite de alerta

# text
seg-9287268bbada = O relatório hybrid-optical-rf expõe o modelo de ruído de processo do filtro e declara por quanto tempo a solução pós-handover permanece dentro do limite de alerta: para ambos os sentidos de transferência, ele carrega a covariância por eixo que o handover deixou, a propaga adiante sob um ruído de processo de passeio aleatório declarado e relata o instante em que o 1σ escalado pela cobertura atinge os limites de alerta horizontal, vertical e de temporização, qual limite é atingido primeiro, a constante de tempo de duplicação da variância e um perfil amostrado de deriva que delimita o cruzamento. As PSDs de ruído de processo, o fator de cobertura e os limites de alerta são todos entradas com padrões documentados

# text
seg-c85b822227f3 = Nenhuma referência independente externa. O cruzamento é uma solução em forma fechada do crescimento da variância por passeio aleatório, e os testes o recalculam de forma independente a partir dos valores que o próprio relatório publica, e não a partir dos internos do emissor. A covariância inicial é fixada bit a bit ao traço que o bloco de transferência já existente relatou, de modo que a deriva não possa propagar uma covariância que ninguém mais viu. As PSDs de ruído de processo são entradas representativas MODELLED e os tempos de cruzamento escalam diretamente com elas, o que o teste de escala declara como propriedade medida, e não como afirmação. ExternalDataset é recusado deliberadamente: o tempo de deriva é uma função direta de duas PSDs modeladas e de limites de alerta que são eles próprios representativos, e não existe uma deriva de handover óptico/RF lunar medida com a qual comparar. Uma referência independente externa aqui exigiria uma curva publicada de crescimento de covariância pós-handover ou de exatidão de holdover para um receptor comparável, com seu modelo de ruído de processo declarado, verificada com uma tolerância

# text
seg-a3b8272862aa = Padrão de antena fora do eixo na exportação de geometria lunar

# text
seg-27d246503a48 = A exportação de geometria por satélite traz, por (época, satélite), o ângulo fora do eixo NO SATÉLITE e o ganho de transmissão em direção ao local a partir do padrão real de abertura circular uniformemente iluminada (Airy), e relata a contagem de satélites dentro do feixe sob esse padrão AO LADO da contagem sob a aproximação simétrica de ganho para largura de feixe (θ_3dB[deg] = √(31000/G_lin)), com a diferença emitida como uma correção explícita em links, em satélites por época e como a pior época isolada. Ambas as eficiências de abertura implícitas da aproximação são emitidas ({ "0.641" } contra a regra de { "70" }·λ/D graus com que é citada, { "0.920" } contra uma abertura circular uniforme), de modo que a eficiência que ela supõe silenciosamente seja declarada, e não inferida. Desligado por padrão: o bloco só aparece quando um local de exportação e uma abertura são ambos fornecidos

# text
seg-f7f79e2dd6c5 = Misto, e separado em vez de agrupado. O PADRÃO subjacente é validado externamente e mantém sua própria linha (uma fixture scipy.special.j1 a menos de { "0.05" } dB em tests/validate_p1_orbital_footprint.rs, mais aqui a abscissa de meia potência de Airy publicada x = { "1.61634" } localizada por bisseção e não suposta). A GEOMETRIA é verificada em relação à trigonometria de triângulos em forma fechada, escrita como uma expressão diferente do produto escalar sob teste. A CONTENÇÃO do feixe real pelo cone aproximado é álgebra derivada (28.019/√η contra { "29.479" } graus por λ/D), de modo que a correção só pode ser não positiva para η ≤ { "0.9035" }. Mas as próprias CONTAGENS dentro do feixe não têm referência independente externa: nenhuma tabela publicada informa quantos satélites de uma camada de classe Moonlight/LCNS mantêm um local do polo sul dentro do feixe de meia potência de um dado prato, e a constelação é uma aproximação ilustrativa de fontes públicas, não uma efeméride de voo. A discordância medida no ponto de trabalho documentado — { "0" } enlaces no feixe sob o padrão real contra { "28" } sob a aproximação, −{ "2.33" } satélites por época, pior época { "3" }, em { "76" } enlaces avaliados — é, portanto, um resultado MODELLED sobre a aproximação, fixado como literal de regressão (a linha mais próxima fica a { "0.069" }° de qualquer borda do feixe, quatro ordens de grandeza acima de qualquer discordância no último dígito), e não um número de cobertura validado externamente. Rotular a linha como ExternalDataset com base na própria âncora externa do padrão seria validação emprestada, que é a manobra que as invariantes da matriz existem para impedir. { "0.30" } rodada { "2" } (pré-registrada d9755d28), bloqueada (permanece MODELLED): a geometria SPICE e as funções de Bessel do SciPy reproduzem o ângulo fora do eixo (pior caso { "3.0e-5" } graus), o ganho de Airy e os indicadores de dentro do feixe em { "6 336" } linhas de estados de orbitadores em voo e do ponto de trabalho documentado; mas na geometria de voo os indicadores se dividem pela identidade do satélite (o enlace mais próximo fica a { "1.66" } graus da borda do feixe), a visibilidade de { "5" } graus é verificada como indicador, não como elevação numérica, o indicador da aproximação simétrica aplica a regra prática 31000/G a um ângulo validado sem validar a regra, e as eficiências implícitas não têm referência independente; a delimitação aguarda uma decisão do responsável

# text
seg-6fbfa234ef3e = Perda de travamento da malha de rastreamento e captura por falsificação sob interferência

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perda de travamento calculada a partir da dinâmica da malha, e não de uma razão de potência: jitter térmico de 1σ de portadora (Costas) e de código (antecipado/atrasado não coerente) contra C/N₀ com a perda por elevação ao quadrado, contra as regras declaradas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + defasagem de rampa ≤ d/2 chips; limiares de C/N₀ de queda e de retravamento com a malha determinante nomeada e a histerese DERIVADA da largura de banda de captura mais ampla, e não afirmada; o tempo declarado até perder o travamento a partir de um detector de travamento de dois limiares com tempos de permanência de confirmação, relatado separadamente do tempo físico de escape de fase (tempo médio de Viterbi entre saltos de ciclo, em log₁₀ s porque abrange centenas de décadas); a maior taxa de variação de código e de Doppler da portadora que as malhas da vítima conseguem seguir; e o RAIO DE NEGAÇÃO que a dinâmica da malha implica, relatado ao lado do raio existente de razão de potência, com sua diferença com sinal como um campo nomeado próprio. Executável como o tipo de cenário <c1/>

# text
seg-c3794c8d85c5 = O próprio correlador sdr do motor (sdr::correlate / synth_if / CaCode) avançado sobre FI sintética com semente em um C/N₀ calibrado — um caminho de código separado que chega aos mesmos números por correlação numérica de IQ amostrado, e não por uma expressão algébrica de jitter, de modo que é uma rota diferente e não uma reformulação — mais valores tabulados padrão da Bessel modificada I₀ para o termo de salto de ciclo. Teoria de malha segundo Kaplan & Hegarty cap. { "8" } e Viterbi/Gardner para o tempo de salto. A linha permanece ReferenceImpl/MODELLED: a verificação cruzada vive nesta mesma base de código, e a verificação de bessel_i0 valida uma função especial e não o modelo de rastreamento, de modo que promover a linha com essa base seria um rótulo em benefício próprio. ExternalDataset exigiria um conjunto de dados de FI bruta gravada com C/N₀ de verdade e um instante anotado de perda de travamento (classe TEXBAT/OAKBAT); nenhum acompanha esta árvore e, mesmo com o IQ, esses conjuntos de dados não publicam verdade do estado da malha por época, de modo que um tempo declarado de perda de travamento só poderia ser validado contra o detector de travamento de algum outro receptor, o que é uma escolha modelada e não uma referência independente. As larguras de banda de malha, o tempo de integração, o espaçamento do correlador, a razão de captura, os tempos de permanência, a potência do interferidor e os ganhos de antena são valores representativos de faixa, não uma folha de dados. { "0.30" } rodada { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, executado como programa) em FI gerada de forma independente (pré-registrada 6ef7698c, emendas ao método de medição divulgadas), um resultado (permanece MODELLED): o jitter de PLL e DLL em malha fechada concorda dentro de { "8" } % a { "35" } a { "45" } dB-Hz, o estresse dinâmico de { "10" } Hz/s dentro de { "1" } % e a defasagem de rampa de código de primeira ordem dentro de { "2" } %; a { "30" } dB-Hz o jitter do PLL é { "21" } % maior e o jitter do DLL { "32" } % menor, os limiares medidos da regra dos 15 graus ficam { "1.5" } dB acima do motor, e a malha de segunda ordem salta { "0.5" } a { "2" } décadas com mais frequência que o limite de tempo de salto de primeira ordem. { "0.30" } revisão: o tempo de salto de Costas agora usa a SNR de malha rho/4 (saltos de meio ciclo); o log10_mean_time_to_cycle_slip_s padrão de jitter_table cai de { "11.58" } para { "2.10" } no limiar de { "25.47" } dB-Hz

# text
seg-69155fb79ebd = Covariância de coordenadas de estações de VLBI lunar a partir de um cronograma de rastreamento

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Derivadas parciais de atraso acumuladas sobre um cronograma de linhas de base × épocas em uma matriz de informação de Fisher, invertida para a covariância de coordenadas de estação e o sigma de estação por coordenada, substituindo um enlace de equipartição isotrópica suposto a partir de uma precisão de atraso escalar. O estado carrega coordenadas de estação fixas à Terra (ITRS), de modo que o Jacobiano é a derivada parcial inercial rotacionada pela matriz GCRS→ITRS de cada época, e a rotação da Terra é o que torna essas coordenadas observáveis — o relatório MEDE a varredura da linha de visada fixa à Terra e a declinação do farol, em vez de supô-las. Posto, defeito de datum, número de condição, o espectro de informação e o espaço nulo da rede livre são emitidos em toda execução e, sob deficiência de posto, o sigma principal é publicado como NULL com um status, e não lido de uma inversa quase singular. O valor de equipartição c·σ_τ·√(g/N) para o MESMO cronograma é impresso ao lado do calculado, com sua razão, junto com o limite de traço isotrópico √(p/trace(M)) que o AM-HM torna um piso rígido. Executável como o tipo de cenário <c1/>

# text
seg-b259d4d18f42 = Uma rota independente no próprio repositório. Cada linha do Jacobiano é rederivada por diferença finita central de lunar_vlbi::vlbi_delay_s avaliada a partir das próprias coordenadas fixas à Terra e fixas ao corpo lunar do estado, rotacionadas adiante pela cadeia de referenciais — um caminho que não calcula nenhuma derivada e não compartilha nenhuma expressão com as derivadas parciais analíticas — e as matrizes de informação que as duas rotas constroem concordam a menos de { "1e-6" } da maior diagonal. O núcleo de álgebra linear que isso compõe (information_matrix, crlb, sym_eig) tem âncora externa separada em relação a numpy.linalg.eigh / numpy.linalg.inv em tests/fim_observability_reference.rs, e a observável de atraso carrega a própria referência independente de campo distante do delta-DOR de lunar_vlbi; a linha não toma emprestado nenhum dos dois estados. Identidades em forma fechada verificadas aqui e rotuladas como tais: escala de σ² e 1/N, e √(p/trace(M)) como um limite inferior AM-HM que o sigma calculado não pode superar, o qual coincide com o valor de equipartição apenas em uma geometria isotrópica — razão pela qual a razão medida é exatamente a anisotropia que a hipótese descartou. { "0.30" } comparação externa (Biblioteca: NAIF SPICE CSPICE N0067 via spiceypy { "8.2.0" }, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), pré-registrada ({ "50863551" }) junto com uma execução de sensibilidade a erro de modelo do lado do motor: cada linha do Jacobiano é reconstruída por diferenças centrais de diferenças de tempo de luz newtonianas convergidas a partir da geometria SPICE (a equação do tempo de luz é um script curto sobre posições SPICE; o SPICE traz a geometria), com o cronograma reconstruído a partir de elevações SPICE. O cronograma, o posto, o defeito, o espectro de informação, o número de condição, os sigmas de estação, o valor principal, o limite de traço, as razões de equipartição, o espaço nulo da rede livre, a varredura da linha de visada e a declinação do farol concordam dentro dos { "1" } % / { "0.1" } graus pré-registrados, o que fica acima do erro analítico conhecido da Lua do motor ({ "3.2e-3" } nos sigmas, medido antes da execução). O NumPy { "2.3.5" } refaz a álgebra linear sobre o Jacobiano confirmado do motor até { "2e-13" } (P2). Validado como limite de Cramér-Rao para o conjunto reduzido de parâmetros declarado nas entradas ilustrativas declaradas: a efeméride do centro da Lua, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos fixos nas duas etapas, de modo que não é uma exatidão de campanha real

# text
seg-0f4d023fe2d4 = Covariância de coordenadas de pontos da superfície lunar a partir de um cronograma de atrasos de VLBI, mantida distinta da das estações da Terra

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Uma terceira escolha de datum, <c1/>, que mantém fixas todas as estações da Terra e estima apenas as coordenadas do FAROL fixas ao corpo lunar — a configuração para a qual de fato se cita a incerteza de um ponto da superfície lunar, já que as coordenadas das estações da Terra são uma entrada do modelo de atraso e não uma incógnita dele. Ela existe porque a covariância no nível da estação e a covariância do ponto da superfície são GRANDEZAS DIFERENTES separadas pelo braço de alavanca ρ/B, e nada antes impedia que uma fosse citada no lugar da outra. O bloco <c2/> emitido traz ρ, a linha de base mais longa, o braço de alavanca, a forma de ponto da superfície do enlace de equipartição c·σ_τ·(ρ/B)·√(g/N), o sigma do farol por coordenada calculado e sua razão — a razão nula, e não enganosa, sempre que o farol não é estimado ou a matriz tem deficiência de posto. B é tomado como a linha de base MAIS LONGA presente, a mais favorável, de modo que a razão só pode subestimar. Executável como <c3/> com <c4/>, o que é recusado com uma mensagem que nomeia a entrada ausente quando o farol não é estimado

# text
seg-18096ae23d96 = Identidades em forma fechada, sem referência independente externa reivindicada nem disponível. O braço de alavanca é verificado em relação a ρ/B e as duas formas de equipartição entre si até { "1e-15" } — identidades algébricas, que detectam um erro de ligação e nada mais, e são rotuladas como tais. O resultado substantivo é MEASURED, e não afirmado: um atraso de uma linha de base fixa restringe a DIREÇÃO do farol, de modo que a componente da linha de visada chega à matriz de informação apenas pelo termo de distância de campo próximo, e o teste lê a anisotropia resultante do espectro emitido em vez de derivá-la. O AM-HM torna √(p/trace(M)) um piso rígido, de modo que um enlace de equipartição isotrópica só pode SUBESTIMAR, e a razão calculada sobre a equipartição é exatamente a anisotropia que ele descartou. MEASURED no par tipo Goldstone/tipo Canberra cuja corda é { "10726.748" } km: ao longo de { "112" } dias amostrados, { "36" } não admitem nenhuma época de visibilidade mútua com uma máscara de { "10" }°, o máximo de visibilidade mútua é { "17" } de um cronograma de 49 amostras, e nos { "73" } dias viáveis a razão das três componentes vai de { "113.9" }× a quatro ordens de grandeza a mais, mediana { "1513" }×, enquanto restringir às duas direções transversais que a linha de visada não deixa sem informação dá { "3.94" }× a { "25.8" }×, mediana { "7.8" }×. O QUE ESTA LINHA NÃO AFIRMA: qualquer um desses valores como propriedade de uma campanha real. Ela estabelece que a grandeza do ponto da superfície agora é CALCULADA, e não suposta, e que não pode ser trocada silenciosamente pela do nível da estação. Permanece ReferenceImpl/MODELLED: não existe covariância publicada de ponto da superfície de VLBI lunar com a qual validar, as estações e o local do farol são ilustrativos e não levantados, e a efeméride, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, de modo que este é um limite de Cramér-Rao para um conjunto reduzido de parâmetros e otimista por si mesmo. A mesma grandeza no caminho por kernel (farol na Lua DE440) é validada em sua própria linha, "…, kernel path"; neste caminho analítico o menor sigma do farol fica { "3.9" } % abaixo da referência independente SPICE dessa linha, razão pela qual esta linha permanece MODELLED

# text
seg-8958521eedf7 = Covariância de coordenadas de pontos da superfície lunar a partir de um cronograma de atrasos de VLBI, caminho por kernel

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = A covariância do farol com todas as estações fixas do cenário lunar-vlbi-fim (todas as estações da Terra mantidas, apenas as coordenadas do farol fixas ao corpo lunar estimadas) com o farol colocado na Lua DE440 do JPL lida pelo leitor de kernel do próprio motor (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Apenas o centro da Lua difere do caminho analítico; a rotação do corpo IAU { "2015" }, as estações, a rotação da Terra e a álgebra linear são as mesmas. As saídas validadas são o conjunto de observações, o espectro de informação de { "3" } x { "3" }, o posto e o número de condição, os três sigmas do farol fixos ao corpo e seu RMS, o braço de alavanca e a razão calculada sobre a equipartição, no cronograma padrão. Executável como o cenário <c1/> com datum = "all-stations-fixed", estimate_beacon = true e planetary_kernel_path definido

# text
seg-63250578ec6b = Etapa de biblioteca vinculante: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) em de440s, earth_latest_high_prec (ITRF93 com UT1 e movimento polar) e os referenciais lunares DE440, o farol fixo em MOON_ME; cada linha do Jacobiano é uma diferença central de { "3" } km da diferença de tempo de luz newtoniana convergida (o próprio código de tempo de luz da referência independente M069, importado), nunca uma derivada parcial do Kshana; visibilidade reconstruída a partir de elevações WGS-84; eigh e inv do NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK). Etapa P2: NumPy sobre o Jacobiano confirmado do motor. Pré-registrada (4a51256) antes de a fixture ou a referência independente existirem, com limiares de { "1" } % em autovalores, condição, sigmas, RMS e razão, { "1e-4" } no braço de alavanca, conjunto de observações e posto exatos; P2 { "1e-9" }. Divulgado: a comparação apenas do motor entre a Lua analítica e a de kernel ({ "3.9" } % no sigma y) foi executada antes do pré-registro, para escolher o caminho por kernel, e está declarada ali. Resultado: as duas etapas concordam, pior caso { "1.7e-3" } (sigma y do farol { "0.081211" } m contra { "0.081351" } m). Mutação: transpor a rotação do corpo da derivada parcial do farol falha nas duas etapas. Os dois lados leem o DE440, de modo que a concordância valida a geometria e a álgebra linear sobre o DE440, não o DE440. Fora da afirmação: a exatidão de ponto da superfície de uma campanha real (relógios, troposfera e orientação da Terra mantidos fixos; estações e local do farol ilustrativos) e o caminho analítico padrão (linha acima, que permanece MODELLED: na Lua analítica o sigma y fica { "3.9" } % abaixo desta referência independente)

# text
seg-0315968c8214 = PNT diferencial lunar — orçamento de resíduos do enlace de correção

# text
seg-c6785166a44c = Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado antes como margem não modelada: erro de levantamento da estação de referência (correlacionado entre satélites, independente da linha de base, transferência de posição de ~{ "1" }:{ "1" } e comprovadamente não amplificado pelo DOP), envelhecimento da correção (o vetor de erro de órbita congelado reprojetado sobre a linha de visada em que o próprio propagador do motor coloca o satélite uma latência depois, mais a deriva de relógio c·σ_y(τ)·τ da lei de potência calibrada) e quantização uniforme do enlace sobre uma escala completa exata de ±(orbit_err + clock_err) com variância step²/12. Relatados nos domínios de distância e de posição, ao lado — nunca no lugar — do resíduo e do nível de proteção existentes, com uma curva de latência ao lado do valor único

# text
seg-29b8e6c12471 = Identidades em forma fechada e autoconsistência: a variância step²/12 do quantizador uniforme, a propagação exata de covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que colapsa em σ·PDOP para σ igual, a transferência { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref e o fechamento em quadratura ao desligar. A verificação cruzada do PDOP em relação a orbit::dop compartilha a matriz normal [−û, { "1" }], portanto é uma verificação de consistência e é rotulada como tal, e não como uma referência independente. Nenhum ExternalDataset está disponível nem é reivindicado: nenhuma estação da superfície lunar tem exatidão levantada publicada, nenhum enlace de correção diferencial lunar tem latência ou formato de mensagem publicados, e o resultado de quantização é uma forma fechada e não uma medição. O RTKLIB — já a referência independente de código externo para o núcleo de diferença simples e mínimos quadrados ponderados — poderia ser acionado com uma base deliberadamente mal levantada para confirmar a transferência { "1" }:{ "1" } do levantamento, mas isso é código independente sobre a mesma álgebra de linha de visada de primeira ordem. AS MAGNITUDES SÃO MODELLED: o padrão de levantamento é a própria alocação de realização de referencial lunar deste crate e não uma estação medida, a latência e a contagem de bits são entradas ILLUSTRATIVE, e o crescimento do próprio VETOR de erro de efemérides transmitido não é modelado de forma alguma — declarado na string da lei de envelhecimento emitida, porque é o termo com maior probabilidade de dominar um enlace real

# text
seg-c42646ae4707 = Mapa de cobertura e exatidão de estações de referência lunares

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grade de usuários no polo sul e um dia de épocas (o tipo <c1/>): para uma estação de referência diferencial em um local conhecido do polo sul, por ponto e sobre a região, o erro de posição percentil corrigido e não corrigido (3-D, horizontal, vertical), a disponibilidade com um motivo para cada época indisponível (user_lt4, station_missing_sat), a cobertura em relação a um limite declarado antes da execução, níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento do enlace de correção na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; não é afiliado nem endossado por nenhuma agência

# text
seg-2308d94fa25e = Aritmética recalculada por um script numpy independente em casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; pré-registrada em tests/fixtures/lunar_station/PREREGISTRATION.md, confirmada isoladamente em 9caedf97 antes da primeira execução): em { "20" } casos com todos os termos de erro ligados, os conjuntos visíveis e o status são idênticos, os erros brutos de distância concordam até { "1.4e-14" } m, os vetores e módulos de erro de posição até { "1.4e-9" } m contra um limiar de { "1e-6" } m, e o p95 de cada ponto é igual a numpy.percentile bit a bit; as correções da estação NÃO ATINGIRAM seu limiar de { "1e-9" } m (pior caso { "3.73e-9" } m, { "15" } de { "20" } casos), e com elas os erros de distância corrigidos: verificado em aritmética de 60 dígitos, ambos os lados estão dentro do arredondamento de precisão dupla do valor exato, sendo o termo de levantamento uma diferença de duas distâncias de { "1e7" } m cuja unidade da última casa é { "1.86e-9" } m; registrado, não ajustado. O tipo se reduz exatamente ao tipo lunar-differential-pnt em um ponto, uma época e um ensaio. O modelo de erro, o modelo de decorrelação e todo limiar são próprios deste projeto ou ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-7ecf4b0038b0 = Máscaras de horizonte do terreno lunar a partir de um perfil declarado ou de um DEM polar

# text
seg-7102948907bc = Máscaras de horizonte dependentes do azimute por local para o tipo lunar-station-coverage (a estação de referência e cada ponto de usuário) e para a grade moonlight-service-volume e seu local de exportação por satélite (cada linha de exportação ganha clears_terrain), no formato de tabela de linha do horizonte { "0.36" } (skyline::Skyline, linear em azimute com fechamento em { "360" } graus; um perfil declarado e um horizonte de DEM em um local se combinam como seu máximo ponto a ponto): um station_horizon ou user_horizon de [terrain] declarado e rotulado com sua fonte, e/ou um horizonte traçado por raios sobre um DEM estereográfico polar sul (o layout polar em grade do LRO LOLA, lido de um descritor que fixa seu tamanho e SHA-256, ou um bloco latitude/longitude realdata::lola_dem com [terrain] dem_tile_path, ecoado com seu SHA-256) ao longo de grandes círculos da esfera lunar com curvatura exata, a partir de uma altura de mastro declarada, em um passo de azimute e um alcance declarados. Um satélite conta em um local quando ultrapassa a mask_deg plana e o horizonte em seu azimute (lunar_service::topocentric); uma época em que o horizonte deixa menos de quatro satélites em um ponto, onde a máscara plana dá quatro, é contada com o motivo de indisponibilidade terrain_masked. O DEM incluído é um recorte do produto de domínio público LOLA LDEM_75S_240M, reamostrado por média de blocos de { "5" } x { "5" } para { "1200" } m (data/lunar-dem/NOTICE.md). Se ausente, todo local mantém a máscara plana e todo documento é idêntico byte a byte

# text
seg-dd838d199a0d = Superfícies em forma fechada (InternalConsistency): o mergulho da esfera nua, uma cratera em um platô sobre a esfera com um observador sobre o seu centro e fora dele, e um cone analítico em relação à sua própria rasterização. No recorte real, um lançamento de raios independente em numpy (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; pré-registrado em tests/fixtures/lunar_terrain/PREREGISTRATION.md, confirmado isoladamente em edbb9b02 antes de o script existir) concorda em cinco locais: alturas dos locais até { "1.0e-11" } m e todas as { "1800" } elevações de horizonte até { "5.5e-10" } graus contra limiares de { "1e-6" }, contagens de raios truncados exatas; isso verifica a aritmética, não o terreno. Nenhum valor publicado de horizonte ou iluminação polar foi reproduzido: o recorte de { "1200" } m incluído suaviza o relevo submétrico que os estudos de iluminação publicados resolvem, de modo que os horizontes do DEM são uma linha de visada MODELLED sobre um DEM real reamostrado, não um horizonte validado. O local da estação e a constelação permanecem ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-d37bb01e270b = Termos de multipercurso e de hardware do receptor da estação de referência lunar

# text
seg-1103199f019b = A seção opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multipercurso dependente da elevação sigma(el) = a + b exp(-el / el0) no usuário e na estação (a forma funcional aerotransportada do RTCA DO-229, com a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graus como padrões; na Lua todo valor é ILLUSTRATIVE), branco no usuário e Gauss-Markov de primeira ordem ao longo das épocas na estação (rho = exp(-dt / tau)); ruído térmico de código do DLL antecipado-menos-atrasado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); vieses entre canais por canal constantes ao longo de um ensaio, no usuário e na estação. Os termos da estação entram em suas correções, os do usuário nas medições brutas e corrigidas, cada um em seu próprio fluxo com semente. Se ausente, todo documento permanece inalterado

# text
seg-4fbc7d86b491 = Formas fechadas e estatísticas dos próprios sorteios do modelo (InternalConsistency): a fórmula do DLL em relação a um cálculo manual, a forma do DO-229, a diferença de linha de base zero de dois receptores, a correlação de defasagem 1 de Gauss-Markov. Não existe medição lunar de multipercurso ou de receptor com a qual comparar; os valores são ILLUSTRATIVE e nada aqui é uma afirmação sobre qualquer receptor real

# text
seg-03796cb741b6 = Crescimento do erro de efemérides da estação de referência lunar ao longo da latência da correção

# text
seg-13b0ae9a874a = A entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): uma correção aplicada latency_s depois de calculada perde o crescimento g latency_s do erro de órbita transmitido, g isotrópico de taxa RMS 3-D, sorteado por satélite e ensaio em seu próprio fluxo com semente (taxa de 1-sigma tau / sqrt({ "3" })), além da reprojeção da linha de visada do erro congelado. Se ausente, todo documento permanece inalterado. Um adendo K5 à comparação de afirmações publicadas, pré-registrado isoladamente, executa o K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-332ceb320b65 = O sigma em forma fechada do termo de crescimento e a verificação de propagação de primeira ordem (InternalConsistency). O adendo K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, pré-registrado isoladamente em 59d88248): o K5 falha em toda taxa, p95 3-D corrigido de { "369.8" } m, { "2315" } m e { "22797" } m contra um limiar de { "1.5" } m ({ "292.96" } m registrado sem crescimento), como declarado antes da execução. Nenhuma fonte pública fornece uma taxa de crescimento lunar: ILLUSTRATIVE

# text
seg-90307f07e0ef = Modos de solução da estação de referência lunar: restrição de altura, três satélites, janela de usuário estático

# text
seg-366c7ad03fb2 = A seção opcional [solution] de lunar-station-coverage (LRS-06): uma linha de pseudomedição de altura up . dx = e_h de 1-sigma declarado ponderada contra as linhas de distância, um mínimo de três satélites permitido apenas com ela e uma solução de mínimos quadrados ponderados sobre as últimas window_epochs épocas com uma posição estática compartilhada e um relógio por época (a resposta de um filtro para uma posição estática sem ruído de processo sobre os mesmos dados; os erros das épocas são tratados como independentes). Se ausente, a solução instantânea e todo documento permanecem inalterados. Um adendo à comparação de afirmações publicadas com o estilo de solução das fontes, pré-registrado isoladamente

# text
seg-bfe05379b7aa = A redução instantânea e os casos em forma fechada do solucionador (InternalConsistency). O adendo (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, pré-registrado isoladamente em 001ca100) com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (configurações ILLUSTRATIVE; as fontes declaram um filtro, uma restrição de altura e três satélites, mas não suas configurações): K1 a K5 falham e K6 é satisfeito, { "1" } de { "6" } como na execução registrada; o erro p95 3-D corrigido do R300 cai de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não avaliado) e a cobertura permanece { "0" }. A hipótese de independência da janela a favorece. Não é uma afirmação sobre nenhum sistema real

# text
seg-611ba369ed00 = Exatidão e cobertura da estação de referência lunar em relação a afirmações publicadas

# text
seg-4fe4f1cffa2b = O tipo lunar-station-coverage executado sob as hipóteses públicas do material publicado sobre uma estação de referência diferencial lunar (quatro satélites de navegação em órbitas elípticas congeladas de { "24" } h, SISE de { "10" } m a { "95" } %, ruído de código de { "0.30" } m, latência de correção de { "1" } s e { "600" } s, um levantamento da estação em escala submétrica, o local de estação de exemplo publicado, os círculos do polo sul de { "300" } km e { "600" } km) e avaliado em relação às afirmações numéricas das fontes sob seis limiares unilaterais pré-registrados antes da execução: cobertura de todo o polo sul com p95 submétrico (K1, K2), p95 corrigido submétrico e em nível decimétrico (K3, K4), submétrico mantido com latência de { "600" } s (K5) e exatidão mantida de { "10" } km a { "500" } km de linha de base (K6)

# text
seg-eb6d3be85fec = Referência: as afirmações numéricas de cinco fontes públicas registradas com URL, data de obtenção, SHA-256 e licença em tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; slides do IOAG Cislunar PNT Workshop { "2025" } e { "2026" }; UNOOSA ICG WG-B Lunar PNT, junho de { "2024" }), transcritas com referências de página em tests/fixtures/lunar_station_published/CLAIMS.md. Limiares, casos e entradas foram pré-registrados em tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisão { "2" }, 05bf9a19, confirmada isoladamente antes da execução). { "0.36" } primeira execução, um resultado (permanece MODELLED): { "1" } de { "6" } limiares é satisfeito. A cobertura é { "0.00" } nos dois círculos contra >= { "0.95" }, e o erro p95 3-D corrigido é { "280.6" } m ({ "300" } km) e { "293.0" } m com latência de { "600" } s, contra <= { "1.5" } m. O limiar decimétrico (K4) não podia ser satisfeito com o ruído de código de { "0.30" } m das fontes, o que reflete um conflito entre as fontes e não um resultado do modelo. K6 é satisfeito (razão { "1.39" } contra <= { "1.5" }), mas, como razão entre dois valores dominados pela geometria, não é evidência sobre decorrelação em nenhum dos sentidos. Causa: os elementos dos satélites não são públicos e, com os elementos ILLUSTRATIVE da árvore, um usuário e a estação compartilham quatro satélites acima de { "5" } graus em apenas { "8.2" } % ({ "300" } km) e { "6.3" } % ({ "600" } km) das épocas, em geometria quase singular (p95 não corrigido de { "3.8" } km contra < { "10" } m das fontes). As simulações das fontes usaram um filtro, uma restrição de altura e três satélites em visada comum, o que o tipo instantâneo não modela. A comparação, portanto, nem confirma nem refuta o 'submétrico sobre todo o polo sul' publicado. Ela mostra que o resultado deste modelo depende de órbitas que não são publicadas. Não é uma afirmação sobre nenhum sistema real; não é afiliado nem endossado por nenhuma agência

# text
seg-478225d0a8e1 = Núcleo de nível de proteção do ARAIM lunar

# text
seg-863690a44f21 = A etapa de geometria para covariância do nível de proteção lunar — (GᵀG)⁻¹ sobre a geometria com todos em visada e cada subgeometria de falha única, projetada sobre a vertical local e o traço do bloco horizontal — e seu núcleo estatístico: o multiplicador de detector de Bonferroni, a cauda gaussiana superior de cada hipótese de falha e a solução de raiz que mapeia um orçamento de risco de integridade em um nível de proteção, sobre um volume de serviço lunar de 7 pontos

# text
seg-8191906fc700 = Duas implementações estabelecidas de terceiros compostas, ambas executadas off-line, com a fixture regenerada de ponta a ponta e verificada como idêntica byte a byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilado a partir do código C com -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverte a matriz normal por LU de Crout com pivotamento parcial, um algoritmo sem relação com o invert4() de Gauss-Jordan escrito à mão do kshana; numpy.linalg.inv (LAPACK getrf/getri) reinverte cada uma como uma terceira inversa independente, concordando com o RTKLIB até { "1.112e-12" } relativo. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) fornecem norm.isf, norm.sf (Cephes ndtri/ndtr) e optimize.brentq em relação à série da gama incompleta de Numerical Recipes do kshana, à inversa por bisseção e à bisseção de 200 passos — e o sf direto do SciPy é uma rota numérica diferente para a cauda distante em relação ao { "1" } − Φ do kshana, de modo que o cancelamento na cauda profunda é medido, e não espelhado. O eixo vertical é o vetor unitário radial (a definição de vertical local em uma Lua esférica) e a variância horizontal é o traço do bloco horizontal, de modo que nenhuma convenção de azimute Leste/Norte é compartilhada. EXPLICITAMENTE FORA DO QUE ESTA LINHA TORNA VALIDATED: σ_URE, a probabilidade a priori de falha por satélite e a constelação ilustrativa de classe Moonlight/LCNS são entradas MODELLED entregues à referência independente como dadas; e a FORMA da equação de integridade MHSS de falha única é transcrita do mesmo limite publicado que o kshana implementa — uma forma fechada compartilhada é uma hipótese compartilhada, de modo que esta linha cobre uma avaliação errada dessa equação, não uma escolha errada dela. Nenhuma implementação de terceiros de ARAIM MHSS está ao alcance (o RTKLIB não expõe ponto de entrada de nível de proteção, não existe distribuição PyPI desse tipo, o Stanford MAAST é MATLAB), o que é a melhoria pendente

# text
seg-0ec1699f5754 = Níveis de proteção do ARAIM MHSS em relação a vetores de referência publicados

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = A própria equação do nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos em visada e por modo de falha em uma geometria Leste/Norte/Vertical com um estado de relógio por constelação, os sigmas das subsoluções, os sigmas de separação de soluções e as projeções de viés nominal unilaterais, os limiares K_fa de Bonferroni, a alocação de risco de falhas não monitoradas e o VPL/HPL que resolvem a equação de risco de integridade. Executável como o tipo de cenário <c1/>

# text
seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junho de { "2019" }), exemplo numérico trabalhado do Apêndice D — ENTRADAS publicadas (matriz de geometria de 10 satélites e 2 constelações, diagonais C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) e SAÍDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } e seis intermediários de falha de constelação), obtido em 2026-09-20, SHA-256 da fonte 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Coincidência na tolerância PRÓPRIA declarada pela referência TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT e σ_v_acc até sua precisão impressa. O Milestone { "3" } Report ({ "2016" }) do mesmo subgrupo, Anexo A §A.IX, declara o mesmo exemplo, mas é internamente inconsistente — um erro de sinal na linha { "3" } de G (+{ "0.7477" } onde o documento de { "2019" } imprime −{ "0.7477" }; com o sinal de mais, o próprio σ_v_acc do documento resulta em { "0.8690" } m contra seu { "1.47" } m publicado), e um K_fa_3 avaliado em { "57" } modos de falha enquanto o documento declara N_fault_max = { "1" }, isto é, { "12" }, de modo que seu EMT segue o limiar de 57 modos e seu VPL/HPL não. Nenhuma implementação aderente à norma consegue reproduzir todas as suas saídas ao mesmo tempo. Seus intermediários de geometria são reproduzidos exatamente e seus níveis de proteção são registrados como discrepâncias medidas (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), excluídas do valor de aceitação; a tolerância não foi ampliada para absorvê-las. ESCOPO: apenas N_fault_max = { "1" } — subconjuntos de falhas com múltiplos eventos são recusados em vez de truncados, e a exclusão, a verificação de consistência por qui-quadrado e a etapa de realocação de dupla contagem permanecem MODELLED

# text
seg-7bfcb5c6a985 = ARAIM com hipóteses de falha simultânea de múltiplos satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: a regra de determinação de subconjuntos da ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorados com menos removidos primeiro) generalizada de pares para combinações simultâneas de até max_order eventos de satélite e de constelação, com o a priori exato P_no fault prod q_e; add_v42_protection_levels_to_order executa sobre ele o caminho de nível de proteção da ADD v4.2 (a ordem { "2" } é exatamente o caminho existente). raim::araim_subset_raim (opcional): RAIM avançado sobre esse conjunto de hipóteses, cada subconjunto monitorado um modo (p_fault, T, b, sigma) na soma de risco de integridade, subconjuntos não observáveis movidos para o risco não monitorado, o orçamento escalado pela alocação da ADD do risco não monitorado e o subconjunto de maior separação normalizada relatado quando uma falha é detectada. Probabilidades a priori que exigem subconjuntos mais profundos que max_order são recusadas, nunca truncadas

# text
seg-6c6076ea1eee = Consistência interna (InternalConsistency): a redução de ordem 2 ao caminho da ADD v4.2 verificado pelo MAAST, a rederivação independente das probabilidades a priori e uma falha construída de dois satélites. Nenhuma execução do MAAST ou do RTKLIB além de pares foi feita, de modo que os conjuntos de hipóteses mais profundos e os níveis de proteção do RAIM por subconjuntos não são verificados externamente. araim_subset_raim compartilha as simplificações de araim_dual_raim (um sigma para integridade e exatidão, um relógio, a cauda normal simples): não é aderente à norma da ADD

# text
seg-48ca01332f8f = RAIM ao lado das figuras de mérito de holdover de relógio

# text
seg-890f1006a75d = A seção opcional [integrity] do tipo clock (clock_integrity::run): a partir de um local declarado e de predefinições de constelação (geometry::sky_geometry), em cada época de integridade enquanto a linha do tempo do GNSS não está negada, RAIM instantâneo (raim::snapshot_raim: teste de qui-quadrado de paridade, níveis de proteção por inclinação) sobre os satélites acima da máscara com resíduos gaussianos com semente do sigma declarado e um viés declarado opcional; um bloco integrity_fom separado com veredictos por época, níveis de proteção e disponibilidade. Épocas negadas são relatadas como indisponíveis, nunca extrapoladas; as figuras de mérito de holdover permanecem inalteradas e, sem a seção, a saída é idêntica byte a byte

# text
seg-c2860bf4b562 = Consistência interna (InternalConsistency): os níveis de proteção são os do snapshot_raim, que é validado em relação ao RTKLIB em sua própria linha, recalculados na mesma geometria; comportamento sem falhas e com falha injetada. O céu é uma geometria predefinida representativa (não um almanaque datado), os resíduos são sintéticos e sigma, os limites de alerta e as probabilidades são entradas declaradas; nada aqui é uma afirmação sobre a disponibilidade de um receptor real

# text
seg-9cbb4ee7588a = Observabilidade cislunar de comprimento de arco espacial, ruidosa e de múltiplas famílias

# text
seg-5ebd771deef8 = O limiar de observabilidade de comprimento de arco cislunar no CR3BP ESPACIAL de seis estados, e não no planar de quatro estados, em famílias DRO, halo L2 e halo quase retilíneo L2, com o ruído de medição entrando no Gramiano e DOIS critérios relatados porque não existe um único honesto: o critério de posto publicado, comprovadamente invariante a um sigma de medição homocedástico (o branqueamento multiplica a matriz de observabilidade por um escalar, deixando inalterados o espectro relativo de valores singulares e, portanto, o posto, o defeito e a condição), e um critério de estimabilidade — o primeiro arco em que a incerteza formal de 1σ de posição do estado inicial do chefe cai abaixo de um limite declarado — que é o que de fato se move com o ruído. Cada limiar traz o intervalo da grade de épocas em que se situa; um critério não atingido é null com um motivo. O modo planar continua sendo o padrão e as famílias fora do plano são recusadas ali, em vez de achatadas em um estado que não consegue representá-las

# text
seg-046231819882 = Um posto independente por forma escalonada com eliminação gaussiana e pivotamento parcial confirma cada veredicto de posto de seis estados — um algoritmo diferente que não compartilha código com a rota de autovalores/SVD sob teste. A matriz de transição de estados do CR3BP de { "6" }×{ "6" } que isso compõe traz sua própria referência independente ReferenceImpl em relação à integração variacional do SciPy, e as condições iniciais de halo/NRHO vêm de um corretor que reproduz a órbita Gateway L2 sul { "9" }:{ "2" } publicada. A perna existente do filtro de informação em raiz quadrada NÃO é contada como corroboração, explicitamente: ela consome os mesmos Jacobianos e se reduz à mesma matriz normal, de modo que é uma verificação de consistência entre duas máquinas numéricas, e o rótulo de extensão emitido diz isso. NÃO ancorada externamente, e ExternalDataset é, portanto, recusado em vez de tomado emprestado da linha da STM: os próprios comprimentos de arco de limiar dependem do projeto da constelação MODELLED, da grade de épocas e — de forma mensurável, em até { "40" }× — da tolerância de valor singular. O { "2.09" } h planar publicado é reproduzido exatamente em rel_tol = { "1e-6" } e é ele próprio dependente da tolerância ({ "10.25" } h em { "1e-4" }, { "0.42" } h em { "1e-8" }), o que é uma propriedade do critério e não da órbita. Nenhum conjunto de dados público publica um limiar de observabilidade de comprimento de arco para uma constelação cislunar escolhida. RESULTADO MEASURED: o limiar espacial de seis estados é { "22.17" } h para a NRHO L2 e { "40.42" } h para o halo L2, e NÃO EXISTE para a família DRO planar sobre a qual a afirmação publicada foi derivada — posto { "4" } de { "6" } com defeito de datum { "2" } e dois autovalores exatamente nulos, um defeito estrutural que nenhum comprimento de arco recupera

# text
seg-e250321394bc = Erro de predição da orientação da Terra em estilo operacional, medido como predito versus final

# text
seg-0e443d241460 = Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para o UT1; Chandler, anual e semianual para o polo — extrapolado com o último resíduo da janela levado adiante: a classe que o IERS Bulletin A usa, no lugar do preditor de persistência em que o horizonte publicado se apoiava. Avaliado da única maneira honesta: uma previsão para T+h construída a partir de linhas rápidas do Bulletin A em T ou antes, medida contra o final do Bulletin B PUBLICADO DEPOIS em T+h, com a persistência avaliada sobre o mesmo conjunto de épocas contra os mesmos finais ao lado. Uma época-alvo sem final publicado é descartada em vez de reavaliada contra a coluna rápida; um termo periódico que a janela não consegue restringir é relatado como rejeitado com os ciclos que de fato abrange; uma janela incompleta é recusada em vez de silenciosamente encurtada

# text
seg-822a1ce99154 = Três rotas independentes, nenhuma delas uma figura publicada de exatidão de predição. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única forma de exercitar a maquinaria periódica, já que nenhuma série confirmada é longa o bastante para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados em forma fechada de livro-texto, uma álgebra diferente da solução matricial sob teste, em linhas reais. ({ "3" }) As linhas de predição arquivadas genuínas do Bulletin A que o produto real de { "2026" } publica, comparadas por antecedência como uma estatística de CONCORDÂNCIA e explicitamente não como um erro: { "0.256" } ms em { "1" } dia, { "0.695" } ms em { "2" } dias, { "1.252" } ms em { "3" } dias, chegando a { "3.885" } ms em { "9" } dias. Portanto esta é a CLASSE do Bulletin A, próxima em antecedência curta, não o Bulletin A. Os resíduos de predito versus final são grandezas reais medidas sobre linhas reais do IERS, mas sua magnitude é verificada apenas contra o SENTIDO da comparação, nunca contra um número de exatidão publicado pelo IERS — ler um produto real é proveniência, não referência independente. MEASURED: no dia { "1" } o preditor operacional dá { "3.78" } m de erro no referencial da Lua contra { "11.39" } m da persistência ({ "3.01" }×), no dia { "2" } { "10.23" } m contra { "21.72" } m ({ "2.12" }×), no dia { "3" } { "20.33" } m contra { "30.57" } m ({ "1.50" }×) — e é PIOR além de três dias ({ "0.87" }× em { "5" } dias, { "0.43" }× em { "10" }), o que o relatório emite em vez de mostrar apenas os horizontes que o favorecem. NÃO reproduzidos: o filtro autorregressivo de resíduos e a redução tabulada de marés zonais, a janela operacional de 365 dias é inalcançável com os dados confirmados, e NENHUMA versão anterior arquivada da série existe neste repositório — de modo que a tabela de versões arquivadas não relata nenhuma linha em vez de avaliar uma sintetizada. { "0.30" } comparação externa, um resultado (permanece MODELLED): avaliado contra os mesmos finais em { "178" } emissões arquivadas do Bulletin A com a janela padrão de 15 dias do crate, o MAE de UT1 do preditor é 2.4x a 12.6x o do Bulletin A em { "1" } a { "10" } dias (limiar 1.5x) e { "5.32" } ms em { "10" } dias, fora da faixa de { "0.36" } a { "3.13" } ms do 2º EOP PCC; o polo é 1.5x a 1.85x o do Bulletin A (dentro de 1.5x apenas em { "6" } e { "7" } dias); { "19" } de { "21" } condições pré-registradas falham. Correção à rota ({ "3" }): as linhas do produto de { "2026" } com que foi comparada trazem o sinalizador I (medido) do IERS, não P, de modo que esses valores de concordância são em relação a valores rápidos medidos, não a predições do Bulletin A. { "0.30" } rodada { "2" }, um preditor de mínimos quadrados mais autorregressivo com as marés zonais removidas analiticamente, contra { "178" } emissões arquivadas do Bulletin A no limiar da rodada 1 (pré-registrada c93605b4), um resultado (permanece MODELLED): { "12" } de { "21" } condições se mantêm; o MAE de UT1 é { "1.73" } a 2.11x o do Bulletin A em { "2" } a { "10" } dias (limiar 1.5x), enquanto o polo fica dentro de 1.27x em toda antecedência. { "0.30" } revisão: com a entrada off-line agora classificada pelo sinalizador do IERS, os valores de concordância da rota ({ "3" }) são em relação a predições reais do Bulletin A (0.256/0.695/1.252/3.885 ms em 1/2/3/9 dias contra linhas rápidas -> 0.133/0.421/0.839/2.786 ms)

# text
seg-f4efd94dd746 = Datum de referencial lunar a partir de uma campanha de observação

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA, em vez de recuperado de uma transformação injetada. Estações da Terra observam um catálogo com fonte de faróis da superfície lunar em um cronograma explícito; as derivadas parciais de atraso do VLBI lunar são acumuladas em uma matriz de informação de Fisher de coordenadas dos faróis e propagadas pelo projeto de Helmert A = [I₃ | [p]ₓ | p] até H = AᵀM_bA, de modo que a exatidão de datum relatada é função do programa de observação — exatamente linear no sigma de atraso e monótona no arco pela libração que o relatório MEDE. O defeito de datum é o assunto, e não uma nota de rodapé: posto, defeito, número de condição, espectro, direções inobserváveis na base de sete parâmetros, a direção mais fraca mesmo com posto completo e a parcela de cada parâmetro nela são emitidos em toda execução, e qualquer parâmetro que a campanha não restrinja é publicado como NULL com um status. A correlação de erro dos faróis é MEASURED, não suposta — exatamente zero com as estações mantidas fixas, e impressa com seu custo quando elas são estimadas. Executável como o tipo de cenário <c1/>

# text
seg-8eedf0240350 = Identidades em forma fechada e uma rota independente no próprio repositório, sem referência independente externa reivindicada. O projeto de Helmert — a única derivada nova no módulo — é rederivado por diferença finita central de lunar_frame_realise::apply_helmert, um caminho que não compartilha nenhuma expressão com a forma analítica. A acumulação que ele compõe é a do lunar-vlbi-fim, cujo Jacobiano é diferenciado por diferenças finitas em relação a lunar_vlbi::vlbi_delay_s ali, e cujo núcleo de álgebra linear tem âncora externa separada em relação ao numpy em tests/fim_observability_reference.rs — esta linha não toma emprestado nenhum dos dois estados. A referência independente de física é estrutural e não numérica: a derivada parcial de atraso de um farol é a DIFERENÇA de campo próximo de dois vetores unitários quase paralelos, de modo que a direção de translação pior determinada DEVE ser a direção fixa ao corpo em direção à Terra, e o teste afirma a resposta calculada em relação à direção medida separadamente. MEASURED: sigma de translação derivado da campanha { "6.3975" } m contra o erro de recuperação de { "0.3125" } m do cenário de transformação injetada ({ "20.5" }× mais apertado), enquanto rotação e escala vão no sentido OPOSTO, { "2.32" }× e { "13.5" }× mais folgadas — o caminho injetado supõe um único sigma isotrópico e, portanto, espalha seu erro uniformemente por sete parâmetros, o que a observável de atraso não faz. Posto 7/7, mas condição { "3.8e5" }, com uma direção { "99.57" } % pura de translação em direção à Terra e quarenta vezes pior que qualquer outra. O QUE ESTA LINHA NÃO AFIRMA: que o valor da campanha esteja certo em termos absolutos. Ela estabelece que o valor agora DERIVA de um cronograma, de uma geometria e de um modelo de erro, e não de uma resposta plantada. Permanece ReferenceImpl/MODELLED: não existe par publicado de campanha de VLBI lunar mais covariância de datum, a rede de estações e o sigma de atraso são entradas ILLUSTRATIVE (o catálogo de faróis tem fonte, a campanha não), as observações são tratadas como independentes enquanto a troposfera e o relógio de uma sessão real são correlacionados entre varreduras próximas, e a efeméride, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS. { "0.30" } comparação externa, um resultado (permanece MODELLED): com toda linha do Jacobiano dos faróis reconstruída a partir de tempos de luz do NAIF SPICE (DE440, ITRF93, MOON_ME; pré-registrada { "50863551" }), o cronograma, o posto de Helmert, os sigmas de datum (dentro de { "4.7e-3" }), a condição, a direção mais fraca ({ "0.07" } graus), a varredura de libração e a ordenação de arcos concordam em seis cenários dentro dos { "1" } % / { "0.2" } / { "0.05" } graus pré-registrados. O NumPy sobre o Jacobiano confirmado do motor concorda até { "3e-14" } onde as estações são fixas. Com as estações estimadas, difere em { "6.8e-6" } contra um { "1e-9" } pré-registrado, cuja premissa de número de condição estava errada (condição de Helmert { "2.1e8" }; rotas independentes de NumPy discordam em { "3e-6" }; uma contribuição do recurso de pseudoinversa { "1e-9" } do motor não está descartada), de modo que a linha não é promovida com base nesse pré-registro. { "0.36" } novo registro com um limiar escalado pela condição (pré-registrado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir do condicionamento da informação conjunta e de sua redução de Helmert), um resultado (permanece MODELLED, NOT MET): a etapa { "0" } descarta o recurso de pseudoinversa para a lacuna de { "6.8e-6" } (nenhuma matriz a montante da matriz de Helmert recorre a ele nos seis cenários originais, com a menor margem de um fator { "2.6" }), a etapa SPICE ainda se mantém em todos os seis, e o NumPy concorda dentro do limiar em seis de oito cenários (padrão, os dois arcos, o sigma de atraso 3x, o defeito colinear e a nova execução de estações fixas em 2026-12-01; pior caso { "0.13" } de seu limiar). Falha em stations_estimated (sigmas de datum de até { "6.8e-6" }, condição { "9.1e-6" }, norma com independência descartada { "3.5e-6" }, contra t = { "5.9e-7" }), e na nova data o farol do polo sul não tem observação, de modo que a informação do farol tem deficiência de posto (recurso de pseudoinversa a montante da matriz de Helmert nos dois cenários novos) e a referência independente NumPy inalterada não consegue avaliar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-ca481f2d8f9e = Corroboração por estimador independente do limiar de comprimento de arco cislunar

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do chefe a partir de medições intersatélites simuladas sobre prefixos crescentes da mesma grade de épocas que a tabela de posto versus arco usa, com as derivadas parciais das medições tomadas como diferenças finitas centrais do modelo direto composto. Ele não consome nada da maquinaria com que o limiar foi medido — nenhuma linha de Jacobiano analítico, nenhuma matriz de transição de estados variacional, nenhuma decomposição em valores singulares ou autovalores, nenhuma tolerância de posto, nenhum filtro de informação em raiz quadrada — e compartilha apenas a dinâmica, as condições iniciais, a observável escalar e a grade de épocas, cada um nomeado no documento emitido. Dois critérios, ambos varridos: recuperação sem ruído (o análogo do posto) e estimabilidade de Monte Carlo (o análogo da estimabilidade, medida contra uma verdade conhecida e não prevista a partir de uma covariância). Executável como o tipo de cenário <c1/>

# text
seg-60e30948cee7 = Um estimador separado nesta base de código, com um algoritmo diferente e um caminho de código disjunto: Gauss-Newton ponderado não linear com derivadas parciais por diferenças finitas, com seu veredicto lido como um erro medido de recuperação de estado em km e mm/s. Ele não tem nenhuma expressão em comum com a rota de posto e covariância do Gramiano, e a separação é IMPOSTA por uma proteção sobre o texto-fonte, e não afirmada. MEASURED na grade DRO planar publicada: o critério de ESTIMABILIDADE é CORROBORATED — a fronteira de Monte Carlo medida é { "5.739130" } h contra o formal { "5.739130" } h (razão { "1.0000" }), e o RMS medido reproduz o 1σ formal ao longo de { "21" } comprimentos de arco com uma razão de média geométrica de { "0.9804" }. O critério de POSTO NÃO é corroborado como fronteira de recuperabilidade: o estimador recupera a partir de { "0.782609" } h contra os { "2.086957" } h do Gramiano, razão { "0.375" }, e em { "1.826087" } h — o último prefixo que a leitura de posto avalia como { "3" } de { "4" } — recupera até { "1.96e-5" } do deslocamento a priori. A fronteira de recuperação não se move ao longo de três décadas de seu próprio limite, enquanto o limiar de posto abrange de 'nunca' a { "0.782609" } h ao longo de quatro décadas de rel_tol, e os dois coincidem exatamente em rel_tol = { "1e-8" }. Essa abrangência foi registrada primeiro como chegando a { "0.260870" } h; esse valor era um ARTEFATO, produzido por uma leitura de posto que contou { "4" } direções a partir de { "2" } linhas de medição abaixo do piso de ruído de f64, e é corrigido aqui em vez de mantido. A leitura de posto agora é limitada pela desigualdade de Sylvester, com o motivo emitido, e a abrangência corrigida satura exatamente no arco em que o estimador independente recupera, o que reforça a validação cruzada desta linha em vez de enfraquecê-la: o { "1e-6" } publicado é uma CONVENÇÃO conservadora de valor singular, não uma afirmação sobre recuperabilidade. Mesmo padrão espacialmente: NRHO { "9.290323" } h contra { "21.677419" } h, halo { "22.978723" } h contra { "39.829787" } h, com a estimabilidade concordando exatamente em ambos. O DRO planar de seis estados não recupera em nenhum arco, reproduzindo de forma independente o defeito estrutural de datum dessa família a partir de um estimador que nada sabe sobre ele. NÃO ancorado externamente — a dinâmica e as condições iniciais são compartilhadas com a análise sob teste e nenhum conjunto de dados público publica tal limiar — de modo que ExternalDataset é recusado

# text
seg-f839285852d9 = Volume de serviço lunar a partir de geometria de constelação real e obtida

# text
# c1: ephemeris_path
seg-c3059fcced49 = Aceita uma efeméride tabulada de estados centrada na Lua (a avaliação de um kernel SPK/BSP) ou uma definição publicada de constelação por trás de <c1/>, executa contra ela a mesma varredura de cobertura / DOP / nível de proteção e emite o requisito de telemetria σ_URE que ela implica AO LADO dos resultados keplerianos e perturbados ilustrativos inalterados, com a diferença como grandeza nomeada própria. Todo valor traz uma classe de proveniência que distingue o derivado de kernel do derivado de elementos publicados e do modelado, de modo que os dois nunca possam ser confundidos em uma citação posterior

# text
seg-cbe9bd6bf989 = A GEOMETRIA é externa e tem hash: três fixtures cujos números vêm apenas de documentos obtidos com URL, data de obtenção e SHA-256, regeneráveis por geradores confirmados que verificam o hash de origem e ABORTAM em vez de emitir um número — a constelação de referência da demonstração de interoperabilidade LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), os estudos de caso do LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) e uma efeméride genuína de espaçonaves em voo para LRO, Danuri, Chandrayaan-2 e CAPSTONE avaliada a partir dos kernels reconstruídos do próprio JPL via Horizons. NENHUM kernel de constelação de navegação lunar existe publicamente — Moonlight/LCNS, LCRNS e LNSS não estão em voo e o NAIF não publica nada para elas — e nenhum foi inventado. O requisito σ_URE DERIVED NÃO tem referência independente externa (ninguém publica a exatidão de telemetria que um HPL lunar de { "50" } m exige sobre este volume de serviço), de modo que é verificado contra sua própria identidade algébrica e, de forma independente, executando de novo toda a varredura no requisito calculado e confirmando que a disponibilidade se inverte ali. MEASURED: o projeto publicado de 8 satélites exige σ_URE de { "2.9044" } m com { "100" } % de cobertura, contra { "0.3591" } m com { "37.85" } % da constelação ilustrativa — uma revisão de { "8.09" }× de um número publicado pela regra de programa R4. A conclusão qualitativa se mantém (um LNIS de classe { "30" } m ainda não fecha um HPL de { "50" } m no polo sul), mas a insuficiência havia sido superestimada oito vezes. A demonstração LANS de 5 satélites produz ZERO amostras de nível de proteção — cinco satélites não podem fornecer os seis em visada de que um conjunto de hipóteses de falha única precisa — e o campo de requisito está AUSENTE em vez de fabricado; o mesmo vale para as quatro espaçonaves reais com { "0" } % de cobertura. InternalConsistency é o tipo honesto: os dados de ENTRADA são externos e têm hash, mas a grandeza de que esta linha trata é validada apenas contra si mesma. { "0.30" } comparação externa, um resultado (permanece MODELLED): contra as estatísticas do estudo de caso do LNCSS em navi.613 em { "346" } pontos de grade, { "4" } de { "12" } estatísticas de disponibilidade ficam fora dos { "2" } pontos percentuais pré-registrados (caso A: -4.0, +{ "22.5" } e -3.6 pp; caso B: -12.1 pp). Causas prováveis: elementos lidos no referencial errado, Kepler de dois corpos ao longo de { "15" } dias contra o modelo de forças não declarado do artigo e uma grade não reproduzível a partir do texto. A metade do PDOP não pôde ser avaliada (o LANS não imprime nenhuma estatística numérica); o teste de comparação é confirmado ignorado. { "0.30" } rodada { "2" }, um resultado (permanece MODELLED): contra uma referência independente Orekit { "12.2" } / Hipparchus { "3.1" } que calcula o relatório inteiro (propagação do Orekit, visibilidade e DOP do DOPComputer, níveis de proteção MHSS compostos no Hipparchus, o requisito resolvido por amostra; pré-registrada d3ce97b2) em todas as cinco geometrias obtidas e duas grades, { "155" } de { "160" } valores concordam dentro dos limiares pré-registrados ({ "2" } pp, { "5" } %, { "1" } %), incluindo o requisito sigma_URE para LNCSS A e C ({ "3.879072208" } m nos dois lados para o caso A) e o requisito ausente para o LANS e os orbitadores. O LNCSS B na grade densa falha em suas estatísticas de pior amostra (sigma_required { "0.000923" } contra { "0.001511" } m, hpl_max { "1.63e6" } contra { "0.99e6" } m), onde geometrias quase singulares (PDOP em torno de { "1e6" }) amplificam a concordância de posição em nível de metro; seu requisito p95 concorda ({ "1.6343" } contra { "1.6357" } m). O requisito da pior amostra é mal posto em geometria degenerada. Contra o navi.613: { "4" } de { "12" } ainda fora de { "2" } pp (fixado)

# text
seg-36a6cfaf5afa = Unidade e proveniência declaradas para toda grandeza relatada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Um esquema legível por máquina que dá unidade, classe de proveniência e definição para todo campo numérico de todo relatório de cenário, mais um único portão global que executa todo tipo de cenário registrado e falha se um campo numérico emitido não tiver qualquer um dos dois. O vocabulário de proveniência é fechado e cada classe carrega um nível de evidência, com duas classes deliberadamente mapeadas para <c1/> e <c2/> em vez de receberem um nível que a classe não determina

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
seg-a8c4a6fd4989 = O próprio documento emitido: toda folha numérica deve resolver para uma entrada no próprio bloco units desse documento. Não existe registro externo de unidades contra o qual verificar uma unidade DECLARADA, de modo que uma unidade declarada é uma afirmação revista e não uma verificada — o portão verifica COMPLETUDE e BOA FORMAÇÃO, não a verdade, e validado estaria errado porque nada externo confirma que <c1/> é a unidade certa para um campo chamado <c2/>. Uma verificação cruzada independente por sufixo de nome foi executada sobre os { "1,434" } campos descritos NAQUELE MOMENTO: dos { "691" } que levam um sufixo indicativo de unidade, { "40" } discordam da unidade declarada e todos os { "40" } são explicados (sufixos por segundo, mínimos, segundos de abertura, newton-metros contra um sufixo com aparência de nanômetro), de modo que nenhuma unidade errada apareceu. Essa verificação cruzada não foi executada de novo desde então, e a cobertura cresceu além dela — o valor é deixado no que foi de fato medido, em vez de reafirmado no total atual. No momento dessa mudança ({ "0.27.0" }), a cobertura passou de { "7" } de { "56" } tipos para { "60" } de { "61" }, e de { "389" } de { "1354" } campos para { "1,742" } de { "1,744" } (docs/field-units-schema.json, que uma verificação de obsolescência mantém atualizado). NENHUM tipo continua descoberto (teto { "0" }, FUT-28, { "0.36" }): o último era <c3/>, em que duas colunas são indexadas pelo chamador, de modo que suas unidades são dados; elas agora são descritas como <c4/> e a unidade de cada posição é lida da própria tabela de unidades do pacote VARRIDO para <c5/> e <c6/> (ou tomada do <c7/> declarado do eixo, que deve concordar com o do pacote quando ambos existem; null quando nenhum existe, declarado e não adivinhado). <c8/> era o anterior a ele, e saiu da lista quando seu documento publicado ganhou um bloco de unidades: a fixação de aditividade que havia nomeado <c9/> como chave proibida agora COMPROVA que a adição é aditiva — retire o bloco de volta e o documento ainda gera o hash das duas constantes congeladas antes de ele existir, de modo que um valor publicado que se movesse por baixo da adição ainda falha. O trabalho também trouxe à tona doze defeitos de unidade ou de documentação no código existente, relatados e não corrigidos sob a R1

# text
seg-cf779c468eed = Datum de referencial lunar a partir de uma campanha de observação REAL

# text
# c1: lunar-llr-datum
seg-96151f13a92b = A covariância do datum de Helmert de sete parâmetros, com suas duas entradas simuladas substituídas por medidas: o cronograma são as épocas de transmissão em solo de { "337" } pontos normais arquivados de telemetria laser lunar do ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7845" } e Matera MLRO { "7941" }, todos os cinco arranjos de retrorrefletores) e cada peso de observação é a própria precisão arquivada daquele ponto bin_rms/√n_raw — mediana de { "5.13" } mm de distância de ida, lida do arquivo. Coordenadas das estações do IERS ITRF2020, coordenadas dos refletores da Tabela { "7" } do JPL DE430. Executável como o tipo de cenário <c1/>. A afirmação validada ({ "0.36" }) é estreita: no caminho analítico padrão, o cálculo da covariância do datum concorda com uma referência independente SPICE de tempo de luz e NumPy em pontos normais medidos novos; não é uma exatidão de LLR e não é evidência de que a Lua analítica seja exata

# text
seg-50c60fc25ded = Identidades em forma fechada, uma rota independente no próprio repositório e, desde { "0.36" }, uma referência independente de biblioteca SPICE e NumPy em dados medidos novos (abaixo); não existe par publicado de covariância de datum de LLR lunar com o qual verificar, de modo que nenhuma exatidão é reivindicada. A única derivada nova — a derivada parcial da distância em relação à posição do refletor fixa ao corpo — é rederivada por diferença finita central do tempo de luz de ida e volta que ela diferencia, um caminho que não compartilha nenhuma expressão com a forma analítica. A referência independente de física é estrutural: a derivada parcial de uma distância É o dobro da linha de visada, de modo que a coordenada fixa ao corpo ao longo da direção média até a Terra deve ser determinada muito melhor que as duas coordenadas no plano do céu, que só a libração alcança — medido em { "50.7" }× a { "71.7" }× nos cinco arranjos contra uma varredura de libração que o relatório mede de forma independente, com a previsão isotrópica de pequenos ângulos e a anisotropia transversal que explica a diferença, ambas impressas. O QUE MUDOU: o cronograma, a contagem de observações e cada peso de observação agora são medidos; { "337" } de { "349" } pontos arquivados são usados e os { "12" } que não são são ignorados e contados, porque o ITRF2020 não traz posição para Apache Point. MEASURED: sigma de translação do datum { "1.851746e-2" } m contra os { "6.3975" } m da campanha SIMULADA ({ "345" }×), rotação { "36" }×, escala { "24" }× — uma razão entre uma rede de telemetria laser e uma rede de atraso de VLBI, de modo que é um resultado e não uma validação. Posto de informação dos refletores 15/15 com acoplamento entre arranjos exatamente { "0" }; posto de Helmert 7/7, condição { "2.4e4" }. O QUE ESTA LINHA NÃO AFIRMA: que o valor esteja certo em termos absolutos. Uma solução real de LLR co-estima a órbita lunar, as librações físicas, a orientação da Terra, as coordenadas das estações e parâmetros de maré e relativísticos, e relata decímetros (os próprios 0.12-0.27 m da Tabela { "7" } do DE430) onde este limite é muito menor; este é um limite de Cramér-Rao para um conjunto reduzido de parâmetros declarado, não uma exatidão. Fora da afirmação validada (modelado, não validado): a efeméride do centro da Lua e a orientação de corpo IAU { "2015" } são modeladas, e troposfera, marés, excentricidade de estação, movimento polar, UT1-UTC, atraso relativístico e relógios de estação estão ausentes. Seu tamanho combinado é PUBLICADO e não argumentado — distância de ida observada menos calculada de { "156,494" } m RMS ao longo dos { "337" } pontos — e seu efeito sobre a covariância é LIMITADO e não argumentado: resolver de novo todo o datum com toda derivada parcial inclinada de { "0.1" }° (o dobro da inclinação medida da efeméride na pior época, com sinal alternado) move o resultado entregue em { "0.288" } %. VERIFICAÇÃO EXTERNA (rodada { "2" } de { "0.30" }, pré-registrada 6b27964a), um resultado (permanece MODELLED): o tempo de luz de ida e volta do SPICE (DE440, ITRF93, orientação lunar do DE440) com derivadas parciais por diferenças finitas e uma inversa em numpy, nos mesmos { "337" } pontos normais medidos e pesos, concordam na contabilidade, em ambos os postos, no acoplamento nulo, no RMS dos resíduos ({ "2.1e-5" }) e em { "15" } de { "16" } valores de covariância. O sigma de translação em z é { "1.03" } % alto contra o limiar pré-registrado de { "1" } %. Com o centro da Lua do DE440 ele cai para { "0.049" } % (c51f8b2, dados vistos) e, em novos pontos normais de { "2019" }, o datum com a Lua de kernel satisfaz todos os limiares (linha "…, kernel Moon centre"), onde a Lua analítica também fica dentro dos limiares (pior caso { "3.8e-3" }, apenas informativo), de modo que essa comparação não separa os modelos da Lua. EXECUÇÃO COM DADOS NOVOS DO CAMINHO ANALÍTICO ({ "0.36" }, pré-registrada 31f5283 antes de qualquer ponto ser obtido): a referência independente SPICE e NumPy inalterada em { "151" } pontos normais EDC CRD v2 usados de 2025-04..06 (um ano que nenhum teste havia usado; arquivos obtidos de novo e referência independente executada de novo de forma independente, ver o NOTICE da fixture) nos mesmos limiares: contabilidade, postos, contagens por arranjo e acoplamento nulo iguais; sigmas e normas com pior caso { "1.11e-3" } (limiar de { "1" } %), condição { "8.95e-4" } ({ "2" } %), razões transversal/ao longo com pior caso { "1.79e-3" } ({ "2" } %); O-C do SPICE { "10.79" } m. VALIDATED com essa evidência como verificação de biblioteca apenas do cálculo de covariância; o RMS residual analítico nessa fatia é { "222" } km, de modo que os limiares não discriminam modelos da Lua (como na linha de kernel). Resultados: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

# text
seg-c815cb90dcde = Geodesia da estação de referência lunar: retrorrefletor e farol de VLBI adicionados em relação ao datum dos cinco arranjos

# text
seg-103cf21173ac = As entradas opcionais extra_reflectors e extra_beacons do cenário lunar-llr-datum acrescentam um bloco station_geodesy: a informação de Helmert dos cinco arranjos a partir da fatia arquivada de telemetria laser lunar mais a informação que um retrorrefletor adicionado (medido nas épocas de pontos normais arquivadas em que a estação de medição está acima do horizonte, cada uma com o peso arquivado desse ponto normal) e um farol de VLBI adicionado (observado pela rede e pelo cronograma do lunar-frame-campaign com as estações da Terra fixas, pelas derivadas parciais de atraso do lunar-vlbi-fim) em locais declarados colocam sobre o datum de sete parâmetros, resolvido de novo, com o 1-sigma de cada parâmetro de Helmert antes e depois, sua razão, as normas antes e depois e os autovalores extremos da diferença de Fisher. Ausentes ou vazias, o relatório permanece inalterado

# text
seg-479a7e6bbedb = Apenas consistência interna: cada local adicionado é um ponto distinto e uma distância a laser ou um atraso de VLBI de estação fixa toca um ponto, de modo que sua informação A_p^T M_p A_p é semidefinida positiva e se soma; o teste verifica a diferença de Fisher e cada variância em relação a isso. O resultado dos cinco arranjos é a linha de dados reais existente e permanece inalterado. O refletor adicionado reutiliza épocas programadas para os cinco arranjos existentes, um cronograma ILLUSTRATIVE, e a rede, o cronograma e o sigma de atraso do farol adicionado são as entradas ILLUSTRATIVE do lunar-frame-campaign; o local é uma posição ILLUSTRATIVE no polo sul. Um local no polo sul vê a Terra baixa no horizonte ou nem a vê, o que os testes de ângulo de visada existentes expressam; nenhum dos locais é medido continuamente. Os valores são limites de Cramer-Rao para um conjunto reduzido de parâmetros, não um datum resolvido e não uma afirmação sobre qualquer estação real

# text
seg-d9f033ebf109 = Datum de referencial lunar a partir de uma campanha de observação REAL, centro da Lua por kernel

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = A covariância do datum de Helmert de sete parâmetros do lunar-llr-datum a partir de pontos normais do ILRS arquivados e seus pesos medidos, no caminho por kernel: o centro geocêntrico da Lua é lido do JPL DE440 pelo leitor de kernel do próprio motor (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Apenas o centro da Lua difere da linha analítica; a orientação IAU { "2015" }, o movimento polar e o UT1 ausentes, os catálogos, as regras de seleção, os pesos e a álgebra linear são os mesmos. A afirmação validada é apenas que a covariância do datum deste caminho concorda com uma referência independente SPICE e NumPy em pontos normais novos e não vistos. A comparação não discrimina modelos da Lua e não verifica o centro da Lua: na mesma fatia a Lua analítica também satisfaz todos os limiares, a mutação pré-registrada (a Lua de kernel lida uma hora atrasada) não foi detectada, e um centro da Lua errado em cerca de { "4,650" } km também satisfaz (ver o texto da referência independente). Não é evidência de que a Lua de kernel melhore o datum. Executável como o cenário <c1/> com planetary_kernel_path (e normal_points_dir para outra fatia)

# text
seg-ec47513b1828 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT), tempos de luz de ida e volta no DE440, orientação da Terra ITRF93 e orientação lunar do DE440 (MOON_ME) com derivadas parciais por diferenças finitas de { "100" } m, e a matriz de informação e a inversa do numpy { "2.3.5" } (BSD-3-Clause, LAPACK): o gerador inalterado da comparação da linha analítica (6b27964a), executado em uma fatia nova (pontos normais EDC CRD, 2019-04..06) pré-registrada em 830d945a antes de qualquer parte dela ser obtida, nos limiares da linha analítica (sigmas e normas de { "1" } %, condição e razões de { "2" } %, contabilidade, postos e acoplamento exatos) e sua autoverificação da referência independente (O-C do SPICE { "10.86" } m < { "100" } m). Toda grandeza se mantém, pior caso { "7.6e-5" }. Mutações: o atraso planejado de uma hora da Lua NÃO é detectado (a covariância depende da dispersão das linhas de visada, não de sua temporização); uma mutação estrutural escolhida depois e divulgada como tal, descartando a derivada parcial do trecho de descida, falha em todo sigma. Resultado: nesta fatia a Lua analítica também satisfaz (pior caso { "3.8e-3" }), de modo que o limiar não discrimina modelos da Lua e isso valida a covariância em dados novos, não uma melhoria da Lua de kernel. Verificação do integrador na incorporação (não pré-registrada): a Lua de kernel lida em relação ao baricentro Terra-Lua em vez da Terra (RMS residual { "4,649" } km) e a época do kernel sem TT menos UTC ({ "69" } s; resíduo { "2.6" } km) ainda satisfazem todos os limiares, enquanto retirar sqrt(n_raw) dos pesos medidos falha em todas as { "16" } grandezas com faixa; a comparação é sensível aos pesos, às derivadas parciais e à álgebra linear, não ao centro da Lua. Os dois lados leem o DE440: isso valida o cálculo sobre o DE440, não o DE440. Fora da afirmação: uma exatidão de LLR (um limite de Cramér-Rao para um conjunto reduzido de parâmetros)

# text
seg-bd3af378b613 = Efeméride lunar analítica embutida — seu LIMITE DE EXATIDÃO DECLARADO verificado em relação a dados reais

# text
seg-a51c4e234a4f = ephem::moon_position, a série lunar geocêntrica de baixa precisão a que o crate recorre quando nenhum kernel DE/SPK está presente, medida contra telemetria laser lunar real e contra uma efeméride planetária publicada no mesmo intervalo. Esta linha valida o limite que o módulo declara sobre si mesmo, NÃO uma exatidão: confirma-se que a série não é pior do que diz, não que seja boa

# text
seg-81dff68ddd9c = DOIS conjuntos de dados externos independentes que não compartilham nada. ({ "1" }) { "337" } pontos normais arquivados de telemetria laser lunar do ILRS (EUROLAS Data Center, DGFI-TUM, 2015-04-08 a 2015-06-27, cinco arranjos de retrorrefletores, confirmados com SHA-256 por arquivo e um script de nova obtenção e verificação): distância de ida observada menos calculada de { "156,494" } m RMS, com coordenadas de estação do IERS ITRF2020 e coordenadas de refletor da Tabela { "7" } do JPL DE430, de modo que o resíduo é dominado pela série do centro da Lua. ({ "2" }) Estados geométricos geocêntricos da Lua do JPL Horizons no mesmo intervalo: { "112,567" } m RMS radial, { "195,655" } m RMS vetorial, pior época { "360,324" } m = { "0.0536" }°. Um resíduo de distância responde à parte RADIAL de um erro de efeméride, de modo que ({ "1" }) e ({ "2" }) são a mesma grandeza alcançada de duas maneiras e concordam até { "1.39" }× — o que autoriza o cenário lunar-llr-datum a atribuir seu resíduo à efeméride. A própria documentação do módulo do motor afirma ~{ "0.3" }° / ~poucas·10² km; ambas as medições estão dentro dela, a afirmação angular com uma margem de { "5.6" }×. ESCOPO, declarado para que nenhum leitor possa se enganar: isto valida o LIMITE declarado, não um valor de exatidão. A série continua inadequada para qualquer aplicação que precise de melhor que ~{ "1e5" } m, e essa limitação é tanto o conteúdo da linha quanto a concordância. Regenerável off-line pelos scripts confirmados de obtenção e verificação

# text
seg-44f582b17fa9 = Integridade do portão — um verde que significa o que diz

# text
# c1: cargo test --all
seg-43fbcfbe990c = Três proteções estruturais sobre o próprio processo de verificação, cada uma fechando uma classe de defeito que chegou ao portão canônico como vermelho intermitente ou espúrio. ({ "1" }) Todo caminho temporário construído nas fontes em Rust deve carregar um componente único por chamada; um id de processo é rejeitado, porque o cargo executa os testes da biblioteca como threads paralelas de UM processo e o pid é compartilhado por todas elas. ({ "2" }) Toda fixação byte a byte ou por hash deve declarar, junto de si ou no cabeçalho de seu módulo, o que cobre e o que exclui deliberadamente — de modo que uma mudança transversal possa dizer de relance quais fixações estão no escopo e quais se tornaram silenciosamente detectores de mudança de todo o repositório. ({ "3" }) Um verde só pode ser reivindicado a partir da suíte COMPLETA: scripts/gate.sh executa <c1/>, captura o código de saída verdadeiro sem nenhum pipe no caminho e grava um recibo que nomeia o commit, a contagem de binários de integração, a contagem de testes e a duração; a verificação pré-push recusa um push cujo commit nenhum recibo válido nomeia, em uma árvore limpa. A repetibilidade é amostrada separadamente por scripts/check-repeatability.sh, que executa a suíte da biblioteca N vezes e falha se o conjunto de testes aprovados diferir.

# text
seg-17a5f9da54a4 = Forma fechada: cada proteção é executada sobre um trecho conhecidamente ruim fixo que deve disparar e um trecho conhecidamente bom fixo que deve permanecer silencioso, ambos constantes literais que o detector não pode influenciar. Os dois trechos conhecidamente ruins são os defeitos F22 e F25 em sua forma original. Esta é uma referência independente INTERNA e a linha é MODELLED de acordo: prova que as proteções discriminam o defeito de sua correção, não que as classes que descrevem sejam exaustivas. Seus pontos cegos declarados — estado compartilhado que não é um caminho, uma fixação mantida em uma constante nomeada curta, uma corrida rara que três execuções não amostram e um recibo que qualquer um que possa gravar o arquivo pode forjar — estão escritos na documentação do módulo de tests/source_guards.rs e no cabeçalho de cada script, em vez de deixados para serem descobertos.

# text
seg-178192c9c87a = TPL composto — especialização escalar do MHSS (H=1_N)

# text
seg-431aaf94ec31 = TPL de separação de soluções de tempo escalar sobre fontes heterogêneas; PL conduzido pelo ruído do subconjunto de pior exclusão + viés de UTC(k)

# text
seg-9a5ea79248c8 = P2: linalg.lstsq do numpy { "2.3.5" } e scipy { "1.18.1" } (norm.isf, norm.sf, brentq) recalculam, por seus próprios algoritmos, os estimadores de mínimos quadrados ponderados dos subconjuntos, a covariância de separação geral sqrt(Δ Σ Δᵀ), os vieses e o nível de proteção a partir deles em { "300" } entradas confirmadas (tests/fixtures/tpl_scalar_numpy_oracle); o PL concorda dentro de { "1e-9" } relativo (pior caso { "1.2e-10" }) e o subconjunto de exclusão determinante é idêntico, tolerância fixada antes da comparação. Os multiplicadores, as probabilidades a priori e os majorantes de viés são entradas, e a estrutura da equação do PL (lista de modos, divisão ir/2, projeção do viés) é uma entrada declarada, como na linha do núcleo de nível de proteção do ARAIM lunar; a afirmação validada é a álgebra linear e o PL nessas entradas, não as magnitudes físicas de um cenário de temporização. Linhagem do ARAIM: Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = TPL composto — travessia de holdover iniciada por P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); PL semicontínuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrente de K(IR/2); expoentes de fase τ/τ³/τ⁵

# text
seg-1438193381be = Testes de propriedade (monotonicidade, sem queda no handover) + lint de expoentes contra holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = TPL composto — cobertura do envelope de holdover, regime plurianual (tau>=90d)

# text
seg-d9520f6c1769 = O envelope de máximo corrente majora (sem perfurar o zero) uma série metrológica real em todo atraso testado tau>=90d em um segmento disjunto; tau curto (<=30d) é uma fronteira modelada divulgada

# text
seg-086baedd33a9 = Série de 5 dias do BIPM Circular-T [UTC-UTC(USNO)] MJD 56074-60429 ({ "872" } pts, API webtai); ajuste/teste disjuntos, cobertura plurianual sem perfurar o zero

# text
seg-096b6cdfe2dc = TPL composto — envelope q.c. de LIL (impossibilidade + consistência)

# text
seg-1671add2210d = Nenhum holdover de pior caso finito (o supremo browniano diverge); HPL alocado por IR consistente com o envelope de Hartman-Wintner quando IR→{ "0" }

# text
seg-c9ed8bbede70 = Identidade do envelope q.c. em forma fechada √(2Dt·lnln t) + verificação de dominância do HPL; ponto de ligação de impossibilidade de Baweja arXiv:{ "2606.24210" }

# text
seg-5a27c9f0a67d = Majorante de integridade do viés de rastreabilidade heterogênea de UTC(k)

# text
seg-fd09ab2adbf6 = Majorante de viés por fonte b = (U/k_cov)·Phi^-1(1-tail/2) + envelhecimento, inflando uma incerteza expandida publicada do Tipo B até uma cauda de integridade alocada; faz a ponte com tpl_scalar como bias_s

# text
seg-1fd53acf9a3f = Reprodução independente em numpy + statistics da biblioteca padrão da forma fechada do majorante (InternalConsistency). A série do BIPM Circular-T [UTC-UTC(USNO)] é apenas uma entrada CITADA — é a MESMA série já validada para a linha de cobertura de holdover R4 e NÃO é revalidada aqui; reproduzir seus valores não prova nada sobre R2. A cauda profunda de integridade é modelada. { "0.30" } comparação externa, um resultado (permanece MODELLED): nos arquivos UTC-UTC(k) por laboratório do BIPM ({ "102" } laboratórios, { "105 024" } linhas com incertezas publicadas) o majorante b = { "2.576" } u na cauda de { "1e-2" } é excedido por { "50.8" } % das linhas (Clopper-Pearson de { "95" } %: { "50.4" } a { "51.1" } %) e por mais de { "1" } % em { "101" } de { "102" } laboratórios. A incerteza u publicada é a incerteza da determinação de UTC-UTC(k) pelo BIPM, não um limite do deslocamento, que rotineiramente chega a muitas vezes u; o majorante como especificado não limita o viés real de rastreabilidade de UTC(k). { "0.30" } rodada { "2" }, um majorante dos deslocamentos UTC-UTC(k) realizados treinado em 2015-2022 e testado em dados do BIPM Circular T de 2023-2026 (pré-registrada ca0921a4, excedência agrupada de no máximo { "1e-2" }), um resultado (permanece MODELLED): a excedência agrupada é { "0.0333" } ({ "694" } de { "20 826" } linhas em { "82" } laboratórios; { "0.0127" } sem as { "430" } linhas que não têm limite por regra). D9 rodada { "3" }, um limite hierárquico agrupado de envelhecimento (utck_bound), pré-registrado fb475550 e avaliado de forma prospectiva em emissões do Circular T a partir de { "465" }: ainda não executado (a emissão { "465" } foi publicada em 2026-10-12 com cerca de { "285" } valores de teste; a regra pré-registrada de 1000 valores precisa de emissões até cerca de { "468" }, e a execução precisa dos arquivos por laboratório arquivados de 2026-09-30, pois o BIPM desde então reescreveu { "87" } dos { "113" })

# text
seg-d75b900ad25f = Covariância cruzada de viés de rastreabilidade correlacionado (alocação insegura de modo comum)

# text
seg-0641f6d38c23 = Covariância cruzada de viés de N×N com termos fora da diagonal rho·b_i·b_j para fontes que compartilham um realizador de UTC(k); COMPROVADO correlated_fused_bias >= independent_fused_bias (a alocação independente ingênua subestima o viés fundido -> otimista -> insegura)

# text
seg-72359f29aab1 = Reprodução independente em numpy da covariância cruzada e da desigualdade entre o viés fundido correlacionado e o independente (InternalConsistency). Conjunto de fontes representativo; cenário modelado.

# text
seg-0359a9194c60 = Branqueamento GLS de modo comum (Aitken) + identidade de Mahalanobis

# text
seg-67b11ff6d055 = Cholesky Omega=LL^T feito à mão e branqueamento por substituição direta z=L^-1 r (Cov(z)=I quando Cov(r)=Omega); quadrado de Mahalanobis z^T z = r^T Omega^-1 r

# text
seg-24cb37529637 = P2: linalg.cholesky (LAPACK potrf), solve (gesv) e inv do numpy { "2.3.5" } sobre { "201" } entradas SPD versionadas (tests/fixtures/gls_whitening_numpy_oracle) verificam o fator implementado manualmente, o resíduo branqueado e o operador de branqueamento; o quadrado de Mahalanobis é verificado contra solve(Omega, r), que não usa Cholesky, de modo que a identidade z^T z = r^T Omega^-1 r é confirmada por um caminho distinto. Tudo dentro de { "1e-12" } relativo (pior caso { "7.9e-16" }), com a tolerância fixada antes da comparação. O maior número de condição é { "19.3" }, portanto matrizes mal condicionadas não são cobertas. O branqueamento GLS/Aitken { "1935" } é Cited.

# text
seg-1a3bb032960f = Estatística de consistência de modo comum (falha de referência compartilhada invisível à separação)

# text
seg-1b03f522b8fc = Estatística de escore ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para um deslocamento de modo comum que a separação de soluções (contrastes ortogonais a { "1" }) não consegue ver; um deslocamento de modo comum a infla, enquanto as separações par a par permanecem planas

# text
seg-d79071a5d9ec = Reprodução independente da estatística em numpy + teste de propriedade de que uma injeção de modo comum a infla (InternalConsistency). Cenário modelado. { "0.30" } rodada { "2" } (pré-registrada f9aa360d), bloqueada (permanece MODELLED): o gesv do LAPACK no numpy { "2.3.5" } reproduz o valor da estatística em { "261" } casos versionados (dentro de { "3.5e-15" } com bom condicionamento, { "1.2e-9" } com condição de até { "6.1e7" }); a lei nula qui-quadrado({ "1" }) é um teorema citado e as separações par a par planas são uma identidade sem saída do motor para comparar, de modo que a delimitação do escopo aguarda uma decisão do responsável

# text
seg-91fc18cde833 = Limite de modo comum indetectável com resíduo fora de Omega

# text
seg-0cc2c0f033c8 = Teto de modo comum indetectável: a maior magnitude de falha ao longo de uma direção d que escapa TANTO da separação (alpha_ss = T_ss / norma de contraste branqueada de d) QUANTO da estatística de modo comum (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), informado como min(alpha_ss, alpha_cm). Sob uma Omega definida positiva, as duas direções cegas (d proporcional a { "1" } e { "1" }^T Omega^-1 d = { "0" }) são mutuamente exclusivas, de modo que o teto é FINITO para todo d não nulo; ele é infinito apenas para uma direção nula ou uma Omega não definida positiva. Uma direção fora do eixo comum modelado é cega apenas à estatística de modo comum e é limitada pela separação

# text
seg-b67c71daa7de = P2: o linalg.solve do numpy { "2.3.5" } (gesv do LAPACK, LU sem Cholesky) recalcula alpha_ss (o limiar sobre a norma de contraste branqueada de d após remover seu coeficiente de modo comum GLS), alpha_cm e o mínimo entre eles em { "256" } entradas (Omega, d, T_ss, T_cm) versionadas (tests/fixtures/gls_outside_omega_bound_numpy_oracle), incluindo direções de modo comum puro, direções fora do eixo comum modelado e os casos de direção nula e de matriz não definida positiva, que devem resultar em +inf; pré-registrado (d070699a; emenda 8a44267b, antes de qualquer comparação, reformulando a forma matricial); tolerâncias fixadas antes da comparação. O texto da capacidade foi corrigido por decisão do responsável (2026-10-02): ele dizia que o limite é infinito para uma direção fora do eixo comum, o que contradizia o código e esta comparação. Que o detector idealizado de contraste único seja um limite inferior da magnitude indetectável de um detector de subconjunto real permanece Modelled

# text
seg-a7a33523bb1c = Identificabilidade do datum lunar - álgebra linear da decomposição

# text
seg-bd59cc76557a = Marginal por complemento de Schur do bloco { "{" }lunocenter-X, scale{ "}" } do Fisher do datum de Helmert de 7 parâmetros: a métrica escalar de degenerescência lambda_min(S), o CRLB da origem X e a correlação origem-escala

# text
seg-0f7e4fb31c44 = Referência independente em SciPy/NumPy (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): o complemento de Schur, seus autovalores e a inversa 2x2 calculados por uma biblioteca independente. Limitado à ÁLGEBRA LINEAR da decomposição; as MAGNITUDES de correlação/CRLB lunares obtidas de geometria real permanecem MODELLED.

# text
seg-3359eee713a5 = Classificação do espaço nulo do datum lunar (aditividade de posto do LLR + elevação do defeito por libração)

# text
seg-6d722c176052 = Classificação do problema de datum de telemetria interna: uma única observação de distância contribui com posto { "1" } (espaço nulo de dimensão 6); o par origem-X e escala é quase nulo e a libração física do DE440 eleva o defeito a zero, enquanto o par permanece quase degenerado

# text
seg-ae6dc4e6ea8b = Estrutura geométrica reproduzida pelo motor mais a identidade de Schur 2x2 em forma fechada; consistente em ESTRUTURA com Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cujas magnitudes informadas NÃO são reproduzidas aqui. A classificação é estrutural; as magnitudes de correlação/CRLB sob geometria real são MODELLED (coordenadas e orientação dos refletores mantidas fixas). { "0.30" } comparação externa, uma constatação (permanece MODELLED): em relação a Sosnica et al. { "2025" }, a correlação origem-escala do Fisher de distâncias (-0.993 / -0.988) está a menos de { "0.05" } do valor publicado de -0.97, mas na geometria própria de cinco refletores do artigo a correlação de Helmert de 7 parâmetros com pesos iguais é -0.78 (o valor publicado depende de erros por refletor que o artigo não apresenta), e o CRLB da origem ({ "0.6" } a { "1.2" } mm com ruído de distância de { "3" } mm) fica { "96" } a { "98" } % abaixo dos { "3.07" } cm do artigo, contra uma tolerância de { "20" } %. Magnitudes não reproduzidas

# text
seg-3fd19007ea67 = Informação de datum lunar multitécnica (LLR + VLBI lunar + distância de orbitador)

# text
seg-23d0dd7d0666 = Linhas do jacobiano do datum para a distância LLR a refletores na Terra, o atraso diferencial de VLBI lunar com duas estações e a distância orbitador-baliza, sobre o datum de 7 parâmetros, combinadas em um único Fisher com pré-condicionamento consistente; demonstra que o rastreamento fora da direção radial (orbitador / diversidade em profundidade) rompe a degenerescência entre origem-X e escala, enquanto o VLBI transversal ajuda apenas de forma indireta

# text
seg-b2f5715c4577 = Verificações cruzadas internas entre derivadas analíticas e por diferenças finitas de cada técnica; a DIREÇÃO da melhoria é um fato geométrico. As localizações das balizas, os cronogramas e o ruído são MODELLED/representativos (ver tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = Provedor de orientação dos eixos principais lunares DE440

# text
seg-ebe4519a40e4 = Rotação de MOON_PA_DE440 para J2000 em épocas arbitrárias entre 2014-01-01 e 2030-12-31 TDB, por interpolação geodésica R0·Exp(f·Log(R0ᵀR1)) entre os nós de uma série diária versionada de { "6" } 209 linhas (as funções try_ retornam OrientationSpanError fora dela, as infalíveis entram em pânico; nunca há truncamento); embutida em tempo de compilação, de modo que não há E/S de sistema de arquivos em tempo de execução e a compilação WASM a carrega

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 até spiceypy { "8.2.0" }, executado como ferramenta): pxform de MOON_PA_DE440 para J2000 avaliando diretamente o PCK binário do JPL moon_pa_de440_200625.bpc, com o próprio kernel de referencial do NAIF moon_de440_250416.tf, em { "2 000" } épocas aleatórias fora dos nós na janela embutida. O ângulo de rotação entre as matrizes do Kshana e do SPICE está dentro de { "1.7e-5" } rad ({ "30" } m no raio médio de { "1737.4" } km, fixado antes da comparação); medido, o pior caso foi { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, e o pior caso foi { "1.75e-6" } rad em { "6 000" } épocas adicionais sorteadas pelo verificador. Os nós diários foram eles próprios extraídos do mesmo kernel (scripts/gen_de440_moon_pa.py, fixture SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7); assim, esta comparação testa a interpolação entre eles, que é a afirmação. Encontrado por esta comparação e corrigido: a interpolação linear elemento a elemento anterior, com Gram-Schmidt, preservava o eixo mas não o ângulo da rotação de { "13.2" } graus/dia e apresentava erro de até { "2.0e-4" } rad ({ "340" } m) perto dos pontos de quarto; o valor anterior de cerca de { "14" } m vinha de uma salvaguarda que amostra apenas pontos médios de intervalo. A série cobre 2014-01-01 a 2030-12-31 e gera erro fora dela (rodada { "2" }); seus nós de 2024-2025 são regenerados a partir do mesmo kernel até { "4.3e-13" }. A comparação com o SPICE fora dos nós acima cobre apenas 2024-2025, que é a janela validada; os nós estendidos vêm do mesmo kernel e do mesmo script, mas não são comparados fora dos nós. Um substrato de geometria para análise de identificabilidade, não um produto de orientação submétrico

# text
seg-ab96cfc8d48c = Substrato de geometria de datum LLR lunar (refletores nos eixos principais, estações em terra, derivadas analíticas de distância)

# text
seg-40e91288f81a = Os cinco conjuntos de retrorrefletores do lado voltado para a Terra em metros no referencial do corpo PA e as estações em terra do LLR em coordenadas geodésicas; a colocação dos refletores do referencial do corpo para o inercial pela orientação PA do DE440; derivadas analíticas da distância Terra-refletor em relação ao datum de 4 parâmetros; e a matriz de Fisher somente LLR, que exibe a degenerescência entre lunocentro-X e escala que motiva a análise de 7 parâmetros

# text
seg-89ce1f95d9f6 = O cálculo é verificado internamente: cada derivada analítica contra uma diferença finita, e o caso de datum zero contra a distância nominal. O CATÁLOGO é verificado de forma externa e independente - as coordenadas dos eixos principais do DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) são conferidas contra a Tabela { "6" } do memorando de coordenadas de superfície do DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído por máquina de um PDF verificado por SHA-256 por tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) e concordam até { "1.12" } m, enquanto a realização de Terra média dos mesmos cinco conjuntos difere em { "672" } a { "871" } m. A ESTRUTURA DE DEGENERESCÊNCIA é verificada contra um resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que informa, para o referencial dos eixos principais lunares, um coeficiente de correlação entre lunocentro-X e escala de r = -0.97, e que o LLR não alcança o centro de massa real da Lua com exatidão melhor que { "12" } cm por causa dessa correlação. Este módulo recupera a mesma estrutura (|corr(t_x, scale)| entre { "0.9" } e { "0.9999" }, defeito de datum <= { "1" }) a partir de um projeto de Fisher somente LLR. A corroboração se dá entre efemérides, não por um ciclo fechado: o artigo combina INPOP21a, DE430 e EPM2021, ao passo que este módulo é conduzido pela libração do DE440. O que NÃO é reproduzido é a magnitude - a correlação aqui é de cerca de -0.988 contra -0.97 deles, e o CRLB de 4 parâmetros é submilimétrico contra o piso alcançado de { "12" } cm deles, porque a orientação e as coordenadas dos refletores são mantidas fixas aqui e resolvidas lá. Apenas geometria e estrutura de degenerescência; nenhuma afirmação de exatidão sobre um datum resolvido. { "0.30" } comparação externa: as partes do módulo relativas à distância medida (reflectors(), stations_itrf(), a colocação PA do DE440 e o tempo de luz baricêntrico llr_bcrs_one_way_m) são validadas em sua própria linha, modelo de distância medida do LLR, contra { "192" } pontos normais do ILRS (RMS de { "2.81" } m contra { "10" } m). Esta linha permanece MODELLED porque a comparação medida não exercita o restante de sua afirmação. O catálogo geodésico de estações stations() arredonda o APOLLO a { "0.001" } graus; com um tempo de luz geocêntrico ele resulta em { "22.7" } m nos mesmos pontos (teste reflector_ranges_against_ilrs_normal_points; { "96" } m com a interpolação de orientação elemento a elemento anterior). As derivadas analíticas de distância e o Fisher somente LLR são calculados por meio de llr_range_m e reflector_inertial com a série analítica da Lua (ephem::moon_position, cerca de { "0.3" } graus do GCRS) e sem tempo de luz

# text
seg-a78ba110b64c = Modelo de distância medida do LLR (catálogo de refletores, estações ITRF2020, colocação dos eixos principais do DE440, tempo de luz baricêntrico IERS { "2010" })

# text
seg-c9827c1a427b = A distância de ida entre a estação na Terra e o refletor para um ponto normal de telemetria a laser lunar: os cinco conjuntos de retrorrefletores do lado voltado para a Terra em metros no referencial do corpo dos eixos principais (PA) do DE440 (lunar_llr_geometry::reflectors); as estações de stations_itrf(), a saber Grasse { "7845" } e Matera { "7941" } do ITRF2020 na época { "2015.0" } com suas velocidades, colocadas no Sistema de Referência Celeste Geocêntrico (GCRS) pela transformação IERS { "2010" } com movimento polar do Boletim A (lunar_vlbi::station_inertial_position_itrs), e o APOLLO { "7045" } em sua posição geocêntrica aproximada publicada pelo operador (sem velocidade); a colocação dos refletores do referencial do corpo para o inercial pela orientação PA do DE440 (lunar_orientation::try_de440_moon_pa_body_to_inertial, que gera erro fora de 2014-2030); e o tempo de luz baricêntrico das Convenções IERS { "2010" } Seção { "11.2" } (lunar_llr_geometry::llr_bcrs_one_way_m: a transformação de corpo para BCRS da Eq. { "11.19" } da estação e do refletor, e o atraso de Shapiro da Eq. { "11.17" } do Sol, da Terra e da Lua). ENTRADAS, que não fazem parte da afirmação: os estados e potenciais baricêntricos da Terra, da Lua e do Sol (DE440 por meio do SPICE), o UT1-UTC e o movimento polar do IERS, e a viagem de ida e volta medida convertida de TT para TDB. DO LADO DO ARCABOUÇO DE TESTE, não faz parte da afirmação: o atraso zenital de Mendes-Pavlis com mapeamento FCULa, no teste, com elevação a partir do catálogo geodésico stations(). Não modelados: marés, excentricidades das estações, termos térmicos dos refletores

# text
seg-536c75eebae3 = Medido: { "192" } pontos normais lunares ILRS CRD v2 (EUROLAS Data Center, DGFI-TUM, 2024-04 a 2024-06; Grasse { "151" }, APOLLO { "32" }, Matera { "9" }; versionados integralmente com SHA256SUMS). A distância de ida prevista é comparada com c vezes a metade da viagem de ida e volta medida em TDB. Limiar fixado antes da comparação: RMS de no máximo { "10" } m sobre todos os { "192" } pontos E sobre os { "160" } pontos das duas estações ITRF2020 isoladamente. O limiar vem da terceira emenda de pré-registro 3e0f5cdf, versionada antes da mudança do motor e da execução; o valor de { "10" } m permanece inalterado desde a rodada { "1" }. Medido: { "2.81" } m (média de { "2.67" } m) em todos os pontos; { "2.96" } m nas estações ITRF2020; APOLLO { "1.94" } m; fatia de { "2015" } ({ "349" } pontos, secundária) { "3.82" } m. Mutação: zerar os trechos de Shapiro do Sol resulta em { "10.19" } m, o que reprova. Histórico, divulgado: { "96" } m com interpolação de orientação elemento a elemento; { "22.7" } m após a interpolação geodésica com o catálogo geodésico; { "10.94" } m com estações ITRF2020 e movimento polar, mas com tempo de luz geocêntrico (um deslocamento comum de +{ "10.9" } m). O modelo baricêntrico foi escrito depois de esse deslocamento ter sido visto. É o modelo publicado da Seção { "11.2" } do IERS { "2010" }, sem parâmetro livre. A terceira emenda substituiu uma condição autoimposta de todas as estações ITRF2020/SLRF2020 após o resultado BLOCKED. O RMS somente das estações ITRF2020 passa sem o APOLLO, que não tem solução ITRF2020 nem SLRF2020, e cuja posição é a aproximada declarada pelo operador. Permanece um +{ "2.7" } m comum, abaixo do limiar e não ajustado. O limiar é folgado em relação ao resultado: um termo solar de { "7.6" } m ausente ainda resulta em { "10.19" } m. Termos abaixo do limiar não são resolvidos um a um: com o movimento polar zerado o RMS é de { "6.15" } m (estações ITRF2020 { "5.98" } m), e com a transformação da Eq. { "11.19" } removida é de { "2.96" } m; ambos ainda passariam. As velocidades das estações e os termos de Shapiro da Terra e da Lua são ainda menores. A comparação valida a distância de ida montada a { "10" } m de RMS e o termo de Shapiro solar, não cada componente listado

# text
seg-9b1dfa736cb6 = Calibre acoplado de referencial e escala de tempo lunares: o espaço nulo conjunto de datum espacial, deslocamento de relógio e taxa de relógio

# text
seg-a000ef6ab2e0 = assemble_coupled_info constrói o Fisher acoplado de 9 parâmetros sobre [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space retorna uma decomposição invariante à base de seu espaço nulo em dimensões somente espaciais, somente temporais e genuinamente acopladas, mais a norma de acoplamento do projetor espacial-temporal; coupled_marginal_eigs fornece a marginal por complemento de Schur { "{" }scale, offset{ "}" }. Nas redes versionadas, o motor informa um datum de posto completo (defeito { "0" }) para o caso bem posto e um defeito exato de uma única direção de taxa para o caso de época única (tempo decorrido zero, de modo que a taxa é inobservável por construção), e calcula a marginal { "{" }s, d_tau{ "}" } em ambos.

# text
seg-35eebbc8a2e9 = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: o kshana calcula a decomposição em autovalores com seu próprio solucionador de Jacobi escrito à mão (fim::sym_eig) e a marginal com sua própria pseudoinversa; a referência independente recalcula ambas com numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) por meio de scripts/gen_coupled_gauge_ref.py. A concordância a rel<{ "1e-3" } é, portanto, uma verificação por biblioteca independente DA ARITMÉTICA DESTE CRATE contra uma implementação padrão, que é a afirmação validada e é toda ela. O QUE NÃO É: a montagem e a classificação do espaço nulo são regras próprias deste módulo, e a referência independente as reproduz a partir da mesma especificação, e não de uma fonte independente - isso corrobora a implementação, não a regra. A geometria das balizas e do orbitador é modelada e representativa. As linhas de observação de fato carregam a orientação PA da Lua do DE440 real (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), mas isso é uma ENTRADA que ambos os lados recebem, não evidência sobre a resposta, e é registrado aqui como procedência e não como justificativa do status - a mesma distinção que a main já faz na linha de integridade de modo comum. Todo valor de ponto flutuante de linha é arredondado a { "6" } casas decimais antes de network.json ser escrito, de modo que ambos os lados leiam doubles IEEE-754 idênticos e a única diferença restante seja o solucionador.

# text
seg-63a8571f8eb0 = Degenerescência entre distância e deslocamento de relógio na telemetria lunar de ida, e a lei de projeto da diversidade geométrica

# text
seg-cdd70f56051a = A degenerescência por nó entre distância radial e deslocamento de relógio do receptor é exata em { "1" } m para { "3.336" } ns (um sobre c). A marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) mostra que, em uma rede geometricamente diversa, a telemetria de ida e volta eleva a marginal por aproximadamente o mesmo fator que uma quantidade igual de dados de ida adicionais, enquanto no regime idealizado de nó único o ganho da ida e volta é maior em ordens de grandeza. A lei de projeto que decorre disso: a diversidade geométrica, e não a telemetria de ida e volta em si, é o que separa a escala do referencial lunar do deslocamento da escala de tempo na telemetria de ida; um vínculo de tempo de ida e volta ou externo é necessário apenas no regime de baixa diversidade ou de usuário único.

# text
seg-25dd0e9134c8 = Fisher marginal por complemento de Schur da matriz de informação acoplada, em álgebra linear de forma fechada, verificado contra os dois regimes-limite que ele prevê. A equivalência de { "1" } m para { "3.336" } ns é a definição do metro via c e não é um resultado empírico. As redes de observação são geometria representativa modelada, de modo que a lei de projeto é uma afirmação sobre a geometria apresentada a ela e não faz nenhuma afirmação sobre qualquer rede lunar em operação.

# text
seg-16ec8283f9b4 = Acoplamento relativístico entre taxa de relógio e referencial para a escala de tempo lunar

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) fornece a sensibilidade da taxa da escala de tempo lunar à realização do referencial, a partir do potencial efetivo equatorial truncado no grau { "2" } (GM, raio equatorial, J2, rotação; LunarSurfacePotential): d_alpha/d_scale = L_m, cerca de +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, cerca de -1.11e-14 (dependente do tempo); d_alpha/d_r_radial = g_eff/c^{ "2" }, cerca de +{ "1.806e-17" } por metro. Para um deslocamento radial de datum de { "1" } m, isso é uma perturbação de taxa de cerca de { "1.8e-17" } (uma consequência aritmética da entrada radial), muito abaixo do deslocamento de taxa de aproximadamente { "1.7e-11" } de uma escala de tempo lunar em relação ao TT

# text
seg-6fc3d01ea825 = Pré-registrado (5590ab21): L_m contra Ashby e Patla { "2024" } (AJ { "167" }:{ "149" }) Eq. ({ "10" }), { "3.13881" }({ "15" })e-11, a partir do GM, a_m, omega_m do artigo e do J2 dos dois campos de grau 350 que o artigo cita (Bertone et al. { "2021" }, AIUB-GRL350A/B), dentro de { "1e-4" }; a entrada radial contra a gravidade equatorial do pyshtools { "4.14.1" } (BSD-3) dos mesmos campos dentro de { "1e-4" } (medido { "8.3e-5" } e { "6.7e-5" }, uma margem estreita); a entrada de velocidade contra a velocidade lunar do JPL Horizons DE441 dentro de { "4.5e-3" }. Uma forma fechada de grau 2 de um valor publicado de grau 350 (resíduo de grau 3-350; Reference, não P1). Divulgado: o resultado da entrada 1 era conhecido antes do pré-registro, e o raio padrão fornecido de { "1738.14" } km é a definição de superfície do artigo, adotada após a rodada { "1" }. As contribuições de maré e a faixa de comparação permanecem valores Modelled de superfície de referência

# text
seg-a666792106d9 = Classificação invariante à base do espaço nulo acoplado de referencial e escala de tempo

# text
seg-5ee36574d1b4 = classify_null_space decompõe o espaço nulo do datum em partes somente espaciais (dimensão d menos posto U_T), somente temporais (d menos posto U_S) e genuinamente acopladas (posto U_S mais posto U_T menos d), além da norma de acoplamento do projetor espacial-temporal p_st_norm, a norma de Frobenius do bloco fora da diagonal do projetor do espaço nulo. Cada uma delas é função do PROJETOR e não de uma base escolhida, de modo que são invariantes sob qualquer escolha ortonormal de vetores nulos - o que torna a classificação passível de ser informada.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space e numpy.linalg.svd, LAPACK gesdd) classificam as mesmas matrizes versionadas por interseção de subespaços, dim null([F; E_T]) e dim null([F; E_S]), e pelo projetor de espaço nulo via SVD, que difere dos autovetores de Jacobi e das fórmulas de posto de Gram do Kshana; pré-registrado (d429993c): inteiros exatos, p_st_norm a { "1e-9" } (P2, uma biblioteca numérica independente), com o limiar de posto fixado antecipadamente e um intervalo espectral de pelo menos { "1e6" } afirmado. A afirmação da linha é a classificação de uma matriz declarada, de modo que o P2 a cobre integralmente. Os casos construídos incluem espaços nulos de soma direta, acoplados e mistos, e mudanças de base aleatórias; as dimensões da rede real da linha do calibre acoplado não são recontadas aqui. O teste de invariância interno ao crate (uma base nula rotacionada dá resultados idênticos) é mantido

# text
seg-2c074d6260ba = Menu representativo de medições multitécnica e a regra aditiva de combinação de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock contém uma campanha de medição candidata como uma contribuição de informação de Fisher 7x7 mais um custo relativo escalar; block_from_rows constrói uma a partir de linhas brutas do jacobiano do datum, de modo que todo bloco seja pré-condicionado de forma idêntica por meio de lunar_identifiability::assemble_multi_info; combine soma a informação de um subconjunto escolhido, que é a regra correta porque a informação de Fisher é aditiva entre medições independentes; representative_lunar_menu fornece um menu determinístico de quatro blocos (LLR, uma baliza de limbo VLBI transversal, um orbitador do lado voltado para a Terra e um orbitador do lado oculto). O otimizador de projeto com restrição orçamentária que consome este menu não faz parte deste crate.

# text
seg-d83a9942ee72 = A aditividade da informação de Fisher entre medições independentes é uma propriedade de forma fechada, verificada aqui contra uma soma elemento a elemento escrita de forma independente e contra a invariância de ordem e a monotonicidade que decorrem dela. NOTA SOBRE A EVIDÊNCIA: o combinador antes não tinha teste algum, e o único teste do módulo somava as duas matrizes de informação no próprio código em vez de chamá-lo, de modo que um combinador quebrado teria deixado o módulo verde; o teste agora passa por combine e falha quando este sofre mutação. Todas as localizações das balizas, a geometria do orbitador, as precisões por técnica e os custos relativos são escolhas representativas e não valores de missão (ver tests/fixtures/llr_geometry/NOTICE.md), de modo que toda métrica de degenerescência e todo valor de CRLB alcançado por meio deste menu herda o status Modelled de lunar_identifiability::decompose.

# text
seg-341eedfc47da = Consistência lunar de referencial/dinâmica entre provedores (inter-efemérides real)

# text
seg-f8d94c0771cc = decomposição somente de rotação (translação+rotação de 6 parâmetros) da discordância geocêntrica da Lua entre DE440/INPOP21a/EPM2021 em um vínculo ICRF de referencial comum redutível e um excesso irredutível de orientação da órbita lunar (o ajuste completo de Helmert de 7 parâmetros é uma função pública separada NÃO coberta por esta verificação externa: sua evidência é um teste unitário interno de recuperação analítica mais tests/lunar_helmert_fit_cross_check.rs, que o confronta com o ajuste exato de Gauss-Newton validado em lunar_frame_realise e fixa a convenção de sinal de rotação oposto entre os dois)

# text
seg-c69fd3fc645b = Três efemérides independentes e de referência — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — amostradas por meio do calceph do IMCCE, conferidas por um ajuste de mínimos quadrados por SVD em numpy independente. POR QUE ISTO É validado ONDE lunar_common_mode NÃO É, nas mesmas três efemérides: aqui a grandeza informada É uma propriedade dos dados publicados — sua discordância mútua — de modo que as efemérides são a referência independente, não uma entrada. Em lunar_common_mode a mesma discordância alimenta uma geometria de constelação MODELLED e a resposta é uma propriedade desse modelo, razão pela qual essa linha é corretamente Modelled/ReferenceImpl.

# text
seg-2d3347bcb15e = Tolerância de consistência entre provedores para um usuário de provedores mistos

# text
seg-9decf2cb6b0c = consistency_tolerance: inverte um orçamento de posição do usuário em uma exigência de concordância de Helmert entre provedores, por parâmetro (origem/escala/rotação), em um braço de alavanca de referência, opcionalmente inflada pelo CRLB de realização de provedor único P1

# text
seg-b8dc68eb4bda = Limite triangular de pior caso sobre a ação do jacobiano pontual de Helmert (forma fechada)

# text
seg-5450d921dfc9 = Orçamento de erro de interoperabilidade lunar multiprovedor e lei de projeto referencial-versus-efemérides

# text
seg-e1e30f5c17a6 = interop_budget: divisão entre redutível (vínculo de referencial comum) e irredutível (dinâmica) sob as convenções PerProvider / CommonFrameTie / CommonEphemeris, com a métrica de lei de projeto da fração irredutível (~{ "0.69" } em DE440/INPOP/EPM reais: um rótulo de referencial comum, por si só, deixa o piso dominante)

# text
seg-46304ae1efa4 = Agregação RMS das divisões por par validadas sob cada convenção (forma fechada)

# text
seg-a01f394a36d3 = Pipeline de álgebra linear de observabilidade de falhas em rede livre autônoma (projetor de paridade, detectabilidade, não centralidade do MDB, centelha de bloco bizantino)

# text
seg-b3389bb90e8d = Na rede lunar por nó com DE440 real (cada linha é uma distância de ida diferencial entre nós, construída por pernode_range_row com uma linha de visada real no referencial PA da Lua do DE440), o motor calcula o projetor de paridade ponderado P⊥ = I − G(GᵀWG)⁺GᵀW (a forma de pseudoinversa com deficiência de posto que sobrevive ao calibre de datum⊕escala de tempo de 8 dimensões), o resíduo de detectabilidade T1 ‖P⊥·b‖ (falhas dentro do espaço de distâncias são aniquiladas, falhas genéricas são detectáveis), a forma quadrática de não centralidade do MDB de Baarda cᵀWP⊥c (a forma ponderada correta com P⊥ único, NÃO a forma com P⊥ duplo cᵀP⊥WP⊥c) com MDB = √(λ₀/cᵀWP⊥c), e as contagens de detecção/identificação da centelha de bloco bizantino das assinaturas efetivas empilhadas dos pares P⊥·B_T (posto de coluna, e não meramente não nulo)

# text
seg-8cb248423fd0 = Reprodução independente de álgebra linear em numpy/scipy sobre linhas reais de linha de visada no referencial PA da Lua do DE440 (P⊥ a partir da SVD do projeto branqueado W^{ "{" }1/2{ "}" }G; a não centralidade do MDB a partir da norma quadrada clássica de Baarda ({ "1968" }) do subespaço de paridade; o posto do bloco a partir de uma contagem de valores singulares da SVD do numpy) — um caminho numérico genuinamente diferente da decomposição em autovalores de Jacobi cíclico de GᵀWG feita pelo crate. Escopo (segundo tests/fixtures/faultobs/NOTICE.md): isto valida o PIPELINE DE ÁLGEBRA LINEAR somente nestas linhas. A geometria dos nós é Modelled. NÃO é uma garantia de integridade operacional, uma certificação de nível de proteção, nem qualquer afirmação de disponibilidade RAIM/ARAIM, e NÃO é uma garantia de missão de tolerância a falhas bizantinas — a CONTAGEM de falhas toleradas para esta rede é Modelled, ao passo que o LIMITE de centelha de bloco detectar>f / identificar>2f é Cited (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; centelha por blocos de Donoho–Elad { "2003" }) e instanciação demonstrada em código

# text
seg-ebb827739614 = Limite de detecção/identificação por centelha de bloco bizantino na rede lunar autônoma por nó (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia o limite de codificação de estimação segura de estado / observabilidade esparsa na geometria da rede por nó: um par bizantino injeta uma combinação linear arbitrária das medições de que participa, e a rede DETECTA qualquer coalizão de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única qualquer coalizão de ≤ ⌊(block_spark − { "1" })/2⌋, onde block_spark é a menor coalizão de pares cujas assinaturas efetivas empilhadas P⊥·B_T têm deficiência de posto de coluna. A detectabilidade de um par é o POSTO DE COLUNA COMPLETO de P⊥·B_j (um bloco não nulo, mas com deficiência de posto, é um ataque não nulo que cai em range(G) e não deixa resíduo), e não meramente P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Instanciação geométrica do limite de centelha por blocos / estimação segura de estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; centelha por blocos de Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NÃO o limiar de consenso 3f+{ "1" } de Lamport–Shostak–Pease ('bizantino' nomeia apenas o MODELO de falha arbitrária/conluiada). A contagem específica de falhas toleradas é uma propriedade Modelled da geometria representativa da rede, verificada quanto à autoconsistência por casos analíticos construídos à mão e pelas fórmulas de contagem

# text
seg-4f57f586cf82 = Piso de calibre temporal em holdover autônomo para a constelação lunar autorreferenciada (T4)

# text
seg-eb690e8f5c9b = holdover_floor estabelece que, em um conjunto de nós autônomos conectados apenas por medições entre nós, a taxa comum de relógio (δα_j += { "1" } ∀j) é um parâmetro livre do tempo do conjunto que está em N(GᵀWG): nenhuma quantidade de telemetria adicional entre nós consegue observá-la (rate_in_gauge = true, temporal_gauge_dim = { "2" } com o deslocamento comum). Este é o genuíno piso de holdover — o análogo temporal do calibre de posição do referencial rígido. Acrescentar um vínculo externo de taxa absoluta (um enlace direto a uma referência fora da rede) expulsa a taxa comum do espaço nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), provando que o piso é um calibre real, não um artefato do modelo de oscilador

# text
seg-097f126797bb = Argumento do parâmetro livre do tempo do conjunto (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado na rede por nó representativa com DE440 real: um teste nulo de resíduo relativo do gerador analítico de taxa comum contra GᵀWG, com o contraste com vínculo distinguindo o calibre genuíno de um artefato do modelo de oscilador. Geometria Modelled representativa, não um orçamento de temporização certificado

# text
seg-25ffd6e1979c = Divisão comum/diferencial de provedor, unificação por deficiência de posto única e inclinação da lacuna de proteção (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Três facetas da decomposição única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), com o calibre datum⊕escala de tempo de 8 dimensões como N(G) e as state_dim − { "8" } = { "32" } direções observáveis como range(G): (T5) provider_mismatch_split classifica um viés comum de múltiplos provedores (∈ range(G)) como INDETECTÁVEL — exigindo um vínculo externo — e um viés diferencial (∉ range(G)) como automonitorado / DETECTÁVEL; (§{ "0" }) a unificação é que o MESMO subespaço cego range(G) governa a classe de falhas indetectáveis, de modo que o calibre de datum N(G) e o subespaço cego a falhas range(G) são uma só geometria, não duas; (g7) slope retorna a inclinação da lacuna de proteção de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para uma falha b ∈ range(G) (estimador corrompido com paridade zero) e finita para uma falha detectável

# text
seg-e0fd3860fce9 = Álgebra de projetor de paridade / pseudoinversa em forma fechada na rede por nó representativa com DE440 real: a divisão comum/diferencial, a unificação N(G) ⊕ range(G) e a inclinação da lacuna de proteção de Brown ({ "1992" }) decorrem todas da aniquilação do espaço de distâncias P⊥·G = { "0" }. Geometria Modelled representativa, não um nível de proteção certificado

# text
seg-101b0551d987 = MTIE e TDEV de telecomunicações de temporização em uma série de erro de tempo em holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> informa, sobre um registro de holdover em escala de telecomunicações: um MTIE de janela deslizante O(n) com fila monotônica (telecom_timing::mtie_sliding, necessário para que um dia de amostras de um segundo continue rápido) e o TDEV do motor (allan::time_deviation), avaliados na grade que o tipo informa e lidos de volta de uma execução completa que ingere a série

# text
seg-59cb2711355c = allantools { "2024.06" } — uma biblioteca de estabilidade de frequência de terceiros e independente — mtie() e tdev() em tests/fixtures/telecom_timing/holdover_te_series.csv, a série lida do mesmo texto de 17 algarismos significativos em ambos os lados; a referência registra o SHA-256 da série e pode ser regenerada offline por tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida os ESTIMADORES neste registro, não o holdover sintético que o produziu

# text
seg-632add2dbd3c = Máscaras de sincronização de telecomunicações da ITU-T com PASS/FAIL e margem

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Emenda { "1" } (07/2025) ePRTC travado e holdover do ePRTC-A (incluindo o envelope de erro de tempo da Tabela { "3" }), G.8273.2 ({ "2023" }) Emenda { "2" } (11/2025) classes A-D de T-BC/T-TSC e G.8271.1 ({ "2022" }) Emenda { "3" } (05/2025) ponto de referência C, cada intervalo aberto ou fechado como a tabela o enuncia, com toda entrada marcada 'para estudo posterior' deixada de fora; um veredito e uma margem no ponto limitante por verificação, e o tempo até exceder cada orçamento. Executável como o tipo de cenário <c1/>

# text
seg-46b139a58bb0 = Transcrição das Recomendações nomeadas (disponíveis para download gratuito em itu.int), com cada limite acompanhado de sua tabela ou cláusula, listados com todo item não confirmado ou não implementado em docs/TELECOM-TIMING.md; as identidades de continuidade dos pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de norma com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } rodada { "2" } (pré-registrada 970003ee), bloqueada (permanece MODELLED): os dez valores de máscara e os treze valores de holdover do ePRTC-A que as Recomendações imprimem como números resolvidos (G.8272 Figs. 1-2, G.8272.1 Emenda 1 cl. { "8.2.1" } e Figs. V.1-V.3, G.8271.1 Emenda 3 Figs. 7-2 a 7-4) são reproduzidos dentro de meia unidade impressa, a maioria deles constantes de tabela ou pontos de quebra; a Fig. 7-2 da G.8271.1 rotula { "200" } ns em { "1.3" } s, contra sua própria Tabela 7-1 ({ "197.5" } ns). Os limites das classes A-D da G.8273.2 não têm valor resolvido impresso, e os rótulos de pontos de quebra do ePRTC travado da G.8272.1 (em linhas de construção contínuas) foram excluídos pela regra de seleção pré-registrada, de modo que permanecem transcrições

# text
seg-165ed2bc771a = Máscaras de geração de wander de sincronização de frequência da ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sete máscaras de geração de wander de MTIE e TDEV a temperatura constante para o tipo <c1/>: G.811 (09/1997) PRC (autônomo), G.812 (06/2004) Tipos I, II e III, G.8262 (10/2024) EEC Opções { "1" } e { "2" } e G.8262.1 (11/2025) eEEC (modo travado), incluindo os trechos em lei de potência que as tabelas escrevem (<c2/> e semelhantes), cada intervalo aberto ou fechado como impresso, medidos através do filtro de { "10" } Hz que as cláusulas enunciam (tomado como aplicado antes da amostragem); o cenário de referência scenarios/telecom-synce-eec.toml confronta um OCXO em marcha livre com as três máscaras de EEC. Não implementados: as tolerâncias de temperatura variável, o holdover, os transitórios, o jitter e a exatidão de frequência da G.811

# text
seg-ca16d9c98dc5 = Transcrição das Recomendações nomeadas (baixadas de itu.int em 2026-10-13), com cada linha relida contra o texto, e com a continuidade dos pontos de quebra que os coeficientes impressos implicam delimitada nos testes (por exemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contra o patamar de { "100" } ns da Tabela { "4" } da G.812). Uma transcrição de norma com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. A G.812 (06/2004) consta como substituída por uma edição pré-publicada de 08/2026 e a G.811 tem uma Emenda { "1" } (04/2016); nenhuma pôde ser lida, de modo que nenhuma é verificada. O cenário com OCXO em marcha livre superestima a contribuição do oscilador em intervalos de observação longos em relação à constante de tempo de uma malha; ele nada diz sobre o relógio de qualquer equipamento

# text
seg-5fc2ad88faf0 = Formatos de registro de relógio (relógio RINEX, ASCII do TimeLab, TICC do TAPR) lidos para uma série de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: uma camada de análise sintática que transforma um arquivo de relógio RINEX (registros AS/AR de um relógio nomeado, versões { "2" } e { "3.00" } a { "3.04" }), um registro ASCII de fase ou frequência no estilo TimeLab, ou um registro de marcas de tempo ou intervalos do TICC do TAPR em uma grade de fase uniforme, com tau0 declarado, vindo de um cabeçalho ou dado pelo espaçamento mediano, com toda lacuna, leitura fora da grade e duplicata contadas, e uma política de lacunas de recusa, trecho mais longo ou linear; conectada, por adesão opcional, à série de telecom-timing (<c1/>, acrescentando um bloco <c2/>) e ao tipo clock (<c3/>, acrescentando um bloco <c4/> com ADEV, TDEV e MTIE, o SHA-256 da tabela e o SHA-256 da fase; runs = { "1" }). Sem a tabela, ambos os tipos são idênticos byte a byte

# text
seg-1d3df655c14c = Pré-registrado em tests/fixtures/clock_log/PREREGISTRATION.md (versionado isoladamente, 159334f2, antes de a fixture existir); registrado em RESULTS.md. Três registros sintéticos semeados, um por formato (uma lacuna de três épocas no TICC, um segundo relógio RINEX a ignorar), lidos de volta por um leitor independente escrito a partir de docs/CLOCK-LOG-FORMATS.md pelo mesmo autor: contagens de grade, lacuna e preenchimento iguais e a maior diferença de fase { "0" } s (limiar { "1e-13" } s). oadev, tdev e mtie do allantools { "2024.6" } sobre essa fase concordam dentro de { "2.5e-14" } relativo (limiar { "1e-10" }) em todo fator de média que ele avalia; ele não avalia o MTIE sobre o registro inteiro, que o motor informa, de modo que esse ponto por registro não tem valor de referência independente e o limiar, como formulado, não é atingido ali. MODELLED: registros sintéticos, e a referência independente do leitor compartilha o autor; arquivos reais de relógio TimeLab, TICC e RINEX provenientes de instrumentos não foram comparados

# text
seg-acdb0337bce7 = Formatos de registro de relógio do linuxptp (ptp4l, phc2sys, ts2phc) e do chrony (tracking, statistics) lidos para uma série de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input com os formatos ptp4l, phc2sys, ts2phc, chrony-tracking e chrony-statistics: o deslocamento registrado de uma linha de servo do linuxptp (ns, a marca de tempo entre colchetes da própria linha, leituras anteriores à primeira vez que o servo informa s2 deixadas de fora e contadas) ou de um registro tracking ou statistics do chrony (s, por posição de coluna, data e hora UTC) torna-se uma grade de fase uniforme pelas mesmas políticas de lacuna dos outros formatos; um seletor de fonte (<c1/>) nomeia uma entre várias interfaces, relógios ou endereços; os registros alimentam a série de telecom-timing, o tipo clock e o tipo holdover-test

# text
seg-fb9393044576 = Fixtures escritas para o Kshana a partir dos leiautes de linha públicos dos daemons, com valores inventados (NOTICE.md na pasta da fixture); nenhum registro de uma instalação real foi lido e nenhuma referência independente compara a análise com outro leitor, de modo que um leiaute que difira entre versões do daemon ainda pode ser recusado ou mal interpretado. Os estimadores alimentados pela série de fase são os validados contra o allantools nas linhas acima

# text
seg-97aebb84576e = Teste de holdover pontuado a partir de um registro de erro de tempo fornecido pelo operador

# text
# c1: holdover-test
seg-ab533cf99c56 = O tipo <c1/>: um registro de erro de tempo (um registro de relógio do linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes que o operador declara para a remoção e a restauração do GNSS em uma etapa de linha de base, uma de holdover e uma de recuperação; a linha de base é medida contra as máscaras da ITU-T escritas para um relógio travado e o holdover contra as escritas para holdover ou relógio autônomo, o envelope de holdover do ePRTC-A e os orçamentos de erro de tempo; o holdover informa o deslocamento de frequência por mínimos quadrados que o sistema manteve, e a recuperação informa se e quando |TE| entrou em uma faixa declarada e permaneceu nela durante um tempo de permanência declarado, com o pico e o maior degrau. Todo limite é o que o tipo telecom-timing transcreve; os dois instantes são declaração do operador e não são verificados

# text
seg-a54380cf95ea = Cálculo manual sobre registros construídos a partir de fórmulas cuja inclinação, degrau, extremo e tempo de recuperação são conhecidos antes da execução (os testes os declaram), e as máscaras, o envelope e os orçamentos das linhas de telecom-timing acima. Nenhuma medição de laboratório de um holdover real foi pontuada e nenhuma referência independente externa foi comparada, de modo que o tipo não faz nenhuma afirmação sobre qualquer relógio ou sistema; é necessário um parceiro de laboratório de temporização antes que qualquer valor por classe de relógio possa ser promovido

# text
seg-94cbac97a1aa = Disponibilidade de sinais GNSS no Space Service Volume e além, comparada com o livreto SSV do ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = As varreduras de disponibilidade do tipo <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (usuário, época) com pelo menos um e pelo menos quatro sinais e a maior interrupção, para um usuário sobre uma esfera (a casca global de 2,562 pontos do livreto, { "14" } dias a { "1" } minuto) ou sobre uma trajetória (GEO, HEO, transferência lunar), a partir das órbitas keplerianas do anexo C do livreto, uma potência radiada mínima constante dentro do ângulo de referência fora do eixo de visada, bloqueio pela Terra dado pela esfera mais { "50" } km e um limiar de C/N0; antenas de usuário da tabela B10 do livreto

# text
seg-d71c9d361342 = O livreto Space Service Volume do ICG (UN OOSA ST/SPACE/75, { "2018" }), ele próprio uma simulação, comparado sob um pré-registro versionado antes da execução (xval/gnss-ssv/PREREGISTRATION.md; resultados em xval/gnss-ssv/RESULTS.md, fixados por tests/ssv_booklet_results.rs, com os fracassos incluídos). Execução { "1" } na leitura pré-registrada: as constantes de potência radiada mínima e o limiar lunar concordam (S0, S6 atingidos); os limiares do SSV superior e inferior, do limiar de RF, de GEO e de HEO são NOT MET, quase todos por causa do GLONASS, para o qual o livreto dá { "20" } e { "28" } graus nas tabelas B2 e B6 e { "26" } e { "34" } graus na tabela { "4.2" }. Uma variante de diagnóstico com os ângulos da tabela { "4.2" } concorda em todas as células do SSV superior, do SSV inferior e das seis missões GEO (ela não substitui a execução { "1" }; as células de RF, HEO e lunares ainda falham). Os padrões medidos de painel do GPS L1 não são reproduzidos pelo substituto paramétrico (RMS de { "6" } a { "9" } dB contra um limiar de { "3" } dB). A concordância mostra que o método declarado no livreto é reproduzido, não que os sinais GNSS se comportem assim

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efeitos de ionosfera, plasmasfera e atmosfera sobre sinais GNSS rasantes por raio de limbo, e o projeto de receptor para sinais fracos, no tipo <c1/>

# text
seg-1a1786ba90b6 = Uma ionosfera de Chapman, uma plasmasfera do tipo Gallagher e uma atmosfera neutra (curvatura por refratividade, absorção por oxigênio, desfocalização) integradas ao longo do raio reto entre o transmissor e o usuário: conteúdo total de elétrons inclinado, sua parte plasmasférica, atraso em excesso, altitude da tangente e a perda em enlaces rasantes; e um projeto de receptor para sinais fracos (integração coerente e não coerente, limite de bit de dados, auxílio, busca Doppler) que define o limiar de C/N0 a partir dos modelos de aquisição e de malha de rastreamento

# text
seg-4ca1217472ab = Formas fechadas e magnitudes publicadas nos testes (o pico de uma camada de Chapman e a curvatura do limbo da superfície, alguns TECU de plasmasfera em um raio de GPS a GEO); o projeto do receptor reutiliza os modelos de aquisição e de malha de rastreamento e seus testes. Nenhum dado medido de sondagem de limbo ou de recepção de sinais fracos é comparado com ele

# text
seg-6b8f9f3ca2a3 = Filtro de navegação GNSS embarcado para espaçonaves em órbita alta e de transferência lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = O modo <c2/> do tipo <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, polarização e deriva do relógio do receptor, uma escala de pressão de radiação solar) sobre pseudodistâncias cuja disponibilidade, ruído e C/N0 vêm da mesma geometria de enlace das varreduras; a verdade é integrada com J2, terceiros corpos Sol e Lua e pressão de radiação com sombra, o filtro modela J2 e os terceiros corpos e estima a pressão de radiação; informa erros de posição e velocidade dentro e acima das órbitas GNSS, a maior lacuna de medição e o NEES médio

# text
seg-469602656ab4 = Verdade simulada contra a estimativa do próprio filtro (o erro de estimação normalizado ao quadrado médio de um filtro consistente é de cerca de { "3" } para a posição) e determinismo para uma semente fixa. Nenhum dado GNSS de voo ou registrado em órbita alta é comparado; o Sol e a Lua são substitutos circulares de baixa precisão

# text
seg-5fc242476828 = Navegação relativa de uma formação de várias espaçonaves em órbita altamente elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = O modo <c2/> do tipo <c1/>: uma nave chefe e suas naves subordinadas executam cada uma o filtro absoluto; a posição da nave subordinada em relação à chefe é estimada subtraindo as estimativas absolutas e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambas as naves rastreiam, com a dinâmica relativa sendo a diferença de duas trajetórias não lineares

# text
seg-69c078b57fc8 = A mesma verdade simulada que a do filtro absoluto: o erro do filtro relativo contra o estado relativo verdadeiro, e a verificação de que ele se sai pelo menos tão bem quanto subtrair duas soluções absolutas independentes. Nenhum dado de formação em voo é comparado

# text
seg-7038f6902820 = Termos de erro do interferômetro de átomos frios: ruído de fase do laser Raman, viés de curvatura de frente de onda e resolução da ambiguidade de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funções de biblioteca, ainda não acessíveis a partir de um tipo de cenário): a função de ponderação da fase Raman de um interferômetro de três pulsos quadrados (Cheinet et al. { "2008" }, Eq. { "8" }) com a forma fechada de fase branca (pi/2)^{ "2" } S_phi0/tau_R e um caminho numérico para qualquer espectro; o ruído de frequência do laser que o atraso da retrorreflexão não cancela (Le Gouet et al. { "2007" }, Eqs. { "9" } a { "11" }); o viés de frente de onda de desfocalização pura sigma_v^2/R de uma nuvem térmica e sua redução por um raio de detecção; a probabilidade de índice de franja errado erfc(pi/(sqrt({ "2" }) s)) para um auxílio de acelerômetro clássico e para dois tempos de interrogação, e sua inversa

# text
seg-a7b220763674 = Cada forma fechada contra um caminho numérico independente nos testes (quadratura no domínio da frequência da função de transferência exata e do filtro de atraso, um Monte Carlo sobre átomos para o viés de frente de onda, um Monte Carlo sobre disparos para o índice de franja) e seus casos-limite. Um valor resolvido publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) afirmam que, em tau_R = { "20" } us, é necessário um ruído de fase Raman branco abaixo de -111 dB rad^2/Hz para { "1" } mrad por disparo; o termo branco isolado dá { "0.99" } mrad (o artigo deriva o nível com sua Eq. { "17" }, flicker mais branco). Consistência interna e um valor resolvido, não uma validação externa; aberrações de ordem superior e o ruído de qualquer laser específico não são modelados

# text
seg-c380ec16a4f8 = Graus de liberdade equivalentes exatos de Greenhall e Riley das variâncias de Allan, de Allan modificada e de Hadamard

# text
seg-dee2a54c5019 = allan::edf_greenhall (com os invólucros edf_greenhall_adev, _mdev e _hdev): o algoritmo completo de Greenhall e Riley, Proc. 35th PTTI ({ "2003" }), Seção { "3" } (Eqns { "7" } a { "13" } e os coeficientes de J grande das Tabelas { "1" } a { "3" }), para ordens de diferença { "1" } a { "3" }, expoentes de ruído +{ "2" } a -4 sempre que alpha + 2d > { "1" }, estimadores sobrepostos e não sobrepostos, modificados e não modificados; NaN onde não se aplica, incluindo o caso de PM branco não modificado com ceil(M/S) <= d, cuja forma fechada não é implementada. assurance::uncertainty::edf agora compartilha o código e mantém suas saídas bit a bit

# text
seg-695ec24f9676 = ci.edf_greenhall do allantools { "2024.6" }, uma implementação de terceiros do algoritmo publicado, executada por scripts/gen_greenhall_edf_ref.py sobre a grade pré-registrada em xval/greenhall-edf/PREREGISTRATION.md (versionada isoladamente, 0db0bb7a, antes de qualquer comparação): em todos os { "4 876" } pontos em que ele retorna um edf finito, o kshana concorda dentro de { "6.0e-13" } relativo (limiar { "1e-9" }); nos seus { "46" } pontos com NotImplementedError o kshana retorna NaN; todo rótulo de caso ocorre; os invólucros são iguais ao núcleo bit a bit; uncertainty::edf é idêntico bit a bit em { "274 280" } valores (fixado como um SHA-256 antes da refatoração). Em { "32" } pontos (alpha -4, d { "3" }, não modificado, caso { "2.2" }) o allantools falha em sua consulta à Tabela { "2" }, de modo que não têm valor de referência independente e não são contados. O Stable32 não foi executado. { "0.36" } revisão (docs/revisions/STUDIO15-greenhall-edf-portable.md): em matemática portável, o núcleo toma seu logaritmo de uma avaliação em double-double arredondada uma única vez (allan::greenhall_ln), e o Limiar { "1" } inalterado volta a valer em todos os { "4 876" } pontos, com pior caso relativo de { "6.0e-13" }; a salvaguarda de uncertainty::edf é rebaseada para o despejo portável { "0.36" } ({ "3 746" } dos { "274 280" } valores mudaram, no máximo { "1.6e-12" } relativo, em relação à base de matemática do hospedeiro)

# text
seg-363705e03bac = Predefinições de holdover de osciladores a partir de folhas de dados públicas

# text
seg-9750d9e0ec7a = Quatro predefinições — OCXO (Microchip OX-208), rubídio (Microchip 8040C), césio (Microchip 5071A, tubo de alto desempenho) e CSAC (Microchip SA.45s) — cada uma com os máximos de desvio de Allan, o envelhecimento e o limite de temperatura de sua folha de dados; um ajuste de mínimos quadrados não negativos de ruído de frequência branco + flicker + passeio aleatório escalado para envolver todo ponto da folha de dados, um piso de flicker nunca abaixo do valor de τ mais longo, envelhecimento linear e um termo sinusoidal de temperatura, sintetizado como um holdover com semente após uma perda de GNSS

# text
seg-95aaa171864b = As quatro folhas de dados nomeadas da Microchip (números de documento e URLs em cada predefinição e em docs/TELECOM-TIMING.md) para os valores de entrada; a rampa de envelhecimento em forma fechada e a propriedade de envoltória do ajuste como verificações internas. A maneira como os valores se tornam um modelo de ruído — o ajuste, a regra do piso, o mês de 30 dias, a leitura linear da temperatura — é uma escolha de modelagem; nenhuma predefinição é uma medição de uma unidade. { "0.30" } rodada { "2" }, limiares unilaterais contra unidades medidas (pré-registrados a01c491c), uma constatação (permanece MODELLED): a estação IGS THU2 Symmetricom 8040C nos relógios finais MGEX da ESA tem um desvio de Allan de { "0.35" } a { "0.87" } da predefinição de rubídio, mas um erro de holdover de { "1.07" } a { "1.60" } dela; o registro do 5071A fica fora da predefinição de césio até { "1000" } s (ruído de fase branco da medição, 30x em { "1" } s) e em holdover ({ "1.15" } a { "8.74" }); o pior SA.45s de produção de { "2011" } é 1.26x a predefinição de CSAC em { "1" } s; o OX-208 não tem registro medido (bloqueado)

# text
seg-69f93d5ec864 = Predição de holdover a partir de um registro de relógio medido, verificada em dados reservados

# text
# c1: slot-timing
seg-8bdc5a24c66d = O caminho de registro medido do tipo <c1/>: o desvio de Allan sobreposto de um registro de fase, ajustado por mínimos quadrados não negativos ponderados por edf na base de fase branca e de modulação de frequência da IEEE Std { "1139" } (slot_timing::fit_weighted), e depois invertido para obter o tempo de deriva em que o erro de tempo alcança um limiar (slot_timing::slot_budget). O piso de ruído vermelho é medido a partir do registro em vez de assumido

# text
seg-c888226296fe = Um relógio atômico real em marcha livre: { "556 990" } amostras de fase de um segundo de um padrão de césio 5071A medido contra um maser de hidrogênio (A. Wallin, distribuído com o allantools; commit fixado e SHA-256 em scripts/fetch_cs5071a.sh), o mesmo registro que tests/cs5071a_reference.rs usa para os estimadores. Os dois terços reservados são uma medição externa que a predição nunca viu. Condicionado a dados: o fluxo de trabalho realdata-clock busca o registro e executa o teste com KSHANA_REQUIRE_REALDATA={ "1" }. Valida o caminho ajustar-e-inverter em um padrão atômico dominado por FM branco em derivas de até cerca de { "50 000" } s; não as fontes de folha de dados ou de classe, não os termos determinísticos. NÃO é um oscilador de cristal: em um registro medido de OCXO (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h contra um maser de hidrogênio) a predição reservada é conservadora, em { "0.59" } a { "0.70" } da violação medida, e na maior parte fora do limiar, porque o piso de ruído desse oscilador caiu pela metade durante o registro; na amostra ela fica entre { "0.98" } e { "1.17" }. O caso do cristal permanece MODELLED. Tampouco são relógios atômicos em órbita: em { "10" } relógios de satélites GPS Block IIF (tests/slot_timing_igs_holdout.rs, relógios finais IGS de { "30" } s, { "14" } dias, protocolo escrito antes do download), { "8" } ficam dentro do limiar e { "2" } (G25, G30) são otimistas em até cerca de 2x, de modo que, sob o protocolo, o caso orbital permanece MODELLED

# text
seg-d7e03158b972 = Segundos até que um relógio em marcha livre saia da guarda de um slot indexado no tempo, e a cadência de correções que o mantém dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = O tipo <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para obter a violação, o tempo restante, o intervalo de ressincronização líquido da latência da correção e as correções por dia, com cada termo detalhado e o dominante nomeado; relógios a partir dos seis padrões de ClockClass (TCXO, OCXO e RAFS acrescentados, cada um citando uma folha de dados), as predefinições de telecom-timing, uma folha de dados em linha ou um registro medido; uma violação além do maior tempo de média da fonte é sinalizada como extrapolada

# text
seg-cc0464060e58 = Formas fechadas para cada termo isolado e a busca de raiz independente de holdover::holdover_seconds; os valores das folhas de dados são os dos documentos nomeados (docs/SLOT-TIMING.md). Um padrão de classe se apoia em um piso de ruído vermelho assumido e uma fonte de folha de dados é uma envoltória de máximos, de modo que nenhum dos dois é uma medição de qualquer unidade

# text
seg-2797643153dc = Nível de proteção de temporização para um receptor em órbita sob spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, acessível como a seção de spoofing do tipo <c1/>: velocidade e período de órbita circular, o maior tempo que um spoofer em solo consegue alcançar o satélite por passagem, o piso do monitor auxiliado por relógio e a latência de detecção por CUSUM, o nível de proteção condicional (piso mais deriva sobre a latência), o desvio que um spoofer com uma taxa máxima de rampa declarada acumula antes que o satélite deixe sua área de cobertura ou que uma verificação independente seja executada, e se cada verificação de contato com o solo ou de enlace cruzado é independente de um spoofer em solo

# text
seg-3d441db3a373 = Redução ao nível de proteção de temporização existente e às formas fechadas de visibilidade para órbita circular e Terra esférica. Condicionado à detecção, um spoofer terrestre com uma taxa de rampa declarada, uma passagem sobre a vertical em uma Terra sem rotação; não validado em um receptor sob spoofing em órbita

# text
seg-158a99d40b0d = Densidades espectrais de potência de sinais em banda L em forma fechada e coeficientes de separação espectral

# text
seg-17060c71fa54 = Densidades espectrais de potência de área unitária do GPS L1 C/A e L2C (BPSK({ "1" })), do GPS L5 e do Galileo E5a (BPSK({ "10" })), do BOC senoidal({ "1,1" }) e do MBOC(6,1,1/11) do Galileo E1 (navsignal::Modulation::psd, com uma variante MBOC acrescentada), seus nulos e máximos localizados numericamente (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), e o coeficiente de separação espectral de um sinal contra qualquer espectro em qualquer deslocamento (navsignal::spectral_separation_coeff_offset) ou contra um tom, ruído plano, um chirp ou ruído casado (spectrum::Jammer::ssc), com o coeficiente anti-jam Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Valores publicados em livros-texto: o lóbulo principal do BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo e os coeficientes anti-jam Q = { "1" } para um jammer de banda estreita (CW) e Q = { "1.5" } para um jammer de espectro espalhado casado ao C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., seção { "9.4" }); os lóbulos principais do BOC(m,n) centrados em mais ou menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); os coeficientes de separação espectral -61.8, -64.8 e -67.8 dB/Hz para C/A com C/A, BOC({ "1,1" }) com BOC({ "1,1" }) e C/A com BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June { "2006" }), reproduzidos aqui a partir de suas formas fechadas de autocorrelação por Parseval. O máximo do BOC({ "1,1" }) não está em { "1.023" } MHz: o lóbulo se estende do nulo da portadora a { "2.046" } MHz e tem pico em { "0.759" } MHz, e o teste fixa ambos. A mistura MBOC é a definição do ICD, verificada apenas quanto à área unitária e à linearidade

# text
seg-f134975d4ffa = Cascata de espectro em banda L com J/S por banda e C/N0 efetivo sob uma linha do tempo de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = O tipo <c1/>: uma grade frequência por tempo da densidade espectral de potência em banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais em suas potências mínimas recebidas da especificação de interface, e jammers de onda contínua, de banda estreita, de chirp e de ruído casado com tempos de ligar/desligar), cada célula com média sobre sua faixa e linha (chirps exatamente sobre varreduras inteiras e parciais, jammers por ciclo de trabalho), C/N0 efetivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por linha, J/S por banda, J/S em banda e uma cascata em SVG com barras de C/N0. O relatório traz uma verificação cruzada com a cadeia do tipo <c2/> sobre as mesmas entradas de enlace

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Redução à equação anti-jam e ao orçamento de enlace do tipo <c1/> existente (o mesmo código, chamado sobre as mesmas entradas), e à forma fechada do piso de ruído k T0 F. Os espectros de sinal subjacentes são os da linha validada acima; as potências dos jammers, a linha do tempo e as larguras de banda do front-end são entradas do cenário, os espectros são contínuos (sem linhas do código de espalhamento), e nenhum controle automático de ganho, supressão ou diagrama de antena atua sobre o jammer. Não há no repositório nenhum espectro medido sob jamming com o qual verificar o composto. A tabela de Q do tipo <c2/> (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde { "0.36" }: os valores de livro-texto, fixados às formas fechadas do navsignal) concorda com o valor CW deste modelo e difere do que ele deriva para ruído casado ao C/A ({ "1.5" }) e para ruído plano de nulo a nulo sem normalização em banda ({ "2.2" }); o relatório imprime ambos

# text
seg-1461dcaed6be = Entrada e saída de gravações SigMF e estimativas espectrais de Welch de IQ complexo

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: ler e escrever gravações no Signal Metadata Format (.sigmf-meta em JSON com os campos centrais global, captures e annotations; .sigmf-data bruto como cf32_le, ci16_le ou ci8, com os decodificadores de inteiros compartilhados com realdata::iqif::load_iq), tudo sobre strings e buffers de bytes. spectrum::welch_psd: periodogramas com janela de Hann, sobrepostos e promediados, com escala de densidade, sobre uma transformada radix-2 interna ao crate (spectrum::fft_in_place). Essas duas são a afirmação validada. spectrum::synthesise_iq gera o modelo como IQ, e a seção [iq] do tipo <c1/> executa modelo para IQ para SigMF para Welch e compara com o modelo; sua seção [recording] estima uma gravação real (compilações nativas); a síntese e essas comparações com o modelo estão fora da afirmação validada

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) com a mesma janela de Hann periódica, sobreposição, escala de densidade, sem remoção de tendência e média bilateral: todo bin dentro de { "1e-12" } relativo (observado { "6.0e-14" }) em { "27" } casos, com as contagens de segmentos tomadas do próprio spectrogram do scipy. O sigmf-python { "1.13.0" } (LGPL-3.0, executado como ferramenta) escreve cinco gravações de terceiros (cf32_le, ci16_le, ci8, duas capturas com anotações, um primeiro sample_start diferente de zero) que o crate decodifica de forma idêntica bit a bit com campos centrais idênticos, e lê de volta as gravações do crate de forma idêntica bit a bit; o esquema de metadados do SigMF { "v1.2.6" } informa zero erros nos metadados do crate. Tolerâncias fixadas antes da primeira comparação. Fora da afirmação: spectrum::synthesise_iq e as comparações [iq] e [recording] com o modelo (uma síntese não tem uma única resposta certa; um chirp periódico mostra linhas, ondulação de Fresnel e caudas de borda que o modelo suave omite, com potência total dentro de { "2" } %), a convenção de escala de inteiro para ponto flutuante (o crate divide por { "32767" } e { "127" }, o autoscale do sigmf-python por { "2" }^{ "15" } e { "2" }^{ "7" }, o que a especificação deixa em aberto; a comparação usa códigos brutos), gravações multicanal e os tipos de dados que o leitor recusa

# text
seg-bf2d02d76762 = Posições de planetas em todo o sistema solar a partir dos elementos keplerianos de Standish do JPL

# text
# c1: solar-system
seg-c9d3549045eb = Posições heliocêntricas de Mercúrio, Vênus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } d.C. a { "2050" } d.C.), e de todos os oito planetas a partir das Tabelas 2a/2b ({ "3000" } a.C. a { "3000" } d.C., com os termos de anomalia média b, c, s, f), seguindo passo a passo o algoritmo da página do JPL e rotacionadas para o ICRF (Referencial Celeste Internacional) pela obliquidade da página; a Terra é separada do baricentro pela série lunar de Montenbruck & Gill e pela razão de massas. Composto como ephem_provider::AnalyticSolarSystem, de modo que qualquer corpo esteja disponível em relação a qualquer outro, e executável como o tipo <c1/>

# text
seg-24e058d4d094 = Vetores heliocêntricos geométricos do JPL Horizons DE441 (eclíptica e ICRF), obtidos após os commits de pré-registro { "80451866" }, 8d38a28b e 558cc807. Limiar: por planeta e componente, RMS de no máximo 1.0x os erros aproximados da Tabela { "8.10.1" } do Explanatory Supplement 3rd ed. (a linha EMB para a Terra); a separação Terra-EMB é verificada diretamente contra o DE441 { "399" } menos { "3" }, no máximo { "0.3" } graus e { "8.1" } km em cada época de 1950-2050 (o limiar de comprimento de { "8.1" } km vem da exatidão da série lunar declarada na documentação de efemérides própria do Kshana, que cita Montenbruck e Gill, e não foi verificado contra o livro; o valor medido de { "6.09" } km fica perto dele). A estatística RMS foi escolhida sabendo-se que uma comparação anterior com 27 épocas chegou a 1.87x o nominal em seu máximo; erros de época única chegam a 3.83x (3.87x no caso do ICRF). O Supplement não define seus valores como RMS. O caso B rotaciona ambos os lados com a obliquidade IAU { "1976" } digitada no teste, de modo que a rotação não é verificada contra si mesma. A seleção de tabela padrão do AnalyticSolarSystem não é exercitada (os testes forçam a Tabela { "1" }). Urano e Netuno da Tabela { "1" } são uma linha MODELLED separada

# text
seg-4ea08a296b37 = Posições do Sol, da Lua, de Mercúrio e de Vênus a partir do kernel DE440 em épocas UTC (KernelEphemeris)

# text
seg-8d47467c36e4 = Posições geométricas do Sol, de Mercúrio, de Vênus, da Terra e da Lua umas em relação às outras (eixos J2000/ICRF, metros) a partir de um kernel JPL DE440 por meio de ephem_provider::KernelEphemeris em épocas UTC: nomes de corpos mapeados para códigos NAIF, UTC levado pela tabela de segundos intercalares e TT para TDB com a série TDB-TT de dois termos, o kernel lido pelo leitor próprio do motor. Um corpo que o kernel guarda apenas como baricentro de um sistema (Marte a Netuno, Plutão no de440s) é recusado, nunca substituído. A linha de Standish sem kernel permanece como caminho do navegador e de contingência

# text
seg-f0e09f78814a = Skyfield { "1.54" } (MIT), com sua própria tabela de segundos intercalares, seu próprio TDB-TT e seu próprio leitor do mesmo NAIF de440s.bsp (jplephem), executado como um programa separado em épocas UTC. Pré-registrado (0bfafe6d) antes de a fixture existir, com a grade semeada a partir do hash desse commit, com um limiar de { "5e-5" } s vezes a velocidade relativa (a exatidão declarada do motor para o TDB-TT de dois termos) mais { "1e-13" } da distância baricêntrica mais { "1e-5" } m, por componente. Resultado: todos os { "600" } dentro, pior caso em { "0.66" } do limiar ({ "2.96" } m em um par rápido, o próprio erro da série TDB-TT). Mutação: usar TT como TDB falha em { "33" } vezes o limiar. Ambos os lados leem o DE440: isto valida o provedor e sua cadeia de tempo, não o DE440. Fora da afirmação: os planetas além de Vênus como corpos (o de440s traz apenas seus baricentros), as luas planetárias e a precisão abaixo da série TDB-TT de dois termos (alguns metros nos pares mais rápidos)

# text
seg-b59153f28d69 = Tempo de luz entre corpos do sistema solar

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = O tempo de luz newtoniano de ida de qualquer corpo para qualquer outro, recebido em uma época, resolvido pelo solucionador radiométrico de tempo de luz por ponto fixo (radiometric::light_time_solution, transmissor em sua posição retardada) por meio de solar_system::link_on sobre qualquer EphemerisProvider; o tipo solar-system o executa sobre o sistema solar analítico no referencial heliocêntrico (solar_system::link). A distância de ida e volta de radiometric::two_way_range e o atraso de Shapiro do Sol de radiometric::shapiro_delay são informados separadamente e não são comparados externamente. Emitido para cada corpo em relação a um observador e para qualquer enlace extra pelo tipo <c1/>, e para o enlace de descida do corpo para a Terra pelo tipo <c2/>

# text
seg-0685ab1ef2d3 = Tempo de luz newtoniano LT do trecho de descida de ida do JPL Horizons DE441 (VEC_CORR=LT, observador no centro da Terra), pré-registrado (480037d3, emenda 54d5c86f que mudou apenas o espaçamento dos nós de interpolação depois que a primeira obtenção falhou em sua pré-condição de precisão de interpolação de { "10" } m, antes de qualquer tempo de luz ser comparado) com um limiar de { "1e-6" } s por tempo de luz, com o solucionador alimentado com posições baricêntricas do DE441 para que a iteração do transmissor retardado seja visível (um solucionador de primeira iteração erra em até { "0.1" } s). Nas posições analíticas de Standish, o tempo de luz é tão bom quanto essas posições (ver a linha de posições de planetas); o enlace fornecido trata o Sol como um centro inercial, o que permanece dentro desse erro de posição, mas não é validado separadamente. two_way_range e shapiro_delay não são comparados externamente

# text
seg-6e0b9687e8ee = Urano e Netuno a partir da Tabela { "1" } de Standish, Plutão e velocidades planetárias

# text
seg-df3bf502dfe9 = Posições de Urano e Netuno a partir da Tabela { "1" } de Standish (o padrão entre { "1800" } d.C. e { "2050" } d.C.), de Plutão a partir da linha da Tabela { "1" } de { "1992" } que a página atual do JPL não lista mais, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com o movimento médio que os elementos implicam, mais a rotação da elipse pelas taxas de periélio, inclinação e nodo

# text
seg-f49245efe44f = Medido contra o JPL Horizons DE441 (as mesmas fixtures versionadas), mas não validado: os valores declarados na Tabela { "1" } para Urano e Netuno são excedidos em até { "2.0" } e { "5.2" } vezes contra as posições heliocêntricas do DE441 (Netuno os atende contra posições baricêntricas, o que sugere que o ajuste não foi heliocêntrico), a página não declara erro para Plutão, e não existe limite publicado para as velocidades. As Tabelas 2a/2b atendem seus próprios valores para Urano e Netuno e são cobertas pela linha validada

# text
seg-a50be56f605a = Posições da Lua e de sete luas principais (Fobos, Deimos, as luas galileanas, Titã)

# text
seg-2cfbe5a1eece = A Lua geocêntrica a partir da série de Montenbruck & Gill (cujo termo de -1.3972 graus por século já a refere ao equinócio J2000), e as posições e velocidades planetocêntricas de Fobos, Deimos, Io, Europa, Ganimedes e Calisto a partir dos elementos médios de Dinâmica do Sistema Solar do JPL no plano de Laplace de cada lua, com a taxa de longitude média tomada da taxa de rotação síncrona da IAU (a tabela imprime o período com poucos dígitos para manter a fase), e de Titã a partir do modelo de rotação da IAU (a lua sobre o eixo x fixo ao corpo, com sinal negativo, na distância média), porque a linha impressa do plano de Laplace de Titã não reproduz o Horizons nem em sua própria época

# text
seg-6c81bd570fe5 = Medido contra as efemérides de satélites do JPL Horizons (DE441, MAR099, JUP365, SAT441) versionadas em tests/fixtures/solar_system/horizons_satellites_icrf.csv com a consulta e a data de obtenção; não existe exatidão publicada para elementos médios nem para a colocação pelo modelo de rotação, de modo que os limiares fixados detectam regressões e não validam. Os elementos médios omitem as perturbações ressonantes e solares, e a aceleração secular de Fobos não é modelada

# text
seg-8b8c8e28ece9 = Constantes físicas de cada corpo do sistema solar e o relatório do sistema inteiro

# text
# c1: solar-system
seg-d225a30de35c = Body ganha Mercúrio, Vênus, Júpiter, Saturno, Urano, Netuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã (parâmetro gravitacional, raio de referência, J2 onde publicado com o raio ao qual se refere, polo e meridiano de origem da IAU), uma busca por nome e um registro BodyFacts (código NAIF, classe, pai, raio equatorial e médio); o tipo <c1/> os informa para todos os dezoito corpos com as posições, os tempos de luz e uma trilha orbital ao longo de uma revolução, cada corpo rotulado VALIDATED ou MODELLED

# text
seg-6adc29de51fd = Transcrição de constantes publicadas, cada uma citada onde é definida: parâmetros gravitacionais dos registros de corpos do JPL Horizons e da tabela de parâmetros físicos de satélites do JPL, raios das tabelas de parâmetros físicos do JPL (IAU WGCCRE { "2015" }), polos e meridianos de origem do Grupo de Trabalho da IAU sobre Coordenadas Cartográficas e Elementos de Rotação (valores médios, sem os termos de taxa T e periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } e { "2019" }, e Jacobson { "2009" } e { "2014" }. Verificadas quanto à consistência interna (o período de rotação de Júpiter contra a taxa do Sistema III, cada J2 contra seu raio de referência), não contra uma referência independente externa. { "0.30" } rodada { "2" }: os valores de GM foram adotados de gm_de440 e os elementos de Fobos e Deimos de pck00011, de modo que { "0" } de { "84" } constantes dos quatorze corpos adicionados agora diferem do NAIF (eram { "12" }), o que é uma verificação de transcrição e não é contado. { "0.36" }: a orientação fixa ao corpo da IAU e o GM dos quatorze corpos adicionados foram separados em sua própria linha VALIDATED ("Orientação dos corpos pela IAU e parâmetro gravitacional dos quatorze corpos adicionados do sistema solar"); esta linha mantém o que sobrou. J2 e o raio médio são citados, não validados; as posições no relatório se apoiam em suas próprias linhas; e o prime_meridian_deg do relatório para a Terra, a Lua e Marte permanece em constantes convencionais (até { "6.6e-3" }, { "2.8e-2" } e { "9.6e-4" } rad de IAU_<BODY>). { "0.30" } revisões: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Netuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutão { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; raio equatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg agora inclui os termos quadráticos e periódicos

# text
seg-fa8a4b082cd5 = Orientação dos corpos pela IAU e parâmetro gravitacional dos quatorze corpos adicionados do sistema solar

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, a rotação de J2000 para o referencial fixo ao corpo da IAU de Mercúrio, Vênus, Júpiter, Saturno, Urano, Netuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã, com toda taxa secular, termo quadrático e termo periódico que o corpo traz no pck00011, e o campo de parâmetro gravitacional mu dos mesmos quatorze corpos. O Sol, a Terra, a Lua e Marte trazem constantes convencionais pertencentes a outras linhas e não são cobertos

# text
seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 até spiceypy) pxform('J2000', 'IAU_<BODY>') em pck00011.tpc, uma implementação independente do mesmo modelo de rotação da IAU, e NAIF gm_de440.tpc para o GM, com as fixtures geradas por um programa separado que não chama nenhum código do Kshana (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Pré-registrado 154bc54 (com o limiar original de { "1e-9" } rad de c2434204) antes de a fixture de épocas novas existir; a fixture nova foi regenerada de forma independente e é idêntica byte a byte. O GM é uma transcrição do DE440 verificada contra o arquivo publicado, não uma determinação independente do GM. Resultados: docs/design/evidence/mr08-body-orientation/RESULTS.md

# text
seg-87ab655f8270 = Posicionamento em torno de qualquer corpo do sistema solar com uma constelação local e um enlace de espaço profundo a partir da Terra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = O tipo <c1/>: um orbitador ou um módulo de pouso em superfície em torno de um corpo escolhido pelo nome navega com pseudodistâncias de ida de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular de J2 do corpo, um relógio de usuário desconhecido) e uma distância bidirecional opcional, livre de relógio, a partir da Terra, com a direção e a distância da Terra tomadas da efeméride analítica em cada época; linhas de visada bloqueadas pela esfera do corpo e uma máscara de elevação na superfície; por época, o GDOP e o PDOP apenas da constelação (orbit::dop), a incerteza formal de posição com e sem a linha da Terra, e soluções de Gauss-Newton semeadas (batch_ls::gauss_newton) de cada modo, com o tempo de luz e o tempo de ida e volta do corpo à Terra

# text
seg-3538c49df107 = Formas fechadas e autoconsistência: a terceira lei de Kepler para o período do relé, o raio da órbita e o raio da superfície mantidos durante a execução, o acréscimo de uma medição nunca aumentando a incerteza formal e os erros semeados concordando com a covariância. As órbitas dos relés ignoram terceiros corpos (a atração de Júpiter sobre relés em torno de Europa não é modelada), o ruído é gaussiano em níveis declarados e o modelo de medição é instantâneo, de modo que isto não é validado contra dados de navegação de nenhuma missão

# text
seg-281b680a9897 = Geometria de constelação Walker e os slots nominais publicados do GPS, Galileo e GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Os geradores do tipo <c1/>: padrões Walker delta e star na convenção T/P/F (espaçamento de nós 360/P ou 180/P, espaçamento no plano { "360" }·P/T, deslocamento de fase entre planos { "360" }·F/T), e as predefinições da linha de base do GPS e de 24 slots expansíveis, do Galileo e do GLONASS construídas a partir de seus elementos nominais publicados, colocadas em um referencial fixo à Terra pelo ângulo horário de Greenwich que seus documentos declaram

# text
seg-bdf83007af50 = Documentos publicados de agências: Galileo Open Service Service Definition Document edição { "1.1" } (European GNSS Service Centre) Tabelas { "1" } e { "23" }, a constelação de referência em 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edição { "5.1" } ({ "2008" }) seção { "5.2" }, a fórmula de slot para a longitude do nodo e o argumento de latitude; GPS Standard Positioning Service Performance Standard 5ª edição (abril de { "2020" }) Tabelas 3.2-1, 3.2-2 e 3.2-3, incluindo a coluna de cruzamento equatorial do rastro no solo, que é uma declaração independente da geometria fixa à Terra que a predefinição deve reproduzir. Valida os geradores e a transcrição; a fase de órbita média e os nodos geossíncronos inclinados do BeiDou não são publicados e não são cobertos

# text
seg-0f1d49ab5d51 = Diluição global de precisão da constelação da linha de base do GPS

# text
# c1: constellation-design
seg-83775b77f5ca = O motor de cobertura do tipo <c1/> sobre a predefinição de 24 slots da linha de base do GPS sob as condições do Apêndice B do GPS Standard Positioning Service Performance Standard (SPS PS) (um dia sideral, { "287" } passos de cinco minutos, uma grade global de { "4" } x { "4" } graus ponderada pelo cosseno da latitude, todos em visada, máscara de { "5" } graus, um relógio de receptor): a distribuição global de HDOP, a mediana do PDOP e a disponibilidade de PDOP no máximo 6, globalmente e no pior local

# text
seg-6fb3c2028c4a = GPS SPS PS 5ª edição (abril de { "2020" }) Apêndice B seções B.3.2.2 e B.3.2.3, a distribuição publicada do HDOP médio global da constelação de linha de base de 24 slots totalmente ocupada (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, média { "0.96" }), Tabela 3.8-1 (disponibilidade de PDOP) e Tabela B.3-1 (PDOP do conjunto de uma constelação degradada, usado apenas como limite superior), mais uma forma fechada derivada à mão para uma época. As distribuições de VDOP e PDOP da constelação completa são publicadas apenas como figura, de modo que o PDOP é fixado de um só lado; o pior ponto tempo-espaço (HDOP { "2.40" } e VDOP { "5.22" } aqui, { "2.49" } e { "5.43" } publicados) depende da grade e é informado, não fixado

# text
seg-7d4d7200cbca = Mapas de cobertura e de diluição de precisão para projetos arbitrários de múltiplas constelações em escala, em torno de qualquer corpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = O tipo <c1/> além dos dois casos fixados: projetos explícitos e de múltiplas camadas, várias constelações por execução com um relógio de receptor por constelação, a Terra, a Lua e Marte a partir das constantes de corpos, a predefinição do BeiDou (fase de órbita média e cruzamento geossíncrono inclinado em { "118" } graus L modelados), satélites em visada por célula, GDOP, PDOP, HDOP, VDOP e disponibilidade, rastros no solo subamostrados e um pré-filtro de visibilidade por latitude do subsatélite que executa um projeto de { "5" } 000 satélites em uma grade de { "10" } graus em uma fração de segundo

# text
seg-2c0f28426ab9 = Consistência interna: a varredura de elevação por força bruta, as reduções calculadas à mão e por orbit::dop, e a geometria Walker e geossíncrona em forma fechada. Órbitas de dois corpos com J2 secular opcional, um corpo esférico com a vertical local ao longo do raio, apenas visibilidade geométrica (sem potência de sinal, saúde de satélite, terreno ou perturbação de terceiros corpos), e a fase relativa entre sistemas tomada de épocas de referência diferentes, de modo que não é um instantâneo de nenhuma data. { "0.30" } revisão, uma constatação (permanece MODELLED): as predefinições atingem os pisos publicados unilaterais de disponibilidade de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) em { "100" } %, mas com o PDOP do motor dobrado em uma cópia de rascunho elas ainda os atingem (pior ponto { "99.36" } %), de modo que os pisos não conseguem detectar nem um erro de { "100" } % na grandeza que esta linha calcula; apertá-los depois da execução seria uma tolerância a posteriori. A promoção exige uma comparação bilateral de valores de DOP sobre geometria idêntica com uma tolerância predefinida. { "0.30" } rodada { "2" } (tests/coverage_dop_full_oracle.rs, pré-registrada add671d6), uma constatação (permanece MODELLED): posições, elevação, azimute e rastros no solo do Orekit { "12.2" } com GDOP/PDOP/HDOP/VDOP do gnss_lib_py { "1.0.4" } (relógio comum) e uma inversa em numpy (um relógio por constelação) concordam em todos os limiares nos projetos Galileo, GPS, BeiDou, Galileo+GPS (um relógio cada) e de 1584 satélites na Terra (DOP dentro de { "2e-14" } relativo, solução idêntica, contagens de disponibilidade e visibilidade idênticas). Nos projetos da Lua e de Marte, os elementos, as posições, a visibilidade e os rastros concordam, mas o DOP excede o limiar relativo predefinido de { "1e-9" } em células cujo maior PDOP é { "1434" } ou mais (até { "8e-6" }), e { "4" } células diferem por uma época de solução em geometria numericamente singular (pivô do motor { "1e-10" } contra o posto do numpy), de modo que a linha não é validada. { "0.30" } revisões: o relógio de referência de TDOP/GDOP agora é a constelação de menor número em visada (GDOP global máximo de constellation-multi-gnss-coverage { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }), e as contagens de visíveis por constelação são somadas como inteiros

# text
seg-278c77438493 = Uma missão encadeada entre tipos de cenário em uma única linha do tempo compartilhada

# text
# c1: campaign
seg-3dcfb26f6234 = As fases do tipo <c1/>: cada fase executa um ou mais cenários de tipos existentes por run_toml, lê suas saídas em canais nomeados (erro de tempo e guarda do relógio, razão média efetiva portadora-densidade de ruído e piso de rastreamento, nível de proteção vertical e limite de alerta, erro de posição, satélites em rastreamento, indicadores de alarme) por predefinições por tipo ou caminhos de resultado explícitos, as coloca no início da fase e as mantém em uma grade comum, com limites de fase e eventos; o estado é repassado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número de uma fase anterior escrito no cenário seguinte) e end_at (uma fase termina em um instante calculado por uma execução, como o instante de detecção de um monitor de spoofing); um hash da campanha e um resumo sobre todos os resultados dos membros

# text
seg-fd018ef7bc3b = Identidades de composição contra as execuções isoladas dos mesmos tipos: uma campanha de uma fase reproduz a saída isolada bit a bit, o deslocamento carregado é igual à própria última amostra da execução anterior, e a fase encerrada por end_at tem exatamente o instante de detecção da execução como duração. O carry aditivo através de um limite de fase e a retenção de ordem zero são escolhas de modelagem, e cada fase é tão boa quanto o tipo que a executou; nenhuma missão encadeada foi verificada contra uma medida

# text
seg-ad6105af464c = Varreduras de parâmetros e conjuntos Monte Carlo semeados sobre qualquer tipo de cenário

# text
# c1: campaign
seg-95921611839e = As seções sweep (de uma a três chaves com pontos de qualquer tipo, sobre os valores de eixo da varredura genérica, opcionalmente um conjunto em cada nó) e monte_carlo do tipo <c1/>: a realização k é executada em base_seed + k; cada métrica informa média, desvio padrão, percentis 5º/50º/95º por posto mais próximo e um intervalo de confiança de { "95" } % por bootstrap de percentis com semente fixa sobre a média (inertial::metric_stat); as unidades das métricas são lidas do próprio bloco de unidades do tipo varrido

# text
seg-03d15c27b3b9 = A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções isoladas para a semeadura. Ela verifica a aritmética do conjunto sobre o próprio modelo de relógio do motor, não sobre um conjunto de dados externo

# text
seg-24327a0ed82e = Vários cenários sob condições compartilhadas, com um resumo combinado

# text
# c1: campaign
seg-5833fb3b06e3 = A seção compose do tipo <c1/>: valores compartilhados nomeados (por exemplo, a potência e a posição de um jammer) escritos em cada membro nas chaves às quais os vincula, cada membro executado e, por métrica, o menor valor, o maior valor e o valor médio entre os membros, com o membro nomeado; as unidades das métricas devem concordar entre os membros

# text
seg-67ffd6684b1c = Identidade de composição contra a execução isolada. A aritmética das condições compartilhadas é contabilidade; a física é a dos tipos dos membros, cada um com sua própria linha

# text
seg-0bc866720bde = Otimização limitada de uma métrica sobre parâmetros de campanha

# text
# c1: campaign
seg-f9bdb89c2b4f = A seção optimize do tipo <c1/> (CAP-32): de uma a três chaves de cenário com pontos limitadas a [lo, hi] em escala lin ou log, uma métrica lida por caminho de resultado, objetivo minimize, maximize ou target; método grid (os valores de eixo da varredura) ou um simplex determinístico de Nelder-Mead em coordenadas normalizadas, com projeção na caixa e os coeficientes padrão; uma métrica ausente ou não finita recebe a pior pontuação e permanece no trace; com runs > { "1" }, a métrica é a média sobre sementes comuns; cada avaliação é uma execução real do tipo nomeado, listada em trace e contada no resumo de reprodutibilidade

# text
seg-e3a2f80b04dc = Somente interno: a forma fechada exata -20 log10(distância) da equação de enlace, uma grade independente de força bruta sobre o mesmo tipo e a função de Rosenbrock. O limiar 1-D da rodada { "1" } é NOT MET (a caixa pré-registrada excluía a solução de { "3" } dB; o otimizador parou no limite), registrado em docs/design/evidence/cap32-optimize/RESULTS.md e não repontuado. O ótimo é local à caixa e ao ponto de partida; nenhuma afirmação de ótimo global

# text
seg-b9b1637d326c = Formas fechadas limitadas em banda para qualquer sinal de telemetria: potência em banda e jitter de rastreamento de código early-late contra valores publicados, com a largura de banda de Gabor e a separação espectral com deslocamento verificadas de forma cruzada

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: a integral seno (sine_integral), a fração de potência do BPSK-R dentro de uma banda bilateral em forma fechada (bpsk_power_in_band_closed_form), a largura de banda de Gabor do BPSK limitado em banda em forma fechada (bpsk_gabor_bandwidth_closed_form_hz), o jitter da malha de captura de atraso early-late, coerente e não coerente, limitado em banda para qualquer espectro de área unitária segundo Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) e seu limite de Gabor para espaçamento tendendo a zero (dll_jitter_small_spacing_limit_s), o coeficiente de separação espectral do BPSK com deslocamento em forma fechada (bpsk_offset_ssc_closed_form), o espectro AltBOC({ "15,10" }) do Galileo E5 (altboc_15_10_psd) e um analisador de rótulos de modulação (parse_modulation); usados pelo tipo <c1/> em todo projeto de sinal

# text
seg-15d8c44be46f = Fixados externamente: { "90.3" } por cento de potência no lóbulo principal, o jitter early-late coerente no ponto de operação declarado, os valores da tabela da integral seno e o coeficiente de autoseparação espectral do BPSK 2/({ "3" } R_c) em deslocamento zero. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor do BPSK limitado em banda e sua assíntota, e o coeficiente de separação espectral do BPSK com deslocamento em deslocamentos não nulos, ambos derivados aqui e verificados contra quadratura. Formas fechadas publicadas: o espectro sinc ao quadrado do BPSK-R e sua potência de { "90" } por cento no lóbulo principal (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.); o jitter coerente early-late de rastreamento de código sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, seção { "8" }) e a generalização limitada em banda com seu limite de largura de banda de Gabor (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); as tabelas da integral seno de Abramowitz & Stegun (Tabela { "5.1" }); o coeficiente de separação espectral como a transformada de Fourier da autocorrelação ao quadrado (Betz { "2001" }). O espectro AltBOC é verificado apenas quanto à área unitária e à posição dos lóbulos (a expressão do Galileo Open Service Signal-in-Space Interface Control Document integra a { "8" } e é dividida por esse valor).

# text
seg-def449efa852 = Doppler máximo de um satélite de navegação em órbita baixa da Terra, que dimensiona a busca de aquisição

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: o maior Doppler do satélite em uma passagem sobre a vertical na máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c, a partir da portadora e da altitude orbital próprias de cada predefinição; o tipo <c1/> acrescenta termos de oscilador e de usuário e o converte em faixas de Doppler

# text
seg-652e28dfa10f = Projetos de sinais de posicionamento, navegação e temporização em órbita baixa da Terra: rastreamento de código, aquisição, compatibilidade com GNSS e uma troca de bandas para qualquer sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = O tipo <c1/>: projetos de sinais parametrizados (banda, largura de banda de transmissão, alocação da ITU; componentes de aquisição, de dados e piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, participações de potência, subportadoras FDMA, comprimentos de código e taxas de dados) a partir de arquivos de predefinições públicas compilados no programa (Xona Pulsar, Iridium STL, sinal de oportunidade do Starlink, CentiSpace, um projeto genérico em banda C e projetos genéricos UHF/L/S/C/C larga, cada um com sua URL de origem e valores não publicados rotulados REPRESENTATIVE) ou escritos em linha; por sinal, a densidade espectral de potência limitada em banda, as frações de potência em banda, a largura de banda de Gabor, o jitter de código contra C/N0 e espaçamento e a exatidão de telemetria, o espaço de busca de aquisição, a probabilidade de detecção por lei quadrática e o tempo médio de aquisição serial e paralela em código, o coeficiente de separação espectral para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a degradação de C/N0, e a tolerância de J/S CW, de banda larga e casada a partir da cadeia de SSC do tipo spectrum; uma troca de bandas entre atraso ionosférico, perda em espaço livre, exatidão de telemetria com C/N0 igual e EIRP igual e tolerância a jammers; e verificações qualitativas de forma de um projeto contra uma medição descrita

# text
seg-040b3f5cc70e = As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à cadeia de SSC do próprio tipo spectrum (o mesmo código Jammer::ssc). Os projetos em si são entradas: predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espectros de QPSK de Feher aprimorado, de modulação por deslocamento de código e de OFDM são aproximados, e as verificações de forma comparam formas, não níveis calibrados.

# text
seg-c2b9c8e4a364 = Cascata de espectro multibanda (UHF, L, S, C) com sinais projetados e jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = O tipo <c1/> estendido além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com todos os componentes, limitado em banda à largura de banda de transmissão, com C/N0 e J/S referidos ao componente rastreado) ou como uma portadora e modulação personalizadas; painéis extras de cascata sobre qualquer faixa de frequência, na mesma linha do tempo e escala de cores; um jammer de banda larga (barragem) ao lado de CW, banda estreita, chirp e ruído casado; J/S por banda e C/N0 efetivo a partir da cadeia inalterada de coeficientes de separação espectral

# text
seg-a3b398f66ad3 = Redução à cadeia de espectro existente e à equação anti-jam do tipo jamming (uma banda de um só componente dá os mesmos números de antes da extensão) e aos espectros de sinal das linhas validadas. As potências dos jammers, a linha do tempo, as larguras de banda do front-end e os sinais projetados são entradas, e um sinal projetado é truncado em sua banda de transmissão (sem emissão fora de banda).

# text
seg-f92d6cbc58d4 = Coeficientes de atenuação específica por chuva para qualquer banda que um enlace LEO-PNT use

# text
# c1: leo-pass
seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 equações ({ "1" }) a ({ "5" }): k_H, alpha_H, k_V, alpha_V a partir dos ajustes de curva das Tabelas { "1" } a { "4" }, o (k, alpha) dependente do percurso e da polarização e a atenuação específica k R^alpha; usadas pelo termo de chuva do tipo <c1/>

# text
seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Tabela { "5" }, os próprios k_H, alpha_H, k_V, alpha_V tabelados da Recomendação, versionados em tests/fixtures/leo_link/p838_3_table5.csv com a URL do PDF e a data de obtenção. A tabela é arredondada aos dígitos impressos, de modo que o limiar é esse arredondamento

# text
seg-f4a311f936de = Atenuação por chuva de longo prazo em percurso inclinado em um enlace Terra-espaço

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 seção { "2.2.1.1" } passos { "2" } a { "10" } (percurso inclinado e horizontal abaixo da altura da chuva, fatores de redução horizontal e de ajuste vertical, A0.01 e seu escalonamento de { "0.001" } % a { "5" } % de um ano médio), com a altura da chuva (P.839) e R0.01 (P.837) como entradas porque o motor não traz nenhum dos dois mapas digitais; aplicados por banda e época pelo tipo <c1/>

# text
seg-325d1bb9c26d = Arquivo de exemplos de validação do ITU-R Study Group { "3" } CG-3M3J-13-ValEx-Rev8.3.0 para a P.618-14, como tabulado pelas páginas de validação do ITU-Rpy, com a altura da chuva P.839-4 de cada local a partir dos mesmos exemplos; versionado em tests/fixtures/leo_link/p618_14_rain_attenuation.csv com as URLs e a data de obtenção. Valida o procedimento dados h_R e R0.01, não os mapas

# text
seg-6b51ec84bdce = Cintilação troposférica de amplitude em um enlace Terra-espaço

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 seção { "2.4.1" } passos { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do percurso, fator de média da antena, profundidade de desvanecimento para { "0.01" } % a { "50" } % do tempo), com N_wet como entrada ou calculado a partir de temperatura, umidade e pressão pelas expressões da ITU-R P.453-14; abaixo de { "4" } GHz o tipo <c1/> sinaliza o valor como extrapolação

# text
seg-7fc4a1e7960a = Exemplos de validação do ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação da P.618-14, com o N_wet da P.453-14 de cada local a partir dos mesmos exemplos; versionados em tests/fixtures/leo_link/p618_14_scintillation.csv com as URLs e a data de obtenção. A expressão da refratividade úmida a partir de temperatura e umidade não é coberta por esta linha

# text
seg-e0d40cf4ea79 = Perda de entrada em edificações para um usuário interno de LEO-PNT

# text
# c1: leo-pass
seg-4f06274e38ec = ITU-R P.2109-2 Anexo { "1" } equações ({ "1" }) a ({ "10" }) com a Tabela { "1" }: a perda não excedida com probabilidade P para edificações tradicionais e termicamente eficientes na elevação do percurso na fachada, de { "80" } MHz a { "100" } GHz; aplicada por banda e época a um usuário interno pelo tipo <c1/> (o caso interno em UHF)

# text
seg-99c648f9c6eb = Os valores da planilha de validação de Clutter e BEL do ITU-R Study Group { "3" }, como transcritos no script de validação da implementação de referência em MATLAB (github.com/eeveetza/p2109), versionados em tests/fixtures/leo_link/p2109_bel.csv com a URL e a data de obtenção. A planilha imprime três casas decimais

# text
seg-8c5e291c8ff8 = Atraso ionosférico de primeira ordem por banda, a combinação livre de ionosfera e a perda em espaço livre

# text
seg-89df726127f9 = Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes livres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação de ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) para qualquer par de bandas; a perda em espaço livre { "20" } log10({ "4" } pi R f/c) de linkbudget::free_space_loss_db em sua forma quilômetro-megahertz

# text
seg-9bf00f744174 = IS-GPS-200 seção { "20.3.3.3.3.2" }, que declara a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } que decorre do escalonamento de primeira ordem 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escala, não um TEC inclinado

# text
seg-c584a867fcda = Doppler máximo que um usuário estático vê a partir de uma órbita LEO ou MEO

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: uma busca sobre cada posição orbital e cada usuário no horizonte do satélite de uma órbita circular, com a Terra girando, pela maior taxa de variação de distância, mais as velocidades orbital e a maior velocidade do satélite fixa à Terra; informada por banda como o envelope de Doppler pelo tipo <c1/> e usada como janela de busca de partida a frio de seu modelo de baixa energia

# text
seg-4abd3afebad2 = Leclere, Marathe e Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabela { "1" } (receptor estático em uma esfera de { "6371" } km, com a rotação da Terra como único outro efeito): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz em L1. Cobre órbitas circulares de dois corpos

# text
seg-d9eb3e7e69c2 = Uma passagem LEO-PNT e seu orçamento de enlace por banda contra os satélites GNSS MEO em visada

# text
# c1: leo-pass
seg-d986e44443dd = O tipo <c1/>: satélites a partir de uma passagem projetada, elementos, um TLE por meio do SGP4 ou uma constelação Walker de constellation-design; por banda e época, os ângulos de visada, a distância, a taxa de variação de distância e a aceleração de distância em forma fechada (verificadas a cada execução contra diferenças centrais e informadas), perda em espaço livre, EIRP com um diagrama isoflux, gaussiano ou plano, uma antena de usuário do tipo patch, hemisférica ou isotrópica, atenuação gasosa do ITU-R P.676-10 Anexo { "2" }, chuva e cintilação da P.618, perda de entrada em edificações da P.2109, descasamento de polarização, temperatura de ruído do sistema, C/N0, Doppler e taxa de Doppler, e o atraso de primeira ordem a partir de um TEC inclinado de Klobuchar ou de TEC vertical, escalonado pela fração de Chapman abaixo do satélite; pares livres de ionosfera com ruído de código no pico da passagem; portadoras do Galileo ou do GPS a partir das potências recebidas de seus documentos de interface, pelo mesmo receptor

# text
seg-c558a6519038 = Formas fechadas e autoconsistência: as identidades de taxa de variação de distância e de aceleração de distância contra derivadas numéricas, o ganho isoflux cancelando o crescimento da distância, os limites de perda de polarização de livro-texto, a observação qualitativa LEO versus GNSS (uma passagem em forma de sino de minutos, com pico vários dB acima de portadoras GNSS planas de 44-51 dB-Hz). Os EIRPs e os diagramas são potências recebidas publicadas convertidas em EIRP ou escolhas representativas, o termo gasoso é o método simplificado P.676-10, já superado, e nada é comparado com um C/N0 de LEO medido

# text
seg-95a077a980b6 = Predefinições nomeadas de sistemas LEO-PNT com fontes declaradas e um motor agnóstico quanto ao sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérica (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como sinal de oportunidade apenas de Doppler, CentiSpace e uma predefinição opcional Celeste IOD, cada uma com sua fonte marcada PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP, a de workshop no arquivo opcional de predefinição Celeste IOD, compilada somente quando esse arquivo existe; toda banda e órbita pode ser sobrescrita em um cenário, e um cenário pode não nomear predefinição alguma

# text
seg-399dc53ceafb = Transcrição dos valores públicos citados e uma verificação de consistência: um EIRP definido a partir de uma potência mínima recebida publicada prevê a máxima publicada dentro de { "0.5" } dB com um diagrama plano. Isso é uma verificação da dispersão de distância, não uma validação da antena de qualquer satélite; predefinições representativas não fazem nenhuma afirmação sobre um sistema real

# text
seg-a39f34973373 = Posicionamento de baixa energia: tempo até a primeira solução e energia por solução contra o ciclo de trabalho

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy e a seção [iot] do tipo <c1/>: integração coerente limitada pela taxa de Doppler, somas não coerentes de lei quadrática até um limiar de detecção, uma busca em faixas de Doppler sobre o envelope de usuário estático da órbita (a frio) ou uma janela assistida (a quente), busca de código paralela ou serial, tempo da mensagem de navegação em partida a frio, energia por solução e vida útil da bateria entre intervalos de solução, para cada banda LEO e o sinal GNSS

# text
seg-a5fa1ef1be9b = Consistência interna de um modelo de projeto declarado: toda escolha de potência, limiar e busca é uma entrada, e o modelo ignora a ambiguidade de borda de bit, a perda de detecção e a reaquisição. Não comparado com um receptor medido

# text
seg-7e94f8b38cff = Pesos de erro de distância de sinal no espaço médios globais para qualquer altitude orbital

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: o peso radial w_R e o peso transversal ao quadrado w_AC^{ "2" } como médias de cos^{ "2" } e de metade de sin^{ "2" } do ângulo de nadir da linha de visada sobre usuários uniformemente distribuídos na calota visível da Terra acima de uma máscara de elevação, para qualquer raio orbital, por integração de Simpson; usados por todo valor de SISRE de leo-navmsg (a { "510" } km, w_R { "0.46" } e w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = A tabela publicada de fatores de ponderação do SISRE de Montenbruck, Steigenberger e Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } e 1/49, GLONASS { "0.98" } e 1/45, Galileo { "0.98" } e 1/61, BeiDou MEO { "0.98" } e 1/54, BeiDou IGSO/GEO { "0.99" } e 1/126. A mesma média avaliada em raios LEO dá os pesos LEO; nenhuma tabela LEO publicada é fixada, de modo que os valores LEO são o método validado aplicado, não validados separadamente

# text
seg-3cbb8b6afe3c = Algoritmo de usuário da efeméride de transmissão do ICD do Galileo como base de uma mensagem de navegação LEO

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: a avaliação kepleriana do ICD OS SIS do Galileo (equação de Kepler, correções de segundo harmônico, nodo fixo à Terra) escrita separadamente do avaliador RINEX do motor, retornando a posição com o argumento de latitude, a inclinação e o nodo a partir dos quais o referencial de correção ao longo da trajetória/transversal/radial é construído, e os termos de extensão de Liu et al. { "2025" }

# text
seg-6a90728fcea9 = Posições ECEF eph2pos do RTKLIB 2.4.2-p13 (uma implementação independente do mesmo algoritmo do ICD) para registros reais de transmissão BKG/IGS de 2024-09-10, ambos versionados com procedência em tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Isto valida o algoritmo kepleriano de usuário; as correções ao longo da trajetória/transversal/radial acrescentadas por cima são cobertas por suas próprias linhas, e os termos de Liu pela linha de 22 parâmetros de Liu et al. { "2025" }

# text
seg-d65102fd4a1d = Verificação de quadro CRC-24Q para a mensagem de navegação LEO

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: polinômio gerador 0x1864CFB, valor inicial { "0" }, sem reflexão, sem XOR final, a verificação que o quadro LEO do Kshana carrega sobre todo byte precedente

# text
seg-18c79d18e4e4 = O valor de verificação do catálogo de CRC para estes parâmetros (catálogo de CRC reveng.sourceforge.io, CRC-24/LTE-A: largura { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), que são os parâmetros CRC-24Q da RTCM { "10403" } e do ICD OS SIS do Galileo, e o quadro de exemplo do tipo de mensagem { "1005" } impresso na RTCM { "10403" }

# text
seg-82b9b0f7b07c = Ajustador de efemérides de transmissão LEO e erro de distância de sinal no espaço contra intervalo de ajuste e período de atualização

# text
# c1: leo-navmsg
seg-8c7065aa22bd = O ajustador e a troca do tipo <c1/>: uma órbita verdadeira integrada com gravidade zonal J2-J6 ou EGM2008 até o grau escolhido e arrasto, e um relógio livre ou corrigido com semente; um ajuste de Levenberg-Marquardt do conjunto kepleriano do Galileo sobre elementos não singulares com priors fracos, depois polinômios de correção ao longo da trajetória, transversal e radial por mínimos quadrados lineares; o polinômio de relógio ajustado descontado o termo relativístico do usuário; o SISRE (somente órbita e com relógio) sobre períodos de uso centrados em suas janelas de ajuste, contra o intervalo de ajuste e o período de atualização. Parte validada: o ajuste kepleriano de 16 parâmetros e seu SISRE somente de órbita contra o intervalo de ajuste em órbitas precisas reais, e a órbita verdadeira integrada com J2-J6/EGM2008({ "20" }, { "70" })/arrasto contra o Orekit { "12.2" } dentro de { "4.6" } mm ao longo de { "6" } h (limiar de { "2" } cm, mesma entrada de densidade); os polinômios de correção, o ajuste do relógio (relógio livre ou corrigido com semente) e a troca do período de atualização permanecem modelados

# text
seg-7dfbc8297444 = Órbitas científicas precisas reais como verdade (órbitas reduzido-dinâmicas operacionais do TU Graz IfG/ITSG, de uso livre com reconhecimento; valores SHA-256 no NOTICE da fixture) ajustadas pelo conjunto de 16 parâmetros em arcos de { "20" } e { "30" } min, contra as estatísticas que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publicam para os mesmos satélites e dias: RMS ao longo da trajetória, transversal e radial, cada um dentro de 1.5x (medido de { "0.804" } a { "1.087" }), SISRE dentro de 1.5x (medido de { "0.716" } a { "0.809" }) e pesos de SISRE dentro de { "0.005" } de sua Tabela { "2" } (medido { "0.0007" }); tolerâncias fixadas antes da comparação. O critério por componente dá ao teste seu poder de detecção: zerar a taxa de inclinação deixa toda razão de SISRE dentro de 1.5x, mas reprova o critério transversal. A razão uniforme de SISRE de { "0.72" } a { "0.81" } é a do artigo: seus valores impressos de SISRE usam os pesos da Tabela { "2" } sem elevar ao quadrado, em vez de sua própria Eq. { "9" }, que o Kshana segue (Montenbruck et al. { "2018" }). A órbita verdadeira integrada (J2-J6 zonal, EGM2008 até o grau { "20" } e { "70" }, arrasto) concorda com o Orekit { "12.2" } (CS GROUP, Apache-2.0) e o Hipparchus { "3.1" }, propagada a partir do mesmo estado inicial nos mesmos referenciais com a mesma entrada de densidade, dentro de { "4.55" } mm ao longo de { "6" } h (limiar de { "0.02" } m fixado antes da execução, pré-registro 65e4d46c). Fora da afirmação: os polinômios de correção, o ajuste do relógio e a troca do período de atualização, que mantêm verificações internas (uma verdade de dois corpos recuperada pelo conjunto de 16 parâmetros abaixo de { "1" } mm, e uma verificação cruzada interna em numpy das mensagens exportadas no GRACE-FO com seu relógio CLK1B, que foi escrita e executada por este projeto e não é uma referência independente)

# text
seg-8121e7db3db3 = Atualização da mensagem de navegação LEO no meio da passagem com verificação de continuidade na troca

# text
# c1: leo-navmsg
seg-34c310d85c42 = A análise midpass-update do tipo <c1/>: a passagem mais alta sobre um usuário dentro de um intervalo de busca, mensagens em um cronograma global com períodos de uso centrados em suas janelas de ajuste, e em cada troca o salto de posição 3D, o salto de relógio, o salto de pseudodistância do usuário, o maior salto em qualquer linha de visada visível (forma fechada sobre o cone de nadir), o erro de distância antes e depois, e PASS/FAIL contra um limiar

# text
seg-418f2cd21141 = Consistência interna (a identidade do salto e o limite do cone contra amostragem por força bruta). O limiar é uma entrada; nenhum requisito publicado de continuidade LEO é fixado

# text
seg-7635a8339e78 = Codificação binária documentada da mensagem de navegação LEO com um orçamento de erro de quantização

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: o quadro próprio do Kshana (preâmbulo, versão, modelo, comprimento, carga útil, CRC-24Q) para os quatro modelos de efemérides, o polinômio de relógio, SVID, issue of data, banda, saúde, um conjunto de Klobuchar, coeficientes NeQuick-G e parâmetros UTC, cada campo com largura e passo declarados (field_table), quantização com recusa fora da faixa e um orçamento da maior variação de posição e de relógio que uma variação de meio passo de cada campo produz ao longo da janela de validade

# text
seg-4261a9fac5d9 = Identidades de ida e volta e o próprio orçamento. O formato é próprio do Kshana, modelado sobre os componentes de mensagem publicados e o conjunto de campos do ICD do Galileo; não é o leiaute de bits do Celeste nem de nenhum outro sistema (nenhum é público), de modo que não há leiaute externo contra o qual validar

# text
seg-17ca41d7fd71 = Exportações no estilo RINEX 4 e em CSV de mensagens de navegação LEO

# text
seg-185e12ccef0d = leo_navmsg::text: um bloco no estilo RINEX 4 (cabeçalho de registro > EPH, linha de satélite e época com três termos de relógio, linhas de órbita de transmissão D19.12) com letra de sistema L e tipos de registro KP16, KRAC, LU22 e APOL, rotulado em todo cabeçalho como uma extensão do Kshana que não faz parte do RINEX { "4.02" }, e uma tabela CSV com um esquema de colunas padrão e esquemas predefinidos, cada um com um importador

# text
seg-5cc5b6382437 = Idas e voltas e a aritmética de calendário. O RINEX { "4.02" } não define registros de navegação LEO (IGS RINEX { "4.02" }), de modo que o leiaute é uma extensão documentada, com arXiv { "2401.17767" } citado como estado da técnica; não existe leitor externo dele para verificar

# text
seg-ff15935ba1b3 = Modelo de efemérides LEO de 22 parâmetros de Liu et al. { "2025" } e seu ajuste em órbitas precisas reais

# text
seg-6af1b6f3bbd4 = a variante Liu22 de leo_navmsg::elements::EphemerisModel, avaliada por kepler_point com Liu22Extra: o conjunto de 16 parâmetros mais uma taxa de semieixo maior a_dot, uma taxa de movimento médio n_dot entrando como n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transcrita da Eq. { "1" } do artigo (a comparação de ajuste não depende dessa convenção de escala, de modo que o significado de um valor transmitido de nDot não é validado aqui), e harmônicos de raio de uma e de três por revolução Crs1, Crc1, Crs3, Crc3 sobre o argumento de latitude não corrigido. Seu ajuste por leo_navmsg::fit::fit_message adota a partida e o estimador da Seção { "2.3" } do artigo (toda correção começa em zero; mínimos quadrados simples sem priors; o limite de 100 iterações do artigo), mas para pela regra de convergência de parâmetros do Kshana (todo passo abaixo de { "1e-3" } de seu sigma formal) em vez da regra do artigo de uma variação de RMS abaixo de { "0.1" } mm. Ajustado sobre arcos de { "20" } e { "30" } minutos de uma órbita precisa tabulada

# text
seg-90768b99ab5f = Medido: as órbitas reduzido-dinâmicas operacionais do TU Graz IfG/ITSG (de uso livre com reconhecimento; valores SHA-256 no NOTICE da fixture) de GRACE-A, GRACE-C, Sentinel-2A e Sentinel-6A são a verdade, ajustadas sobre arcos de { "20" } e { "30" } min, e comparadas com as linhas de 22 parâmetros (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) das Tabelas { "4" }, { "5" }, { "6" } e { "8" } de Liu, Su, Xie, Zhou e Qu ({ "2025" }), Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894 (CC BY { "4.0" }; números citados, não incorporados). Limiares fixados antes da primeira comparação: RMS ao longo da trajetória, transversal e radial, cada um dentro de 1.5x nos dois sentidos, e SISRE dentro de 1.5x, para cada satélite e ambos os comprimentos de arco. A reexecução da rodada 2 foi pré-registrada (aa559785) antes da mudança do motor e antes de as órbitas reservadas serem obtidas: o ajuste da Eq. { "1" } e da Seção { "2.3" } do artigo, mais dois novos dias reservados por satélite contra os mesmos valores impressos. Medido: toda razão dos dias do artigo de { "0.755" } a { "1.138" }, e toda razão dos dias reservados de { "0.683" } a { "1.186" }. Divulgado: as razões ao longo da trajetória de { "20" } min da primeira execução, { "1.71" } (Sentinel-2A) e { "1.86" } (Sentinel-6A), eram conhecidas antes da reexecução. As menores razões de SISRE dos dias reservados ficam perto do limite inferior de { "0.667" } porque o SISRE impresso no artigo usa os pesos da Tabela { "2" } sem elevar ao quadrado (ver a linha do ajustador de 16 parâmetros). O pré-registro declarou de forma errada a regra de parada do artigo (o artigo para com uma variação de RMS abaixo de { "0.1" } mm); a regra pré-registrada de convergência de parâmetros foi mantida. Mutação: restaurar priors centrados em zero dá, para o Sentinel-6A ao longo da trajetória em { "20" } min, { "1.08" } contra { "0.70" } cm ({ "1.54" }), o que reprova. Sondagem do revisor: a convenção anterior à 0.30 (um fator 1/2 sobre n_dot) deixa todo valor inalterado, de modo que a comparação restringe o espaço de funções do modelo de 22 parâmetros e a qualidade de seu ajuste, não a convenção de n_dot. Fora da afirmação: o polinômio ECEF ATOMIC e a tabela sintética de comparação de modelos de cinco altitudes, que têm sua própria linha MODELLED

# text
seg-e79047fc95af = Polinômio ECEF de relógio zero do ATOMIC e a comparação sintética de modelos LEO em cinco altitudes

# text
seg-e261843e35b1 = a variante EcefPoly de leo_navmsg::elements::EphemerisModel: um polinômio ECEF por eixo sem termos de relógio, o termo relativístico a partir de -2 r.v/c^{ "2" }, pontuado contra um relógio corrigido. Também a análise de comparação de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta o modelo de 22 parâmetros às cinco altitudes do artigo sobre arcos de 20 minutos de uma órbita integrada pelo Kshana e imprime o resultado ao lado do SISRE publicado

# text
seg-a3b92fdcc591 = Fatos do modelo ATOMIC a partir da InsideGNSS (polinômio de 6ª ordem, cerca de um minuto de validade, atualização a cada { "30" } s, relógio corrigido, erro de relógio de { "24" } cm). São fatos descritivos, sem números publicados com que comparar. A tabela de cinco altitudes imprime o SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } e { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } e { "1336" } km sobre um arco de 20 minutos) ao lado do ajuste do Kshana sobre sua própria órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } e { "0.51" } cm; razões de { "0.46" } a { "0.77" }), não fixado, porque o artigo ajustou órbitas precisas reais e as verdades diferem. O modelo de 22 parâmetros e seu ajuste são, eles próprios, validados contra órbitas reais na linha Modelo de efemérides LEO de 22 parâmetros de Liu et al. { "2025" } e seu ajuste em órbitas precisas reais. { "0.30" } revisão: os valores da tabela mudaram com o ajuste na convenção do artigo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Serviços ionosféricos de frequência única e de UTC de uma mensagem de navegação LEO

# text
seg-bc73bfeca68e = leo_navmsg::services: o atraso de transmissão de Klobuchar em qualquer portadora (o modelo L1 do motor escalonado por (f_L1/f)^{ "2" }), o nível efetivo de ionização do NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } com as regras de tudo zero e de [{ "0" }, { "400" }] sfu, e o tempo do sistema para UTC com os três casos de segundo intercalar do ICD

# text
seg-84500ea94d49 = GNSSTk { "15.3.1" } (ARL:UT, LGPL-3.0, commit 55ea3344, executado como um programa separado por meio de um arcabouço; nenhum código do GNSSTk é incorporado): getIonoCorr de KlobucharIonoNavData em L1, L2 e L5, getEffIonoLevel de NeQuickIonoNavData para Az com as regras de tudo zero e de [{ "0" }, { "400" }] sfu, e getOffset de GPSLNavTimeOffset para a deriva do UTC, dentro de { "1e-3" } m, { "1e-6" } sfu e { "1e-9" } s; e o ERFA por meio do pyerfa { "2.0.1.5" } (BSD-3), que deriva o UTC da tabela de segundos intercalares do IERS, para os três casos de segundo intercalar do ICD nos segundos intercalares reais de 2015-06-30 e 2016-12-31, incluindo a leitura { "23" }:{ "59" }:{ "60" }, dentro de { "1e-9" } s (o GNSSTk não implementa a regra de duração do dia do caso (b) do ICD, de modo que não foi usado ali, como escrito no pré-registro). As entradas são os coeficientes reais do cabeçalho BRDC do IGS. Pré-registrado (6a66994b; a emenda 88807a7e versionou um subconjunto de { "21" } 602 linhas da grade de segundos intercalares antes de qualquer valor do Kshana ser comparado). A integração da densidade eletrônica do NeQuick não é implementada, e nenhuma correção é feita para um satélite LEO que voa dentro da ionosfera

# text
seg-0af8030f4d21 = Doppler que um receptor em solo deve tratar a partir de um satélite de navegação LEO

# text
# c1: leo-pvt
seg-9714103964d6 = Taxa de variação de distância exata de um satélite cuja posição e velocidade fixas à Terra vêm de uma órbita de dois corpos com a deriva secular de J2 e a rotação da Terra (leo_fusion::geom::EarthOrbit::state, com a velocidade sendo a derivada temporal exata da posição), convertida em Doppler em uma portadora; o maior Doppler absoluto, a taxa de Doppler e o jerk acima de uma máscara de elevação ao longo de uma janela (leo_fusion::doppler::doppler_envelope), informados por sistema LEO pelo tipo <c1/> no modo doppler

# text
seg-ebf6cee8ec4c = Valores publicados reproduzidos a partir da órbita e da portadora declaradas: Doppler do Iridium de até mais ou menos { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) e Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe and Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). O valor do Iridium é um limite superior arredondado, daí o limiar de { "5" } %. A taxa de Doppler e o jerk são informados, mas não validados: o jerk modelado de passagem sobre a vertical do Pulsar X1 é de cerca de { "1.0" } Hz/s^{ "2" } contra o publicado de { "1.26" }

# text
seg-d2e18c8bdc14 = Posicionamento a partir do Doppler de LEO, com um ou vários satélites, com estados de deriva de relógio e de velocidade

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamento por Gauss-Newton em lote a partir da taxa de variação de distância com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade constante do usuário como opção, uma pseudomedição de altura para um usuário em superfície, passos amortecidos; a covariância formal na verdade; projeções ao longo da trajetória, transversal e vertical; a exatidão de passagem única contra o deslocamento transversal do usuário; o instante de maior aproximação. O modo doppler do tipo <c1/> acrescenta o erro contra a duração da janela e um modo de sinais de oportunidade somente com Doppler (a predefinição starlink-sop)

# text
seg-84e2eb636579 = Consistência interna: recuperação sem ruído, a identidade cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivada numericamente, Doppler zero na maior aproximação, a solução espelho de uma única passagem e erros semeados contra a covariância formal. O valor do Starlink de Kozhaya, Saroufim e Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: cerca de { "2" } m em { "20" } s com três satélites) é apenas uma comparação: o receptor modelado, com efeméride perfeita e todo erro em um sigma de Doppler de { "30" } Hz, é várias vezes menos exato sobre a mesma janela, e o receptor e a taxa de medição do artigo não são reproduzidos

# text
seg-7f462969d2d4 = Posicionamento conjunto por pseudodistância de GNSS e LEO com vieses entre sistemas e modelos de erro por sinal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de receptor por sistema (o viés entre sistemas estimado junto com a posição) ou um deslocamento de transmissão conhecido na escala de tempo de referência; sigmas por medição fornecidos pelo chamador, por padrão o ruído térmico da malha de captura de atraso do motor (navsignal::dll_code_jitter_chips) no C/N0 da elevação combinado com o erro de distância de sinal no espaço; DOP não ponderado (GDOP, PDOP, HDOP, VDOP, TDOP) no referencial geodésico local, sigmas formais leste-norte-cima e os sigmas dos vieses; o modo joint do tipo <c1/> compara soluções só com GNSS, só com LEO e fundidas e varre o DOP contra o número de satélites LEO acrescentados

# text
seg-e83699418c0e = Um DOP de quatro satélites derivado à mão (um satélite no zênite e três no horizonte a { "120" } graus um do outro, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com seu próprio relógio e um satélite não acrescenta geometria, a recuperação sem ruído da posição, do relógio e do viés, e erros semeados contra a covariância. Apenas verificações internas; não comparado com a saída de um receptor. { "0.30" } comparação externa, uma constatação (permanece MODELLED): em um dia IGS multi-GNSS (ABMF 2018-05-13, GPS e Galileo C1C, efeméride de transmissão, Klobuchar) o viés entre sistemas concorda com o rnx2rtkp do RTKLIB v2.4.2-p13 (diferença mediana de -0.11 ns após a correção do atraso de grupo de transmissão da { "0.30" }, -0.35 ns antes; limiar { "1" } ns), mas apenas { "93.6" } % de { "280" } épocas ({ "93.2" } % antes da correção) estão dentro de { "3" } m da coordenada ITRF2020, contra os { "95" } % pré-registrados. O próprio RTKLIB alcança { "88.2" } % nos mesmos dados, de modo que o limiar está além do posicionamento de frequência única por transmissão nesta estação e neste dia, e não é uma discrepância do solucionador; o teste de comparação é versionado como ignorado. { "0.30" } rodada { "2" }, entradas mais rigorosas com o mesmo limiar inalterado de { "3" } m / { "95" } % / { "1" } ns, uma constatação (permanece MODELLED): com o par livre de ionosfera Galileo E1/E5a (pré-registrado { "6927e039" }), { "79.9" } % das épocas estão dentro de { "3" } m (RTKLIB { "67.9" } %); com órbitas, relógios, deslocamentos de antena de satélite e vieses de código precisos do CODE MGEX (pré-registrado 7d8c3597), { "94.2" } % (RTKLIB { "94.1" } %), e o viés entre sistemas difere do RTKLIB em -1.03 ns porque o modo single do RTKLIB ignora os deslocamentos de antena de satélite (+{ "0.04" } ns quando ambos os omitem)

# text
seg-ee9a4a0cb530 = Convergência do posicionamento preciso por ponto apenas com GNSS e com aumento por LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Um filtro de Kalman estendido de PPP float sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de receptor branco, um viés entre sistemas por sistema extra, um atraso zenital úmido em passeio aleatório mapeado por 1/sin(elevação), uma ambiguidade float por arco de satélite acrescentada no nascer e descartada no ocaso, e o erro de órbita e relógio precisos comum ao código e à fase de um satélite, processado como uma única atualização correlacionada de duas linhas em forma estabilizada de Joseph; medições simuladas a partir do mesmo modelo; tempo de convergência (erros abaixo dos limiares até o fim da execução), curvas de erro e o NEES de posição médio da execução para apenas GNSS e cada caso LEO, executado como o tipo <c1/>

# text
seg-be4593802ccf = O teste qui-quadrado do NEES é uma verificação de consistência interna (a verdade e o filtro compartilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS de { "9.6" } min encurtado para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário incluído dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com suas próprias camadas representativas de { "1000" } km e { "60" } graus, ruído e estações; as constelações, o ruído e a definição de convergência do artigo não são reproduzidos, de modo que isto é uma consistência MODELLED da tendência (encurtamento monótono, a maior constelação com menos de um terço do tempo só com GNSS), não uma validação

# text
seg-8ef013b46d0f = Exatidão de posicionamento de rede não terrestre 5G a partir da largura de banda do sinal

# text
# c1: ntn-positioning
seg-12b1e4657370 = O limite de Cramér-Rao do tempo de chegada a partir da largura de banda quadrática média (Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espectro OFDM plano (beta = B/sqrt({ "12" })), um espectro BPSK limitado em banda (numerador em forma fechada) ou qualquer espectro por quadratura, e da frequência de um tom complexo, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); soluções por tempo de chegada no enlace de descida com relógio de receptor desconhecido e uma solução Doppler de satélite único ao longo de uma passagem na banda S MSS n256 do 3GPP, executadas como o tipo <c1/>

# text
seg-f63e1d78cfff = Valores resolvidos publicados (P1): Bachl, Lei e Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), limites de SSB único do NR NTN reproduzidos a partir do mapa de SSB da 3GPP TS { "38.211" } por meio das próprias funções numéricas do Kshana (W_rms { "1.9616" } contra { "1.96" } MHz, sigma_t { "38.755" } contra { "39" } us, sigma_f 100.79/87.28 contra 101/87 Hz, sigma_rho 0.5970/0.5831 contra 0.60/0.58 m, cada um dentro de meia unidade do último dígito impresso); larguras de banda RMS do BPSK-R da Tabela { "1" } de Betz { "2001" } (1.128/3.477 contra 1.1/3.5 MHz, suplementar); as covariâncias das soluções por tempo de chegada e por Doppler concordam com numpy.linalg.inv do numpy { "2.4.6" } sobre a geometria exportada (P2; { "5e-15" } e { "1.2e-5" } relativo, limiares { "1e-5" } e { "1e-3" }). Pré-registrado (9f2875db; parte C 0d66dccd). A solução do motor joint_pvt::formal_sigma_enu (o limite avaliado na posição verdadeira, não na solução ruidosa) foi escrita depois que a primeira execução de { "200" } kHz falhou em { "6.5e-5" } e foi reexecutada com a tolerância inalterada. As formas de espectro plano e de tom complexo que o cenário executa (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz) chegam à verificação P1 por meio de testes unitários de identidade dentro do crate. Limites em um canal sem multipercurso, não a exatidão alcançada. { "0.30" } revisão: ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m (NR { "5" } MHz) e { "25.938613" } -> { "25.938839" } m (NB { "200" } kHz)

# text
seg-9306f1c06081 = Transferência de tempo para UTC assistida por LEO contra o C/N0 e o oscilador do receptor

# text
# c1: leo-pvt
seg-c618feb01476 = Medições de relógio de todo satélite LEO em visada em uma posição conhecida, combinadas por variância inversa a partir do modelo de ruído de pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o ruído de frequência branco e de passeio aleatório da classe do oscilador (slot_timing::ClockNoise, clock_state::ClockClass; a variância de deriva de holdover::coast_phase_variance), um relógio de verdade semeado a partir dos mesmos níveis, e a expressão de tempo do sistema para UTC da seção { "20.3.3.5.2.4" } do IS-GPS-200 com uma incerteza do deslocamento de transmissão acrescentada como viés por execução; o modo timing do tipo <c1/> varre osciladores e deslocamentos de C/N0

# text
seg-4a878bd4a90f = Consistência interna: a expressão de deslocamento publicada avaliada à mão, o erro normalizado sobre { "40" } sementes e o piso definido pela incerteza do deslocamento. O valor do NIST para receptores de temporização Iridium com relógio atômico em miniatura (menos de { "40" } ns do UTC(NIST) ao longo de { "40" } dias) é apenas uma comparação; o cenário Iridium incluído dá { "10" } a { "11" } ns de RMS em potência nominal com seu erro de distância representativo de { "5" } m. O ruído de frequência flicker e o atraso ionosférico não são simulados

# text
seg-cef79d82f0d4 = Cobertura LEO e diluição de precisão para usuários polares e árticos contra o GNSS MEO

# text
# c1: leo-pvt
seg-462a5e95d480 = Satélites em visada e PDOP, HDOP e VDOP medianos com disponibilidade contra a latitude, sobre longitudes e épocas amostradas, para os sistemas GNSS MEO sozinhos, os sistemas LEO sozinhos e todos eles, cada sistema com sua própria máscara e seu próprio modelo de relógio, executado como o modo polar do tipo <c1/>; as órbitas são conjuntos de elementos SGP4/SDP4 na época da varredura (2026-01-01T00:{ "00" }:{ "00" } UTC no modo polar) levados ao referencial fixo à Terra pelo caminho validado de órbita da Terra (IAU 2006/2000A, UT1 = UTC, sem movimento polar)

# text
seg-a16896913438 = Orekit { "13.1.8" } (Apache-2.0) com Hipparchus { "4.0.3" }: os estados GCRS do motor rotacionados para o ITRF pelo Orekit (IERS { "2010" }), visibilidade TopocentricFrame do WGS-84 contra a máscara de cada sistema, org.orekit.gnss.DOPComputer para uma incógnita de relógio e numpy.linalg.inv do NumPy { "2.4.6" } (P2) para várias; com o caminho verificado contra python-sgp4 e ERFA (linha 'One Earth-orbit path'). Limiares fixados antes da execução (pré-registrado 72ea9eb0; T2 e T3 são os limiares da rodada 2 da { "0.30" }). O passo TEME -> GCRS congelado em J2000 deixa o teste vermelho ({ "4739" } falhas). Apenas geometria; sem cintilação, terreno ou potência de sinal. O VDOP do GNSS sobe em direção ao polo ({ "1.20" } no equador a { "1.51" } a { "89.9" } graus para GPS e Galileo no cenário incluído), enquanto uma camada LEO quase polar converge ali. Histórico: a rodada { "2" } (3254d456) concordou em estados tabulados de dois corpos; a afirmação completa da rodada 1 do D8 contra a própria propagação de TLE do Orekit (e947e69d) foi uma constatação, o SDP4 do Orekit com e = { "0" } e seu TEME do IERS { "1996" }, fixada

# text
seg-d92777401093 = Sistemas LEO PNT nomeados como predefinições de dados opcionais, cada um com sua fonte

# text
seg-5130bfe2410c = Entradas agnósticas quanto ao sistema: cada sistema é composto de camadas Walker, elementos explícitos ou uma predefinição GNSS, um sinal (portadora, taxa de chip, largura de banda, potência recebida ou faixa de C/N0), um SISRE, um sigma de Doppler e um modelo de relógio; as predefinições preenchem apenas o que um cenário deixa de fora, um arquivo cada uma, com fontes marcadas PUBLIC (com uma URL), WORKSHOP ou DERIVED e os valores não publicados listados como representativos: Xona Pulsar X1/X5, Iridium STL, sinais de oportunidade do Starlink, CentiSpace, um sistema representativo em banda C, o modelo de efemérides de relógio zero do ATOMIC e uma predefinição derivada de workshop no arquivo opcional de predefinição Celeste IOD, retida ao se excluir esse arquivo e seus cenários

# text
seg-c6f71b3937cd = Transcrição dos valores públicos citados, verificada quanto à estrutura (toda fonte pública tem uma URL, os padrões Walker se dividem exatamente, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não contra uma referência independente externa. Os valores representativos são nomeados em cada predefinição e são ilustrativos

# text
seg-dec52b5b9cd6 = Um sistema LEO-PNT de ponta a ponta: projeto de sinal, orçamento de enlace da passagem, mensagem de navegação e posicionamento fundido, com a saída de cada etapa repassada à seguinte

# text
# c1: leo-pnt-chain
seg-39443b31d418 = O tipo <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chip e a divisão de EIRP de uma banda leo-pass; a passagem fornece o C/N0 do componente rastreado e o jitter de código limitado em banda por época; uma reta de C/N0 por mínimos quadrados em sin(elevação), o SISRE da mensagem leo-navmsg (ajustado na órbita do satélite da passagem, mais um termo declarado de determinação de órbita em raiz da soma dos quadrados) e a portadora e a taxa de chip do projeto vão para todo sistema LEO de uma solução conjunta leo-pvt e, opcionalmente, para os casos LEO de leo-ppp; cada repasse é informado com seu valor e unidade

# text
seg-854d3c1428d0 = Autoconsistência dos repasses: cada valor repassado é igual à saída da própria etapa a montante, e mutar uma entrada a montante move todo valor a jusante que dela depende. As etapas mantêm seus próprios rótulos; a cadeia não acrescenta física nem referência independente externa

# text
seg-55ca63edff02 = Detecção de spoofing por consistência de Doppler de LEO e da geometria da passagem

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = A seção <c2/> do tipo <c1/>: um spoofer falsifica, de forma autoconsistente em distância e em taxa de variação de distância, os sinais vistos em uma posição alegada que salta e/ou é empurrada para longe da verdadeira após um início (por banda LEO e para o sinal GNSS MEO); o receptor prevê toda taxa de variação de distância a partir da órbita de transmissão e de uma posição e velocidade prévias independentes, e testa as taxas de variação de distância medidas com uma estatística qui-quadrado de mínimos quadrados generalizados sobre uma janela de épocas (a deriva do relógio como incômoda ou com um prior), nos canais GNSS, nos canais LEO e em todos os canais, com ruído térmico da malha de captura de frequência a partir do C/N0 (Kaplan & Hegarty { "2006" }, seção { "5.6.2" }); probabilidade de detecção pela lei qui-quadrado não central a uma probabilidade declarada de falso alarme, com a detecção declarada a uma probabilidade declarada de perda de detecção

# text
seg-787c07c08c7f = Formas fechadas e identidades, não uma medição externa: o gradiente da taxa de variação de distância contra uma diferença central, a estatística em forma de informação contra a forma de covariância densa, uma deriva de relógio pura dando zero, um empurrão explicado pelo prior dando no máximo |dx|^2/sigma_p^{ "2" }, a estatística quadrática em um salto. Nenhum valor de detecção é comparado com um ataque medido; o spoofer é idealizado (sem assinatura de potência, de ângulo de chegada ou de pico de correlação)

# text
seg-5f341f85ac07 = Detecção de spoofing por consistência entre bandas de um sinal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO e par de bandas de telemetria, a seção <c1/> forma a combinação de pseudodistâncias livre de geometria, remove o modelo ionosférico do receptor e testa seu salto de época a época contra o ruído de código das duas bandas e uma taxa ionosférica não modelada tolerada declarada (gaussiana bilateral, probabilidade de detecção exata); um spoofer que falsifica algumas bandas e outras não, ou todas as bandas sem a ionosfera, é visto no seu início; um que falsifica todas as bandas e simula a ionosfera não é, o que o resultado declara

# text
seg-87fd44fa1d94 = Identidades: o salto de início de um spoofer livre de ionosfera é igual à diferença de atraso ionosférico modelado do par, o limiar é o quantil normal bilateral vezes o desvio padrão do salto mais o limite da taxa. O modelo ionosférico do receptor é o do motor, de modo que o resíduo autêntico é zero na média por construção; nenhuma referência independente externa

# text
seg-97dbcd5f2728 = Sondagem da ionosfera: TEC inclinado a partir do atraso em duas bandas de uma passagem LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de um satélite <c1/>, o relatório fornece o conteúdo total de elétrons inclinado que a combinação de código livre de geometria recupera no pico da passagem, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), e seu 1-sigma a partir do ruído térmico de código das duas bandas, de modo que qualquer projeto LEO-PNT multibanda possa ser avaliado como sondador ionosférico

# text
seg-2562ae9e6180 = A identidade de dispersão de primeira ordem, exata por construção contra o próprio atraso de primeira ordem do motor (cujo escalonamento 1/f^{ "2" } é VALIDATED contra o IS-GPS-200 em sua própria linha); a precisão é apenas o ruído térmico de código, sem multipercurso nem vieses entre frequências. { "0.30" } rodada { "2" }, medida (pré-registrada 5e795f93), uma constatação (permanece MODELLED): o mapa global da ionosfera do CODE CODG1330.18I contra o código C1C/C2W do ABMF com os vieses do CODE dá { "33" } de { "36" } médias de arco dentro de { "3" } TECU (pior +{ "6.84" } TECU em um arco vespertino; RMS por época { "3.95" } TECU), contra um limiar de todo arco; não validado

# text
seg-0a63a69e181d = Covariância do datum do referencial lunar com as estações estimadas, contra precisão estendida de 50 dígitos

# text
seg-de2ee45f6527 = A covariância do datum de Helmert de sete parâmetros do cenário lunar-frame-campaign com as estações da Terra estimadas (estação { "1" } ancorada), como lunar_frame_campaign a calcula em binary64: a informação de Fisher conjunta de estações e balizas acumulada a partir do jacobiano de atraso, o bloco das estações marginalizado por um complemento de Schur por meio de uma inversa espectral de Jacobi, H = AᵀSA formado com o projeto de Helmert e invertido espectralmente. O problema é mal condicionado por construção (número de condição de Helmert de { "2.1e8" } a { "2.3e8" }, número de condição da informação conjunta de { "1.6e12" } a { "3.0e13" }): uma variação relativa de { "1e-9" } na correção de Schur move os sigmas do datum em até { "28" } %. Informados: os sete sigmas do datum, o número de condição de Helmert e a direção mais fraca. AFIRMAÇÃO, DELIMITADA: os sigmas do datum e o número de condição do motor estão dentro do limite de erro de pior caso a priori de um pipeline estável em retrocesso de precisão dupla neste problema; isto não afirma que sejam tão exatos quanto a precisão dupla permite (uma rota por fatoração é cerca de mil vezes mais exata sobre as mesmas entradas, e o solucionador de raiz quadrada opcional cerca de dez milhões de vezes), e a direção mais fraca é validada apenas onde seu limiar está abaixo de um ângulo reto (o controle com estações fixas)

# text
seg-1aab389815b3 = mpmath { "1.3.0" } (BSD-3-Clause) com { "50" } dígitos significativos, autoverificado com { "80" } (concordância de { "1.1e-38" } ou melhor), sobre o jacobiano, os pesos e o projeto de Helmert versionados do motor: a própria solução LU do mpmath para o complemento de Schur, sua inversa para H e sua decomposição em autovalores de Jacobi (P2, uma biblioteca numérica independente). Pré-registrado 804662d5 antes de a fixture existir, com limiares a partir de uma fórmula de erro retroativo de primeira ordem: constante (3n+{ "1" })n + m vezes o erro de arredondamento unitário (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "10.4" }, a forma Tier B), vezes a sensibilidade exata de primeira ordem de cada grandeza à informação conjunta, ao complemento de Schur e a H. Medido: sigmas do datum dentro de { "4.8e-6" } em 2026-03-18 (limiares { "9.6e-2" } a { "2.2e-1" }), { "9.7e-6" } em 2024-01-01 (limiares { "2.8e-2" } a { "6.9e-2" }) e { "2.0e-14" } com as estações fixas (limiares { "1.0e-11" } a { "2.8e-7" }); número de condição dentro de { "4.6e-6" }, { "1.3e-5" } e { "4.1e-14" }. Nos cenários com estações estimadas, os limiares são de pior caso e quatro ordens de grandeza acima do erro medido, e o limiar da direção mais fraca ali excede um ângulo reto, de modo que essa verificação não é contada; no controle com estações fixas, a direção mais fraca concorda a { "6.6e-16" } rad contra um limiar de { "9.4e-11" }, medida pela corda entre vetores unitários (um comparador acos anterior não conseguia resolver ângulos abaixo de { "1.5e-8" } rad; o limiar permanece inalterado). Diagnóstico: as rotas de Cholesky e QR do NumPy { "2.3.5" } chegam a { "9e-9" } e { "5e-9" } nas entradas de 2024-01-01, suas rotas de inversa e de autovalores a { "2.9e-6" } e { "6.2e-6" }: o motor está dentro de seu limite, mas cerca de mil vezes menos exato que uma rota por fatoração. Valida a álgebra linear nas entradas versionadas, não o jacobiano (a etapa SPICE da linha da campanha o faz) e não a exatidão física da campanha ilustrativa

# text
seg-71b463388e80 = Solucionador de datum por informação em raiz quadrada contra precisão estendida de 50 dígitos

# text
seg-5ec3e3c2bf19 = Um solucionador opcional de informação em raiz quadrada (lunar-frame-campaign solver = "srif"; padrão inalterado) que nunca forma nem inverte uma matriz de informação para o datum: QR de Householder (decomposição ortogonal-triangular) do jacobiano de atraso branqueado como uma atualização de medição de filtro de informação em raiz quadrada, as estações da Terra marginalizadas pelo bloco triangular final (cujo produto de Gram é o complemento de Schur), uma segunda QR de R_bb A para o datum de Helmert de sete parâmetros, sigmas como as normas das linhas da inversa triangular, e o espectro (número de condição, direção mais fraca) a partir de uma decomposição em valores singulares de Jacobi unilateral. Os produtos internos são compensados com um produto livre de erro por divisão de Dekker, de modo que toda operação é uma operação básica IEEE-754 ou uma raiz quadrada corretamente arredondada; resultados idênticos em toda plataforma são argumentados a partir disso, não testados entre plataformas

# text
seg-271cba640489 = mpmath { "1.3.0" } (BSD-3-Clause) com { "50" } dígitos significativos, autoverificado com { "80" } (concordância de { "1.4e-43" } ou melhor), sobre o jacobiano, os pesos e o projeto de Helmert versionados do motor (P2, uma biblioteca numérica independente: a própria solução LU, inversa, Cholesky e decomposição em autovalores de Jacobi do mpmath). Pré-registrado b41908c9 antes de o solucionador ser escrito, com limiares a partir de um limite de erro retroativo de primeira ordem em forma de raiz quadrada: QR de Householder constante mn mais (3n+{ "1" })n vezes o erro de arredondamento unitário (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "19.4" } e Capítulo { "8" }) vezes sensibilidades exatas. Medido: sigmas do datum dentro de { "3.0e-13" } em 2026-06-09 (limiares { "4.1e-7" } a { "5.3e-7" }), { "1.9e-15" } com as estações fixas (limiares de até { "4.8e-12" }), { "3.8e-13" } em 2026-03-18 e { "2.3e-13" } em 2024-01-01, em que o solucionador espectral padrão erra por { "4.8e-6" } e { "9.7e-6" }; número de condição dentro de { "4.9e-13" }; direção mais fraca dentro de { "1.4e-13" } rad (controle { "1.7e-16" } contra { "5.1e-10" }). LIMITE DA VERIFICAÇÃO: os limiares só estabelecem erros do datum abaixo de cerca de { "2e-7" } relativo; os valores medidos de { "1e-13" } são observações, não o que os limiares estabelecem. A verificação rejeita o solucionador espectral padrão (sigmas { "9.7e-6" } contra { "2.9e-7" } em 2024-01-01; na data limitante { "1.3e-6" } contra { "4.9e-7" }, uma margem de { "1.3" } a { "2.6" }) e uma inversa triangular mal tomada (normas de coluna: vermelho), mas um sinal de Householder invertido, um produto escalar não compensado e sigmas de uma inversa espectral de H formada a partir do fator de raiz quadrada ({ "3.7e-9" }) passam todos, de modo que ela não mostra que cada passo de raiz quadrada é necessário. Valida a álgebra linear do solucionador opcional em entradas versionadas, não o jacobiano nem o solucionador padrão; a reprodutibilidade bit a bit entre plataformas é argumentada a partir das operações usadas e testada apenas como identidade de reexecução em uma plataforma

# text
seg-433b52bf0ba2 = Monitores de confiança marítimos: a aritmética em que se apoiam (decodificação NMEA, deslocamentos geodésicos, as estatísticas cinemáticas e de resíduo de sensores)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Para uma embarcação, <c1/> decodifica as sentenças NMEA { "0183" } que um receptor e seus instrumentos emitem (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), forma o deslocamento leste-norte entre soluções (<c2/>) e, a partir deles, as estatísticas sobre as quais seus monitores decidem: a velocidade implícita, o resíduo de navegação estimada, a aceleração implícita e a taxa de giro implícita em janelas de { "30" } s, os resíduos de rumo contra curso, de odômetro contra velocidade sobre o fundo e de altitude da antena (medianas de { "10" } s), e a dispersão e a elevação da relação sinal-ruído dos satélites.

# text
seg-32fcf6956dac = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: ({ "1" }) a decodificação de todo campo que os monitores leem, contra o pynmea2 { "1.19.0" } (MIT) em { "8" } registros sintéticos ({ "1,086" } épocas), até { "1e-9" } na unidade do campo (latitude e longitude, altitude, separação do geoide, HDOP, velocidades, curso, rumo, relação sinal-ruído; inteiros e datas exatamente; hora do dia até { "1e-6" } s), com as maiores diferenças no nível do último dígito de um double; ({ "2" }) o deslocamento leste-norte entre duas soluções, como distância e azimute, contra a geodésica WGS84 do geographiclib { "2.1" } (MIT) em { "223" } pares de soluções com linhas de base de até { "2" } km, de -45 a { "70" } graus de latitude e através do antimeridiano, até { "0.01" } m e { "0.001" } graus (o azimute contra o azimute médio da geodésica, a direção da corda); ({ "3" }) as estatísticas de entrada dos monitores em { "341" } épocas pontuadas de uma viagem sintética de { "400" } s com uma curva e um degrau de posição, contra recálculos em Python que usam o geographiclib para distância e azimute, o pynmea2 para decodificação e o numpy para medianas e desvios padrão: velocidade implícita até { "0.005" } m/s, resíduo de navegação estimada até { "0.02" } m, aceleração até { "5e-4" } m/s^{ "2" }, taxa de giro até { "1e-3" } graus/s, as medianas dos resíduos e a dispersão e a elevação da relação sinal-ruído até { "1e-6" }. O QUE NÃO É: os comprimentos de janela, as tolerâncias e os limiares dos monitores são regras próprias deste projeto; o Python as reproduz a partir da mesma documentação, de modo que a concordância corrobora a implementação da aritmética, não as regras. A sentença THS não tem classe no pynmea2 e a sentença ROT não é lida; nenhuma das duas é coberta. A tabela de um emissor NMEA e número de satélite para um identificador de satélite no estilo RINEX é própria deste projeto (apenas o número, o emissor e o valor são comparados). As entradas de passo de tempo, relógio do hospedeiro e estado de autenticação não têm referência independente. Todos os dados são texto sintético de receiver_trust::synth; nada aqui é uma medição e nenhuma afirmação é feita sobre o desempenho de qualquer monitor diante de interferência real. Azimute: comparado com o azimute médio da geodésica. A comparação pré-registrada com o azimute direto na solução { "1" } falhou em { "0.001" } graus ({ "77" } de { "223" } pares, pior caso { "8.3e-3" } graus) por uma divergência de definição, não de aritmética; a emenda foi feita depois da primeira execução e ambos os resultados estão registrados (a comparação com o azimute direto permanece no teste como um limite descritivo, não pré-registrado, de { "0.01" } graus). Divulgado: as primeiras execuções encontraram entradas que exercitavam pouco (aceleração e taxa de giro eram limitadas a zero em toda época, e a trajetória do antimeridiano nunca o cruzava), um defeito no gerador sintético (sem quebra de longitude) e, para o azimute, que a grandeza de referência independente registrada (o azimute direto da geodésica na primeira solução) difere da direção da corda em cerca de metade da convergência dos meridianos ({ "77" } de { "223" } pares fora de { "0.001" } graus, pior caso { "8.3e-3" }); as entradas foram corrigidas e o azimute foi comparado com o azimute médio na mesma tolerância (emendas { "1" } a { "3" } do pré-registro, feitas depois de ver os resultados e portanto não cegas); as comparações de curso e rumo foram tornadas circulares ({ "360" } e { "0" } graus são um mesmo curso, emenda { "5" }). Mutação: um escalonamento de { "1e-4" } no deslocamento leste reprova a comparação de geodésia.

# text
seg-1fdbb476c8ab = Pontuação de confiança marítima: a agregação das evidências dos monitores em uma pontuação de 0-100 e suas três faixas

# text
seg-0d76b33144f1 = Cada monitor reduz sua evidência a uma razão entre a estatística e o limiar; a pontuação é { "100" } menos a soma, sobre os monitores, do peso vezes uma rampa linear limitada da razão ({ "0" } até { "0.5" }, { "1" } em { "1.5" }), limitada a { "0" } a { "100" } e arredondada a { "0.1" }, com faixas em { "90" } e { "55" }; cada época lista os monitores que deduziram e seus pontos.

# text
seg-b2d3c6d6ac36 = Implementação contra especificação, NÃO uma referência independente externa: uma reimplementação clean-room em Python (scripts/maritime_score_cleanroom.py), escrita por um leitor que recebeu apenas docs/RECEIVER-TRUST.md e docs/MARITIME-TRUST.md e não o código-fonte em Rust, concorda com score_from_ratios em { "600" } vetores de razões (pontuação, faixa, pontos e a ordem das deduções, diferença { "0" }), depois de a documentação ter sido completada onde o primeiro leitor a encontrou omissa ou inconsistente (ordem de empates, arredondamento, a razão de um monitor de passa-ou-falha, dois exemplos cujos números não correspondiam à fórmula). Isso mostra que a documentação é suficiente e que o código faz o que ela diz. O QUE NÃO É VERIFICADO, e por que a linha permanece MODELLED: a própria regra (os pesos, a rampa, os limites das faixas, a retenção de evidência) é própria deste projeto, pré-registrada mas sem fonte externa, e nada aqui mostra que uma pontuação de { "80" } ou { "40" } signifique o que um navegador gostaria que significasse diante de interferência real; nenhum valor desse tipo é dado. Os limiares dos monitores são igualmente próprios deste projeto (a Linha A verifica apenas sua aritmética).

# text
seg-f52fceaf06ca = Aderência à norma do fluxo de treinamento NMEA { "0183" } e valores decodificados

# text
seg-684f86418933 = Fluxos NMEA { "0183" } sintéticos de ponte de comando para treinamento de tripulação (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW e o marcador PKSHT, gerados a partir de uma trajetória verdadeira com efeitos modelados de receptor, céu, jamming e spoofing. Apenas saída de texto; nada é transmitido.

# text
seg-4591ed75149c = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: todas as { "225,227" } sentenças de oito fluxos sintéticos de treinamento (quatro cenários da biblioteca, sementes { "1" } e { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW e o marcador PKSHT) são analisadas no pynmea2 { "1.19.0" }, um analisador NMEA independente, com checksum válido e o emissor e o tipo esperados. A posição, a velocidade sobre o fundo, o curso sobre o fundo, o rumo, a hora e a data UTC, o estado da solução e a contagem de satélites do GGA que ele decodifica são iguais à trajetória verdadeira do gerador dentro de tolerâncias fixadas antes da primeira comparação ({ "1.5e-6" } graus, { "0.06" } nós, { "0.07" } km/h, { "0.11" } graus de curso, { "0.5" } graus de rumo, { "0.02" } s), executadas por scripts/gen_nmea_training_ref.py com a fixture em tests/fixtures/nmea_training_ref/. A expectativa da contagem de satélites do GGA foi corrigida após a primeira execução para a convenção NMEA ({ "00" } sem solução); as tolerâncias numéricas permanecem inalteradas em relação ao commit de pré-registro. O QUE NÃO É: que qualquer receptor, plotter de carta ou sistema de ponte aceite os fluxos; o realismo dos modelos de receptor, céu, jamming ou spoofing (céu nominal, ruído modelado, perfis de arrasto e de repetição, todos MODELLED); HDOP, altitude e o conteúdo de DOP e de GSA/GSV além da sintaxe e das contagens; o registro do instrutor. Nada é transmitido, e nenhum desempenho anti-jam ou anti-spoof é afirmado.

# text
seg-1be1cfcb95c8 = Mapa de interferência: significados dos códigos de exatidão, valores de não disponível do AIS, atribuição de células de grade, comprimento de rota por estado de célula e mascaramento de terra firme

# text
seg-71cff2a675e8 = A leitura dos códigos de exatidão e integridade de navegação do ADS-B que o mapa usa (o limite de EPU que um código NACp representa, o limite de raio de contenção que um código NIC representa, e as classes baixa e boa que o método deriva deles); os valores de posição e velocidade não disponíveis do AIS que o leitor de AIS descarta; a célula fixa de grade de latitude/longitude em que uma posição cai; o comprimento da rota, e sua divisão por estado de célula (degradada, não degradada, não avaliada, não observada), que a exposição de rota informa; e se uma posição está em terra firme, no interior de um polígono de terra, por mais que um buffer. Uma célula marcada como degradada ou anômala é uma afirmação sobre campos de exatidão informados ou posições implausíveis, não uma constatação de interferência, e nada aqui verifica isso.

# text
seg-beee15333c89 = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: cinco implementações independentes leem as mesmas entradas sintéticas. ({ "1" }) o pyModeS { "2.21" } decodifica quadros DF17 sintéticos de estado operacional e de posição em voo; os limites de EPU do NACp do Kshana concordam até { "0.5" } m (maior diferença { "0.4" } m), seus limites de contenção do NIC para os códigos { "5" } a { "11" } concordam até { "1" } m, e suas classes baixa e boa colocam todos os { "12" } códigos NACp e todo código NIC que a referência independente produz ({ "0" } a { "11" }) do mesmo lado dos limiares que os limites da referência independente implicam ({ "0" } discordâncias). ({ "2" }) o pyais { "3.3.0" } decodifica sentenças AIVDM do tipo { "1" } cujos bits de carga útil o script empacota a partir dos valores brutos dos campos da ITU-R M.1371; o Kshana recusa exatamente as posições não disponíveis decodificadas (latitude { "91" }, longitude { "181" }) e a velocidade ({ "102.3" } nós), e mantém { "0" } a { "102.2" } nós como decodificados ({ "0" } discordâncias em { "94" } quadros). ({ "3" }) o covers() do shapely { "2.2.0" } em polígonos de células concorda com grid::Grid::cell_of em { "1770" } pontos com tamanhos de célula de { "0.5" }, { "0.25" }, { "1" } e { "0.07" } graus, incluindo pontos perto das bordas, ambos os polos e o antimeridiano ({ "0" } discordâncias). ({ "4" }) a interseção rota/célula do shapely { "2.2.0" } com comprimentos geodésicos WGS84 do GeographicLib { "2.1" } concorda com a exposição de rota em { "8" } rotas sintéticas, incluindo duas que cruzam o antimeridiano: comprimento total até { "0.6" } % (maior diferença { "0.49" } %, a esfera contra o elipsoide) e o comprimento de cada estado de célula até { "0.6" } % mais { "125" } m por trecho (maior { "21" } % dessa tolerância). ({ "5" }) o contains() do shapely { "2.2.0" } com distância azimutal equidistante do pyproj até a linha de costa concorda com a máscara de terra firme de { "2000" } m em { "992" } pontos de centro de reticulado em torno de quatro ilhas sintéticas, uma com um lago ({ "0" } discordâncias; { "4" } pontos a menos de { "20" } m do buffer foram excluídos e contados). As tolerâncias foram fixadas em tests/fixtures/interference_map_ref/PREREGISTRATION.md antes de qualquer comparação e não foram alteradas depois; dois defeitos nas entradas sintéticas encontrados pela primeira execução estão registrados ali. O QUE NÃO É: o Kshana não decodifica quadros Mode S brutos nem sentenças AIVDM, de modo que isto valida sua leitura de valores já decodificados, não um decodificador. Os raios de contenção do NIC da referência independente para os códigos { "1" }, { "2" } e { "4" } diferem do DO-260B ({ "20" }, { "8" } e { "2" } NM), de modo que apenas os códigos { "5" } a { "11" } são comparados numericamente. A regra da posição ({ "0" }, { "0" }), o piso de altitude, o filtro de tipo de fonte, o hash de identificadores, os limiares e as estatísticas do método e a escolha do tamanho de célula são próprios do Kshana e não são verificados contra nada. A comparação de rotas usa a mesma definição de trajetória reta em latitude e longitude dos dois lados, de modo que verifica comprimentos e atribuição de células, não que esta trajetória seja a correta para uma embarcação ou aeronave. Nada aqui mostra que uma célula marcada seja interferência. As entradas são sintéticas; as fixtures de referência independente são escritas por scripts/gen_interference_map_ref.py (o pyModeS é GPL-3.0 e é usado apenas nesse script offline; a CI não precisa de Python).

# text
seg-57ace69bdf1a = Formatos de transmissão da telemetria de confiança: exposição de texto do Prometheus e JSON OTLP/HTTP do OpenTelemetry

# text
seg-654126a9d073 = Confiança GNSS (pontuação, faixa, motivos, portão e, sob solicitação, posição) como exposição de texto do Prometheus servida em /metrics e como métricas em JSON OTLP/HTTP, com um limite na cardinalidade dos rótulos de motivo.

# text
seg-9cbde962155c = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: nossa exposição de texto do Prometheus para um fluxo sintético de 84 linhas (valores de rótulo com aspas, barras invertidas, quebras de linha e texto não ASCII, { "64" } séries de motivo mais uma dobra 'other', medidores de portão e de posição) é aceita pelo analisador de texto do prometheus_client { "0.26.0" }, e as famílias de métricas, os tipos, o texto de ajuda, os conjuntos de rótulos e os valores que ele lê são exatamente iguais ao estado do registro (valores por igualdade de f64). Nosso JSON OTLP/HTTP para o mesmo registro é analisado pelo json_format.Parse(ignore_unknown_fields=False) do protobuf { "7.36.2" } em ExportMetricsServiceRequest do opentelemetry-proto { "1.45.1" }, e todo nome de métrica, descrição, unidade, tipo, monotonicidade, temporalidade de agregação, atributo, valor, instante inicial e instante é exatamente igual ao estado do registro. Mostrou-se que ambos os analisadores rejeitam um campo desconhecido, um valor de tipo errado e uma linha malformada (scripts/gen_telemetry_formats_ref.py). Esquema { "1.3" } ({ "0.36" }), pré-registrado (fb226057) antes de qualquer ferramenta o ler: para um fluxo sintético de esquema 1.3 de 64 linhas (estados de geometria, DOPs, rótulos e perda de sinal presentes, nulos, ausentes e desconhecidos; classes de dedução; linhas não analisáveis) os mesmos dois analisadores leem as séries de geometria (kshana_trust_geometry* no Prometheus, kshana.geometry.* no OTLP) e o rótulo de classe em kshana_trust_reason_active exatamente como o registro implica ({ "24" } famílias e { "54" } amostras; { "12" } métricas e { "31" } pontos), o promtool { "3.5.0" } check metrics sai com { "0" } sem problema de lint, e o OpenTelemetry Collector contrib { "0.135.0" } aceita o JSON OTLP/HTTP (estado { "200" }, nada rejeitado) e seu exportador de arquivo registra a requisição inalterada (xval/telemetry-1.3, condicionado a dados: os tarballs de versão são obtidos com SHA-256 fixado e suas saídas versionadas). O QUE NÃO É: o endpoint HTTP, a entrega, os tempos limite e a reconexão não são verificados por uma referência independente, nem o receptor prometheus do Collector; o registro é lido por meio de acessores, de modo que uma falha no próprio estado do registro não seria detectada; a verificação OTLP de 'a saída versionada está atual' só é executada com o recurso otlp; os nomes das métricas e sua utilidade para um centro de operações não são validados; CEF e LEEF não são cobertos (ver a próxima linha).

# text
seg-b037c999443b = Eventos SIEM da telemetria de confiança: Common Event Format (CEF) sobre syslog

# text
seg-ffd8d7062055 = Eventos de mudança de faixa (ou por época) como cargas Common Event Format em um envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado e escape de CEF.

# text
seg-59fd23d6607e = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: contra dois analisadores de código aberto independentes (referências independentes: pycef { "1.11" } (PyPI, MIT); o codec CEF do Logstash (logstash-codec-cef { "6.2.7" } no Logstash { "8.15.3" })), em um corpus de linhas CEF que este crate escreveu ({ "157" } antes da emenda { "4" } abaixo, { "170" } depois dela, { "176" } depois da emenda { "5" }): toda mudança de faixa e toda época de um fluxo sintético de confiança versionado de 84 linhas, mais texto adversarial em hosts, motivos, rótulos de tempo e nomes de portão contendo sinais de igual, barras invertidas, barra invertida-igual, barras verticais, quebras de linha, retornos de carro, tabulações, sequências de espaços, caracteres multibyte e astrais e sósias de chaves, pontuações e deslocamentos extremos, toda faixa com e sem uma faixa anterior. O pycef analisa as linhas cujo cabeçalho não precisa de escape ({ "153" } antes da emenda { "4" }, { "166" } depois dela, { "172" } depois da emenda { "5" }) e recupera, exatamente, os campos do cabeçalho, a severidade, o conjunto exato de chaves da extensão e todo valor (números por igualdade de f64), após as regras de remoção de escape da especificação CEF, que o pycef não aplica e que scripts/gen_cef_ref.py aplica. O codec do Logstash, que remove o escape por conta própria, analisa toda linha ({ "157" }, depois { "170" }, depois { "176" }), atinge o mesmo limiar e recupera também quatro campos de cabeçalho que precisam de escape (uma barra vertical, uma barra invertida e um sinal de igual na cadeia de versão), que o padrão de cabeçalho do pycef não consegue ler, de modo que o escape do cabeçalho se apoia apenas no codec do Logstash. O limiar de comparação foi registrado nos commits { "5172e579" } (pycef) e 0a7598aa (Logstash) antes de qualquer dos analisadores ser executado, e ambos o atingiram na primeira comparação. Cinco emendas são divulgadas. As emendas ({ "1" }) a ({ "3" }) não tocaram nenhuma regra de comparação nem valor esperado: ({ "1" }) uma asserção de tamanho do corpus foi corrigida de { "5" } para { "4" } mudanças de faixa, um erro de contagem, já que o fluxo tem { "4" }; ({ "2" }) a ligação do delimitador de pipeline do executor do Logstash foi corrigida depois de uma primeira tentativa que não produziu eventos; ({ "3" }) a pontuação de confiança e o deslocamento de época foram movidos dos campos inteiros do CEF cn1 e cn2 para os campos de ponto flutuante cfp1 e cfp2, uma mudança de formato de transmissão feita nesta versão, depois da qual o corpus foi regenerado e ambas as referências independentes foram reexecutadas com o limiar inalterado, e o atingiram novamente. A emenda ({ "4" }), { "0.36" }, ampliou o corpus e o conjunto esperado de chaves, registrada em d6331429 antes de qualquer dos analisadores ser executado nas novas linhas: entradas de esquema { "1.3" } acrescentam a geometria dos satélites nos campos personalizados cs6 (rótulo geometry: estado, depois ';' e as classes de dedução), cfp3 (geometryHdop) e cfp4 (geometryPdop); { "13" } casos de geometria (o corpus passa a { "170" } linhas) e as três novas chaves; ambos atingiram o limiar, sem outra mudança, na primeira comparação (pycef { "166" } de { "170" } linhas analisadas, os { "4" } casos de cabeçalho do nível { "2" } como antes; Logstash { "170" } de { "170" }). A emenda ({ "5" }), { "0.36" }, acrescentou { "6" } casos de rótulo de geometria (o corpus passa a { "176" } linhas), registrada em 9a8e4fa9 antes de qualquer dos analisadores ser executado neles: a partir de entradas que carregam o rótulo de geometria, o cs6 ganha um terceiro campo (';' e o rótulo) e o cn1 (geometryUsedSatellites) os satélites usados; a tabela de mapeamento do codec do Logstash foi lida primeiro (sem campos flexString, daí cs6 em vez de flexString1); ambos atingiram o limiar na primeira comparação (pycef { "172" } de { "176" }, Logstash { "176" } de { "176" }), e toda entrada de referência anterior foi reproduzida inalterada. O QUE NÃO É: nenhum dos analisadores verifica o tipo dos valores cfp (ambos os mantêm como texto), de modo que o uso dos campos de ponto flutuante se apoia no dicionário CEF e não em uma referência independente; nenhum SIEM de fornecedor foi executado; os nomes das chaves de extensão e seu mapeamento são escolha deste crate, e os analisadores mostram apenas que eles são lidos de volta como escritos; o envelope RFC { "5424" }, a entrega, os tempos limite e a reconexão não são cobertos; o pycef é um analisador pequeno com última versão em { "2020" }, e o codec do Logstash é a referência independente mais substancial.

# text
seg-51640405c9b7 = Eventos SIEM da telemetria de confiança: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de mudança de faixa (ou por época) como cargas Log Event Extended Format { "2.0" } em um envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado.

# text
seg-563ccb0adbe5 = O QUE É VERIFICADO: os próprios testes de cadeia exata deste crate do mapeamento de campos LEEF documentado e dos campos do envelope RFC { "5424" }; não existe nenhum analisador LEEF de código aberto mantido (uma busca no índice de pacotes Python não encontrou nenhum), de modo que o formato é verificado contra sua própria especificação lida pelo mesmo autor, não contra uma referência independente externa. O QUE NÃO É: se as cargas LEEF são aceitas pelo analisador ou SIEM de qualquer fornecedor; as regras de escape além das documentadas; o comportamento de um coletor syslog real.

# text
seg-96a95b89faa5 = Integridade do pacote de evidências: assinatura, cadeia de hashes e procedimento de verificação

# text
seg-943a853d8a4a = Um pacote de evidências assinado e com cadeia de hashes de um evento de confiança GNSS: SHA-256 sobre cada arquivo e uma cadeia sobre o manifesto, uma assinatura Ed25519 sobre os bytes exatos do manifesto e um verificador que nomeia cada falha (um arquivo alterado, removido, renomeado, trocado ou acrescentado, um manifesto reordenado ou editado, um manifesto refeito em hash sem a chave, um pacote reassinado, uma chave fixada errada e um token de carimbo de tempo que é removido, substituído, lixo ou referente a outro documento).

# text
# c1: kshana evidence verify --tsa-ca
seg-0699ef2074fd = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: ({ "1" }) as funções Ed25519 que o pacote usa para assinar e para verificar de forma estrita (evidence::bundle::sign_detached, evidence::verify::verify_detached) reproduzem byte a byte as chaves públicas e as assinaturas dos vetores de teste { "1" }, { "2" }, { "3" } e { "1024" } da seção { "7.1" } da RFC { "8032" }, os aceitam e rejeitam cada bit trocado do vetor { "1" } e cada sétimo bit dos demais e uma assinatura S+L não canônica; os vetores são lidos do texto da RFC e reproduzidos por duas implementações independentes (cryptography/OpenSSL e PyNaCl/libsodium) em scripts/gen_ed25519_rfc8032_ref.py. ({ "2" }) evidence::bundle::sha256_hex, o hash por trás de todo hash de pacote e da cadeia, reproduz exatamente os exemplos de SHA-256 da FIPS 180-4 (abc; a mensagem de 448 bits; um milhão de a), a mensagem vazia e os digests do hashlib de uma escada de { "0" } a { "130" } bytes através das fronteiras de preenchimento. ({ "3" }) Um verificador escrito em Python apenas a partir de docs/EVIDENCE-PACKS.md (scripts/evidence_verify_cleanroom.py: hashlib e cryptography; seu autor não leu nenhum código Rust) concorda com o verificador em Rust em { "71" } pacotes sintéticos íntegros e adulterados, exatamente, quanto ao veredito, ao conjunto de falhas com nomes de arquivo, ao veredito da assinatura e à cabeça da cadeia recalculada a partir dos arquivos e à que o manifesto registra. Na primeira execução, { "64" } de { "71" } concordaram; as discordâncias foram uma ambiguidade da especificação (verificar uma chave fixada contra um manifesto ilegível), um desvio de interface da referência independente e um caso construído de forma incompleta; a frase da especificação foi esclarecida, a referência independente foi reimplementada a partir do texto e o caso foi completado, sem alterar nenhuma tolerância ou expectativa (registrado no commit d54e14c6). O QUE NÃO É: o verificador clean-room é uma implementação independente de um autor diferente, não uma autoridade de terceiros, e compartilha as escolhas da especificação, de modo que corrobora esta implementação das regras, não as regras; os vetores validam as primitivas, não o projeto do formato do pacote. Nesta linha o token RFC { "3161" } é lido apenas pelo seu message imprint e os tokens de teste são sintéticos e não assinados; a assinatura e a cadeia da autoridade são verificadas, por adesão opcional (<c1/>), pela linha separada 'Verificação da assinatura e da cadeia do token de carimbo de tempo RFC { "3161" }'. Os casos de adulteração são sintéticos. Nada aqui é um parecer jurídico sobre nenhum pacote nem uma atestação dele.

# text
seg-c15736afcbc9 = Verificação da assinatura e da cadeia do token de carimbo de tempo RFC { "3161" }

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token, e <c1/> opcional para o timestamp.tsr de um pacote: uma TimeStampResp RFC { "3161" } ou um TimeStampToken simples (CMS SignedData sobre um TSTInfo) verificado offline contra âncoras confiáveis do modo como <c2/> o verifica: o tipo de conteúdo dos atributos assinados e o resumo da mensagem sobre o TSTInfo; a assinatura sobre os atributos assinados (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 e P-384; operações públicas RSA sobre crypto-bigint); o hash do certificado de assinatura ESS v1 (SHA-1) ou v2 que nomeia o certificado do signatário, encontrado entre os certificados do token e os não confiáveis do chamador; o uso estendido de chave timeStamping crítico e exclusivo do signatário; a cadeia até uma âncora autoemitida confiável com a assinatura, o status de CA e o uso de chave de cada certificado, e todo certificado válido no genTime do token; e o message imprint contra os dados. Não verificados: revogação (CRL, OCSP), restrições de nome e de política, o nonce

# text
# c1: openssl ts -verify -attime genTime
# c2: openssl cms -verify -cades -purpose timestampsign
seg-d305c442506d = OpenSSL { "3.0.13" } (<c1/>, e <c2/> mais o imprint do TSTInfo para tokens RSA-PSS), executado por tests/fixtures/evidence_tsa/run_openssl.sh nos { "27" } casos de cases.tsv: RSA PKCS#1 v1.5 com SHA-256 e SHA-512 e ESS v1 e v2, uma raiz ECDSA P-384 sobre um intermediário P-256 e TSAs P-256 e P-384, RSA-PSS, um token sem o certificado do signatário, com e sem ele fornecido, tokens assinados em CAdES, um byte de assinatura trocado (três algoritmos), um TSTInfo alterado (dois), uma assinatura intermediária trocada, um certificado gêmeo ESS, âncoras erradas (quatro), um certificado de TSA expirado, um uso estendido de chave não crítico e um errado, e dados errados (três). Pré-registrado em tests/fixtures/evidence_tsa/PREREGISTRATION.md (versionado isoladamente, 30ad70b2, antes de o verificador existir; os veredictos do OpenSSL reexecutados depois, idênticos byte a byte). Primeira execução: todos os { "27" } veredictos concordam (B1) e todo genTime concorda até o segundo (B2). Escopo, declarado de forma restrita: certificados e tokens de teste autogerados, feitos pelo mesmo OpenSSL que os julga; o OpenSSL é uma implementação independente, não uma autoridade de carimbo de tempo; nenhum token de autoridade pública é incorporado (freetsa.org não declara licença). Nada aqui atesta nenhum carimbo de tempo real

# text
seg-c04042b0270a = Limiares de interferência do receiver-trust calibrados no conjunto de dados JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: a calibração pré-registrada dos monitores de queda de C/N0, de AGC e de indicador de jamming no conjunto de dados público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtido em tempo de execução, nunca incorporado): por pasta, uma linha do tempo de { "1" } s a partir de mon_rf.csv e rinex.csv, os monitores executados uma vez, cada época posterior à calibração rotulada como limpa ou de jamming a partir do attack_log da pasta (deslocado de CEST para UTC, guarda de { "60" } s), cada limiar varrido sobre uma grade fixa, o menor limiar com probabilidade de falso alarme limpo agrupada de no máximo { "0.01" } selecionado, e contagens reservadas por exclusão de uma pasta; uma verificação cruzada do leitor UBX. A seleção é fornecida apenas como o perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); a regra padrão e toda saída sem ele permanecem inalteradas

# text
seg-3ccd1b09ad09 = Os registros de eventos publicados do conjunto de dados (janelas do attack_log), como verdade dos eventos, sob o pré-registro xval/jammertest-trust/PREREGISTRATION.md (versionado isoladamente, 0fa012b, antes de o arcabouço ser executado). Primeira e única execução (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } pastas avaliáveis ({ "7" } com jamming), { "3,502" } épocas limpas e { "9,560" } de jamming. Probabilidade de falso alarme limpo reservada: cn0_drop_db { "0.0231" } (81/3502) contra um limiar de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, passa; jam_ind_threshold { "0.0094" }, passa; a união dos três: falsos alarmes { "0.0328" }, detecção { "0.807" } contra { "0.05" } e { "0.50" }, passa. Pela regra registrada, a linha é MODELLED (um limiar falhou). Restrita: um tipo de receptor (u-blox ZED-F9P), um evento, janelas programadas de um minuto como verdade (a detecção é um limite inferior; limpa significa fora das janelas registradas); calibrada nos registros CSV, e o leitor UBX dá mais falsos alarmes em duas pastas. As faixas da pontuação de confiança marítima não são calibradas

# text
seg-65a8361b4a22 = Pontuação do Jammertest: um registro de receptor pontuado por ensaio programado (latência de detecção, alarmes perdidos, alarmes falsos, tempo de recuperação) em relação ao plano de ensaios publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): o catálogo de ensaios e o plano de transmissão da NPRA (MIT, obtidos com um SHA-256 fixado, nunca incorporados ao repositório) lidos como verdade programada, com os identificadores do catálogo preservados; uma execução de receiver-trust pontuada por ensaio (primeiro alarme menos o início planejado, detectado/tardio/perdido em relação a uma tolerância, tempo até o primeiro trecho sem alarmes, alarmes fora de todos os intervalos e da sua margem de guarda), com um pacote de evidências assinado que carrega o quadro de pontuação. O cronograma são intervalos planejados, não horários de transmissão registrados

# text
seg-49b912adb7a9 = As contagens de intervalos do plano por área de ensaio ({ "76" }, { "77" } e { "45" } intervalos, dos quais { "61" }, { "63" } e { "32" } transmitem) foram contadas de forma independente com um script sobre o mesmo JSON; as janelas attack_log do conjunto de dados de { "2024" } como verdade dos eventos, de acordo com xval/jammertest-score/PREREGISTRATION.md (submetido isoladamente, c2e6d3b, antes de o pontuador ser executado). Primeira e única execução (xval/jammertest-score/RESULTS.md): a regra registrada de volume mínimo de dados FALHOU ({ "4" } janelas de jamming pontuáveis vindas de { "4" } das { "12" } pastas UBX, contra um mínimo de { "10" } janelas de { "2" } pastas: { "5" } pastas descartadas pela regra da linha de base, { "3" } registros UBX trazem apenas a semana e o tempo GPS), de modo que os limiares B1 a B4 não são avaliáveis; nada foi afrouxado nem reexecutado. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, submetido isoladamente, apenas tratamento de dados: registros só com tempo GPS posicionados a partir da data, as { "12" } pastas apenas CSV, uma sessão de plataforma móvel para rovers em movimento; mesmos limiares e mesma regra de volume mínimo): { "14" } das { "24" } pastas mantidas, mas { "7" } janelas de jamming pontuáveis, a regra de volume mínimo falhou de novo, nenhum limiar avaliável (RESULTS-v2.md). Verdade programada: um intervalo planejado não é um registro de transmissão no ar, uma falha de detecção pode ser um ensaio que nunca foi executado, uma latência é medida a partir do início planejado, e limpo significa fora dos intervalos planejados. A detecção por monitores no domínio da medição não diz nada sobre um spoofer de baixa potência. Um tipo de receptor (u-blox ZED-F9P). O conjunto de dados NMEA da SimulaMet de { "2025" } não é usado (sem licença declarada, acesso condicionado a assinatura)

# text
seg-0d227bbcb5f1 = Exportação para test bench (kshana bench-export): colunas terrestres fixas (Earth-fixed), geodésicas e de velocidade local, colunas de atitude e saída NMEA { "0183" }

# text
seg-c6a6e08afadd = As colunas do CSV de movimento com posição terrestre fixa, posição geodésica, velocidade terrestre fixa, rumo/arfagem/rolagem e UTC, e as sentenças NMEA GGA/RMC, escritas a partir de cenários sintéticos (gnss-ins, incluindo automotive-urban-canyon, jamming, gnss-sim). Apenas movimento e eventos; nenhum sinal é escrito e nenhum desempenho de simulador ou de receptor é afirmado.

# text
seg-f953ad11fe08 = O QUE É VERIFICADO EXTERNAMENTE, declarado de forma restrita: em relação a pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } e scipy { "1.18.1" }, executados por scripts/gen_testbench_ref.py em { "4" } cenários sintéticos, com tolerâncias fixadas antes da primeira comparação (cada uma o pior caso de arredondamento do escritor): as colunas terrestres fixas são iguais à conversão WGS { "84" } das colunas geodésicas (pior caso { "1.3e-4" } m, limiar { "3e-4" }) e à inversa ({ "1.3e-9" } deg, limiar { "2e-9" }; altura { "1.3e-4" } m, limiar { "3e-4" }) em todas as linhas; a velocidade terrestre fixa girada para norte-leste-baixo (NED) pela operação topocêntrica do PROJ é igual à velocidade NED verdadeira do motor ({ "7.5e-5" } m/s, limiar { "2e-4" }); rumo, arfagem e rolagem são iguais aos ângulos yaw-pitch-roll do scipy para o quaternion verdadeiro do motor ({ "5.0e-7" } deg, limiar { "1e-6" }); toda sentença NMEA é interpretada pelo pynmea2 com checksum válido, e sua posição decodificada ({ "1.2e-3" } m, limiar { "5e-3" }), altura, velocidade, curso ({ "5.0e-4" } deg, limiar { "1e-3" }) e hora são iguais aos valores do movimento; a coluna UTC é igual à aritmética independente de data e hora. O SHA-256 dos bytes exatos do CSV e do NMEA verificados está fixado. O QUE NÃO É: a própria trajetória de verdade do cenário (o perfil de condução e sua integração); as convenções (o rumo é a guinada do corpo, não o curso, e difere dele em até cerca de { "77" } graus em automotive-urban-canyon; a qualidade do GGA, a contagem de satélites e o HDOP são valores provisórios); se algum simulador de laboratório lê os arquivos como pretendido; qualquer desempenho de simulador ou de receptor. As referências independentes verificam conversões e codificações, não a física do cenário. O tratamento do referencial local é verificado apenas pela rotação da velocidade e pela velocidade e curso do NMEA (o CSV não tem coluna de posição local).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): um mapeamento das saídas do Kshana para cláusulas de referenciais públicos apenas por número, preenchido a partir das execuções fornecidas; um resultado conta para uma capacidade somente quando traz as evidências que o mapeamento indica, um conjunto vazio não evidencia nada, e a redação é "fornece evidências em apoio de"; o relatório não é uma constatação de que algum referencial normativo foi atingido, nem uma classificação ou aprovação por quem quer que seja.

# text
seg-8659260fd38e = Referências verificadas em relação a um índice de títulos extraído por script dos documentos públicos citados, lidos em 2026-10-10 (tests/compliance_references.rs). O QUE É VERIFICADO: { "49" } referências citadas a cláusulas, seções, parágrafos ou títulos existem no documento citado, e { "7" } URLs citadas foram resolvidas na data registrada ({ "2" } por uma segunda via); os controles negativos falham. O QUE NÃO É: que alguma paráfrase, mapeamento ou lacuna esteja correto; as cláusulas da EN { "16803" } (paga, apenas o texto do catálogo); revisões posteriores; o índice não é uma implementação independente.

# text
seg-98c360d82d56 = Integrações marítimas: plugin Signal K, fluxo de gate e painel de pontuação para OpenCPN, build de referência

# text
seg-7af9ce566646 = A pontuação de confiança, a faixa, os motivos, o estado do gate e a posição informada pelo receptor, publicados em navigation.gnss.kshana em um servidor Signal K com uma notificação de aviso, de alarme e normal (integrations/signalk); o fluxo NMEA controlado pelo gate, com o fix marcado como inválido enquanto a confiança está colapsada e uma sentença PKSHT por ciclo, servido ao OpenCPN por TCP pelo próprio gate ou por um pequeno relay, e um painel de pontuação nativo do OpenCPN que lê a sentença PKSHT (integrations/opencpn); e unidades systemd e um contêiner que executam o gate (deploy/reference-build). Onde estes mostram saída, trazem a declaração consultiva: Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
seg-00a0f52f7458 = O QUE É VERIFICADO, declarado de forma restrita: que estas integrações funcionam com o software real para o qual foram escritas. AS EVIDÊNCIAS estão registradas em integrations/signalk/evidence/README.md (com seus arquivos JSON) e em integrations/opencpn/evidence/README.md (com suas capturas de tela e registros), cada uma com o script que a reproduz. ({ "1" }) Signal K: o plugin carregado no pacote npm signalk-server { "2.33.0" } fixado, em um namespace de rede privado, somente de loopback, alimentado com dados sintéticos. As próprias interfaces REST e WebSocket do servidor mostraram os caminhos publicados, os metadados da pontuação e uma notificação que passou de ausente a aviso, alarme, normal (após o período de retenção) e aviso novamente quando os dados cessaram. Com o kshana real executado pelo plugin sobre o NMEA que o próprio servidor recebeu, a notificação passou a aviso e depois a alarme e a posição informada foi publicada; o navigation.position do próprio servidor foi escrito pelo seu provedor NMEA, nunca pelo plugin. Reexecutado com o JSON schema { "1.2" } em uso. ({ "2" }) OpenCPN: o plugin compilado com o cabeçalho da API de plugins do OpenCPN e o wxWidgets { "3.2.4" }, carregado no pacote Ubuntu { "24.04" } do OpenCPN { "5.8.4" } sob uma tela virtual; o OpenCPN o carregou, executou sua inicialização e entregou a ele as sentenças PKSHT do fluxo controlado pelo gate, e o painel ficou vermelho na faixa não confiável. Em uma execução limpa, a posição da própria embarcação no OpenCPN deixou de ser atualizada, e seu indicador de fix caiu, quando o gate marcou o fix como inválido. Uma segunda execução, alimentada diretamente pelo ouvinte TCP do gate, mostrou entrega ao plugin, mas não um antes e depois nítido. ({ "3" }) Os testes do relay reproduzem um trecho gravado do fluxo controlado pelo gate por um socket TCP real e verificam o que um consumidor recebe (os bytes inalterados, checksums válidos em toda sentença, inclusive nas reescritas, GGA e RMC concordando, um PKSHT por ciclo com o campo do gate onde o fix é inválido), e o script de ponta a ponta verifica que um consumidor do ouvinte do gate recebe exatamente os bytes que o mesmo gate escreve na saída padrão. ({ "4" }) Os analisadores de PKSHT (JavaScript e C++) são executados sobre sentenças gravadas da saída do kshana e rejeitam um checksum, uma versão ou uma pontuação errados fora de { "0" } a { "100" }. ({ "5" }) As unidades systemd são verificadas com systemd-analyze verify (systemd { "255" }, binários substituídos por stubs) e com verificações de shell em ExecStart, da política de reinício e das chaves de sandbox; o tratamento de argumentos do entrypoint do contêiner é verificado com um binário stub. O QUE NÃO É: não há referência independente externa para nenhum valor que estas integrações mostram. Os próprios valores de confiança são as linhas acima, e uma execução de integração mostra apenas que a infraestrutura os transporta; por isso esta linha é MODELLED e não VALIDATED (docs/VALIDATION.md). Não foram usados embarcação real, receptor real, execução longa, outra versão de qualquer um dos hospedeiros, outro sistema operacional ou outro ambiente de desktop; todos os dados são texto sintético e nada aqui é uma medição. O tratamento sonoro e visual da notificação por um cliente Signal K real, o botão da barra de ferramentas do OpenCPN, as preferências e o estado desatualizado, e o empacotamento para o gerenciador de plugins do OpenCPN não foram exercitados. As chaves de sandbox do systemd foram verificadas apenas quanto à sintaxe, não executadas sob um systemd ativo, e a construção da imagem do contêiner e sua verificação de integridade não têm evidência registrada aqui. Nenhum número de detecção ou de alarme falso é afirmado. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
seg-89ab9ef155eb = Rastreamento BOC({ "1,1" }): escala do DLL e resolução de ambiguidade bump-jump (opcional)

# text
seg-ef24be9b5917 = O campo boc de iq::track::LoopConfig (opcional, None por padrão): os três discriminadores do DLL reescalados para ler o erro de código em chips com inclinação unitária no pico principal do BOC({ "1,1" }) senoidal, e um monitor bump-jump sobre correlatores muito adiantado e muito atrasado a meio período da subportadora ({ "0.5" } chip) que salta o NCO de código em direção ao pico principal quando um contador crescente/decrescente atinge N ({ "8" } por padrão). Sem a opção, toda saída permanece inalterada.

# text
seg-416ce4dfc6f5 = Consistência interna em relação à verdade injetada e a formas fechadas, sob limiares fixados antecipadamente em 6b68f6cc (docs/design/evidence/boc-bump-jump/). Um sinal de dados BeiDou B1C (PRN { "19" }, { "5" } MS/s) gerado por iq::scene: com a opção desligada, uma partida em pico lateral permanece com falso travamento em ±({ "0.5" } + d/4) chip previsto (medido ±{ "0.549" }); com ela ligada, um salto em direção ao pico principal em { "0.08" } s e um RMS na janela tardia de { "0.0008" } chip a { "45" } dB-Hz e de { "0.0048" } chip a { "35" } dB-Hz; nenhum salto a partir do pico principal a { "35" }, { "40" } e { "45" } dB-Hz ao longo de { "4" } s; a inclinação do EMLP escalado de { "0.94" } a { "0.99" } no sinal amostrado (sem escala, { "3.6" } a { "3.8" }). O detector bump-jump isolado, sobre trios de correlatores com a covariância de ruído exata do BOC({ "1,1" }), não produziu nenhum salto falso em { "100 000" } atualizações a { "25" } a { "45" } dB-Hz e detectou { "1000" } de { "1000" } partidas em pico lateral a { "35" } dB-Hz. NOT MET (constatação F1): a grade de testes unitários fixada antecipadamente para a escala inclui deslocamentos fora da faixa linear dos discriminadores, onde as leituras escaladas erram o deslocamento em até { "48" } %. O QUE NÃO É VERIFICADO: IQ de campo, front ends de banda limitada, réplicas compostas MBOC/QMBOC e qualquer receptor externo.

# text
seg-2c32955cbfb3 = Canal de cintilação ionosférica IQ (modelo de Cornell) em relação à cintilação GPS L1 medida a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, o modelo de cintilação de Cornell (intensidade de Rice, espectro de Butterworth de segunda ordem, fase arg z) conduzido com o S4 e o tempo de decorrelação da intensidade de uma janela medida, comparado naquilo que gera além dessas duas entradas; realdata::scint50 lê o registro medido, remove a tendência e executa a comparação.

# text
seg-bdc9fe963c5c = Dados medidos sob limiares fixados antecipadamente em b6ccb499 (xval/scint-malindi/): registro Zenodo { "16941224" } (INGV, Malindi, { "18" } de março de { "2023" }, GPS PRN { "26" }, intensidade e fase da portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 verificado). { "22" } janelas qualificadas de { "60" } s (N1 atingido). MET: a distribuição de intensidade (Kolmogorov-Smirnov D { "0.0415" }, limiar { "0.05" }) e a cintilação de fase associada ao S4 (sigma-phi medido/modelo mediano { "0.779" }, limiar de 2/3 a 3/2). NOT MET (constatação F1): a fração de desvanecimento profundo do modelo é { "2.38" } vezes a medida (limiar de { "0.5" } a { "2" }) e seu desvanecimento médio dura { "3.51" } vezes mais (limiar de 2/3 a 3/2). Constatação F2: o processamento registrado lê a fase embrulhada (wrapped) do modelo, o que uma autoverificação revelou; B3 repetido post hoc com a fase desembrulhada dá { "0.804" }. O QUE NÃO É VERIFICADO: outras noites, estações, latitudes ou sinais; ruído do receptor no modelo. A linha permanece MODELLED.

# text
seg-160507ac3702 = Opção CFAR por média de células (cell-averaging) na aquisição IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar e ca_cfar_cells (opcional): uma célula de uma grade de aquisição é comparada com a média de células de referência de sua linha Doppler (atrasos de guarda e de passo, dando a volta no período), com um fator alpha definido a partir da probabilidade de falso alarme do CA-CFAR em forma fechada para M blocos não coerentes (ca_cfar_pfa, ca_cfar_alpha). O detector de potência da amostra continua sendo o padrão e toda saída existente permanece inalterada.

# text
seg-ba35daac2aed = Forma fechada, sob limiares fixados antecipadamente em 3724aefa (docs/design/evidence/acq-cfar/). A probabilidade de falso alarme do CA-CFAR para células Gamma(M), em relação a Monte Carlo do modelo exato: { "18" } de { "18" } casos dentro de { "3" } sigma binomial. Em toda célula de buscas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } células cada), com { "1" } % de projeto: { "0.977" } % e { "0.969" } % em ruído gaussiano e { "1.006" } % e { "0.999" } % em ruído quantizado em 2 bits (M = { "1" } e { "4" }; limiar de mais ou menos { "20" } %); decisões inalteradas quando a entrada é escalada. NOT MET (constatação F1): em um sinal de 2 bits sem ruído, a detecção e sua célula estão corretas, mas { "1.28" } % das células fora do pico na linha do pico (limiar { "1" } %) excedem o limiar de decisão, nos lóbulos laterais de correlação determinísticos do código. O QUE NÃO É VERIFICADO: outras variantes de CFAR, janelas bidimensionais, front ends de banda limitada, dados de campo.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou e Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resolve, apenas por nome (MORE_BAND_NAMES), GLONASS L1OF e L2OF em todo canal FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a e B3I (BPSK({ "10" })) e Galileo E6 (BPSK({ "5" })), com as portadoras e as potências mínimas recebidas de seus documentos de controle de interface; o conjunto de bandas padrão e toda saída existente permanecem inalterados.

# text
seg-6d674bc4b40a = Documentos de controle de interface publicados e formas fechadas, sob limiares fixados antecipadamente em 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edição { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } e B3I { "1.0" }, Galileo OS SIS ICD Edição { "2.1" }. MET: toda portadora, taxa de chip e potência recebida como transcritas ({ "28" } canais GLONASS), primeiros nulos do BPSK na taxa de chip, o composto B1C igual ao MBOC(6,1,1/11) como dá a tabela de potência de seu ICD, a identidade do caminho C/N0 e cenários de espectro idênticos byte a byte. NOT MET: o limiar de área unitária, que era inatingível como escrito (constatação F1; as áreas são iguais à fração em banda em forma fechada), e a concordância por bin das formas de onda B1I e B1C da camada IQ com o envelope do modelo ({ "1.26" } e { "1.56" } dB contra { "0.5" } dB, constatação F2; GLONASS { "0.07" } dB), porque os códigos Gold e Weil têm espectros de linhas irregulares; com média por banda, os lóbulos principais concordam dentro de { "0.25" } dB. O QUE NÃO É VERIFICADO: IQ gravado, outros sinais, interferência intrassistema.

# text
seg-63b7da996265 = Códigos de alcance primários do BeiDou B1I em relação a um gerador independente

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits e b1i: os códigos Gold do BDS-SIS-ICD-B1I-3.0 truncados em { "2046" } chips, PRN { "1" } a { "63" }, como a camada IQ os gera, adquire e rastreia.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (tag { "v0.0.19" }, commit 1ddd4562), uma implementação de código aberto independente do mesmo ICD: seu beidou_b1i_code_gen_int, compilado de forma autônoma, gerou todos os { "63" } códigos. Apenas a saída de seu programa está registrada: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, um prefixo de 64 chips e o SHA-256 de cada código de 2046 chips. Essa saída são os códigos PRN do BeiDou B1I que o BDS-SIS-ICD-B1I-3.0 público define; nenhum código-fonte nem binário do GNSS-SDR está no repositório. Limiar fixado antecipadamente em 911106d1 (xval/beidou-b1i-gnss-sdr/): todos os { "2046" } chips de todos os { "63" } PRNs idênticos, sem inversão, deslocamento nem renomeação. Resultado: { "63" } de { "63" } idênticos; a fixture foi regenerada a partir de um checkout novo da { "v0.0.19" } (SHA-256 do arquivo-fonte como registrado) e é idêntica byte a byte. O QUE NÃO É VERIFICADO: o código secundário NH20, a lista de PRNs GEO, a portadora e a taxa de chip.

# text
seg-b4787b04338e = Códigos de alcance e de sobreposição do GPS L1C em relação às colunas de verificação impressas no IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits e l1c_o_bits: os códigos de alcance Weil L1CP e L1CD (sequência de Legendre calculada, índice de Weil, sequência de expansão inserida antes do chip p) e os códigos de sobreposição L1CO S1, PRN { "1" } a { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, declaração de distribuição A), as colunas de verificação que ele imprime ao lado dos parâmetros do gerador: Tabela 3.2-2, os { "24" } chips iniciais e finais de todo código L1CP e L1CD, Tabela 3.2-3, os { "11" } bits iniciais e finais de todo código L1CO, Tabela 6.2-1, a sequência de Legendre de comprimento 10223; transcritas por scripts/extract_is_gps_800_tables.py a partir do PDF (SHA-256 c4aad710...). Limiares fixados antecipadamente em fe372e26 (docs/design/evidence/l1c-codes/): { "252" } de { "252" } colunas, { "63" } de { "63" } sobreposições e { "10 223" } de { "10 223" } bits de Legendre idênticos; a extração com --check passa; um controle negativo falha com códigos renomeados, invertidos e deslocados. O QUE NÃO É VERIFICADO: os próprios parâmetros do gerador (vêm das mesmas tabelas), os chips entre as colunas impressas, o padrão de subportadora TMBOC e os códigos L1CO S2.

# text
seg-5cba09089e09 = Códigos primários AFS-I e AFS-Q do LunaNet em relação às colunas de verificação impressas no LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits e afs_q_primary_bits (nomes de sinal lunanet-afs-i e lunanet-afs-q em kshana iq): o código Gold AFS-I ({ "2047" } encurtado em ciclo para { "2046" }, G2 atrasado por PRN) e o código primário Weil AFS-Q (sequência de Legendre calculada, índice de Weil, sequência de expansão inserida antes do chip p), PRN { "1" } a { "210" }.

# text
seg-330ed84e8e78 = Em relação às tabelas impressas do LSIS-AFS V1.0 (marcadas TBC na especificação): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" } de janeiro de { "2025" } (NASA; SHA-256 do PDF { "986e0795" }...), as colunas de verificação que ele imprime ao lado dos parâmetros do gerador: Tabelas C-1 a C-5 e D-2 a D-6, os { "24" } primeiros e últimos chips de todo código AFS-I e AFS-Q, Tabela D-1, a sequência de Legendre de comprimento 10223; extraídas por scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Limiares fixados antecipadamente em b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md) antes de o gerador existir: B1 { "420" } de { "420" }, B2 idêntico, B3 { "420" } de { "420" }. O documento marca suas tabelas de códigos como { "{" }LSIS-TBC{ "}" } e diz que servem apenas para ensaio e integração, de modo que isto valida a construção em relação às tabelas dessa edição, não às de uma posterior. Uma afirmação fixada antecipadamente sobre o estado inicial impresso do G2 (B1b) foi enunciada com o sentido errado e é NOT MET ({ "0" } de { "210" }), fixada; a relação corrigida ({ "2047" } menos o atraso) vale em { "210" } de { "210" } e é registrada como post hoc. O QUE NÃO É VERIFICADO: os próprios parâmetros do gerador (mesmas tabelas), os chips entre as colunas impressas, o código terciário, a camada de mensagem e a codificação LDPC.

# text
seg-7b1ae0c7ca28 = Códigos terciários do LunaNet AFS e camada de mensagem (SB1 BCH, CRC-24Q, entrelaçador) em relação ao LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: padrão de sincronização, codificador SB1 BCH({ "51,8" }) e decodificador de 256 hipóteses, CRC-24Q, o entrelaçador em bloco de { "60" } x { "98" }, um verificador de fluxo de símbolos (kshana lunanet-afs-check) e um gerador de fluxo de teste com subquadros provisórios. A codificação LDPC de taxa 1/2 dos subquadros { "2" } a { "4" } não está implementada (suas matrizes estão em um anexo separado).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (como acima): a sequência de Legendre de comprimento 1499 (Tabela E-1, idêntica) e os { "24" } primeiros e últimos chips terciários (Tabelas E-2 a E-6: { "419" } de { "420" } colunas idênticas; o documento imprime os mesmos { "24" } últimos chips, A14850, para o PRN { "147" } e o PRN { "151" } e o gerador reproduz os do PRN { "151" }, de modo que a entrada do PRN { "147" } é muito provavelmente um erro de impressão; o limiar de { "420" } de { "420" } é NOT MET e a falha está fixada); o exemplo trabalhado da Figura { "8" } do código SB1 (um exemplo: 0x045 codifica em 0x229F61DBB84A0); o CRC-24Q em relação ao valor de verificação de catálogo 0xCDE703 para o ASCII { "123456789" }; a aritmética de quadros do próprio documento. Limiares fixados antecipadamente em b3ba5d5. Uma falha registrada e um exemplo trabalhado para a camada de mensagem, de modo que a linha permanece MODELLED. O QUE NÃO É VERIFICADO: LDPC e as palavras CRC dentro dos subquadros { "2" } a { "4" }, o conteúdo das mensagens e qualquer fluxo gravado

# text
seg-0d7b17524c04 = Pacotes de normas: cenários pontuados em relação a limiares declarados antes da execução

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): os perfis de teste do framework de PNT resiliente do DHS para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e os pacotes de monitorar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }: cada teste executa um tipo de cenário incluído e compara campos de resultado com limiares declarados no pacote, e os testes que precisam de um registro de receptor são listados como NEEDS INPUT e não são pontuados.

# text
seg-d9ea966abdd6 = Nenhuma externa para os resultados dos cenários: todo teste do pacote executa um tipo de cenário MODELLED. Os limiares são o perfil declarado pelo autor do pacote (o framework do DHS não declara valores; os limites de exatidão da IMO são a Tabela C-1 da MSC.1/Circ.1575, lida por inteiro; o pacote do ICAO segue a apresentação do próprio ICAO sobre o Plano de Mitigação de RFI, porque o Doc { "9849" } é uma publicação paga e não foi lido), registrados antes de qualquer execução pontuada em arquivos PREREGISTRATION.md ao estilo xval sob standards/. Um limiar MET diz que um cenário modelado atingiu um limiar declarado, nada sobre um produto

# text
seg-8a8f2c85e0c3 = Pacote de evidências de ida e volta em laboratório (cenário, condições de teste, registro do receptor, pontuação)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) e a exportação de registro de receptor kshana.test-conditions/1 de kshana bench-export: um pacote assinado que registra o hash do cenário, o hash das condições declaradas, o hash do registro e a pontuação em relação aos eventos declarados, e recusa condições que divergem dos eventos de pontuação ou um registro cujo hash não é o declarado. Nenhum sinal é escrito, reproduzido ou agendado.

# text
seg-76da58fe670a = Nenhuma externa: o pacote vincula hashes e uma pontuação de registro de receptor MODELLED, verificada em dados sintéticos (o NMEA exportado de um cenário incluído tratado como o registro do receptor). Nenhuma execução em laboratório é afirmada

# text
seg-a9189e4fe413 = Motor de rastreamento IQ em relação ao GNSS-SDR { "0.0.19" } em gravações independentes

# text
seg-364de05e5b1b = O motor completo de rastreamento da camada IQ (iq::track por meio de kshana iq track: transferência da aquisição, correlatores, NCOs, PLL Costas de segunda ordem de { "15" } Hz, DLL de envoltória EML de primeira ordem de { "2" } Hz auxiliado pela portadora, indicador de travamento e estimadores de C/N0) em GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, o pacote Ubuntu { "24.04" }, executado como programa separado; apenas números derivados registrados) rastreando as mesmas gravações numpy (independentes do motor), ambos medidos em relação à verdade analítica. Limiares fixados antecipadamente em 48edd4a5, emendados antes de qualquer gravação de teste em 1e4288c4 (um FLL de { "10" } Hz apenas durante a entrada em sincronismo, em ambos os receptores, depois que a calibração registrada falhou por uma transferência errada do GNSS-SDR, constatação F3). MET a { "30" }, { "35" }, { "40" } e { "45" } dB-Hz: jitter de portadora dentro de { "4.3" } %, jitter de código dentro de { "4.6" } % e média e dispersão do Doppler dentro das do GNSS-SDR. NOT MET: o C/N0 NWPR do motor lê { "2.3" } a { "7.1" } dB abaixo do SNV do GNSS-SDR (constatação F4, o limite conhecido do NWPR; seu M2M4 está a { "0.06" } dB da verdade); os indicadores de travamento de fase diferem por definição (F5); a { "30" } dB-Hz o GNSS-SDR perdeu o ciclo duas vezes e o motor não (F6). A própria transferência do GNSS-SDR travou em uma frequência errada em { "3" } das { "30" } execuções de calibração. O QUE NÃO É VERIFICADO: outros sinais, remoção de bits de dados, readquisição, gravações de campo. A linha permanece MODELLED.

# text
seg-259d201c2ff8 = Ganhos de antena CRPA no tipo de cenário jamming em relação a um recálculo independente em numpy

# text
seg-192144c57783 = A seção opcional [crpa] do tipo de cenário jamming: um feixe por canal em direção a cada satélite (anulação com o jammer como nulo, ou MVDR sobre sigma^{ "2" } I + P_j a_j a_j^H), escalando o ruído de cada enlace por ||w||^{ "2" } e o jammer por |w^H a_j|^{ "2" } antes da equação C/N0 antijam existente.

# text
seg-232d040b575d = Um recálculo independente em numpy (xval/crpa-jamming/oracle.py, sem código compartilhado: vetores de direção em numpy, numpy.linalg.solve e inv) de todo enlace da geometria jamming-demo com um arranjo quadrado de 4 elementos, sob ambas as ponderações. Limiares fixados antecipadamente em 08d83b4d. MET: A1 (todos os { "150" } resultados de cenário idênticos byte a byte sem a seção, depois de uma correção: a primeira versão adicionou as unidades crpa à tabela de unidades de toda execução de jamming), A2 (um elemento é igual a nenhum arranjo até { "1e-12" } dB), A3 no ganho de ruído do arranjo e no C/N0 efetivo ({ "912" } ponderações de enlace dentro de { "1e-9" } dB, pior caso { "2.1e-14" } dB) e no nulo do jammer por anulação (abaixo de -200 dB em ambos os lados), A4 (MVDR dentro de { "0.1" } dB da anulação com um JNR de { "80" } dB). NOT MET: A3 no ganho do jammer do MVDR, { "194" } de { "456" } enlaces acima de { "1e-9" } dB com a matemática portátil de { "0.36" } ({ "202" } com a matemática do hospedeiro; docs/revisions/STUDIO15-batch4-rebaseline.md) (pior caso { "1.7e-6" } dB) em resíduos de -100 a -188 dB, onde o cancelamento em float64 limita ambas as implementações (inv e solve do numpy discordam entre si em { "169" } enlaces, pior caso { "7.9e-7" } dB); o C/N0 efetivo que eles alimentam não é afetado. O QUE NÃO É VERIFICADO: acoplamento mútuo, descasamento de elementos, processamento de banda larga, múltiplos jammers, qualquer hardware de antena. Um recálculo das mesmas equações, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-a2f34cff9338 = Sombreamento do terreno sobre o jammer no tipo de cenário jamming em relação a um recálculo independente em numpy sobre uma tile SRTM real

# text
seg-334c569d9cae = A seção opcional [terrain] do tipo de cenário jamming: o perfil do terreno em círculo máximo entre o jammer e o receptor em uma tile SRTM .hgt, com a protuberância da Terra segundo um fator k, o gume de faca dominante (maior nu de Fresnel-Kirchhoff) e a perda por gume de faca único da ITU-R P.526-15 seção { "4.1" }, subtraída da potência recebida do jammer.

# text
seg-615ea67dd756 = Um recálculo independente em numpy (xval/jamming-terrain/oracle.py, sem código compartilhado: sua própria leitura de .hgt, interpolação bilinear, ida e volta WGS { "84" }, perfil, protuberância, nu e J(nu)) de dez posições de jammer em torno de um receptor em Badwater Basin, sobre a tile SRTM real registrada tests/fixtures/terrain/N36W117_sub6.hgt. Limiares e posições fixados antecipadamente em 92cd2bfd. Todos MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem a seção); os pontos do perfil e o obstáculo de cada posição são iguais, e nu e a perda ficam dentro de { "1.6e-10" } (limiar { "1e-9" }); a perda nunca aumenta à medida que o jammer sobe de { "2" } a { "4902" } m; a perda reduz todo J/S exatamente por ela mesma e por nada mais; J(nu) dentro de { "1e-12" } dB do valor da referência independente. Constatações: posições além das Black Mountains e das Funeral Mountains perdem { "44" } a { "48" } dB; duas posições no fundo do vale perdem { "8" } e { "15" } dB só pela protuberância da Terra com antenas a { "2" } m de altura, o caso rasante do modelo de gume de faca único. O QUE NÃO É VERIFICADO: qualquer propagação medida, difração em múltiplos gumes, reflexão no solo, obstruções (clutter), o próprio erro do DEM. Um recálculo do mesmo modelo, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-825c121c7512 = Histerese de aquisição e quantizador do front end no tipo de cenário jamming em relação a recálculos independentes

# text
seg-f7207263d881 = A seção opcional [acquisition] do tipo de cenário jamming (um satélite é adquirido em ou acima de um limiar de aquisição, após um atraso de readquisição, e mantido enquanto estiver em ou acima do limiar de rastreamento) e a seção [front_end] (a leitura do AGC { "10" } log10({ "1" } + J/N) e a perda do quantizador do ADC para entrada gaussiana, retiradas de todo enlace e sinalizadas como não válidas para jammers não gaussianos).

# text
seg-6abc60ee9ec4 = Um recálculo independente em Python de cada sinalizador de aquisição (xval/jamming-acq-agc/hysteresis.py) a partir do C/N0 efetivo por época do motor, um Monte Carlo independente em numpy da perda do quantizador (xval/jamming-acq-agc/quantiser_mc.py, sua própria busca do passo ótimo, { "2" }^{ "22" } amostras) e o laço de AGC da camada IQ. Limiares fixados antecipadamente em 70c72fcc, com um conjunto suplementar de execuções fixado em { "37793290" }. MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem as seções); todo sinalizador igual nas execuções suplementares ({ "1824" } enlaces, { "732" } deles mostrando a histerese); monotonia no limiar; a perda do quantizador dentro de { "0.0007" } dB do Monte Carlo a { "1" } a { "4" } bits (limiar { "0.02" } dB); a leitura do AGC dentro de { "0.012" } dB do laço de AGC (limiar { "0.05" } dB). NOT MET: as execuções de histerese registradas (jamming-demo a { "10" } a { "30" } dBW) não foram informativas, com todos os enlaces perdidos, e seus H2 e H4 são atingidos apenas de forma trivial. Constatação: com um jammer CW, um ADC de 1 bit perde cerca de { "5" } dB a mais que o valor gaussiano que o motor aplica, e sinaliza como não válido. O QUE NÃO É VERIFICADO: a própria busca de aquisição, a dinâmica do AGC no tempo, qualquer hardware de receptor. Recálculos do mesmo modelo, não uma referência independente externa; a linha permanece MODELLED.

# text
seg-9c46f1c76486 = Entrada em sincronismo do FLL com limite, abaixo do piso de transferência de FLL para PLL do projeto padrão (opcional)

# text
seg-efa1d1a9e904 = carrier.fll_pull_in_max_s opcional de iq::track (o campo fll_pull_in_max_s de iq::track::LoopConfig): com fll_assist = pull-in, o FLL transfere para o PLL após um tempo fixo de entrada em sincronismo, qualquer que seja o PLI, com uma permanência de retorno correspondente até o PLI atingir pela primeira vez fll_off_pli.

# text
seg-76cce58eaddd = Consistência interna em relação à verdade injetada: uma fonte sintética GPS L1 C/A sem dados (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dez sementes de ruído) cuja fase da portadora é conhecida, sob limiares fixados antecipadamente em 58789af0 (docs/design/evidence/fll-handover-floor/). MET: o controle (o padrão sem limite nunca transfere em { "9" } de { "10" } sementes a { "33" } dB-Hz); aditividade (hash padrão e os testes de rastreamento existentes inalterados); entrada em sincronismo de uma transferência com { "100" } Hz de desvio a { "45" } dB-Hz. NOT MET: com um limite de { "1.0" } s, transferência e manutenção em toda execução ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; as demais alternam entre transferências forçadas e o retorno do FLL) e jitter de fase dentro de { "25" } % do PLL isolado ({ "10.8" } contra { "6.1" } graus a { "33" } dB-Hz). O QUE NÃO É VERIFICADO: bits de dados, outros sinais e taxas de amostragem, gravações de campo. O padrão permanece inalterado; a linha permanece MODELLED.

# text
seg-ac0f97e945a7 = Leitor de soluções .pos do RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lê um arquivo de solução do RTKLIB (tempo em calendário ou em semana GPS/TOW, posição em latitude/longitude ou ECEF, satélites usados) para a linha do tempo do receiver-trust (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Nenhuma externa: nenhum arquivo produzido pelo RTKLIB foi lido, e o layout das colunas vem do manual do RTKLIB. Verificado apenas em arquivos escritos pelos autores; a conversão ECEF reutiliza frames::ecef_to_geodetic, que tem suas próprias linhas

# text
seg-849393517c04 = Registros ASCII e binários NovAtel OEM7 (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lê BESTPOS (posição), RANGE (C/No por sinal) e RXSTATUS (o sinalizador de jammer do receptor, como autorrelato da época) de registros OEM7 ASCII e binários, com CRC verificado, somente leitura (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Nenhuma externa como limiar de sucesso. Os layouts de campos e o CRC seguem a documentação pública do OEM7 (docs.novatel.com); a rotina de CRC foi verificada uma vez em relação ao CRC que a documentação declara para o seu próprio exemplo BESTPOSA (citado, não transcrito). As fixtures foram escritas pelos autores; nenhum registro de um receptor real foi lido

# text
seg-a45c53a9deb3 = Leitor de relação portadora-ruído RTCM { "3" } MSM4 e MSM7 para receiver-trust

# text
seg-0a0c9976236f = Lê o C/N0 de toda célula de sinal das mensagens RTCM { "3" } MSM4 e MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de um fluxo de quadros, com CRC-24Q verificado (receiver_trust::machines::rtcm3). Layouts das tabelas do pyrtcm, sob licença BSD, não do texto da norma RTCM.

# text
seg-2af6fc1abe98 = ReferenceImpl em uma verificação pontual, não um teste da suíte: o decodificador do pyrtcm { "1.2.0" } lê os mesmos quadros escritos pelos autores e chega ao mesmo C/N0 e à mesma hora da época. Ele compartilha a fonte de suas tabelas com este leitor, de modo que verifica o tratamento de bits, não o layout. Nenhuma captura de um receptor real ou de uma estação base foi lida

# text
seg-cd554a7c1649 = Adaptador de monitor do GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lê mensagens do GNSS-SDR Monitor (Gnss_Synchro) e do monitor PVT, retransmitidas como linhas JSON com os nomes de campo do proto, para C/N0 por canal, fix, satélites usados, HDOP e céu (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Nenhuma externa: os nomes de campo vêm da documentação do GNSS-SDR; nem o leitor nem o relay.py foram executados contra um GNSS-SDR ativo ou uma captura real

# text
seg-217e5953c128 = Ingestão de registros de IMU, entrada de rumo do giroscópio e ajuste de Allan dos parâmetros dos sensores híbridos

# text
seg-9dadc819daef = Lê um CSV de IMU (colunas documentadas, ou o layout EuRoC); integra a taxa de guinada no rumo que o monitor heading-course lê ([log.imu]); e ajusta os parâmetros de ruído do acelerômetro e do giroscópio dos cenários híbridos e de fusão a partir de um registro estacionário pelo desvio de Allan sobreposto (imu-fit).

# text
seg-9099f3467e9e = Nenhuma externa: o ajuste é verificado em registros sintéticos de ruído branco com coeficientes conhecidos, e o rumo em registros de taxa de guinada constante. Nenhum registro de IMU real foi ajustado, e q_aa não é ajustado

# text
seg-15a852a2dcb0 = Descoberta MQTT do Home Assistant e exportador de estado para a telemetria de confiança

# text
seg-6d6b07b26966 = Um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant para o fluxo de confiança, impressos como texto em todas as superfícies e publicados por MQTT { "3.1.1" } QoS { "0" } pela CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, formato mqtt).

# text
seg-79a8f3864af3 = Nenhuma externa: os pacotes foram lidos por um ouvinte de loopback escrito para o teste, não por um broker real, e o Home Assistant não foi executado

# text
seg-68caf86157c2 = Pacote ROS { "2" } do receiver-trust e ponte gnss_lib_py

# text
seg-e7d7d99fe538 = Uma ponte sem ROS que escreve mensagens de fix e de satélites como NMEA e as pontua pela interface Python (integrations/ros2/kshana_trust), e uma ponte de NavData do gnss_lib_py para o receiver-trust pelo formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Nenhuma externa: o nó ROS não foi executado em um grafo ROS { "2" } ativo, e os nomes de campo de ublox_ubx_msgs não foram conferidos com um driver em execução. O gnss_lib_py (MIT) foi executado para o teste da ponte

# text
seg-c3c260b7063e = Testes

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (PL de referência absorve; PL quebrado não absorvido nunca detectado; veredito de cobertura detectável; a propriedade de honestidade de que nenhum veredito de cobertura/detecção é alcançável para um cenário indetectável)

# text
seg-6d963d838eed = hybrid_integrity::tests (a configuração resolvida é repetida na saída tanto para os valores padrão quanto para as substituições, sem passar o comprimento de onda por uma ida e volta em metros; toda entrada de units traz uma unidade e uma classe de proveniência; todo campo que o bloco units nomeia é de fato emitido, de modo que ele não pode documentar um campo fantasma)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (a disponibilidade é igual ao produto dos dois indicadores recalculados a partir das margens do próprio relatório, e essas margens são, por sua vez, remontadas a partir da EIRP, da perda em espaço livre, da perda agregada, da figura de mérito, do termo de Boltzmann, da taxa de dados e do requisito do próprio relatório até { "1e-9" } dB; o valor é medido como sendo { "0" } ou { "1" } enquanto a disponibilidade óptica na mesma execução é medida como estritamente entre ambos; cada linha de fator traz uma classe de proveniência do vocabulário fechado de field_schema; o alcance de fechamento relatado, executado de novo no orçamento de enlace, devolve uma margem de { "0" } a { "1e-9" } dB e é medido como independente do alcance em que a execução estava ao longo de quatro décadas, enquanto a utilização do alcance se move exatamente pela razão dos alcances; um enlace de -40 dBW relata disponibilidade { "0" }, LOST, e uma utilização acima de { "1" } em vez de uma fração; a nota substituída 'no RF-availability counterpart is computed by this engine' é afirmada como removida e a substituta é afirmada como nomeando o novo campo; uma entrada RF malformada é recusada em vez de truncada)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (a razão é igual às duas pernas emitidas divididas, a { "1e-15" } relativo, e o seu recíproco e as formas em decibel concordam; o alcance e o sigma de tempo de cada perna se relacionam exatamente por c; a configuração comum emitida é afirmada igual ao alcance e ao tempo de integração do próprio cenário e o alcance da perna RF é afirmado igual ao da perna óptica; o C/N0 da perna RF é bit a bit o do bloco de disponibilidade, a partir de um único orçamento de enlace, não uma rederivação; a propriedade de COMPARAÇÃO EM BASE IGUAL é MEASURED em vez de afirmada -- quadruplicar o tempo de acumulação comum reduz à metade a perna óptica a { "1e-12" } e a perna RF a { "1e-7" } e deixa a razão inalterada a { "3.19e-9" } relativo, o que uma perna fazendo média secretamente sobre outra coisa não poderia fazer; uma substituição de rf_dll_bandwidth_hz que quebra o tempo de média comum torna a razão nula com um motivo que nomeia ambos os tempos, enquanto ambas as pernas continuam sendo emitidas; uma execução de via única torna a perna de comparação bit a bit o resultado principal liberado, com um fator de penalidade de exatamente { "1" }, e uma execução de via dupla reproduz a penalidade 0.5/sqrt(return-path geometric loss) recalculada a partir do próprio geometric_loss_db do relatório a { "1e-12" })

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (em três bandas, quatro décadas de alcance e ambos os vereditos de fechamento, a margem e a perda em espaço livre sob ela são recalculadas somente a partir do relatório com melhor que { "1e-9" } dB; o G/T requerido montado a partir dos termos da equação concorda com a mesma grandeza obtida como G/T menos margem, e executar de novo nele zera a margem; três orçamentos com EIRP, perda e limiar muito diferentes, mas com uma constante de enlace igual, dão um requisito idêntico, enquanto { "1" } dB na constante o move exatamente { "1" } dB; a divisão do ganho é ausente a menos que uma temperatura de ruído seja declarada, e uma não positiva é recusada; todo campo que o bloco units nomeia é de fato emitido)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests e lunar_time_budget_scenario::tests (as quatro classes presentes numa só execução e numa ordem de subconjunto solicitada; toda linha concorda com a sua própria forma fechada com melhor que { "1e-12" } relativo; escalar o erro de referencial por k escala o cruzamento por k para um relógio de flicker-FM e por k^{ "2" } para um de white-FM, verificado em k={ "2" } e k={ "3" }, o que separa as duas classes de ruído; cada linha reproduz o cruzamento de relógio único que o orçamento já relatava; toda linha recupera o único termo de referencial compartilhado; um nome de relógio desconhecido é rejeitado)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests e attack_surface::tests (a grade está completa e toda fração capturada está em [{ "0,1" }]; a fração capturada é não decrescente na potência de transmissão em todo nó; ela NÃO é monótona na largura de feixe nem na altitude, o que é fixado por um teste próprio para que a varredura não possa ser suavizada depois; o nó de linha de base reproduz bit a bit a fração capturada existente; a avaliação só de limbo é bit a bit idêntica ao último ponto da varredura completa; um cruzamento localizado fica sobre o limiar a { "1e-9" } dB e é ladeado)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (todos os { "57" } tempos de média x { "8" } termos presentes, o índice da grade vai de { "0" }..={ "56" } e traz { "8" } linhas cada; a linha <c1/> é igual à soma quadrática dos sete termos ao lado dela em todo tau; a tabela segue uma grade solicitada em vez de uma fixa no código; emiti-la deixa o JSON do relatório idêntico byte a byte)

# text
seg-61e51873ef4b = lunar_time_lab (sobre clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: com o direcionamento desligado o termo do relógio é igual ao termo de relógio do orçamento, até o bit, para as quatro classes; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas as classes de ruído; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: o documento padrão, a tabela e o resumo permanecem inalterados e o bloco acrescenta apenas o seu próprio objeto e unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: óptico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, com as curvas de PHM e RAFS se cruzando entre { "7e5" } e { "8e5" } s, fixado como propriedade divulgada dos modelos de relógio de um único tipo de ruído; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (o limite de campo distante coincide com delta_dor; correção de campo próximo; derivadas parciais por FD); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } testes de biblioteca: o semiângulo do limbo da Terra contra a sua forma fechada asin(R/r) com uma asserção adicional de que TODO enlace não ocultado fica fora desse cone, de modo que o teste de ocultação e o ângulo do limbo não possam divergir; o predicado de ocultação verificado no lado próximo, no lado distante e no caso em que o corpo está ATRÁS do transmissor; perda de percurso limitada à faixa plausível de alcance lunar em todo enlace; o conjunto rastreável mostrado como um subconjunto do conjunto geometricamente visível e disjunto do ocultado; monotonicidade em ambas as direções - mais ganho de recepção nunca reduz a contagem, um limiar mais estrito nunca a eleva; nenhum enlace creditado com mais que o ganho no eixo; um receptor dentro da Terra recusado; a varredura afirmada como realmente VARIANDO com a época; e a disponibilidade de sinal versus a de solução afirmadas como distintas, corretamente ordenadas e consistentes com as linhas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fixado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constatação fixada)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (limiar O1: a matriz de transição de estado encadeada ao longo de três dias e de um período é igual à do scipy DOP853 a um relativo de { "1e-6" }; limiar C1: q médio e a fração dentro de 95 %; limiar C2: amostra sobre o traço formal de cada estimador; limiar C3, NOT MET e fixado: com { "3e-10" } m/s2 de aceleração não modelada a ultrapassagem dentro de 95 % é { "0.0525" }, e não ao menos { "0.5" } - a estimativa de bordo é conhecida apenas a centenas de metros, de modo que cerca de dez metros de deslocamento se escondem dentro da sua covariância); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (limiar Q1: sucesso de Monte Carlo ao menos o limite de bootstrap menos três erros-padrão; Q2: nenhuma queda com o comprimento do arco além de três erros-padrão; Q4: o LAMBDA é igual à enumeração por força bruta para { "200" } sorteios de dimensão até cinco; Q3: o projeto float é igual a uma resolução independente em numpy a { "1e-9" } para as covariâncias de ambiguidade e de posição, e a taxa por bootstrap é NOT MET a { "1e-9" }, fixada: ela difere por um relativo de { "1.7e-6" } porque a CDF normal do LAMBDA é uma aproximação de Abramowitz e Stegun)

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (limiar F1: o traço do CRLB não sobe e o menor autovalor não cai com enlaces de orbitadores, no exemplo e em { "20" } conjuntos aleatórios com semente; limiar F2: as derivadas parciais de alcance são iguais a uma diferença finita independente em numpy longdouble do modelo direto de Rodrigues em { "50" } geometrias; limiar F3: o menor autovalor sobe por ao menos 2.0x, encontrado cerca de 111x)

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (limiar T1: os sigmas de translação não caem à medida que a amarração local se afrouxa; T2: com os sigmas das técnicas escalados por { "1e-6" } o sigma de translação de cada par está dentro de { "1" } % de sqrt({ "2" }) vezes o sigma da amarração local, encontrado dentro de { "3e-7" }; T3: a matriz de informação é igual a uma montagem empilhada independente em numpy a { "1e-9" }). A primeira execução de T2 com inversão das equações normais falhou ({ "1.3" } % numa amarração de { "0.1" } m, valores abaixo do piso a { "1" } m); a causa foi numérica e a covariância passou para a via da raiz quadrada antes de o limiar ser reavaliado.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (limiar G1: as derivadas parciais analíticas são iguais a uma diferença finita central de cada modelo direto a { "1e-8" }; G2: a informação 5x5 é igual a uma montagem independente em numpy a { "1e-6" }; G4: a amplitude da maré do relógio e as suas sensibilidades a k2 e h2 são iguais a uma avaliação independente a { "1e-9" }; limiar G3 NOT MET na sua metade do traço, fixado: acrescentar uma família nunca reduz o menor autovalor ({ "28" } de { "28" }) mas o traço da pseudoinversa subiu em { "12" } de { "28" } acréscimos porque a família acrescentada elevou o posto)

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidade de horizonte contra a forma fechada L01; o DOP ampliado por balizas contra o simples; a soma quadrática do orçamento de erro; a relação de DOP para metros); tests/validate_p2_beacon_before_after_table.rs (a tabela inteira de antes/depois fixada a um golden registrado a { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (a mesma geometria por um caminho de DOP INDEPENDENTE, de modo que a ampliação não seja verificada contra o kernel que a produziu); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-b915c06fa3f1 = skyline::PRESETS: quatro geometrias REPRESENTATIVE com as dimensões declaradas na nota de projeto e uma linha de proveniência cada uma: city-street (um cânion, rua { "0" } deg, { "20" } m entre paredes de { "30" } m, antena { "1.5" } m), harbour-approach (setores: aberto para o mar ao longo de { "180" } deg, edifícios do cais { "8" } deg ao longo de { "90" } deg, o quebra-mar { "3" } deg), fjord (terreno: paredes { "600" } m acima da antena a { "1.5" } km de cada lado de um canal norte-sul, queda por curvatura aplicada), container-terminal (setores: pilhas { "12" } deg sobre a metade voltada para terra, lanças de guindaste { "35" } deg e { "25" } deg ao longo de dois setores estreitos); substituíveis campo a campo

# text
seg-aae487789add = Bloco N36W117 do NASA/USGS SRTM v3 (1 segundo de arco) — dados de elevação PUBLIC-DOMAIN do governo dos EUA, do espelho aberto AWS elevation-tiles-prod, decimados para 6 segundos de arco e versionados em tests/fixtures/terrain/ (ver NOTICE.md), mais recortes em resolução total de N36W117 e N36W119, conferidos nó a nó com o leitor SRTMHGT independente do GDAL e com os marcos de levantamento do Monte Whitney ({ "4421" } m) e de Badwater (−{ "86" } m). O marco documentado da Bacia de Badwater (−{ "86" } m, o ponto mais baixo da América do Norte) ancora a leitura georreferenciada. A correção de navegação por correspondência de terreno/TERCOM que consome o DEM permanece modelada (linha própria de PNT alternativo/complementar)

# text
seg-7dfedc40da6a = O bloco opcional [time_lab] do cenário lunar-time-budget modela um relógio de estação de referência lunar (por padrão a classe miniRAFS, ou qualquer classe nomeada, ou uma ficha de dispositivo ajustada a pontos de estabilidade declarados) sincronizado ao Tempo Lunar Coordenado e depois em funcionamento livre ou ressincronizado a cada N segundos: a curva de erro de tempo x(t) como a raiz da soma dos quadrados do termo de lei de potência do relógio, de um resíduo constante de sincronização (ILLUSTRATIVE), de um resíduo constante de realização do LTC e de um termo opcional de taxa por altura da estação; o tempo após uma sincronização até { "1" }, { "10" } e { "100" } ns (ou limiares declarados) por bissecção, ao lado da inversa em forma fechada para o tipo de ruído dominante, e o termo dominante em cada horizonte declarado, tudo com unidades

# text
seg-3801e9b32309 = Somente consistência interna: o tempo bissectado até o limiar é conferido com a inversa em forma fechada do tipo de ruído dominante do relógio, e o termo do relógio em funcionamento livre com o termo de relógio do próprio orçamento. As classes de relógio se apoiam em especificações publicadas de um dia (linhas próprias); a taxa do LTC não é rederivada aqui e mantém sua própria linha VALIDATED (Tempo coordenado lunar); o resíduo de sincronização é ILLUSTRATIVE, o resíduo de realização é uma alocação do orçamento e nenhum modelo térmico está incluído. A meta em nível de nanossegundo descrita no material de PNT Lunar do ICG WG-B de junho de { "2024" } é citada como declaração da fonte, não adotada como afirmação; nada aqui é uma declaração sobre qualquer relógio de estação real

# text
seg-226dedaba243 = Um programa independente em scipy/numpy integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente confere a numérica de fórmulas declaradas, não a física, de modo que a linha permanece MODELLED. Modelo restrito de três corpos: sem Sol, sem harmônicos lunares, com o eixo de rotação da Terra ao longo da normal da órbita, entradas de receptor e de estação ILLUSTRATIVE.

# text
seg-33d506570c1b = srp_shadow::tests (a forma fechada anular, a lei uniforme reproduzindo a sombra cônica, os limites de sol pleno e de umbra)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horários em { "24" } h, LEO, GEO e HEO, terceiro corpo e terceiro corpo + SRP: pior |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; o controle de série analítica erra por { "9.96" } m; Sol { "6.39" } m e Lua { "0.244" } m a partir das posições DE440 do Orekit, uma falha registrada); testes unitários do propagator (recusa do provedor, contagem de fallback compartilhada entre clones)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (o termo S1 é diurno, gira { "90" } deg em um quarto de dia e tem a amplitude de fator de carga de cada linha; magnitude física em LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit em { "8" } pontos fora do eixo: máx. |da| { "2.2e-17" } m/s^{ "2" } em N = { "70" }, sempre executado; { "3.5e-17" }, { "3.9e-17" } e { "7.3e-17" } m/s^{ "2" } em N = { "200" }, { "360" }, { "2190" }, condicionado a dados em KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada a dados: pior |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; controle de grau 70 { "0.726" } m); testes unitários do gravity_sh (concordância com o avaliador clássico a { "1e-13" } no grau { "70" }, diferença finita e continuidade nos polos em um campo de grau 2190, um termo de grau 2190 com underflow contra um cálculo de expoente estendido)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } cenários: taxa de variação da distância, az/el e mistos, LEO e MEO, sem ruído e com sigma semeado de { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } e { "10" } deg, contra o Orekit { "12.2" }: conjuntos visíveis idênticos; valores de medição dentro de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM dentro de { "1.2e-14" } relativo; estados ruidosos dentro de { "1.74" } cm e { "1.14e-5" } m/s; RMS pós-ajuste por tipo dentro de { "2.7e-4" } relativo; kshana sem ruído contra a verdade { "1.06e-8" } m; kshana sem ruído contra o Orekit { "1.464" } e { "1.740" } cm em dois cenários, um desvio registrado em relação ao limiar de { "1" } cm); testes unitários de orbit_determination e batch_ls

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = testes unitários de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (fixture da ESOC de { "8" } h registrada no repositório, sigma de { "0.032" } m a partir do expoente do cabeçalho { "5" }: RMS 3D do Nível 1 de { "0.132" } m inalterado, Nível 2 de { "0.035" } m contra { "0.070" } m com sigma de { "1" } m, sendo a mudança decorrente da restrição empírica a priori reequilibrada); tests/agency_swarm.rs (o produto Swarm não traz códigos de exatidão e recorre ao valor padrão, fixado)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de verificação do CRC-24Q 0xCDE703; resposta ao impulso convolucional; o Viterbi corrige erros injetados; larguras de layout); tests/gnss_navmsg_roundtrip.rs (os bits iniciais dos campos igualam os números de bit do ICD; codificar -> FEC -> entrelaçar -> Viterbi -> decodificar faz a ida e volta dentro de meio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registros Galileo do IGS BRDC 2018-133 na grade de LSB, pior caso { "3.6e-3" } LSB; limiar pré-registrado de contagem de satélites não atingido, { "15" } de { "20" }, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (passagem direta sem ruído; variância de ruído branco 1/(2N-1); reinícios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: erro 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeiras { "4" } épocas do arquivo RINEX { "4.00" } MGEX do IGS MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: os registros do cabeçalho e os valores da primeira época são iguais aos literais publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabeçalho sintético { "4.02" } a partir da especificação)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registros reais C01-C04: raio geoestacionário, longitudes 140.02/80.04/110.55/159.99 deg nas posições publicadas, |latitude| de { "2.13" } deg com a inclinação contra { "6.65" } sem ela; a comparação pré-registrada entre a transmissão e o SP3 preciso depende de dados em KSHANA_BDS_GEO_SP3 e não foi executada); rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (percurso em figure-8: RMS 3-D em regime permanente de { "0.025" } m com a portadora contra { "0.470" } m com o código nas mesmas medições; { "12" } sementes com NIS/dof médio de { "1.00" } e NEES/dof em regime permanente de { "0.92" }; um salto de 1 ciclo detectado em sua época, sem falsos alarmes e com a solução intacta; desligar as correções transmitidas eleva o erro do código de { "0.51" } m para { "19.6" } m (ionosfera) e { "8.0" } m (troposfera); a execução sem ruído converge para { "0.3" } mm)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), cenários gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada pacote: fusão abaixo do INS livre durante a interrupção para ambos os sensores; ferrovia: estreito { "5.3" } m contra frouxo { "12.9" } m em grau de navegação e { "15.6" } m contra { "18.8" } m em grau tático durante a interrupção, disponibilidade { "0.97" } contra { "0.95" }; tabela estreita validada); tests/gnss_ins_legacy_trajectory_pin.rs (o padrão de acoplamento frouxo idêntico bit a bit)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D ao longo de { "60" } sementes: NEES médio da segunda metade de { "8.12" } para { "8" } estados, soma de χ² da última época dentro de sua faixa de { "95" } %; uma correção de relógio de { "0.1" } ns reduz o sigma de posição 3-D de { "5.58" } m para { "3.07" } m; filtro de viés ao longo de { "60" } sementes: soma de χ²({ "5" }) dentro da faixa, viés dentro de { "3" } sigma em { "59" } de { "60" }; fusion-pnt-coupled com acelerômetros enviesados: p95 de posição de { "18.7" } m / { "90.0" } m e integridade de { "1.00" } / { "0.97" } acoplado contra { "430" } m / { "4060" } m e { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sem [coupled] idênticos bit a bit)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (a curva coordenada não tem força lateral e o fator de carga é 1/cos φ; a importação de CSV reproduz um perfil voado com { "1e-3" } m/s e { "1" } m); tests/gnss_ins_trajectory_library.rs (todo perfil é executado e a fusão supera o INS livre durante a interrupção; cada um executa o seu movimento nomeado; observabilidade do rumo: sigma de guinada após { "240" } s de { "1.27" } deg em cruzeiro reto contra { "0.039" } deg em figure-8 e { "0.062" } deg em anda e para); tests/gnss_ins_legacy_trajectory_pin.rs (resultado legado e hashes da verdade idênticos bit a bit)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE março de { "2023" }, { "4" } perilunas e { "5" } apolunas: período { "6.5004" } d contra { "6.5699" } d ({ "1.07" } %, limiar { "3" } %), apolua { "71 182" } contra { "71 215" } km ({ "0.05" } %, limiar { "5" } %), perilua { "3 385" } contra { "3 245" } km ({ "4.1" } %, limiar { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: todas as { "104" } verificações passam na primeira execução após o pré-registro e50c88d2, pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros-padrão, fração da elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos os controles falham como exigido; position_error_is_sigma_times_dop_on_masked_skies: as duas geometrias de horizonte mascarado da nota de projeto, o céu 10sat-mixed sob as predefinições de rua urbana ({ "4" } satélites, PDOP { "16.6" }) e de terminal de contêineres ({ "9" } satélites, PDOP { "2.5" }), todas as { "26" } verificações passam na primeira execução após o pré-registro 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (uma primeira verificação, separada, em quatro céus escolhidos à mão (aberto, agrupado, cânion, meio céu; sigma de { "1" } m, semente 0x0D0B5EED) com intervalos de confiança de qui-quadrado a { "1e-6" } no total ao longo de { "20" } verificações: razões de { "0.987" } a { "1.009" }, PDOP/GDOP do próprio solucionador iguais aos do kernel até { "2.5e-12" }, e controles negativos para um erro de DOP de { "10" } % e erros de 1/sin(elevação); executada antes do pré-registro, portanto é relatada, não pré-registrada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: na passagem sintética por um fiorde de scenarios/training/fjord-natural-degradation.toml, as mesmas { "624" } épocas são deduzidas com e sem o [skyline] declarado; com ele, sky-blocked é informado em { "680" } épocas ({ "0" } sem ele: a alternativa de lacuna de azimute não vê nada em um fiorde de dois lados), open_fraction é { "0.758" } e as épocas da classe de ambiente caem de { "78" } para { "33" }, sendo o restante perdas de satélites que o horizonte declarado deixa a céu aberto; fora do evento o horizonte não altera nenhuma pontuação); receiver_trust::geometry::tests (razões derivadas à mão nos limiares, as bordas dos limiares, a rampa e o teto, o piso, as bordas dos rótulos, as substituições de [geometry], o DOP sobre o kernel validado, céus mantidos e expirados, desconhecido não presumido, perda de sinal, a tolerância à geometria ruim, sentinelas de ausência de posição); tests/geometry_trust.rs (um céu mascarado razoável rotulado e não pontuado, um céu mascarado ruim, uma perda em baixa elevação, uma queda de potência, um HDOP forjado, perda total de sinal, um arrastamento durante geometria ruim, geometria desconhecida, substituições de sessão, o esquema ao vivo); tests/geometry_trust_no_change.rs (ambas as sessões de exemplo idênticas byte a byte à { "0.35.0" } depois de removidas as chaves acrescentadas); tests/geometry_corpus_identity.rs (todo corpus NMEA de embarcação publicado no repositório, também como céu aberto apenas com GPS, e os cenários de treinamento de tripulação: idênticos byte a byte à { "0.35.0" } exceto nas épocas ruins, que diferem apenas pela dedução de geometria)

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (o kernel de relógio único contra o gnss_lib_py)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (contra a recursão de covariância de Kalman em vários passos; FM branco exato; ida e volta); kernel de variância de deriva validado externamente em tests/gnss_denied_clock_holdover_reference.rs (contra scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pré-registrada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; depende de dados)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pré-registrada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-3016100a7015 = clock_state::tests (Q analítico de van-Loan; NEES; positividade da PSD); tests/clock_state_reference.rs (trajetória completa de predição + atualização — estado x e covariância P de { "3" }×{ "3" } ao longo de { "1925" } passos / { "4" } conjuntos de parâmetros contra o filterpy { "1.4.5" }; pior |relΔ| de { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fixa a constatação); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 rodada { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelamento recíproco; identidade de Sagnac em duas formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circum-navegação equatorial = { "207.386" } ns contra os { "207.4" } ns publicados por Ashby, com diferença < { "0.05" } ns; além disso, a geometria de Sagnac/geodist verificada de forma cruzada contra o geodist() do RTKLIB { "2.4.3" } compilado a partir do código-fonte em C)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (SSC próprio do BPSK = 2/3R_c; PSD de área unitária; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (correlação cruzada/autocorrelação de Gold do GPS C/A com coincidência exata de inteiros contra a geração de código independente do IS-GPS-200; PSD de BPSK-R({ "1" })/BOC senoidal({ "1,1" }) contra um periodograma independente do scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fixado)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; T² de Mach-Zehnder; intervalo do piso de Freier-2016); tests/quantum_inertial_sensor_reference.rs (função de transferência |H(ω)|, k_eff·T² e ASD do ruído de disparo contra os vetores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fixado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max fica na borda de meia franja de ±π com o escalonamento de faixa 1/T²; a recuperação da fase desdobrada é exata dentro de [−a_max,a_max] e sofre aliasing de exatamente { "2" }·a_max fora dela; a faixa dinâmica não ambígua a_max/σ_a=π/σ_Φ é idêntica para dois fatores de escala de comprimento de onda/T muito diferentes; os métodos de CaiAccelerometer coincidem com as funções livres)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (viés contra o integrador AccelModel; VRW contra a integral analítica); tests/quantum_inertial_dead_reckoning_reference.rs (VRW contra uma dupla integração de Monte Carlo independente em numpy do ruído de aceleração branca, desvio máximo de { "0.42" }% dentro de ±{ "3" }% ao longo de { "6" } tempos de deriva; viés/fator de escala contra um valor de forma fechada de Groves { "2013" }; ida e volta do holdover)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form e cw_q_equals_the_spectral_separation_closed_form: a tabela de Q, CW e banda estreita { "1" }, banda larga e varrido { "2" }, fixada às formas fechadas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efetivo contra uma nova dedução independente em numpy do orçamento de enlace de Kaplan & Hegarty §{ "9.4" }; o C/N₀ real do JammerTest cai monotonicamente através do limiar de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (pré-registrado, bloqueado, não executado)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterização dos parâmetros do TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fixa a constatação); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referências independentes de forma fechada + CUSUM); examples/tpl_jammertest.rs (calibração de spoofing real do JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fixa a constatação); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondência de mapa; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (o benchmark de 60 min sem GPS sobre o campo real de grau 70 do EGM2008, pré-registrado em xval/icgem-egm2008/: correspondido { "3106" } m, portanto o limiar de < { "500" } m é NOT MET e afirmado como não atingido, e o corte de dez vezes sobre a deriva de { "70.6" } km é MET; além do Monte Carlo semeado de erro de mapa); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel e tests/emag2_real_grid.rs (leitor EMAG2v3 dependente de dados sobre um recorte real; nenhum resultado de navegação afirmado sobre ele); tests/terrain_slam_rbpf.rs (estimação conjunta de mapa, um RBPF no estilo FastSLAM, contra o SITAN de mapa conhecido sobre um erro de mapa correlacionado de { "15" } m ao longo de { "20" } sementes, pré-registrado em xval/terrain-slam-rbpf/: ganho médio de { "1.5" }% e melhor em { "10" } de { "20" }, portanto os limiares de { "10" }% e de 12 de 20 são NOT MET e afirmados como não atingidos; nenhum prejuízo em um mapa perfeito, MET)

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (o SBOM gerado valida com zero erros contra o esquema JSON oficial do CycloneDX { "1.5" } em todo o grafo distribuído de 66 componentes: recursos default + python + wasm, dependências de desenvolvimento excluídas)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfeita=1/idêntica=0.5/empate={ "0.125" }, ROC monótona, fusionado>{ "0.8" }, separação de camadas por classe, proteção contra vazamento, corpus reproduzível, sinalizadores de mudança de distribuição indicam otimismo); dominance_demonstrators (alcançável + reproduzível + MODELLED-não-VALIDATED + lacuna de otimismo autoconsistente)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC da referência independente por classe≈{ "1" }, lacuna de otimismo aprendida>{ "0" }, formato da grade + IC bootstrap contém a média + tendência de escala positiva, características de ID finitas, o preditor da lacuna supera o de prever a média sob AMBAS as validações cruzadas leave-one-detector-out e leave-one-class-out + determinístico); impairment_ml::tests (logreg separa + determinístico + perda↓, o MLP resolve o XOR que um modelo linear não resolve + semeado); eval_stats::tests (bootstrap/DeLong/Spearman/ridge contra formas fechadas)

# text
seg-e0f68f57399d = quantum_trade::tests (recuperação de ida e volta do ADEV, não negatividade do NNLS, ressalva de piso presente/ausente, benefício>{ "1" }, envelope monótono + limite de alt-PNT); dominance_demonstrators (o ADEV medido é guiado por dados e não presumido por piso, a classe presumida sinaliza piso + ressalva, curva malformada rejeitada, MODELLED-não-VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exato nos pontos da grade + ida e volta + monótono, média de Ap diário, T exosférica contra âncoras publicadas de mínimo/média/máximo solar + incremento de tempestade, densidade igual a um na referência, oscilação do ciclo solar dentro da faixa observada de { "5" }–{ "10" }×, cenário reproduzível + MODELLED-não-VALIDATED + rejeição de fora da faixa); dominance_demonstrators (alcançável + reproduzível + T física + MODELLED-não-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (lançamento para leste alcança i=latitude, KSC→ISS = { "45" }° de livro-texto, polar = N/S, i<lat inalcançável, bônus equatorial de { "465" } m/s, mudança de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, contagens de oportunidades diárias, cenário reproduzível/MODELLED + trajetória dogleg); dominance_demonstrators (alcançável + reproduzível + KSC→ISS { "45" }° + MODELLED-não-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (g de pico independente do coeficiente balístico + faixa física de g, cresce com γ mais íngreme / entrada mais rápida, a velocidade do g de pico = V_e·e^(−1/2) e o aquecimento de pico = V_e·e^(−1/6) mais rápido, a altitude do g de pico física + mais profunda para B maior, cenário reproduzível/MODELLED + geometria degenerada rejeitada); dominance_demonstrators (alcançável + reproduzível + fração V_e·e^(−1/2) + MODELLED-não-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (apenas verificação cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueado, não executado)

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (custo por cobertura deduzido à mão 48/96={ "0.5" }, razão de ROI { "2.667" }, ordenação dos intervalos + proteções contra cobertura zero)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (a mesma detecção perdida passa de Available→MI→HMI à medida que o contexto se aperta; PL conservador→Unavailable; HMI por eixo; proteções de entrada)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (o VRW físico cai dentro do intervalo de VRW citado em todos os { "3" } níveis; faixa bruta de ambiguidade de franja calculada a partir de k_eff·T²; o orçamento conservador deriva mais que o melhor; todo intervalo com fonte + sinalizado para confirmação; proteções de ordenação dos intervalos)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatro regiões + fronteiras inclusivas + |erro| + indisponibilidade por PL>AL); tests/tib_scorer_reference.rs (contagens de classificação contra numpy independente em um conjunto sintético fixo)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpo/subdelimitado/tudo indisponível/vazio); tests/tib_scorer_reference.rs (contagens + taxas + coverage_ok contra numpy até { "1e-12" })

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfis de deslocamento, deriva monótona, sinalização do conjunto indetectável, consistência de max_offset, exatamente duas classes indetectáveis)

# text
seg-f8ac8be96a63 = cmpl_horizontal delimita o erro horizontal de posição de k sigma contribuído pela classe cega de modo comum, formando blind_position_covariance = S<em>Cov</em>S^T e projetando-a em ENU; integrity_envelope informa hpl_total = hpl_araim + cmpl. A distinção que o par existe para fazer: o teste de RESÍDUO do RAIM/ARAIM é comprovadamente cego a erros em range(G), mas o NÍVEL DE PROTEÇÃO do ARAIM não é — o seu termo livre de falhas já os delimita até uma URA do provedor mais o viés nominal. O CMPL é, portanto, apenas o EXCESSO entre provedores que a URA/ISM por provedor de um único provedor não sobredelimita, e a soma é um limite conservador por desigualdade triangular, e não uma RSS, válido apenas onde esse excesso ainda não está dentro da URA.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (posto deficiente sem linhas de base com a Terra; três linhas de base restauram o posto completo — o limiar de 3 estações vem do posto da informação, não de erro de solução; CRLB das estações atingido pelo estimador com eficiência { "0.98" }; o CRLB se aperta monotonicamente com as linhas de base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices do IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registradores de comprimento máximo, balanço de Legendre, ida e volta do atraso de G2, composição de níveis); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sem o cache do LSIS: quatro números citados fixam a constatação; com ele: { "2 937 232" } chips e bits contra os arquivos do Anexo { "3" } do LSIS, primeiros/últimos { "24" } chips impressos, as Tabelas D-1 e E-1 de Legendre e as inicializações de G2 dão exatamente um item divergente, a célula 'últimos { "24" } chips' do PRN { "147" } da Tabela E-5, que duplica a do PRN { "151" }, enquanto o arquivo do Anexo { "3" } concorda com o gerador); o teste estrito pré-registrado afs_codes_match_lsis_v1_tables_and_annex3_bit_exact é ignorado com essa lacuna

# text
seg-8cd700abad59 = lunar_afs::waveform (gravação e rótulos de verdade), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (terceiro pré-registro: { "2" } nós, { "4" } canais rastreados, pior erro de Doppler { "0.57" } Hz, pior erro de deslocamento de código { "0.008" } chip, todos os { "6" } quadros decodificados com o TOI correto através da virada de { "99" } -> { "0" } e subquadro { "2" } coincidente; G0 não atingido como escrito, a própria variação entre execuções do receptor em seus registros de aquisição); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segundo: { "5" } violações); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primeiro: nulo); os testes estritos dos três arquivos são ignorados com suas lacunas

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (constatação fixada); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (estrito, ignorado com a lacuna); gps_lnav::tests

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (constatação fixada); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (estrito, ignorado com a lacuna)

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } blocos contra o intervalo binomial de { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razão { "0.0131" } contra { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } contra { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estrito, ignorado com a lacuna); testes de iq::campaign::detect; testes de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (os digests fixados permanecem inalterados sem a tabela)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } em eventos declarados que não atenuam nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estrito, ignorado com a lacuna); testes de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura de PI90 de { "0.891" } sobre { "558" } faixas, { "0.900" } sobre { "10" } eventos de tempo até a perda sob cada modelo de travamento), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash e vereditos de [validation], auditoria do bloco de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db e bar_b_prime_ci_subset (estrito, ignorado com a lacuna); bar_b_prime_full_set_of_50_campaigns (ignorado, executado antes do lançamento); testes de iq::labfit::cn0 (degenerescência exata Q-delta, recuperação de delta no Q declarado, inversa do limiar de forma fechada); testes de iq::labfit::iqfit (as condições do modelo de travamento reproduzem exatamente o modelo de C/N0); tests/iq_labfit_followup.rs (o acompanhamento registrado em 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign afirmando o NOT MET registrado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, em release)

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constatação fixada); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estrito, ignorado com a lacuna)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites do arquivo de transmissão do IGS de { "2" } de março de { "2025" }: { "960" } de { "960" } palavras passam na paridade do RTKLIB, { "96" } de { "96" } subquadros decodificam, { "608" } de { "608" } inteiros transmitidos decodificados são iguais aos do Kshana, toda entrada dentro de meio quantum, semana e tempos exatos); gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constatação fixada, depende de dados); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estrito, ignorado com a lacuna); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constatação fixada, depende de dados); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estrito, ignorado com a lacuna)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constatação fixada, depende de dados); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constatação fixada, depende de dados); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (o modo comum do relógio cancela exatamente; o resíduo cresce com a linha de base; reutiliza o PL de SBAS; a contagem de satélites é respeitada até o limite de { "24" } do construtor, de modo que uma constelação maior não pode devolver silenciosamente uma menor); tests/lunar_differential_pnt_reference.rs (resíduo de diferença simples + solução de posição por WLS contra lsq() do RTKLIB compilado a partir do código-fonte em C)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (o OEM traz REF_FRAME/TIME_SYSTEM lunares; os metadados de tempo fazem a ida e volta; envelope KIF); tests/lunar_interoperability_export_reference.rs (o OEM lunar emitido pelo kshana relido pela biblioteca Python independente <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época até a precisão do formato; uma exportação corrompida é rejeitada); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonicidade, limites do composto, teto de nível, proveniência modelada); resilience::diversity::tests (Simpson inverso, modo comum, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemplo manual de tau de Kendall, simplex de Dirichlet, taxa de inversão); resilience::study::tests (controle de estabilidade, testemunha de instabilidade, declarado contra medido, colapso de diversidade)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validado-exige-âncora-externa, modelado-exige-lacuna, modelado-teto-de-TRL, faixa malformada, campos JSON)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridade do benefício maior/menor é melhor, encapsula fielmente um TradeResult real, evidência desonesta rejeitada, FoM validado exige âncora externa, JSON determinístico)

# text
seg-fe77856b9e9d = quantum_devices::tests (cartões de relógio honestos + ordenados; precisão do emaranhamento ~1/sqrt(tau); taxa detectada -10x/10dB; contagens no escuro degradam; limites do piso sistemático; cartão modelado + válido)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (a precisão melhora com a integração; o quântico pode ganhar E perder; PL finito-positivo; FoM de segurança em [{ "0,1" }] e cresce com o atraso do ataque; Pd de anomalia monótono; o trade is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (o quântico supera o clássico em uma interrupção longa; a vantagem depende da interrupção; o trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (crescimento da posição por navegação estimada contra uma dupla integração independente em Octave + a âncora de ruído publicada de Freier-2016)

# text
seg-8e49ee940482 = quantum_faults::tests (valores conhecidos da AUC analítica; a AUC bootstrap empírica contém a forma fechada; o quântico detecta falhas menores / AUC maior; a vantagem desaparece para falhas enormes; catálogo de 5 classes; o trade is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA direto→inverso sem ruído até { "1e-6" } m; J·CRLB=I com uma covariância simétrica definida positiva; o traço da variância de posição do CRLB não aumenta quando um receptor é acrescentado; TDOA+FDOA conjunto recupera posição+velocidade de um emissor em movimento; < { "4" } receptores rejeitados); tests/geolocation_reference.rs (idas e voltas sobre quatro geometrias com uma rede 3-D diversa; o estimador de Gauss–Newton atinge o seu limite de Cramér–Rao — a covariância empírica do erro acompanha o limite analítico ao longo de { "4000" } ensaios de Monte Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound e finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fixados)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registra { "746" } W/cm2 para a Stardust sem um limiar)

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (a equação de duas vias recupera o deslocamento exatamente; o termo de Sagnac é igual à forma fechada de laço do BIPM; o termo ionosférico segue a divisão de frequência e a troposfera cancela; a fase flicker tem um TDEV plano; um resíduo diurno eleva o TDEV perto de meio dia; um viés de reciprocidade desloca o deslocamento e não o TDEV; a estabilidade da série remove uma taxa); time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (limiares pré-registrados A1-A3 contra a referência independente mpmath: { "216" } pontos da grade de Rytov, pior erro relativo { "3.4e-7" } contra um limiar de { "1e-6" }, cintilação pior { "4.5e-16" }, fator de abertura pior { "5.7e-16" }, { "96" } probabilidades de desvanecimento gama-gama, pior { "1.3e-12" } em log10, profundidade óptica de nuvem e de ar limpo pior { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (limiar A5: o orçamento de enlace de perda agrupada e as saídas existentes de disponibilidade de local são idênticos bit a bit ao commit base ao longo de { "1,000" } conjuntos de parâmetros)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (limiar A4: rho = { "0" } é igual à união independente e rho = { "1" } ao melhor local único até { "1e-12" }, e zero violações de monotonicidade no número de locais e na correlação; a primeira execução deste limiar errou por { "3e-9" } porque a CDF normal em uso era a forma de Abramowitz-Stegun de { "1.5e-7" }, um defeito de implementação substituído pela CDF da gama incompleta com o limiar inalterado); optical_weather::tests e optical_sitediv::tests (margem monótona, o teto de nuvens como forma fechada, as identidades de duração de indisponibilidade, inversão da busca de margem)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (limiar A6: o erro de temporização por indisponibilidade é igual a holdover::coast_phase_sigma e o erro de distância é igual a phase_to_range_m bit a bit ao longo de { "9" } relógios, { "3" } durações médias, { "3" } dispersões e { "4" } quantis); optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (limiares T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixados antes da primeira execução: mesma semente mesmos bytes e outra semente outros bytes; nenhuma chave sem a tabela; ao longo de { "8760" } h a { "600" } s, sementes { "37" } e { "38" }, a disponibilidade realizada de cada um dos três locais padrão dentro de { "6" } pontos da declarada (pior { "3.3" }) e a fração de nuvens realizada dentro de { "5" } pontos da probabilidade declarada (pior { "2.1" }); a margem é igual ao orçamento menos os dois desvanecimentos e up é igual a margem não negativa em todo passo; nenhuma chamada matemática não portátil no módulo; execuções longas demais e passos inválidos recusados)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK tipo { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (um ODF real da MRO, 2007-304/305, contra o seu rótulo PDS: contagem de registros, posições de grupos, estações, horários de início e fim e tipos de dados conferem; a contagem de linhas da tabela de fim de arquivo erra por um, uma inconsistência do rótulo, fixada como constatação); odf::tests (ida e volta de registro construído à mão, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (depende de dados, entradas com SHA-256 fixado, CI mensal com dados reais exigido: Doppler previsto a partir da reconstrução de navegação da MRO mro_psp5 nas passagens pontuadas DSS { "63" } e DSS { "14" }, { "12.5" } mHz RMS, limiar { "30" } mHz, atingido; a determinação de órbita registrada não produziu órbita, fixada como constatação; execução { "2" } com um estimador amortecido, registrada separadamente: órbita { "0.36" } km RMS e { "0.53" } km no máximo contra mro_psp5, atingido, Doppler pós-ajuste { "48.6" } mHz contra { "30" } mHz, não atingido, fixado como constatação; leitor de SPK tipo { "1" } contra o CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } sementes, NEES médio de seis graus de liberdade na segunda metade dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (uma janela que termina exatamente quando a seguinte começa não disputa, e adiantá-la em um segundo custa exatamente um segundo — a proteção contra erro de uma unidade; janelas sobrepostas além da contagem de aberturas colocam a sessão de menor prioridade em indisponibilidade, com o intervalo de disputa fixado; a política de arbitragem decide qual serviço detém a abertura, com os números das três políticas fixados em um único plano; o primeiro a chegar, primeiro a ser atendido não preempta uma sessão que já detém uma abertura; uma sessão que perde a arbitragem em seu início adquire uma abertura quando uma é liberada; os três deveres contabilizam cada segundo de abertura disponível em { "3" } políticas × { "4" } contagens de aberturas; acrescentar uma abertura nunca aumenta a indisponibilidade de nenhuma sessão, medido em { "200" } planos pseudoaleatórios × { "3" } políticas × toda contagem de aberturas; aberturas suficientes para todas as sessões não deixam nenhuma indisponibilidade; o horizonte de relatório recorta o plano e define o denominador do dever; uma lista de passagens previstas se torna um plano de contatos sem um segundo tipo de janela; os números de dever do plano incluído são saídas do motor para uma e duas aberturas; o relatório declara a política que produziu os números; toda figura relatada traz uma unidade e uma classe de proveniência; o cenário é reproduzível e se declara MODELLED; o cenário rejeita um plano que não consegue escalonar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (compondo jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } testes de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; invertendo jamming::effective_cn0_dbhz, jamming::j_over_s_db e jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } testes de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (a curva de poder de detecção vai da taxa de falso alarme com falha zero até { "1" } − P_md no viés mínimo detectável; o viés mínimo detectável devolvido por noncentral_chi2_cdf no limiar que o próprio monitor aplicou devolve P_md a { "1e-9" }, em todo eixo e pelo auxiliar público; um viés realmente injetado na estimativa de RF desloca a própria estatística do monitor exatamente por b²/(σ_rf² + σ_opt²) calculado à mão; um viés sem ruído é capturado acima de √(T/λ*)×MDB e perdido abaixo dele, com a escada injetada atravessando esse cruzamento; o poder de detecção é monótono na magnitude da falha e idêntico nos quatro eixos em múltiplos do MDB; um Monte Carlo semeado de 200,000 amostras da estatística do monitor reproduz o poder analítico dentro de 4σ em quatro pontos da curva; o MDB de temporização é fixado acima do limite de alerta de temporização, o que é uma fraqueza medida e não uma característica; mede-se que o quantil de Wilson-Hilferty discorda do limiar exato do monitor em ~{ "4" }%, registrando por que não foi usado; a figura de rampa é exatamente MDB/taxa e escala inversamente com a taxa, e uma taxa não positiva relata nulo em vez de zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (a deriva começa exatamente do traço de covariância que o bloco de transferência relata, nos dois sentidos, de modo que a diagonal reproduzida não pode divergir da transferência relatada; o tempo de cruzamento relatado é recalculado a partir do sigma de transferência, da PSD de ruído de processo e do fator de cobertura do próprio relatório, e o limite fica dentro do limite de alerta logo antes dele e fora logo depois; o tempo de deriva escala exatamente de forma inversa à PSD de ruído de processo e encurta quando o limite de alerta se aperta; uma deriva com PSD zero relata nulo em vez de um tempo zero, porque nunca não é imediatamente; o perfil emitido cruza exatamente uma vez e delimita o cruzamento relatado; o tempo de duplicação da variância e o tempo de cruzamento do limite de alerta são fixados separados, diferindo em oito ordens de grandeza após o estágio óptico apertado e em menos de uma ordem de grandeza após o estágio de RF frouxo; deixar a modalidade óptica rende mais tempo de deriva do que deixar a de RF, exatamente pela diferença de covariância dividida pela taxa de crescimento horizontal; e random_walk_time_to_limit distingue já-fora, cruza-em-t e nunca-cruza)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests e lunar_service::tests (o cruzamento de meia potência localizado por bisseção sobre o padrão coincide com o x de Airy publicado = { "1.61634" } e produz a largura exata de { "1.02899" }·λ/D, registrando que o coeficiente convencional { "1.02" } fica em −{ "2.955" } dB e não em −{ "3.010" } dB; o padrão é estritamente decrescente em { "400" } pontos do eixo até o primeiro nulo; a álgebra de eficiência implícita faz a ida e volta até { "1e-12" } e reproduz { "0.641" } / { "0.920" }; o ângulo fora do eixo coincide com tan θ = R·sin γ/(r − R·cos γ) em { "20" } pontos e ambos os limites até { "1e-12" }; o cone aproximado contém o feixe real linha a linha; as contagens principais são iguais aos sinalizadores por linha que resumem e a correção é igual à sua diferença; todo veredito de linha é recalculável apenas a partir do relatório emitido; todo campo numérico e booleano emitido tem uma unidade e uma classe de proveniência; uma abertura impossível não emite bloco; sem antena configurada a exportação mantém exatamente as suas seis chaves preexistentes, { "0" } folhas alteradas e { "0" } removidas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (compondo sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter do discriminador de Costas em malha aberta contra sdr::correlate avançado passo a passo sobre FI sintética semeada, { "3" } realizações de ruído agrupadas × { "900" } épocas, concordando a { "0.63" }% em 35-45 dB-Hz, com o termo de perda de elevação ao quadrado exigido a se ajustar pelo menos { "3" }× melhor que a forma sem perda de elevação ao quadrado onde quer que seja resolvível; a saturação do discriminador atan em ~{ "32" } dB-Hz afirmada e não apenas declarada, de modo que o limite de validade é fixado; σ em malha fechada contra uma malha de Costas sdr avançada passo a passo ao longo de { "4000" } épocas a { "3.7" }%; atraso de rampa do DLL de primeira ordem contra um DLL sdr avançado passo a passo a { "0.17" }%; bessel_i0 contra I₀ tabelado a { "7.4e-8" }; a largura de histerese exigida a cair em [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] em { "4" } razões × { "2" } tempos de integração × { "3" } larguras de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (compondo lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } testes de biblioteca: toda grafia de datum faz a ida e volta por parse/as_str e uma desconhecida é recusada; manter fixas todas as estações sem o farol é recusado com um erro que nomeia <c1/>; o braço de alavanca é afirmado IGUAL a ρ/B e a equipartição do farol IGUAL à equipartição da estação multiplicada por ele, ambos a { "1e-15" }, com uma afirmação adicional de que o braço de alavanca excede { "10" }, de modo que os dois orçamentos não sejam confundíveis nesta geometria; a linha de base publicada da fixture é fixada em { "10726.748" } km e afirma-se que a sua programação de 49 amostras produz estritamente menos de { "49" } observações de visibilidade mútua; mede-se que o espectro do farol em uma única linha de base abrange pelo menos cinco décadas e a razão resultante é afirmada acima de { "1" } por AM-HM e acima de { "100" } de fato; afirma-se que o layout estação-mais-farol tem posto deficiente com AMBOS os campos calculados nulos enquanto o termo de comparação modelado ainda é relatado. Mais uma proteção sobre a própria fixture: uma chave de nível superior inserida depois de um array de tabelas passa a ser dado de estação, de modo que o ponto de inserção é afirmado e verifica-se que o cenário analisado traz a chave — o modo de falha é uma execução que usa silenciosamente uma configuração diferente da que o teste nomeia)

# text
seg-08708f044bb5 = lunar_dpnt::tests (uma proteção puramente aditiva cujo delta de conjunto de chaves é exatamente { "{" }correction_link, units{ "}" } com todo valor preexistente idêntico bit a bit contra literais capturados antes da mudança; o erro de levantamento NÃO se descorrelaciona com a linha de base enquanto o termo de órbita sim, e sobrevive a uma linha de base zero onde o termo de órbita é exatamente zero — a verificação estrutural que detecta ligar o termo no lugar errado; um erro de estação de { "1" } m transfere { "1" }:{ "1" } e comprova-se que não é amplificado pelo DOP; latência zero reproduz o resíduo não envelhecido bit a bit e o resíduo é monótono na latência, com a curva emitida igual a execuções diretas; o passo de quantização cai exatamente pela metade por bit e σ² = passo²/12, e o fundo de escala acompanha as magnitudes injetadas; cada termo desligado por vez recupera os outros dois em quadratura; σ igual por satélite se propaga exatamente em σ·PDOP e esse PDOP concorda com orbit::dop; todo campo emitido traz uma unidade e uma classe de proveniência, verificado nos dois sentidos)

# text
seg-810a6946b5cd = lunar_station (sobre lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: a { "1e-12" } m com e sem ruído do receptor; zero_baseline_floor_is_zero_in_every_trial: { "0" } a { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro da faixa de { "5" } % declarada antes da execução; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (o recálculo numpy pré-registrado, registrado com a sua falha); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs e os goldens do registro e de plataforma cruzada inalterados (aditividade); tests/field_units_global.rs (todo campo emitido descrito, sem isenção)

# text
seg-641b41572fd9 = lunar_terrain (sobre skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: a marcha do raio reproduz -acos(R / (R + a)) a { "1e-3" } deg em todo azimute; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: o mesmo cone amostrado em um ladrilho de latitude/longitude de { "0.005" } deg concorda com o cone analítico a { "0.25" } deg; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: uma cratera de fundo plano sobre a esfera, observador no centro e a { "4" } km e { "7" } km dele, contra a elevação da borda de forma fechada atan2((R + H) cos s - (R + a), (R + H) sin s) com s da equação esférica de cruzamento da borda, a { "0.01" } deg em todo azimute; rasterised_cone_matches_the_analytic_cone: um cone rasterizado em uma grade estereográfica polar de { "200" } m e lido pelo amostrador da grade concorda com o cone analítico a { "0.25" } deg; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos os tipos de cenário; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 mantém a sua contagem plana e as épocas que um horizonte custa são terrain_masked (a própria disponibilidade pode subir, porque um horizonte pode esconder um satélite que a estação não vê), e um horizonte de { "89" } deg na estação não deixa nada disponível; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: os fundos das crateras Shackleton e Haworth baixos, o maciço de Malapert alto, a imagem espelhada não; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: um ladrilho reamostrado a partir do recorte incorporado dá à estação o horizonte do recorte a { "0.22" } deg (limite { "0.5" } deg, fixado antes da execução), com o eco do ladrilho e as unidades, e dem_path com dem_tile_path recusado; the_export_site_is_masked_by_the_terrain: toda linha de exportação libera o terreno exatamente quando está visível e no horizonte do local ou acima dele em seu azimute, a geometria não se move, o CSV ganha a coluna apenas com terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs e os goldens do registro e de plataforma cruzada inalterados (aditividade)

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma amostral sqrt({ "2" }) a dentro de { "6" } %; station_multipath_is_gauss_markov: correlação de lag 1 exp(-dt / tau) dentro de { "0.01" }, variância unitária dentro de { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs e os goldens inalterados (aditividade)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: o erro de enlace com crescimento ativado menos o com crescimento desativado tem sigma amostral taxa tau / sqrt({ "3" }) dentro de { "6" } % em { "1600" } sorteios; linear_growth_is_the_first_order_propagated_error: um erro de velocidade dv propagado com o integrador de dois corpos do repositório a partir da órbita do cenário move a posição por dv tau até { "1" } % a { "60" } s e { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorado, o adendo registrado)

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: igual a lunar_dpnt::position_error_vector_from_range_errors a { "1e-8" } m, uma linha de altura frouxa não altera nada, uma apertada fixa o erro de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: toda figura a { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorado, o adendo registrado)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (as figuras registradas contra os limiares registrados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorado, cerca de { "7" } s em release: reexecuta os seis casos registrados e afirma as figuras registradas)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, o risco não monitorado dentro de P_THRES, um subconjunto que remove três ou mais satélites monitorado, e mais de dez probabilidades a priori monitoradas rededuzidas de forma independente como P_no fault q^k a { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: nenhum alarme sem falha, e um viés de { "30" } m em dois satélites detectado com o par como o subconjunto de maior separação normalizada); tests/araim_reference_vectors.rs e tests/integrity_araim_stanford_oracle.rs inalterados (o caminho de ordem 2 é o verificado pelo MAAST)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (despacho de clock)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: figuras de holdover inalteradas, { "111" } épocas negadas indisponíveis sem nível de proteção, recusado com execuções > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: o HPL e o VPL de toda época amostrada são exatamente iguais aos de um snapshot_raim de resíduo zero no mesmo céu predefinido, e a execução sem falha não levanta alarme; a_stated_bias_is_detected_while_it_lasts: um viés de { "60" } m alarma exatamente nas { "10" } épocas que cobre; every_integrity_field_has_a_unit); clock_integrity::tests; os goldens de clock inalterados

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests e observability_gramian::tests (o documento padrão fixado bit a bit por FNV-1a de seu JSON, resumo e SVG, com valores padrão explícitos afirmados como não alterando nada e as oito chaves de extensão afirmadas AUSENTES, de modo que a captura não possa ser regenerada em uma autocomparação; o bloco aditivo <c1/> excluído do congelamento por ser removido e recalculado o hash contra a constante fixada antes de ele existir, o que prova, em vez de presumir, que nada já lançado se moveu; invariância do posto sob um sigma homoscedástico afirmada em σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado como escalando exatamente de forma linear com σ a { "1e-6" } relativo; o espaço nulo da DRO afirmado como sendo exatamente os eixos de coordenadas z e ż com as duas causas separadas — uma linha de distância entre espaçonaves coplanares tem û_z = { "0" }, e o bloco fora do plano do CR3BP se desacopla exatamente em z = { "0" }; jacobianos espaciais contra diferenças finitas centrais e contra o observável independente de taxa de variação da distância 3-D do crate; famílias fora do plano recusadas no modo planar)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests e tests/operational_eop_predictor_reference.rs (recuperação de coeficientes de sinal analítico a { "1e-9" } em uma janela de 365 dias; um ajuste de viés mais taxa igual à inclinação e ao intercepto de mínimos quadrados ordinários de forma fechada a { "1e-12" } em linhas reais; DOIS detectores de antecipação que destroem as colunas rápidas de UT1 e de polo de toda linha após a época de emissão — deixando intactos os finais do Bulletin B — e exigem saída idêntica bit a bit, verificados por mutação a deixar { "10" } testes vermelhos quando a barreira do ajuste é afrouxada em exatamente um dia; uma lista de épocas reconstruída de forma independente; o bloco do Bulletin B de um alvo apagado e a época mostrada saindo da tabela; admissão de termos verificada em janelas de { "6" }, { "15" }, { "150" } e 365 dias; contagens de linhas monótonas; e uma captura congelada anterior à mudança do relatório padrão afirmada campo a campo sem tolerância, que afirma adicionalmente que a captura não contém as novas chaves, de modo que não possa ser regenerada silenciosamente em uma autocomparação); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (a extensão opcional EopSeries::with_ls_ar_prediction além da última linha: respostas dentro da tabela idênticas bit a bit, linhas de previsão iguais a ls_ar_predict, argumentos de referencial além da tabela seguem a previsão em vez de saturar; consistência interna)

# text
seg-c77bd56a0619 = lunar_frame_campaign (compondo lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } testes de biblioteca: o projeto de Helmert contra uma diferença finita central de lunar_frame_realise::apply_helmert — o módulo para o qual o datum existe, que não calcula nenhuma derivada e, por isso, fixa a convenção de sinal de [p]ₓ — com todas as { "84" } entradas do projeto concordando a < { "1e-6" }; uma translação pura da rede lida de volta como translação pura com vazamento < { "1e-6" } para os outros seis parâmetros; o sigma do datum exatamente linear no sigma do atraso até { "1e-8" } numa variação de { "3" }× em todos os sete parâmetros; um arco de { "16" } h medido como pior e um arco de { "48" } h medido como melhor do que { "24" } h, com a varredura de libração emitida ordenada da mesma forma; o pior eixo de translação afirmado como o eixo dominante da direção fixa ao corpo, medida separadamente, até a Terra e pior que os demais por > { "5" }×, uma referência independente de física sobre a qual nada no solucionador foi informado; três faróis colineares produzindo um defeito com todos os sigmas do datum NULL e as direções nulas emitidas na base de sete parâmetros; offblock_fraction e a correlação entre faróis exatamente { "0.0" } com as estações fixas e ambos > { "0" } com elas estimadas; as cifras de transformação injetada do bloco de comparação mostradas iguais a uma execução independente desse cenário até { "1e-14" } relativo, em vez de transcritas; uma salvaguarda de que nenhum datum injetado/recuperado aparece em lugar algum do documento; a emissão da realização do referencial lunar fixada byte a byte por FNV-1a-64 sobre json‖summary‖svg para três formatos de entrada, com impressão digital registrada antes de o trabalho começar); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (condicionado; o estrito lunar_frame_campaign_matches_spice_geometry_and_numpy continua ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (achado; decisão do fundador de 2026-10-02, opção A: esta linha permanece MODELLED e não toma emprestado o status da linha separada; contra uma referência independente mpmath de 50 dígitos, pré-registrada 804662d5, os sigmas do datum do motor com estações estimadas estão dentro do seu limite de erro retroativo a priori, { "9.7e-6" } de diferença em 2024-01-01, e o limiar de { "1e-9" } estava abaixo do que qualquer rota de precisão dupla alcança, sendo a melhor, uma projeção QR do NumPy, { "5.5e-9" } de diferença; a evidência respalda a linha separada 'Lunar frame datum covariance with the stations estimated, against 50-digit extended precision'); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fixado); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fixado)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests e tests/cislunar_arc_recovery_reference.rs (ambos os limites e suas razões fixados na grade publicada; a curva de erro medida comparada à linha de covariância formal linha a linha, com um limite de fator dois por linha e um limite de média geométrica; um CONTROLE NEGATIVO — o DRO plano de seis estados — afirmando que o critério PODE falhar e que o estimador não regularizado diverge além de { "1e6" } km em vez de devolver um erro pequeno plausível; invariância de parametrização afirmada em cada prefixo a { "1e-3" } relativo; uma salvaguarda sobre o texto-fonte que remove comentários, literais de cadeia e o módulo de teste e depois falha diante de qualquer menção ao Jacobiano, à STM, ao posto por SVD ou à maquinaria SRIF, verificada por mutação mediante a injeção de uma chamada proibida; uma verificação apenas de teste de que as diferenças finitas são iguais às linhas analíticas, de modo que a linearização é sabidamente boa enquanto a rota analítica permanece ausente do estimador; determinismo afirmado byte a byte; o documento cislunar-observability publicado fixado por conjunto de chaves, impressão digital canônica e linha de resumo)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análise de formato e de referencial; interpolação de Lagrange exata nos nós e numa trajetória linear fora dos nós; elementos ICRF recebem a redução IAU { "2015" } e são idênticos byte a byte a uma aplicação explícita de icrf_to_iau_moon; anomalia verdadeira↔média com ida e volta contra uma solução direta de Kepler; arquivos malformados recusados com o motivo indicado). lunar_service::tests (com <c1/> não definido, o conjunto de chaves do relatório e o SHA-256 são fixados; a linha kepleriana é igual à execução kepleriana autônoma campo a campo; a identidade σ_required · HPL_max / σ_URE = AL, depois uma nova execução DE PONTA A PONTA no requisito calculado atingindo { "100" } % de disponibilidade de nível de proteção e uma nova execução { "1" } % acima dele não a atingindo; todo campo numérico emitido dos dois novos blocos percorrido a partir do JSON produzido quanto a uma unidade e a uma classe de proveniência; as fixtures versionadas conferidas com suas tabelas de origem satélite a satélite; um horizonte além do fim de uma tabela recusado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (todos os { "61" } tipos de cenário registrados executados, um formato de documento cada: toda folha numérica deve resolver para uma entrada no bloco de unidades do próprio documento; uma entrada malformada conta como ausente para TODO tipo de cenário, isento ou não, de modo que um marcador de posição não compra cobertura; a lista de isenção não pode exceder seu teto fixado, um tipo de cenário listado que se revele totalmente coberto FAZ o portão FALHAR para que a lista não possa ser inflada, e um tipo de cenário registrado ausente da tabela do executor faz o portão falhar para que um novo pacote não possa entrar sem ser examinado — o que aconteceu, apanhando os dois tipos de cenário adicionados depois que este trabalho começou; uma catraca de mão única sobre o passivo de descrito-mas-indefinido; e uma verificação de obsolescência do documento de esquema versionado); field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for e solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: listas vazias e o exemplo de linha de base dão o relatório e o resumo padrão byte a byte; an_added_site_never_increases_any_variance: o menor autovalor de H_after - H_before é não negativo até { "1e-9" } do maior, toda razão de sigma depois/antes é no máximo um, e ambos os sítios adicionados são observados; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml e scenarios/lunar-station-geodesy-with-station.toml (mesmo cronograma arquivado e mesmo bloco de campanha VLBI)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testes: ambas as salvaguardas sobre toda a árvore de código-fonte, mais fixtures de mutação que avaliam cada salvaguarda nos dois sentidos — o padrão F22 relatado nos dois caminhos em colisão, a correção de sequência atômica entregue aceita, uma meia correção relatada exatamente no caminho que perdeu seu componente único, um identificador de arquivo temporário e um diretório único herdado aceitos, um relógio de parede rejeitado; um pino não declarado relatado, um declarado aceito, um escopo sem exclusão rejeitado, uma declaração no comentário de documentação do teste envolvente aceita e demonstrado que não vaza para o teste seguinte; e cada grafia de pino — hexadecimal, decimal, cadeia de digest, comprimento em bytes, contagem de bytes nomeada, arquivo golden — vista, enquanto constantes de algoritmo, sementes de RNG e pequenas verificações de cardinalidade não são)

# text
seg-416def055790 = integrity::composed_pl::tests (monótono, piso P0, K(IR/2), expoentes, semicontinuidade inferior)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergência, limiar, dominância do aperto por IR)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionado a dados: é ignorado com uma mensagem quando a série do BIPM está ausente); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 rodada { "3" }, prospectivo, ainda não executado: a Circular T { "465" } apareceu em 2026-10-12, e a regra pré-registrada de 1000 valores exige edições até cerca de { "468" })

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (derivadas parciais analíticas de LLR/VLBI/orbitador versus diferenças finitas); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverso versus radial via crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - a seleção vazia dá a matriz zero, uma seleção única é a identidade, um par é igual a uma soma elemento a elemento escrita de forma independente, e o resultado é invariante à ordem de seleção; adding_a_block_never_reduces_the_degeneracy_metric - monotonicidade sob informação adicionada; radial_diversity_beats_transverse_for_breaking_the_degeneracy - o bloco do orbitador do lado oculto eleva a métrica de degenerescência mais que o bloco VLBI transverso)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonicidade no orçamento; redução do orçamento RSS sob um CRLB por provedor; tolerância de rotação calculada no braço de alavanca lunar; termo vinculante = rotação)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris zera o orçamento; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } nas divisões reais; ordenação das convenções)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloco não nulo porém deficiente de posto ⇒ block_spark { "1" }, f_detect { "0" }; colunas independentes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (um par que detém todas as medições de um nó = um erro de deslocamento de relógio ∈ range(G), indetectável, com uma lacuna espectral de Gram clara), byzantine_redundant_net_identifies_at_least_one (seis pares independentes de medição única ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (casos manuais com P⊥ = I fixam f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (rede autorreferencial: a taxa comum está em N(GᵀWG), temporal_gauge_dim { "2" }; após uma linha externa de amarração de taxa: taxa expulsa do gauge, temporal_gauge_dim { "1" } com o deslocamento comum sobrevivendo)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (viés comum indetectável, diferencial detectável), slope_infinity_in_range_finite_detectable (g7: inclinação ∞ para b ∈ range(G), finita para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: posto(GᵀWG) = state_dim − { "8" }, o gauge de 8 dimensões é todo o espaço nulo, com uma lacuna espectral > { "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremos abertos e fechados, a lacuna de τ = { "400" } s da G.8271.1 Tabela 7-3, continuidade em todo ponto de quebra que as tabelas implicam; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de cenário clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (logs escritos à mão por formato: cabeçalhos, separadores, unidades, integração de frequência, canais e modos do TICC, lacunas e políticas, recusas); tests/clock_log_allantools.rs (a comparação pré-registrada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) nas fixtures em tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — a rampa de envelhecimento discreta dentro de { "0.1" } % de (1/2)·D·t² ao longo de um dia; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relógios de satélites GPS Block IIF, { "14" } dias de relógios finais do IGS: { "8" } dentro do limiar de { "1.5" }, G25 e G30 otimistas em até cerca de 2x, fixado); tests/slot_timing_ocxo_holdout.rs (um OCXO medido: a predição retida nunca otimista, de { "0.59" } a { "0.70" } da violação medida; na amostra dentro de { "0.98" } a { "1.17" }; sem o termo de frequência de correção a predição na amostra é otimista em todo limiar); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — toda classe contra holdover::holdover_seconds a { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exatamente tpl::timing_protection_level_ns quando o relógio não tem termo de flicker, de fase branca nem de passeio aleatório; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db e C/N0 efetivo igual a jamming::effective_cn0_dbhz com Q = 1/(R_c kappa) a { "1e-9" } dB, e a âncora de { "32.105" } dB do próprio teste do tipo de cenário jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fixado em { "2.04" } e { "5.16" } vezes o erro nominal de longitude, abaixo de seis vezes; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } segundos de arco e { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: pior { "3.7e-3" } da velocidade); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: pior erro angular visto do planeta de { "2000" } a { "2040" }, Fobos { "5.65" } graus, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titã { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } graus); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: a raiz do valor quadrático médio de cada erro de solução sobre o seu próprio sigma formal em [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — todo mapa e todo contador é igual a uma varredura com o teste direto de elevação; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime o tempo de execução e os testes de par mantidos; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (apenas verificação de regressão); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressão)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — o resultado do membro idêntico byte a byte à execução autônoma e todo valor alinhado igual à série autônoma; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } sementes de um relógio de ruído branco de frequência em deriva livre tau = { "3010" } s: a média verdadeira { "0" } dentro do intervalo relatado, a meia-largura do intervalo dentro de { "25" }% de { "1.96" } sigma/sqrt(n), e a variância amostral dentro do intervalo qui-quadrado bilateral de { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; ensemble de calibração (CAP-10, pré-registrado ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): em { "200" } ensembles independentes o intervalo cobre a média verdadeira em { "192" } (dentro da região de { "99" } % da Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) e a verificação qui-quadrado passa em { "196" }, enquanto a tolerância de percentil de semente única (p05 e p95 dentro de { "0.3" } sigma) passa em apenas { "183" } de { "200" }, NOT MET contra os { "190" } pré-registrados, uma verificação frágil quanto à semente, registrada em vez de afrouxada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — uma composição de um membro lê o número autônomo e o digest do resultado)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (pré-registrado fbe6c8b3 e, após uma falha de protocolo na rodada 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — solução de alvo 1-D dentro de { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) em { "96" } avaliações; p3_prime_contour_target_grid_and_nelder_mead e p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — o melhor do método de grade idêntico bit a bit a um laço independente de força bruta { "41" } x { "41" } sobre run_toml, Nelder-Mead pelo menos tão bom em { "177" } e { "161" } avaliações; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fixa a falha registrada da rodada 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } em { "234" } avaliações; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (todo cenário agnóstico de sistema incluído roda sem dados de workshop, as razões ionosféricas da troca de banda são iguais a (f_ref/f)^{ "2" } e suas diferenças de espaço livre a { "20" } log10(f/f_ref), o jitter no C/N0 de referência fica entre o seu limite de Gabor e a sua forma de banda ilimitada, as verificações de forma E5 do cenário com parâmetros de workshop são consistentes quando esse arquivo está presente, e nenhum arquivo-fonte compila esse arquivo)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (a cascata multibanda roda com quatro painéis, os jammers UHF, banda L5, S e C negam cada um apenas a sua própria banda, e uma execução de banda simples não é alterada pela extensão); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: abaixo de { "0.01" } Hz e { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: dentro de { "0.5" } dB de -139.1 e -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (o salto de distância de cada troca é igual à variação do erro de distância, e um ajuste corrigido de { "300" } s atualizado a cada { "150" } s passa um limiar de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (a forma fechada limita uma amostragem densa do cone)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (todo modelo dentro de { "2" } mm da mensagem exata após a decodificação, recodificação idêntica bit a bit, um bit invertido rejeitado pelo CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (todo modelo dentro de { "0.1" } mm após o bloco de texto, o CSV exato)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: a { "1" } mm e a deriva a { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: o RMS do resíduo ponderado em [{ "0.8" }, { "1.2" }] e o erro abaixo de quatro sigmas formais); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (um proxy pré-registrado contra os percentis publicados do conjunto de dados 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: com { "3" } satélites (máscara de { "47" } graus), sem auxílio de altura e { "30" } Hz, o erro 3-D p90 é { "92.2" } m a { "20" } s e { "870" } m a { "8" } s contra os { "2" } m e { "10" } m publicados, de modo que ambos os limiares de fator dois são NOT MET, pelo lado alto, e afirmados como não atingidos; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) a { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } sementes, média de NEES média das execuções em [{ "2.4" }, { "3.6" }] e pelo menos { "75" }% das épocas dentro da faixa qui-quadrado bilateral de { "95" }%; medido com { "150" } sementes, média { "2.84" } só com GNSS e { "2.87" } com LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: varreduras de texto-fonte de src, scenarios e tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: um EIRP mais forte, um intervalo de ajuste mais longo e um termo maior de determinação de órbita movem cada um o valor repassado e a solução fundida; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: igual ao TEC oblíquo da passagem no pico a { "1e-9" } e seu sigma é igual ao ruído de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótono em toda estatística, acrescentar um monitor nunca eleva a pontuação, estatísticas saudáveis permanecem em { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadeias LEEF exatas, escape, severidade, envelope RFC { "5424" }, tempos limite de entrega e reconexão); tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorado, condicionado a dados por KSHANA_JAMMERTEST_DIR: a seleção registrada, as contagens retidas, os vereditos dos limiares e o veredito); receiver_trust::calibration::tests (carimbos de tempo, pareamento de janelas e a mudança de fuso horário, rótulos, faixas de guarda, exclusão, seleção); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionado a dados por KSHANA_JAMMERTEST_PLAN_DIR: contagens de slots por área de teste do plano de { "2025" }, ids de catálogo, ida e volta em TOML); tests/jammertest_score.rs (um log sintético com uma queda conhecida: detectada, perdida, não avaliável, execução de falso alarme, pacote assinado carregando o boletim); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionado a dados por KSHANA_JAMMERTEST_DIR: a execução registrada)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); fora do crate: integrations/signalk (JavaScript), integrations/opencpn (relé JavaScript, plugin nativo C++), deploy/reference-build (unidades systemd, contêiner)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (o gate e seu listener TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } testes Node sobre saída sintética gravada); integrations/opencpn/test/relay.test.mjs ({ "5" } testes Node); integrations/opencpn/test/e2e-live.mjs (o binário real até um consumidor TCP, executado à mão e na CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (verificações em C++ do analisador PKSHT e do estado do painel); deploy/reference-build/check-units.sh e deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); testes unitários de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: o limiar de teste unitário B4 pré-registrado mantido como escrito, suas falhas registradas afirmadas como achado F1)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, o veredito registrado afirmado como registrado, achado F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, apenas relatado; condicionado a dados, obtido por scripts/fetch_scint_malindi.sh); testes unitários de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, achado F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, o veredito registrado afirmado como registrado, achado F1, fixado por finding_noise_free_sidelobes_exceed_the_cfar_rate); teste unitário de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, achado F1, fixado por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, achado F2, fixado por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, apenas relatado)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack; compliance (fatos do pacote de normas no compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: o status de cada teste, incluindo as falhas L4-T1 e os quatro testes de exatidão da IMO); standards_pack::tests

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sobre números derivados por tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), contra xval/crpa-jamming/expected.json de xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), contra xval/jamming-terrain/expected.json de xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), contra xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json e expected_quantiser.json

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sobre tests/fixtures/fll_handover_floor/results.csv

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (épocas lat/lon, semana/TOW e ECEF, dms recusado, entrada hostil); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fixado, registros ASCII e binários, CRC inválido ignorado, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de verificação do catálogo CRC-24Q, C/N0 MSM4/MSM7 e fusão de épocas, tempo GLONASS e mapeamento de id SBAS, CRC inválido e outras mensagens)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes conhecidos de ruído branco recuperados dentro de { "10" } %, recusas, o TOML é analisado como AccelCfg); tests/receiver_trust_machines.rs (concordância e discordância de rumo, portadora em linha, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes dos pacotes, broker de loopback, broker morto contado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: o formato que a ponte gnss_lib_py escreve, executado por receiver-trust); os testes Python das pontes são integrations/ros2/kshana_trust/test/test_bridge.py (ponte com um motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (o wheel real pontua uma solução estável como nominal e um salto de { "1.1" } km como não confiável) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } e o wheel), executados com pytest, não por cargo

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Fonte: <c1/>

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-b04cb81fc402 = tests/clock_library_lag1_noise_id_allantools.rs ({ "140" } casos: dez registros de lei de potência de Kasdin, b = { "0" } a -4, como dados de fase e de frequência, af = { "1" } a { "64" }; alpha_int e d idênticos, pior |d alpha| { "9.6e-13" } e |d rho| { "4.8e-13" } contra { "1e-9" }; pré-registrado 2ec76864); allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (opcional, KSHANA_OSNMA_VECTORS: todos os { "18" } conjuntos de vetores, { "186,382" } tags autenticadas, { "0" } falhas, pisos por conjunto, cadeias anunciadas, ADKD 0/4/12, alerta verificado, autenticação retomada após o fim da cadeia, revogação de cadeia e de chave e nova chave pública; offline, vetores não redistribuídos); tests/osnma_synthetic.rs (a suíte de ataques: subquadros de futuro distante falsificados, expiração e vinculação de dados, alerta e don't-use, confirmação de cabeçalho, tags fictícias, MACSEQ, conflito de chaves, KROOT obsoleto e reproduzido, CMAC-AES/SHA3-256/P-521 pelo verificador); testes unitários do osnma (respostas conhecidas de RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } e CRC-24Q)

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 contra Stable32 até { "1e-4" }); allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (5071A Cs real contra maser de hidrogênio, { "556 990" } pts, { "16" } fatores de promediação contra Stable32 até { "1e-3" }; condicionado a dados via scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (PHASE.DAT do Stable32, { "139" } fatores de promediação, OADEV/MDEV/TDEV até { "1e-3" }; condicionado a dados via scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV no conjunto de dados LCG de 1000 pontos de NIST SP { "1065" } §{ "12.4" }, { "6" } + { "6" } fatores de promediação contra allantools { "2024.06" } até <{ "1e-9" }); allan::tests (acompanhamento em forma fechada de FM branco; identidade TOTVAR=ADEV em m={ "1" }; invariância de Theo1/TOTVAR a deslocamentos de fase/frequência; inclinação -1/2 de FM branco)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE na série de fase LCG hermética de 1000 pontos de NIST SP { "1065" } §{ "12.4" }, { "9" } fatores de promediação m={ "1" }..256 contra o mtie do allantools { "2024.06" } até <{ "1e-9" }, observado ≤{ "4e-15" }); allan::tests (pico a pico derivado à mão; monotônico não decrescente em τ; a·m exato em uma rampa pura)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV na série de fase LCG hermética de 1000 pontos de NIST SP { "1065" } §{ "12.4" }, { "8" } fatores de promediação m={ "1" }..200 contra mdev/tdev do allantools { "2024.06" } até <{ "1e-9" } relativo, mais a identidade τ/√{ "3" } na série real); allan::tests (inclinação -1/2 de FM branco; caso pequeno de MDEV derivado à mão)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (σ_y(τ) do relógio de pinças ⁸⁸Sr de Norcia et al., { "8" } tempos de promediação { "0.92" }–{ "117.76" } s incorporados literalmente sob CC-BY-4.0: o NNLS reconstrói a curva com ~{ "10" }% RMS / ≤{ "21" }% no pior ponto; √q_wf recuperado = { "4.33e-16" } coincide com o publicado 4.7e-16/√τ; q_rw > { "0" } piso de ruído vermelho medido)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } casos de geometria real, Celestrak GPS+Galileo e SP3 do IGS: pior |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m contra o TOL_PL do ADD de { "0.05" } m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (as lacunas de sigma uniforme, fixadas); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (IGS ABMF real 2018-05-13, { "288" } épocas, { "2016" } casos com vieses injetados de { "10" } a { "100" } m: 2016/2016 decisões de detecção e 801/801 de exclusão idênticas, HPL/VPL de inclinação dentro de { "2.7e-12" } m contra { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } pares usuário-época em transmissões WAAS reais, o mesmo conjunto protegido, pior |dVPL| { "7.1e-6" } m e |dHPL| { "1.6e-5" } m contra { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (a constatação de L5, fixada); tests/igs_real_data.rs e tests/araim_dual_real_data.rs (plausibilidade em SP3 real do IGS e geometria do Celestrak, mantidos como verificações de regressão, não como referências independentes)

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } vetores de verificação AIAA, pior caso { "4.12" } mm); tests/sgp4_crate_comparison.rs (crate sgp4 independente)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } épocas = { "11" } casos × { "25" } estados horários, LEO+GTO, contra o DormandPrince853 do Orekit { "12.2" }; níveis conservativos T1–T5 pior |Δr| { "0.08" } m ao longo de { "24" } h; nível de arrasto caracterizado em { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } geometrias ao longo da borda da sombra, { "884" } na penumbra, de LEO a GEO, declinação do Sol { "0" } e +-23.44 deg, { "8" } azimutes: pior |dnu| { "7.41e-9" } para o WGS-84 e { "2.24e-9" } para a linha de base esférica; as razões WGS-84 e esférica do Orekit diferem em até { "0.98" }, de modo que o conjunto discrimina o achatamento); testes unitários de srp_shadow e propagator

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } geometrias de órbita do Galileo, { "7" } casos de Sol incluindo as distâncias de periélio e afélio, { "100" } atitudes aleatórias; soma de placa plana pior { "2.05e-15" } relativo em { "1056" } casos; de ponta a ponta com a atitude e a pressão do próprio Orekit pior { "2.39e-15" } em { "747" } casos de pleno sol, enquanto as constantes de pressão padrão do Orekit diferem em >= { "4.43e-3" }, de modo que a comparação discrimina a constante; matriz de guinada nominal pior { "1.89e-15" }; derivada parcial do fator de radiação pior { "1.35e-15" }; derivadas parciais por painel pior { "4.12e-13" } relativo contra diferenças centrais do Orekit em { "10836" } casos de painel; aceleração e derivadas parciais ECOM2 pior { "1.74e-15" }); testes unitários de srp_boxwing (limites em forma fechada, derivadas parciais por diferenças finitas); testes de ligação de propagator e precise_od

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } pontos de grade, { "90" } a { "1000" } km, { "4" } latitudes, { "2" } horas locais, { "3" } dias, atividade baixa/moderada/alta: densidade dentro de { "1.866e-6" } relativo e temperatura dentro de { "1.97e-4" } K do pymsis; idêntico bit a bit à porta em C; os { "17" } casos de teste em C publicados, { "187" } valores dentro de { "0.496" } unidades do 7º algarismo significativo); testes unitários de nrlmsise00

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } casos x { "25" } estados horários ao longo de { "24" } h, circular { "51.6" } deg, { "400" } km com atividade baixa/moderada/alta e { "300" } km: pior |dr| { "0.0303" } m e |dv| { "3.36e-5" } m/s contra { "3.3" } a { "141.8" } km de deslocamento por arrasto, pior erro/limiar { "0.003" }; o controle de densidade exponencial erra por { "119.1" } m); testes unitários de forces e propagator (padrão idêntico bit a bit; o nível avalia a porta no ponto geodésico fixo à Terra)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (casos equatoriais E400, E300 e E250x600 em J2000.0, { "25" } estados horários ao longo de { "24" } h: o deslocamento induzido por arrasto concorda com o do GMAT em no máximo { "0.016" } do limiar { "0.5" } m + { "1e-3" }|D| contra { "21.5" } a { "143.9" } km de deslocamento; uma variação de +{ "1" } % em Cd*A/m atinge { "9.83" } vezes o limiar; o caso inclinado I400 é relatado, { "10.4" } % de diferença, a diferença declarada de definição de altura)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } de { "21" } ondas concordam com o modelo A2 publicado: pior { "0.00050" } cm, { "0.050" } deg contra limiares de { "0.0006" } cm, { "0.1" } deg); tests/tides_iers.rs (faixa de amplitude de S2)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } casos x { "25" } estados horários ao longo de { "24" } h: EGM2008 8x8 e 70x70 em LEO { "45" } deg, polar { "89.9" } deg, heliossíncrona { "98.2" } deg, GTO, e 70x70 com Sol/Lua e SRP; pior |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; controles negativos erram por { "6168" } m (Terra congelada) e { "20871" } m (somente zonal)); testes unitários de propagator (identidade no limite zonal até { "1e-12" }, referencial CIO bit a bit contra precise_od, integral de Jacobi mantida até { "1e-9" } em { "6" } h)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } passos únicos: estado dentro de { "5.55e-15" } relativo, derivada FSAL { "3.46e-15" }, saída densa { "1.99e-14" }, decisões de aceitação/rejeição idênticas; { "3" } execuções completas com rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } em { "5" } períodos, Arenstorf em um período): passo inicial idêntico, passos aceitos 502/501, 390/390, 298/298 e avaliações 6025/6013, 5497/5497, 4285/4285 contra o SciPy, estados finais dentro de { "2.95e-13" } relativo (dois corpos) e { "1.58e-12" } (Arenstorf), saída densa dentro de { "9.5e-13" }; exatidão contra a solução exata de Kepler do mpmath igual à do SciPy (LEO { "8.44e-5" } m, periodicidade de Arenstorf { "1.475e-9" })); testes unitários de integrator e propagator ({ "24" } h de dois corpos contra Kepler exato abaixo de { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } pontos de grade, e de { "0" } a { "0.999999" }, M em [-pi, pi] até { "1e-12" }: pior |E - E_ref| { "0.898" } eps|E| contra um limiar de { "8" } eps|E|; { "9" } pontos de M enrolado com pior { "0.013" } do seu limiar; nenhum passo de polimento de Newton necessário em qualquer um dos { "414" } pontos; wrapper idêntico bit a bit); testes unitários de kepler

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (recortes de grau 20 sempre executam: pior |dg|/|g| { "9.7e-16" }, relativo à perturbação { "3.4e-11" }; GMM-3 d/o { "120" } sobre a esfera inteira { "3.7e-15" } / { "6.3e-12" } e GL0660B d/o { "660" } a |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, condicionado a dados; cabeçalhos e coeficientes selecionados iguais aos produtos PDS publicados, contagens de registros { "7380" } e { "218790" }); testes unitários de gravity_pds

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } cenários: { "6" } LEO/MEO/excêntricos sem ruído/3–4 estações + { "2" } σ={ "5" } m, contra o Orekit { "12.2" }; pior em lote |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, sequencial |Δr| { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } pernas em { "8" } épocas de { "2020" }–{ "2027" } contra ANISE DE440; pior |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m a até { "2.5" } AU)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } casos SV-época: GPS + Galileo + BeiDou-MEO, { "12" } SVs × { "7" } deslocamentos, contra eph2pos do RTKLIB; pior |Δ| por eixo { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } casos SV-época fora de nó / { "6" } satélites contra peph2pos do RTKLIB; pior |Δ| por eixo { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (mapa IONEX sintético versionado contra a referência da fórmula: { "20 075" } nós exatos, interpolação máx |Δ| { "3.5e-13" } TECU; condicionado a dados em KSHANA_IONEX_CODE_GIM_DIR, o recorte de latitude do GIM final real do CODE de 2018-05-13 obtido por fetch.sh com um SHA-256 fixado: nós exatos, interpolação máx |Δ| { "3.6e-13" } TECU em { "15 795" } amostras, TEC oblíquo { "5.1e-13" } TECU; iontec do RTKLIB v2.4.2-p13 condicionado a dados em { "6885" } pontos de consulta, executado em 2026-10-13: máx |Δ| { "3.6e-13" } TECU nos dois modos de tempo, limiar { "1e-5" } pré-registrado); ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (estações IGS WTZR base / WTZZ rover, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } épocas, correções fixas em { "100" } % a partir de { "00" }:{ "10" }, mediana do erro de linha de base fixa { "4.5" } mm, p95 { "5.5" } mm; primeiros { "10" } min fixos { "2.6" } mm contra flutuante { "13" } cm); rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } épocas: Kshana menos IGS std { "0.075" } ns, limiar { "0.20" }; média -0.659 ns, limiar { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (estação IGS WTZR, 2025-02-24 00-06 h, { "30" } s, reservada do desenvolvimento: horizontal na última época { "1.5" } mm, vertical −{ "2.9" } cm; 04-06 h 240/240 épocas dentro de { "0.10" } m em 3-D, p95 { "6.7" } cm; somente código p95 { "1.70" } m; RMS de ZTD condicionado a dados { "1.7" } cm contra EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: o PPP do RTKLIB v2.4.2-p13 nas mesmas entradas concorda dentro de { "0.05" } m em 240/240 épocas, { "9.7" } mm na última, no terceiro registro após duas execuções cuja configuração do RTKLIB não tinha a maré sólida e colocava a antena na posição da base, ambas registradas como constatações; o limiar de paridade do SPP não foi atingido, mediana { "1.085" } m contra { "0.50" } m; gLAB { "6.0.0" } em sua primeira execução registrada, linha de comando da emenda { "4" }: PPP dentro de { "0.05" } m em 240/240 épocas e { "5.0" } mm na última, limiar do SPP não atingido, mediana { "1.187" } m, uma constatação: as soluções SPP das duas ferramentas de referência diferem entre si em { "0.852" } m de mediana, de modo que esse limiar foi definido mais rigoroso do que a concordância entre as ferramentas)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (IGS BRD400DLR_S RINEX { "4.02" } contra BRDM00DLR_S RINEX { "3.04" } de 2026-07-19, fatia 00-02 h: registros G { "37" } / E { "478" } / C { "72" } correspondidos nos dois sentidos, todo campo idêntico, posição em Toe { "0" } m; dia completo condicionado a dados: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (SP3 final de { "15" } min do IGS de 2025-02-24 contra os relógios finais de { "30" } s do IGS, { "32" } satélites GPS: mediana nos nós |Δ| { "2.6e-13" } s; { "3038" } registros de ponto médio RMS { "0.121" } ns, p95 { "0.265" } ns; mantendo o nó em vez disso, { "4.24" } ns de RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (carregadores sintéticos e testes de braço de alavanca em plataforma giratória sempre; condicionado a dados em KSHANA_KFGINS_DIR, executado em 2026-10-13 no conjunto de demonstração do KF-GINS: RMS horizontal / vertical { "0.0109" } / { "0.0090" } m contra a trajetória de referência, contra { "0.0111" } / { "0.0083" } m do KF-GINS em C++, todos os seis limiares pré-registrados mantidos; braço de alavanca desligado { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } testes: referência independente e cenários, bytes de exportação fixados, leitores NMEA e LLH, corte ECEF de quatro colunas, CONSTATAÇÃO da execução 1 no CSV de largura total, grade de linhas de { "10" } Hz)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (perfis estático/curva/coning, { "30" } épocas cada, contra o NaveGo: atitude idêntica bit a bit { "0" } rad; velocidade/posição dentro de limites analíticos nomeados)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (a síntese GRS80 reproduz Somigliana até { "3.5e-12" }; mapa de perturbação EGM2008 real do ICGEM físico)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } casos: { "12" } épocas em janeiro de { "2025" } x os pontos L1 e L2, dois estados iniciais de halo sul de L2 e um de DRO da API Three-Body Periodic Orbits do JPL e um estado genérico; pior posição { "1.8e-7" } m contra { "1" } mm, velocidade { "1.2e-9" } m/s contra { "1e-6" } m/s; inversa { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Mercúrio, Vênus, a Terra e a Lua em 2026-01-01, 2030-06-15 e 2040-12-31: pior { "3.3e-5" } m e { "1.0e-11" } m/s contra { "1" } mm e { "1e-6" } m/s; o bloco de kernel e os rótulos exatos); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (da Terra ao baricentro de Marte, { "16" } partidas 2026-09-01..2027-01-29 x { "19" } chegadas 2027-06-01..2028-02-26: { "304" } células finitas dos dois lados, pior C3 { "2.5e-14" } e V-infinito { "2.6e-14" } relativo contra { "1e-8" }, a mesma célula de C3 mínimo, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (da Terra ao baricentro de Marte, partidas 2026-09-15..2027-01-15 x chegadas 2027-05-01..2028-03-01, Tipo I/II x C3 mín / V-infinito mín: pior objetivo { "8.7e-13" } relativo, datas dentro de { "1e-5" } dia, outra grandeza dentro de { "2.5e-7" } relativo, contra limiares pré-registrados de { "1e-7" }, { "0.01" } dia e { "1e-4" }; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (referência publicada secundária NASA/TM-2010-216764 Tabela { "2" }: Tipo II C3 mín { "9.182" } contra { "9.144" } e Tipo II V-infinito mín { "2.564" } contra { "2.565" } MET; Tipo I C3 mín { "10.535" } contra { "11.11" }, -5.18 %, NOT MET e afirmado como não atingido, com a referência independente da biblioteca concordando com o Kshana)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } casos: { "300" } 3-D aleatórios, { "18" } perto de { "180" } deg, { "24" } perto do tempo mínimo de M = { "1" }..3, { "40" } heliocêntricos; { "1058" } soluções; contagens e ordem dos ramos iguais; velocidades dentro de { "1e-8" } relativo, pior { "1.6e-13" }; dentro de { "1" } % do tempo mínimo dentro de { "1e-6" }, pior { "7.5e-15" }; uma proteção interna de pouso kepleriano pousa toda solução a { "4.2e-12" } de |r2|, exceto uma constatação fixada em um arco com e = { "0.994" }, uma limitação de kepler_universal, não do solucionador)

# text
seg-67d3c2e5a311 = manobra (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } transferências contra lamberthub izzo2015; pior |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = referenciais, precessão, nutação, cio, escalas de tempo

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado de ponta a ponta; vetores SOFA/ERFA)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } instantes UTC: seis em torno de cada um dos { "27" } segundos intercalares de 1972-2016, dois fixos, { "60" } sorteados com semente entre 1972-2026; dtf2d, utctai e taiutc, cada um dentro de { "1e-6" } s, pior { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } datas UT1/TT em duas partes entre 1980-2050, incluindo degraus de +{ "1" }, +{ "10" }, +{ "50" } us em duas datas: gmst82 dentro de { "1e-12" } rad, pior { "0" }; elementos GCRS para ITRS dentro de { "5e-12" }, pior { "2.7e-14" }; rotação sobre +1/+10/+{ "50" } us dentro de { "1e-13" } rad do ERFA, pior { "1.1e-14" } rad, onde o caminho de f64 único erra por completo os degraus de +{ "1" } e +{ "10" } us); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } épocas TT entre 1950-2100, dX e dY até { "0.5" } mas: elementos de precessão dentro de { "1e-13" }, pior { "0" }; TEME para GCRS dentro de { "5e-10" } rad, pior { "1.10e-10" } rad; CIO com deslocamentos dentro de { "1e-13" }, pior { "0" }; deslocamentos nulos idênticos bit a bit a cio::gcrs_to_cirs_matrix)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } instantes UTC: quatro em torno de cada um dos { "15" } inícios de uma expressão TAI-UTC entre 1960-1972 e { "60" } sorteados com semente entre 1960-1971; dtf2d, utctai e taiutc, cada um dentro de { "1e-6" } s, pior { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (os { "224" } instantes da linha de { "1972" } em diante, inalterados bit a bit)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } casos: os { "4" } registros GLONASS do arquivo de difusão real do IGS MGEX de 2013-01-01 x { "73" } deslocamentos dentro de +/-900 s; relógio dentro de { "1e-14" } s, pior { "0" } s; posição dentro de { "0.01" } m, pior { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (etapa { "1" }: { "4432" } posições TEME dos { "232" } conjuntos de elementos registrados contra python-sgp4 { "2.24" }, pior { "6.1e-8" } m, limiar { "1" } cm; etapa { "2" }: { "108" } instantes, { "23" } deles com parâmetros de orientação da Terra e um no último segundo de um dia com segundo intercalar, contra o ERFA: GCRS -> ITRS pior { "2.9e-6" } mas, limiar { "0.1" } mas; TEME -> ITRS pior { "0.41" } mas, limiar { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

# text
seg-5235d736ac3e = navsignal (CodeFamily)

# text
seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

# text
seg-6f9de921ca86 = orbit (dop)

# text
seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } geometrias, bem condicionadas → quase singulares)

# text
seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

# text
seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } casos em elevação/azimute/hora local, dois conjuntos de coeficientes)

# text
seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

# text
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } casos: CDF/quantil de χ², CDF/quantil normal, CDF de χ² não central, pbias nas faixas de P_fa/P_md/redundância)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independente (Cephes/Boost), um algoritmo diferente da série de gama incompleta do Kshana; coincidência até ≤{ "1e-6" } rel. Apenas o núcleo. A <em>alocação</em> do orçamento P_HMI do ARAIM MHSS já não está sem uma referência independente numérica publicada — o exemplo resolvido do próprio Subgrupo Técnico ARAIM do WG-C agora sustenta a linha separada 'ARAIM MHSS protection levels against published reference vectors', com coincidência na TOL_PL = { "5e-2" } m da própria referência — portanto o escopo desta linha é o núcleo estatístico, e aquela linha cobre a alocação (ver docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } épocas reais do EGNOS: HPL comparado diretamente, d_U vertical verificado sem o fator K)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } conjuntos de dados, { "24" } limiares; contagens exatas + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (ESA OPS-SAT real, a AUC reproduz o scikit-learn até { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } casos na divisão de teste real do OPSSAT-AD: matriz de confusão completa do ponto de operação + Pd/Pfa/precisão/F1 contra o scikit-learn, exata em inteiros)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² com graus de liberdade operacionais ≥ { "48" }; Q de van Loan)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } pontos globais × altitudes contra ppigrf @ época { "2025.0" }; pior |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } casos contra scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score; pior |Δ| AUC { "6.9e-8" }, falha mínima detectável { "1.3e-8" }, AUC empírica { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } casos contra scipy { "1.18" } / numpy { "2.4" }: { "61" } τ-b de Kendall até { "2e-16" }, ordenação exata, média de Dirichlet + IC percentil até { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (tabela do Índice de Aleatoriedade de Saaty { "1980" } n={ "1" }..10 EXATA; vetor de prioridades + λ_max + CR contra SciPy/LAPACK eig em uma matriz consistente { "3" }×{ "3" } e em matrizes inconsistentes { "3" }×{ "3" } / { "4" }×{ "4" }, com coincidência até <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (pontuações WSM + ordenação) e tests/mcda_wpm_reference.rs (pontuações WPM + ordenação), cada um contra pymcdm até <{ "1e-9" } em uma matriz de decisão fixa { "4" }×{ "3" } de benefício/custo

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (coeficientes de proximidade + ordenação contra pymcdm até <{ "1e-9" } em uma matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (índice Q + ordenação contra pymcdm até <{ "1e-9" } em uma matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (fluxo líquido de superação + ordenação, critério usual, contra pymcdm até <{ "1e-9" } em uma matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (matrizes de concordância, discordância e dominância elemento a elemento + conjunto núcleo/dominado contra pyDecision até <{ "1e-9" } em um conjunto de dados fixo { "4" }×{ "3" } só de benefício)

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (preferências WASPAS + ordenação) e tests/mcda_moora_reference.rs (pontuações MOORA + ordenação), cada um contra pymcdm até <{ "1e-9" } em uma matriz de decisão fixa { "4" }×{ "3" } de benefício/custo

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (graus de utilidade + ordenação contra pyDecision até <{ "1e-9" } em uma matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } casos de latência determinística EXATOS contra uma referência independente de primeira passagem; { "8" } casos de ARL₁, Monte Carlo @60k tentativas contra a aproximação de Siegmund + tabelas publicadas de Montgomery)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } casos contra scipy { "1.18" }: { "12" } variâncias de inércia contra linalg.expm Q₀₀ de Van Loan, pior rel { "1.1e-15" }; { "7" } inversões de holdover contra optimize.brentq, pior rel { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } casos: { "14" } contra scikit-bio inv_simpson + { "3" } de fronteira com zero fixado; pior |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-d4dabd188012 = tests/skyline_orekit_oracle.rs (skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered: { "1173" } ângulos de visada em seis locais e quatro épocas, seis tabelas de máscara, { "142" } conjuntos visíveis; pior |d el| { "1.3e-13" } graus e |d az| { "2.3e-13" } graus contra { "1e-9" }, pior |d máscara| { "1.1e-12" } graus contra { "1e-9" }, conjuntos visíveis idênticos e nenhum na faixa limítrofe de { "1e-6" } graus, pior DOP { "3.3e-13" } relativo e cofator { "6.6e-13" } da escala da matriz contra { "1e-9" }; pré-registrado e4b9d912); skyline::tests (table_interpolates_linearly_between_rows; table_wraps_through_north_without_a_seam); tests/skyline_scenarios.rs (every_wired_scenario_is_byte_identical_to_the_0_35_0_release)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-48069ecceb4a = tests/ellipse_numpy_oracle.rs (ellipse_and_cofactor_agree_with_numpy_as_pre_registered: { "270" } casos, os { "142" } conjuntos visíveis registrados da comparação de skyline sob um único relógio comum e sob um relógio por sistema; pior eixo { "5.1e-13" } relativo e orientação { "5.3e-12" } graus, nenhum quase circular, cofator { "1.0e-12" } da escala da matriz, contra { "1e-9" } e { "1e-6" } graus; pré-registrado 0bbeeaee); geometry::tests (ellipse_of_an_analytic_two_by_two_case)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } os primeiros 10 chips reproduzem exatamente os octais 1440/1620/1710/1744/1133/1455/1131/1454/1626 da Tabela 3-Ia do IS-GPS-200; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (identidade UKF==KF linear; inércia em queda de sinal; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } casos contra filterpy { "1.4.5" }: EKF linear fracamente/fortemente acoplado + posteriores de PNT acoplado até ≤{ "2.4e-12" }; execução do UKF com 40 épocas, pior |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (solução fracamente acoplada do NaveGo v1.4 no percurso real de IMU/GNSS Ekinox do NaveGo: RMS horizontal 0.912x, vertical 0.940x, RMS da inovação de posição 0.861x do valor do NaveGo, inovação normalizada média { "0.395" }; limiares 1.2x, 1.2x, 1.2x e { "1.5" } fixados antes da execução)

# text
seg-e53182bd8d30 = cr3bp::tests (STM contra diferenças finitas); tests/cislunar_mission_analysis_reference.rs ({ "5" } membros NRHO L2-S do JPL: os { "9" }:{ "2" } + { "4" } vizinhos; pior |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, perilúnio { "0.7" } km em unidades de comprimento do JPL)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values na CI em dez nós ICGEM citados; egm2008_n70_gravity_anomaly_sa_matches_icgem sobre as grades completas de 0.25 grau obtidas do Chade 9-15N 19-25E e do Vale da Morte 35-38N 242-245E, { "794" } nós: RMS { "1.3e-8" } e { "2.6e-8" } mGal, máx { "2.9e-8" } mGal contra limiares pré-registrados de { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — a decimação registrada de 6 segundos de arco do tile SRTM v3 N36W117, de domínio público, situa Badwater Basin, o ponto mais baixo da América do Norte, a −{ "78" } m dentro da faixa de levantamento [−{ "95" },−{ "70" }] m e lê o verdadeiro relevo de cerca de ~{ "2.2" } km da cordilheira oriental do tile; além disso, em dois recortes registrados literais de 1 segundo de arco, 361x361, de N36W119 e N36W117, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m na faixa [{ "4380,4430" }] m em torno do levantamento de { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m em [−{ "95" },−{ "70" }] m) e gdal_cross_check (o nó mais próximo é exatamente igual ao gdallocationinfo do GDAL { "3.8.4" } nos tiles completos em todos os { "8" } pontos pré-registrados, xval/srtm-ungate/; além das referências independentes de ponto médio bilinear construído à mão e de analisador de fixtures sintéticas)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } estados / { "2" } fixtures decodificados byte a byte de forma idêntica pelo analisador independente <c1/>, pos/vel Δ = { "0" }); oem::tests (análise de um OEM de ferramenta externa com palavras-chave/comentários/covariância extras, ida e volta escrita→leitura do estado completo, pos+vel+acel tolerados, só posição + metadados obrigatórios ausentes rejeitados, ida e volta do cenário de alta fidelidade + ingestão externa); dominance_demonstrators (alcançável + reprodutível + ida e volta exata + MODELLED-not-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Analisador CCSDS-502 independente de terceiros <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — uma base de código separada que decodifica o OEM EME2000/UTC emitido pelo kshana de forma idêntica byte a byte ({ "24" } estados em { "2" } fixtures, pos/vel Δ = { "0" }) e cujo leitor estrito confirma os tokens de metadados; o analisador do kshana também concorda com ele em um OEM externo incorporado ao repositório. Dois achados honestos de interoperabilidade (a biblioteca oem rejeita a convenção de múltiplos segmentos por satélite do kshana e suas linhas de covariância com várias entradas) estão documentados no teste — portanto isto valida o intercâmbio aderente à norma de objeto único, não a aderência plena à norma CCSDS-502 de todas as variantes do kshana

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (raio angular de { "64" }° a { "700" } km + diminui com a altitude, nadir→zênite/alcance zero, horizonte→ε=0/ângulo central máximo, erros além do horizonte, a faixa de imageamento cresce com o FOV / o GSD com a altitude, espaçamento de nós de ~{ "2750" } km, cenário reprodutível/MODELLED + rejeição de entradas inválidas); dominance_demonstrators (alcançável + reprodutível + raio angular de { "64" }° + MODELLED-not-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (altitudes 400-1500 km, inclinações 1-98 graus, meio FOV 7.5-50 graus, IFOV 10-50 microrad, giro de { "30" } e { "89" } graus: cada grandeza dentro do seu limiar pré-registrado, indicador de contiguidade 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regressão tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (os bits do cabeçalho coincidem com o layout CCSDS-133, codificar→decodificar reproduz todos os campos, fora de faixa/truncado rejeitados); tests/ccsds_space_packet_reference.rs ({ "33" } casos contra spacepackets { "0.32.0" }, incluindo { "12" } comparações de pacote completo; zero octetos divergentes)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, controle de erro de pacote, segmentação e remontagem, decodificação de fluxo)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (cinco limiares pré-registrados: CRC, códigos de tempo, fluxos, lacuna e ordem, PUS TM; zero divergências); space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (inventário, avaliação, identidade de bits e de bytes, conversão de época do OEM; quatro verificações de mutação planejadas o deixam vermelho)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (inventário, avaliação nos dois sentidos, identidade de bytes); spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 o Orekit lê { "33" } arquivos do Kshana, L2 o Kshana lê { "31" } arquivos do Orekit, L3 { "135" } rotações de registros; achados fixados); adm::tests; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 o Orekit lê { "30" } arquivos do Kshana, L2 o Kshana lê { "25" } arquivos do Orekit; achados fixados e verificados como recorrentes); odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (o torque GG se anula para um corpo simétrico, cresce em altitudes menores, linear em ΔI, soma em quadratura RSS, frações de variância somam 1); tests/attitude_gg_torque_reference.rs ({ "20" } casos contra um torque GG independente de tensor completo T=(3μ/R³)(n̂×(I·n̂)) maximizado numericamente sobre a atitude com álgebra linear do Hipparchus { "3.1" }; pior rel { "6e-15" }, + faixa publicada de Wertz/Sidi de O({ "1e-6" }) s⁻²); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } casos contra o GravityGradientEffector do Basilisk { "2.9.1" }: pico na atitude de { "45" } graus dentro de { "1e-12" } relativo, pior { "2.1e-15" }; nenhum torque acima do pico em { "2000" } atitudes aleatórias por caso, { "3" } tensores de inércia diagonais e { "5" } gerais, { "5" } altitudes)

# text
seg-49b30066ff1b = passes::tests (cruzamento de interpolação linear + seguro contra casos degenerados, passagens de polar→latitude média, máscara mais alta ⇒ menos passagens ou igual); tests/ground_station_pass_prediction_reference.rs ({ "22" } cenários / { "129" } passagens contra o ElevationDetector do Orekit { "12.2" }; pior |Δ| AOS/LOS { "0.0000" } s, elevação máxima { "0.0014" }°, acesso total { "0.0001" } s, mesmo número de passagens)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } casos, { "1210" } passagens: AOS/LOS dentro de { "3.4e-6" } s, limiar { "5" } ms; elevação máxima dentro de { "5.5e-7" } graus, limiar { "1e-3" } grau; { "8979" } direções aparentes dentro de { "8.8e-7" } graus, limiar { "1e-4" } grau); tests/earth_orbit_path_sgp4_erfa_oracle.rs (o caminho); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (achado da rodada 1, fixado; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (forma da perda em espaço livre, fechamento da equação do enlace); tests/one_way_link_budget_reference.rs (DCT em banda X da Galileo do DESCANSO/JPL reproduzido de ponta a ponta + { "6" } casos de FSL da ITU-R P.525 nos centros de banda S/X/Ka da DSN; pior |ΔFSL| { "4.6e-3" } dB, |Δportadora| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (taxa em forma fechada; ida e volta); tests/lunar_coordinate_time_reference.rs (termos de autopotencial e de taxa secular do LTC contra valores publicados de Ashby & Patla { "2024" } + velocidade geocêntrica da Lua contra o JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests e realtime_frame_eop::tests (os três componentes têm conjuntos de épocas iguais, idênticos elemento a elemento e estritamente crescentes, nos dois extratos reais do IERS; o conjunto combinado se reduz à interseção quando os dois blocos do Boletim B realmente divergem, e um horizonte sem linhas compartilhadas é omitido em vez de preenchido com zeros; o vazio da tabela de previsto versus final é declarado no documento em vez de implícito por um campo ausente; uma segunda versão real a preenche, conferida linha a linha; uma versão posterior ausente é um erro, não uma tabela vazia silenciosa); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tabelas { "3" }, { "4" } e { "6" } do cenário de ponta a ponta: conjuntos de épocas exatos, estatísticas de UT1 e do polo dentro de { "1e-9" }, a combinação na Lua dentro de { "1e-5" } de uma rotação completa do ERFA, o estado declarado de cada caso de previsto versus final); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } a { "1.100" } em { "1" } a { "90" } dias); censo de linhas: tests/embedded_eop_vintage_astropy_preregistered.rs (linha de entrada offline); regressão da rodada 1: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (seis critérios exatos: os bytes do extrato; { "174" } linhas; contagens por versão e listas completas de MJD 30/54/90; indicador P em ambos, movimento polar e UT1, de toda linha prevista; o censo da execução padrão simples; toda linha prevista igual ao Boletim A do IERS Vol. XXXIX n.º { "039" } dentro do último dígito impresso, pior { "5.0e-5" } segundo de arco e { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (fixação de regressão do antigo extrato de 32 linhas sob o classificador de indicadores: { "20" } finais, { "12" } rápidas, { "0" } previstas); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (o achado da rodada 1, mantido); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } atrasos em { "25" } épocas próximas a J2000 sobre DSS-14, DSS-43 e DSS-63: atrasos dentro de { "1" } ps, pior { "0.06" } ps; derivadas parciais do farol no referencial do corpo dentro de { "1e-6" }, pior { "7.4e-9" }; derivadas parciais das estações no ITRF93 dentro de { "1e-6" }, pior { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (verificação cruzada da avaliação do kernel); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } estados de de440s.bsp e { "200" } rotações MOON_PA_DE440 em { "200" } épocas de 1849-2150 e pares aleatórios de corpos sorteados a partir do próprio hash do commit de pré-registro, contra o SPICE e o ANISE em kernels recortados idênticos bit a bit aos da NAIF: pior diferença { "0.6" } % do seu limiar, { "1.95e-3" } m absolutos); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (o mesmo nos arquivos completos da NAIF, com SHA-256 verificado; condicionado à presença dos dados); tests/naif_kernel_reader_check.rs (proteção de engenharia, não evidência); naif_kernel::tests; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } testes da biblioteca: a divisão é aditiva e reconstrói dy; uma covariância de modo comum produz um nível de proteção de modo comum positivo, enquanto uma covariância só de paridade produz um quase nulo; o projetor anula range(G)); tests/lunar_common_mode_integrity_reference.rs (a divisão do motor contra um cálculo numpy independente em entradas idênticas byte a byte sobre a amostra registrada de 366 épocas, erro relativo E absoluto < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } casos com paridade na geometria de 8 satélites e em um subconjunto de 6 satélites, sobre os dois pares reais de inter-efemérides: blind_dx, resíduo e normas dentro de { "1e-12" } de |dy|, pior { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (recupera a verdade simulada; o VLBI restaura a observabilidade 3-D da estação; determinístico); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } geometrias × { "16" } parâmetros, { "31" } observações cada, contra Levenberg-Marquardt do Orekit { "12.2" } / Hipparchus em observações idênticas; estado recuperado, pior |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (seis redes, incluindo uma sem VLBI: passos de Gauss-Newton dentro de { "4.3e-11" }, sigmas formais dentro de { "1.9e-11" }, erros de estação iguais; nas entradas de matemática portátil de { "0.36" }, { "2.4e-11" } e { "1.3e-11" } nas entradas de { "0.30" })

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (autovalores contra numpy.linalg.eigh; covariância CRLB contra σ²(XᵀX)⁻¹ via numpy.linalg.inv; GDOP/PDOP/HDOP/VDOP/TDOP de GNSS a partir da matriz de informação contra numpy — todos coincidentes até { "1e-9" }); fim::tests (autossolucionador de Jacobi contra espectros em forma fechada; CRLB contra as formas fechadas de Kay { "1993" } — DC em WGN σ²/N e ajuste de reta σ²(XᵀX)⁻¹; alcance do CRLB por Monte Carlo; identidade de Moore–Penrose MM⁺M=M; espaço nulo do defeito de datum)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (recupera a transformação de Helmert injetada); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } casos contra um solucionador independente de Umeyama-SVD em forma fechada; pior |Δ| translação { "2.0e-5" } m, rotação { "5.3e-12" } rad, escala { "9.3e-2" } ppb, RMS pós-ajuste { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (o DOP reutiliza o núcleo validado; o PL se reduz ao caso do polo sul); tests/lunar_navigation_service_volume_reference.rs (posição MCI por satélite até <{ "1e-3" } m + conjunto de satélites visíveis EXATO em toda a varredura de grade×época contra o ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (os { "210" } códigos primários AFS-Q sempre; com KSHANA_LANS_RUN e o cache do LSIS, todos os { "630" } códigos, zero divergências de chip); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (com o cache do LSIS: { "3" } quadros, zero divergências de símbolo; { "24" } janelas registradas de { "2" } ms, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (condicionado à presença dos dados: execução inteira de { "23.9" } s, |rho| = { "0.999990" }, pior bloco de { "2" } ms { "0.999948" }, fase { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (com o cache do LSIS: os { "3" } quadros que o LANS-AFS-SIM transmite, construídos a partir do mesmo FID, TOI e bits de dados: zero de { "18 000" } símbolos diferem); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (Figura { "8" } do LSIS: 0x045 -> 0x229f61dbb84a0; valor de verificação CRC-24/LTE-A 0xCDE703; sempre executado); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } palavras-código, zero verificações não satisfeitas do H impresso); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (decodificador a partir apenas de H, sem ruído e a { "3" } dB de Es/N0, e { "10" } quadros completos); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } canais: pior pseudodistância { "1.6e-3" } m contra { "0.05" } m, fase do código { "5.5e-6" } chip contra { "2e-4" }, Doppler { "7.4e-5" } Hz contra { "0.02" } Hz, ângulos de visada { "4e-9" } grau contra { "1e-4" }, conjunto visível idêntico); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (o arcabouço de referência independente reproduz exatamente a listagem de canais impressa pelo próprio programa)

# text
seg-80e62d2d7748 = lunar_service::tests (topocêntrico contra geometria calculada à mão: sobre a cabeça, norte/leste/oeste exatos, antipodal e a direção leste degenerada no polo; o indicador de visibilidade exportado concorda com o filtro de visibilidade independente em uma varredura completa de { "6" } h; a exportação vem desligada por padrão e comprovadamente não altera mais nada; os níveis de proteção são exatamente lineares no sigma exposto, enquanto a geometria subjacente permanece intacta); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } amostras em { "8" } locais, { "12" } épocas e { "8" } satélites contra o ANISE { "0.10.2" }: azimute e elevação dentro de { "1e-6" } grau, distância e posição do local dentro de { "1" } mm; pior { "2.2e-12" } grau, { "2.1e-13" } grau, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (inversa de aplicar/resolver, torque nulo do pião esférico, ponto fixo do eixo principal, conservação de energia+momento em execução curta, q̇=½q⊗ω, sinal da taxa do pião simétrico + precessão do cone do corpo); tests/attitude_dynamics_reference.rs ({ "200" } 000 execuções de passos sem torque: |q|={ "1" } até { "1e-10" }, energia cinética T=½ωᵀIω conservada até { "1e-9" } rel, |Iω| e o vetor de momento inercial conservados até 1e-9/1e-8 rel, tanto em uma inércia triaxial quanto em uma inércia geral não diagonal; precessão do cone do corpo do pião simétrico achatado + alongado reproduzida até { "1e-6" } contra o λ=ω₃(I_a−I_t)/I_t analítico); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (duas inércias gerais não diagonais, { "1e4" } s sem torque contra o hub de espaçonave do Basilisk { "2.9.1" } com RKF78: quatérnion dentro de { "1e-9" }, pior { "3.3e-11" }; taxas do corpo dentro de { "1e-9" } rad/s, pior { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, SHM transversal desacoplado); tests/cw_dynamics_reference.rs (Φ em forma fechada contra uma integração RK4 independente de passo fixo das mesmas EDOs de Hill até <{ "1e-6" } ao longo de um terço de órbita; Φ(t)Φ(−t)=I até { "1e-9" }; a condição limitada ẏ₀=−2n·x₀ fecha o estado completo após um período até { "1e-9" }, sem deriva secular ao longo da trajetória em { "10" } órbitas; um deslocamento puramente radial deriva o −12π·x₀ analítico por órbita); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (quatro casos a { "100" } m ao longo de um terço de uma órbita de { "500" } km: pior { "1.15e-7" } m contra { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (só o Φ linear: { "1.2" } a { "6.3" } mm, fixado)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (pico de { "35.44" } g contra os { "33.4" } g publicados, +{ "6.1" } %, limiar { "10" } %; velocidade de entrada relativa ao planeta { "12.551" } km/s contra { "12.6" }, limiar { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (a energia no referencial rotativo cai exatamente pelo trabalho do arrasto; a inércia no vácuo conserva a energia de Jacobi; o caso balístico não rotativo coincide com a massa pontual planar do módulo de reentrada; a forma fechada de Allen-Eggers no seu regime)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } casos, { "601" } amostras cada: MRP pior { "2.4e-14" }, limiar { "1e-9" }; taxa do corpo { "1.6e-15" } rad/s, limiar { "1e-9" }; velocidade da roda { "2.9e-11" } rad/s, limiar { "1e-6" }; torque do motor aplicado { "1.2e-13" } N m, limiar { "1e-9" }; torques em t = { "0" } dentro de { "1e-12" } N m; saturação atingida nas duas ferramentas); aocs::tests (momento angular conservado, mapeamento de norma mínima, ramo MRP, convergência sob saturação); aocs_kind::tests

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(quatérnion identidade)=I; o autossolucionador de Jacobi satisfaz Kv=λv e preserva o traço em uma matriz simétrica conhecida; K é simétrica); tests/wahba_reference.rs (TRIAD, o método q de Davenport e o QUEST reproduzem a DCM ótima de scipy.spatial.transform.Rotation.align_vectors em conjuntos de vetores ponderados sem ruído até <{ "1e-9" } rad pelo ângulo de erro de atitude agnóstico de referencial; além disso, o método q recupera uma rotação conhecida com λ_max=Σ pesos e perda de Wahba nula, a solução do método q minimiza a perda de Wahba sob perturbação, o QUEST concorda com o método q ótimo até <{ "1e-7" } rad, e o estimador ótimo supera o TRIAD de dois vetores no erro RMS de atitude em { "2000" } tentativas ruidosas de Monte Carlo)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (caso central de Marcum-Q Q_1({ "0" },b)=exp(−b²/2); a identidade P_d=Q_M(√(2Mρ),√γ); ida e volta P_fa↔limiar em M e P_fa; monotonicidade da ROC — P_d sobe com a SNR, cai com o limiar, P_d→P_fa quando SNR→{ "0" }; o ganho de integração não coerente eleva P_d com P_fa fixa; Marcum-Q monótona em a e b e limitada em [{ "0,1" }]); tests/acquisition_reference.rs (o Q_M(a,b) de Marcum generalizado, P_d, P_fa e a inversão P_fa→limiar comparados com scipy.stats.ncx2/chi2 em uma grade (M,a,b)/(M,P_fa)/(M,SNR) até ~{ "1e-6" })

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ reconstrói Q); tests/lambda_reference.rs (a transformada Z é unimodular |det Z|={ "1" } com Q_z=ZᵀQZ SPD, preserva o determinante e tem menor correlação total fora da diagonal; o ILS de Schnorr–Euchner coincide com a enumeração por força bruta em { "300" } covariâncias aleatórias; o pipeline completo decorrelacionar→buscar→transformar de volta é igual ao ILS direto e Z⁻ᵀZᵀ leva inteiros de ida e volta; a taxa de sucesso bootstrap em forma fechada coincide com um Monte Carlo de 200k tentativas de arredondamento condicional sequencial até <{ "0.01" }); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (os inteiros fixados são iguais ao lambda() do RTKLIB v2.4.2-p13 em { "300" } covariâncias aleatórias, n de { "2" } a { "10" }, { "226" } delas não resolúveis por arredondamento; as duas melhores normas ao quadrado concordam até { "1e-9" } relativo, medido { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (os escalares do sobrevoo satisfazem as formas fechadas, com duas identidades de |B| concordantes e |B|>r_p; o ângulo de giro diminui com o raio do periapsis e atinge os limites δ→{ "0" } / δ→π; a deflexão preserva a velocidade v∞ e gira exatamente de δ; a magnitude do Δv de assistência é igual a { "2" }·v∞·sin(δ/2) e é limitada por { "2" }·v∞; os eixos do plano B são ortonormais e ⊥ Ŝ com |B|²=(B·T̂)²+(B·R̂)²; o parâmetro de Tisserand é invariante em uma deflexão que preserva v∞ e que altera a,e,i, e é igual a { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (identidades de aritmética complexa, incluindo z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; o direcionamento determinístico de nulos dá ganho unitário exato para o SV e nulos de interferentes <{ "1e-9" } em um ULA de 4 elementos com { "3" } interferentes; um arranjo de N elementos rejeita >N−{ "1" } interferentes e anula menos deles por norma mínima; o MVDR permanece sem distorção em direção ao SV enquanto o nulo do interferente se aprofunda monotonicamente com a potência do interferente até <{ "1e-3" } a { "60" } dB); tests/crpa_reference.rs (os vetores de pesos MVDR e de direcionamento de nulos de norma mínima e os ganhos de resposta do arranjo resultantes comparados com um cálculo independente em numpy/scipy LAPACK até ~{ "1e-9" })

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (cada tipo de ruído puro mostra sua inclinação log-log característica de ADEV — FM branco −½, FM flicker { "0" }, FM de passeio aleatório +½, PM branco −{ "1" }; o termo de FM flicker é um piso plano igual a √({ "2" } ln2·h_{ "{" }-1{ "}" }) ao longo de cinco décadas de τ; o ajuste da família FM recupera, em ida e volta, h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 conhecidos de uma curva sintética até <{ "1e-6" }; e o piso de uma curva dominada por flicker é recuperado aqui, enquanto o ajuste de base de deriva (quantum_trade::qparams_from_adev_curve) erra em >{ "10" }% em τ longo — fechando uma lacuna documentada); tests/powerlaw_oadev_reference.rs (σ_y(τ) comparado com as formas fechadas de Noise.adev do allantools { "2024.06" } ao longo da escada de τ para os cinco tipos de ruído, além de uma corroboração do nível h_a pelo gerador de Kasdin → estimador oadev do allantools)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (uma covariância simétrica definida positiva faz a ida e volta KVN→análise até o arredondamento de f64 e permanece simétrica; o bloco emite exatamente as { "21" } entradas triangulares inferiores — i+{ "1" } por linha da matriz — com/sem COV_REF_FRAME; um bloco com a contagem de valores errada e um bloco ausente são ambos rejeitados); tests/ccsds_oem_covariance_reference.rs (a biblioteca independente oem { "0.4.5" } analisa um segmento OEM emitido pelo kshana e reconstrói a matriz simétrica { "6" }×{ "6" }, coincidindo com a covariância de entrada do kshana até o arredondamento de f64; com um controle negativo perturbado e uma verificação de que o oem rejeita a variante rotulada CX_X)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — o MESMO analisador CCSDS-502 independente em que se apoia a linha validada 'CCSDS OEM interoperability', uma base de código completamente separada (com seu próprio tokenizador KVN, sua máquina de estados de seção de covariância e sua montagem de matriz em numpy). O kshana emite um segmento OEM completo com seu bloco COVARIANCE triangular inferior de números simples sem rótulo; o oem o analisa e reconstrói a matriz simétrica { "6" }×{ "6" }, coincidindo com a covariância de entrada do kshana elemento a elemento até o arredondamento de f64 — uma genuína ida e volta de intercâmbio entre bibliotecas (comparada com a reconstrução do oem, não com uma nova análise pelo kshana), fechando a lacuna anterior da linha, 'no third-party fixture'

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); tipo de cenário <c1/>

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } pontos, seis termos de erro de { "30" } s a { "3600" } s, classe Tactical, { "45" } graus N, nivelado e apontando para o norte: todos os pontos dentro de { "5" } %, pior +{ "3.70" } % de passeio aleatório de velocidade em { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (o achado da rodada 1 sobre as leis de ordem dominante em Terra plana, mantido como regressão)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } testes da biblioteca: o Jacobiano analítico contra uma diferença finita central de lunar_vlbi::vlbi_delay_s tomada por uma rota que gira para a frente as próprias coordenadas do estado e nunca toca uma derivada parcial, concordando até < { "1e-6" } de 1/c por coluna, com as duas matrizes de informação concordando até < { "1e-6" } da maior diagonal e as covariâncias até < { "1e-5" } relativo; uma geometria unitária ortogonal cuja covariância é c·σ_τ por eixo em forma fechada até { "1e-12" }, que é também o único caso em que o vínculo de equipartição é exato; o espectro da covariância e o sigma 3-D de cada estação invariantes sob uma rotação rígida de toda a rede até { "1e-9" }, com C_rot = R·C·Rᵀ fixado bloco a bloco E uma asserção explícita de que os sigmas por eixo de fato se moveram, de modo que o teste não pode passar de forma vazia; a covariância escalando exatamente como σ² e como 1/N; o limite de traço AM-HM nunca superado; o fechamento do atraso τ_ik = τ_ij + τ_jk fixado em um ULP nos atrasos e nas linhas do Jacobiano, com uma linha de base redundante mostrada como acrescentando informação mas nunca posto; uma única época declarada com deficiência de posto e com um indicador principal nulo; um arco mais longo medido como mais bem condicionado com o mesmo número de observações; o bloco do farol mostrado como inobservável nesta programação; a derivada parcial de Shapiro diferenciada, negligenciada, medida por diferença finita em tempo de execução e emitida em vez de ignorada); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (rede ancorada padrão e rede livre: Jacobiano construído com o SPICE, a programação de 16 observações idêntica, sigmas de estação dentro de { "2.2e-3" }, autovalores { "2.3e-3" }, condição { "2.4e-3" }, indicador principal { "1.0e-3" }, linha de visada { "0.018" } grau, declinação { "0.007" } grau, contra limiares de { "1" } % e { "0.1" } grau; rede livre com posto 8/9 e indicador principal nulo, espaço nulo { "0.006" } grau de distância; NumPy sobre o Jacobiano registrado até { "2e-13" })

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } observações idênticas; posto 3/3; autovalores dentro de { "5.9e-5" }; condição { "5.9e-5" }; sigmas do farol dentro de { "1.7e-3" } contra { "1e-2" }; RMS { "2.9e-5" }; braço de alavanca { "1.4e-8" }; sigmas de P2 { "3.9e-14" } contra { "1e-9" }); lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } casos de volume de serviço — polo sul, latitude média, equatorial, planalto elevado — de { "6" } a { "19" } satélites, σ_URE 10/30/60 m, P_HMI de { "1e-3" } até { "1e-7" }, níveis de proteção entre { "1.7e2" } e { "6.9e3" } m: HPL/VPL contra a referência independente composta RTKLIB + SciPy, pior |Δ| { "1.061e-8" } m e { "1.044e-8" } m contra uma tolerância de { "1e-6" } m; DOP contra o próprio (GᵀG)⁻¹ do RTKLIB até { "1.790e-14" } relativo; K_fa contra scipy.stats.norm.isf até { "2.716e-11" } relativo; três controles negativos — um deslocamento de satélite de { "5" } km, uma mudança relativa de σ_URE de { "1e-6" } e um P_HMI { "0.1" } % mais apertado — cada um medido como deslocando o nível de proteção em pelo menos { "171" }× a tolerância; e uma proteção contra fixtures obsoletas que fixa a geometria registrada, bit a bit, ao que o próprio código de constelação e de visibilidade do motor produz, de modo que um resultado verde não possa sobreviver a uma mudança da constelação por baixo dele)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } vetores publicados + { "6" } controles negativos, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: eliminar o viés nominal erra o VPL publicado em { "2.6457" } m, um erro de { "10" } % no ISM em { "0.2798" } m, K_fa com { "57" } modos em vez de { "12" } em { "0.4015" } m, um erro de +{ "2" } %/+{ "5" } % na variância de integridade em 0.0750/0.1971 m — e um erro de +{ "1" } % o desloca apenas { "0.0339" } m, relatado como o limite de resolução da verificação em vez de escondido; as respostas dos dois documentos erram cada uma a da outra por mais que a tolerância, de modo que os vetores não são intercambiáveis; a fixture registrada e as constantes compiladas são duas transcrições independentes cuja coincidência é verificada, de modo que um valor publicado não pode ser editado de um lado para fazer uma verificação passar; e C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² vale para todas as { "40" } variâncias transcritas, uma identidade aritmética que um erro de transcrição quebraria)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (compondo fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } testes: todos os { "15" } arquivos CRD registrados idênticos byte a byte aos seus digests registrados; todos os { "349" } registros contabilizados, { "337" } usados e { "12" } descartados por um motivo nomeado; toda distância arquivada dentro do envelope real de perigeu/apogeu; os pesos mostrados como SENDO bin_rms/√n_raw; a coordenada da linha de visada melhor determinada para cada arranjo, com a varredura de libração que a proporciona medida separadamente; o resíduo e sua confirmação independente contra o JPL Horizons; a sensibilidade à inclinação de geometria de 0.1 grau; a comparação de campanha simulada mostrada como igual a uma execução independente desse cenário; uma fixação R1 bit a bit nos três pacotes de referenciais lunares preexistentes); lunar_llr::tests ({ "12" }: a derivada parcial da distância contra uma diferença finita central do tempo de voo modelado até < { "1e-6" } relativo; o tempo de luz de uma viagem lunar de ida e volta convergida; o sigma do datum exatamente linear na escala do peso até { "1e-9" }; bloco-diagonalidade exata; um diretório de dados ausente recusado em vez de substituído; uma linha de catálogo editada detectada pela sua própria coluna de raio); realdata::llr_crd::tests ({ "7" }: semântica dos campos, virada da meia-noite, recusa de uma escala de tempo que não seja UTC e de uma versão de formato não suportada, e nenhum sigma substituto para um compartimento vazio); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, fixado; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } pontos normais inéditos do 2025-Q2; sigmas e normas, pior { "1.11e-3" } de { "1e-2" }, condição { "8.95e-4" } de { "2e-2" }, razões { "1.79e-3" } de { "2e-2" }, contabilidade, postos e acoplamento exatos)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } pontos normais inéditos do 2019-Q2; sigmas e normas dentro de { "4.0e-5" } de { "1e-2" }, condição { "1.6e-5" } de { "2e-2" }, razões { "7.6e-5" } de { "2e-2" }, contabilidade e postos exatos); tests/validate_llr_datum_kernel_moon.rs (o diagnóstico de dados já vistos de { "2015" }, { "0.049" } % em tz; não é evidência para esta linha); lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } estados geocêntricos semanais, ângulo da pior época afirmado < { "0.3" }° e RMS < { "5e5" } m contra a própria alegação documentada do módulo, além do resíduo de LLR afirmado como concordante com a discordância radial até < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } pontos normais reais)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (posto 1, fusão/exclusão, dominância do viés, verificação cruzada de IR); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } casos registrados: estimadores de subconjunto por lstsq do numpy, covariância geral de separação, PL por brentq do scipy; PL dentro de { "1e-9" } relativo, pior { "1.2e-10" }; subconjunto determinante exato)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } casos SPD registrados: fator, resíduo branqueado, operador de branqueamento e quadrado de Mahalanobis contra o numpy LAPACK dentro de { "1e-12" } relativo, pior { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } casos registrados: alpha_ss, alpha_cm e o mínimo dentro de { "1e-12" } relativo em { "210" } casos bem condicionados e de fronteira, pior { "3.3e-15" }; { "40" } mal condicionados até a condição { "1.3e8" } dentro de um limite declarado escalado pela condição, pior { "1.1e-9" }; seis infinitos exatos)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } matrizes SPD sintéticas 7x7, de bem condicionadas até quase degeneradas em { "{" }{ "0,3" }{ "}" }; Schur lambda_min / CRLB da origem / |corr| contra SciPy/NumPy até <{ "1e-9" } rel)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } épocas aleatórias fora dos nós contra o pxform do SPICE no PCK binário: ângulo de rotação dentro de { "1.7e-5" } rad, pior { "1.7e-6" } rad, { "3" } m no raio médio)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } pontos normais do ILRS: RMS { "2.81" } m; só as duas estações ITRF2020 { "2.96" } m; ambos no máximo { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (o modelo superado de tempo de luz geocêntrico, { "10.94" } m, fixado)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } autovalores, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm e a marginal de Schur { "{" }scale,offset{ "}" } para as redes well_posed de 120 linhas e single_epoch de 30 linhas, até rel<{ "1e-3" } e abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m dentro de { "2.8e-6" } de Ashby e Patla { "2024" } com J2 de AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: a entrada radial dentro de { "8.3e-5" } da gravidade equatorial de grau 350 do pyshtools; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: a entrada de velocidade dentro de { "2.5e-3" } da velocidade lunar do DE441 em { "2000" } épocas); lunar_gauge::tests; regressão tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - uma base nula alinhada aos eixos e sua rotação de { "0.6" } rad produzem defect, dim_spatial, dim_temporal, coupled_dim e p_st_norm idênticos; classify_direct_sum_null e classify_coupled_null - casos construídos de soma direta e genuinamente acoplados confirmam a decomposição de dimensões; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } matrizes de Fisher 9x9 construídas sobre { "18" } subespaços nulos, cada uma em quatro rebases ortonormais aleatórios: defect, dim_spatial, dim_temporal e coupled_dim exatos; p_st_norm dentro de { "6.0e-15" }, limiar { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible para { "3" } pares de provedores contra o ajuste independente por lstsq com SVD do SciPy em tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; fixtures + referência independente consistentes byte a byte por scripts/gen_interop_ref.py sobre os kernels públicos DE440/INPOP21a/EPM2021 via IMCCE calceph)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: a matriz P⊥ de { "84" }×{ "84" } elemento a elemento, trace(P⊥) = parity_dim = { "52" } e rank(G) = { "32" }, normas e indicadores de detectabilidade, a forma quadrática do MDB cᵀWP⊥c + valor do MDB, e as contagens de detecção/identificação de block-spark para cada coalizão de pares, reproduzidos contra uma referência independente em numpy/scipy até rel<{ "1e-3" } abs<{ "1e-3" } com contagens inteiras exatas; entradas consistentes byte a byte por examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } fatores de média de MTIE e { "12" } de TDEV em uma série registrada de holdover de relógio atômico em escala de chip, com { "2" } 048 amostras, com envelhecimento, flicker e temperatura, contra o allantools { "2024.06" } até <{ "1e-12" } / <{ "1e-9" } relativo, observado exato / { "1.1e-15" }; as mesmas curvas lidas de uma execução completa de telecom-timing que ingere o CSV); telecom_timing::tests (MTIE deslizante igual a allan::mtie em cada janela; MTIE e TDEV derivados à mão; MTIE monótono)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: ajuste no primeiro terço do registro, previsão da violação de um sigma em { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } e { "2.5" } ns, medida nos outros dois terços a partir de um ponto de sincronização a cada { "997" } s; limiar, fixado antes da primeira execução, um fator de { "1.5" } para mais ou para menos; razões observadas de { "0.84" } a { "1.03" }; um controle, o desvio de Allan de um segundo lido como FM branco, erra por um fator de cerca de { "1 000" } e deve falhar no limiar; uma mutação que reduz à metade o nível de FM branco faz o teste falhar); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz e BPSK({ "10" }) { "20.46" } MHz localizados numericamente sobre a forma fechada; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — nulo da portadora, primeiro nulo em { "2.046" } MHz, centro do lóbulo em { "1.023" } MHz, e o máximo exato em { "0.7590" } MHz contra uma resolução independente de Newton de tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, cada um dentro de { "0.02" } dB; q_values_match_kaplan_hegarty — CW na portadora Q = { "1" }, ruído de espectro casado Q = { "1.5" }, ruído plano de nulo a nulo Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — piso dentro de { "2" } % da variância sobre a taxa de amostragem, total de Parseval dentro de { "2" } %, largura de banda equivalente de ruído de Hann { "1.5" } compartimentos; noise_like_synthesis_is_unbiased_through_welch — mediana de Welch menos modelo dentro de { "0.1" } dB em uma ida e volta por ci16_le; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (PSD de Welch contra scipy { "1.18.1" } signal.welch por compartimento até { "1e-12" } relativo em { "27" } casos, observado { "6.0e-14" }; cinco gravações do sigmf-python { "1.13.0" } decodificadas bit a bit de forma idêntica, com metadados idênticos; gravações escritas pelo crate relidas bit a bit de forma idêntica pelo sigmf-python e válidas pelo esquema do SigMF { "v1.2.6" })

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (baricentros de 1800-2050 a partir da Tabela { "1" } e { "3000" } a.C.-3000 d.C. a partir da Tabela { "2" }, { "8908" } e { "21857" } épocas, pior RMS { "0.778" } do valor da Tabela { "8.10.1" }); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: a Terra por AnalyticSolarSystem e icrf_to_ecliptic, RMS { "0.483" } do valor do EMB; icrf_positions_are_within_the_table_8_10_1_rms: posições ICRF dos corpos da Tabela { "1" } e da Terra, pior { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: a divisão pela série lunar, pior { "0.088" } grau e { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Regressão não bloqueante: tests/solar_system_horizons_reference.rs

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } posições em { "200" } épocas UTC de 1973-2026 sorteadas a partir do hash de pré-registro; pior { "0.66" } do limiar, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (condicionado à presença dos dados); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (baricentros de Mercúrio, Vênus, Marte, Júpiter e Saturno, o Sol e a Lua até o centro da Terra, { "1576" } épocas cada, em posições interpoladas do DE441, pior { "6.7e-9" } s contra { "1e-6" } s); declaração de exatidão não bloqueante para o caminho analítico: tests/solar_system_light_time_preregistered.rs (RMS c dLT de { "0.17" } a { "0.30" } do limiar de posição da Tabela { "8.10.1" }); solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } épocas de { "1955" } a { "2044" }, { "574" } matrizes dentro de { "1e-9" } rad, pior Fobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } épocas de { "1961" } a { "2038" } nunca comparadas antes, { "574" } matrizes dentro de { "1e-9" } rad, pior Fobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } de { "84" } constantes dos catorze corpos diferem das da NAIF)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (todas as { "24" } linhas de RAAN e anomalia média até { "1e-9" } grau); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (a fórmula de slots do ICD e um Walker 24/3/1 são os mesmos { "24" } pares de nó e argumento de latitude); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (o cruzamento equatorial do rastro no solo de todas as { "36" } posições do GPS a partir de RAAN, argumento de latitude e o ângulo horário de { "100.765" } graus: { "35" } dentro de { "0.0108" } grau contra um limiar de arredondamento de { "0.015" } grau, e E3F dentro de { "0.06" } grau porque a própria linha E3F da tabela é inconsistente com seu RAAN e seu argumento de latitude em cerca de { "0.06" } grau; a regressão nodal secular dentro de { "5" } % do -0.0402 grau/dia da tabela); constellation::tests::walker_geometry_identities_are_exact (as três identidades de espaçamento para padrões delta e estrela de até { "1 584" } satélites, até { "1e-9" } grau)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP mediano { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, média { "0.965" } contra { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } e { "0.96" }, limiar { "0.03" } em cada um, fixado antes da primeira execução; PDOP mediano { "1.795" } igual ou inferior ao { "1.815" } da Tabela B.3-1 para uma mistura degradada de 20-24 satélites; disponibilidade de { "100" } % global e no pior local contra os { "98" } % e { "88" } % da Tabela 3.8-1); constellation::tests::single_epoch_dop_matches_the_hand_computation (zênite mais três satélites a { "30" } graus de elevação: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } até { "1e-9" }, e igual a orbit::dop com um relógio comum)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) até { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } da potência no lóbulo principal para BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), e a forma fechada igual à quadratura até { "1e-7" } em { "10" }, { "15" }, { "20" } e { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — até { "1e-4" }, e a assíntota sqrt(B R_c / ({ "2" } pi^{ "2" })); bandlimited_dll_reduces_to_the_textbook_forms — BPSK({ "1" }) early-late coerente a { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms: { "0.0039564" } chips ({ "1.159" } m) dentro de { "1" } %, a forma não coerente igual a navsignal::dll_code_jitter_chips dentro de { "1" } %, o limite de espaçamento evanescente igual à sua forma fechada até { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form — deslocamentos de { "0" } a { "3.2" } R_c dentro de { "0.01" } dB e -71.86 dB/Hz em deslocamento zero para BPSK({ "10" }); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz dentro dos { "32" } a { "34" } kHz publicados; Iridium ({ "1621" } MHz, { "780" } km) dentro de { "0.5" } kHz dos { "36" } kHz publicados

# text
seg-f1cdf8728c6b = Valores publicados: Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler do Iridium de até +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). A rotação da Terra foi deixada de fora, o que desloca o valor em até cerca de { "2.3" } kHz; os dois valores publicados são atingidos sem ela.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: todas as { "115" } linhas da Tabela { "5" }, de { "1" } GHz a { "1000" } GHz, cada coeficiente dentro de { "0.6" } do seu último dígito impresso; pior observado { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } casos em cinco locais, { "14.25" } e { "29" } GHz, de { "0.001" } % a { "1" } %, dentro de { "1e-4" } dB; observado { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } casos em sete locais, { "14.25" } e { "20" } GHz, dentro de { "1e-5" } dB; observado { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } valores, { "28" } GHz a { "0" } grau e { "2" } GHz a { "45" } graus, ambas as classes, P de { "1e-7" } a { "0.998" }, dentro de { "0.001" } dB)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } até { "1e-12" }, amplificação L1/L2 e L1/L5 de { "2.978" } e { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f até { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } graus, Pulsar FOC polar { "1080" } km { "97" } graus, Pulsar FOC inclinado { "1080" } km { "53" } graus e GPS { "20180" } km { "55" } graus; velocidade orbital, velocidade ECEF máxima, velocidade relativa máxima e Doppler máximo da portadora nas bandas L1 e L5, { "20" } valores, cada um dentro de { "0.05" } %)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } e 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } e 1/61.1, BeiDou MEO 1/54.2, geoestacionário { "0.992" } e 1/126.2 com máscara de { "0" } grau, cada um dentro de { "0.005" } de w_R e { "0.5" } de 1/w_AC^{ "2" }; leo_weights_shift_toward_the_transverse_axes — ângulo de nadir do horizonte de { "67.8" } graus a { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — quatro efemérides reais de difusão do Galileo E10, E19, E24, E25 em tk = { "0" }, +/-600, +/-1800, +/-3600 s, cada eixo dentro de { "1" } mm do RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block — dentro de { "5" } mm após o quadro binário do Kshana e { "1" } mm após o bloco de estilo RINEX)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 para a cadeia ASCII { "123456789" }; crc24q_matches_the_rtcm_1005_example_frame — os três bytes de verificação 0x360B98 do quadro de exemplo da mensagem RTCM { "10403" } de tipo { "1005" }, e zero sobre o quadro inteiro)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (crescimento monotônico de { "1" } a { "15" } minutos e melhoria de pelo menos três vezes em { "15" } minutos); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (órbitas de dinâmica reduzida ITSG da TU Graz de GRACE-A, GRACE-C, Sentinel-2A e Sentinel-6A ajustadas em arcos de { "20" } e { "30" } min: RMS ao longo da trajetória, transversal e radial de { "0.804" } a { "1.087" } e SISRE de { "0.716" } a { "0.809" } de Liu et al. { "2025" }, dentro de 1.5x; pesos de SISRE dentro de { "0.0007" } da sua Tabela { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, mesmo estado inicial e mesma entrada de densidade: pior { "3.95" } mm de dois corpos, { "3.92" } mm de J2-J6 e EGM2008 até o grau { "20" } e { "70" }, { "4.55" } mm de EGM2008 de grau { "20" } com arrasto a { "400" } km, limiar { "0.02" } m em { "6" } h); verificação cruzada interna, não uma referência independente: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (quatro dias do artigo: razões de trajetória, transversal, radial e SISRE de { "0.755" } a { "1.138" } de Liu et al. { "2025" }, dentro de 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (oito dias reservados, dois arcos cada: { "0.683" } a { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — o valor em L1 é o { "6.1278" } m do RTKLIB; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar em L1, L2 e L5 em { "4 320" } casos, pior { "7.0e-13" } m; Az em { "222" } conjuntos de coeficientes, incluindo as regras de tudo zero e de { "400" } sfu, pior { "5.7e-14" } sfu; deriva de UTC em { "50" } casos, pior { "3.6e-15" } s; os três casos de segundo intercalar em { "21 602" } instantes através dos segundos intercalares reais de { "2015" } e { "2016" }, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: um satélite a { "780" } km e { "86.4" } graus voado por um dia a { "1621" } MHz sobre quatro latitudes, máximo dentro de { "5" }% de { "36" } kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: um satélite de cada camada publicada, { "1080" } km a { "53" } e { "97" } graus, { "1593.3225" } MHz, o máximo da constelação dentro de { "32" } a { "34" } kHz sem alargamento ({ "33.6" } kHz, definido pela camada de { "97" } graus; a camada de { "53" } graus sozinha atinge o pico em { "31.8" } kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m à mão a { "5" } MHz, { "45" } dB-Hz, { "0.1" } s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (configurações A e B, { "4040" } amostras: posições fixas à Terra dentro de { "6.8e-5" } m, limiar { "0.2" } m; contagens de satélites em visada idênticas em 4040/4040; DOP mediano dentro de { "2.3e-11" } relativo, limiar { "1e-3" }; disponibilidade e média em visada idênticas); tests/earth_orbit_path_sgp4_erfa_oracle.rs (o caminho); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (rodada { "2" }, geometria em estados dados); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (achado da rodada 1 sobre a alegação completa, fixado)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: três cenários — estações estimadas em uma nova data de campanha 2026-03-18 (vinculante), estações fixas nessa data (controle), estações estimadas em 2024-01-01 (o cenário da falha anterior em precisão dupla); cada sigma do datum, o número de condição e a direção mais fraca contra um limiar escalado pela condição, recalculado no teste a partir das sensibilidades exatas da referência independente; engine_inputs_match_the_committed_fixture: o Jacobiano, os pesos e o projeto de Helmert registrados são o que o motor constrói agora; record_engine_accuracy_against_a_factorisation_route: a faixa de erro do motor e o diagnóstico de Cholesky do NumPy fixados)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: quatro cenários — estações estimadas em uma nova data de campanha 2026-06-09 (vinculante), estações fixas nessa data (controle), e as entradas de estações estimadas de 2026-03-18 e 2024-01-01; cada sigma do datum, o número de condição e a direção mais fraca contra um limiar na forma de raiz quadrada, recalculado no teste a partir dos ingredientes exatos da referência independente; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } testes da biblioteca: o produto de Dekker igual ao resíduo da multiplicação-adição fundida em { "20 000" } pares, soma compensada de uma soma com cancelamento, R^T R igual a A^T A, atualizações sequenciais do filtro iguais a uma atualização em lote, o bloco final igual à raiz quadrada do complemento de Schur, a inversa triangular, o SVD de Jacobi, concordância com o datum espectral em um caso bem condicionado, reexecuções idênticas bit a bit); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected e the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) contra tests/fixtures/maritime_trust/reference.json, regenerado por scripts/gen_maritime_trust_ref.py a partir do NMEA sintético escrito por examples/gen_maritime_trust_ref_inputs.rs; tolerâncias pré-registradas em tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (comparação com a referência independente pynmea2); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } códigos NACp, { "59" } linhas NIC); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } quadros); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } pontos, quatro tamanhos de célula); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } rotas, { "420" } trechos, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } pontos); testes unitários de interference_map

# text
seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

# text
seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces; esquema { "1.3" }: prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged); tests/telemetry_cli.rs; telemetry::prometheus::tests (exposição de referência)

# text
seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

# text
seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered); telemetry::syslog::tests (cadeias CEF exatas, escape, severidade, envelope RFC { "5424" }); tests/telemetry_cli.rs

# text
seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

# text
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (vetores { "1" }, { "2" }, { "3" } e { "1024" } da seção { "7.1" } da RFC { "8032" }; exemplos de SHA-256 do FIPS 180-4; exato); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } casos); tests/evidence_pack.rs (testes de adulteração)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (a comparação pré-registrada); evidence::tsa::tests (datas e horas civis, base64, a operação pública RSA); evidence::verify::tests::anchors_make_the_authority_checked (um token sem assinatura falha com âncoras; sem elas o relatório permanece inalterado)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } testes: fixações da referência independente, bytes da exportação, pior caso sobre cada linha, colunas de posição, velocidade local contra a velocidade NED verdadeira, ângulos de Euler contra scipy, NMEA contra pynmea2); tests/interop_testbench.rs (as próprias idas e voltas do escritor)

# text
seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

# text
seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

# text
seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

# text
seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

# text
seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay); tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

# text
seg-6bb40f180cf0 = <s1>Anterior</s1>Situação da validação

# text
seg-defb46c5bc80 = <s1>Próximo</s1>Referência de capacidades
