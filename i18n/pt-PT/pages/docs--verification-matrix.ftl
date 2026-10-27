# docs--verification-matrix: translations (pt-PT)

# text
seg-619f89bf160c = Realização do referencial lunar

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Mapeamento de compliance para quadros públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Estado

# text
seg-60a43431ebe0 = Requisito

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-1603e76bcf66 = Identificação de ruído de lei de potência por autocorrelação de desfasamento 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: o identificador de ruído por autocorrelação de desfasamento 1 de Riley e Greenhall ({ "2004" }) (fase decimada com a sua componente quadrática removida, ou frequência com média por grupos com a sua reta removida; primeiras diferenças repetidas até delta = r1/({ "1" }+r1) < { "0.25" } ou d = dmax), que devolve o expoente de lei de potência alpha, inteiro e não arredondado (+{ "2" } PM branco a -2 FM de passeio aleatório), a qualquer fator de média; define os graus de liberdade por tipo de ruído dos cartões de dispositivo da biblioteca de relógios medidos

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin e colaboradores, LGPL-3.0-or-later, executado como programa separado pelo gerador de fixtures): uma implementação independente do algoritmo publicado de Riley-Greenhall, uma grandeza univocamente definida sob as convenções indicadas. Valida o identificador, não o conteúdo de ruído de qualquer relógio real

# text
seg-aedf395f3597 = Autenticação de dados de navegação do Galileo OSNMA no lado do recetor

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: um verificador aberto, em Rust puro, do lado do recetor para o OSNMA do Galileo (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) a partir de páginas I/NAV ou de um fluxo UBX-RXM-SFRBX da u-blox: chaves públicas em árvore de Merkle (DSM-PKR), a assinatura ECDSA P-256/P-521 do DSM-KROOT, verificação da cadeia de chaves TESLA (SHA-256 ou SHA3-256), verificação de MACSEQ e de etiquetas (HMAC-SHA-256 ou CMAC-AES) para ADKD { "0" }, { "4" } e { "12" } com autenticação cruzada, fim/revogação/renovação da cadeia, renovação e revogação de chaves públicas, e a mensagem de alerta; estado por satélite Authenticated/Failed/Unavailable com uma razão para cada falha ou atraso. Consultivo: não é um equipamento de navegação homologado nem um serviço de integridade de navegação; não é afirmado nenhum desempenho antispoofing

# text
seg-a6bd60ed728f = Os vetores de teste oficiais do Galileo OSNMA publicados pelo European GNSS Service Centre como anexo às Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } de { "18" } conjuntos, { "186,382" } etiquetas autenticadas, { "0" } falhadas, executados offline em 2026-10-10 (registo de evidências em kshana-pro docs/evidence). Âmbito: os vetores validam a verificação criptográfica (Merkle, KROOT/ECDSA, cadeia TESLA, etiquetas MACK, ADKD 0/4/12) e os seus resultados nos cenários publicados; usam apenas HMAC-SHA-256, uma cadeia SHA-256, chaves de 128 bits, etiquetas de 40 bits e entradas de consulta { "33" } e { "34" }, pelo que o CMAC-AES, as cadeias SHA3-256 e outros parâmetros são cobertos apenas por testes de resposta conhecida de primitivas publicados e por testes sintéticos. O reforço de tempo de confiança, de associação de dados, de expiração e de confirmação de cabeçalho é testado por testes de ataque sintéticos, não por uma referência independente externa. Não verificados: listas de revogação de certificados, sinais reais ou um recetor real (a disposição das palavras UBX é verificada apenas em tramas sintéticas), árvores de Merkle SHA3-256, atualidade sem um tempo independente. Não é um serviço da UE

# text
seg-27a61718eb95 = Caracterização da estabilidade de frequência

# text
seg-56174d771190 = Desvio de Allan/modificado/de Hadamard + identificação de ruído de lei de potência com ICs χ²

# text
seg-ed01b2ab3481 = Desvios de referência do NIST SP { "1065" } (Riley) / Stable32 no NBS14

# text
seg-25b78672c194 = Estabilidade de frequência num relógio real medido

# text
seg-fd378f5fe04a = Desvio de Allan sobreposto + desvio de Hadamard sobreposto num padrão de césio real

# text
seg-64fd49d58394 = ADEV/HDEV sobrepostos do Stable32 na série de fase medida do césio 5071A (allantools)

# text
seg-f305dbc83f2b = Paridade do estimador de Allan na série de referência canónica do Stable32

# text
seg-5bfca5dcfb7c = Desvio de Allan sobreposto + Allan modificado + desvio de tempo em toda a escala de AF

# text
seg-327ab6dcf16a = Desvios de referência do Stable32 para PHASE.DAT (Riley; a série de regressão padrão)

# text
seg-96c4275f5a89 = Estabilidade de frequência de alcance alargado (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 e desvio total (TOTVAR) — estimadores de estabilidade de tau longo e alcance alargado que chegam a ~{ "75" }% do registo, onde o desvio de Allan se esgota perto de ~{ "50" }%; o híbrido ThêoH sem viés (allan::theoh_curve) construído sobre eles permanece MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" } — uma biblioteca de estabilidade de frequência independente de terceiros — theo1 (NIST SP { "1065" } eq { "30" }) e totdev (NIST SP { "1065" } eq { "25" }) no conjunto de dados LCG hermético do NIST SP { "1065" } §{ "12.4" }; regenerável offline através de tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

# text
seg-cc40472fbcbf = Erro Máximo de Intervalo de Tempo (MTIE) — métrica de wander de telecomunicações

# text
seg-5c54ba2748f7 = MTIE(τ): a maior oscilação pico a pico do erro de tempo em qualquer janela deslizante de τ = m·tau0, a estatística de wander ITU-T G.810/G.823/G.8261 face à qual são escritos os limites das redes de sincronização (máscaras MTIE) — uma figura extremal (máx/mín) distinta da família RMS de Allan

# text
seg-300fd3f945a0 = allantools { "2024.06" } — uma biblioteca de estabilidade de frequência independente de terceiros — mtie() na série de fase LCG hermética do NIST SP { "1065" } §{ "12.4" }; o MTIE é uma estatística puramente de máx/mín, pelo que a saída do estimador é exata ao bit face ao allantools na matriz de fase construída de forma idêntica (as constantes de referência versionadas de 15 algarismos significativos situam-se a { "1" } ULP). Regenerável offline através de tests/fixtures/mtie/generate_mtie_reference.py

# text
seg-67d73f3ca14d = Allan modificado / desvio de tempo (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): o desvio de Allan modificado sobreposto (estimador de janela deslizante de segunda diferença que separa o ruído de fase branco do de fase flicker), e TDEV(τ) = τ/√{ "3" }·MDEV(τ), a estatística de wander no domínio do tempo ITU-T G.811/G.812/G.823 face à qual são escritas as máscaras de sincronização

# text
seg-24a441f32375 = allantools { "2024.06" } — uma biblioteca de estabilidade de frequência independente de terceiros — mdev() e tdev() na série de fase LCG hermética do NIST SP { "1065" } §{ "12.4" } (a mesma série das linhas Theo1/TOTDEV/MTIE), calculando os mesmos estimadores univocamente definidos; coincidem até <{ "1e-9" } em termos relativos. Regenerável offline através de tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (O phasedat_reference.rs condicionado a dados também verifica estes valores face ao Stable32 até { "1e-3" }; esta é a verificação cruzada hermética, apertada e sempre ativa)

# text
seg-e4b6d707cbf5 = Estabilidade de frequência de relógios óticos numa curva real medida

# text
seg-e9077554a08f = Recuperação NNLS de lei de potência (FM branco + piso de ruído vermelho) a partir de um desvio de Allan medido e publicado da transição de relógio ótico do ⁸⁸Sr — reproduzindo σ_y(τ) e a escala de tau curto de 4.7e-16/√τ de destaque com um piso de tau longo genuinamente medido, em vez do piso sintetizado de classe ótica que o holdover.rs assume de outro modo

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Fig. { "4" } ADEV medido; curva incorporada textualmente a partir de Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Limitado à reprodução da curva de estabilidade medida publicada — as figuras de dispositivo de holdover até ao limiar por classe de relógio permanecem MODELLED

# text
seg-cc95c8615d39 = Integridade (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = Separação de soluções por hipóteses múltiplas do ARAIM segundo o ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels e add_v42_protection_levels_ecef: determinação de subconjuntos pelas regras P_THRES e FC_THRES, VPL, HPL, o limiar efetivo de monitor EMT e sigma_acc); deteção de falhas RAIM instantâneo por qui-quadrado com exclusão de um só satélite (raim::snapshot_raim, raim::snapshot_raim_fde) e HPL/VPL baseados em declive no nível local geodésico; e a combinação de níveis de proteção SBAS DO-229E (sbas::sbas_protection_level) no serviço L1. NÃO coberto, declarado de forma clara: as funções de conveniência de sigma uniforme raim::araim_raim e raim::araim_dual_raim NÃO são aderentes à norma ADD (com entradas equivalentes ficam aquém do Stanford MAAST em { "0.75" } m de VPL / { "4.04" } m de HPL e { "0.39" } m de VPL / { "1.93" } m de HPL, um resultado); a comparação SBAS L5 de dupla frequência e multiconstelação (DFMC) é um resultado ({ "308" } pares de época de utilizador sem GEO à vista são protegidos pelo Kshana e não pelo MAAST, cuja barreira de receção de GEO o Kshana não modela); raim::solution_separation_raim não tem comparação externa

# text
seg-a83c68500982 = Três ferramentas independentes, pré-registadas (0123cee1) antes de existir qualquer fixture ou saída de referência independente, com tolerâncias fixadas nessa altura. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, executado como programa separado sob GNU Octave { "8.4" } com um shim de compatibilidade de unique() do lado do controlador (divulgado, sem alteração de algoritmo), no TOL_PL do ADD de { "0.05" } m: o Rust reproduz a implementação de referência do ADD em { "270" } casos reais. Divulgado: o caminho ADD do Kshana foi escrito depois do pré-registo, seguindo o ADD tal como o MAAST o implementa; um conjunto reservado independente do revisor ({ "270" } novas geometrias de utilizador e uma segunda mensagem de suporte de integridade, com o MAAST reexecutado face ao código congelado) passou no mesmo limiar. ({ "2" }) RAIM instantâneo: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde num harness C separado para deteção e exclusão; o PL por declive a partir de matinv/xyz2enu do RTKLIB mais chi2/ncx2 do SciPy { "1.18.1" }, em que ambos os lados avaliam a mesma forma fechada (Brown; Parkinson e Axelrad), pelo que a verificação do PL cobre a implementação e não a fórmula. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, sem modificações, sobre as próprias difusões WAAS registadas do MAAST: níveis L1 até { "1e-4" } m após o reescalamento de K e um conjunto protegido igual. As mesmas comparações produziram os resultados declarados na capacidade: as funções ARAIM de sigma uniforme não são aderentes à norma ADD, e a igualdade de conjuntos L5 falha em { "308" } pares sem GEO à vista (os níveis nos { "3267" } pares que ambas as ferramentas protegem concordam até { "1e-13" } m). Os fatores K do DO-229E/DO-316 são constantes transcritas e a geometria real é uma entrada; nenhum deles é contado como referência independente. Revisão { "0.30" }: os níveis de proteção de snapshot_raim passaram do nível local radial para o geodésico (até { "0.31" } m de HPL e { "0.14" } m de VPL a { "16" } graus N)

# text
seg-1c37702cc5f2 = Propagação e determinação de órbita

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell de 6 graus de liberdade + perturbações, OD em lote/sequencial

# text
seg-c84585f43297 = Vetores de verificação SGP4 AIAA 2006-6753

# text
seg-50c545872e4f = Propagador numérico de Cowell e modelo de forças

# text
seg-74f8c585bcfd = Propagador numérico de Cowell com um modelo de forças hierárquico (dois corpos, zonal J2–J6, terceiro corpo Sol/Lua, SRP de bola de canhão, arrastamento exponencial); duplicação de passo RK4 / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — uma biblioteca independente, com um integrador diferente e uma recursão de harmónicos esféricos diferente. Os níveis conservativos (dois corpos → zonal J2–J6 → terceiro corpo Sol/Lua → SRP de bola de canhão) concordam a menos de um metro ao longo de um arco de { "24" } h, validando o integrador + a álgebra das forças; o nível de arrastamento e a fidelidade absoluta dos dados de efemérides do Sol/Lua / densidade permanecem MODELLED (apenas caracterização)

# text
seg-d38c4be472ac = Sombra de SRP com Terra achatada (opcional)

# text
seg-ab8247c6b4d2 = Fração iluminada da SRP com o elipsoide WGS-84 como corpo ocultante (raio aparente da Terra desde o limbo do elipsoide em direção ao Sol, fórmula de lente de disco duplo; srp_shadow::oblate_conical_shadow), opcional no modelo de forças de Cowell através de propagator::ForceModel::srp_shadow (predefinição: a sombra cónica esférica, inalterada)

# text
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio com um corpo ocultante OneAxisEllipsoid WGS-84 e um esférico, executado como programa separado com o Sol fixo na mesma posição inercial. Limiares pré-registados em xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } em ambos, e uma dispersão achatado-versus-esfera > { "1e-2" }; todos atingidos. O eixo do elipsoide é o eixo z inercial em ambos os lados (sem precessão-nutação)

# text
seg-01066d639b39 = Pressão de radiação solar de caixa-asas e ECOM2, com derivadas parciais (opcional)

# text
seg-2a5fc9708bd0 = SRP sem bola de canhão: um modelo de placas planas de caixa-asas (Vallado eq. 8-44; painéis do corpo de face única, asas apontadas ao Sol) com as tabelas FOC, IOV e IOV em fim de vida do Galileo dos metadados de satélites do GSC, em direção de guinada GNSS nominal, com derivadas parciais analíticas para o fator de radiação e para os coeficientes especular e difuso de cada painel; e o modelo empírico ECOM2 (D2/B1) com as suas derivadas parciais. O caixa-asas é opcional no propagador de Cowell (propagator::ForceModel::box_wing_srp, definindo o seu campo srp_boxwing) e no modelo de determinação precisa de órbita (precise_od::PreciseForceModel::box_wing_srp), substituindo o termo de bola de canhão com cr como fator de radiação; ambos têm por predefinição None, deixando todos os caminhos existentes idênticos byte a byte. O ECOM2 não está ligado a um modelo de forças

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft com FixedPanel e PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), GenericGNSS de guinada nominal e ECOM2(nD = { "2" }, nB = { "1" }), executado como programa separado com o Sol em posições inerciais fixas; a derivada do fator de radiação a partir do Gradient do Hipparchus, derivadas por painel como diferenças centrais do Orekit (o Orekit não as tem). Limiares pré-registados em xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), antes de existir qualquer saída do Orekit: { "1e-12" } em termos relativos ({ "1e-11" } de ponta a ponta, { "1e-9" } para as diferenças); todos atingidos (RESULTS.md). VALIDATED abrange apenas a avaliação do modelo: as tabelas do GSC são entradas transcritas, e a adequação de um caixa-asas a órbitas reais do Galileo, a reemissão térmica, a lei modificada de guinada de beta baixo e as curvas de eclipse não estão cobertas; a previsão de SRP do Galileo permanece MODELLED

# text
seg-bde1b3a94a47 = Sombra de SRP com escurecimento de bordo solar (opcional)

# text
seg-eaaec545dd68 = Fração iluminada da SRP como a fração não ocultada do fluxo solar com escurecimento de bordo (lei de aproximação de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadratura de Gauss-Legendre) sobre uma Terra esférica ou WGS-84 (srp_shadow::limb_darkened_shadow, a variante ShadowModel OblateEarthLimbDarkened)

# text
seg-76cb4b668ad5 = Nenhuma externa: o Orekit { "12.2" } não tem razão de iluminação com escurecimento de bordo. Verificado apenas face a formas fechadas da mesma lei

# text
seg-673b17e9dcf7 = Densidade termosférica NRLMSISE-00

# text
seg-09e997231de8 = Uma portagem da termosfera empírica NRLMSISE-00 (gtd7 e gtd7d: densidades de espécies, densidade de massa total com oxigénio anómalo, temperaturas; os { "24" } comutadores; modos de Ap diário e de matriz ap de 3 horas) a partir da versão em C, de domínio público, do Fortran do NRL

# text
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, que executa o GTD7D em Fortran do NRL em precisão simples, e a portagem em C do NRLMSISE-00 (versão { "20190709" }, domínio público) compilada como programa separado, mais as { "17" } saídas de teste publicadas da distribuição em C. Limiares pré-registados em xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) antes de existir a portagem; todos atingidos (RESULTS.md). Valida a portagem, não a exatidão do modelo face à densidade medida

# text
seg-12977f65b2ea = Nível de densidade de arrastamento NRLMSISE-00 (opcional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential por predefinição, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) e propagator::ForceModel::drag_density: arrastamento quadrático face à atmosfera em co-rotação com a densidade NRLMSISE-00 no ponto geodésico WGS-84 (ângulo de rotação da Terra com UT1 = TT, hora solar local UT + lon/15), meteorologia espacial constante por modelo; desativado por predefinição e idêntico bit a bit

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com DragForce sobre a própria implementação NRLMSISE00 do Orekit, executado como programa separado com o mesmo referencial de ângulo de rotação da Terra, a mesma forma WGS-84, a mesma convenção de hora solar local (um Sol médio) e TT como UT; a configuração das convenções foi verificada entre referências independentes (Orekit vs pymsis, { "5.2e-5" } na densidade). Limiares pré-registados em xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } do deslocamento por arrastamento, e duas verificações de sensibilidade > { "100" } m; todos atingidos. Não coberto: a exatidão do modelo face à densidade medida, a meteorologia espacial variável no tempo, uma vertente com GMAT

# text
seg-1ac7430e88fc = Arrastamento exponencial predefinido face a uma implementação independente (equatorial)

# text
seg-a9c41b03f2ca = O arrastamento predefinido do propagador de Cowell: arrastamento quadrático face à atmosfera em co-rotação com forces::atmospheric_density, a tabela exponencial por troços da Tabela 8-4 de Vallado à altitude esférica (propagator::ForceModel::drag com a variante Exponential predefinida de forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole com a atmosfera Exponential (a mesma tabela de 28 bandas), Terra de massa pontual e PrinceDormand78, executado, nunca incorporado. Limiares pré-registados em xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) sobre o deslocamento por arrastamento de cada lado (execução com arrastamento menos execução sem arrastamento), que cancela os dois valores de mu da Terra e os integradores; todos atingidos (RESULTS.md). O GMAT usa altura geodésica e o kshana altitude esférica: só coincidem no equador, pelo que VALIDATED abrange órbitas equatoriais; fora do equador os modelos diferem por conceção ({ "10.4" } % do deslocamento de { "24" } h a { "51.6" } graus, { "400" } km). A compilação pública do GMAT não tem NRLMSISE-00 (plugin ausente), pelo que o nível NRLMSISE-00 só tem a referência independente do Orekit. A exatidão da tabela face à densidade medida não está coberta

# text
seg-9e15970435c3 = Sol e Lua DE440 no modelo de forças de Cowell (opcional)

# text
seg-de6831cf7785 = Nível opcional de efemérides para os termos de terceiro corpo e de SRP do ForceModel numérico de Cowell: o Sol e a Lua geocêntricos a partir de qualquer EphemerisProvider (um kernel SPK DE440 através de KernelEphemeris) em TDB = TT + (TDB - TT), recusando um fornecedor que não consiga servir a época e contando qualquer recurso à série analítica; desativado por predefinição

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 com ThirdBodyAttraction e SolarRadiationPressure sobre o próprio leitor DE440 do Orekit (orekit-data lnxp1990.440), executado como programa separado; o kshana lê um recorte do NAIF de440s.bsp, exato ao bit e verificado com SPICE. Limiares pré-registados em xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). O limiar de órbita ({ "0.5" } m) e o controlo de sensibilidade são atingidos, mas o limiar de posição do Sol/Lua ({ "3" } m / { "0.2" } m) foi falhado, com { "6.39" } m / { "0.244" } m. O SPICE a ler o mesmo kernel no seu TDB exato fica aquém do Orekit pela mesma quantidade ({ "6.25" } m / { "0.240" } m), pelo que a diferença se situa entre o caminho de de440s do NAIF e o leitor DE440 ou a escala de tempo do Orekit; causa não isolada. Registado e fixado, pelo que a linha permanece MODELLED

# text
seg-057c21daf4f2 = Maré atmosférica S1 (opcional)

# text
seg-f600a39f297e = A maré diurna S1 de pressão atmosférica como perturbação do geopotencial: modelo N1 de Biancale e Bode ({ "2006" }), graus { "2" } a { "6" }, através da fórmula de carga da Eq. { "6.21" } do IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional nos modelos de forças de Cowell e preciso (air_tide_s1, desativado por predefinição)

# text
seg-7dd9fccac779 = Nenhuma externa para o efeito no geopotencial. Os { "24" } coeficientes são transcritos do modelo N1 da Tabela { "1" } do GFZ STR06/01 e foram reverificados linha a linha face ao relatório (SHA-256 890865ae); os graus { "0" }, { "1" }, { "7" } e { "8" } não são usados. Ray e Ponte ({ "2003" }) não imprimem nenhuma tabela de harmónicos esféricos, pelo que não foi comparada nenhuma segunda fonte

# text
seg-b150b1bdb599 = Coeficientes da maré atmosférica S2 na convenção do IERS

# text
seg-87e9238b8c53 = Harmónicos de pressão atmosférica S2 de Ray ({ "2001" }) (n <= { "4" }, progrado e retrógrado) convertidos para a forma totalmente normalizada, com avanço de seno, das Eqs. 6.20-6.21 do IERS { "2010" } (amplitude dividida por N_nm, epsilon = { "90" } graus - psi) e aplicados como termo S2 de tides::atmospheric_tide

# text
seg-4745148b6c60 = Biancale e Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Tabela { "5" }, modelo A2: Ray ({ "2001" }) publicado em harmónicos totalmente normalizados com fases de avanço de seno, uma reprodução independente do mesmo modelo. Pré-registado em xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) com a correção que valida. Cobre apenas a conversão de coeficientes; o efeito da maré atmosférica no geopotencial não tem referência independente externa

# text
seg-444f0a65b6fd = Geopotencial tesseral no propagador de Cowell

# text
seg-ad475816bc78 = Campo tesseral EGM2008 opcional (até grau/ordem { "70" }) como gravidade central do ForceModel numérico de Cowell, avaliado num referencial solidário com a Terra, rodado pelo ângulo de rotação da Terra IAU { "2000" } (ou pela cadeia CIO GCRS-para-ITRS); desativado por predefinição, pelo que nenhuma saída existente se altera

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 com HolmesFeatherstoneAttractionModel sobre os mesmos coeficientes (tools/egm2008_to70.gfc) num referencial do corpo rodado pela mesma fórmula do ângulo de rotação da Terra, executado como programa separado. Limiares fixados antecipadamente (f0e0e65, alterados antes de qualquer comparação em 2da899a): |dr| <= { "0.5" } m e |dv| <= { "5e-4" } m/s, e ambos os controlos negativos falham por > { "100" } m; todos atingidos, limiares depois apertados para { "0.1" } m e { "1e-4" } m/s. Não validado: a fidelidade da orientação da Terra (ambos os lados usam UT1 = TT sem precessão-nutação no referencial Era), a opção de referencial Cio (apenas verificação interna), graus acima de { "70" }

# text
seg-e8f5ff8c9149 = Gravidade de harmónicos esféricos de grau elevado (EGM2008 até { "2190" })

# text
seg-d3b2f32dcecb = Avaliação sem underflow e sem problemas nos polos de um campo totalmente normalizado até ao grau { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, coluna progressiva modificada de Holmes-Featherstone { "2002" } com o gradiente livre de 1/cos phi), um carregador ICGEM .gfc em fluxo contínuo (from_gfc_file / from_gfc_reader; o EGM2008 completo é obtido em tempo de execução, não incluído), e o avaliador de Holmes-Featherstone selecionável no Geopotential de Cowell opcional

# text
seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel e pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, executados como programas separados; limiares fixados antecipadamente em xval/high-degree-gravity/PREREGISTRATION.md (276c869f) e xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). O Orekit concorda em todos os pontos onde está definido, mas o pyshtools falha o seu limiar fixado antecipadamente nos dois pontos próximos do polo (até { "7.3e-10" } m/s^{ "2" }; uma verificação mpmath com 50 dígitos coloca o erro no pyshtools), não existe nenhum valor de referência independente exatamente sobre o eixo polar, e o controlo de sensibilidade ao grau 70, fixado antecipadamente, da órbita de { "24" } h falhou ({ "0.726" } m contra > { "1" } m). Cada falha é registada, não ajustada para desaparecer, pelo que a linha continua MODELLED

# text
seg-e81b7418c382 = Integrador DOP853

# text
seg-e6e3638aa68e = Runge-Kutta explícito de Hairer DOP853 { "8" }({ "5,3" }) com o estimador de erro combinado de 5.ª/3.ª ordem, o controlador de passo SciPy/Hairer, passo inicial automático, uma salvaguarda de passo com falha segura e saída densa de 7.ª ordem; selecionável como variante Dop853 do Integrator do propagador / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) e as suas rotinas de passo único, de norma do erro, de saída densa e de passo inicial, uma implementação independente; estados exatos de dois corpos do mpmath { "1.3.0" } com { "40" } dígitos. Limiares fixados antecipadamente em xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) antes da primeira comparação; todos atingidos (xval/dop853-scipy/RESULTS.md). O primeiro passo do SciPy é dado a ambos os solucionadores nas execuções completas; a rotina de passo inicial é comparada em separado. Não abrangido: RKF7({ "8" }), deteção de rigidez, localização de eventos

# text
seg-9ad7c1f4da77 = Solucionador robusto da equação de Kepler

# text
seg-4b9d812fd13e = Solucionador de Kepler elítico para todos os { "0" } <= e < { "1" } e todas as anomalias médias: arranque cúbico e correção de quinta ordem de Markley ({ "1995" }), um resíduo sem cancelamento (1-e)E + e(E - sin E) - M, e refinamento de Newton protegido (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause) raízes com 50 dígitos a partir das entradas binárias exatas. Limiares fixados antecipadamente em xval/kepler-mpmath/PREREGISTRATION.md (df22174), expressos relativamente a |E| com o argumento de condicionamento e -> { "1" }, M -> { "0" }; todos atingidos (xval/kepler-mpmath/RESULTS.md). Os solucionadores antigos (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) não sofrem alteração numérica, porque as saídas registadas dependem deles, e não são abrangidos por esta linha

# text
seg-1960804ef2f4 = Determinação de órbita em lote com taxa de distância e az/el com máscara de estação

# text
seg-4c185244bc66 = Recuperar um estado de época a partir de seguimento misto de distância, taxa de distância e azimute/elevação acima de uma máscara de elevação, por Gauss-Newton em H = (dh/dx(t)) Phi(t, t0): derivadas parciais analíticas das medições e uma matriz de transição de estado variacional com derivadas parciais analíticas de dois corpos + J2 (integrada por RK4, não uma STM de forma fechada)

# text
seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator com medições geométricas instantâneas RangeRate e AzEl personalizadas (verificadas por comparação cruzada com o TopocentricFrame do Orekit), executado como programa separado sobre observações idênticas, com máscara e semente. Limiares fixados antecipadamente em xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Todos os limiares atingidos exceto B4, a concordância de estado sem ruído de { "1" } cm, falhada em { "2" } de { "4" } cenários ({ "1.46" }, { "1.74" } cm): a própria estimativa sem ruído do Orekit está tão afastada da sua verdade simulada (causa do lado do Orekit não isolada). Registado e fixado, pelo que a linha continua MODELLED. Não modelado: tempo de luz, aberração, refração, rotação da Terra, um filtro sequencial para estes tipos de medição

# text
seg-bc3d1ee7c639 = Ponderação das observações por código de exatidão SP3

# text
seg-63b1fab84f85 = Mapear os códigos de exatidão SP3 (expoentes do cabeçalho ++ em { "2" }^n mm, a base %f, desvios-padrão por registo base^n mm) em sigmas de posição por observação para o motor de determinação de órbita precisa (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Nenhuma externa: os pesos são uma escolha de modelação (o formato SP3 define o código apenas como indicador de exatidão do produtor; aqui é lido como um sigma por eixo). As execuções de agências já registadas não se alteram

# text
seg-e35df6881c80 = Campos gravitacionais planetários a partir de tabelas PDS SHADR

# text
seg-f78b73ae8742 = Ler tabelas de harmónicos esféricos PDS SHADR (from_shadr, em SphericalHarmonicField em src/gravity_pds.rs: conversão de unidades, C00 = { "1" } fornecido, verificações de completude e de normalização) e avaliar a gravidade solidária com o corpo de Marte GMM-3 (d/o { "120" }) e do campo lunar GRAIL GL0660B (d/o { "660" })

# text
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) a ler os mesmos ficheiros PDS e a avaliar a gravidade pontual, executado como programa separado, e os cabeçalhos e etiquetas publicados dos produtos PDS. Limiares fixados antecipadamente em xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); todos atingidos (RESULTS.md). Dados: PDS Geosciences Node da NASA, domínio público; recortes de grau 20 incluídos com NOTICE, ficheiros completos obtidos no momento do teste

# text
seg-ae3e8833a5ef = Associar um campo gravitacional publicado a um corpo

# text
seg-ffb2b20e5f32 = with_gravity_field (em Body, em src/gravity_pds.rs): associar qualquer campo de harmónicos esféricos carregado (por exemplo GMM-3 ou GL0660B) a um Body, para que o propagador o avalie solidário com o corpo; opcional, os corpos predefinidos não se alteram

# text
seg-bcb731f7a9b5 = Apenas consistência interna. Cada campo publicado é definido no referencial solidário com o corpo do seu produtor (GMM-3 no referencial de Marte de Konopliv et al. { "2006" }, GL0660B no referencial lunar de eixos principais DE421), enquanto o campo é avaliado no referencial IAU; o desvio não é modelado

# text
seg-659bfeba459c = Determinação de órbita em lote e sequencial

# text
seg-dbc98f498941 = Recuperar um estado de época [r,v] a partir de distâncias de estações terrestres através de um corretor diferencial em lote de Gauss–Newton e de um filtro sequencial, sobre um modelo de forças de dois corpos+J2

# text
seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — uma biblioteca de estimação de terceiros independente, com um modelo de forças equivalente; o estado de época recuperado e o RMS dos resíduos pós-ajuste concordam a <{ "1e-3" } m sem ruído e <{ "3" } m com um piso de ruído de { "5" } m

# text
seg-acdac055acb9 = Solucionador radiométrico de tempo de luz para o espaço profundo

# text
seg-62a478e40850 = Solução de tempo de luz unidirecional retardada (trajeto descendente) τ = |r_rx − r_target(t−τ)|/c para navegação radiométrica no espaço profundo (Terra→Marte/Sol/Lua)

# text
seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) tempo de luz com aberração newtoniana convergida (Aberration::CN; equivalente a spkapo do SPICE) sobre o JPL DE440 — uma implementação SPICE independente em Rust; o solucionador retardado de ponto fixo do kshana coincidiu a menos de um nanossegundo. Os valores mais amplos de Doppler / Shapiro / OD de dinâmica reduzida continuam MODELLED

# text
seg-c69ef9342160 = Posição de satélite por efemérides de difusão (RINEX multi-GNSS)

# text
seg-62702fc6f242 = Posição ECEF do satélite, kepleriana → ECEF, por efemérides de difusão IS-GPS-200 / Galileo-OS / BeiDou-OS a partir de um registo de navegação RINEX-3 analisado

# text
seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() compilado a partir do código-fonte em C (T. Takasu, BSD-2-Clause) — uma implementação independente de IS-GPS-200/SIS-ICD, alimentada com os mesmos registos de navegação RINEX-3; posição ECEF do satélite coincidente a ~{ "62" } nm. (A interpolação de efemérides precisas SP3 é validada em separado — ver 'Interpolação de efemérides precisas SP3')

# text
seg-c807a782b20e = Interpolação de efemérides precisas SP3

# text
seg-238de70daab9 = Interpolação de Lagrange padrão IGS de posições de satélite de efemérides precisas SP3 com a correção da rotação da Terra por nó (rodar cada nó por ω⊕·(t_node−t) para o referencial solidário com a Terra do instante da consulta antes do ajuste polinomial)

# text
seg-e9249ae44a11 = RTKLIB peph2pos() compilado a partir do código-fonte em C (preceph.c; T. Takasu, BSD-2-Clause) — a referência IGS de facto, uma implementação independente; o interpolador do kshana (agora com a mesma correção de rotação da Terra por nó) coincidiu a ~{ "15" } nm num produto SP3 real, face a ~{ "5.5" } cm antes da correção

# text
seg-9762cf428435 = Codificadores de mensagens de navegação para além do GPS LNAV (GPS CNAV, Galileo I/NAV e F/NAV)

# text
seg-9b703b9607d8 = Mensagens GPS CNAV dos tipos 10/11/30, tipos de palavra 1-5 do Galileo I/NAV em páginas pares/ímpares nominais e tipos de página 1-4 do Galileo F/NAV: empacotamento e quantização dos campos do ICD, CRC-24Q, codificação convolucional de taxa 1/2 com K={ "7" } (G2 invertido para o Galileo), entrelaçamento de blocos e padrões de sincronização, com descodificadores de teste correspondentes

# text
seg-7939b210e83c = Apenas ida e volta interna e respostas conhecidas do ICD; não foi executado nenhum descodificador de terceiros (o conjunto de testes RTKLIB/GNSS-SDR que lê KSHANA_NAVMSG_ORACLE_JSON depende de dados). MODELLED

# text
seg-5ce7cd3d6011 = Leitor de mapas globais da ionosfera IONEX e interpolação sobre um GIM CODE real

# text
seg-502656556ddf = Leitor IONEX { "1.0" } (cabeçalho, valores I5 de colunas fixas, mapas de TEC e de RMS, épocas absolutas, valores em falta) com interpolação espacial bilinear, a interpolação temporal do formato por mapa mais próximo / consecutivo / rodado (eqs. 1-3) e TEC oblíquo de camada fina

# text
seg-1575dc4cfb4a = Os valores impressos do GIM CODE (exatos em todos os nós; o mapa é obtido no momento do teste, não incluído, por a sua licença não estar confirmada) e uma reimplementação independente em Python stdlib das fórmulas de interpolação IONEX { "1.0" } submetida com o fixture (limiares fixados antecipadamente e4d8b1f, { "1e-9" } TECU). Verificação de terceiros (B6, fixada antecipadamente, primeira execução): o iontec do RTKLIB v2.4.2-p13 (BSD-2-Clause, executado como ferramenta separada) em { "6885" } pontos de consulta concorda com IonexFile::vtec_at a { "3.6e-13" } TECU em ambos os modos de interpolação, face a um limiar de { "1e-5" } TECU. Dependente de dados: GIM CODE obtido no momento do teste, com SHA fixado; o RTKLIB lê o ficheiro completo porque o seu getindex rejeita o recorte de latitude. tests/fixtures/ionex_code_gim/fetch.sh obtém-no e verifica o SHA-256, o teste falha com quaisquer outros bytes, e run_rtklib.sh é o caminho documentado de reprodução (é necessário acesso à rede). Promovido a VALIDATED por decisão do proprietário com base em evidências dependentes de dados (2026-10-13)

# text
seg-974d8c1f7876 = Suavização da portadora do código por Hatch sobre observações RINEX reais

# text
seg-f26b5da0f52e = Filtro de Hatch sem divergência (código livre de ionosfera suportado pela portadora livre de ionosfera, janela de N épocas, reinício na perda de bloqueio, salto de geometria livre ou lacuna) na montagem de posicionamento pontual preciso

# text
seg-fac84cb9b256 = CONSTATAÇÃO face à coordenada ITRF2020 publicada de WTZR: os limiares fixados antecipadamente (mediana e p95 suavizadas no máximo { "0.6" } x o valor bruto; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) foram falhados, com razões { "0.718" } e { "0.923" }; o erro residual de nível métrico é do tipo enviesamento (enviesamento do código C1C, antena, maré, multipercurso de longo período), não o ruído branco que a suavização remove. MODELLED: as estatísticas do filtro são verificadas internamente

# text
seg-2eec513ae8c8 = Diferenças duplas RTK com fixação de inteiros LAMBDA sobre observações RINEX reais

# text
seg-6571676bf918 = Posicionamento relativo de linha de base curta a partir de código e fase da portadora GPS reais de dupla frequência: diferenças duplas face ao satélite mais alto com a sua covariância completa, um filtro de Kalman flutuante sobre a linha de base e as ambiguidades de diferença simples com reinicialização em saltos de ciclo, mínimos quadrados inteiros LAMBDA com o teste de razão, e a linha de base condicionada pelos inteiros fixados

# text
seg-e50c5d4b65c7 = Coordenadas ITRF2020 publicadas de WTZR e WTZZ (IGN ITRF2020_GNSS.SSC, solução { "3" }, com as alturas de antena do RINEX) que dão a linha de base de referência; limiares fixados antecipadamente em tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md antes de o código ser escrito. Apenas linha de base curta: não são modeladas diferenças duplas ionosféricas nem troposféricas

# text
seg-f9aa0c529393 = Solução temporal do relógio do recetor por PPP face ao relógio final de estação do IGS

# text
seg-83ad9e893db9 = O relógio do recetor estimado pelo filtro PPP flutuante estático sobre código e fase GPS reais de dupla frequência, com órbitas e relógios finais do IGS: uma transferência de tempo do recetor para o tempo IGS, a solução temporal PPP livre de ionosfera.

# text
seg-91a882dd71e8 = O relógio combinado final do IGS para a estação WTZR (registos AR de IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, uma combinação de soluções de rede de vários centros de análise; produtos IGS, utilização livre com atribuição); limiares fixados antecipadamente em xval/ppp-time/PREREGISTRATION.md antes de qualquer comparação; todos se mantiveram na primeira execução. O QUE NÃO É: uma estação e uma janela convergida de duas horas; tempo IGS, não UTC(k); o desvio constante inclui enviesamentos de código do recetor e é limitado, não calibrado; sem rastreabilidade à Circular T.

# text
seg-a9b2a93401a3 = Posicionamento pontual preciso flutuante sobre observações RINEX reais

# text
seg-cc991ccec112 = Filtro de Kalman estendido PPP flutuante estático sobre código e fase da portadora GPS reais de dupla frequência, com órbitas e relógios finais do IGS: combinação livre de ionosfera, desvios de antena do satélite e do recetor (variações do recetor), maré terrestre sólida, phase wind-up, atraso de Shapiro, atraso zenital húmido estimado, ambiguidades flutuantes por arco com deteção de saltos de ciclo por geometria livre / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Coordenada ITRF2020 publicada de WTZR (IGN ITRF2020_GNSS.SSC, solução { "3" }, propagada com a sua velocidade) — limiares fixados antecipadamente em tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md antes de o filtro ser escrito; desenvolvimento apenas na estação co-localizada WTZZ. Não modelado: carga oceânica, PCV do satélite, resolução de ambiguidades inteiras

# text
seg-c8d87abed330 = Leitura de ficheiros de navegação RINEX { "4" }

# text
# c1: > EPH
seg-28913a01af00 = Ficheiros de navegação RINEX 4.00-4.02: registos <c1/> de GPS LNAV, Galileo I/NAV e F/NAV, BeiDou D1/D2 e QZSS LNAV descodificados para o tipo de efemérides de difusão; registos CNAV, CNV1-3, FDMA, SBAS, STO, EOP e ION ignorados até ao cabeçalho do registo seguinte; um registo cujo cabeçalho nomeia outro satélite, ou um registo truncado, recusado

# text
seg-687b3b159691 = O ficheiro de difusão fundido RINEX { "3" } do IGS do mesmo dia (dados publicados, escritos por um gerador de ficheiros diferente a partir das mesmas mensagens de difusão); limiares fixados antecipadamente em tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) antes da primeira execução

# text
seg-278ca396127a = Leitura de ficheiros de observação RINEX { "4" }

# text
seg-e0883aa933eb = Cabeçalhos de observação RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiquetas identificadas nas colunas 61-80 para a versão { "4" } e posteriores) e registos de época

# text
seg-971fb1203a6d = Aderência à norma do formato num ficheiro RINEX { "4.00" } real publicado (os valores lidos de volta são iguais aos literais impressos no ficheiro) e um cabeçalho derivado da especificação; não foi executado nenhum leitor independente, pelo que MODELLED

# text
seg-33e5c74720ff = Posição de satélite GEO BeiDou por difusão

# text
seg-44b61449b65a = Posição de satélite geoestacionário segundo BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de efemérides de difusão (referencial quase inercial, depois Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional através do campo include_beidou_geo de NavParseOptions, pelo que o leitor predefinido continua a ignorar os GEO

# text
seg-06d500099814 = Fixado antecipadamente (7aa264b, 110fef9) face a uma órbita precisa IGS MGEX com os GEO; nenhum produto desse tipo estava acessível a partir da sessão que o construiu, pelo que a comparação está pendente e a linha é MODELLED (verificada apenas face às posições GEO nominais publicadas)

# text
seg-559814996a4c = Interpolação de relógios precisos SP3

# text
seg-8e7a0dbd1755 = Desvio do relógio do satélite entre os nós de relógio SP3 tabelados por interpolação linear sobre os dois nós válidos que o enquadram (o esquema pephclk do RTKLIB; sentinela de relógio inválido ignorada), e os mesmos nós fornecidos à cadeia de produtos precisos como registos equivalentes a relógio RINEX

# text
seg-1f4f0f841802 = Combinação final IGS de relógios de satélite de { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): estimativas de relógio publicadas nos instantes de consulta, não interpoladas a partir do SP3; limiares fixados antecipadamente em tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md antes da primeira execução (RMS { "0.15" } ns, p95 { "0.30" } ns, mediana por nó { "1e-12" } s, discriminação 2x)

# text
seg-71f48628ebb2 = GNSS/INS fortemente acoplado com fase da portadora e ambiguidades flutuantes

# text
seg-5a156aa81275 = EKF de estado de erro sobre { "15" } estados INS, um relógio do recetor de dois estados e uma ambiguidade flutuante da portadora por satélite seguido; pseudodistância, fase da portadora e taxa de distância opcional a partir de uma constelação Walker SGP4 (tempo de luz e Sagnac), correções de Klobuchar e Saastamoinen/Niell aplicadas no ciclo à posição do próprio filtro; deteção de saltos de ciclo por portadora de diferenças temporais com um limiar por satélite alargado pela incerteza da velocidade; reinicialização das ambiguidades em saltos de ciclo e na reaquisição

# text
seg-00576e8c1032 = Consistência interna: as medições são sintetizadas a partir dos modelos que o filtro usa (χ² NEES/NIS ao longo de sementes, uma convergência sem ruído, injeção de saltos de ciclo). MODELLED; não é comparado nenhum dado de recetor real nem filtro de terceiros

# text
seg-7d644516b1ec = Pacotes GNSS/INS marítimo, ferroviário e de aviação com opção de acoplamento forte

# text
seg-cbb03a8baf73 = Três cenários gnss-ins na biblioteca de trajetórias (uma embarcação a ziguezaguear a { "8" } m/s com uma interrupção de cinco minutos; um comboio através de um desfiladeiro com dois satélites e de um túnel; uma aeronave cuja interrupção abrange uma curva inclinada de 25 graus) e a tabela opcional [tight] do pacote: pseudodistâncias de uma constelação Walker SGP4 fundidas pelo navegador em ciclo fechado, todos os satélites acima da máscara em condição nominal e os poucos mais altos em condição degradada

# text
seg-273c14256d4c = Interno: as figuras de mérito de cada pacote face à sua própria verdade e uma comparação fraco/forte sobre entradas idênticas. MODELLED; a comparação NaveGo da auditoria não foi executada

# text
seg-f4dab73c4eda = Filtro PNT de pseudodistância acoplado com estado de enviesamento e extensão 3-D no pacote de fusão

# text
seg-742b60089361 = Um único filtro de Kalman empilhado sobre posição, velocidade, fase e frequência do relógio, alimentado com pseudodistâncias que acoplam posição e relógio (atualizações na forma de Joseph que conservam a covariância cruzada); uma variante de 1 grau de liberdade aumentada com um estado de enviesamento constante do acelerómetro, que o pacote de fusão executa em [coupled]; e a versão 3-D de 8 estados com linhas de linha de visão

# text
seg-9558d7aad3af = Consistência interna: verdade simulada a partir dos modelos dos próprios filtros (χ² NEES sobre sementes de Monte Carlo, o pacote desacoplado com sensores idênticos). MODELLED

# text
seg-4a64aa1fe3ca = EKF GNSS/INS fracamente acoplado com braço de alavanca sobre o conjunto de dados KF-GINS

# text
seg-30f503856ac5 = O EKF de estado de erro de 15 estados em ciclo fechado, conduzido por incrementos da IMU, com posições da antena GNSS fundidas através do modelo de braço de alavanca H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], configurado a partir de um ficheiro YAML do KF-GINS (estado inicial e sigmas, ARW/VRW, enviesamentos de Gauss-Markov)

# text
seg-b01d28a09abe = A trajetória de referência publicada do conjunto de dados e o programa C++ KF-GINS (GPL-3.0, commit 8291a93e, executado como ferramenta separada); limiares fixados antecipadamente em xval/kfgins/PREREGISTRATION.md, e o KF-GINS não foi executado sobre estes dados antes desse registo (verificado nos seus Resultados). Todos os seis limiares se mantiveram na primeira execução. DATA-GATED: o conjunto de dados de demonstração do KF-GINS (IMU Leador-A15 real e GNSS RTK com trajetória de referência) não tem licença, pelo que não é incluído; xval/kfgins/fetch.sh obtém-no no momento do teste com o SHA-256 de cada ficheiro fixado, e o teste falha em caso de divergência; o caminho de reprodução, que requer acesso à rede, está em xval/kfgins/PREREGISTRATION.md. Promovido a VALIDATED por decisão do proprietário com base em evidências dependentes de dados (2026-10-13)

# text
seg-e6b6c605564c = Exportação do test bench lida pelos leitores de ficheiros de movimento de um simulador (gps-sdr-sim)

# text
seg-a07429aa1998 = Os ficheiros de movimento de exportação do bench entregues aos leitores próprios de um simulador GNSS de código aberto regressam como a trajetória exportada: o ficheiro NMEA GGA (-g), o recorte tempo/latitude/longitude/altura do CSV de movimento (-x) e o seu recorte tempo/x/y/z (-u), em { "6" } cenários gnss-ins (incluindo os pacotes marítimo, ferroviário e de aviação, lidos até ao limite de 3000 amostras do simulador) e { "2" } estacionários. Apenas movimento; nenhum sinal é escrito nem gerado.

# text
seg-07b5f46a900f = O QUE É VERIFICADO EXTERNAMENTE, indicado de forma restrita: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion e readUserMotionLLH com o seu próprio llh2xyz WGS { "84" }, chamados através de xval/testbench-gpssdrsim/driver.c (nenhuma função de sinal chamada), face às colunas solidárias com a Terra do CSV de movimento linha a linha, com limiares fixados antecipadamente em xval/testbench-gpssdrsim/PREREGISTRATION.md antes de qualquer execução: todas as amostras lidas em todos os { "8" } cenários; NMEA pior caso { "1.21" } mm (limiar { "1" } cm); recorte LLH pior caso { "0.145" } mm (limiar { "1" } mm); recorte de quatro colunas solidárias com a Terra exato (limiar { "1" } um, alteração { "1" }); linhas gnss-ins na grelha de { "10" } Hz do simulador a { "2.3e-13" } s. CONSTATAÇÃO (execução { "1" }, fixada): o CSV de largura total sem cabeçalho não é legível por -u, porque o buffer de linha de 100 caracteres do leitor divide cada linha de 161 caracteres em duas amostras; docs/TEST-BENCH.md indica o recorte de quatro colunas. O QUE NÃO É: a física da trajetória de verdade do cenário; a saída de sinal do gps-sdr-sim; o leitor de qualquer outro simulador; qualquer recetor.

# text
seg-2db2b9dc3b45 = Biblioteca de trajetórias GNSS/INS e importação de verdade CSV

# text
seg-e1fe83c75a6c = Perfis de movimento selecionáveis para o pacote gnss-ins (reta, figura-8, urbano com paragens e arranques, subida de aeronave e curva coordenada, drone de levantamento), definidos por comandos de taxa de Euler e de aceleração ao longo da trajetória fechados sobre o estado de verdade com a IMU cinemática (termos centrípeto, gravítico e de Coriolis), e verdade CSV importada transformada na IMU que a reproduz; o percurso histórico inalterado quando não é dado nenhum perfil

# text
seg-30ea002a06a0 = Interno: identidades cinemáticas de corpo rígido, a ida e volta de CSV e a covariância do próprio filtro. MODELLED (não é comparado nenhum registo de percurso real)

# text
seg-8685fd899e3c = Mecanização de INS strapdown

# text
seg-ba942e322f8a = Mecanização inercial strapdown NED WGS-84 com atitude em quaterniões (com compensação de coning/sculling) a propagar um estado de navegação a partir de incrementos (Δθ, Δv)

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) executado em Octave — um conjunto de ferramentas INS publicado independente, conduzido pelo mesmo fluxo de incrementos (Δθ,Δv). A atitude coincide bit a bit (mesmas convenções NED / quaternião com escalar em primeiro / taxa da Terra / taxa de transporte); a velocidade/posição concordam, com duas diferenças documentadas — o termo de gravidade norte da deflexão da vertical, que o NaveGo inclui e o kshana omite por conceção (gravidade de prumo; coincidente com a forma fechada de Groves em todos os dígitos, com uma verificação de limite mínimo de sanidade) e diferenças de integrador de O(dt²) — não erros de mecanização

# text
seg-d1a5c8e7ca74 = Síntese de funcionais do campo gravitacional (mapa de navegação assistida por gravidade / sem GNSS)

# text
seg-8336eb12eb7b = Magnitude da gravidade + perturbação (mGal) por harmónicos esféricos a partir de qualquer modelo ICGEM .gfc; gravidade normal GRS80

# text
seg-b5a7fc986751 = Gravidade normal de Somigliana GRS80 (Moritz { "1980" }, IAG) + γ_e/γ_p publicados; campo EGM2008 ICGEM real

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } do CR3BP Terra-Lua face à órbita que a CAPSTONE voou

# text
seg-d4127cf241f3 = A órbita de halo quase retilínea sul L2 { "9" }:{ "2" } do problema circular restrito que cr3bp::differential_correct_halo corrige (a família de órbitas do Gateway e da CAPSTONE), comparada pela sua geometria média (período, raio do perilúnio, raio do apolúnio) com a órbita que a CAPSTONE realmente voou. Uma medição de quão bem o membro CR3BP descreve a órbita real; uma órbita CR3BP não é uma órbita de modelo de efemérides e não é comparada época a época

# text
seg-e0cc33dfb10b = Medida face às efemérides reconstruídas da CAPSTONE do JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado na Lua, 2023-03-01..31 a { "10" } min), submetidas byte a byte (tests/fixtures/capstone_horizons/, NOTICE.md), fixadas antecipadamente { "4e868170" } antes de serem obtidas, como uma medição com limiares sobre a geometria média. Não é uma validação: o CR3BP omite o Sol, a excentricidade da Lua e a manutenção de posição que a CAPSTONE efetuou, pelo que os limiares descrevem quão representativa é a órbita do modelo, não uma exatidão. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = Estados rotativos do CR3BP mapeados para o ICRF centrado na Lua sobre a linha Terra-Lua do DE440

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf mapeia um estado rotativo adimensional do CR3BP Terra-Lua para uma posição e velocidade ICRF centradas na Lua sobre a linha Terra-Lua instantânea (unidade de comprimento a distância Terra-Lua, unidade de tempo o inverso da taxa orbital, a velocidade angular completa do referencial, incluindo a sua taxa fora do plano devida à aceleração da Lua), com a inversa from_moon_centred_icrf, e cr3bp::to_moon_centred_icrf_de440 lê o estado geocêntrico da Lua de um SPK DE440. Mapeia estados; não faz de uma órbita CR3BP uma órbita de modelo de efemérides

# text
seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 através de spiceypy { "8.3.0" }) sxform de um referencial dinâmico de dois vetores (primário +X ao longo da posição da Lua relativamente à Terra, secundário +Y ao longo da sua velocidade, de440s), aplicado ao estado rotativo dimensional construído a partir do próprio estado da Lua do SPICE, por um programa separado que não chama nenhum código do Kshana (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Fixado antecipadamente 2313eb1b, alterado antes de qualquer execução em d5ef79b3 para incluir a velocidade angular fora do plano do referencial (sem ela a velocidade ficaria até { "8e-2" } m/s desviada). Apenas uma verificação de biblioteca da transformação. Resultados: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Tipo de cenário do sistema solar sobre um kernel do JPL (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = O tipo de cenário <c1/> com planetary_kernel_path: cada corpo comunicado cujo código NAIF próprio o SPK contém obtém a sua posição e velocidade heliocêntricas J2000 do kernel através do leitor do próprio motor (etiqueta KERNEL), uma ligação cujas duas extremidades estão ambas no kernel é calculada sobre ele, nunca se substitui um planeta por um baricentro, e todos os outros corpos permanecem analíticos com a sua própria etiqueta; o relatório ganha um bloco kernel (caminho, SHA-256, os corpos e as ligações dele obtidos) apenas quando a opção está definida. Com de440s.bsp são Mercúrio, Vénus, a Terra e a Lua

# text
seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 através de spiceypy { "8.3.0" }) estados heliocêntricos spkezr sobre o de440s.bsp completo, um programa separado que não chama nenhum código do Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); o motor lê recortes de de440s bit a bit. Fixado antecipadamente f8e946ea. Uma verificação de biblioteca da ligação: o DE440 em si e os corpos analíticos não são validados aqui. Resultados: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop sobre as efemérides DE440

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: a varredura data de lançamento x data de chegada de C3 de partida (km²/s²) e V-infinito de chegada (km/s) com o solucionador de Lambert prógrado de revolução única e a salvaguarda de colinearidade de { "0.5" } graus, sobre os estados heliocêntricos J2000 de quaisquer dois corpos NAIF lidos de um SPK JPL DE440 pelo leitor da própria crate. Uma revolução, prógrado, sem restrições de lançador ou de chegada: uma varredura, não um projeto de missão

# text
seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 através de spiceypy { "8.3.0" }) estados heliocêntricos no de440s.bsp e pykep { "3.0.1" } lambert_problem (ESA, o núcleo C++ kep3, MPL-2.0), um solucionador de Lambert independente, executado como programa separado que não chama nenhum código do Kshana (tests/fixtures/porkchop_de440/, NOTICE.md); o motor lê um recorte de de440s bit a bit. Fixado antecipadamente 2d857fb1. Uma verificação de biblioteca da varredura. Resultados: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

# text
seg-b1401bed5da8 = Otimizador de transferência impulsiva sobre as efemérides DE440

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: as datas de partida e de chegada de uma transferência balística de dois impulsos de revolução única que minimizam o C3 de partida ou o V-infinito de chegada dentro do Tipo I ou do Tipo II, como ótimo contínuo (uma grelha de 2 dias sobre ambas as janelas, depois Nelder-Mead 2-D), sobre estados heliocêntricos do SPK DE440. Um otimizador de datas para um só trajeto, não um projeto de missão: sem opções de lançador, de órbita de estacionamento, de manobra no espaço profundo ou de múltiplas revoluções

# text
seg-6c695aef043b = Um otimizador independente: NAIF SPICE Toolkit (CSPICE N0067 através de spiceypy { "8.3.0" }) estados heliocêntricos sobre o mesmo recorte de de440s, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) e SciPy { "1.18.1" } Nelder-Mead, sem chamar nenhum código do Kshana. O manual da NASA Terra-Marte (MIDAS, efemérides não indicadas, grelha de datas de 2 dias) é uma referência publicada secundária e não define o estado

# text
seg-93f3cdbb7297 = Solucionador de transferências de Lambert com múltiplas revoluções

# text
seg-995a6a995b78 = Todas as soluções do problema de Lambert com até três revoluções completas (maneuver::lambert_multirev: a solução de revolução única, depois os ramos esquerdo e direito de cada contagem de revoluções, Izzo { "2015" }), com as velocidades de fronteira v1 e v2, para transferências prógradas e retrógradas, em unidades canónicas e em SI heliocêntricas, incluindo transferências a menos de { "1" } % do tempo de voo mínimo de uma contagem de revoluções e geometrias próximas de 180 graus. Apenas um solucionador de dois corpos (sem perturbações)

# text
seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, o núcleo C++ kep3, MPL-2.0), uma biblioteca independente, executada como programa separado por scripts/gen_lambert_multirev_ref.py; apenas a sua saída numérica é submetida. Fixado antecipadamente a75de851 (conjunto de casos, limiares, regra de resultado) antes de qualquer comparação; a referência foi regenerada de forma independente e é idêntica byte a byte. Resultados: docs/design/evidence/lambert-multirev/RESULTS.md

# text
seg-ff9c6140fe1c = Solucionador de transferências de Lambert de dois corpos

# text
seg-d8c39ced64b2 = Solucionador de Lambert de revolução única de Izzo-2015 (r1, r2, tempo de voo → velocidades de fronteira) em transferências LEO→GEO→heliocêntricas, prógradas e retrógradas

# text
seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — um solucionador de Lambert independente de terceiros. O problema de Lambert de revolução única (M={ "0" }) tem solução única, pelo que a concordância entre bibliotecas é uma verificação externa genuína; coincidente a <{ "1e-4" } m/s (observado ~{ "1e-11" }), o mesmo tipo de validação que o DOP obtém face ao gnss_lib_py

# text
seg-347cece5df63 = Referenciais e escalas de tempo

# text
seg-5a4bc2c15eaa = Precessão-nutação IAU 2006/2000A, CIO GCRS↔ITRS, escalas de tempo com segundos intercalares

# text
seg-51d28ab9d256 = Vetores de referência IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Datas julianas de duas partes e segundos intercalares no percurso temporal de órbitas terrestres

# text
seg-5e859e3aa613 = Uma data e hora de calendário UTC para uma data juliana UTC de duas partes com a convenção SOFA dtf2d para dias que terminam num segundo intercalar ({ "86 401" } s de duração, { "23" }:{ "59" }:{ "60" }.x válido), UTC para TAI e de volta, e UT1 a partir de UTC através de TAI, em datas de duas partes a partir de 1972-01-01: o percurso temporal que o SGP4 (Sgp4::propagate_at, medido a partir de uma época de duas partes) e a rotação solidária com a Terra IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop com o ângulo de rotação da Terra de duas partes) utilizam

# text
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como publicados pelo projeto ERFA), uma biblioteca independente: erfa.dtf2d("UTC"), erfa.utctai e erfa.taiutc nos instantes submetidos, a diferença formada parte a parte nas datas de duas partes, limiar { "1e-6" } s fixado antes da execução (fixado antecipadamente e947e69d). Pior diferença { "9.6e-12" } s (dtf2d) e { "1.9e-11" } s (utctai, taiutc). Tomar cada dia UTC como { "86 400" } s, ou deixar a fração do dia intercalar sem escala, faz o teste falhar. UT1 através de TAI (iauUtcut1) é verificado pela vertente ERFA da linha do percurso de órbitas terrestres. Âmbito: UTC desde 1972-01-01; o UTC anterior, de taxa variável, não é modelado

# text
seg-f1c7bc235a6b = Datas julianas de duas partes até à rotação da Terra no percurso da órbita

# text
seg-cee11d4bad08 = Rotação da Terra a partir de uma data juliana UT1 de duas partes no percurso da órbita, para que a posição solidária com a Terra conserve o microssegundo que uma data em f64 único perde (cerca de { "3e-9" } rad perto de { "2020" }): jd2::gmst82 (GMST IAU { "1982" }, a convenção TEME, sobre as duas partes), cio::gcrs_to_itrs_matrix_jd2 (a matriz CIO GCRS para ITRS com o ângulo de rotação da Terra a partir das duas partes) e, construídas sobre elas e verificadas internamente, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 e own_jd2_utc, o two_part_jd opcional do cenário de efemérides (a posição ECEF, o traço no solo e a vista da estação; desativado por predefinição, inalterado), e conversões From sem perdas entre jd2::Jd2 e timescales::TwoPartJd. A precessão-nutação e a época do modelo de forças de Cowell permanecem em f64 único, onde um arredondamento de { "40" } us está abaixo de { "1e-15" } rad ou muito abaixo do erro das efemérides analíticas do Sol/Lua

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como publicados pelo projeto ERFA), uma biblioteca independente: gmst82 e c2t06a nas datas de duas partes submetidas, movimento polar { "0.1" } e { "0.3" } segundos de arco. Fixado antecipadamente b10475ee (datas, limiares) antes de as funções serem escritas e antes de a referência independente ser executada. Os testes internos (a opção do cenário, a ida e volta TEME/ITRF, as conversões de tipos) são autoconsistência de apoio

# text
seg-096df3971f5f = Matrizes de referencial face a vetores ERFA: viés-precessão IAU { "2006" }, TEME para GCRS e a cadeia CIO com desvios do polo celeste

# text
seg-731a5ed967b3 = Três matrizes de referencial comparadas elemento a elemento ou por ângulo de rotação com o ERFA em épocas arbitrárias: precession::precession_matrix (viés-precessão IAU { "2006" } por ângulos de Fukushima-Williams), nutation::teme_to_gcrs_matrix (a rotação TEME para GCRS P^T N^T Rz(-EE) com precessão IAU { "2006" }, nutação IAU 2000B e a equação dos equinócios com os seus dois termos complementares principais), e cio::gcrs_to_cirs_matrix_with_offsets (a rotação GCRS para CIRS com os desvios do polo celeste IERS dX, dY somados ao X, Y do CIP do modelo antes da rotação, a convenção do livro de receitas SOFA; novo). As próprias escolhas de modelo (nutação 2000B no percurso TEME, a série complementar de dois termos) não são validadas, apenas a sua implementação

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como publicados pelo projeto ERFA), uma biblioteca independente: pmat06; numat(obl06, nut00b) com a equação dos equinócios de eect00 (a série complementar completa), composta como P^T N^T Rz(-EE); xys06a e depois c2ixys(X + dX, Y + dY, s). Fixado antecipadamente 979c1e39 (épocas, desvios e limiares) antes de a referência independente ser executada. O resíduo TEME de { "1.1e-10" } rad é o efeito previsto de manter dois termos complementares (cerca de { "3" } mm em órbita GNSS)

# text
seg-4e2fe2e3dabb = UTC anterior a 1972 (era de taxa variável) no percurso temporal de datas julianas de duas partes

# text
seg-1d086e669f09 = UTC de 1960-01-01 a 1971-12-31, quando o UTC corria a uma taxa desviada face ao TAI e dava saltos de frações de segundo, no percurso de datas julianas de duas partes: TAI - UTC a partir da tabela de deriva de cada período (timescales::tai_minus_utc_on_date), a data de calendário UTC para uma data juliana UTC de duas partes com a duração do dia { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC para TAI com a fração do dia convertida de UTC para segundos SI (jd2::utc_to_tai) e TAI de volta para UTC (jd2::tai_to_utc), seguindo SOFA dtf2d, utctai e taiutc. Antes de { "1960" } toma-se TAI - UTC como { "0" } (o valor do SOFA; UTC indefinido), o que fica fora da afirmação. O timescales::tai_minus_utc de f64 único continua a limitar-se a { "10" } s antes de { "1972" } e não é abrangido

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; os algoritmos SOFA tal como publicados pelo projeto ERFA), uma biblioteca independente: erfa.dtf2d("UTC"), erfa.utctai e erfa.taiutc nos instantes submetidos, a diferença formada parte a parte. Fixado antecipadamente 23c40661 (instantes, tolerância e a soma de verificação de { "1972" }+) antes da alteração do motor e antes de a referência independente ser executada. A tabela de deriva é transcrita da mesma tabela SOFA iauDat que a referência independente usa, pelo que a comparação abrange a aritmética da conversão (duração do dia, conversão de UTC para segundos SI, iteração), não a própria tabela histórica

# text
seg-efacec095051 = Relógio de satélite GLONASS por difusão e propagação de órbita por difusão

# text
seg-821b9c01b56e = O desvio do relógio de satélite GLONASS por difusão -tau_n + gamma_n (t - t_b) num instante lido no relógio do satélite (glonass::GlonassEphemeris::sv_clock_bias_s, o desvio corrigido do desvio do relógio por duas iterações de ponto fixo), e a posição PZ-90 solidária com a Terra do vetor de estado difundido, propagado por RK4 através das equações de movimento do ICD GLONASS dentro de +/-15 min da época de referência (GlonassEphemeris::position_ecef), a partir de registos de navegação GLONASS RINEX { "3" } reais. Não é aplicada nenhuma transformação PZ-90.11 para ITRF (concordam ao nível do centímetro desde { "2014" }; o RTKLIB também não aplica nenhuma). Não ligado à saída de nenhum cenário: função de biblioteca

# text
seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk e geph2pos, compilados a partir do código-fonte em C num conjunto de testes separado (xval/rtklib-glonass) que lê o mesmo ficheiro RINEX com o leitor próprio do RTKLIB, pelo que a análise, o sinal de -tau_n, as unidades e a iteração são comparados tal como o relógio e a órbita. Fixado antecipadamente e099c42a antes de a função existir e antes de o conjunto de testes ser construído. Ambos os lados avaliam a mesma forma fechada do relógio, pelo que a comparação do relógio abrange a implementação, não a fórmula. Os integradores de órbita diferem (o RTKLIB avança { "60" } s e depois o resto, o Kshana passos iguais de no máximo { "60" } s) e as constantes também (RTKLIB mu { "3.9860044e14" }, Kshana o PZ-90.11 { "3.986004418e14" }); o pior caso de { "1.1" } mm é essa diferença, como previsto antes da execução. Âmbito: as efemérides de difusão dentro do seu intervalo de validade, não a órbita ou o relógio verdadeiros (sem comparação com produtos precisos)

# text
seg-d3b72a6fbb18 = Um só percurso de órbita terrestre: conjuntos de elementos SGP4 para GCRS e ITRS na cadeia IAU 2006/2000A com parâmetros de orientação da Terra

# text
seg-e4eca7205b5e = O percurso de propagação e de referenciais que todos os tipos de cenário de órbita terrestre encaminhados partilham: um conjunto de elementos médios SGP4 com época UTC de duas partes (sgp4::MeanElementSet, lido a partir de elementos de projeto de constelação por MeanElementSet::from_earth_fixed) propagado por SGP4/SDP4 para TEME (sgp4::SgpOrbit), e as rotações TEME -> ITRS e GCRS -> ITRS da cadeia IAU 2006/2000A com UT1 - UTC e movimento polar (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, as formas sem parâmetros teme_to_itrs_matrix e gcrs_to_itrs_matrix). TEME é o equador verdadeiro da data com o equinócio médio, alcançado a partir do GCRS através do viés-precessão IAU { "2006" }, da nutação IAU 2000B e da equação dos equinócios

# text
seg-44f28276f859 = Vertente { "1" }: python-sgp4 { "2.24" } (licença MIT; o SGP4 de referência em C++ de D. Vallado, o código que produziu os vetores de verificação AIAA 2006-6753), WGS-72, modo melhorado. Vertente { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, as rotinas SOFA): c2t06a com TT de utctai/taitt e UT1 de utcut1, e para TEME c2t06a . pnm06a^T . rz(-ee06a). Limiares fixados antes da execução (fixado antecipadamente 72ea9eb0). Divulgado: a primeira execução falhou a vertente { "2" } em 2016-12-31T23:{ "59" }:{ "59.5" } por um segundo de rotação (UT1 tomado a partir da data juliana quase-UTC num dia com segundo intercalar); o motor foi corrigido (jd2::utc_to_ut1) e a segunda execução concorda com os limiares inalterados. Omitir o movimento polar ({ "46" } falhas) ou usar constantes WGS-84 em vez de WGS-72 ({ "4432" } falhas) faz o teste falhar. Este projeto de três vertentes substituiu uma comparação de ponta a ponta com o Orekit que falhou no SDP4 do Orekit com e = { "0" } e no seu TEME IERS { "1996" } (a constatação continua fixada em tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

# text
seg-f650a11458b8 = Compromisso de projeto do código de medição de distância

# text
seg-071e552a7179 = Limites de lóbulos laterais e de correlação cruzada de m-sequências/Gold, comprimento↔ambiguidade

# text
seg-65b7902a2d8f = Correlação cruzada Gold do GPS C/A publicada (−{ "23.9" } dB); limite de Gold { "1967" }

# text
seg-5ec4c0730280 = Geometria GNSS / diluição da precisão (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de visão através de Q=(HᵀH)⁻¹ com uma separação ENU local

# text
seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — biblioteca independente, coincidente a { "1e-6" } relativo

# text
seg-1a5623c81b48 = Erro de posição a partir da geometria: erro RMS = sigma_UERE x DOP para a solução de mínimos quadrados do motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry e check: uma simulação de Monte Carlo com semente (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da solução iterada de mínimos quadrados do próprio motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) nas { "8" } geometrias de tests/fixtures/dop/dop_reference.csv, comparando as variâncias do erro este, norte, cima e relógio, o RMS H/V/P, a correlação este-norte, os erros médios e a fração dentro da elipse horizontal de { "95" } % com sigma^{ "2" } Q, onde Q é o fator de covariância do kernel orbit::dop (orbit::dop_cofactor, a mesma aritmética) na mesma geometria

# text
seg-90f18c774d57 = Consistência interna face a uma forma fechada: sob o modelo gaussiano linear a covariância dos mínimos quadrados é sigma^{ "2" } (H^T H)^-1 (Kaplan e Hegarty (eds.), Understanding GPS: Principles and Applications, 2.ª ed., Artech House, { "2006" }, cap. { "7" }). Método e tolerâncias da nota de projeto de geometria { "0.36" }, secção { "5.2" }, fixados num commit de pré-registo antes da primeira execução: cada variância dentro de { "5" } % ({ "5" } erros-padrão de uma variância amostral com N = { "20,000" }), cada RMS dentro de { "2.5" } %, a correlação este-norte dentro de { "0.035" } (5/sqrt(N)), cada média dentro de { "5" } erros-padrão, a fração da elipse de { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } erros-padrão binomiais); os controlos negativos (PDOP duplicado; erros a crescer como 1/sin(elevação) face ao Q não ponderado) têm de falhar. COMO SE COMPÕE: Q é o fator de covariância do kernel orbit::dop, VALIDATED face ao gnss_lib_py { "1.0.4" } nestas mesmas { "8" } geometrias em tests/dop_reference.rs (linha 'Geometria GNSS / diluição da precisão'); esta linha acrescenta o passo desses fatores para metros através do solucionador do motor e não toma emprestado o estado dessa linha. PORQUÊ MODELLED: não está envolvido nenhum conjunto de dados externo; a concordância mostra que o estimador e o ruído realizam sigma x DOP sob o modelo de manual, não que o erro de algum recetor seja igual a UERE x DOP, e sigma_UERE é uma entrada

# text
seg-9acfde1b57f7 = Classificação de confiança com consciência da geometria: geometria dos satélites junto à pontuação de confiança do recetor e uma classe em cada dedução

# text
seg-6138c41e13ff = receiver_trust::geometry: geometria de satélites por época (boa, degradada com os motivos few-satellites/high-pdop/high-hdop/sky-blocked, ou desconhecida quando o registo não fornece GSV, NAV-SAT nem GSA) derivada das elevações e dos azimutes comunicados através de orbit::dop ou tomada de GSA, com uma etiqueta sempre comunicada e nunca pontuada (good, fair, poor, unknown) e o HDOP, PDOP, VDOP, a contagem de satélites e a perda de sinal por palavras; um monitor de geometria da pontuação da embarcação que não deduz nada a menos que a geometria seja fraca (razão max(hdop/4, pdop/6, 5/n_used) acima de { "1" }), depois sobe progressivamente até um teto de { "15" } pontos em { "1.5" } que só a geometria não pode fazer descer abaixo da faixa degradada (teto, fim da rampa e piso em [geometry]; sem alarme); uma classe em cada dedução (geometry, environment, inconsistency) com a perda de bloqueio de satélites abaixo de { "15" } graus classificada como geometry, satélites à vista mas não seguidos classificados como environment, e uma dedução de geometria fraca cujo HDOP indicado está além de max({ "1.0" }, { "25" } % do HDOP derivado) do céu indicado classificada como inconsistency

# text
seg-6987737c5fe4 = Consistência interna: a classificação é verificada face às regras que enuncia e face a razões derivadas à mão em edições sintéticas do registo de demonstração submetido, e as fixações sem alteração mantêm as saídas da versão { "0.35.0" }: nenhuma pontuação muda a menos que a geometria seja fraca; a etiqueta é sempre comunicada. PORQUÊ MODELLED: os limiares são escolhidos, não ajustados (proveniência no geometry_model de cada execução; as figuras da IEC 61108-1 e do GPS SPS tal como citadas, a verificar face ao texto das normas), e não existe nenhum conjunto de dados externo etiquetado de degradação natural da geometria face a ataques com que validar a classificação. O DOP derivado reutiliza o kernel orbit::dop, VALIDATED face ao gnss_lib_py, cujo estado esta linha não toma emprestado. Uma classe de geometria é uma afirmação sobre o céu, não uma constatação de que não ocorreu nenhum ataque

# text
seg-540420863a5a = Modelo de ionosfera de difusão (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Atraso de grupo ionosférico oblíquo de L1 de frequência única de Klobuchar a partir dos oito coeficientes α/β difundidos

# text
seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — implementação de referência independente compilada a partir do código-fonte; coincidente a < { "1e-4" } m

# text
seg-0af6b1a073ce = Kernel estatístico de integridade RAIM/ARAIM (leis χ² / χ² não central / normal)

# text
seg-224a6c4200cd = O núcleo distribucional em que assenta todo o nível de proteção: o limiar de deteção de falhas instantâneo χ²₁₋ₚfₐ(dof), a não centralidade de deteção falhada pbias=√λ, e os multiplicadores de separação de soluções K_fa/K_md/K_V

# text
seg-03578217425f = Nível de proteção SBAS (HPL/VPL de mínimos quadrados ponderados DO-229E)

# text
seg-df640d6c7a5d = Níveis de proteção de mínimos quadrados ponderados do Apêndice J da DO-229E: D=(GᵀWG)⁻¹ a partir da elevação/azimute por satélite e do orçamento de erro, eixo maior da elipse de erro horizontal e σ vertical, escalados pelos fatores K publicados

# text
seg-39aed7b4bffd = Derivação SBAS-PL do RTKLIB — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, "DO-229D Appendix J"), executada por rnx2rtkp -ws sobre mensagens EGNOS GEO-PRN120 reais + RINEX BUTE/Budapeste reais; implementação independente de terceiros, HPL coincidente a < { "2e-3" } m. O gLAB { "v6.0.0" } (core/filter.c) confirmou uma convenção idêntica. Ambas as referências independentes arredondam K_V→{ "5.33" } face ao Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } exato do Kshana (~{ "0.06" }%), pelo que a vertical é verificada como o d_U livre do fator K

# text
seg-8f32eb9c8167 = Métricas de avaliação de detetores de ML (ROC/AUC/confusão/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, empates ½), matriz de confusão num limiar, P_d/P_md/P_fa/precisão/exatidão/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — biblioteca independente, coincidência exata

# text
seg-e7af87ce5e72 = Pontuação de deteção de anomalias em telemetria real de veículos espaciais

# text
seg-9659b33fca5b = AUC ROC + IC por bootstrap que separa anomalias reais etiquetadas; detetor transparente (reproduz as etiquetas)

# text
seg-b4ed67ce7e7e = scikit-learn roc_auc_score na divisão de teste OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — telemetria real da OPS-SAT

# text
seg-5c3f1057c6cc = Kernels numéricos do compromisso quântico (NNLS / bandas χ² / Q de van Loan)

# text
seg-f82113ccb30b = Ajuste NNLS de ADEV medido, bandas de consistência χ² NEES/NIS, e a covariância discreta de ruído de processo de van Loan do relógio (deriva em holdover) — a espinha computacional do motor de compromissos

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exatos, χ² <{ "5e-4" } ao dof de operação. Apenas kernels — os valores de desempenho de dispositivos continuam modelados (linha seguinte)

# text
seg-6f3099e7562c = Campo geomagnético de referência (síntese IGRF-14)

# text
seg-e9534723cb34 = Síntese por harmónicos esféricos do campo principal IGRF-14 — componentes X/Y/Z/F, declinação e inclinação — a alimentar a camada alt-PNT de anomalia magnética

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — a implementação de referência IGRF em Python puro da IAGA-VMOD, que inclui os coeficientes oficiais IGRF14.shc (IAGA, 14.ª geração, Zenodo 10.5281/zenodo.14012302); uma base de código independente de terceiros que calcula o campo IGRF-14 definido de forma única, coincidente sobre uma grelha global

# text
seg-cb3fea409de7 = Estatísticas de deteção — AUC gaussiana e falha mínima detetável

# text
seg-ca677becb465 = AUC ROC binormal analítica = Φ(μ/(σ√{ "2" })) e a falha mínima detetável σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) que sustentam os detetores de falhas quânticas e de anomalias

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), ambos BSD-3-Clause — bibliotecas independentes que calculam as mesmas grandezas de cauda gaussiana / AUC definidas de forma única, coincidentes ao piso de A&S-erf (~{ "7e-8" }). A vantagem quântico-versus-clássico construída por cima continua MODELLED

# text
seg-1ed12110fb74 = Kernel de estatísticas de ordem (Kendall-τ / Dirichlet / percentil)

# text
seg-0fb003404a5b = Kernels de correlação de postos e de reamostragem sob o estudo de instabilidade de decisão de resiliência: τ-b de Kendall, média de Dirichlet, classificação por competição e intervalos de confiança por percentis

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — implementações independentes (τ por ordenação por fusão) das estatísticas de ordem definidas de forma única, coincidentes a { "1e-12" }. O estudo de instabilidade de decisão construído sobre estes kernels continua MODELLED

# text
seg-fdd2ba203d5b = Kernel de derivação de prioridades MCDA (vetor próprio AHP / razão de consistência)

# text
seg-d01c155fbddf = Pesos de prioridade do Processo Analítico Hierárquico = vetor próprio principal (de Perron) normalizado de uma matriz de comparações par a par recíproca por iteração de potências, com o Índice de Consistência / Razão de Consistência de Saaty e o critério de aceitação CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Tabela canónica do Índice Aleatório de Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) reproduzida exatamente + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) como solucionador de vetores próprios independente que calcula o mesmo vetor/valor próprio de Perron definido de forma única, coincidente a <{ "1e-9" }. A camada de decisão Pareto / sensibilidade / MAUT construída sobre este kernel continua MODELLED (os agregadores WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE são validados externamente em separado — ver as linhas abaixo)

# text
seg-73e933220afb = Kernels de agregação ponderada MCDA (WSM / WPM)

# text
seg-c436cdc991a2 = Modelo de Soma Ponderada (agregado aditivo normalizado mín–máx + classificação) e Modelo de Produto Ponderado (agregado multiplicativo normalizado por soma, recíproco para custo) — os dois pontuadores de agregação de valor do estudo de compromissos

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — uma biblioteca MCDA Python de terceiros, independente e amplamente utilizada, que calcula os mesmos agregados ponderados definidos de forma única; coincidente a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_wsm/ e tests/fixtures/mcda_wpm/. Lixo à entrada, lixo à saída nas entradas; a camada de sensibilidade/robustez continua MODELLED

# text
seg-f00bdb66a052 = Classificação MCDA por distância ao ideal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — normalização mín–máx, soluções ideais positiva/negativa ponderadas, proximidade relativa Cᵢ = d⁻/(d⁺+d⁻) e classificação

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — uma biblioteca MCDA de terceiros independente que calcula os mesmos coeficientes de proximidade definidos de forma única; coincidente a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = Classificação de compromisso MCDA (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — utilidade de grupo Sᵢ, arrependimento individual Rᵢ e o índice de compromisso Qᵢ com peso de estratégia v={ "0.5" }, com a classificação em que menor é melhor

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — uma biblioteca MCDA de terceiros independente que calcula a mesma agregação S/R/Q normalizada por amplitude definida de forma única; coincidente a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = Classificação MCDA por fluxo líquido de sobreclassificação (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — índice de preferência par a par com as seis formas padrão de critério generalizado, fluxos de sobreclassificação positivo/negativo e a classificação completa por fluxo líquido (critério usual validado)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — uma biblioteca MCDA de terceiros independente que calcula o mesmo fluxo líquido de sobreclassificação definido de forma única; coincidente a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_promethee/generate_promethee_reference.py. As formas de preferência com limiares (q/p/σ) reduzem-se à mesma álgebra de critério generalizado e continuam verificadas por propriedades

# text
seg-72248291c388 = Kernel de escolha por sobreclassificação MCDA (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — matrizes de concordância / discordância, a relação de dominância de concordância e não veto e o kernel de escolha por sobreclassificação (convenção de todos os critérios de benefício, pesos normalizados por soma, escala global única)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — uma biblioteca de decisão multicritério de terceiros independente que calcula a mesma concordância/discordância/dominância/kernel definida de forma única; coincidente elemento a elemento a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_electre/generate_electre_reference.py. As escolhas de limiar ĉ/d̂ são entradas do analista (a sensibilidade continua MODELLED)

# text
seg-95942c6a2689 = Kernels de agregação MCDA (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (combinação convexa normalizada linearmente λ·WSM+({ "1" }−λ)·WPM com λ={ "0.5" }) e o sistema de razões MOORA (total de benefício ponderado normalizado por vetor menos total de custo ponderado) — a combinação de valor reforçada em estabilidade e o pontuador de sistema de razões com sinal

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA ratio system, normalização vetorial) — uma biblioteca MCDA Python de terceiros, independente e amplamente utilizada, que calcula os mesmos agregados definidos de forma única; coincidente a <{ "1e-9" }. Regenerável offline através de tests/fixtures/mcda_waspas/ e tests/fixtures/mcda_moora/. Lixo à entrada, lixo à saída nas entradas; a camada de sensibilidade/robustez continua MODELLED

# text
seg-7de67fedc1da = Classificação proporcional MCDA (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — significância de benefício S⁺ normalizada pela soma das colunas mais o termo de significância de custo inverso, a significância relativa Q e o grau de utilidade U = Q/max Q (melhor alternativa = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — uma biblioteca MCDA de terceiros independente que calcula a mesma significância relativa/utilidade COPRAS definida de forma única. O pyDecision é usado deliberadamente: o COPRAS do pymcdm { "1.4.0" } colapsa algebricamente para o trivial S⁺+S⁻ e não é uma referência fiel, ao passo que o pyDecision implementa o canónico Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Coincidente a <{ "1e-9" }; regenerável offline através de tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = Latência de deteção de mudanças CUSUM e ARL

# text
seg-302f5db625df = Latência de deteção no pior caso do detetor CUSUM tabular (⌊h/(z−k)⌋+{ "1" }) e comprimento médio de execução fora de controlo, usados pelo nível de proteção temporal e pelos monitores de spoofing

# text
seg-691a506ce13f = ARL do CUSUM tabular publicado: aproximação de movimento browniano de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, eq. { "3.7" }) ancorada de forma cruzada nas tabelas ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) para k=½, h∈{ "{" }{ "4,5" }{ "}" }; latência determinista coincidente exatamente com uma referência independente de primeira passagem. O limite TPL composto continua MODELLED

# text
seg-d923a77bd31a = Variância de deriva do relógio em holdover e inversão de limiar

# text
seg-4fafaf5f919d = Crescimento da variância do erro de fase em deriva q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 e a sua inversão monótona para um limiar de holdover do erro de temporização

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm a calcular o ruído de processo discreto de Van Loan { "1978" } Q₀₀ = ∫₀ᵗ ΦQcΦᵀds por escalonamento e elevação ao quadrado de Padé sobre a matriz aumentada { "6" }×{ "6" } — um caminho independente que nunca vê os coeficientes polinomiais do kshana; mais optimize.brentq a inverter a mesma curva monótona face à bisseção do kshana. Os valores do piso de ruído vermelho por classe (ClockClass) continuam MODELLED

# text
seg-eb3cd9e92d8d = Kernel de diversidade de Simpson inverso

# text
seg-244d57819f2b = Diversidade arquitetural efetiva = número de Simpson inverso / de Hill de ordem 2 1/Σpᵢ² sobre as qualidades das fontes por grupo de independência (o termo de diversidade na pontuação de resiliência)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — uma biblioteca de terceiros independente que calcula o índice de Simpson inverso definido de forma única; reproduzido byte a byte. O quadro de pontuação DHS-RPCF (pesos/níveis) construído por cima continua MODELLED

# text
seg-c14b8fe46517 = Máscara de horizonte dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: o azimute e a elevação geodésicos (WGS-84) de um satélite a partir de um local no solo, uma tabela de máscara de azimute/elevação interpolada linearmente em azimute com envolvimento aos { "360" } graus, o conjunto visível el >= max(mask_deg, mask(az)), e o DOP de relógio comum e a matriz cofator ENU-e-relógio desse conjunto (o kernel por trás de orbit::dop). É assim que a secção [skyline] decide a visibilidade nos tipos de cenário gnss-sim, jamming, leo-pvt, leo-pass e nmea-scenario e, com o local no solo user_site, em orbit e integrity

# text
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): um TopocentricFrame sobre um OneAxisEllipsoid WGS-84 para os ângulos de observação e uma ElevationMask por tabela, executado por xval/orekit-skyline/OrekitSkyline.java sobre estados solidários com a Terra submetidos (a propagação não é comparada), com gnss_lib_py { "1.0.4" } (metadados da wheel MIT) get_dop para o DOP e a matriz DOP ENU-e-relógio dos conjuntos que o Orekit considera visíveis. Fixado antecipadamente (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) antes de qualquer das referências independentes ser executada sobre as entradas da comparação; a interpolação linear com envolvimento do Orekit foi confirmada previamente numa sonda sintética. Âmbito: máscaras de tabela, ângulos de observação geodésicos, o conjunto visível mascarado e o seu DOP de relógio comum e cofator. NÃO verificado aqui: as reduções de desfiladeiro, de setor e de terreno e as predefinições (as suas tabelas de 360 pontos entram como entradas; linhas 'Reduções de desfiladeiro urbano, setor e terreno para uma tabela' e 'Predefinições de skyline'), os estados de relógio por sistema e a elipse de erro (linha 'Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria'), a rotação GMST do local no solo user_site em orbit/integrity e a sua datação de cada propagador para um só instante (ao Orekit são dados estados solidários com a Terra), e qualquer obstrução real (apenas linha de visão)

# text
seg-bbb1828b3db1 = Reduções de desfiladeiro urbano, setor e terreno para uma tabela

# text
seg-2864aec7be88 = skyline: o desfiladeiro urbano em forma fechada (corte atan((h - a) / d) com d = (w/2) / abs(sin(az - s)), extremidades abertas para um comprimento finito), setores de arestas vivas no sentido horário com envolvimento, e pontos de terreno reduzidos a uma tabela com a queda de curvatura d^2/({ "2" } * 4/3 R); o skyline é o seu máximo ponto a ponto com qualquer tabela

# text
seg-50f1df206b30 = Interno: as formas fechadas são verificadas face a valores calculados à mão (elevações do topo das paredes de uma rua indicada, a condição de extremidade aberta, a queda de curvatura de um ponto indicado). Nenhuma referência independente externa: a nota de projeto delimita estas reduções como MODELLED, e a ElevationMask do Orekit recebe uma tabela, pelo que a comparação da linha 'Máscara de horizonte dependente do azimute: conjunto visível, azimute e elevação, e DOP sob a máscara' lê as suas tabelas de 360 pontos como entradas e não as verifica

# text
seg-3f3d657854ce = Predefinições de skyline (rua da cidade, aproximação a porto, fiorde, terminal de contentores)

# text
seg-b915c06fa3f1 = skyline::PRESETS: quatro geometrias REPRESENTATIVE com as dimensões indicadas na nota de projeto e uma linha de proveniência cada: city-street (um desfiladeiro, rua a { "0" } graus, { "20" } m entre paredes de { "30" } m, antena a { "1.5" } m), harbour-approach (setores: aberto para o mar numa extensão de { "180" } graus, edifícios do cais a { "8" } graus numa extensão de { "90" } graus, o quebra-mar a { "3" } graus), fjord (terreno: paredes { "600" } m acima da antena a { "1.5" } km de cada lado de um canal norte-sul, queda de curvatura aplicada), container-terminal (setores: pilhas a { "12" } graus sobre a metade para terra, lanças de gruas a { "35" } graus e { "25" } graus sobre dois setores estreitos); substituíveis campo a campo

# text
seg-44ae9b6289d9 = Nenhuma: dimensões escolhidas e indicadas, não um levantamento de qualquer rua, porto, fiorde ou terminal (a razão de aspeto da rua está dentro da banda 0.5-2 de Oke ({ "1988" }); o fiorde é da ordem dos fiordes do oeste da Noruega; as pilhas usam a altura high-cube ISO { "668" }). O teste verifica as predefinições face às suas próprias dimensões indicadas, uma verificação de transcrição, que a regra de validação não conta

# text
seg-2c53381d48ae = Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria

# text
seg-15fea5c05cbd = geometry::sky_geometry: o cofator ENU-e-relógio (H^T H)^-1 com um relógio de recetor comum ou um por sistema (o kernel orbit::cofactor_from_los), e a elipse de erro horizontal a partir do seu bloco este-norte (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), o azimute do eixo maior a partir do norte)

# text
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv de G^T G e numpy.linalg.eigh do seu bloco horizontal sobre as entradas submetidas, uma biblioteca numérica independente que realiza a inversa e a decomposição em valores próprios pelos seus próprios algoritmos (P2 padrão). Fixado antecipadamente em xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) antes da execução; a formatação da saída do programa de condução foi corrigida uma vez após o pré-registo (um escalar numpy escrito como np.float64(...)), sem alteração do protocolo nem das tolerâncias. A afirmação validada é a álgebra linear sobre essas entradas; o modelo de erro gaussiano e o UERE são entradas indicadas, não uma exatidão medida nem um limite de integridade

# text
seg-6012113b4836 = Funções de geometria do céu: visibilidade, DOP, covariância, elipse de erro, nuvem de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> e <c2/>, funções Python e WASM com os mesmos nomes, MCP <c3/>): a partir de um local, de uma hora e de predefinições de constelações (ou de satélites como azimute/elevação ou ECEF), os satélites visíveis e mascarados sob um skyline, GDOP/PDOP/HDOP/VDOP/TDOP, o cofator de variância unitária (H^T H)^-1 e a covariância em este-norte-cima com um relógio de recetor por sistema ou um em comum, a elipse de erro horizontal (semieixos k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientação { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) a partir do norte), e n erros de mínimos quadrados com semente sob erros de distância gaussianos independentes, com a sua covariância empírica, RMS e contenção de { "95" } %. O cofator é orbit::cofactor_from_los, o único kernel por trás de orbit::dop e orbit::dop_cov (dop é a redução de dop_cov): nenhuma segunda implementação de DOP

# text
seg-aa0da1028636 = Os fatores DOP de relógio único assentam no kernel validado face ao gnss_lib_py { "1.0.4" } (linha 'Geometria GNSS / diluição da precisão (DOP)'); as verificações próprias desta linha são internas: sky_geometry reproduz orbit::dop e dop_cov na mesma geometria, a elipse reproduz uma decomposição analítica em valores próprios 2x2, as entradas ECEF e azimute/elevação concordam, e o RMS e a contenção de { "95" } % da nuvem com semente concordam com a geometria. A covariância ENU com um relógio por sistema e a elipse são VALIDATED na linha 'Elipse de erro horizontal e cofator por sistema a partir da covariância da geometria' (numpy, P2); o que continua MODELLED aqui é a composição: a propagação das predefinições para um céu representativo, a nuvem de Monte Carlo (verificada face à geometria que amostra, uma verificação de autoconsistência) e as superfícies. As predefinições de constelações dão um céu representativo, não um datado; o modelo de erro gaussiano e o UERE são entradas indicadas, não uma exatidão medida nem um limite de integridade

# text
seg-7f66be0f15c8 = Holdover de relógio sem GNSS

# text
seg-4d8f87668a0f = Crescimento do erro em deriva em forma fechada + holdover até ao limiar; classes de relógios quânticos

# text
seg-2d260626e3d2 = Recursão de covariância clock_state em vários passos (verificação cruzada da mesma base de código); o kernel subjacente de variância de deriva e de inversão de holdover é validado externamente face ao scipy (ver 'Variância de deriva do relógio em holdover e inversão de limiar'). Os valores de holdover do piso de ruído vermelho por classe continuam MODELLED

# text
seg-29b482d88916 = Cartões de dispositivo de relógio medidos (previsão sobre conjunto reservado)

# text
seg-8c68c5b25004 = clock_library: um cartão de dispositivo (ruído branco de fase, FM branco, de cintilação e de passeio aleatório, mais uma deriva linear de frequência) ajustado a um terço de um registo de relógio medido designado, após uma passagem registada de condicionamento (lacunas, valores atípicos de fase, saltos de fase, rajadas removidos; saltos de frequência registados), ponderado pelos graus de liberdade do tipo de ruído identificados por lag 1, e o seu desvio de Allan previsto pontuado sobre os dois terços reservados; leitores para ficheiros de relógio RINEX e IGS, ficheiros por laboratório do BIPM e a Secção { "1" } da Circular T; conversão de um cartão para o modelo de ruído de temporização de slots, o modelo de relógio de Kalman estendido e os níveis de ruído do monitor de spoofing

# text
seg-af2d78e2986c = Registos medidos, reservados: relógios combinados finais IGS de { "30" } s dos { "11" } satélites GPS Block IIF de 2026-03-01 a { "14" } (uma janela que nenhum teste tinha aberto; IGS, aberto com atribuição) e o recetor u-blox ZED-F9P do JammerTest { "2024" } nas suas sessões estacionárias não pontuadas (GPL-3.0-or-later). Comparação externa D9 (fixada antecipadamente 2ec76864, o desvio de Allan previsto / medido de cada cartão dentro de [1/1.5, { "1.5" }] nos seus tempos de média ajustados), uma constatação (continua MODELLED): { "10" } dos { "11" } cartões GPS IIF estão dentro do limiar; o G27 é otimista à escala de duas horas ({ "0.662" } a { "7680" } s, pior fator { "1.510" }), o erro periódico à escala da hora que um cartão de lei de potência não comporta. O cartão do TCXO do recetor está bloqueado: fora das transmissões registadas, as outras sessões do conjunto de dados deixam { "167" } épocas face às { "3600" } necessárias. Comunicado, não cego (registos abertos por linhas anteriores): o cartão do césio 5071A está dentro do limiar (pior { "1.070" } até { "4096" } s), o cartão do OCXO é conservador e está fora dele ({ "2.348" } a { "128" } s; o seu piso de ruído altera-se durante o registo), e o cartão do estrôncio de Norcia ajustado aos três pontos publicados mais curtos está dentro dele nos dois pontos pontuados ({ "1.291" }, { "1.405" }). Os masers de hidrogénio passivos do Galileo (não há fonte acessível sem autenticação de relógios finais do Galileo) e o Deep Space Atomic Clock (um valor aberto no espaço) estão bloqueados. D9 ronda { "2" }, o TCXO do recetor ZED-F9P como classe de modelo em { "14" } dias de { "12" } estações estáticas de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; fixada antecipadamente fb475550), uma constatação: com o processamento registado, { "11" } de { "12" } estações não foram avaliáveis (o RAIM rejeitou a maioria das épocas livres de ionosfera) e a BX14 falhou; uma nova execução divulgada com um processamento corrigido (fixada antecipadamente c9cc0d49) passa em { "1" } de { "11" } estações cegas (BX12, { "1.412" }; BX07 { "1.532" } e BX13 { "1.542" } logo fora), porque relógios de recetor de posicionamento pontual obtidos de ficheiros intermitentes de { "30" } s não são um registo limpo de oscilador

# text
seg-5097a0e6460d = Cartões de relógio medidos de GPS Block IIF com termos por revolução (previsão sobre conjunto reservado)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: um cartão de dispositivo que comporta os termos de fase de uma a quatro vezes por revolução (período T/k, T = { "43 082.05" } s), ajustados em conjunto com o quadrático por mínimos quadrados sobre um terço de um registo de relógio de satélite medido, com a contribuição de Allan em forma fechada de cada termo { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } no desvio de Allan previsto

# text
seg-83981cd13a17 = Registos medidos, reservados: relógios combinados finais IGS de { "30" } s dos { "11" } satélites GPS Block IIF de 2026-04-01 a { "14" } (uma janela que nenhum teste tinha aberto; IGS, aberto com atribuição). Comparação externa D9 (fixada antecipadamente fb475550, desvio de Allan previsto / medido dentro de [1/1.5, { "1.5" }] em cada tempo de média ajustado de cada satélite), uma constatação (continua MODELLED): { "9" } de { "11" } cartões estão dentro do limiar; o G03 ({ "1.947" }) e o G25 ({ "1.581" }) são otimistas entre { "60" } s e { "2000" } s porque os seus registos reservados são mais ruidosos do que os terços de ajuste (a parte reservada do G25 comporta { "16" } lacunas e { "29" } valores atípicos de fase), uma alteração do relógio e não um termo periódico em falta. Retirar os termos periódicos da previsão faz falhar todos os { "11" } cartões ({ "1.77" } a { "4.96" }), pelo que os termos sustentam a previsão

# text
seg-0d72fcc0fbea = Estimação do estado do relógio de bordo

# text
seg-6db5391f8ebe = Relógio de Kalman de Van Loan de 3 estados (fase/frequência/deriva), estabilizado na forma de Joseph

# text
seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), com F através de scipy.linalg.expm e Q através da matriz de blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / calibração de Allan não são validadas externamente, pelo que continua MODELLED. Comparação externa { "0.30" }, uma constatação (continua MODELLED): em relógios finais IGS de { "30" } s de { "11" } satélites GPS Block IIF (2025-08-17 a { "30" }), com Q ajustado ao ADEV da primeira metade e o filtro pontuado sobre a segunda metade reservada, o filtro é consistente a um passo ({ "0.906" } a { "0.971" } das épocas dentro da sua banda de { "95" } %, limiar { "90" } %) mas excessivamente confiante a uma hora em { "9" } de { "11" } relógios ({ "0.486" } a { "0.829" }) e as suas somas de inovação ficam fora de [{ "2.4" }, { "3.6" }] em { "5" }. O ruído de fase branco ajustado é zero em todos os satélites, e o erro à escala da hora (termos periódicos, FM de cintilação) não está no modelo de 3 estados. Ronda { "2" } de { "0.30" }, um filtro estendido (FM de cintilação e estados de uma e de duas vezes por revolução) sobre relógios IGS reservados novos de 2025-09-01 a { "14" } (fixada antecipadamente 4b1a841e), uma constatação (continua MODELLED): os critérios de consistência a um passo e a uma hora verificam-se em todos os { "11" } satélites ({ "0.948" } a { "0.988" } e { "0.907" } a { "0.996" }), mas o critério da soma de inovação falha no G24 ({ "0.964" }) e no G30 ({ "1.929" }) face a [{ "2.4" }, { "3.6" }]. D9 ronda { "3" }, o filtro estendido da ronda 2, com ajuste e critérios inalterados após o detetor de condicionamento congelado da clock_library, sobre relógios IGS novos de 2026-04-01 a { "14" } (fixada antecipadamente fb475550), uma constatação (continua MODELLED): (a) um passo { "0.941" } a { "0.968" } e (c) média do NIS triplo { "2.641" } a { "3.549" } verificam-se em todos os { "11" } satélites; (b) a uma hora falha no G09 ({ "0.894" }) e no G26 ({ "0.876" }) face a { "0.90" }

# text
seg-3f0a9d7c2971 = Orçamento de erros da transferência de tempo

# text
seg-216f46b43860 = Bidirecional/TWSTFT (Sagnac), vista comum GNSS, PPP; jitter da ligação→distância

# text
seg-e7b6aac2ec58 = Magnitude de Sagnac verificada face a um VALOR PUBLICADO de referência — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pelo geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que comporta a mesma geometria 2Aω/c². O orçamento composto BIPM TWSTFT transponder/vista comum/PPP não tem referência independente externa, pelo que a capacidade continua modelada

# text
seg-157fadeb5d67 = Modulação de sinais de navegação e análise de seguimento de código

# text
seg-ab633d191396 = PSD de BPSK-R/BOC, separação espectral κ, largura de banda de Gabor, jitter do DLL, multipercurso

# text
seg-94f0c4fc2930 = Correlação cruzada/autocorrelação Gold do GPS C/A coincidente EXATAMENTE (inteiros ±65/−1/63) com a geração de códigos IS-GPS-200 independente; forma da PSD de BPSK-R({ "1" })/BOC({ "1,1" }) face a um periodograma scipy independente. As formas fechadas de modulação/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) continuam analíticas, pelo que a linha continua MODELLED — mas a subafirmação de correlação de código é verificada externamente. Ronda { "2" } de { "0.30" }, face aos valores impressos de Betz { "2001" } e Hein et al. { "2006" } (fixada antecipadamente 9f4f2ce8, meia unidade impressa), uma constatação (continua MODELLED): todas as { "45" } células espectrais da Tabela { "1" }, os valores de correlação de { "1" } GHz, as figuras de interferência MBOC e { "2" } dos { "3" } desvios da Fig. { "17" } concordam; os primeiros lóbulos laterais de { "24" } MHz, o desvio BOC({ "8,4" }) da Fig. { "17" } e todos os enviesamentos de multipercurso no pior caso das Figs. 18-21 ({ "11" } a { "15" } % abaixo) não concordam. O Kshana e uma avaliação NumPy independente da leitura fixada antecipadamente concordam, pelo que a diferença reside nessa leitura ou num pormenor não indicado do artigo; causa por resolver

# text
seg-589e0053e3e8 = Geração do código de espalhamento GPS L1 C/A

# text
seg-782d4da75b59 = Gerador de código C/A por LFSR G1/G2 que reproduz os vetores de verificação octais dos primeiros 10 chips publicados na IS-GPS-200 para os PRN { "1" }–{ "9" } (mais comprimento de 1023 chips, equilíbrio de 512 uns, autocorrelação periódica de três valores)

# text
seg-473f24d4e06a = IS-GPS-200 Tabela 3-Ia 'Code Phase Assignments' — os vetores de verificação OCTAIS dos primeiros 10 chips publicados, de referência, de domínio público do Governo dos EUA (GPS Directorate, navcen.uscg.gov); o LFSR G1/G2 próprio do kshana regenera exatamente todos os vetores dos PRN { "1" }–{ "9" }. As formas fechadas de modulação/SSC/DLL a jusante continuam modeladas (linha separada)

# text
seg-e6c08e1e6ae3 = Desempenho de sensores inerciais quânticos

# text
seg-d28e1f6a430f = Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN)

# text
seg-57fd0a6e5d72 = Vetores numéricos de artigos primários de CAI publicados (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincidente exatamente, ASD de ruído de disparo um piso unilateral a ~{ "2" }× de cada instrumento publicado (os dispositivos reais têm ruído técnico acima do piso quântico). Um intervalo, não paridade. Ronda { "2" } de { "0.30" } (fixada antecipadamente fcb9ac64), uma constatação (continua MODELLED): o ruído de rotação só de QPN face aos pontos medidos da Fig. { "14" } de Gauguet et al. { "2009" } dá razões de { "0.695" } a { "0.788" } nos três pontos admitidos ({ "0.751" } no ponto de operação), falhando o limiar de { "30" } % fixado antecipadamente por { "0.5" } pontos; o piso de QPN situa-se { "21" } a { "31" } % abaixo do ruído medido, como esperado de um modelo sem ruído de laser e de deteção. A composição do gradiómetro coincide com a linha de modelo QPN de Janvier et al. { "2022" } (razão { "1.013" } a { "1.017" }, Reference). O teste medido não consegue discriminar um erro de composição de sqrt({ "2" }); só a linha de Janvier de contraste desigual o consegue

# text
seg-4b79d03cecf5 = Ambiguidade de franja / gama dinâmica de sensores inerciais quânticos

# text
seg-deb2850546d5 = Gama dinâmica de ambiguidade de franja de Mach–Zehnder: a leitura de franja 2π-periódica define uma força específica máxima não ambígua a_max=π/(k_eff·T²), e a gama não ambígua em células de resolução a_max/σ_a=π/σ_Φ é independente do fator de escala ótico — o ganho de sensibilidade T² custa gama não ambígua em perfeito compasso (o tempo de interrogação troca resolução por gama, deixando o número de células fixado pelo ruído de fase da leitura)

# text
seg-7603ff7a7693 = Autoconsistência do modelo de franja do interferómetro: o bordo de meia franja, a estrutura de aliasing 2π-periódica e o cancelamento do fator de escala na razão gama/resolução são identidades algébricas em forma fechada verificadas face às funções de fase e de sensibilidade de Mach–Zehnder do próprio motor — verificações de consistência interna, NÃO um conjunto de dados externo, pelo que a linha continua InternalConsistency. Ambiguidade de franja ideal de três impulsos MODELLED; sem limites de aberração de frente de onda ou de perda de contraste sobre a gama não ambígua

# text
seg-d04bf321d4a1 = Resiliência de navegação inercial por estima quântica

# text
seg-c4989abb5d40 = Orçamento de posição composto de enviesamento + fator de escala + VRW + decaimento da estabilidade durante o holdover

# text
seg-bfe4085115c1 = Integração SDE de Monte Carlo em numpy independente de ruído de aceleração branco duplamente integrado (valida a variância VRW analítica por um algoritmo genuinamente independente) + uma âncora de valor publicado de Groves { "2013" } para os termos de enviesamento/fator de escala; os valores de dispositivo CAI quantificam hardware do parceiro e continuam MODELLED

# text
seg-bc6e733c39b3 = Fusão de sensores GNSS/INS

# text
seg-16514286bb51 = EKF de estado de erro de 15 estados, fracamente acoplado (validado sobre um percurso real de IMU/GNSS face ao NaveGo); um UKF de pseudodistância/Doppler fortemente acoplado e um filtro acoplado de relógio+posição (apenas consistência, fora da afirmação validada)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, executado como ferramenta sob o GNU Octave, nunca ligado): o seu ins_gnss fracamente acoplado no seu próprio percurso real de veículo terrestre com IMU/GNSS Ekinox, com ambas as soluções pontuadas face à trajetória de referência Ekinox. Ambos os filtros leem a mesma entrada float32 de { "20" } Hz, e a configuração do Kshana é mapeada mecanicamente a partir dos parâmetros publicados do conjunto de dados. O RMS de posição horizontal e vertical do Kshana e o seu RMS de inovação de posição estão dentro de 1.2x os do NaveGo (medidos { "0.912" }, { "0.940" } e { "0.861" }) e a sua inovação normalizada média é no máximo { "1.5" } (medida { "0.395" }: cerca de 2.5x subconfiante, dados os sigmas GNSS indicados do conjunto de dados); tolerâncias fixadas antes da comparação. Âmbito: o GNSS está presente a { "5" } Hz durante todo o percurso, pelo que não se testa nenhuma interrupção nem deriva e a verificação deteta defeitos grosseiros do filtro e não afinação fina (posições brutas corrigidas do braço de alavanca ficariam perto do limiar vertical); a transformação do braço de alavanca é calculada no conjunto de testes. O UKF fortemente acoplado e o filtro acoplado de relógio+posição mantêm as suas verificações de consistência filterpy { "1.4.5" } (posteriores lineares a { "2.4e-12" }) e continuam fora da afirmação validada

# text
seg-5692c7b936b6 = Resiliência a jamming sem GNSS

# text
seg-f4ff77caa47b = Orçamento de ligação J/S geométrico, C/N₀ anti-jam, perda de bloqueio por satélite

# text
seg-daf317735edb = Equação do orçamento de ligação C/N₀ anti-jam verificada de forma cruzada face a uma nova dedução independente em numpy (partilha a mesma forma fechada → InternalConsistency) mais uma caracterização real da degradação de C/N₀ do JammerTest-2024. Ronda { "2" } de { "0.30" }, bloqueada (continua MODELLED): a queda medida de C/N0 do JammerTest { "2024" } face a uma previsão de orçamento de ligação (fixada antecipadamente 6a66994b, dentro de { "3" } dB) não foi executada porque a posição e a orientação da antena F8.1 em Bleik e a parcela de L1 da potência da rampa multibanda { "1.6.4" } não estão documentadas no catálogo de testes nem no registo oficial

# text
seg-ff90679d1de9 = Deteção de spoofing

# text
seg-b843f63e77e6 = FoM de segurança por época que funde χ² auxiliado por relógio, RAIM, AGC e SQM

# text
seg-baeb1c3db11f = Parâmetros de cenário TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, uma constatação (continua MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores ao nível das observáveis (qui-quadrado auxiliado por relógio, RAIM, falha de solução) não levantaram nenhum alarme dentro de { "10" } s de qualquer dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme surgiu { "10.2" } a { "39" } s após o início do intervalo publicado), e três janelas anteriores ao início tiveram falsos alarmes do monitor de relógio ({ "81" }, { "64" } e { "173" } épocas). O primeiro efeito observável foi uma perda de seguimento GPS de dupla frequência, não uma inconsistência do RAIM. Os inícios publicados são inícios de intervalo de calendário com resolução ao minuto; que precedam a captura de RF é uma interpretação, não uma medição. Ronda { "2" } de { "0.30" }, face ao registo oficial dos organizadores do JammerTest { "2024" } (resolução ao segundo; fixada antecipadamente 6a66994b, com um monitor de relógio de três estados calibrado por Hadamard sem retenção), uma constatação (continua MODELLED): o monitor dá alarme dentro de { "10" } s em { "4" } de { "10" } inícios registados; nos outros seis chega com um atraso de { "18" } a { "211" } s ou levanta falsos alarmes de relógio anteriores ao início ({ "1" } em { "2.1.4" }, { "85" } em { "2.3.15" }). D9 ronda { "3" } (um cartão de recetor das outras sessões da unidade do JammerTest, fixada antecipadamente 2ec76864) bloqueada: { "167" } épocas de treino face a { "3600" }. D9 rondas { "4" } e 4b (níveis de ruído de um cartão de classe de modelo u-blox ZED-F9P, Wroclaw { "2021" }, fixadas antecipadamente fb475550; 4b uma nova execução divulgada com uma extração corrigida, c9cc0d49), uma constatação (continua MODELLED): zero falsos alarmes anteriores ao início em todos os { "10" } inícios registados e { "6" } de { "10" } dentro de { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } e { "2.6.1" } continuam atrasados (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sem alteração pelo nível de ruído do relógio

# text
seg-b10d07921f5e = Nível de proteção temporal sob spoofing

# text
seg-2a829711b997 = Limite em forma fechada do erro temporal não detetado no pior caso = piso do monitor + σ de deriva do oscilador sobre a latência de deteção CUSUM, comunicado como uma banda de piso de ruído vermelho

# text
seg-682251b2e3c7 = Compõe primitivas validadas (allan/holdover de Van Loan, piso de segurança); calibrado no cenário { "2.1.1" } do JammerTest { "2024" } (~{ "1.01" } ms de desvio real do tempo servido vs ≤{ "51" } ns afirmados). Ponte sobre partes validadas — não é em si uma validação externa. Comparação externa { "0.30" }, uma constatação (continua MODELLED): nos cenários de spoofing do JammerTest { "2024" } o erro medido de tempo servido não detetado excede o TPL nominal em { "3" } de { "8" } inícios detetados: { "184.3" } vs { "34.6" } ns ({ "2.1.4" }), { "295.7" } vs { "159.3" } ns ({ "2.3.5" }) e { "143.0" } vs { "69.0" } ns ({ "2.3.11" }); três dos cinco dentro são triviais (um falso alarme anterior ao início retido). Causa provável: o termo de deriva de uma calibração de { "60" } s sem ruído de deriva não cobre a variação de frequência do TCXO do recetor ao longo de { "15" } a { "39" } s. O erro medido é a estimativa de relógio de ponto único do próprio Kshana face a uma reta ajustada às suas próprias estimativas anteriores ao início, pelo que mesmo uma concordância não teria sido totalmente independente. Ronda { "2" } de { "0.30" }, face aos inícios do registo oficial do JammerTest { "2024" } e ao erro temporal medido do recetor (fixada antecipadamente 6a66994b), uma constatação (continua MODELLED): em { "4" } de { "10" } inícios registados o erro não detetado excede o TPL de estado de deriva ({ "634.7" } contra { "458.5" } ns em { "2.1.1" }, { "232.6" } contra { "16.2" } ns em { "2.3.5" }, { "41.3" } contra { "6.0" } ns em { "2.3.10" }, { "218.6" } contra { "47.4" } ns em { "2.6.3" })

# text
seg-0ec37553bbc4 = Análise de missões cislunares

# text
seg-a47465f682ba = STM do CR3BP + corretor diferencial de tiro simples; NRHO sul L2

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; família de halos sul L2 Terra–Lua, metodologia de Howell/Davis) — período T, Jacobi C e condições iniciais de cruzamento perpendicular publicados externamente; o corretor STM de tiro simples do kshana, semeado com a CI do catálogo e perturbado, converge de volta para os membros do catálogo

# text
seg-f1d49eac89f8 = PNT alternativo / complementar

# text
seg-023dda973f66 = Correspondência com mapas de gravidade, referenciada ao terreno (TERCOM/SITAN), anomalia magnética

# text
seg-da869d48e505 = Coeficientes IGRF-14; CRLB de filtro adaptado a partir de primeiros princípios. O campo do bench de gravidade de campo real é verificado externamente (linha 'Síntese de anomalia gravitacional a partir de um modelo de harmónicos esféricos'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-db7767ab661d = Síntese de anomalia gravitacional a partir de um modelo de harmónicos esféricos

# text
seg-2db367c4a473 = Anomalia gravitacional em aproximação esférica (Barthelmes STR09/02 eq. { "126" }, ICGEM gravity_anomaly_sa) a partir de coeficientes totalmente normalizados face a um elipsoide de nível em forma fechada (WGS84/GRS80), com o termo de grau zero, em grelha para o correspondente de mapas de gravidade

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), uma implementação independente: EGM2008 truncado ao grau { "70" }, gravity_anomaly_sa, WGS84, livre de marés, termo de grau zero, h = { "0" }. A saída do serviço não tem licença explícita, pelo que as grelhas são obtidas no momento do teste com um SHA-256 fixado (tools/fetch_icgem_grid.sh) e apenas dez valores são citados com atribuição

# text
seg-31f51d4998cb = Leitor de modelos digitais de elevação SRTM sobre terreno real

# text
seg-08ea4ae0b671 = Analisador de .hgt SRTM escrito à mão (16 bits big-endian, primeiro a linha norte, com tratamento de vazios) + amostrador bilinear que lê um mosaico DEM real de domínio público e resolve um marco de levantamento documentado

# text
seg-aae487789add = Mosaico NASA/USGS SRTM v3 (1 segundo de arco) N36W117 — dados de elevação de domínio PUBLIC-DOMAIN do Governo dos EUA, do espelho aberto AWS elevation-tiles-prod, decimados para 6 segundos de arco e submetidos em tests/fixtures/terrain/ (ver NOTICE.md), mais recortes de resolução total de N36W117 e N36W119 verificados nó a nó face ao leitor SRTMHGT independente do GDAL e aos marcos de levantamento do Monte Whitney ({ "4421" } m) e de Badwater (−{ "86" } m). O marco documentado da Bacia de Badwater (−{ "86" } m, o ponto mais baixo da América do Norte) ancora a leitura georreferenciada. A solução de navegação por correspondência de terreno/TERCOM que consome o DEM continua modelada (linha separada de PNT alternativo/complementar)

# text
seg-791e7285c291 = Reprodutibilidade e garantia de software

# text
seg-7177355a482c = Determinístico, com hash de cenário, SBOM + portões golden multiplataforma

# text
seg-6cf9d570cc51 = Aderência à norma do SBOM ao esquema JSON oficial CycloneDX { "1.5" } (+ identificadores SPDX válidos) — uma norma externa publicada, zero erros de validação sobre todo o grafo de dependências; a parte de determinismo da FoM / reprodutibilidade byte a byte continua a ser uma verificação de autoconsistência fixada, pelo que a linha continua MODELLED

# text
seg-89b2114542bb = Avaliação de deteção de degradações de RF por IA/ML ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético etiquetado de degradações + conjunto de testes ROC/AUC/confusão/Pfa-Pmd agnóstico ao detetor; salvaguarda contra fugas, divisão estratificada, relatório de otimismo por mudança de distribuição (dentro vs fora do regime). Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = Limites de AUC em forma fechada (Mann–Whitney) + um detetor de referência independente perfeito; o corpus é SINTÉTICO (com base em parâmetros, não de campo/IQ)

# text
seg-c38ebee794b3 = Estudo da diferença de otimismo da deteção de degradações de RF por IA/ML e preditor da diferença apenas com dados ID

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudo sintético controlado da diferença de otimismo da AUC entre dentro da distribuição→fora da distribuição em detetores de métodos publicados e aprendidos (regressão logística / MLP de uma camada oculta): tendências de lei de escala por classe (ρ de Spearman + declive em { "1" }−gravidade) e um preditor ridge apenas com dados ID que estima a diferença apenas a partir de diagnósticos dentro da distribuição, pontuado deixando de fora um detetor e deixando de fora uma classe. Reproduzível através de <c1/>

# text
seg-c46973920f5b = Estatísticas derivadas à mão face a formas fechadas (AUC binormal Φ(d'/√{ "2" }), variância de DeLong, ρ de Spearman com postos empatados, recuperação exata por OLS) + validação cruzada deixando um de fora face à linha de base que prevê a média. O corpus é SINTÉTICO (com base em parâmetros, nunca de campo/IQ) e a diferença de otimismo é uma variação de gravidade sintético→sintético, NÃO um resultado de simulação-para-terreno

# text
seg-fd6424213d1f = Compromisso PNT quântico versus clássico e resiliência sem GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestão de ADEV medido (NNLS), tabela de compromissos (holdover temporal/inercial + benefício), envolvente de resiliência versus tempo; ressalva do piso transportada no artefacto. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = O kernel de ajuste ADEV medido→PSD (NNLS) coincide com scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — um kernel externo independente; mas os NÚMEROS do compromisso quantificam (nunca validam) um relógio/CAI do parceiro, pelo que o próprio compromisso continua MODELLED, sem halo de validação

# text
seg-1fa865bfddd1 = Ambiente de meteorologia espacial e densidade termosférica dependente da atividade

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971, e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfis de difusão estáticos que reproduzem a sua Tabela { "7" }, com as variações diurna, geomagnética, semianual, sazonal-latitudinal e do hélio) face à atmosfera estática USSA76. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/space-weather.toml)

# text
seg-1cad4329e226 = Tabela definicional Kp↔ap + forma fechada da temperatura exosférica de Jacchia-1971 (coincidente a <{ "1" } K face às âncoras publicadas, tests/space_weather_reference.rs); a densidade é caracterizada face ao pymsis NRLMSISE-00 (um modelo independente do NRL): a variação do ciclo solar a { "800" } km é de 10.4x face a 13.6x no NRLMSISE-00. Revisão { "0.30" }: o fator de atividade de primeira ordem calibrado foi substituído por Jacchia { "1971" } (densidade do cenário predefinido a { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k removido, mean_exospheric_temperature_k acrescentado). Ronda { "2" } de { "0.30" }, densidades medidas por acelerómetro TOLEOS de CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; fixada antecipadamente 20eed695), uma constatação (continua MODELLED): as médias por órbita a { "400" } a { "500" } km estão dentro de um fator { "2" } no máximo solar fora de tempestades (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mas Jacchia { "1971" } é cerca de 1.7x demasiado denso no mínimo solar de { "2008" } (GRACE-A 412/544 dentro de um fator { "2" }), pelo que a densidade não é validada

# text
seg-29bedb28c34f = Interoperabilidade CCSDS OEM (importação de efemérides GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = Importador CCSDS { "502.0" } OEM (parse_oem), tolerante a linhas COMMENT / palavras-chave de metadados adicionais / blocos de covariância e a inversa exata do escritor; ida e volta + ingestão de ficheiros externos com verificação de consistência de velocidade. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Janela de lançamento e geometria de ascensão (análise de missões)

# text
# c1: launch-window
seg-6066c634faba = Azimute(s) de lançamento de dois corpos (sin Az = cos i / cos lat), inclinação mínima alcançável, velocidade circular, bónus de rotação da Terra para leste, Δv de mudança de plano em dogleg e oportunidades diárias e, dados uma época e linhas IERS finals2000A, a velocidade do local em torno do polo verdadeiro (launch::site_rotation_speed_at). Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Geometria de lançamento de trigonometria esférica em forma fechada face a âncoras de exemplos resolvidos publicados (Vallado, Fundamentals of Astrodynamics 4.ª ed., Algoritmo { "37" } azimute de lançamento + Cap. 6 mudança de plano; tests/launch_window_ascent_geometry_reference.rs). Estas reutilizam a mesma forma fechada que o kshana implementa (uma verificação de paridade de valor publicado / de transcrição, InternalConsistency); dois corpos MODELLED, sem modelo de triângulo de velocidades da Terra em rotação / ascensão / perdas por arrasto. Comparação externa { "0.30" } com o Orekit { "12.2" } (Apache-2.0), uma constatação (continua MODELLED): a geometria concorda até ao arredondamento (inclinação lida de volta a partir do azimute de fim de queima em { "158" } casos, pior { "2.6e-15" } rad; inclinação mínima, velocidade circular e delta-v de dogleg a { "3e-16" }), mas a velocidade do local por rotação da Terra falha o limiar de { "1e-6" } relativo fixado antecipadamente a { "62.9" } graus de latitude ({ "1.12e-6" }). A diferença cresce como tan(lat), consistente com um desvio do polo por movimento polar de cerca de { "5.8e-7" } rad no referencial da Terra do Orekit que o ω·R·cos(lat) esférico omite. A afirmação não foi restringida antes da execução, pelo que a linha não pode ser promovida com base nesta comparação. Ronda { "2" } de { "0.30" } (fixada antecipadamente 71bebf63): com uma época e linhas IERS, a velocidade do local no polo verdadeiro (campo de cenário site_rotation_speed_true_pole_m_s) concorda com o Orekit dentro de { "1e-6" } em { "24" } locais sobre quatro longitudes (pior { "4.9e-8" }), mas a velocidade nominal sem época que o cenário emite por predefinição como bónus de rotação da Terra continua a falhar por { "1.12e-6" }, pelo que a linha continua MODELLED até haver uma decisão sobre a saída predefinida

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Desaceleração de pico (independente do coeficiente balístico), velocidade + altitude no pico de g, e velocidade de aquecimento máximo para uma entrada balística em atmosfera exponencial. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Entrada analítica de Allen–Eggers em forma fechada, adicionalmente verificada de forma cruzada face a uma integração numérica solve_ivp (DOP853) do scipy { "1.18" } da MESMA EDO de entrada só com arrasto (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, pior a_max rel { "2.9e-9" }) — uma verificação de integral numérico face à própria forma analítica, pelo que continua InternalConsistency, NÃO uma validação externa. Balística MODELLED (sem sustentação), sem aerotermia/TPS — a saída de aquecimento é uma velocidade, não um fluxo de calor. Comparação externa { "0.30" }, uma constatação (continua MODELLED): face à reconstrução da entrada da SRC Stardust (Desai e Qualls, NASA NTRS { "20080008567" }), a desaceleração de pico de Allen–Eggers para o estado de entrada inercial impresso ({ "12.9" } km/s, -8.2 graus, H { "7200" } m) é de { "61.8" } g contra os { "32.89" } g da melhor trajetória estimada, +{ "88" } % face a uma tolerância de { "15" } %: a solução de ângulo de trajetória constante e sem gravidade quase duplica o pico de uma entrada rasa e mais rápida do que a velocidade de escape. A Stardust não levava acelerómetro, pelo que a reconstrução é uma estimativa de trajetória. Ronda { "2" } de { "0.30" }, bloqueada (continua MODELLED): uma solução de massa pontual planar integrada (reentry::simulate_planar_entry, US76, gravidade de inverso do quadrado, curvatura) concorda com as melhores trajetórias estimadas da Stardust e da Genesis dentro de { "15" } % (+{ "11.3" } %, +{ "5.6" } %), mas esses máximos são saídas de simulação de agências, não medições, pelo que é apenas uma verificação cruzada. A comparação com o acelerómetro (fixada antecipadamente a94a283d) está bloqueada à espera de uma cópia legível da análise REMM da Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-8c10b50407d3 = Pegada da carga útil de EO e geometria de cobertura

# text
# c1: eo-coverage
seg-45c1e799c87c = Geometria do triângulo espacial SMAD: raio angular da Terra, largura da faixa, GSD no nadir, acesso máximo fora do nadir e período circular, mais o período nodal J2 de primeira ordem (eo_payload::j2_nodal_period) e o espaçamento do traço no solo no equador R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) com um indicador de cobertura contígua, para uma altitude orbital, inclinação e FOV/IFOV do sensor. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/eo-coverage.toml); a sua inclinação predefinida é a heliossíncrona de eo_payload::sun_synchronous_inclination, uma predefinição de conveniência que não faz parte da afirmação validada

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) e GeographicLib { "2.1" } (MIT), ambos executados como programas separados, fixados antecipadamente (766823f3) antes da alteração do motor e de qualquer execução de referência independente: grandezas da esfera dentro de { "1e-9" } relativo (pior: raio angular { "5.4e-16" }, faixa { "7.0e-13" }, acesso { "1.9e-14" }), período { "1e-12" } ({ "1.6e-16" }), GSD no nadir { "1e-7" } ({ "2.9e-10" }), o período nodal J2 e o espaçamento dos nós dentro de { "0.1" } % de uma propagação numérica J2 do Orekit com detetor de nós ({ "1.2e-5" } e { "6.7e-5" }), o indicador de contiguidade exato (168/168), e face ao elipsoide WGS-84 o limbo dentro de { "0.3" } graus ({ "0.186" } graus) e o alcance máximo no solo dentro de { "0.5" } % ({ "3.2e-3" }). Remover o termo de regressão nodal faz falhar { "35" } de { "42" } pontos de nó. Âmbito MODELLED: pegada com Terra esférica; sem radiometria, MTF, atmosfera, jitter ou brilho especular; a inclinação heliossíncrona predefinida não é comparada. A verificação cruzada anterior com Skyfield/SGP4 é mantida como regressão. Revisão { "0.30" }: o espaçamento passa a comportar a regressão nodal J2 (cenário predefinido { "2756.37" } -> { "2752.17" } km)

# text
seg-940692c550f3 = Enquadramento TM/TC CCSDS Space Packet ({ "133.0" })

# text
# c1: space-packet
seg-bf06c7ffa875 = Codificação/descodificação do cabeçalho primário CCSDS 133.0-B Space Packet (versão/tipo/cabeçalho secundário/APID/indicadores de sequência/contagem/comprimento dos dados) + um cenário de enquadramento. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — uma implementação independente de terceiros do CCSDS 133.0-B-2; encode_packet/decode_packet do kshana coincidentes byte a byte (o cabeçalho primário de 6 octetos para { "33" } casos + o pacote codificado completo para { "12" })

# text
seg-5510c82f671a = Cabeçalho secundário, controlo de erros de pacote e segmentação do CCSDS Space Packet

# text
seg-7503bf761df9 = Extensões do CCSDS 133.0-B-2 Space Packet a par do cabeçalho primário: um cabeçalho secundário que transporta um código de tempo CCSDS 301.0-B (CUC ou CDS, campo P explícito ou implícito) e dados auxiliares, o campo de controlo de erros de pacote CRC-16, a segmentação de uma unidade grande de dados do utilizador e a sua remontagem, descodificação de fluxos com verificações de lacunas e de ordem de sequência, e pacotes PUS-TM. A saída do cabeçalho primário é idêntica byte a byte à anterior

# text
seg-4123d600477a = Fixado antecipadamente (003ef3eb) antes de qualquer comparação; quatro implementações independentes, nenhuma GPL, nada incluído: o ccsdspy { "2.0.1" } (BSD-3-Clause) descodifica { "34" } pacotes escritos pelo Kshana em { "5" } fluxos (cabeçalho primário, campo P, tempo grosso e fino, campos CDS, dados auxiliares, dados do utilizador, PEC) e ambas as unidades segmentadas de 1000 octetos são reconstruídas a partir dos seus dados do utilizador com { "0" } divergências, e assinala os fluxos de pacote perdido e de pacotes trocados que o Kshana rejeita; o CRC de { "8" } mensagens e de { "57" } campos PEC é igual ao binascii.crc_hqx do CPython e ao spacepackets-rs { "0.18.0" } (valor de verificação 0x29B1); { "66" } casos de código de tempo CUC e CDS são iguais, octeto a octeto, à escrita e leitura do spacepackets-rs { "0.18.0" } ({ "3" } casos CDS também ao spacepackets-py { "0.32.0" }); { "4" } pacotes PusTm do spacepackets-py { "0.32.0" } são idênticos byte a byte aos do Kshana. Não abrangido: códigos de tempo com época de agência ({ "7" } casos assentam em testes unitários), tramas de transferência TC e qualquer camada de ligação abaixo do pacote

# text
seg-7c61da52b8f8 = Exportação SPICE SPK (tipos { "9" } e { "13" })

# text
seg-582ce23522f6 = Escritor e leitor de kernels NAIF SPICE SPK dos tipos { "9" } (Lagrange, passos de tempo desiguais) e { "13" } (Hermite, passos de tempo desiguais), com a disposição DAF, descritores de segmento e diretórios de épocas, e a exportação de um CCSDS OEM para um kernel SPK (épocas UTC ou TDB para tempo de efemérides)

# text
seg-194c37ac787f = CSPICE N0067 através de spiceypy { "8.3.0" }, kernel de segundos intercalares naif0012.tls, fixado antecipadamente (5059fd2a) antes de o SPICE ler qualquer kernel do Kshana: o inventário do SPICE dos quatro kernels do Kshana é exato; spkpvn e spkgeo em { "5 516" } épocas e { "690" } avaliações de cadeia são iguais, bit a bit, à avaliação do próprio Kshana e ficam dentro do limiar em todos os nós (pior { "0.022" } dele); o Kshana lê kernels escritos pelo SPICE de forma idêntica ao bit; para as mesmas entradas, os kernels do Kshana são idênticos byte a byte aos do SPICE ({ "0" } bytes diferentes em quatro ficheiros); as épocas OEM convertem-se em tempo de efemérides dentro de { "6.0e-8" } s de str2et (limiar { "1e-6" } s) e o SPICE avalia a exportação OEM dentro do limiar (pior { "0.060" }). Arcos de Kepler sintéticos: nada sobre exatidão física. Os outros tipos de SPK não são escritos

# text
seg-d699104fc2af = Tipos SPICE SPK { "3" } e { "21" } (Chebyshev, linhas de diferenças estendidas)

# text
seg-7d3e8b5b40af = Escritor e leitor de segmentos NAIF SPICE SPK do tipo { "3" } (polinómios de Chebyshev para posição e velocidade em intervalos fixos, grau { "0" } a { "27" }) e do tipo { "21" } (matrizes de diferenças modificadas estendidas, as linhas de diferenças dos integradores do JPL, MAXDIM { "15" } a { "25" }), a partir de registos dados, em ficheiros que também contêm segmentos dos tipos { "9" } e { "13" }; seleção e avaliação de registos pela ordem dos leitores SPICE. O Kshana não ajusta coeficientes de Chebyshev nem produz linhas de diferenças

# text
seg-40323a2adce1 = CSPICE N0067 através de spiceypy { "8.3.0" } (spkw03, spkw13 e, da mesma biblioteca pelo seu símbolo f2c, spkw21; spkpvn, spkgeo), fixado antecipadamente (e1cf80d8) antes de o código existir, com os registos sintéticos gerados a partir do SHA-1 desse commit: para três ficheiros (tipo { "3" } graus { "0" }, { "12" } e { "27" } com { "3" } a { "150" } registos; tipo { "21" } MAXDIM { "15" }, { "20" } e { "25" } com { "1" } a { "250" } linhas, zero a duas entradas de diretório e uma cadeia de centros; tipo { "3" }, { "21" } e { "13" } num ficheiro com comentários) o inventário do SPICE dos kernels do Kshana é exato, os kernels do Kshana são idênticos byte a byte aos que o SPICE escreve a partir dos mesmos registos, e spkpvn e spkgeo são iguais, bit a bit, ao leitor do Kshana nos ficheiros do Kshana e do SPICE ({ "48 876" } componentes em cada sentido, limiar { "1e-12" } relativo). Registos sintéticos: nada sobre exatidão física; kernels reais do tipo { "21" } produzidos pelo JPL não fazem parte do conjunto de casos

# text
seg-39517faae95c = Mensagens de Dados de Atitude CCSDS (AEM, APM)

# text
seg-f88f6ea002c8 = Escritor e leitor das Mensagens de Dados de Atitude CCSDS 504.0-B-2 em KVN e NDM/XML: AEM versão { "2.0" } (e { "1.0" } em KVN, com o seu ATTITUDE_DIR, QUATERNION_TYPE e sequências de rotação numéricas) com tipos de atitude de quaternião, ângulos de Euler e rotação (spin) e as suas variantes de derivada, velocidade angular e nutação, vários segmentos; APM versão { "2.0" } com blocos de quaternião, Euler, velocidade angular, rotação (spin), inércia e manobra; o quaternião A-para-B de um registo (504.0-B-2 Anexo F)

# text
seg-8853058de1f3 = Analisadores e escritores Orekit { "13.1.8" } (Apache-2.0), executados como programa separado (xval/adm-orekit), fixados antecipadamente (7a6a05fe) antes de qualquer comparação: o Orekit analisa todas as mensagens escritas pelo Kshana ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) e todos os valores estão dentro do seu limiar (quaterniões { "1e-14" }, ângulos { "1e-9" } graus; pior { "0.054" } de um limiar); o Kshana analisa as { "31" } mensagens que o Orekit escreve a partir das mesmas entradas dentro de todos os limiares; a rotação de cada um de { "135" } registos de quaternião, Euler e rotação (spin) é igual a AemSegment.getAngularCoordinates dentro de { "1e-12" } (pior { "0.0071" } do limiar). Todas as { "15" } mensagens XML do Kshana são validadas face ao esquema NDM/XML { "4.0.0" } (dependente de dados, obtido com SHA-256 fixado). Constatação: o escritor APM do Orekit recusa uma manobra sem MAN_DELTA_MASS (opcional na norma), pelo que as manobras APM são cobertas apenas no sentido em que o Kshana escreve. Fora do conjunto de casos: tipos */RATE e XML do AEM { "1.0" }, blocos APM repetidos

# text
seg-5f26f879037e = Mensagens de Dados Orbitais CCSDS (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Escritor e leitor das Mensagens de Dados Orbitais CCSDS 502.0-B-3 em KVN e NDM/XML: OPM { "3.0" } e { "2.0" } (vetor de estado, elementos keplerianos osculadores, parâmetros da nave, covariância, manobras, parâmetros definidos pelo utilizador), OMM { "3.0" } e { "2.0" } (elementos médios por movimento médio ou semieixo maior, parâmetros relacionados com TLE com BSTAR ou BTERM e AGOM, covariância), e OCM { "3.0" } com trajetória (CARTP, CARTPV, CARTPVA; épocas absolutas ou relativas), propriedades físicas, covariância (CARTP, CARTPV em ordem LTM), blocos de manobra e definidos pelo utilizador; um OMM de precisão total a partir de um conjunto de elementos SGP4 a par do OmmFile::to_omm_kvn inalterado

# text
seg-d4c7896b5963 = Analisadores e escritores Orekit { "13.1.8" } (Apache-2.0) de OPM, OMM e OCM, executados como programa separado (xval/odm-orekit), fixados antecipadamente (cc6841da) antes de qualquer comparação: { "27" } das { "30" } mensagens escritas pelo Kshana ({ "6" } casos OPM, { "5" } OMM e { "5" } OCM em KVN, e XML para a versão { "3.0" }) são analisadas no Orekit com todos os valores dentro de { "1e-14" } relativo e todas as épocas dentro de { "1e-9" } s ({ "904" } valores, pior { "0.021" } de um limiar), e o Kshana lê todas as { "25" } mensagens que o Orekit volta a escrever dentro dos mesmos limiares ({ "858" } valores, pior { "0.020" }); todas as { "14" } mensagens XML do Kshana são validadas face ao esquema NDM/XML { "4.0.0" } (dependente de dados). Constatações, fixadas, que restringem a afirmação: o Orekit exige ELEMENT_SET_NO (opcional na 502.0-B-3), recusa COMMENT nos parâmetros definidos pelo utilizador em XML (o esquema permite-o), não escreve BTERM sem BSTAR (pelo que BTERM e AGOM são cobertos apenas no sentido em que o Kshana escreve), e soma as épocas relativas do OCM como segundos SI, pelo que em TDB diferem da leitura do calendário TDB em cerca de { "1.9e-10" } s/s (UTC, TAI e TT concordam). A saída antiga OmmFile::to_omm_kvn, que envolve os metadados do OMM em META_START/META_STOP, é recusada pelo Orekit (registado). Fora do âmbito: blocos OCM PERT e OD, conjuntos de elementos não cartesianos, outras ordenações de covariância

# text
seg-1e5ea1d9918d = Orçamento de erros de atitude e de apontamento de 3 graus de liberdade (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Binário perturbador de gradiente gravítico no pior caso ((3/2)(μ/R³)ΔI) como pico sobre a atitude (a afirmação validada), mais um orçamento de erro de apontamento RSS sobre contribuintes nomeados de 1σ com o termo dominante (uma soma em quadratura de números fornecidos por quem chama, fora da afirmação validada). Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), uma implementação independente em C++ do binário de gradiente gravítico de tensor completo: o pico (3/2)(μ/R³)ΔI do Kshana é igual ao binário do Basilisk na atitude de { "45" } graus a { "1e-12" } relativo (pior { "2.1e-15" }) em { "5" } altitudes e { "8" } tensores de inércia, e limita o binário do Basilisk em { "2000" } atitudes aleatórias por caso; tolerância fixada antes da comparação. Afirmação validada: o pico do binário de gradiente gravítico. O orçamento de apontamento RSS é uma soma em quadratura de números fornecidos por quem chama, sem verdade externa, e fica fora dela; a maximização de tensor completo do Hipparchus codificada à mão mantém-se como autoconsistência de apoio. Sem simulação de malha de controlo/6-DoF/modos flexíveis

# text
seg-1461aa14a7ff = Previsão de passagens sobre estações terrestres (segmento terrestre)

# text
# c1: passes
seg-e1cf1ec4f005 = Passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação máxima, duração) de um propagador do motor sobre uma estação acima de uma máscara de elevação, com cruzamentos de nascimento/ocaso interpolados e acesso total: passes::predict_passes, o escalonador geométrico (sem refração nem tempo de luz). O tipo de cenário <c1/> executa o previsor aparente da linha 'Previsão aparente de passagens sobre estações terrestres com refração e tempo de luz'

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — uma biblioteca de dinâmica de voo independente: ElevationDetector (localizador de raízes de Brent) + EventsLogger sobre efemérides ITRF, estação como um TopocentricFrame WGS-84. AOS/LOS/elevação máxima/número de passagens/acesso total coincidentes com órbita+estação+máscara+janela idênticas (fixture submetido; programa de condução xval/orekit-passes)

# text
seg-1dd8b2655b18 = Previsão aparente de passagens sobre estações terrestres com refração e tempo de luz

# text
# c1: passes
seg-46f93d3c24d2 = Passagens de visibilidade (AOS, TCA, LOS, elevação aparente máxima, duração) de um conjunto de elementos SGP4 sobre uma estação WGS-84 no percurso de órbita terrestre validado (IAU 2006/2000A, parâmetros de orientação da Terra opcionais), com a refração troposférica ITU-R P.834-9 (equações { "9" } a { "14" }, os coeficientes impressos na Recomendação) e o tempo de luz da ligação descendente, cada um comutável; cruzamentos resolvidos por bisseção a { "1e-7" } s e a culminação por pesquisa de secção áurea. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/passes.toml), com ambas as correções ativadas por predefinição

# text
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) com Hipparchus { "4.0.3" }: TLEPropagator sobre os mesmos conjuntos de elementos num TEME que o Orekit constrói segundo a definição indicada (o seu TOD IERS { "2010" } rodado por GAST - GMST), ElevationDetector e ElevationExtremumDetector com e sem ITURP834AtmosphericRefraction, e AngularAzEl com AngularRadioRefractionModifier para o caso do tempo de luz, cruzamentos e máximo resolvidos pelo Hipparchus; { "60" } casos (quatro órbitas, cinco estações ao nível do mar, máscaras de { "0" }, { "5" } e { "10" } graus, { "24" } horas). Limiares fixados antes da execução (fixada antecipadamente e947e69d, vertente { "3" } de 72ea9eb0). Ignorar o tempo de luz ({ "9777" } falhas) ou alterar a constante P.834 { "1.728" } para { "1.828" } ({ "7883" } falhas) faz o teste falhar. Âmbito: estações ao nível do mar; o coeficiente h*theta0^{ "2" } da P.834 no Orekit é { "0.011380" } onde a Recomendação imprime { "0.01380" } (fixado), pelo que alturas acima do nível do mar não são comparadas. A ronda { "1" }, face ao TEME IERS { "1996" } predefinido do Orekit, manteve todos os limiares de passagem mas falhou o limiar de direção pela diferença de convenção do TEME de { "72" } mas (fixada)

# text
seg-7b4a8e25c3c9 = Codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de ligação descendente LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei de cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que supera o seu limiar de quase ausência de erros da Tabela { "13" } da ETSI EN { "302" } 307-1 V1.4.1 mais uma margem de implementação em cada passo, o volume de dados ACM da passagem, e a linha de base de codificação constante que fecha na máscara e no alcance mais longo. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-a7f26e3a6030 = Consistência interna: a eficiência espetral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de trama concorda com as eficiências que a Tabela { "13" } imprime (uma verificação de transcrição da tabela de limiares); as parcelas do orçamento de ligação concordam com as suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM transfere pelo menos o volume da codificação constante. A geometria da passagem provém do previsor aparente de passagens, separadamente VALIDATED. O QUE NÃO É: não foi comparada nenhuma ferramenta externa nem ligação medida; os limiares são os valores AWGN ideais da norma, não os de um modem; o desvanecimento por chuva, a perda de apontamento ao longo da passagem e os pilotos não são modelados.

# text
seg-19603a7e0fe8 = Escalonamento de contactos terrestres com vários satélites e várias estações, com resolução de conflitos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contactos candidatos a partir de cada passagem satélite-estação com o seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro do seu tempo de reposicionamento ou um satélite faria downlink para duas estações em simultâneo; um objetivo de entrega ponderado por prioridade limitado ao atraso acumulado de cada satélite; um plano ávido de valor marginal preguiçoso, uma linha de base de ordem de chegada e um ramificar-e-limitar exato sobre até { "26" } candidatos, com a lacuna de otimalidade do plano ávido comunicada. Executável como o tipo de cenário <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-bc520db98f9a = Consistência interna: o ramificar-e-limitar exato concorda com a enumeração exaustiva em pequenos conjuntos aleatórios, cada plano é verificado como exequível face às regras de conflito, e o plano ávido nunca supera o ótimo exato. O QUE NÃO É: não foi comparado nenhum escalonador externo nem plano operacional; os contactos são tomados inteiros (sem divisão), o atraso acumulado é fixado no início da janela, o tempo de reposicionamento para além do tempo fixo e o armazenamento a bordo não são modelados.

# text
seg-ddf2bc2f13a9 = Orçamento de ligação unidirecional (comunicações / projeto de ligação)

# text
# c1: link-budget
seg-83331f513dba = Perda de percurso em espaço livre, C/N₀, Eb/N₀, margem e fecho sobre a equação de ligação CCSDS { "401" } / DSN 810-005 para EIRP/G·T/distância/taxa/banda face a um Eb/N₀ requerido. Executável a partir da CLI/bindings como o tipo de cenário <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Tabela publicada de controlo de projeto de telecomunicações do espaço profundo como vetores numéricos fixados: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabela 1-1 (Galileo banda X) — o kshana reconstitui as linhas da tabela e reproduz o seu L_fs de ponta a ponta publicado de { "290.54" } dB e Pr/N0 de { "54.6" } dB-Hz; a perda em espaço livre também verificada face à ITU-R P.525

# text
seg-3742d2aea62a = Enquadramento frugal de custo por cobertura / ROI

# text
seg-4228311689f8 = Custo por ponto percentual de cobertura + ROI de cobertura por euro sobre o motor de dimensionamento de constelações; o custo por satélite é um intervalo baixo/nominal/alto fornecido por quem chama (sem preços inventados)

# text
seg-d542ac64c31c = Aritmética de custos em forma fechada face a valores derivados à mão; um ENQUADRAMENTO económico de um valor de cobertura modelado, não uma cotação nem um modelo de custos validado

# text
seg-8ba6ee9acc8a = Impacto na integridade da deteção falhada (HPL/VPL com consciência do contexto vs limite de alerta)

# text
seg-f5985399d0d5 = Mapeia um enviesamento de spoofing/jamming não detetado para o erro efetivo → região de Stanford (disponível/indisponível/MI/HMI) face a HAL/VAL específicos do contexto (céu aberto vs urbano)

# text
seg-124d0ffe959e = Compõe a classificação de Stanford do RAIM validada externamente (raim::classify_stanford); o mapeamento deteção falhada→AL em si é modelado, não é uma alocação de integridade certificada

# text
seg-37d43b5b918a = Folha de parâmetros de modelo de erro citados de CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Desempenho de interferómetro de átomos frios com intervalos (melhor/nominal/conservador) — instabilidade de enviesamento, passeio aleatório de velocidade/ângulo, estabilidade do fator de escala, taxa de amostragem limitada pela interrogação, gama dinâmica de ambiguidade de franja — cada um rastreável a uma citação; alimenta o QuantumNavBudget sem modelar hardware

# text
seg-4b66096727b8 = Consistência interna: o intervalo VRW citado verificado de forma cruzada face à física de CaiAccelerometer::accel_asd + gama dinâmica bruta calculada a partir do limite de ambiguidade de franja; os números são intervalos MODELLED de levantamento da literatura (needs_source_confirmation), nenhum dispositivo validado, sem halo de validação

# text
seg-c93f2d3a3167 = Benchmark de aderência à norma da integridade temporal — classificador de épocas do diagrama de integridade de Stanford

# text
seg-712d5c35a6a6 = Classificação de épocas do diagrama de integridade de Stanford do TIB (nominal / indisponível / MI / HMI)

# text
seg-93b913e60063 = Reimplementação independente em numpy da regra das quatro regiões (scripts/gen_tib_scorer_reference.py) sobre o mesmo conjunto de amostras; método citado do diagrama de integridade Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) e da RTCA DO-229 WAAS MOPS. NÃO é uma referência independente de exatidão de ExternalDataset — o benchmark é imune à honestidade.

# text
seg-573aa0193cb3 = Benchmark de aderência à norma da integridade temporal — pontuador de cobertura de integridade

# text
seg-4d86f3c2d8f5 = Pontuação de cobertura de integridade do TIB (taxas de HMI/MI/disponibilidade + veredicto de cobertura de sobrelimite)

# text
seg-645eb084ae8e = Recontagem independente de regiões em numpy em tests/fixtures/tib/reference.json; apenas verificação cruzada da maquinaria do pontuador, sem afirmação de exatidão.

# text
seg-372dd0fdb025 = Benchmark de aderência à norma da integridade temporal — catálogo de falhas (geradores paramétricos)

# text
seg-2604e7cf27d2 = Menu de falhas do TIB (divergência de domínio, clock-slam, deriva em holdover, atraso estático/incremental/simétrico/assimétrico, repetição dentro da frescura, seletiva por caminho, quórum k-de-N)

# text
seg-b907aecaccd0 = Geradores paramétricos de falhas representativos (modelados); o conjunto não detetável (atraso simétrico, repetição dentro da frescura) é citado de Mizrahi RFC { "7384" } e Narula & Humphreys (IEEE JSTSP { "2018" }). Sem referência independente externa — um catálogo de falhas não faz nenhuma afirmação medida.

# text
seg-90c0eb1e7c14 = Benchmark de aderência à norma da integridade temporal — veredicto de absorção do não detetável

# text
seg-f713acf042ff = Veredicto de absorção do não detetável do TIB (o simétrico/repetição tem de ser absorvido pelo PL, nunca comunicado como detetado)

# text
seg-6840c2467c63 = Verificação de propriedade de que o enum Verdict estruturalmente não consegue comunicar uma falha não detetável como detetada (Mizrahi RFC { "7384" }); absorvido ⟺ PL ≥ desvio. Sem referência independente de exatidão.

# text
seg-3652a591eefc = Engenharia de plataforma de nave (AOCS/térmica/estruturas/propulsão/energia)

# text
seg-50a9c1c7dff0 = Não fornecido — o Kshana é um simulador de desempenho de navegação, não um fabricante de plataformas

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Projeto de carga útil RF de navegação e de hardware de antenas

# text
seg-76c983a23e7b = Não fornecido — o Kshana modela o desempenho do sinal, não o hardware de carga útil/antena

# text
seg-7bba3b35214c = Projeto e maturação de hardware de carga útil quântica

# text
seg-15fcc200b859 = Não fornecido — apenas modelos de desempenho; o hardware de átomos frios/relógios é de um parceiro

# text
seg-d69dd4c5167b = Garantia de produto de hardware de voo (radiação/EEE/MAIT)

# text
seg-b1540f78ffd4 = Não fornecido — o Kshana só se pronuncia sobre garantia de produto de software; a garantia de produto de voo é de um parceiro

# text
seg-1f200f8efc71 = Tempo coordenado lunar

# text
seg-2e6961dbffe9 = Taxa relativista de relógio Terra-Lua (LTC/TCL) + encadeamento TT/TAI/UTC + conjunto

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base do LTC LunaNet da IAU/IAG): autopotencial à superfície da Lua L_m = { "3.13881e-11" } e total secular de { "56.02" } µs/dia coincidentes como valores numéricos publicados; velocidade geocêntrica da Lua verificada de forma cruzada face ao JPL DE440 (de440s.bsp através do SPICE)

# text
seg-8adbbd2cdb74 = Autodescrição do relatório híbrido ótico/RF

# text
seg-2a5e48b558e1 = O relatório hybrid-optical-rf indica a configuração de ligação com que realmente foi executado (comprimento de onda da portadora, abertura de transmissão e de receção, distância, largura de impulso, tempo de integração, eficiências e perdas, predefinições resolvidas) e inclui um bloco de unidades que dá a unidade e a classe de proveniência de cada grandeza que um artigo provavelmente citará, incluindo os traços de covariância de transferência em metros quadrados

# text
# c1: variance
seg-23f0c10237f4 = Sem referência independente externa, e nenhuma é possível: isto é autodescrição, não uma medição. Fica registado porque a sua ausência era um defeito -- o P5 teve de citar o comprimento de onda da portadora e a abertura de transmissão a partir de predefinições do código-fonte, e de inferir que um <c1/> nu estava em metros quadrados a partir de uma verificação de consistência interna. A inferência estava correta, o que é precisamente a razão por que importava: nada teria detetado que estivesse errada

# text
seg-0691f3dee8cb = Disponibilidade da ligação híbrida ótica/RF no lado RF

# text
seg-72ccb655caf0 = O relatório hybrid-optical-rf indica uma disponibilidade de ligação RF, composta a partir de grandezas que o motor já calcula e não de uma climatologia importada, e indica a composição como uma regra nomeada: A_rf = I_closure * I_track, onde I_closure é o veredicto de fecho do orçamento de ligação unidirecional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margem de Eb/N0 >= { "0" }) à distância do próprio cenário e I_track é o veredicto do ciclo de seguimento (jamming::lock_status) sobre o C/N0 que esse MESMO orçamento devolveu. Cada fator transporta a classe de proveniência da sua entrada até à saída, e os fatores deliberadamente NÃO incluídos no produto -- visibilidade geométrica, negação por interferência e uma climatologia de interrupções de RF -- são nomeados com o motivo, em vez de silenciosamente postos a { "1" }. O ramo RF resolvido é repetido como o seu próprio bloco rf_link_configuration, e as figuras contínuas junto ao indicador (margem da ligação, margem de C/N0, as distâncias de fecho e de seguimento em forma fechada, e a utilização da distância) são as inversões em distância do mesmo orçamento. O relatório declara por extenso, no bloco e na entrada de unidades em que o leitor cai, que esta figura é LIMITADA POR MARGEM/GEOMETRIA e DETERMINÍSTICA, ao passo que a disponibilidade ótica é LIMITADA POR METEOROLOGIA/CLIMATOLOGIA e probabilística, pelo que os dois nunca podem ser citados como um par comparável de percentagens

# text
seg-319705ea0166 = Sem referência independente externa, e ExternalDataset é recusado. As duas entradas são uma margem de Eb/N0 e uma passagem de limiar de C/N0, ambas funções de uma EIRP, figura de mérito e alocação agregada de perdas MODELLED; não existe nenhum registo de disponibilidade medido de um serviço híbrido ótico/RF Terra-Lua com que verificar a figura composta. As verificações que existem são internas e são indicadas como tal: a composição é recalculada a partir das margens publicadas do próprio relatório e não dos internos do emissor, e a distância de fecho é verificada voltando a executar a equação de ligação NELA e exigindo que a margem se anule -- uma ida e volta de inversão, não uma implementação independente. O limite honesto da figura fica registado no próprio relatório: é um indicador determinístico 0/1, não uma probabilidade, porque nada neste motor mede uma distribuição de interrupções de ligação RF nesta banda e geometria. Essa entrada em falta é nomeada em rf_availability.factors_not_included em vez de inventada, e fornecê-la é o que uma disponibilidade RF probabilística exigiria

# text
seg-22c5df9b6c7c = Comparação de medição de distância ótica versus RF em condições equivalentes

# text
seg-70eb396f40af = O relatório hybrid-optical-rf emite a razão de medição de distância ótica versus RF com a UMA configuração a que ambos os ramos foram avaliados transportada no mesmo objeto: o mesmo percurso unidirecional, a mesma distância e o mesmo tempo de acumulação. O ramo ótico é o CRLB de ToA limitado por fotões do motor sobre a contagem unidirecional de fotões; o ramo RF é o jitter térmico de seguimento de código early-late do DLL do motor ao C/N0 que o próprio orçamento de ligação do motor devolve para essa mesma distância unidirecional. A largura de banda de ruído do ciclo é derivada, não escolhida: B_L = 1/({ "2" }*integration_s) põe o ramo RF exatamente no tempo de acumulação ótico, e se quem chama a substituir de modo que os dois tempos de média divirjam, a razão é REFUSED -- nula, com a divergência e ambos os tempos nomeados -- em vez de citada em dois pontos de operação. Não se forma nenhuma razão face ao rf_position_sigma_m paramétrico ESCOLHIDO do cenário, e a recusa diz porquê: essa entrada não transporta nenhuma configuração. O valor de referência divulgado de duas vias ótico e o fator exato que o liga ao ramo de comparação unidirecional são emitidos junto à razão, pelo que o relatório não pode ser lido como contendo dois sigmas óticos em desacordo

# text
seg-acbb3ac98ee3 = Sem referência independente externa para a RAZÃO, e ExternalDataset é recusado deliberadamente. A cadeia RF subjacente tem uma -- tests/validate_p5_rf_ranging_precision.rs verifica linkbudget::link_budget e navsignal::dll_code_jitter_chips face a um fixture independente em Python/NumPy e face ao valor trabalhado de Kaplan & Hegarty fixado no código ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz) -- e o CRLB ótico tem a sua própria linha de forma fechada. Reivindicar qualquer das âncoras para esta linha seria validação emprestada, que as invariantes da matriz existem para impedir: a grandeza aqui é uma RAZÃO numa configuração com EIRP, figura de mérito, potência de transmissão e abertura MODELLED, e não existe nenhuma comparação medida de medição de distância ótica versus RF num ponto de operação comum com que a verificar. O que é verificado internamente é aquilo em que a razão pode realmente errar: que os dois ramos estão num só ponto de operação. Isso é medido escalando o tempo de acumulação comum e exigindo que ambos os ramos se movam pela mesma lei de raiz quadrada e que a razão se mantenha, e é imposto recusando liminarmente a razão quando os tempos de média divergem. Ambos os ramos são limites de ruído térmico/de disparo e ambos excluem atraso do meio, erro de relógio e ambiguidade, pelo que a exclusão é idêntica em cada lado; o relatório di-lo em vez de o deixar inferido

# text
seg-3f26f598e013 = Autodescrição do relatório de orçamento de ligação

# text
seg-b88bf41d6d4c = O relatório de orçamento de ligação indica todas as constantes absolutas a partir das quais a sua própria margem foi calculada -- a frequência da portadora que a perda em espaço livre usou, a EIRP, a figura de mérito, a perda agregada e o termo de Boltzmann -- mais o G/T requerido a que a margem é nula, a constante de ligação (EIRP - perdas - Eb/N0 requerido) que é a única combinação que uma tabela publicada de taxa/ganho pode alguma vez fixar e, quando quem chama indica uma temperatura de ruído do sistema, o ganho da antena de receção que essa figura de mérito implica

# text
seg-52f98f50522f = Sem referência independente externa: isto é autodescrição sobre uma equação já validada face a uma tabela publicada de controlo de projeto (ver a linha do orçamento de ligação unidirecional). Fica registado porque a sua ausência era um defeito medido -- reproduzir o d1_rate_gain_beamwidth.csv divulgado exigiu resolver retroativamente uma constante efetiva a { "0.0034" } dB a partir de todas as trinta linhas, e o motor agora tanto nomeia essa combinação como prova, por teste, que nenhuma tabela divulgada poderia alguma vez ter separado os seus três componentes

# text
seg-a7b192e27cb5 = Tabela de cruzamento de tempo lunar por classe de relógio

# text
seg-cab605dc6ea2 = Uma execução de orçamento de tempo lunar emite uma linha de cruzamento relógio-vs-referencial por classe de relógio face a um único termo de referencial partilhado, de modo que o relógio é a única variável na comparação; cada linha comporta o cruzamento obtido de duas maneiras -- por bisseção da curva geral de erro temporal em lei de potência e por inversão algébrica a partir do tipo de ruído dominante da linha -- com a diferença relativa entre elas

# text
seg-ccec15f0b125 = Dois cálculos diferentes na mesma base de código da mesma grandeza, e não um só reformulado: a bisseção sobre a curva de lei de potência IEEE-1139 nada sabe do tipo de ruído, enquanto a forma fechada inverte algebricamente o tipo dominante, pelo que um tipo de ruído mal classificado ou um mau intervalo de pesquisa aparece como uma diferença relativa não minúscula. Os quatro valores reproduzem também a tabela publicada do artigo até meio último dígito impresso -- mas essa tabela foi ela própria reconstruída a partir da mesma forma fechada, pelo que é uma verificação de reprodutibilidade e não uma referência independente externa, e o termo de referencial face ao qual é medida é uma alocação modelada

# text
seg-ff32b78acb8c = Erro conjunto de UT1 e de movimento polar sobre um conjunto comum de linhas

# text
seg-561e588153af = Uma tabela comunica o erro de previsão de UT1, o erro do polo por movimento polar e a sua combinação em quadratura na Lua sobre um conjunto de épocas IDÊNTICO por horizonte, emitindo as épocas em que cada componente foi medido. Em separado, o cenário nomeia a entrada EOP que está em vigor e decompõe o seu recenseamento de linhas, e emite sempre a tabela de horizontes previsto-versus-final com uma declaração explícita do motivo por que está vazia quando está

# text
seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3) a ler o produto IERS finals2000A com a sua própria regra Bulletin-B-senão-A, e pyerfa { "2.0.1.5" } (SOFA) rotações completas celeste-para-terrestre (c2i06a, sp00, pom00, c2tcio; o ângulo de rotação da Terra segundo IERS { "2010" } eq. { "5.15" } em aritmética exata), executados como programas separados sobre linhas verbatim do finals2000A.all congelado de 2026-09-30; fixado antecipadamente (455b8fb5) com as alterações A1 e A2 que fixam apenas a precisão numérica da referência independente (ambas divulgadas com as execuções que se lhes seguiram): todas as listas de épocas da Tabela { "3" } iguais, estatísticas de UT1 e do polo dentro de { "6e-16" }, a combinação dentro de { "1.9e-7" }, 12/12 casos previsto-versus-final. A verificação da combinação não consegue resolver erros do termo do polo abaixo de cerca de { "1e-4" } relativo porque o UT1 a domina; a exatidão do polo assenta na verificação da estatística do polo a { "1e-9" }. As regras do conjunto de épocas e de recurso são o gerador a espelhar definições do Kshana, e os estados de tabela vazia são comportamento de projeto sem verdade externa. Magnitudes: erros de previsão realizados da Tabela 3a do IERS Annual Report { "2019" }, Kshana/IERS { "1.001" } a { "1.100" } a { "1" } a { "90" } dias (limiar [{ "0.8" }, { "1.25" }], medido). Recenseamento de linhas: astropy (linha de entrada offline). Ronda { "1" } (mantida como regressão): face à fórmula de exatidão impressa em { "178" } emissões do Bulletin A o polo concorda dentro de 1.5x e o UT1 não, o que testa a fórmula do IERS face ao seu erro realizado

# text
seg-3692f1fc89e6 = A entrada predefinida offline de orientação da Terra é um produto IERS real

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = A predefinição de execução de <c1/> é a cópia embutida da própria biblioteca de um extrato verbatim do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } linhas diárias consecutivas, MJD 61224-61397, cortadas do finals2000A.all de 2026-09-30) com as três vintages de linha que o formato define, classificadas pelos indicadores I/P do IERS (eop::row_vintage): { "30" } finais do Bulletin B, { "54" } linhas rápidas medidas (indicador I sem bloco do Bulletin B) e { "90" } previsões do Bulletin A (indicador P). Uma execução simples sem argumento de ficheiro e sem rede emite uma tabela por horizonte preenchida, o recenseamento rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) e predicted_rows.n = { "90" } sobre MJD 61308-61397; o corte tal como emitido das comparações previsto-versus-final é a última linha medida. O extrato anterior de 32 linhas (tools/finals2000A_2026.txt, todas as linhas com indicador I) e o excerto de cinco linhas apenas finais continuam a ser distribuídos e exercitados: neles predicted_rows.n é { "0" }, uma propriedade do ficheiro de entrada e não um resultado do analisador

# text
seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), a ler os mesmos bytes com o seu próprio leitor, e a tabela do IERS Bulletin A Vol. XXXIX N.º { "039" }, copiada número a número; fixado antecipadamente (6fdae01b) com seis critérios exatos antes de o astropy ser executado. Todos os seis se verificam: { "30" } linhas finais, { "54" } rápidas e { "90" } previstas com listas MJD iguais, todas as linhas previstas com indicador P, o recenseamento da execução predefinida igual, e as previsões iguais às do Bulletin A até ao último dígito impresso. Divulgado: o corte foi escolhido com uma simples fatia de colunas dos indicadores e do bloco do Bulletin B, que mostrou 30/54/90, antes do commit; o extrato é uma fatia verbatim que este repositório cortou de um produto IERS (SHA-256 no NOTICE do fixture). A afirmação validada é a classificação de vintages e o recenseamento da entrada predefinida distribuída e das suas linhas previstas; entradas arbitrárias do utilizador são classificadas pela mesma regra de indicadores mas não fazem parte da comparação. Ronda { "1" } de { "0.30" } (substituída): a predefinição anterior chamava previsões do Bulletin A a { "12" } linhas com indicador I; o motor passa agora a classificar por indicador. REVISÕES: as células da execução predefinida que se alteraram estão listadas de antigo para novo em docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, o piso do polo { "0.06776" } -> { "0.05550" } mas, o termo de orientação da Terra { "14.01601" } -> { "14.01583" } m, o total { "20.09759" } -> { "20.09746" } m e { "67.03834" } -> { "67.03790" } ns, as linhas da Tabela { "2" } de tests/golden/realtime-frame-eop.csv, e as figuras de concordância do previsor operacional); as anteriores em docs/revisions/G12-default-eop-cell-changes.md

# text
seg-18c72a7565d6 = Pegada de captura face à altitude e à largura de feixe

# text
seg-9c30a0ab5233 = Varredura de dois eixos da pegada de captura à superfície, ponderada pelo diagrama e limitada pela altitude, sobre a altitude do transmissor e o diâmetro do prato, emitida uma linha por ponto de operação com a largura de feixe a meia potência que cada diâmetro implica, e a captura do limbo comunicada como um LIMIAR -- por linha o J/S do limbo, a sua margem e a potência de transmissão que o fecharia; por grelha os cruzamentos localizados, ou uma declaração explícita de que o limbo não é alcançado em nenhum ponto da grelha, com o défice

# text
seg-4d866b62d4f7 = Inclusão de conjuntos: a razão jammer-sinal entra como um desvio uniforme em decibéis, pelo que o conjunto capturado a uma potência de transmissão mais alta contém o conjunto a uma mais baixa e a fração só pode subir -- uma propriedade que o diagrama de Airy NÃO dá em largura de feixe nem em altitude, onde a região capturada se parte em anéis e a fração é genuinamente não monótona. Nenhuma tabela publicada dá a fração de disco capturada de um transmissor orbital lunar face à altitude e à largura de feixe, pelo que não há nada externo com que verificar estas células; o diagrama subjacente é validado em separado face a valores de Bessel publicados e mantém a sua própria linha

# text
seg-fc0a64b9a280 = Reprodutibilidade do orçamento de erro de tempo lunar

# text
seg-5d5970506b9c = O cenário lunar-time-budget publica as suas saídas de valor matricial como uma tabela de forma longa (índice de grelha, tempo de média, termo) a par do relatório, de modo que as sete curvas x(tau) por termo e o total de raiz da soma dos quadrados são saída do motor e não algo que um leitor reconstrói a partir da secção de método

# text
seg-62df6258bc62 = Apenas autoconsistência: o total publicado é verificado face à raiz da soma dos quadrados dos termos do mesmo ficheiro, e a curva emitida reproduz o p3_time_budget_curve.csv divulgado em todos os { "57" } pontos. Ambas as verificações partilham as definições de termos do próprio motor, pelo que nenhuma é independente. O termo do relógio assenta em especificações de relógios publicadas, mas as MAGNITUDES dos pisos de ligação, de referencial, relativista e de efemérides são alocações de orçamento documentadas sem referência independente externa

# text
seg-675887733454 = Laboratório de tempo de estação lunar: holdover do miniRAFS face ao LTC

# text
seg-7dfedc40da6a = O bloco opcional [time_lab] do cenário lunar-time-budget modela um relógio de estação de referência lunar (por predefinição a classe miniRAFS, ou qualquer classe nomeada, ou um cartão de dispositivo ajustado a pontos de estabilidade indicados) guiado para o Tempo Lunar Coordenado e depois em funcionamento livre ou novamente guiado a cada N segundos: a curva de erro temporal x(t) como a raiz da soma dos quadrados do termo de lei de potência do relógio, um resíduo de guiamento constante (ILLUSTRATIVE), um resíduo constante de realização do LTC e um termo opcional de taxa de altura da estação; o tempo após um guiamento até { "1" }, { "10" } e { "100" } ns (ou limiares indicados) por bisseção junto à inversa em forma fechada para o tipo de ruído dominante, e o termo dominante em cada horizonte indicado, tudo com unidades

# text
seg-3801e9b32309 = Apenas consistência interna: o tempo até ao limiar por bisseção é verificado face à inversa em forma fechada do tipo de ruído dominante do relógio, e o termo do relógio em funcionamento livre face ao próprio termo do relógio do orçamento. As classes de relógio assentam em especificações publicadas a um dia (as suas próprias linhas); a taxa do LTC não é aqui rederivada e mantém a sua própria linha VALIDATED (Tempo coordenado lunar); o resíduo de guiamento é ILLUSTRATIVE, o resíduo de realização é uma alocação de orçamento e não está incluído nenhum modelo térmico. O alvo ao nível do nanossegundo descrito no material Lunar PNT do ICG WG-B de junho de { "2024" } é citado como declaração da fonte, não adotado como afirmação; nada aqui é uma declaração sobre qualquer relógio de estação real

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Atraso VLBI de campo próximo para uma linha de base terrestre que observa um farol lunar + derivadas parciais

# text
seg-d1943f9932af = delta_dor de onda plana (mesma base de código) no limite de campo distante; derivadas parciais por diferenças finitas. Comparação externa { "0.30" }, uma constatação (continua MODELLED): face aos tempos de luz convergidos do ANISE { "0.10" } através do DE440 ({ "75" } atrasos em 2024-01-01 sobre três linhas de base DSN, gerados por xval/anise-lunar-od sem código do Kshana), nenhum atraso está dentro da tolerância de { "1" } ps. A maior diferença é de { "24" } µs, proveniente do centro analítico da Lua (cerca de { "200" } km do DE440), da geometria instantânea única sem iteração de tempo de luz ({ "3.6" } µs) e do movimento polar omitido; as derivadas parciais do farol diferem até { "2.9e-3" } relativo face a { "1e-6" }. A afirmação na documentação do módulo de que as aproximações de referencial estão abaixo da fidelidade do modelo não se mantém a este nível. Ronda { "2" } de { "0.30" }: o percurso por kernel (lunar_vlbi::KernelGeometry) é validado face aos tempos de luz do NAIF SPICE na sua própria linha, VLBI geodésico lunar, percurso por kernel; a comparação do ANISE desse percurso (75/75 dentro de { "1" } ps, pior { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) é apenas uma verificação cruzada da avaliação do kernel, porque a resolução do tempo de luz nesse conjunto de testes é do próprio projeto. Esta linha (o percurso analítico predefinido) continua MODELLED com a constatação acima

# text
seg-d12d4565b01d = VLBI geodésico lunar, percurso por kernel

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Atraso VLBI de campo próximo para uma linha de base terrestre que observa um farol lunar, com derivadas parciais do farol e das estações, no percurso por kernel (lunar_vlbi::KernelGeometry): Terra e Lua DE440, eixos principais lunares DE440, orientação da Terra ITRF93 com UT1 e movimento polar, cada tempo de luz convergido no referencial baricêntrico, derivadas parciais com o fator de tempo de luz 1/(c - u.V). Executável como o cenário <c1/> com planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path definidos; as saídas validadas são a série geometric_delay_s e epoch_partials do percurso por kernel. No percurso por kernel, delay_s acrescenta o termo de Shapiro diferenciado analítico, que não é comparado, e delay_rate e near_field_correction_us não são comparados

# text
seg-c7f6842b6019 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) tempos de luz newtonianos convergidos (spkcpt/spkcpo, CN) de um farol fixo em MOON_PA_DE440 até às estações DSN DSS-14, DSS-43 e DSS-63 a partir do kernel de estações NAIF earthstns_itrf93_260814.bsp, com de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec e naif0012; as derivadas parciais são diferenças centrais de cinco pontos de tempos de luz do SPICE, não a fórmula 1/(c - u.V) do Kshana. Fixado antecipadamente (a689c797, épocas de { "2024" }) com limiares de { "1" } ps em cada atraso e de { "1e-6" } relativo em cada derivada parcial. Essa primeira execução falhou (17/75 atrasos dentro de { "1" } ps, pior { "1.03e-11" } s): o SPICE guarda o ET como um único double, cujo espaçamento em { "2024" } arredonda a época de emissão até { "6e-8" } s, cerca de { "6" } ps de tempo de luz, e o resíduo coincide com esse arredondamento a uma correlação de { "0.99999" } (fixado; o revisor reproduziu-o de forma independente). A alteração 66e365d4, escrita depois desse resultado e antes de o seu fixture existir, transferiu a mesma referência independente e os mesmos limiares para { "25" } épocas horárias perto de J2000, onde o espaçamento do ET é no máximo { "1.5e-11" } s: 75/75 atrasos dentro de { "1" } ps (pior { "6.2e-14" } s), 75/75 derivadas parciais do farol (pior { "7.4e-9" }), 150/150 derivadas parciais das estações (pior { "3.8e-11" }). Fora da afirmação: o percurso analítico predefinido (série da Lua e referencial lunar médio, { "24" } µs do ANISE através do DE440, a linha VLBI geodésico lunar), o termo de Shapiro diferenciado que o cenário acrescenta analiticamente, meios, e a escala baricêntrico-para-geocêntrico

# text
seg-1f10810131be = Leitor de kernels NAIF: contentor DAF, SPK tipo { "2" } e PCK binário tipo { "2" }

# text
seg-7da4847e7a28 = O leitor em Rust puro do próprio motor para kernels binários NAIF (naif_kernel): o contentor DAF (ambas as ordens de bytes, registos de sumário ligados), segmentos de posição de Chebyshev SPK tipo 2 encadeados pelos seus centros até um antecessor comum mais baixo, e segmentos de ângulos de Euler PCK binário tipo 2 transformados numa rotação de J2000 para o corpo, com as épocas tomadas como ET de duas partes para que um desvio inferior ao microssegundo conserve a sua precisão. É por ele que o KernelEphemeris (ephem_provider) e os percursos por kernel de lunar_vlbi, lunar_llr e lunar_vlbi_fim leem o DE440. A afirmação é que lê corretamente os kernels do JPL; não é uma afirmação de que o DE440, ou as séries analíticas do Sol e da Lua do motor, sejam exatos

# text
seg-09773b73d785 = Dois leitores de kernels independentes sobre os mesmos ficheiros NAIF: NAIF SPICE Toolkit N0067 (CSPICE através de spiceypy { "8.2.0" }, MIT; spkezr e pxform) e ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate e Almanac.rotate), ambos executados como programas separados sobre de440s.bsp e moon_pa_de440_200625.bpc. Fixado antecipadamente (abcd9133) antes de existir qualquer fixture ou valor de referência independente: a semente da grelha são os primeiros { "16" } dígitos hexadecimais do hash desse commit, pelo que nem as { "200" } épocas nem os pares de corpos puderam ser escolhidos com o resultado à vista; cada época também inclui a Lua e o Sol relativos à Terra. Limiares fixados antecipadamente a partir da avaliação de Chebyshev em dupla precisão (no máximo { "15" } coeficientes, n^{ "2" } u = { "2.5e-14" } por avaliação, duas avaliações e até dois saltos por lado): posição { "1e-13" } R + { "1e-5" } m, velocidade { "1e-13" } V + { "1e-10" } m/s, R e V a maior magnitude relativa ao antecessor comum mais baixo; elemento de rotação { "1e-13" } W + { "1e-15" }, W a soma dos coeficientes do registo que cobre; o ANISE acrescenta { "2" } ns de movimento relativo pelas suas épocas em nanossegundos. Resultado: cada um dos { "600" } estados e das { "200" } rotações dentro do seu limiar face a ambas as referências independentes, nos recortes e nos kernels completos; pior { "6.0e-3" } do limiar (posição), { "5.9e-3" } (velocidade), { "3.7e-3" } (rotação). Mutação: avaliar cada registo em -s faz falhar { "3597" } comparações. Divulgado: uma verificação anterior de 25 épocas face ao SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) foi vista antes desta linha e não é a sua evidência; a primeira execução do gerador de fixtures abortou num intervalo de grelha vazio antes de produzir qualquer valor e foi corrigida. Ambos os lados leem o DE440, pelo que a concordância valida o leitor, não as efemérides

# text
seg-e08e98908f3a = GNSS terrestre à distância lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Receção de GNSS terrestre à distância lunar: a camada de sinal fraco que a Tabela { "1" } do P7 nomeia e para a qual o motor não tinha modelo. Por satélite e por época calcula o ângulo fora do eixo face ao nadir do transmissor, se a Terra oculta o trajeto retilíneo, a distância oblíqua e a sua perda em espaço livre, o ganho de transmissão a esse ângulo, a potência recebida e a densidade portadora-ruído; depois agrega apenas as ligações que superam um limiar de seguimento, e varre uma revolução completa da constelação para que a resposta seja uma DISTRIBUIÇÃO e não um único instantâneo. Três factos determinam o resultado e o relatório declara cada um: a Terra subtende { "13.90" } graus a partir do raio da constelação, pelo que o PICO do feixe é geometricamente inacessível a qualquer raio dirigido à Lua; o que resta é a borda do lóbulo principal e os lóbulos laterais, o regime em que a LuGRE operou na Lua em { "2025" }; e a perda de percurso em L1 é de cerca de { "208" } dB, uns { "25" } dB mais do que paga um utilizador terrestre. MEASURED sobre a geometria incluída de classe GPS com 24 satélites ao longo de { "64" } épocas de um período orbital: disponibilidade de SINAL de { "0.375" } com a melhor ligação a { "30.93" } dB-Hz, e disponibilidade de SOLUÇÃO DE POSIÇÃO de { "0.000" } - no máximo duas ligações seguíveis em simultâneo, nunca as quatro de que uma posição precisa. A separação dessas duas disponibilidades é o essencial, e o relatório recusa deixar que se confundam: o GNSS terrestre à distância lunar é uma camada de grau de TEMPORIZAÇÃO, não de grau de posição, e um a priori de resiliência em camadas tem de tomar a disponibilidade de solução de posição. O condicionamento é emitido pela mesma razão - todos os satélites visíveis ficam dentro de um cone com poucos graus de largura visto da Lua, pelo que as linhas de visão são quase paralelas por construção. Executável como o tipo de cenário <c1/>. Reafirmado segundo D7: a afirmação à distância lunar é a densidade portadora-ruído RELATIVA entre satélites numa época, a partir de diagramas de transmissão bidimensionais medidos (NAVCEN Block IIR/IIR-M), mais visibilidade geométrica; o C/N0 absoluto não é afirmado (Parker et al. comunicam uma perda comum de { "7" } a { "12" } dB).

# text
seg-bed2679f88e5 = Identidades em forma fechada e consistência interna; NÃO é afirmada NENHUMA referência independente externa. O semiângulo do limbo é verificado face a asin(R_earth/r_orbit) e a geometria face a ele; a perda em espaço livre, o kernel DOP e a propagação SGP4 que esta linha compõe são cada um validados externamente nas suas próprias linhas e esta linha não toma emprestado o seu estado. PORQUÊ MODELLED, e é o diagrama de transmissão: o ganho em função do ângulo é uma abertura circular iluminada uniformemente, o diagrama de Airy, enquanto uma antena GPS L1 real é uma agregação helicoidal de doze elementos com um lóbulo principal moldado, com o pico fora do eixo para uniformizar a potência sobre o disco da Terra, e lóbulos laterais que não são de Airy. Existem diagramas medidos publicados que não estão aqui incluídos, pelo que as ordenações e as ordens de grandeza se mantêm, mas os dB de qualquer satélite individual não. UMA PRIMEIRA IMPLEMENTAÇÃO DESTA LINHA ESTAVA ERRADA DE UM MODO QUE VALE A PENA REGISTAR: a expressão de Airy só é válida no hemisfério frontal, o seu argumento vai como sin(theta), e para theta perto de { "180" } graus dá a volta e devolve o GANHO TOTAL NO EIXO por trás da abertura - pelo que as duas ligações mais fortes do primeiro relatório eram satélites a apontar as antenas para longe da Lua, e eram as únicas duas que superavam o limiar. Por trás da abertura o modelo aplica agora um piso plano de lóbulo posterior, indicado como um limite e não como uma forma de diagrama inventada. Deliberadamente ausentes, cada uma tornando o orçamento OTIMISTA: nenhuma perda ionosférica ou troposférica nos raios rasantes ao limbo, nenhuma perda de polarização, de apontamento ou de implementação, e uma Terra esférica sem extensão refrativa. A posição da Lua é uma ENTRADA, não uma consulta a efemérides, porque a grandeza em teste é a ligação e a geometria do feixe. Promover esta linha a validada exige um diagrama de transmissão medido e pontos normais da LuGRE para verificar; nenhum está no repositório e nenhum é aqui inventado. Ronda { "2" } de { "0.30" }, uma constatação (continua MODELLED): um percurso de ligação de entradas medidas (posições SP3 reais, potência de transmissão por bloco, diagramas de transmissão e de receção tabelados, histerese de aquisição e de seguimento) foi verificado face à Tabela { "3" } de Montenbruck et al. { "2023" } para o GENESIS a { "6000" } km (fixada antecipadamente 5b414f0a): as médias da antena zenital concordam em { "5" } de { "6" } dentro de um dB da sensibilidade do artigo; as médias da antena nadiral são { "1.0" } a { "2.4" } satélites mais altas do que as impressas, plausivelmente porque o artigo usou diagramas de lóbulos laterais do GPS dependentes do azimute que não são publicados. As figuras à distância lunar desta linha continuam a usar o substituto de Airy. { "0.30" }+ D7, uma constatação (continua MODELLED): a grandeza reafirmada, a DIFERENÇA de C/N0 entre satélites Block IIR/IIR-M seguidos numa época, prevista com os diagramas L1 medidos por SVN do NAVCEN (bidimensionais, referencial de yaw-steering) face ao C/N0 de voo da LuGRE (fixada antecipadamente 768cb62b: { "99" } % visíveis, RMS dos pares <= { "3.0" } dB, mediana <= { "2.0" } dB, pelo menos { "50" } registos e { "30" } pares) tem dados a menos: as { "26" } épocas qualificadas de trânsito e de órbita lunar contêm { "15" } registos IIR/IIR-M seguidos (segue-se sobretudo IIF e III) e um par. Todos os { "15" } são previstos visíveis e o resíduo do único par é -0.06 dB; nada é afirmado

# text
seg-29df5b40a3f9 = Determinação de órbita lunar: GNSS terrestre face a radiométrico terrestre

# text
seg-647902ebcee3 = Determinação de órbita numa órbita de halo quase retilínea (ou numa órbita elítica congelada) a partir de dois tipos de dados independentes: pseudodistâncias de GNSS terrestre recebidas a bordo (a regra de ligação da linha GNSS terrestre à distância lunar, mais ocultação pela Lua) e distância e taxa de distância bidirecionais a partir do solo, de três estações da Deep Space Network. Cada uma é um ajuste em lote de mínimos quadrados de um passo em torno da órbita de referência com a sua covariância formal; uma simulação de Monte Carlo com semente da diferença entre as duas estimativas testa se as duas covariâncias a explicam (q = d' (P_G + P_R)^-1 d, qui-quadrado com seis graus de liberdade quando os modelos coincidem) e o que uma aceleração não modelada faz à estatística.

# text
seg-226dedaba243 = Um programa scipy/numpy independente integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente verifica a numérica das fórmulas indicadas, não a física, pelo que a linha continua MODELLED. Modelo restrito de três corpos: sem Sol, sem harmónicos lunares, o eixo de rotação da Terra ao longo da normal da órbita, entradas de recetor e de estação ILLUSTRATIVE.

# text
seg-652bdc29deea = Resolução de ambiguidades da fase da portadora lunar: superfície e orbitador

# text
seg-02496f9e9af2 = Fase da portadora e código de GNSS terrestre em diferença simples entre recetores numa estação à superfície lunar e num orbitador, com a diferença de relógio por época eliminada por perfilagem, uma ambiguidade por passagem contínua e a passagem mais longa como gauge. A covariância das ambiguidades flutuantes é um complemento de Schur; o LAMBDA resolve os inteiros, a taxa de bootstrap é comunicada junto a uma taxa de sucesso de mínimos quadrados inteiros por Monte Carlo com semente e aos sigmas de posição flutuantes e fixados. Comunicado como encontrado: aos { "12" } dBi registados o problema de diferença dupla não é formável (a alteração { "1" } passou a predefinição para { "25" } dBi depois de apenas as contagens de disponibilidade terem sido vistas), e a { "25" } dBi a fixação de inteiros NÃO é atingida - está fora de alcance (alguns por cento no máximo), embora a solução flutuante melhore com o arco.

# text
seg-8d8296752eb8 = Uma resolução independente em numpy das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração inteira exaustiva (Q4). Não é comparada nenhuma medição de fase da portadora GNSS ou lunar. MODELLED.

# text
seg-11dd1bb8e4e1 = Coestimação do referencial lunar: estações de superfície e orbitadores

# text
seg-a38c8d95e6c9 = Informação de Fisher do datum de sete parâmetros do referencial lunar a partir de telemetria laser de estações terrestres para os cinco refletores isoladamente e com distâncias orbitador-estação de superfície acrescentadas: a matriz de informação, o posto, os sigmas de Cramer-Rao, a métrica de degenerescência do módulo de identificabilidade lunar e conjuntos aleatórios de estações com semente. A órbita é mantida conhecida nos eixos lunares (o seu erro é transportado pelo sigma de distância do orbitador).

# text
seg-47d2afc53b3d = Uma diferença finita independente em numpy do modelo direto (F2). Nada é comparado com soluções reais do referencial lunar. O fator é condicional à órbita conhecida assumida e ao sigma de distância de { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Precisão da ligação espacial entre referenciais: GNSS, VLBI e telemetria laser co-localizados

# text
seg-a9ae8e99f00d = Precisão de Cramer-Rao dos desvios de translação, escala e rotação entre técnicas dos referenciais de GNSS, VLBI e telemetria laser quando uma só nave transporta as três, com a posição da nave eliminada em cada época e nove parâmetros incómodos de ligação local com um a priori, varridos sobre a exatidão da ligação local. Covariâncias pela via da raiz quadrada (as equações normais perdem os dígitos quando as técnicas são quase perfeitas).

# text
seg-b37ac7294112 = Um sistema empilhado independente em numpy com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Não são comparados dados do GRASP, do Genesis nem de outra missão. MODELLED.

# text
seg-ae627996875e = Sensibilidade lunar a números de Love e a libração

# text
seg-28780d07c4a7 = Informação de Fisher de h2, k2, l2 e das amplitudes físicas de libração a partir de telemetria laser (deslocamento de maré radial e horizontal, rotação dos refletores), seguimento de orbitadores (a aceleração k2 de grau 2 integrada ao longo da linha de visão, tendência removida), um gravímetro de superfície (fator gravimétrico { "1" } + h2 - { "1.5" } k2) e um relógio de superfície (taxa fracionária ({ "1" } + k2 - h2) W2/c2, ligada às constantes de tempo lunar). Os valores nominais de h2 e l2 são pontos de linearização; o estudo diz o que é sensível a quê, não quais são os números.

# text
seg-180d74388339 = Uma montagem independente por diferenças finitas em numpy (G2) e uma avaliação em forma fechada (G4). A sensibilidade a k2 da família de orbitadores é uma figura de limite superior (o estado da órbita absorve aqui apenas uma constante e uma tendência). Não é comparada nenhuma medição de maré ou de libração lunar; k2 é citado de Lemoine et al. { "2014" } como valor nominal. MODELLED.

# text
seg-da712b740519 = Aumento do DOP por faróis à superfície lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Diluição da precisão aumentada por faróis para um utilizador à superfície lunar: as linhas de linha de visão dos satélites visíveis e as linhas de medição de distância dos faróis de superfície visíveis são concatenadas numa só matriz de projeto e avaliadas através do kernel DOP partilhado, e o DOP resultante é mapeado para uma exatidão realizada de 1 sigma EM METROS através de um erro equivalente de distância do utilizador por farol, composto como a raiz da soma dos quadrados dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade dos faróis é o horizonte geométrico de duas alturas da Lua sem atmosfera, que não tem extensão refrativa e é por isso exato e não aproximado. Executável como o tipo de cenário <c1/>, que comunica satélites isoladamente, satélites mais faróis, e uma constelação maior como a via concorrente para a mesma geometria. MEASURED sobre a geometria golden incluída (utilizador a -80 graus, três faróis levantados, LCNS ilustrativo de seis satélites em t={ "0" }, máscara de { "5" } graus): { "5" } satélites visíveis dão PDOP { "9.6941" } e um 1 sigma 3-D de { "11.222" } m; acrescentar os faróis que realmente superam o horizonte dá PDOP { "4.1160" } e { "4.765" } m, um fator de { "2.355" }; o serviço de 24 satélites dá em vez disso PDOP { "2.4226" } e { "2.804" } m, um fator de { "4.002" }. O relatório imprime a contagem de faróis VISÍVEIS e não a configurada, e nesta geometria apenas UM dos três faróis supera o horizonte: os dois locais laterais ficam a cerca de { "333" } km do utilizador contra um horizonte de { "86" } km para uma antena de { "2" } m, pelo que o leitor nunca é deixado a supor que os três contribuíram

# text
seg-179fb996fc72 = A aritmética do DOP é o kernel crate::orbit::dop, validado externamente em separado face ao gnss_lib_py em tests/dop_reference.rs; esta linha não volta a tomar emprestado o estado dessa linha. O horizonte de visibilidade dos faróis é a forma fechada L01, e sigma = DOP x sigma_URE é a relação GNSS padrão (Kaplan e Hegarty, Understanding GPS/GNSS, secção { "7" }). Dentro desta linha, o próprio aumento é verificado face a um caminho DOP independente no repositório e fixado a um golden submetido. PORQUÊ MODELLED: o projeto da constelação, a colocação dos faróis, as alturas das antenas e as três magnitudes do orçamento de erro são entradas ilustrativas e não um levantamento no terreno nem uma ligação medida, pelo que os metros comunicados são uma propriedade de um cenário escolhido e não de qualquer serviço implantado. NOTA SOBRE A PROVENIÊNCIA: esta capacidade era anunciada no README e exercitada por dois testes de validação, mas não tinha NENHUMA linha da matriz nem tipo de cenário, pelo que não podia ser alcançada a partir de uma execução. Era afirmada em prosa, ausente do registo e inalcançável no motor ao mesmo tempo. A linha e o tipo foram acrescentados em conjunto. Ronda { "2" } de { "0.30" } (fixada antecipadamente db0eb9ec), bloqueada (continua MODELLED): a visibilidade do ANISE { "0.10.6" } e um DOP em numpy sobre a geometria da linha concordam (conjuntos visíveis exatos, incluindo { "72" } casos junto ao horizonte e { "48" } junto à máscara; DOP dentro de { "7.2e-13" }), mas os metros comunicados são o DOP vezes um erro de distância em raiz da soma dos quadrados ilustrativo de { "1.158" } m sem referência independente; a delimitação que os excluiria aguarda uma decisão do proprietário

# text
seg-b0b618abf402 = Cegueira de integridade em modo comum

# text
seg-e732ac99a9ae = Divisão exata em subespaço de paridade de um erro de medição na parte que o RAIM não consegue ver e na parte que consegue. Para o modelo instantâneo linearizado y = G·x + e, qualquer erro dy decompõe-se de forma única numa componente CEGA em range(G) — absorvida como um erro de estado S·dy e aniquilada pelo projetor de resíduos Pperp = I − G·S, logo invisível a QUALQUER teste de resíduos, e não apenas a um limiar em particular — e numa componente DETETÁVEL no espaço de paridade. O módulo devolve o projetor, a divisão e a fração cega, para que quem chama possa quantificar quanto de um erro específico um monitor instantâneo é estruturalmente incapaz de comunicar. Aplicado ao piso real entre efemérides: a discordância de nível métrico DE440-vs-INPOP21a e DE440-vs-EPM2021 na posição geocêntrica da Lua é absorvida quase inteiramente como erro de posição do utilizador (fração cega mediana { "1.000000" }; erro de posição cego mediano { "2.3955" } m e { "2.0050" } m) face a um resíduo de paridade ao nível de { "1e-15" } m

# text
seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) recalcula a divisão de mínimos quadrados sobre entradas submetidas COM uma parte de paridade real (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), semente { "20261001" }) sobre a geometria de 8 satélites e um subconjunto de 6 satélites, { "1464" } casos sobre ambos os pares reais entre efemérides, fixado antecipadamente (f672a314): blind_dx, residual, blind_norm e detectable_norm dentro de { "1e-12" } relativo a |dy| e blind_fraction dentro de { "1e-12" } absoluto (pior blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). O numpy constrói o próprio G a partir das posições submetidas, enquanto o motor usa equações normais com Gauss-Jordan; uma inversa esquerda oblíqua faz o teste falhar a { "5.5e-2" } |dy|. A alteração { "1" } (86c53301, após uma primeira execução, divulgada) relaxou apenas uma pré-condição de entrada sobre a fração de paridade (cada caso pelo menos { "1e-3" } e { "95" } % de cada geometria pelo menos { "0.05" }), não o limiar de concordância. Afirmação validada, como o P2 permite: a álgebra linear da divisão sobre essas entradas; as magnitudes do piso entre efemérides e a geometria lunar ilustrativa ({ "8" } nós do tipo LCNS a { "5000" } km) são entradas, não validadas, e a cegueira é uma propriedade conhecida de todo o RAIM instantâneo. A comparação numpy da ronda 1 (tests/lunar_common_mode_integrity_reference.rs) verificou apenas a identidade S·G = I porque as suas entradas estavam em range(G); é mantida como regressão. Proveniência das efemérides: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Nível de proteção de modo comum e envolvente total de integridade

# text
seg-ffc59a7ed497 = Álgebra analítica do projetor verificada face a si própria: uma covariância confinada a range(G) tem de dar um CMPL positivo, uma covariância confinada ao espaço de paridade tem de dar aproximadamente zero, e a envolvente tem de somar duas contribuições ortogonais no espaço de medição. A covariância de modo comum, a geometria da constelação e k são entradas representativas modeladas, NÃO um orçamento certificado, e não é feita nenhuma afirmação de que o limite triangular seja justo. NOTA SOBRE A PROVENIÊNCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope são públicos e distribuídos, e os seus testes unitários já eram citados pela linha de cegueira de modo comum, mas a AFIRMAÇÃO DA ENVOLVENTE em si não tinha linha - pelo que a única ressalva que a mantém honesta, a de que a soma é um limite triangular e não uma RSS, não era declarada em lado nenhum do registo. A linha regista a afirmação e a ressalva em conjunto.

# text
seg-5ed34a5b402e = OD conjunta lunar multitécnica + relógio

# text
seg-5ace1caff5a9 = Fusão em lote de VLBI + distância local lunar + distância entre satélites para recuperar posições e relógios de estações e da constelação

# text
seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq com LAPACK gelsd, numpy.linalg.inv; BSD-3) recalcula cada passo de Gauss-Newton, a solução de mínimos quadrados ponderados convergida, os sigmas formais e o erro das estações sobre os jacobianos e as observações submetidos de seis redes simuladas, fixado antecipadamente (5094bc31) a max({ "1e-8" }, { "100" } kappa eps) relativo. A primeira execução falhou na rede sem VLBI ({ "6.1e-7" } contra { "1e-8" }, uma inversa de equações normais com condição { "1.4e5" }); a correção do motor escrita depois desse resultado (batch_ls::gauss_newton_qr, um passo QR de Householder usado por estimate e formal_covariance) foi executada de novo com o limiar inalterado: passos de { "1.1e-14" } a { "2.4e-11" }, sigmas no máximo { "1.3e-11" }. A afirmação validada é a álgebra linear da resolução de fusão sobre essas entradas, não as magnitudes físicas da rede simulada nem os seus modelos de observação: a linha do atraso VLBI geodésico lunar continua MODELLED (o seu percurso analítico difere do ANISE até { "24" } µs), e os referenciais têm as suas próprias linhas. A recuperação de uma verdade simulada injetada e a consistência NEES continuam a ser verificações internas; a verificação cruzada anterior de Levenberg-Marquardt com Orekit { "12.2" } / Hipparchus (tests/lunar_joint_multi_technique_od_reference.rs) exercita batch_ls::gauss_newton, que estimate já não chama, e é mantida como verificação dessa primitiva. Revisão { "0.30" }: os erros de estação predefinidos de lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m com VLBI e { "2183.119" } -> { "2183.558" } m sem (resolução QR). Revisão { "0.36" } (STUDIO-15, matemática portátil; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m com VLBI e { "2183.558" } -> { "2184.021" } m sem, e a resolução sem VLBI pára após { "5" } iterações, não { "2" } (uma paragem limitada por arredondamento na rede mal condicionada); a comparação fixada antecipadamente foi executada de novo sobre entradas reexportadas com o limiar inalterado (numpy { "2.4.6" }, todas as seis redes passam)

# text
seg-69fbe488dec5 = Informação de Fisher e observabilidade de Cramér–Rao

# text
seg-043d4c7a2d6a = Informação de Fisher M=HᵀWH, limite inferior de Cramér–Rao, característica de observabilidade / espaço nulo do defeito de datum (pseudoinversa de Moore–Penrose) e escalares de conceção de experiências ótimos D/A/E/T obtidos a partir de um solucionador simétrico de valores próprios de Jacobi

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, assente em LAPACK) — uma referência independente de terceiros que calcula os mesmos valores próprios definidos de forma única, a covariância de Cramér–Rao σ²(XᵀX)⁻¹ e os fatores de diluição da precisão do GNSS através de um algoritmo diferente (divisão e conquista do LAPACK + LU) do varrimento cíclico de Jacobi e da pseudoinversa espetral do Kshana; concordância até { "1e-9" }. A mesma classe de biblioteca externa já valida o motor de DOP (face à gnss_lib_py) e os núcleos de χ²/erf (face ao SciPy). Adicionalmente verificado face aos CRLB em forma fechada de Kay ({ "1993" }) e à obtenção do CRLB por Monte Carlo (interna)

# text
seg-e4ec41d0f5e1 = Observabilidade absoluta de estações lunares (defeito de datum)

# text
seg-b3e4160042d2 = Observabilidade, pela informação de Fisher, da solução lunar conjunta: sem linhas de base com a Terra, o datum do referencial absoluto fica no espaço nulo de HᵀWH (a posição da estação é inobservável); ≥{ "3" } linhas de base restabelecem a característica completa e limitam o erro de Cramér–Rao da estação, que o estimador atinge

# text
seg-238597f6aa01 = Estrutura analítica do defeito de datum — o modo inobservável do referencial absoluto fica no espaço nulo da informação de Fisher (forma fechada), o limiar de característica coincide com a justificação de conceção publicada para 3 estações, e o estimador atinge o CRLB resultante em Monte Carlo. A geometria lunar em si é uma rede representativa (não uma efemérides de voo), pelo que a linha permanece MODELLED; o motor de FIM/CRLB subjacente é verificado separadamente face às formas fechadas de Kay ({ "1993" }). { "0.30" } ronda { "2" } (pré-registada fab02df9), bloqueada (permanece MODELLED): o NumPy/SciPy recalculam a característica e o defeito ao limiar indicado de { "1e-9" }, a parcela dos eixos da estação no espaço nulo (dentro de { "8.4e-10" }) e o CRLB da estação (dentro de { "1.2e-10" }) em { "17" } configurações registadas geradas pelo Kshana (P2). Não promovida: a afirmação de que o estimador atinge o limite (eficiência de Monte Carlo de cerca de { "0.98" }) não tem referência independente, e a delimitação que a deixaria MODELLED aguarda uma decisão do responsável

# text
seg-ae4b71d54dfa = Ajuste de datum de Helmert de 7 parâmetros + ligação de orientação ICRF a partir de uma rede de pontos

# text
seg-9e434924b34c = Solucionador independente em forma fechada de transformação de semelhança de Umeyama (Horn) ponderada (assente em SVD do numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — um algoritmo diferente do ajuste iterativo de Gauss–Newton do kshana, que chega ao mesmo ótimo de mínimos quadrados ponderados, definido de forma única, em redes de pontos idênticas byte a byte

# text
seg-4bcec6e2dd9f = Volume de serviço de navegação lunar

# text
seg-dba98ad5df1c = DOP / cobertura / disponibilidade lunares de classe Moonlight + níveis de proteção de ARAIM lunar generalizado ao longo de um volume de serviço

# text
seg-7e981d90a806 = Referência independente de terceiros: propagador kepleriano astro::Orbit do ANISE { "0.10.2" } (Nyx Space, MPL-2.0) — um percurso de código de dois corpos equinocial distinto do Kepler por Newton-Raphson do kshana; a posição MCI por satélite concorda em menos de { "1e-3" } m e a contagem/conjunto derivado de satélites visíveis coincide exatamente em todos os pontos da grelha. O núcleo de DOP é validado pela gnss_lib_py; a integridade usa parâmetros publicados do LunaNet/LCNS

# text
seg-2ed7181c97dd = Geração dos códigos de espalhamento do LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Os códigos do Augmented Forward Signal do LSIS V1.0 ({ "29" } de janeiro de { "2025" }): o primário de 10230 chips do AFS-Q, gerado a partir da construção do piloto L1C do IS-GPS-800 com os índices do IS-GPS-800J (as mesmas { "210" } atribuições que o Apêndice D do LSIS imprime), os códigos Gold de 2046 chips do AFS-I, gerados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } e g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, com o atraso de G2 de cada PRN recuperado do ficheiro do Anexo { "3" } da norma, os quatro códigos secundários, os códigos terciários de 1500 chips, a atribuição provisória de nós da Tabela { "11" } e o código piloto em camadas. O conteúdo do LSIS é lido em tempo de execução a partir de uma cache local verificada por SHA-256, preenchida a partir do PDF alojado pela NASA, nunca redistribuído

# text
seg-dc1dd144b107 = Referência: os valores que o LSIS V1.0 imprime para validação (Tabelas C-1 a C-5, D-1 a D-6, E-1 a E-6) e os seus ficheiros eletrónicos de códigos do Anexo { "3" }, sob um critério de zero divergências fixado antes da comparação. O critério não é atingido devido a uma célula impressa que é internamente inconsistente com o próprio ficheiro do Anexo { "3" } da norma, pelo que a linha permanece MODELLED; está redigida uma nota de errata. Os mesmos chips são também iguais aos do LANS-AFS-SIM (linha 'Renderização em banda de base do LunaNet AFS face a um gerador independente, dado o seu estado de canal')

# text
seg-ea20909686ea = Renderização em banda de base do LunaNet AFS face a um gerador independente, dado o seu estado de canal (LSIS V1.0)

# text
seg-c0f021c38842 = O núcleo de renderização da banda de base do AFS (LSIS-130: envolvente complexa I + jQ, I = o código Gold do AFS-I vezes a trama de { "500" } símbolos/s a { "1.023" } Mchip/s, Q = o piloto em camadas do AFS-Q a { "5.115" } Mchip/s, rotação da portadora, alinhamento de chip e de símbolo) reproduz as amostras de um gerador independente quando conduzido pelo próprio estado de canal registado por esse gerador (fases e taxas de código, fase e frequência da portadora, amplitude por canal). Não coberto: o modelo de nó que deriva esse estado a partir de um Doppler, um atraso e uma densidade de portadora para ruído, a divisão de potência 50/50 calculada a partir da densidade de portadora para ruído (as amplitudes são tomadas do simulador) e os metadados SigMF e a escrita de amostras de 8 bits

# text
seg-dd1142957a05 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, compilação para banda S, executada como programa separado); as amostras do Kshana são conduzidas apenas pelo estado de canal registado do simulador, e uma compilação com rastreio apenas de impressão é verificada como idêntica byte a byte à não modificada. Limiares fixados antes da execução: zero divergências de chip e de símbolo, |rho| >= { "0.999" } ao longo da execução e >= { "0.99" } por bloco de { "2" } ms, fase dentro de { "0.05" } rad. Amplitudes I e Q iguais são uma entrada da comparação, pelo que a divisão de potência não é testada por ela. O LANS-AFS-SIM lê os seus códigos terciários do ficheiro do Anexo { "3" } do LSIS, pelo que essa parte não é independente da linha dos códigos. LANS-AFS-SIM e PocketSDR-AFS têm o mesmo autor e contam como uma única implementação independente. Condicionada a dados: a comparação com o LANS-AFS-SIM precisa da cache local do LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificada por SHA-256) e, sem ela, é ignorada com um aviso

# text
seg-5d79da539912 = Codificação de canal da trama FID { "0" } do LunaNet AFS (LSIS V1.0)

# text
seg-6ed2b4c792e6 = A trama FID { "0" } de { "12" } s e 6000 símbolos do LSIS V1.0: padrão de sincronização de 68 símbolos, subtrama { "1" } BCH ({ "51" }, { "8" }) (gerador octal 763), CRC-24 (({ "1" } + X)·P(X)) nas subtramas 2-4, codificação LDPC de taxa 1/2 com os A, B^-1, C, D impressos (Anexo { "1" } do LSIS, lido em tempo de execução a partir da cache local verificada por SHA-256) e a perfuração da norma, entrelaçador de blocos { "60" } x { "98" }; um descodificador exaustivo da subtrama 1 que assinala um TOI fora de { "0" }..99, e um descodificador LDPC min-sum normalizado escrito apenas a partir de H = [[A, B, { "0" }], [C, D, I]]

# text
seg-46879e2e8ab5 = Biblioteca: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), cujos próprios BCH, CRC, LDPC e entrelaçador produzem tramas idênticas símbolo a símbolo às do Kshana para o mesmo conteúdo (zero divergências, limiar fixado antes da execução). Corroborada por valores de referência: o exemplo trabalhado de BCH da Figura { "8" } do LSIS V1.0 e o valor de verificação do CRC-24/LTE-A (catálogo de algoritmos CRC parametrizados de Greg Cook), ambos exatos ao bit; e pelo PocketSDR-AFS, que descodificou cada subtrama das tramas que sincronizou em três execuções, com CRC válido e bits da subtrama 2 coincidentes. O teste de verificação de paridade é quase uma identidade interna (confirma que o B^-1 impresso inverte o B impresso) e não é contado como referência independente. Condicionada a dados: a comparação com o LANS-AFS-SIM precisa da cache local do LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, verificada por SHA-256) e, sem ela, é ignorada com um aviso

# text
seg-56c7aeac59c1 = Descodificabilidade em malha fechada do LunaNet AFS por um recetor independente (LSIS V1.0)

# text
seg-da2d29d437b0 = Uma gravação AFS do Kshana adquirida, seguida e descodificada por um recetor de software independente e comparada com os rótulos de verdade da própria gravação. Isto prova apenas a aderência à norma e a consistência dos rótulos; não é uma afirmação sobre a física do canal, a propagação, a potência recebida ou os balanços de ligação, cujos valores na gravação são entradas escolhidas

# text
seg-8211583afc64 = Biblioteca: PocketSDR-AFS (T. Ebinuma a partir do PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, compilação para banda S, cópia com nível de registo apenas de impressão), segundo critérios fixados antes de cada execução. A terceira comparação pré-registada atinge integralmente os seus limiares de descodificação e seguimento C1 e C2, mas não a sua salvaguarda G0 tal como escrita (duas execuções do recetor não modificado diferem nos mesmos quatro registos de aquisição), e a segunda falhou por { "5" } violações, pelo que a linha permanece MODELLED. LANS-AFS-SIM e PocketSDR-AFS têm o mesmo autor e contam como uma única implementação independente; as verificações de vetores impressos da linha de codificação de trama protegem contra uma leitura errada partilhada

# text
seg-780369fb9a54 = Aderência à norma entre geradores GPS L1 C/A

# text
seg-ee47b60515f1 = Códigos de espalhamento GPS L1 C/A (sdr::CaCode) e subtramas 1-3 de LNAV (gps_lnav: quantização de campos do IS-GPS-200 com o pi da especificação, empacotamento em complemento para dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução da paridade das palavras { "2" } e { "10" }) comparados bit a bit com o gps-sdr-sim sobre o seu brdc0010.22n incluído ({ "32" } satélites)

# text
seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, executado como programa separado através de um suporte de teste registado), pré-registado f88f2969 com um limiar exato ao bit sobre (A) chips C/A, (B) todos os campos LNAV calculados, (C) todos os bits de paridade. RESULTADO: (A) { "0" } de { "32 736" } chips diferem, (C) a paridade de { "0" } de { "1 920" } palavras difere, (B) { "230" } de { "1 152" } campos calculados diferem por uma unidade: o eph2sbf do gps-sdr-sim trunca em direção a zero com conversões de C onde o inteiro difundido exige arredondamento (todo o valor divergente está a menos de { "0.01" } de uma unidade do inteiro arredondado do Kshana). Permanece MODELLED: o limiar registado era a conjunção

# text
seg-325900ed59ea = Geometria do sinal de cena IQ GNSS face a um gerador independente de banda de base

# text
seg-ee5625b30ff2 = A verdade por satélite do gerador de cenas IQ para uma cena GPS L1 C/A com efemérides difundidas (iq::scene: uma SatGeometry de efemérides difundidas, gerada em registos de verdade TruthRecord): que satélites estão acima do horizonte, a pseudodistância, a fase de código na primeira amostra, o Doppler da portadora e os ângulos de visada, para um recetor estático, comparados com o estado de canal a partir do qual o gps-sdr-sim constrói o primeiro bloco da sua própria saída I/Q, para as mesmas efemérides, o mesmo recetor e a mesma hora de início (ionosfera desligada em ambos os lados)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), um gerador independente de banda de base GPS L1 C/A, compilado com o seu próprio Makefile e executado como programa separado sobre o seu brdc0010.22n incluído, na localização de exemplo do seu texto de utilização (scripts/gen_iq_gpssdrsim_ref.sh); um suporte de teste registado, ligado à mesma compilação, imprime o estado de canal (computeRange, computeCodePhase) por trás do primeiro bloco do programa. Limiares fixados antes de o gerador ser executado (pré-registados 7777da53). Âmbito: geometria GPS L1 C/A para um recetor estático sem ionosfera, troposfera nem relógio do recetor; os modelos de canal, o ruído e o conteúdo de dados de navegação da cena não fazem parte desta linha

# text
seg-bf429c8f00fb = Aquisição IQ GNSS sobre amostras I/Q geradas de forma independente

# text
seg-9a0c52bfb06e = iq::acq::acquire (pesquisa paralela de fase de código por FFT com o limiar Marcum-Q de lei quadrática) com a réplica GpsL1Ca, em { "20" } ms da própria saída I/Q de 8 bits do gps-sdr-sim, descodificada pelo descodificador de amostras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sem ruído): todos os PRN de { "1" } a { "32" } pesquisados em duas janelas de { "10" } ms, comparando o resultado com a fase de código e o Doppler que o gps-sdr-sim modulou

# text
seg-fb96290003e1 = Amostras I/Q do gps-sdr-sim (MIT, commit 28ca29a6) e o seu próprio estado de canal, pré-registados 7777da53: (B1) todos os PRN simulados adquiridos, (B2) nenhum outro PRN adquirido, (B3) fase de código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. RESULTADO: B1, B3 e B4 verificam-se em ambas as janelas (pior valor { "0.195" } chip, { "72" } Hz), mas B2 falha: todos os { "21" } PRN que o gps-sdr-sim não simulou ultrapassam também o limiar (estatística de { "151" } a { "206" } contra { "79.5" }; PRN simulados de { "1 300" } para cima). O limiar é definido para ruído gaussiano da potência de amostra medida; o gps-sdr-sim não acrescenta ruído, pelo que as células de um PRN ausente contêm a correlação cruzada dos outros satélites. Permanece MODELLED: o limiar registado era a conjunção

# text
seg-f40dc3dac990 = Monitores IQ avaliados em campanhas de reprodução em laboratório: deteção, falhas, falsos alarmes e valores de falso alarme em forma fechada

# text
seg-93fb3109728c = iq::campaign::detect e o executor de campanhas: uma tabela opcional [monitors] executa os monitores IQ em todas as células na passagem única do executor. Os monitores de potência e espetrais veem as amostras depois de cada cadeia de front-end; os monitores de C/N0, SQM e bloqueio veem as atualizações de malha de cada canal seguido. Cada alarme é avaliado face aos eventos indicados: detetado ou não detetado por (evento, tipo de alarme, canal), tempo até à deteção, e falsos alarmes fora dos eventos sobre a respetiva exposição. É indicado o valor de falso alarme em forma fechada de cada teste: potência por bloco (cauda Gama exata), excesso espetral por bloco (aproximação), curtose (gaussiana unilateral), impulsos (limite binomial), SQM por atualização média (2Q(k) = Q(1/2, k^2/2), novo) e o ARL0 do CUSUM de C/N0 (Siegmund). Sem a tabela, as células, as chaves e os resumos criptográficos permanecem inalterados. Nenhuma forma de onda de interferência é sintetizada

# text
seg-4c4fff313585 = As formas fechadas próprias dos monitores nas cenas GPS L1 C/A próprias do Kshana (ruído e sinais legítimos; eventos de atenuação dos sinais próprios dos satélites), face a limiares pré-registados em docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). RESULTADO: M1, M2 e M4 atingidos. M3 atingido na deteção ({ "18" } de { "18" } atenuações, P_md { "0" }) e NOT MET na sua cláusula de tempo: o tempo mediano até à deteção é { "1.001" } s contra { "2" } x ARL1 amostras = { "0.433" } s. O CUSUM vê uma estimativa por janela de { "1" } s, pelo que o limite em número de amostras é inferior a uma amostra. Apenas consistência interna: não é verificado nenhum recetor real nem interferência gravada

# text
seg-5b7eb7ddb474 = ROC de deteção dos monitores IQ a partir de uma campanha de reprodução em laboratório avaliada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada célula de uma campanha com monitores guarda, por tipo de alarme e canal, o máximo da estatística de teste do próprio monitor sobre cada janela de evento indicada (positivo) e sobre janelas roc_window_s em mosaico fora dos eventos (negativo). As estatísticas são o desvio de potência por bloco, o excesso de PSD, o z da curtose, o |z| do SQM da métrica média e o CUSUM de C/N0. O relatório agrega-as por tipo numa ROC empírica ao nível da janela, com a sua AUC e o ponto de funcionamento ao limiar configurado, escrita como roc.json (kshana.campaign-roc/1) e uma secção Detection ROC de report.html. Uma campanha sem monitores não escreve nenhum dos dois

# text
seg-e882dd678998 = Campanhas sintéticas a partir das cenas GPS L1 C/A próprias do Kshana (atenuações dos sinais próprios dos satélites), face a limiares pré-registados em docs/design/DETECTION-ROC.md (b47e358d). RESULTADO: R2 atingido (nível de acaso sem nada a detetar). R1 NOT MET: cn0_drop AUC { "0.7855" } contra { "0.95" }, porque todas as janelas negativas posteriores a um evento herdam da deteção o decaimento do CUSUM (todas as { "18" } negativas pós-evento atingem { "81" } ou mais; todas as { "18" } pré-evento ficam em { "0" }). Apenas consistência interna: não é verificado nenhum recetor real nem interferência gravada

# text
seg-3a3cfa322f01 = Calibração dos modelos de C/N0 e de bloqueio do recetor aberto a resultados de campanhas IQ, com erro de previsão indicado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) e <c1/> em <c2/>, o <c3/> do Python e a ferramenta labfit do MCP (apenas pastas de campanha dentro do seu diretório de trabalho): lê uma pasta de saída de <c4/> pelo seu DIGEST e agrupa as células avaliadas em unidades de ajuste (sinal x conceção da malha x cadeia de front-end x tipo de interferidor, nunca agregadas). Por unidade, ajusta o C/N0 medido ao J/S indicado com a forma de separação espetral. O Q_eff não é identificável a partir de dados de C/N0 sem uma medição independente das potências do interferidor e do sinal, pelo que o Q é indicado, nunca ajustado (a tabela de tipos, o q do evento ou, para um tipo desconhecido, o valor indicado mais danoso, cw Q = { "1" }). O parâmetro ajustado é o desvio identificável delta_eff = delta - { "10" } log10 Q, com a salvaguarda de correlação a comunicar a degenerescência. Os intervalos de C/N0 com bloqueio abaixo de { "90" } % são censurados e listados. O J/S limiar é dado diretamente e pela forma fechada; os modelos de malha de seguimento e de bloqueio empírico são acoplados através do modelo de C/N0, com tempos de permanência de queda e de rebloqueio. Um bootstrap de agrupamentos com semente sobre as gravações ({ "1000" } réplicas) fornece intervalos por percentis; os intervalos de previsão de { "90" } % provêm de sorteios de resíduos; as retenções leave-one-recording-out são divididas em interpolação e extrapolação; uma tabela [validation] pré-registada recebe um hash e cada limiar é avaliado como PASS/FAIL. Relatório kshana.labfit-iq/1 em JSON, CSV e Markdown gerado, com um bloco de unidades. Apenas sintético (nenhuma gravação de terceiros, nenhuma forma de onda de interferidor). O percurso de labfit por registo do recetor permanece inalterado

# text
seg-f9abecb1eea6 = Recuperação sintética de parâmetros em cenas GPS L1 C/A próprias do Kshana com um perfil de C/N0 conhecido imposto a partir da fórmula da secção { "3.1" }, seguidas e avaliadas por kshana iq campaign, face a limiares pré-registados em docs/design/LABFIT-FROM-IQ.md (secção { "5.1" }, alterada em 2026-10-12 em b7117bf, secção { "13" }). O estimador de C/N0 das campanhas (M2M4) foi fixado em 5b13e3c2, enviado antes da primeira avaliação de limiares (registado em conjunto com o código de ajuste, não isoladamente), depois de uma execução de seguimento de diagnóstico divulgada. RESULTADO na campanha de limiares de 18 eventos: (c) PASS; (a') NOT MET, erro de delta_eff -1.097 dB contra { "0.5" } dB (ainda -0.89 dB nos intervalos a { "38" } dB-Hz e acima); (b') NOT MET, { "0" } de { "50" } campanhas cobrem a verdade (erro -1.189 +/- { "0.093" } dB, intervalo de cerca de { "0.3" } dB); (d) NOT MET, forma fechada { "2.20" } dB abaixo do J/S direto na perda, cerca do tempo de permanência de queda ajustado vezes a taxa de rampa ({ "2.09" } dB); as cláusulas originais de Q de (a) e (b) são NOT MET porque o Q não é identificável. ACOMPANHAMENTO (limiares pré-registados em 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): numa campanha de J/S em degraus, o delta_eff é recuperado dentro de +{ "0.185" } dB (S1 MET: o erro de rampa é atraso do estimador); (d) tal como escrito é satisfeito pelo modelo de malha de seguimento ({ "0.45" } dB) mas não pelo empírico ({ "6.42" } dB), pelo que S2 é NOT MET; numa nova campanha de rampa, (d) com o tempo de permanência de queda ajustado mais a taxa de rampa de cada evento fica dentro de { "1" } dB para ambos os modelos (R1 MET), e (a') e (d) tal como escritos falham de novo (-1.25 dB; { "2.32" } e { "9.47" } dB). O método é verificado, não nenhum recetor: não pode ser VALIDATED a partir de dados sintéticos

# text
seg-9537d301c95e = Codificação GPS LNAV descodificada por uma biblioteca de recetor independente

# text
seg-909415621881 = As subtramas 1-3 de LNAV do Kshana (gps_lnav::encode_subframes) para as { "32" } efemérides brdc0010.22n fornecidas ao decode_word e ao decode_frame do RTKLIB: paridade de cada palavra, descodificação de subtramas com emissão de dados consistente, e cada parâmetro descodificado face ao inteiro do Kshana e face ao valor de entrada

# text
seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame como programa separado, pré-registado ca5f0142: R1 paridade e descodificação, R2 valor descodificado igual ao inteiro do Kshana vezes o fator de escala do IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de meio quantum do valor de entrada. RESULTADO: R1 { "960" } de { "960" } palavras e { "96" } de { "96" } subtramas; R3 todos os parâmetros, semana e tempos de referência exatos; R2 falha em { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades na última casa porque o P2_43 do RTKLIB é o decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo a partir de { "2" }^-43; dividir pela constante do RTKLIB devolve o inteiro do Kshana em todos os casos. Permanece MODELLED: o limiar R2 registado era demasiado apertado para a própria constante da referência independente

# text
seg-f66855e35c53 = Codificação da mensagem de navegação GPS LNAV

# text
seg-8caf8366e2f8 = Subtramas 1-3 de LNAV do IS-GPS-200 (gps_lnav::encode_subframes: quantização por arredondamento ao mais próximo de cada parâmetro de relógio e de órbita aos fatores de escala e ao valor de pi da especificação, empacotamento em complemento para dois, palavras TLM e HOW, paridade da Tabela 20-XIV com inversão D29*/D30*, os bits de resolução da paridade das palavras { "2" } e { "10" }), a mensagem que um gerador de sinal GPS L1 C/A transmite

# text
seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx a analisar o ficheiro de difusão diário do IGS BRDC00IGS_R_20250610000_01D_MN.rnx e decode_word/decode_frame a descodificar as palavras do Kshana, executado como programa separado; pré-registado d4d9eb9d antes de o ficheiro ser obtido, limiar de inteiro exato. Mutação: truncar em vez de arredondar dá { "235" } falhas. Comparações anteriores do mesmo codificador estão registadas como resultados: face ao gps-sdr-sim, que trunca ({ "230" } campos), e face aos valores escalados do RTKLIB, cuja constante decimal { "2" }^-43 falhou um limiar de uma unidade na última casa ({ "41" } valores). Pós-verificação do integrador (permanece MODELLED): a comparação concorda e uma mutação do conjunto de paridade também a torna vermelha, mas o pré-registo d4d9eb9d chegou ao ramo público às { "20" }:{ "02" }:{ "29" } UTC, dois segundos depois do commit de resultado 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) que já contém a saída do RTKLIB para o ficheiro, pelo que a ordem 'registado antes de o ficheiro ser obtido' não pode ser demonstrada; um novo registo enviado antes de ser obtido um ficheiro de difusão não visto resolveria a questão

# text
seg-c5c944357643 = Aquisição e estimação de C/N0 em IQ lunar real

# text
seg-f5dcb5e06bf4 = Pesquisa paralela de fase de código (acquisition::pcps_acquire: FFT portátil, dobragem coerente, acumulação não coerente, limiar de qui-quadrado para uma probabilidade de falso alarme em toda a pesquisa), refinamento, correlação imediata em malha aberta com Doppler de código e o estimador de C/N0 M2M4, executados nos lotes IQ de 4 bits L1 do LuGRE lidos através de realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, programa separado, configuração fixada) nos nove lotes L1 não superficiais e no C/N0 RAW do recetor de voo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), pré-registado 768cb62b. RESULTADO: o leitor do Kshana descodifica todos os { "288" } troços comparados de forma idêntica à de um conversor independente; o GNSS-SDR declara { "266" } de { "288" } pesquisas positivas e o Kshana concorda em todas as { "266" } decisões, mas só { "250" } estão localizadas na célula do GNSS-SDR (A2 falha); o ramo de C/N0 é vazio, não havendo nenhuma época RAW de voo a menos de { "30" } s de qualquer lote (a mais próxima a { "141" } s). A maioria dos positivos são artefactos: os níveis em complemento para dois sem correção têm uma média de -0.5 em I e Q, uma linha de frequência zero { "32" } dB acima do ruído num intervalo de { "1" } kHz, que ambos os recetores adquirem. Dois lotes (OP5, OP12) foram excluídos por engano: uma leitura dos seus metadados sem dígitos foi tomada por uma contradição com os respetivos cabeçalhos; a causa real era que o leitor não conseguia ler uma amostra mais larga do que uma palavra (entretanto corrigido). Permanece MODELLED

# text
seg-709626569a5c = Aquisição em IQ lunar real face ao Doppler previsto pela órbita (decisão por potência da amostra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire com a sua decisão por potência da amostra nos nove lotes L1 não superficiais do LuGRE com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com as diferenças previstas a partir das órbitas finais da ESA e da trajetória Blue Ghost reconstruída pela Firefly

# text
seg-38b8127db267 = Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registado 0d1839d2. RESULTADO: todas as { "288" } pesquisas ultrapassam o limiar com ruído (estatísticas de potência da amostra de cerca de { "430" } a { "520" } contra { "346.3" }), pelo que P1 se verifica de forma trivial e P3 se verifica ({ "274" } de { "288" } previstos visíveis) enquanto P2 falha em { "4033" } de { "4036" } pares. O front-end de banda limitada eleva o ruído de todas as células cerca de { "1.46" } vezes (fixado: piso de ruído de { "292" } contra os { "200" } de ruído branco em OP2 PRN { "1" }), o que a estatística de potência da amostra não vê. Permanece MODELLED

# text
seg-89875d67b253 = Aquisição em IQ lunar real avaliada pelo Doppler previsto pela órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire com a decisão por média de células (pico sobre a célula média da grelha, robusta ao ruído de banda limitada) nos nove lotes L1 não superficiais do LuGRE com níveis mid-rise; diferenças de Doppler entre satélites adquiridos comparadas com as diferenças previstas a partir das órbitas finais da ESA e da trajetória Blue Ghost reconstruída pela Firefly

# text
seg-f80a751bc49b = Doppler previsto a partir das órbitas finais ESA/ESOC e da trajetória reconstruída NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independente do Kshana), pré-registado a81a9a4e. RESULTADO: P1 e P3 verificam-se ({ "4" } lotes, { "12" } de { "12" } aquisições previstas visíveis) mas P2 falha em { "8" } de { "8" } pares. Os dois pares mais fortes coincidem com a previsão em módulo com o sinal invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medido, -7693.9 previsto; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), pelo que a ordem registada de I no nibble baixo é o conjugado da dos lotes; as seis deteções logo acima do limiar não coincidem com nenhum dos sinais. A dispersão do Doppler do refinamento ({ "30" } a { "50" } Hz entre duas execuções) foi também subestimada pelo registo. Permanece MODELLED

# text
seg-8fa779dd1788 = Aquisição em IQ lunar real reservado face ao Doppler previsto pela órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisão por média de células, probabilidade de falso alarme { "1e-7" }) com refine_doppler_coherent nos lotes L1 do LuGRE gravados na superfície lunar (I no nibble alto, níveis mid-rise); diferenças de Doppler entre satélites adquiridos face às diferenças previstas a partir das órbitas finais da ESA e do núcleo do local de alunagem da Firefly

# text
seg-8bfd18bb6478 = Doppler previsto a partir das órbitas finais ESA/ESOC e do núcleo do local de alunagem NAIF CLPS da Firefly (xval/lugre-predicted-doppler/predict_surface.py, independente do Kshana), pré-registado 2108e6ff em lotes nunca abertos antes. RESULTADO: a não vacuidade falha; nenhum lote contém duas aquisições. OP40 excluído (os metadados nomeiam um ficheiro em falta); OP38, OP73, OP77_0, OP77_1 não adquirem nada e não mostram falso alarme a { "1e-7" } (estatísticas máximas de { "325" } a { "356" } contra { "385.9" }); OP74 e OP76 adquirem o PRN { "31" } e OP78_0 e OP78_1 o PRN { "12" }, cada um isolado, todos previstos visíveis. Permanece MODELLED. Desvios divulgados: o limiar de Doppler de { "10" } Hz registado assenta num Monte Carlo sintético do refinamento coerente, e não na dispersão dos lotes já vistos que o integrador pediu; OP40 foi excluído antes da execução porque os seus metadados nomeiam um ficheiro de amostras que o conjunto de dados não inclui

# text
seg-758af035b3ce = Geometria lunar conjunta de comunicações e navegação

# text
seg-11f861bdc6bf = Ângulos de visada topocêntricos por satélite (azimute no sentido horário a partir do norte, elevação) e distância oblíqua num local selenográfico designado, dado o satélite no referencial solidário com a Lua desse local (a afirmação validada). A exatidão de alcance do sinal no espaço é exposta como parâmetro do cenário, para que a varredura do volume de serviço produza um REQUISITO de alcance em vez de um passa/falha a um sigma fixo; esse parâmetro é uma entrada de conceção fora da afirmação validada

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, executado como ferramenta a partir de xval/anise-service-geometry, binário lunar-look-angles-xval, que não chama código do Kshana): a rotina própria do ANISE de azimute, elevação e distância (azimuth_elevation_range_sez) a partir de locais construídos pelo seu construtor de latitude-longitude-altitude sobre a Lua pck00011 (esfera { "1737.4" } km), com os satélites rodados para MOON_PA_DE440 através de moon_pa_de440_200625.bpc. { "768" } amostras em { "8" } locais (os { "4" } locais designados e { "4" } outros, acima e abaixo do horizonte), { "12" } épocas e { "8" } satélites concordam dentro de { "1e-6" } graus em azimute e elevação e { "1" } mm em distância e posição do local (fixado antes da comparação); medido { "2.2e-12" } graus, { "2.1e-13" } graus e { "5.6e-9" } m. Afirmação: colocação do local e ângulos de visada dado o satélite no referencial solidário com o corpo desse local. A realização própria do Kshana do referencial lunar solidário de rotação média e o parâmetro de exatidão de alcance ficam fora dela; os testes unitários de geometria em forma fechada permanecem como verificações de apoio

# text
seg-10af60b488b9 = Estação de referência diferencial de classe NovaMoon: cancelamento de modo comum + resíduo crescente com a linha de base + níveis de proteção DGNSS

# text
seg-96b2627b388a = Identidade de cancelamento diferencial de erros + reutilização da maquinaria de PL SBAS do DO-229E; a solução de diferença simples + WLS é adicionalmente verificada face a lsq()/matinv() do RTKLIB (Takasu, BSD-2-Clause, C compilado) — código de solucionador independente, mas a mesma álgebra de primeira ordem de diferenças de LOS, pelo que continua a ser InternalConsistency

# text
seg-c04a3591074c = Exportação de interoperabilidade lunar

# text
seg-91f4a066b3c0 = Exportação lunar de referencial + tempo + efemérides alinhada com LunaNet/IOAG (CCSDS OEM + KIF) com aderência à norma na ida e volta

# text
# c1: oem
seg-f5f8ed69bea7 = A exportação OEM lunar do kshana reanalisada pela biblioteca independente de terceiros <c1/> (R. J. Anderson): os símbolos de referencial/tempo e o estado por época concordam até à precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — uma ida e volta estrutural de intercâmbio; a semântica física do referencial/tempo lunar é validada pelas suas próprias linhas, pelo que esta permanece MODELLED. { "0.30" } comparação externa, um resultado (permanece MODELLED): um segundo leitor independente, o analisador CCSDS OEM do Orekit { "12.2" } (Apache-2.0, predefinições estritas), recusa ambos os ficheiros lunares porque não implementa os sistemas de tempo LTC e TCL (descodifica o OEM EME2000/UTC da crate e descodifica os ficheiros lunares quando TIME_SYSTEM é substituído por TDB); o oem { "0.4.5" } descodifica-os dentro da precisão escrita apenas por recurso ao sistema de tempo não suportado. O intercâmbio destes ficheiros lunares com leitores CCSDS convencionais não está estabelecido

# text
seg-8ab65cbefb75 = Pontuação alinhada com enquadramentos de resiliência PNT

# text
seg-c48198f31d63 = Subpontuações por dimensão sobre as sete categorias de resiliência próprias do Kshana (não termos do DHS), as funções RDRR do RethinkPNT e os critérios de Yang, cada uma marcada como modelada com o seu fator determinante; Nível RPCF provisório com uma barreira de degradação limitada. Autoavaliação derivada de simulação, nunca uma certificação.

# text
seg-f905aeb203bb = Fórmulas por métrica derivadas à mão: diversidade de Simpson inversa, compósito de média ponderada, durações de cronologia limitadas/ilimitadas, escada de Níveis pelo elo mais fraco

# text
seg-d7bdb6fe186e = Estudo de instabilidade de decisão da pontuação de resiliência

# text
seg-5fcf18a68bb1 = Quantifica como uma única pontuação compósita / Nível RPCF reordena arquiteturas sob um simplex de ponderação defensável e um conjunto de ameaças (taxa de inversão do top-1, dispersão do tau de Kendall, taxa de inversão de Nível, intervalos de classificação); análises de declarado versus medido e de colapso de diversidade.

# text
seg-b6bf76a752a0 = Identidades de estatísticas de postos em forma fechada (tau em [-1,{ "1" }] com valores calculados à mão; Dirichlet determinista com semente) e testemunhos estáveis/instáveis construídos

# text
seg-1bf03544a010 = Representatividade da demonstração e lacunas até ao voo

# text
seg-db24d16d38c9 = Registo de honestidade por resultado que qualifica uma saída de demonstração: as suas âncoras externas, os pressupostos modelados, as lacunas até ao voo e a faixa de TRL representativa, com invariantes impostos (validada exige uma âncora externa; modelada exige uma lacuna e não pode reivindicar acima de TRL { "4" }).

# text
seg-81d3adb239c5 = Invariantes em forma fechada correspondentes à disciplina de compliance de 'representatividade justificada + lacunas até ao voo identificadas'; ligados à fronteira entre estado de verificação e tipo de referência independente

# text
seg-52ab936eb5f5 = Evidência de compromisso quântico versus clássico (forma comum)

# text
seg-a6679ed5bed7 = Um objeto TradeEvidence reprodutível (referencial fixo: cenário+semente+motor; valores comuns de quântico versus clássico por FoM com benefício de polaridade correta, IC de { "95" }% opcional, rótulo validado/modelado) que transporta um registo de representatividade, de modo que cada vertical de PNT quântico comunica o compromisso da mesma forma honesta.

# text
seg-70da3e15ea8b = Identidades de benefício/vencedor em forma fechada + invólucro fiel do quantum_trade::TradeResult existente; honestidade ligada ao registo de representatividade e aos rótulos de verificação

# text
seg-20fee61b3107 = Biblioteca de modelos de erro de dispositivos quânticos

# text
seg-e42eabe9bc2a = Fichas de dispositivo (ótico/iões aprisionados/iões de mercúrio + relógios clássicos reutilizados de holdover/clock_state; interferómetro de átomos frios; ligações de transferência de tempo clássicas + de emaranhamento/fotão único), cada uma com um registo de representatividade; a ligação de emaranhamento acrescenta um modelo de precisão de temporização limitado por ruído de disparo (~jitter/sqrt(R*tau), penalização de contagens no escuro, piso sistemático).

# text
seg-632600203e1f = Coeficientes de relógio/CAI reutilizados (holdover/clock_state, valores publicados) + identidades de ruído de disparo/perdas em forma fechada para a ligação de emaranhamento

# text
seg-86d71fd89f26 = Temporização quântica de confiança (transferência de tempo + disseminação segura + anomalia)

# text
seg-d2a3d37825ef = Cadeia de transferência de tempo quântica versus clássica de ponta a ponta (deriva do relógio + precisão da ligação em quadratura), um nível de proteção de temporização reutilizado, uma FoM de segurança contra ataques de atraso/repetição (1-P_md) e uma probabilidade de deteção de anomalias do relógio + latência do CUSUM, emitidas como TradeEvidence honesta com um registo de representatividade.

# text
seg-ac95d112a17a = Orçamento em quadratura em forma fechada sobre núcleos validados reutilizados (ADEV vs Stable32/NIST; limite de TPL; deteção analytic_pd/pmd); honestidade ligada ao registo de representatividade

# text
seg-eaf341ff4522 = Navegação quântica sem GNSS

# text
seg-908a44a9f7c7 = Navegação por estima com INS de grau de navegação quântico (interferómetro de átomos frios) versus clássico durante uma interrupção do GNSS: crescimento do erro de posição, holdover até um limiar de posição e o compromisso quântico versus clássico como TradeEvidence honesta; nota honesta de observabilidade (o viés é inobservável sem uma solução de posição, pelo que o erro cresce).

# text
seg-508f2c8884e2 = Orçamentos inerciais reutilizados verificados face a uma dupla integração independente em Octave da mesma EDO de navegação por estima (tempo de execução diferente, modelo partilhado → ReferenceImpl) mais o ruído de curto prazo publicado de Freier-2016 como âncora unilateral; o compósito quântico versus clássico permanece MODELLED

# text
seg-914132833f5a = Deteção de falhas/anomalias para sistemas PNT quânticos

# text
seg-f20392820b9d = Catálogo rotulado de falhas quânticas (salto de frequência/deriva/perda de bloqueio do relógio; salto de viés/perda de sinal do sensor), uma AUC da ROC da estatística de deteção com IC por bootstrap e uma falha mínima detetável a uma taxa de falso alarme fixa; um monitor assistido por relógio quântico deteta falhas mais pequenas do que um clássico, emitido como TradeEvidence honesta.

# text
seg-a689ab2ebb84 = AUC gaussiana em forma fechada = Phi(mu/(sigma*sqrt2)) verificada face ao eval_stats::bootstrap_auc_ci validado externamente (vs scikit-learn) + limiares analíticos de deteção

# text
seg-0633e05d393f = Dinâmica de atitude de corpo rígido sem binário

# text
seg-23f43007bcbf = Equações de movimento rotacional de Euler (I ω̇ = τ − ω × Iω, eixos principais e tensor de inércia geral) acopladas à cinemática de atitude em quaternião (q̇ = ½ q ⊗ ω) e propagadas com um integrador RK4 de passo fixo que renormaliza o quaternião em cada passo

# text
seg-2d21a01ea132 = Propagação de corpo rígido do hub de veículo espacial do Basilisk { "2.9.1" } (AVSLab, ISC; atitude MRP através das suas próprias equações acopladas do hub, svIntegratorRKF78 a tolerância relativa { "1e-12" }), uma implementação independente das equações de corpo rígido sem binário: o quaternião RK4 do Kshana (dt { "0.01" } s) e as velocidades angulares do corpo concordam dentro de { "1e-9" } ao longo de { "1e4" } s em duas inércias gerais não diagonais (pior { "3.3e-11" } e { "3.4e-12" } rad/s); tolerância fixada antes da comparação. Afirmação validada: movimento sem binário; o termo de binário externo não é comparado. As verificações de leis de conservação e de pião simétrico permanecem como autoconsistência de apoio. Sem ambiente de corpo flexível / malha de controlo / binário externo

# text
seg-93b8ba1ba0e5 = Dinâmica de movimento relativo de Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Movimento relativo de um perseguidor em torno de um alvo numa órbita de referência circular no referencial LVLH: as equações linearizadas de Clohessy–Wiltshire (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) resolvidas pela matriz de transição de estado em forma fechada { "6" }×{ "6" } Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) com a condição de órbita relativa limitada ẏ₀=−2n·x₀, e uma correção de segunda ordem em forma fechada (cw_dynamics::second_order_correction, a resposta CW aos termos quadráticos das equações exatas do corpo principal circular; Karlgaard e Lutze { "2003" }, Newman, Lovell e Pratt { "2015" }) composta como cw_dynamics::propagate_second_order. A saída validada é propagate_second_order; o Φ linear por si só é caracterizado face à verdade não linear, não validado

# text
seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, dois corpos, LOFType.QSW, executado como programa separado (suporte de teste inalterado desde a ronda { "1" }). Limiar pré-registado de { "1e-3" } m em cada amostra de cada caso; a correção do motor de segunda ordem foi reexecutada face a ele sem alterações (adenda 8c8e768d, escrita antes de o propagador existir, a divulgar que as lacunas de primeira ordem eram conhecidas). propagate_second_order concorda dentro de { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } e { "2.2e-8" } m; reduzir o termo de segunda ordem a metade falha a { "1.85e-3" } a { "3.14e-3" } m. O Φ linear por si só afasta-se da verdade não linear em { "1.2" } a { "6.3" } mm a { "100" } m ao longo de um terço de órbita (o termo de segunda ordem omitido; o seu teste estrito é mantido ignorado), pelo que é caracterizado, não validado. Verificações internas mantidas: Φ face a uma integração RK4 das equações de Hill, Φ(t)Φ(−t)=I, as identidades de órbita limitada e de deriva −12π·x₀, e a escala do resíduo de terceira ordem do termo de segunda ordem. Âmbito: corpo principal circular, separações perto de { "100" } m, até um terço de órbita; sem excentricidade (Tschauner–Hempel), J2 nem termos de arrasto diferencial; pressuposto de pequena separação

# text
seg-d31be81dfd8f = Geolocalização passiva de emissores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localizar um emissor (interferidor/spoofer, ou uma fonte oportunista para PNT inverso) a partir da diferença de tempo de chegada numa rede de recetores — a interseção de hiperboloides τᵢ=(Rᵢ−R₀)/c resolvida por mínimos quadrados de Gauss–Newton — e, acrescentando a diferença de frequência de chegada (diferenças de taxa de distância) com recetores em movimento, recuperar em conjunto a posição e a velocidade; com o limite inferior de Cramér–Rao da covariância da posição a partir da geometria das medições

# text
seg-17b45796fd43 = Autoconsistência do estimador e da geometria: ida e volta direta→inversa, a identidade de Fisher/CRLB J·CRLB=I, monotonicidade do GDOP e o estimador a atingir o seu próprio limite de Cramér–Rao sob ruído de Monte Carlo — verificações de consistência interna, NÃO um conjunto de dados externo, pelo que a linha permanece InternalConsistency. Geolocalização passiva MODELLED — modelo de linha de visada de fonte pontual; sem termos de multipercurso / NLOS, de viés do relógio do recetor nem de refração atmosférica. { "0.30" } ronda { "2" }, face a Ho e Chan { "1993" } e Ho e Xu { "2004" } (pré-registado f89018b8, { "1" } % de cada valor impresso), um resultado (permanece MODELLED): o limite de TDOA com restrição de superfície reproduz os fatores geométricos a { "40" } N (-0.11 %, -0.02 %) e o TDOA máximo; o limite conjunto TDOA+FDOA reproduz a Fig. { "6" } (+{ "0.06" } %, -0.17 %) e, na fonte que o código dos próprios autores nomeia para a Fig. { "7" } (adenda escrita depois de esse resultado ter sido visto, divulgada), a Fig. { "7" } (+{ "0.11" } %, -0.02 %); é igual ao código de limite publicado dos autores (estilo BSD, executado sob GNU Octave) até { "3e-12" }; o solucionador de máxima verosimilhança ponderado pela covariância atinge o limite impresso (+{ "0.3" } a +{ "0.4" } %). Os fatores de Ottawa que o artigo imprime a partir de um Monte Carlo ({ "251" }, { "7.1" }) diferem em +{ "1.3" } % e +{ "4.4" } %, fora do limiar de { "1" } %

# text
seg-36b74b49f82f = Desaceleração máxima de entrada balística 3-DoF face ao nominal publicado do Stardust

# text
# c1: entry-heating
seg-a05ca2fde6fc = Uma entrada de massa pontual 3-DoF sobre uma Terra esférica em rotação através da Atmosfera Padrão dos EUA { "1976" }, integrada com RK4 a partir de um estado de entrada inercial, a comunicar a desaceleração máxima e a sua altitude; o estado de entrada relativo ao planeta a partir do inercial. Executável como o tipo de cenário <c1/>.

# text
seg-5ab7065c0803 = O nominal do Stardust de Desai, Mitcheltree e Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): desaceleração máxima de { "33.4" } g a partir de { "12.6" } km/s relativos ao planeta com a massa de lançamento de { "45.8" } kg, uma trajetória POST 6-DoF com a base de dados aerodinâmica completa; interface de entrada de Desai, Lyons, Tooley e Kangas (NTRS { "20090004445" }): raio { "6503.14" } km, inercial { "12.9" } km/s a -8.2 graus. Limiares pré-registados em xval/entry-stardust/PREREGISTRATION.md antes de qualquer execução com estas entradas; ambos se verificaram à primeira execução. O QUE NÃO É: um caso publicado e uma grandeza (desaceleração máxima, que na aproximação balística não depende do coeficiente balístico); a latitude e o rumo de entrada são assumidos; o aquecimento, a carga térmica e o ponto de aterragem não são verificados face a ele; massa pontual com C_D constante, não 6-DoF.

# text
seg-5bd3882531b6 = Aquecimento convectivo de entrada no ponto de estagnação (Sutton-Graves) numa entrada 3-DoF

# text
seg-4f97036ed72f = Fluxo de calor convectivo no ponto de estagnação q = k sqrt(rho/R_n) V^{ "3" } com as constantes de Sutton-Graves para o ar da Terra e a atmosfera de Marte (NASA TR R-376, { "1971" }), o seu pico e a carga térmica integrada ao longo de uma entrada 3-DoF, balística ou com sustentação a inclinação constante, na Terra ou em Marte.

# text
seg-5a203ecfeaee = Consistência interna: a relação e as constantes tal como impressas em NASA TR R-376, uma verificação de convergência por meio passo e a ordenação esperada dos picos de aquecimento e de desaceleração. O QUE NÃO É: não foi comparado nenhum valor de aquecimento publicado (os artigos do Stardust dão um limite de projeto e uma estimativa convectiva mais radiativa de cerca de { "1200" } W/cm2, que uma relação apenas convectiva não consegue igualar); sem aquecimento radiativo, correção de temperatura de parede ou de catalicidade, nem resposta da proteção térmica.

# text
seg-1b96577665fc = Radiometria de geradores de imagem eletro-óticos, MTF, resposta relativa de aresta e NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Orçamento de relação sinal-ruído de um gerador de imagem em nadir (radiância de cena lambertiana, equação da câmara, ruído de disparo, de escuro, de leitura e de quantização), a MTF do sistema à frequência de Nyquist como o produto da difração de abertura sem obstrução, abertura do detetor, esbatimento linear e tremor gaussiano, a resposta de aresta e a resposta relativa de aresta integradas a partir dessa MTF, Q = lambda F / p, e o NIIRS GIQE versão { "4" } sem compensação de MTF. Executável como o tipo de cenário <c1/>.

# text
seg-bb3a01edc95d = Formas fechadas: a MTF de difração a meia frequência de corte, a aresta em rampa de um pixel de uma abertura de detetor pura (RER { "1" }), a aresta de FDA normal de um desfoque gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), a escala do ruído de disparo e os coeficientes do GIQE { "4" } tal como publicados (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). O QUE NÃO É: não foi comparado nenhum gerador de imagem externo, MTF medida nem imagem classificada; o GIQE é uma regressão empírica com o seu próprio erro; sem luz parasita, MTF atmosférica, compensação de MTF nem aliasing.

# text
seg-07ca77a67207 = Perdas de gravidade, arrasto, orientação e contrapressão na ascensão de lançamento

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascensão plana por viragem gravitacional de um veículo multiestágio sobre uma Terra esférica sem rotação através da Atmosfera Padrão dos EUA { "1976" } (densidade e pressão), com um impulso de arfagem, tração reduzida pela contrapressão da tubeira, fins de combustão de estágio em fronteiras de passo exatas, e as perdas de gravidade, arrasto, orientação e contrapressão integradas a par do estado. Executável como o tipo de cenário <c1/>.

# text
seg-174ed29adbbe = Consistência interna: a identidade exata velocidade de fim de combustão = soma Isp g0 ln(m0/mf) menos as quatro perdas integradas (resíduo abaixo de { "1e-6" } m/s), a equação de Tsiolkovsky numa combustão vertical em vácuo com a gravidade como única perda, e as pressões US76 ao nível do mar e na tropopausa. O QUE NÃO É: não foram comparadas as perdas de nenhum veículo publicado; sem rotação da Terra, fase balística, regulação de tração nem orientação além do impulso; C_D constante; não é um otimizador de trajetória.

# text
seg-55e8345def8b = Equação bidirecional do TWSTFT, orçamento de incerteza e estabilidade da ligação com não reciprocidade de flicker e diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = A equação bidirecional do TWSTFT resolvida para T_A - T_B com atrasos de transmissão e receção da estação, a assimetria ionosférica ascendente/descendente em banda Ku, a diferença de atraso do transponder e os termos de Sagnac, face ao seu modelo direto exato; um orçamento de incerteza em quadratura com o TDEV da ligação como termo do tipo A; uma série bidirecional com ruído de fase branco e de flicker (Kasdin-Walter), uma não reciprocidade diurna e um resíduo constante de reciprocidade; e a taxa, o RMS residual, o TDEV e o ADEV de séries fornecidas de relógio de estação Circular T, MJD-CSV ou IGS RINEX. Executável como o tipo de cenário <c1/>.

# text
seg-244f7396ac25 = Consistência interna: o modelo direto e a equação resolvida concordam até { "1e-15" } s, o termo de Sagnac é igual à forma de laço BIPM 2A omega/c^{ "2" } independente do módulo, o termo ionosférico é { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, e os processos de ruído mostram as formas de TDEV esperadas. O QUE NÃO É: não foi comparada nenhuma medição real de TWSTFT nem relatório de calibração; os atrasos e incertezas indicados são entradas, não medidos; as estabilidades das séries fornecidas são comunicadas, não validadas.

# text
seg-2f9be02c92bc = Numérica de atmosfera ótica em percurso oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade ótica de nuvens e de céu limpo

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrado ao longo de um percurso oblíquo para a variância de Rytov de onda plana e esférica (ligação ascendente e descendente), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, o fator de média de abertura em turbulência fraca, a profundidade ótica de nuvem de uma coluna de água líquida e a profundidade ótica de céu limpo de Kim-visibilidade mais Rayleigh, a substituir a perda atmosférica agregada do orçamento de ligação ótica quando é fornecida uma atmosfera. Executável dentro do tipo de cenário <c1/>.

# text
seg-7ca512adff99 = A numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } a { "30" } dígitos, quadratura tanh-sinh sobre a variável de altura original e densidades gama-gama com Bessel-K) que não partilha código com o Kshana, sob limiares fixados antes de existir qualquer implementação (xval/optical-atmosphere/PREREGISTRATION.md). PORQUÊ MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, pelo que verifica a implementação das fórmulas indicadas e não a atmosfera; não é usado nenhum exemplo de validação ITU-R nem nenhum registo medido de cintilação ou de extinção em percurso oblíquo (os valores ITU são uma decisão de licença em aberto e são mantidos fora do repositório). O nível do perfil de Cn2, a visibilidade, as alturas de escala de aerossóis e moleculares, o comprimento de percurso da média de abertura e o ajuste de momentos usado para aplicar a média de abertura aos parâmetros gama-gama são entradas ou convenções indicadas. Uma linha de origem no módulo regista que um levantamento amplamente copiado imprime o segundo expoente de cintilação como 7/6 onde Andrews e Phillips dão 5/6; a forma 5/6 é a implementada

# text
seg-a2faab92e760 = Disponibilidade de locais óticos de solo condicionada pelo tempo e diversidade de locais correlacionada com a distância

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilidade de uma ligação ótica face a uma margem de ligação indicada a partir de um clima log-normal de água líquida de nuvens (quantidade ITU-R P.840, extinção por ótica geométrica) e do desvanecimento por turbulência gama-gama independente, a margem de ligação necessária para disponibilidades-alvo e o teto que nenhuma margem eleva, durações de interrupção log-normais, cenários hipotéticos de técnicas de melhoria, e uma disponibilidade de rede por cópula gaussiana de um fator cuja correlação entre pares é exp(-distância/comprimento de decorrelação). Executável como o tipo de cenário <c1/>.

# text
seg-20eab6e9b925 = Consistência interna: limites em forma fechada e monotonicidade do modelo de diversidade, a forma fechada do teto de nuvens e as identidades log-normais de interrupção. NÃO é invocada nenhuma referência independente externa e nenhuma foi comparada: não é usado nenhum registo medido de disponibilidade de estações óticas de solo nem de linha de visada livre de nuvens. PORQUÊ MODELLED: o clima de nuvens (probabilidade de nuvem, mediana e dispersão da coluna de água líquida, durações de interrupção), a independência entre nuvem e turbulência, a forma de cópula gaussiana, o comprimento de decorrelação e cada ganho de técnica são pressupostos; os cenários incluídos indicam climas ILLUSTRATIVE, não um conjunto de dados. Promover esta linha exige um registo medido de disponibilidade citado e um limiar registado antes da comparação

# text
seg-043ece801e72 = Continuidade de temporização e de alcance através de interrupções óticas

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = A distribuição das durações de interrupção de um local ótico acoplada à variância de deriva em forma fechada do modelo de holdover do relógio: erro de temporização e de alcance em quantis de interrupção indicados, o holdover até um limiar de temporização, a fração de interrupções e de tempo de interrupção dentro dele e a disponibilidade de temporização A + U E[min(D, T_h)]/E[D], para as classes de relógio clássica e quântica. Executável dentro do tipo de cenário <c1/>.

# text
seg-ab2a33c1b1a4 = Consistência interna com o módulo de holdover, bit a bit; NÃO é invocada nenhuma referência independente externa. As PSD das classes são os pisos de tau longo sintetizados que o módulo de holdover já contém, pelo que os valores herdam a sua ressalva indicada de que o holdover até um limiar apertado é governado pelo piso de ruído vermelho assumido e não pelo desvio de Allan citado. As durações de interrupção são um modelo log-normal com parâmetros indicados, não um registo medido de permanência de nuvens

# text
seg-b119df65d2a7 = Margem da ligação ótica ao longo do tempo: uma realização com semente do tempo atmosférico de um local

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Uma tabela opcional <c1/> (duração, passo, semente) faz com que o tipo <c2/> escreva também, por local, uma realização com semente do modelo de local indicado ao longo do tempo: episódios de nuvens (períodos limpos exponenciais, interrupções por nuvens log-normais com a média e a dispersão indicadas, a parcela de tempo em nuvem definida pela probabilidade de nuvem indicada), uma coluna de água líquida log-normal por episódio de nuvem, uma amostra de cintilação gama-gama por passo e, a partir delas, a margem da ligação, os desvanecimentos por nuvens e por cintilação e o indicador de ligação ativa, com a disponibilidade realizada, a fração de nuvens, o número de interrupções e a interrupção mais longa. Sem a tabela, o resultado é o documento { "0.37" }. Os sorteios passam por rotas portáteis de distribuições e de matemática, pelo que native e wasm32 dão os mesmos bytes.

# text
seg-d25e5d2449bd = Apenas consistência interna; NÃO é invocada nenhuma referência independente externa e não existe nenhuma para uma realização de tempo atmosférico. As verificações comparam um sorteio com a saída estatística do mesmo modelo, pelo que um resultado positivo diz que o gerador amostra as distribuições indicadas (a disponibilidade e a parcela de nuvens do sorteio ficam dentro de tolerâncias pré-registadas dos valores indicados), não que um local real se comporte assim. A série é uma realização, não o clima: a sua disponibilidade difere da indicada pelo erro de amostragem do sorteio, e as amostras de cintilação em passos diferentes são independentes, uma simplificação indicada de um processo que decorrela em milissegundos. As entradas meteorológicas permanecem pressupostos do cenário.

# text
seg-58cbf576c959 = Leitor de Orbit Data File TRK-2-18 e modelo de Doppler 2-way com rampas em Marte

# text
seg-d1055650a77f = Um leitor de Orbit Data Files (TRK-2-18) da DSN: os grupos de registos de 36 bytes (rótulo de ficheiro, identificador, dados de órbita, rampas por estação, desvios de relógio, resumo, fim de ficheiro) e, em cada registo de dados de órbita, a marca temporal desde { "1950" }, atrasos de ligação descendente e ascendente, observável, estações, tipo de dados, bandas, validade, canal, veículo espacial, a frequência de referência de 46 bits e o tempo de compressão; tempos de início e de fim de rampa, taxas e frequências iniciais. Sobre ele, um modelo de Doppler 2-way em banda X com rampas (rampas de ligação ascendente integradas, tempo de luz de ida e volta com Shapiro e troposfera, estações da DSN através da cadeia CIO IAU 2006/2000A e EOP do IERS, tempo de estação) e uma determinação de órbita em lote de orbitadores de Marte (campo GMM-3, terceiros corpos, SRP, arrasto).

# text
seg-6d533149f6f0 = O rótulo PDS3 que o processo de condicionamento de dados de navegação da DSN produziu com o ficheiro (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), verificado face a limiares pré-registados em xval/mro-odf/PREREGISTRATION.md antes de o leitor existir. MODELLED porque um limiar registado (as linhas da tabela de fim de ficheiro, { "121" } no ficheiro contra { "120" } no rótulo) falhou; o rótulo é internamente inconsistente aí. Fase { "2" } (xval/mro-od/PREREGISTRATION.md, adendas A1 e A2 antes do resultado avaliado): o Doppler previsto a partir da reconstrução da equipa de navegação da MRO (mro_psp5, NAIF) coincide com o Doppler 2-way com rampas observado até { "12.5" } mHz em passagens não usadas no desenvolvimento, limiar atingido; a determinação de órbita registada falhou no arco avaliado (matriz normal não definida positiva) e não produziu órbita, pelo que os limiares de órbita não foram atingidos. A execução { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, um estimador amortecido, o mesmo arco e os mesmos limiares, uma adenda de avaliação R2-A1 divulgada em docs/revisions) convergiu: a órbita estimada está a { "0.36" } km RMS ({ "0.53" } km no máximo) da reconstrução, limiares atingidos, mas o RMS do Doppler pós-ajuste é { "48.6" } mHz contra o limiar de { "30" } mHz, não atingido, pelo que a linha permanece MODELLED. O QUE NÃO É: nenhuma órbita estimada atingiu todos os limiares registados; a ionosfera, o plasma solar e a maior parte do desvio da antena (um desvio radial de { "1.5" } m é ajustado na passagem de desenvolvimento) não são modelados.

# text
seg-c7d292f14693 = Controlo de atitude em malha fechada com realimentação MRP e rodas de reação

# text
# c1: aocs
seg-f33781b74cc2 = Controlo de atitude de apontamento inercial de um hub rígido com três ou mais rodas de reação equilibradas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e Junkins), binários de motor das rodas de norma mínima G_s u = -L_r limitados ao limite de cada roda, a dinâmica acoplada do hub e das rodas com a inércia do hub a incluir a inércia de rotação das rodas, cinemática em quaterniões, RK4 com retenção de ordem zero. Executável como o tipo de cenário <c1/> (malha de estado verdadeiro).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; as rodas do bsk executadas como ferramenta separada, nunca ligadas nem incorporadas): hub de veículo espacial, reactionWheelStateEffector (BalancedWheels, limite de binário ativo), simpleNav, inertial3D, attTrackingError, mrpFeedback (sem termo integral) e rwMotorTorque a dt = { "0.1" } s com o seu RK4, face à implementação própria do Kshana em três casos (três rodas ortogonais; uma pirâmide de quatro rodas; um caso de quatro rodas com saturação), limiares pré-registados em xval/aocs-basilisk/PREREGISTRATION.md antes do código e da execução. Todos os limiares se verificaram à primeira execução. O QUE NÃO É: ruído de sensor na malha, realimentação integral, orientação de seguimento, atrito das rodas, tremor, limites de velocidade e potência, os ganhos de qualquer veículo espacial real; a comparação verifica a implementação da lei e da dinâmica face a uma independente, não um controlador de voo.

# text
seg-455dc946c965 = Estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um seguidor de estrelas

# text
# c1: aocs
seg-553d043438b4 = O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a velocidade angular do giroscópio menos a estimativa de viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de velocidade), atualizações do seguidor de estrelas com o resíduo { "2" } vec(q^-1 q_st) na forma de Joseph e a reposição multiplicativa; um simulador discreto de Farrenkopf de giroscópio e seguidor de estrelas. O tipo <c1/> pode fechar a malha de controlo sobre a sua estimativa.

# text
seg-846cb1eeb35c = Consistência interna: o erro de estimação normalizado quadrático do filtro face à verdade simulada a partir dos mesmos modelos de sensor sobre sementes de Monte Carlo, e a convergência das estimativas de atitude e de viés. O QUE NÃO É: não foi comparado nenhum estimador externo nem dados de voo (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensor são os de manual, sem desalinhamento, fator de escala nem efeitos de campo de visão do seguidor de estrelas.

# text
seg-059732bda693 = Determinação de atitude Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Atitude ótima de três eixos a partir de observações vetoriais ponderadas (direções de estrelas/Sol/magnetómetro): o TRIAD determinista de dois vetores, o método q de Davenport (o minimizador exato da perda de Wahba — o quaternião ótimo é o vetor próprio de maior valor próprio da matriz de Davenport K de { "4" }×{ "4" }, resolvido por um solucionador simétrico de valores próprios de Jacobi) e o QUEST (raiz de Newton/secante da equação característica de K inicializada em Σ pesos, seguida da recuperação do quaternião a partir do vetor de Gibbs)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — a solução SVD de Kabsch/Markley do problema de Wahba, um algoritmo genuinamente independente (SVD da matriz de perfil de atitude) e uma base de código distinta do solucionador de valores próprios K de Davenport / método da raiz característica do QUEST do kshana, a calcular a MESMA atitude ótima de Wahba definida de forma única. Em conjuntos de observações vetoriais ponderadas sem ruído, o TRIAD, o método q e o QUEST reproduzem a rotação ótima do scipy até <{ "1e-9" } rad (comparado através do ângulo de erro de atitude invariante ao sinal). A afirmação estatística de Monte Carlo com ruído 'o ótimo supera o TRIAD' permanece MODELLED (sem referência independente externa); apenas observações de vetores unitários de direção pontual — sem modelação de campo de visão/viés/correlação temporal do sensor, e o QUEST é singular a { "180" }° (o método q cobre esse caso)

# text
seg-cd342cc48afc = Estatísticas de deteção de aquisição GNSS de lei quadrática

# text
seg-6d97452de33e = Detetor de aquisição de lei quadrática (não coerente) sobre uma pesquisa de fase de código × Doppler: probabilidade de falso alarme (χ² central com 2M graus de liberdade), o limiar que atinge uma P_fa alvo (FDA de χ² invertida por bisseção) e probabilidade de deteção (χ² não central com não centralidade 2M·ρ para uma SNR pós-correlação ρ por célula), com a função Q de Marcum generalizada Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — um algoritmo independente (χ² não central/central por frações continuadas) face à série da gama incompleta do kshana (raim::chi2_cdf / noncentral_chi2_cdf), a calcular o mesmo NÚCLEO de estatísticas de deteção definido de forma única: a Q de Marcum generalizada Q_M(a,b)=ncx2.sf(b²,2M,a²), a probabilidade de deteção P_d, a probabilidade de falso alarme P_fa e a inversão P_fa→limiar, concordantes até ~{ "1e-6" } — a mesma base de independência que a linha validada 'Núcleo estatístico de integridade RAIM/ARAIM'. Apenas o NÚCLEO: o CFAR por média de células e a perda por sobreposição de células de código/Doppler permanecem MODELLED

# text
seg-77f425a38aa2 = Resolução de ambiguidades inteiras da fase da portadora GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fixação de ambiguidades por mínimos quadrados inteiros à maneira do LAMBDA: uma transformação de descorrelação inteira (Z) que preserva o volume (redução de tamanho por Gauss inteiro do fator L D Lᵀ) + uma pesquisa exata de mínimos quadrados inteiros por ramificação e limitação em profundidade de Schnorr–Euchner, com o teste de razão sobre os dois melhores candidatos (a afirmação validada); mais a taxa de sucesso bootstrap em forma fechada P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), verificada apenas internamente e fora da afirmação validada

# text
seg-5aeb95f59f07 = lambda() do RTKLIB v2.4.2-p13 (o seu ficheiro de código lambda.c, T. Takasu, BSD-2-Clause), uma redução LAMBDA e uma pesquisa MLAMBDA independentes compiladas a partir de C e executadas como ferramenta, em { "300" } covariâncias aleatórias (n { "2" } a { "10" }): os mínimos quadrados inteiros têm um único minimizador, pelo que os inteiros fixados têm de ser idênticos ({ "0" } divergências) e as duas melhores normas quadráticas, que alimentam o teste de razão, concordam até { "1e-9" } relativo (medido { "5.6e-13" }); tolerância fixada antes da comparação. Afirmação validada: a solução ILS e as suas duas melhores normas. O RTKLIB não calcula a taxa de sucesso bootstrap, que permanece verificada internamente face a um Monte Carlo do processo de arredondamento; os invariantes da transformação Z e a enumeração por força bruta permanecem como verificações de apoio. Apenas descorrelação por Gauss inteiro (as permutações de reordenação da redução LAMBDA completa aceleram a pesquisa mas não alteram nem a resposta ILS exata nem a taxa bootstrap)

# text
seg-4ad1ec05610f = Apontamento no plano B e assistência gravitacional por cónicas ajustadas

# text
seg-d249aea7c3ea = Geometria de sobrevoo hiperbólico (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, ângulo de deflexão δ={ "2" }·asin(1/e), parâmetro de impacto |B|=|a|·√(e²−{ "1" })), o referencial de ponto de mira do plano B Ŝ/T̂/R̂ e a decomposição B·T̂/B·R̂, e uma assistência gravitacional por cónicas ajustadas (módulo de v∞ conservado, direção desviada de δ, Δv heliocêntrico={ "2" }·v∞·sin(δ/2) sem custo de propelente) com o parâmetro de Tisserand T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, executado como programa separado) em { "192" } estados hiperbólicos da Terra: B.T, B.R e |B| dentro de { "1e-6" } km (pior { "1.35e-8" } km), o ângulo de deflexão e ambas as assíntotas dentro de { "1e-9" } rad (pior { "9.3e-15" } rad); a variação de velocidade da assistência a partir do C3 e das assíntotas do GMAT dentro de { "1e-9" } v_inf (pior { "5.6e-14" }); SMA, ECC e INC heliocêntricos em { "350" } estados centrados no Sol antes e depois da assistência dentro de { "1e-9" } relativo e { "1e-12" } rad (pior { "2.2e-14" } e { "4.1e-14" } rad); o parâmetro de Tisserand face ao sbpy { "0.6.0" } (BSD-3) sobre elementos do GMAT dentro de { "1e-9" } (pior { "1.3e-15" }) e face a { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }); e a forma fechada de Tisserand face à Tabela { "8.1" } de Kasuga e Jewitt ({ "2019" }) para { "12" } objetos dentro do limite de arredondamento impresso (pior { "0.39" } dele; um valor trabalhado publicado de P1). Pré-registado (436293bf; reparação heliocêntrica 6fd9f5e6); a adenda 374c806b, escrita depois de os ficheiros da referência independente terem sido gerados e antes de qualquer valor do Kshana, alargou o filtro de entrada de inclinação de { "1e-2" } para { "1e-3" } rad, mantendo mais estados e de pior condicionamento. Âmbito MODELLED: sobrevoo de dois corpos por cónicas ajustadas numa órbita planetária circular, sem transição de esfera de influência, perturbações de encontro nem efemérides

# text
seg-8e82da17a463 = Formação de feixe de agrupamento CRPA anti-interferência

# text
seg-1744f527b4d1 = Anulação por antena de padrão de receção controlado: vetores de orientação complexos do agrupamento a(û)=exp(j·k·pₙ·û), orientação determinista de nulos (ganho unitário na direção do SV, nulos exatos na direção de até N−{ "1" } interferidores através da norma mínima w=Aᴴ(AAᴴ)⁻¹b) e pesos adaptativos MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) que orientam por si nulos profundos sobre interferidores fortes (com um núcleo de álgebra linear complexa construído de raiz)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (resolução complexa zgesv do LAPACK) — uma base de código de álgebra linear independente do núcleo complexo construído de raiz do kshana, a calcular os MESMOS pesos definidos de forma única: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) e orientação de nulos de norma mínima w=Aᴴ(AAᴴ)⁻¹b, mais os ganhos de resposta do agrupamento resultantes, concordantes até ~{ "1e-9" } — a mesma classe de referência independente que as linhas validadas de DOP (gnss_lib_py) e de informação de Fisher (numpy). Agrupamento MODELLED de banda estreita, campo distante e elementos isotrópicos idênticos — sem acoplamento mútuo, desajuste por elemento, largura de banda finita (STAP) nem erro de estimação do vetor de orientação

# text
seg-f2c973f14d52 = Ruído de relógio em lei de potência IEEE-1139 + piso de flicker-FM

# text
seg-4a0159558671 = A conversão IEEE-1139 de cinco coeficientes entre PSD e variância de Allan S_y(f)=Σh_α f^α → σ_y²(τ) (PM branco/flicker, FM branco/flicker/passeio aleatório), o piso de flicker-FM σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) como termo ajustável de primeira classe, e um ajuste de família FM não negativo na base { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } que recupera o piso que a base de deriva { "{" }1/τ,τ,τ³{ "}" } não consegue representar

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; coeficientes de Kasdin e Walter { "1992" } / Vernotte { "2015" }) — uma base de código de terceiros independente e uma linhagem de citações a calcular a MESMA conversão IEEE-1139 de PSD para Allan σ_y(τ), definida de forma única, para cada um dos cinco tipos de ruído de lei de potência. O powerlaw::allan_deviation do kshana concorda com as formas fechadas do allantools (FM branco/flicker, RW-FM e PM branco até <{ "5e-9" } relativo; PM flicker até ~{ "1e-5" } — o verdadeiro sinal de independência, usando o kshana a constante tabelada { "1.038" } do NIST-SP-1065 face ao 3γ−ln2 completo do allantools), e o piso de flicker-FM √({ "2" } ln2·h_{ "{" }-1{ "}" }) concorda com o allantools ao longo de toda a escala — o mesmo limiar que as linhas validadas de MDEV/TDEV/Theo1/MTIE satisfazem. Modelo estacionário de lei de potência MODELLED — sem termo de deriva determinista (τ²); os coeficientes por dispositivo / pisos medidos permanecem modelados

# text
seg-cc1ac065e684 = Intercâmbio de blocos de covariância CCSDS OEM

# text
seg-ec4d44e7cf78 = Serializar e analisar o bloco COVARIANCE_START…COVARIANCE_STOP do OEM CCSDS { "502.0" } — a covariância de posição/velocidade de { "6" }×{ "6" } escrita como o seu triângulo inferior de 21 elementos (ordem canónica CX_X … CZ_DOT_Z_DOT) com o COV_REF_FRAME opcional, a complementar o escritor/analisador existente de vetores de estado OEM, para que as covariâncias de determinação de órbita e de filtros façam ida e volta no formato normalizado

# text
seg-ae061c7f082c = Crescimento do erro de deriva INS/TRN e cruzamentos de limiares

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Orçamento de erro de posição versus duração da deriva construído a partir de coeficientes da IMU, com cada fonte de erro (viés do acelerómetro, viés do giroscópio, passeio aleatório de velocidade, passeio aleatório de ângulo, fator de escala em cruzeiro e sob força específica sustentada) propagada através de um modelo de erro de INS de nível local de nove estados com a realimentação de Schuler (inertial::coast::ErrorDynamics segundo Groves, 2.ª ed., cap. { "14" }: erros de atitude, velocidade e posição, o canal vertical com o seu gradiente de gravidade, raios WGS-84 e gravidade normal, uma plataforma nivelada a seguir para norte à velocidade configurada, latitude_deg e height_m; termos sistemáticos por uma exponencial de matriz aumentada, passeios aleatórios por Van Loan), os monómios de Terra plana mantidos apenas como leading_order_m; contribuições combinadas segundo uma regra indicada (rss / linear-sum / deterministic-sum-with-stochastic-rss); as durações de deriva que atingem limiares de posição fornecidos pelo chamador ({ "10" } m e { "50" } m por predefinição) localizadas por uma varredura progressiva até ao primeiro cruzamento (first_crossing_s, dado que as curvas limitadas por Schuler não são monótonas), com a fonte dominante em cada cruzamento; e um modo limitado por TRN que dá o maior intervalo entre correções de terreno que respeita cada limiar. Executável como o tipo de cenário <c1/>

# text
seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), executado como programa separado sob GNU Octave { "8.4.0" }: execuções de deriva inercial livre com o mesmo perfil de erros da IMU, com uma banda morta numérica corrigida na sua atualização de quaterniões (qua_update.m: a guarda sobre uma velocidade angular abaixo de { "1e-8" } rad/s substituída por wnorm == { "0" }, aplicada a uma cópia em tempo de execução e verificada uma vez; com a guarda presente, uma atitude de plataforma com deriva lenta congelava e cortava a realimentação de Schuler). Pré-registado (4262b969) com o gerador corrigido antes de ser executado; o motor (440b3877) foi registado antes de qualquer saída corrigida ser aberta; o mesmo limiar de { "5" } %, { "48" } pontos, termos, sementes e estatística da ronda { "1" }. Resultado: 48/48 dentro de { "5" } % (pior +{ "3.70" } % de passeio aleatório de velocidade a { "1200" } s, +{ "3.33" } % de passeio aleatório de ângulo a { "1800" } s); a { "3600" } s, NaveGo/Kshana dão 2375.4/2376.2 m para o viés do acelerómetro e { "130" } 885/131 { "675" } m para o viés do giroscópio. Anular a realimentação de taxa de transporte de Schuler faz falhar o teste (+{ "695" } % a { "3600" } s). Divulgado: as previsões de Schuler de canal único e os valores do NaveGo da ronda 1 eram conhecidos; o modelo não tem nenhum parâmetro ajustado. Âmbito: as curvas de erro por termo em grau Tactical, { "45" } graus N, nivelado e apontado a norte, até { "3600" } s; os cruzamentos, a regra de combinação e o modo TRN são funções deterministas dessas curvas. Os coeficientes de classe da IMU (valores de banda da Tabela { "4.1" } de Groves { "2013" }) e o resíduo de correção do TRN permanecem entradas MODELLED. Ronda { "1" } (substituída): os monómios de Terra plana, agora leading_order_m, sobrestimam para além de { "600" } s (2.2x a 8x numa hora). { "0.30" } revisão: todas as saídas de ins-trn-coast mudam (o pico de TRN do cenário fornecido { "52.932679" } -> { "44.711834" } m)

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
# c1: passes::predict_passes
seg-656fd7d44a9e = Consistência interna, a partir de três grandezas calculadas por expressões diferentes na mesma varredura e depois obrigadas a fechar. Os segundos de abertura de navegação, os segundos de abertura de comunicações e os segundos de abertura ociosos são acumulados em separado — os ociosos a partir de (aberturas − |servidas|) por intervalo elementar, nunca como resto — e a sua soma é verificada face a aberturas × horizon_s, o que uma fronteira mal delimitada, um intervalo contado duas vezes ou um intervalo omitido quebra de imediato; os tempos servidos por sessão são também obrigados separadamente a somar de volta os dois totais de serviço. As propriedades estruturais do escalonador são medidas e não presumidas: afirma-se que o tempo servido não decresce com o número de aberturas em { "200" } planos pseudoaleatórios para as três políticas (não óbvio para a política não preemptiva, em que uma abertura adicional muda quem detém o quê em cada fronteira posterior), e a aritmética das fronteiras é fixada no par em contacto/sobreposição de um segundo onde um erro de uma unidade de outro modo se esconderia. A ponte do preditor de passagens é verificada face à saída de <c1/>: com uma abertura e sem serviço concorrente, os segundos de abertura de navegação são iguais às durações de passagem somadas do próprio preditor. Não é invocada nenhuma referência independente externa e não existe nenhuma: a capacidade substitui a aritmética manual em vez de ser verificada face a ela, o plano de contactos fornecido é ilustrativo e não de voo, e nenhum escalonador operacional publica um par plano-mais-resposta com a sua regra de arbitragem indicada — um ciclo calculado sob uma política não indicada não é comparável com um calculado sob uma política indicada, e a dependência da política é medida (ciclos de navegação de 100/150 contra 50/150 no plano idêntico). O tempo de apontamento e de mudança, o volume de dados, o estado dos buffers, a energia e o fecho da ligação são excluídos na etiqueta do relatório em vez de modelados em silêncio

# text
seg-43cd7aa7ab53 = Interferência de RF na navegação à superfície lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Relação interferidor-sinal nativa lunar, C/N₀ efetivo e perda de bloqueio para um utilizador selenográfico à superfície sob um interferidor à superfície lunar (ou elevado), sobre a constelação ilustrativa de classe Moonlight/LCNS de fontes públicas. Compõe a cadeia aberta de interferência (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) com a geometria aberta do céu lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nenhuma geometria nem radiometria é rederivada. Ao contrário do tipo <c1/> da Terra, o ramo do sinal não é uma potência recebida fixa: a potência recebida isotrópica de cada satélite é o seu próprio EIRP do balanço de ligação − FSPL(distância oblíqua), pelo que o J/S varia de satélite para satélite com a distância e a elevação lunares. Emite UMA LINHA POR LIGAÇÃO (época, satélite) VISÍVEL em JSON e como artefacto *.table.csv, com as duas potências recebidas de cuja diferença resulta o J/S impressas a seu lado; as grandezas de mérito agregadas ficam junto a essa tabela, nunca em vez dela. Executável como o tipo de cenário <c2/>

# text
seg-2a4393ae7c52 = Verificação cruzada de composição face a um percurso de código independente no próprio repositório: cada J/S por ligação é rederivado como a diferença de dois balanços de ligação calculados com linkbudget::received_signal_power_dbw, cuja perda em espaço livre é a expressão única { "20" }·log10(4πRf/c) e não a soma de três termos que jamming::free_space_path_loss_db usa — as duas concordam até < { "1e-9" } dB em todas as linhas (pior caso medido { "7.11e-14" } dB, isto é, arredondamento de vírgula flutuante). A cadeia de interferência subjacente que compõe está separadamente ancorada externamente em tests/gnss_denied_jamming_resilience_reference.rs (rederivação independente em numpy/scipy do J/S e do C/N₀ efetivo fixada a Kaplan & Hegarty §{ "9.4" }, mais o C/N₀ medido do JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); a geometria lunar que compõe é a geometria lunar_service/lunar com as suas próprias referências independentes. Identidades em forma fechada verificadas aqui: um afastamento do interferidor reduzido a metade acrescenta exatamente { "20" }·log10({ "2" }) dB a todas as linhas; o J/S é exatamente invariante ao ganho de boresight da antena do utilizador enquanto o C/N₀ se desloca exatamente esse ganho; uma máscara de elevação não altera nenhuma linha sobrevivente bit a bit. A própria linha permanece ReferenceImpl/modelada: não existe nenhuma campanha medida de interferência lunar com que validar, e a constelação é uma geometria ilustrativa de classe Moonlight/LCNS de fontes públicas, não uma efemérides de voo

# text
seg-4c116e25c5c5 = Contorno de negação lunar com uma banda de incerteza a partir da dispersão do C/N₀ medido

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = O relatório <c1/> já não assenta o seu contorno de negação num único escalar. Emite a distribuição completa do C/N₀ do sinal pretendido medido sobre a tabela por satélite — n, mín., p05, p25, mediana, p75, p95, máx., média, desvio-padrão amostral e a assimetria própria da amostra (p95 − mediana) − (mediana − p05) — junto às linhas por ligação, que permanecem inalteradas. O contorno é depois comunicado em cada uma dessas estatísticas de ordem segundo AMBOS os critérios de negação que o motor reconhece, nunca um em vez do outro: o critério incumbente de razão de potências (J/S = { "30" } dB, o mesmo limiar que attack_surface e tracking_loop usam, e o critério por trás da coluna <c2/> da tabela publicada de interferência da ligação lunar), e o critério de perda de bloqueio (o C/N₀ efetivo a descer até tracking_threshold_dbhz), que é o critério com que a própria coluna links[].status deste relatório é avaliada. Cada ponto do contorno é dado em ambos os eixos do plano de negação — o EIRP do interferidor necessário ao afastamento do cenário e o afastamento de negação ao EIRP do cenário — pelo que a banda é um intervalo nos mesmos eixos em que um gráfico de contorno é desenhado. Os limites da banda SÃO contour(p05) e contour(p95): o mesmo mapa em forma fechada aplicado aos próprios quantis da amostra, não um sigma ajustado à amostra e não mediana ± k·desvio-padrão, e o relatório di-lo numa cadeia band_definition junto aos números. O desvio-padrão é emitido por continuidade e não é usado por nada. Um quantil cujo C/N₀ já esteja no limiar de seguimento ou abaixo dele não tem J/S de negação finito; essas colunas são emitidas como null com uma razão contada em vez de um infinito ou de um raio limitado

# text
seg-f7457156f960 = Consistência interna face às funções diretas do próprio motor, que é tudo o que esta capacidade pode honestamente afirmar. Cada ponto do contorno é uma inversão em forma fechada, e cada inversão é verificada devolvendo a sua resposta através da função DIRETA com que as linhas do próprio relatório foram avaliadas: a coluna de J/S através de jamming::effective_cn0_dbhz (que tem de devolver tracking_threshold_dbhz até < { "1e-9" } dB-Hz), a coluna de afastamento através de jamming::free_space_path_loss_db e jamming::j_over_s_db (o mesmo J/S até < { "1e-9" } dB), a coluna de EIRP através de jamming::j_over_s_db ao afastamento próprio do cenário. Verifica-se ainda que o contorno é a FRONTEIRA do conjunto de negação e não um ponto no seu interior — lock_status perde o bloqueio numa desigualdade estrita, pelo que se mede o veredicto a passar de DEGRADED para LOST ao longo de { "1e-4" } dB de J/S de cada lado do contorno, o que um contorno desviado de um épsilon falharia. A verificação mais forte é por ligação e não por quantil: aplicar o mesmo mapa ao C/N₀ próprio de cada linha reproduz exatamente a coluna de estado do relatório — { "0" } discordâncias em { "38" } de { "38" } linhas no ponto de funcionamento documentado (kind = lunar-jamming, todas as entradas predefinidas exceto jammer.range_m = { "25 000" } m), onde { "26" } linhas são LOST e { "12" } não são. A monotonicidade é medida e não presumida: { "20 001" } amostras em [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violações de um afastamento estritamente decrescente e de uma potência necessária estritamente crescente, pelo que a ordenação por quantis da banda é demonstrada e não afirmada. ExternalDataset é recusado e a validação com ele: não existe nenhuma campanha medida de interferência lunar face à qual comparar um raio de negação, a constelação é uma geometria ilustrativa de classe Moonlight/LCNS de fontes públicas e não uma efemérides de voo, e as entradas do contorno (EIRP, potência do interferidor, ganhos de antena, temperatura de ruído) são ordens de grandeza representativas. ReferenceImpl foi também considerado e recusado — a inversa e a expressão direta são a MESMA álgebra lida em dois sentidos, pelo que a ida e volta apanha erros de transcrição e de sinal mas não é uma implementação independente; chamar-lhe verificação cruzada seria a manobra de independência emprestada que os invariantes da matriz existem para impedir. O que a banda traz é medido e citado e não afirmado: nesse ponto de funcionamento, o contorno de escalar único é { "27.402916" } km e coloca { "25" } km do lado negado para todas as { "38" } linhas, enquanto a banda { "21.256108" } .. { "29.921360" } km contém o ponto de funcionamento e por isso comunica a divisão que a tabela realmente mostra. Mede-se também que os dois critérios discordam — a banda da razão de potências ({ "38.186527" } .. { "53.691675" } km) não contém de todo { "25" } km — razão pela qual ambos são impressos

# text
seg-2d3944107ba0 = Poder de deteção do monitor de integridade intermodal

# text
seg-38bc7c0bfe57 = O relatório hybrid-optical-rf indica o que o monitor de qui-quadrado intermodal consegue realmente DETETAR, e não apenas que passa num caso sem falhas: o viés mínimo detetável por eixo monitorizado (este, norte, cima, relógio) às probabilidades de falso alarme e de deteção falhada indicadas no cenário, a curva de poder de deteção de um lado e do outro dele, o múltiplo de viés sem ruído a que a estatística realizada cruza pela primeira vez o limiar, e o tempo até à deteção para uma rampa de viés a uma taxa indicada. As falhas são também injetadas através do monitor real e a estatística que ele devolve é comunicada a par da previsão analítica

# text
seg-b6b8dec4dcff = Duas referências independentes internas, nenhum conjunto de dados externo. ({ "1" }) Ida e volta em forma fechada: o viés mínimo detetável é produzido invertendo a cauda do qui-quadrado não central sobre a não centralidade (raim::pbias) e é verificado devolvendo a não centralidade resultante através de raim::noncentral_chi2_cdf ao limiar do próprio monitor, que tem de devolver P_md. ({ "2" }) Injeção versus análise: um viés é escrito na estimativa de RF de um eixo e cross_raim::run_cross_raim é reexecutado, pelo que a estatística comparada com a não centralidade analítica é a que o monitor calculou e não uma rederivação. Um Monte Carlo com semente da própria estatística é incluído nos testes como terceira verificação; está deliberadamente FORA do relatório, porque uma estimativa amostrada seria mais lenta e não reprodutível bit a bit. ExternalDataset é recusado: a grandeza é o poder de deteção DESTE monitor na atribuição de sigmas DESTE cenário, e as magnitudes de sigma pelas quais o MDB é escalado são entradas representativas modeladas e não medições. ReferenceImpl foi também considerado e recusado — o Monte Carlo amostra a mesma estatística que a análise descreve, pelo que apanha erros de transcrição e de coeficientes mas não é uma implementação independente do monitor. { "0.30" } ronda { "2" } (pré-registada 0135a9e4), bloqueada (permanece MODELLED): o chi2/ncx2/brentq do SciPy { "1.18.1" } reproduzem o limiar do relatório (dentro de { "5.4e-12" }), o MDB por eixo, a curva de poder, o múltiplo de cruzamento e o tempo até à deteção da rampa (dentro de { "5.3e-10" }) em cinco configurações; as estatísticas de falhas injetadas não têm referência independente e as magnitudes de sigma são entradas modeladas, pelo que a delimitação aguarda uma decisão do responsável

# text
seg-38cabd4921c1 = Recrescimento da covariância após a transferência face ao limite de alerta

# text
seg-9287268bbada = O relatório hybrid-optical-rf expõe o modelo de ruído de processo do filtro e indica durante quanto tempo a solução após a transferência permanece dentro do limite de alerta: para ambos os sentidos de transferência, transporta a covariância por eixo que a transferência deixou, propaga-a para a frente sob um ruído de processo de passeio aleatório indicado e comunica o instante em que o 1σ escalado pela cobertura atinge os limites de alerta horizontal, vertical e de temporização, qual limite é atingido primeiro, a constante de tempo de duplicação da variância e um perfil de deriva amostrado que enquadra o cruzamento. As PSD de ruído de processo, o fator de cobertura e os limites de alerta são todos entradas com predefinições documentadas

# text
seg-c85b822227f3 = Sem referência independente externa. O cruzamento é uma solução em forma fechada do crescimento da variância por passeio aleatório, e os testes recalculam-no de forma independente a partir dos valores que o próprio relatório publica e não a partir dos internos do emissor. A covariância inicial é fixada bit a bit ao traço que o bloco de transferência existente já comunicava, pelo que a deriva não pode propagar uma covariância que mais ninguém viu. As PSD de ruído de processo são entradas representativas MODELLED e os tempos de cruzamento escalam diretamente com elas, o que o teste de escala indica como propriedade medida e não como afirmação. ExternalDataset é recusado deliberadamente: o tempo de deriva é uma função direta de duas PSD modeladas e de limites de alerta que são eles próprios representativos, e não existe nenhuma deriva de transferência ótica/RF lunar medida com que comparar. Uma referência independente externa aqui exigiria uma curva publicada de crescimento de covariância após a transferência ou de exatidão de holdover para um recetor comparável com o seu modelo de ruído de processo indicado, verificada a uma tolerância

# text
seg-a3b8272862aa = Padrão de antena fora do eixo na exportação de geometria lunar

# text
seg-27d246503a48 = A exportação de geometria por satélite transporta, por (época, satélite), o ângulo fora do eixo NO SATÉLITE e o ganho de transmissão na direção do local a partir do padrão real de abertura circular uniformemente iluminada (Airy), e comunica a contagem dentro do feixe sob esse padrão A PAR DA contagem dentro do feixe sob a aproximação simétrica de ganho para largura de feixe (θ_3dB[deg] = √(31000/G_lin)), com a diferença emitida como correção explícita em ligações, em satélites por época e como pior época individual. Ambas as eficiências de abertura implícitas da aproximação são emitidas ({ "0.641" } face à regra de { "70" }·λ/D graus com que é citada, { "0.920" } face a uma abertura circular uniforme), pelo que a eficiência que assume em silêncio é indicada e não inferida. Desligada por predefinição: o bloco só aparece quando são dados um local de exportação e uma abertura

# text
seg-f7f79e2dd6c5 = Mista, e separada em vez de agregada. O PADRÃO subjacente é validado externamente e mantém a sua própria linha (um fixture scipy.special.j1 a < { "0.05" } dB em tests/validate_p1_orbital_footprint.rs, mais aqui a abcissa de meia potência de Airy publicada x = { "1.61634" } localizada por bisseção e não assumida). A GEOMETRIA é verificada face à trigonometria de triângulos em forma fechada escrita como uma expressão diferente do produto escalar em teste. O CONFINAMENTO do feixe real pelo cone aproximado é álgebra derivada (28.019/√η vs { "29.479" } graus por λ/D), pelo que a correção só pode ser não positiva para η ≤ { "0.9035" }. Mas as próprias CONTAGENS dentro do feixe não têm referência independente externa: nenhuma tabela publicada indica quantos satélites de uma camada de classe Moonlight/LCNS mantêm um local polar sul dentro do feixe de meia potência de uma dada antena parabólica, e a constelação é uma aproximação ilustrativa de fontes públicas, não uma efemérides de voo. A discordância medida no ponto de trabalho documentado — { "0" } ligações no feixe sob o padrão real contra { "28" } sob a aproximação, −{ "2.33" } satélites por época, pior época { "3" }, em { "76" } ligações avaliadas — é portanto um resultado MODELLED sobre a aproximação, fixado como literal de regressão (a linha mais próxima fica a { "0.069" }° de qualquer das margens do feixe, quatro ordens de grandeza acima de qualquer discordância no último dígito), e não um valor de cobertura validado externamente. Rotular a linha como ExternalDataset com base na âncora externa do próprio padrão seria validação emprestada, que é a manobra que os invariantes da matriz existem para impedir. { "0.30" } ronda { "2" } (pré-registada d9755d28), bloqueada (permanece MODELLED): a geometria SPICE e as funções de Bessel do SciPy reproduzem o ângulo fora do eixo (pior { "3.0e-5" } graus), o ganho de Airy e os indicadores de dentro do feixe em { "6 336" } linhas de estados de orbitadores em voo e no ponto de trabalho documentado; mas na geometria de voo os indicadores dividem-se por identidade do satélite (a ligação mais próxima está a { "1.66" } graus da margem do feixe), a visibilidade de { "5" } graus é verificada como indicador e não como elevação numérica, o indicador da aproximação simétrica aplica a regra empírica 31000/G a um ângulo validado sem validar a regra, e as eficiências implícitas não têm referência independente; a delimitação aguarda uma decisão do responsável

# text
seg-6fbfa234ef3e = Perda de bloqueio da malha de seguimento e arrastamento por spoofing sob interferência

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perda de bloqueio calculada a partir da dinâmica da malha em vez de uma razão de potências: tremor térmico de 1σ da portadora (Costas) e do código (adiantado/atrasado não coerente) face ao C/N₀ com a perda de elevação ao quadrado, face às regras indicadas 3σ_PLL + θ_e ≤ { "45" }° e 3σ_DLL + atraso de rampa ≤ d/2 chips; limiares de C/N₀ de queda e de rebloqueio com a malha determinante nomeada e a histerese DERIVED da maior largura de banda de captura em vez de afirmada; o tempo declarado até perder o bloqueio de um detetor de bloqueio de dois limiares com tempos de confirmação, comunicado separadamente do tempo físico de fuga de fase (tempo médio de Viterbi entre saltos de ciclo, em log₁₀ s porque abrange centenas de décadas); a maior variação de código e a maior taxa de Doppler da portadora que as malhas da vítima conseguem seguir; e o RAIO DE NEGAÇÃO que a dinâmica da malha implica, comunicado a par do raio existente de razão de potências com a sua diferença com sinal como campo nomeado próprio. Executável como o tipo de cenário <c1/>

# text
seg-c3794c8d85c5 = O próprio correlador sdr do motor (sdr::correlate / synth_if / CaCode) avançado sobre IF sintética com semente a um C/N₀ calibrado — um percurso de código separado que chega aos mesmos números por correlação numérica de IQ amostrado e não por uma expressão algébrica de tremor, pelo que é um caminho diferente e não uma reformulação — mais valores tabelados de I₀ de Bessel modificada para o termo de salto de ciclo. Teoria de malhas segundo Kaplan & Hegarty cap. { "8" } e Viterbi/Gardner para o tempo de salto. A linha permanece ReferenceImpl/MODELLED: a verificação cruzada vive nesta mesma base de código, e a verificação de bessel_i0 valida uma função especial e não o modelo de seguimento, pelo que promover a linha com esse fundamento seria uma rotulagem interesseira. ExternalDataset exigiria um conjunto de dados de IF bruta gravada com C/N₀ de verdade e um instante de perda de bloqueio anotado (classe TEXBAT/OAKBAT); nenhum acompanha esta árvore, e mesmo com o IQ esses conjuntos de dados não publicam verdade de estado de malha por época, pelo que um tempo declarado de perda de bloqueio só poderia ser validado face ao detetor de bloqueio de outro recetor, o que é uma escolha modelada e não uma referência independente. As larguras de banda das malhas, o tempo de integração, o espaçamento dos correladores, a razão de captura, os tempos de confirmação, a potência do interferidor e os ganhos de antena são valores representativos de banda e não de uma folha de especificações. { "0.30" } ronda { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, executado como programa) sobre IF gerada de forma independente (pré-registado 6ef7698c, alterações ao método de medição divulgadas), um resultado (permanece MODELLED): o tremor em malha fechada de PLL e de DLL concorda dentro de { "8" } % a { "35" } a { "45" } dB-Hz, o esforço dinâmico de { "10" } Hz/s dentro de { "1" } % e o atraso de rampa de código de primeira ordem dentro de { "2" } %; a { "30" } dB-Hz o tremor do PLL é { "21" } % superior e o do DLL { "32" } % inferior, os limiares medidos da regra dos 15 graus ficam { "1.5" } dB acima do motor, e a malha de segunda ordem salta ciclos entre { "0.5" } e { "2" } décadas mais vezes do que o limite de tempo de salto de primeira ordem. { "0.30" } revisão: o tempo de salto de Costas usa agora a SNR da malha rho/4 (saltos de meio ciclo); o log10_mean_time_to_cycle_slip_s predefinido da jitter_table desce de { "11.58" } para { "2.10" } ao limiar de { "25.47" } dB-Hz

# text
seg-69155fb79ebd = Covariância de coordenadas de estações VLBI lunar a partir de um calendário de seguimento

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Derivadas parciais de atraso acumuladas sobre um calendário de linhas de base × épocas numa matriz de informação de Fisher, invertida para a covariância de coordenadas da estação e o sigma por coordenada da estação, a substituir uma ligação de equipartição isotrópica assumida a partir de uma precisão de atraso escalar. O estado transporta coordenadas de estação fixas à Terra (ITRS), pelo que o Jacobiano é a derivada parcial inercial rodada pela matriz GCRS→ITRS de cada época e é a rotação da Terra que torna essas coordenadas observáveis — o relatório MEDE a varredura da linha de visada fixa à Terra e a declinação da baliza em vez de as assumir. A característica, o defeito de datum, o número de condição, o espetro de informação e o espaço nulo da rede livre são emitidos em cada execução, e perante uma deficiência de característica o sigma principal é publicado como NULL com um estado em vez de ser lido de uma inversa quase singular. O valor de equipartição c·σ_τ·√(g/N) para o MESMO calendário é impresso junto ao calculado com a sua razão, juntamente com o limite isotrópico de traço √(p/trace(M)) que a AM-HM torna um piso rígido. Executável como o tipo de cenário <c1/>

# text
seg-b259d4d18f42 = Um percurso independente no próprio repositório. Cada linha do Jacobiano é rederivada por diferença finita central de lunar_vlbi::vlbi_delay_s avaliada a partir das coordenadas fixas à Terra e fixas ao corpo lunar do próprio estado, rodadas para a frente através da cadeia de referenciais — um caminho que não calcula nenhuma derivada e não partilha nenhuma expressão com as derivadas parciais analíticas — e as matrizes de informação que os dois percursos constroem concordam a < { "1e-6" } da maior diagonal. O núcleo de álgebra linear que isto compõe (information_matrix, crlb, sym_eig) está separadamente ancorado externamente face a numpy.linalg.eigh / numpy.linalg.inv em tests/fim_observability_reference.rs, e o observável de atraso transporta a própria referência independente de campo distante de delta-DOR do lunar_vlbi; a linha não pede emprestado nenhum dos estatutos. Identidades em forma fechada verificadas aqui e rotuladas como tal: escala de σ² e 1/N, e √(p/trace(M)) como limite inferior AM-HM que o sigma calculado não pode superar, que só coincide com o valor de equipartição numa geometria isotrópica — razão pela qual a razão medida é exatamente a anisotropia que o pressuposto descartou. { "0.30" } comparação externa (Biblioteca: NAIF SPICE CSPICE N0067 via spiceypy { "8.2.0" }, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), pré-registada ({ "50863551" }) juntamente com uma execução de sensibilidade a erro de modelo do lado do motor: cada linha do Jacobiano é reconstruída por diferenças centrais de diferenças de tempo de luz newtonianas convergidas a partir da geometria SPICE (a equação do tempo de luz é um pequeno script sobre posições SPICE; o SPICE transporta a geometria), com o calendário reconstruído a partir de elevações SPICE. O calendário, a característica, o defeito, o espetro de informação, o número de condição, os sigmas das estações, o valor principal, o limite de traço, as razões de equipartição, o espaço nulo da rede livre, a varredura da linha de visada e a declinação da baliza concordam dentro dos { "1" } % / { "0.1" } graus pré-registados, que ficam acima do erro analítico conhecido da Lua do motor ({ "3.2e-3" } nos sigmas, medido antes da execução). O NumPy { "2.3.5" } refaz a álgebra linear sobre o Jacobiano do motor registado até { "2e-13" } (P2). Validado como limite de Cramér-Rao para o conjunto reduzido de parâmetros indicado nas entradas ilustrativas indicadas: a efemérides do centro da Lua, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos fixos em ambos os ramos, pelo que não é uma exatidão de campanha real

# text
seg-0f4d023fe2d4 = Covariância de coordenadas de ponto da superfície lunar a partir de um calendário de atrasos VLBI, mantida distinta da das estações terrestres

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Uma terceira escolha de datum, <c1/>, que mantém todas as estações terrestres e estima apenas as coordenadas da BALIZA fixas ao corpo lunar — a configuração para a qual uma incerteza de ponto da superfície lunar é realmente citada, dado que as coordenadas das estações terrestres são uma entrada do modelo de atraso e não uma incógnita dele. Existe porque a covariância ao nível da estação e a covariância de ponto da superfície são GRANDEZAS DIFERENTES separadas pelo braço de alavanca ρ/B, e nada impedia anteriormente que uma fosse citada face à outra. O bloco <c2/> emitido transporta ρ, a linha de base mais longa, o braço de alavanca, a forma de ponto da superfície da ligação de equipartição c·σ_τ·(ρ/B)·√(g/N), o sigma da baliza por coordenada calculado e a sua razão — a razão é null em vez de enganadora sempre que a baliza não é estimada ou a matriz tem deficiência de característica. B é tomado como a linha de base MAIS LONGA presente, a mais favorável, pelo que a razão só pode subestimar. Executável como <c3/> com <c4/>, o que é recusado com uma mensagem a nomear a entrada em falta quando a baliza não é estimada

# text
seg-18096ae23d96 = Identidades em forma fechada, sem referência independente externa invocada nem disponível. O braço de alavanca é verificado face a ρ/B e as duas formas de equipartição entre si até { "1e-15" } — identidades algébricas, pelo que apanham um erro de ligação e nada mais, e são rotuladas como tal. O resultado substantivo é MEASURED e não afirmado: um atraso de uma linha de base fixa restringe a DIREÇÃO da baliza, pelo que a componente da linha de visada só chega à matriz de informação através do termo de distância de campo próximo, e o teste lê a anisotropia resultante a partir do espetro emitido em vez de a derivar. A AM-HM torna √(p/trace(M)) um piso rígido, pelo que uma ligação de equipartição isotrópica só pode SUBESTIMAR, e a razão entre o calculado e a equipartição é exatamente a anisotropia que descartou. MEASURED no par de tipo Goldstone/Canberra cuja corda é { "10726.748" } km: em { "112" } dias amostrados, { "36" } não admitem nenhuma época de visibilidade mútua a uma máscara de { "10" }°, o máximo alguma vez mutuamente visível é { "17" } de um calendário de 49 amostras, e nos { "73" } dias viáveis a razão de três componentes vai de { "113.9" }× a quatro ordens de grandeza mais, mediana { "1513" }×, enquanto restringir às duas direções transversais que a linha de visada não deixa sem informação dá { "3.94" }× a { "25.8" }×, mediana { "7.8" }×. O QUE ESTA LINHA NÃO AFIRMA: qualquer um desses valores como propriedade de uma campanha real. Estabelece que a grandeza de ponto da superfície é agora CALCULADA e não assumida, e que não pode ser trocada em silêncio com a de nível de estação. Permanece ReferenceImpl/MODELLED: não existe nenhuma covariância publicada de ponto da superfície de VLBI lunar face à qual validar, as estações e o local da baliza são ilustrativos e não levantados, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS, pelo que este é um limite de Cramér-Rao para um conjunto reduzido de parâmetros e otimista por direito próprio. A mesma grandeza no percurso por kernel (baliza na Lua DE440) é validada na sua própria linha, "…, percurso por kernel"; neste percurso analítico o menor sigma da baliza está { "3.9" } % abaixo da referência independente SPICE dessa linha, razão pela qual esta linha permanece MODELLED

# text
seg-8958521eedf7 = Covariância de coordenadas de ponto da superfície lunar a partir de um calendário de atrasos VLBI, percurso por kernel

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = A covariância da baliza com todas as estações fixas do cenário lunar-vlbi-fim (todas as estações terrestres mantidas, apenas as coordenadas da baliza fixas ao corpo lunar estimadas) com a baliza colocada na Lua JPL DE440 lida pelo leitor de kernels do próprio motor (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Apenas o centro da Lua difere do percurso analítico; a rotação do corpo IAU { "2015" }, as estações, a rotação da Terra e a álgebra linear são as mesmas. As saídas validadas são o conjunto de observações, o espetro de informação de { "3" } x { "3" }, a característica e o número de condição, os três sigmas da baliza fixos ao corpo e o seu RMS, o braço de alavanca e a razão entre o calculado e a equipartição, no calendário predefinido. Executável como o cenário <c1/> com datum = "all-stations-fixed", estimate_beacon = true e planetary_kernel_path definido

# text
seg-63250578ec6b = Ramo vinculativo de biblioteca: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) em de440s, earth_latest_high_prec (ITRF93 com UT1 e movimento polar) e os referenciais lunares DE440, a baliza fixa em MOON_ME; cada linha do Jacobiano é uma diferença central de { "3" } km da diferença de tempo de luz newtoniana convergida (o próprio código de tempo de luz da referência independente M069, importado), nunca uma derivada parcial do Kshana; visibilidade reconstruída a partir de elevações WGS-84; eigh e inv do NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK). Ramo P2: NumPy sobre o Jacobiano registado do motor. Pré-registado (4a51256) antes de existirem o fixture ou a referência independente, com limiares de { "1" } % nos valores próprios, condição, sigmas, RMS e razão, { "1e-4" } no braço de alavanca, conjunto de observações e característica exatos; P2 { "1e-9" }. Divulgado: a comparação apenas do motor entre a Lua analítica e a de kernel ({ "3.9" } % no sigma y) foi executada antes do pré-registo, para escolher o percurso por kernel, e é aí indicada. Resultado: ambos os ramos concordam, pior { "1.7e-3" } (sigma y da baliza { "0.081211" } m contra { "0.081351" } m). Mutação: transpor a rotação do corpo da derivada parcial da baliza faz falhar ambos os ramos. Ambos os lados leem o DE440, pelo que a concordância valida a geometria e a álgebra linear sobre o DE440, não o DE440. Fora da afirmação: a exatidão de ponto da superfície de uma campanha real (relógios, troposfera e orientação da Terra mantidos fixos; estações e local da baliza ilustrativos), e o percurso analítico predefinido (linha acima, que permanece MODELLED: na Lua analítica o sigma y está { "3.9" } % abaixo desta referência independente)

# text
seg-0315968c8214 = PNT diferencial lunar — orçamento de resíduos da ligação de correções

# text
seg-c6785166a44c = Os três termos que uma correção diferencial acumula entre a época em que é calculada e a época em que é usada, cada um deixado anteriormente como margem não modelada: erro de levantamento da estação de referência (correlacionado entre satélites, independente da linha de base, transferência de posição de ~{ "1" }:{ "1" } e comprovadamente não amplificado pelo DOP), envelhecimento da correção (o vetor de erro de órbita congelado reprojetado sobre a linha de visada em que o próprio propagador do motor coloca o satélite uma latência depois, mais a deriva de relógio c·σ_y(τ)·τ da lei de potência calibrada) e quantização uniforme da ligação sobre uma escala completa exata de ±(orbit_err + clock_err) com variância step²/12. Comunicados nos domínios da distância e da posição, a par de — nunca em vez de — o resíduo e o nível de proteção existentes, com uma curva de latência a par do valor único

# text
seg-29b8e6c12471 = Identidades em forma fechada e autoconsistência: a variância step²/12 do quantizador uniforme, a propagação exata de covariância (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ a colapsar para σ·PDOP para σ igual, a transferência de { "1" }:{ "1" } do termo de levantamento como consequência de û_user ≈ û_ref, e o fecho em quadratura ao desligar. A verificação cruzada do PDOP face a orbit::dop partilha a matriz normal [−û, { "1" }], pelo que é uma verificação de consistência e é rotulada como tal e não como referência independente. Nenhum ExternalDataset está disponível nem é invocado: nenhuma estação à superfície lunar tem uma exatidão de levantamento publicada, nenhuma ligação de correção diferencial lunar tem uma latência ou formato de mensagem publicados, e o resultado da quantização é uma forma fechada e não uma medição. O RTKLIB — já a referência independente de código externo para o núcleo de diferença simples e de mínimos quadrados ponderados — poderia ser conduzido com uma base deliberadamente mal levantada para confirmar a transferência de { "1" }:{ "1" } do levantamento, mas isso é código independente sobre a mesma álgebra de primeira ordem de linha de visada. AS MAGNITUDES SÃO MODELLED: a predefinição de levantamento é a própria atribuição de realização de referencial lunar desta crate e não uma estação medida, a latência e o número de bits são entradas ILLUSTRATIVE, e o crescimento do próprio VETOR de erro de efemérides difundidas não é de todo modelado — indicado na cadeia de lei de envelhecimento emitida, porque é o termo com maior probabilidade de dominar uma ligação real

# text
seg-c42646ae4707 = Mapa de cobertura e exatidão de estações de referência lunares

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Varredura de Monte Carlo do modelo de PNT diferencial lunar sobre uma grelha de utilizadores polar sul e um dia de épocas (o tipo <c1/>): para uma estação de referência diferencial num local polar sul conhecido, por ponto e sobre a região, o erro de posição corrigido e não corrigido por percentis (3-D, horizontal, vertical), a disponibilidade com uma razão para cada época indisponível (user_lt4, station_missing_sat), a cobertura face a um limiar indicado antes da execução, níveis de proteção DO-229E, o raio de cobertura por setor de azimute e o orçamento da ligação de correções na estação e no pior ponto. Não é uma afirmação sobre o desempenho de nenhum sistema real; não é afiliado a nenhuma agência nem por ela apoiado

# text
seg-2308d94fa25e = Aritmética recalculada por um script numpy independente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; pré-registada em tests/fixtures/lunar_station/PREREGISTRATION.md, registada isoladamente em 9caedf97 antes da primeira execução): em { "20" } casos com todos os termos de erro ativos, os conjuntos visíveis e o estado são idênticos, os erros de distância em bruto concordam até { "1.4e-14" } m, os vetores e módulos do erro de posição até { "1.4e-9" } m face a um limiar de { "1e-6" } m, e o p95 de cada ponto é igual ao numpy.percentile bit a bit; as correções da estação FALHARAM o seu limiar de { "1e-9" } m (pior { "3.73e-9" } m, { "15" } de { "20" } casos), e com elas os erros de distância corrigidos: verificado em aritmética de 60 dígitos, ambos os lados estão dentro do arredondamento de precisão dupla do valor exato, sendo o termo de levantamento uma diferença de duas distâncias de { "1e7" } m cuja unidade na última casa é { "1.86e-9" } m; registado, não ajustado. O tipo reduz-se exatamente ao tipo lunar-differential-pnt num ponto, uma época e um ensaio. O modelo de erro, o modelo de decorrelação e cada limiar são próprios deste projeto ou ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-7ecf4b0038b0 = Máscaras de horizonte de terreno lunar a partir de um perfil indicado ou de um DEM polar

# text
seg-7102948907bc = Máscaras de horizonte dependentes do azimute por local para o tipo lunar-station-coverage (a estação de referência e cada ponto de utilizador) e a grelha moonlight-service-volume e o seu local de exportação por satélite (cada linha de exportação ganha clears_terrain), no formato de tabela de skyline { "0.36" } (skyline::Skyline, linear em azimute com fecho a { "360" } graus; um perfil indicado e um horizonte de DEM num local combinam-se como o seu máximo ponto a ponto): um station_horizon ou user_horizon de [terrain] indicado e rotulado com a sua origem, e/ou um horizonte por traçado de raios sobre um DEM estereográfico polar sul (o formato de grelha polar LOLA do LRO, lido a partir de um descritor que fixa o seu tamanho e SHA-256, ou um mosaico realdata::lola_dem de latitude/longitude com [terrain] dem_tile_path, repetido com o seu SHA-256) ao longo de círculos máximos da esfera lunar com curvatura exata, a partir de uma altura de mastro indicada, a um passo de azimute e alcance indicados. Um satélite conta num local quando ultrapassa a mask_deg plana e o horizonte no seu azimute (lunar_service::topocentric); uma época que o horizonte deixa com menos de quatro satélites num ponto, onde a máscara plana dá quatro, é contada como a razão de indisponibilidade terrain_masked. O DEM incluído é um recorte do produto LOLA LDEM_75S_240M de domínio público, reamostrado por média de blocos { "5" } x { "5" } para { "1200" } m (data/lunar-dem/NOTICE.md). Na ausência, cada local mantém a máscara plana e cada documento é idêntico byte a byte

# text
seg-dd838d199a0d = Superfícies em forma fechada (InternalConsistency): a depressão da esfera nua, uma cratera num planalto sobre a esfera com um observador sobre o seu centro e fora dele, e um cone analítico face à sua própria rasterização. No recorte real, um lançamento de raios numpy independente (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; pré-registado em tests/fixtures/lunar_terrain/PREREGISTRATION.md, registado isoladamente em edbb9b02 antes de o script existir) concorda em cinco locais: alturas dos locais até { "1.0e-11" } m e todas as { "1800" } elevações de horizonte até { "5.5e-10" } graus face a limiares de { "1e-6" }, contagens de raios truncados exatas; isto verifica a aritmética e não o terreno. Não foi reproduzido nenhum valor publicado de horizonte polar ou de iluminação: o recorte de { "1200" } m incluído suaviza o relevo sub-quilométrico que os estudos de iluminação publicados resolvem, pelo que os horizontes do DEM são uma linha de visada MODELLED sobre um DEM real reamostrado e não um horizonte validado. O local da estação e a constelação permanecem ILLUSTRATIVE; nada aqui é uma afirmação sobre qualquer sistema real

# text
seg-d37bb01e270b = Termos de multipercurso e de hardware do recetor da estação de referência lunar

# text
seg-1103199f019b = A secção opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multipercurso dependente da elevação sigma(el) = a + b exp(-el / el0) no utilizador e na estação (a forma funcional aerotransportada RTCA DO-229, com a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graus como predefinições; na Lua todos os valores são ILLUSTRATIVE), branco no utilizador e de Gauss-Markov de primeira ordem ao longo das épocas na estação (rho = exp(-dt / tau)); ruído térmico de código DLL adiantado-menos-atrasado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); vieses entre canais por canal constantes ao longo de um ensaio, no utilizador e na estação. Os termos da estação entram nas suas correções, os termos do utilizador nas medições brutas e corrigidas, cada um no seu próprio fluxo com semente. Na ausência, cada documento permanece inalterado

# text
seg-4fbc7d86b491 = Formas fechadas e estatísticas dos sorteios do próprio modelo (InternalConsistency): a fórmula do DLL face a um cálculo manual, a forma DO-229, a diferença de linha de base zero de dois recetores, a correlação de desfasamento 1 de Gauss-Markov. Não existe nenhuma medição lunar de multipercurso ou de recetor com que comparar; os valores são ILLUSTRATIVE e nada aqui é uma afirmação sobre qualquer recetor real

# text
seg-03796cb741b6 = Crescimento do erro de efemérides da estação de referência lunar ao longo da latência de correção

# text
seg-13b0ae9a874a = A entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): uma correção aplicada latency_s depois de calculada falha o crescimento g latency_s do erro de órbita difundida, g isotrópico de taxa RMS 3-D, sorteado por satélite e ensaio no seu próprio fluxo com semente (taxa de 1 sigma da distância tau / sqrt({ "3" })), além da reprojeção da linha de visada do erro congelado. Na ausência, cada documento permanece inalterado. Uma adenda K5 à comparação de afirmações publicadas, pré-registada isoladamente, executa K5 a { "0.001" }, { "0.01" } e { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-332ceb320b65 = O sigma em forma fechada do termo de crescimento e a verificação de propagação de primeira ordem (InternalConsistency). A adenda K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, pré-registada isoladamente em 59d88248): K5 falha a todas as taxas, p95 3-D corrigido { "369.8" } m, { "2315" } m e { "22797" } m face a um limiar de { "1.5" } m ({ "292.96" } m registado sem crescimento), como indicado antes da execução. Nenhuma fonte pública dá uma taxa de crescimento lunar: ILLUSTRATIVE

# text
seg-90307f07e0ef = Modos de solução da estação de referência lunar: restrição de altura, três satélites, janela de utilizador estático

# text
seg-366c7ad03fb2 = A secção opcional [solution] de lunar-station-coverage (LRS-06): uma linha de pseudomedição de altura up . dx = e_h de 1 sigma indicado, ponderada face às linhas de distância, um mínimo de três satélites permitido apenas com ela, e uma solução de mínimos quadrados ponderados sobre as últimas window_epochs épocas com uma posição estática partilhada e um relógio por época (a resposta de um filtro para uma posição estática sem ruído de processo sobre os mesmos dados; os erros das épocas são tratados como independentes). Na ausência, a solução instantânea e cada documento permanecem inalterados. Uma adenda à comparação de afirmações publicadas com o estilo de solução das fontes, pré-registada isoladamente

# text
seg-bfe05379b7aa = A redução instantânea e os casos em forma fechada do solucionador (InternalConsistency). A adenda (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, pré-registada isoladamente em 001ca100) com uma restrição de altura de { "1" } m, três satélites e uma janela de 6 épocas (definições ILLUSTRATIVE; as fontes indicam um filtro, uma restrição de altura e três satélites mas não as suas definições): K1 a K5 falham e K6 passa, { "1" } de { "6" } como na execução registada; o erro p95 3-D corrigido de R300 desce de { "280.6" } m para { "2.11" } m (horizontal { "0.90" } m, não avaliado) e a cobertura permanece { "0" }. O pressuposto de independência da janela favorece-a. Não é uma afirmação sobre nenhum sistema real

# text
seg-611ba369ed00 = Exatidão e cobertura de estações de referência lunares face a afirmações publicadas

# text
seg-4fe4f1cffa2b = O tipo lunar-station-coverage executado sob os pressupostos públicos do material publicado sobre uma estação de referência diferencial lunar (quatro satélites de navegação em órbitas elípticas congeladas de { "24" } h, SISE de { "10" } m a { "95" } %, ruído de código de { "0.30" } m, latência de correção de { "1" } s e { "600" } s, um levantamento da estação sub-decimétrico, o local de estação de exemplo publicado, os círculos polares sul de { "300" } km e { "600" } km) e avaliado face às afirmações numéricas das fontes segundo seis limiares unilaterais pré-registados antes da execução: cobertura de todo o polo sul com p95 sub-métrico (K1, K2), p95 corrigido sub-métrico e de nível decimétrico (K3, K4), sub-métrico mantido a { "600" } s de latência (K5), e exatidão mantida de { "10" } km a { "500" } km de linha de base (K6)

# text
seg-eb6d3be85fec = Referência: as afirmações numéricas de cinco fontes públicas registadas com URL, data de obtenção, SHA-256 e licença em tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; diapositivos do IOAG Cislunar PNT Workshop { "2025" } e { "2026" }; UNOOSA ICG WG-B Lunar PNT, junho de { "2024" }), transcritas com referências de página em tests/fixtures/lunar_station_published/CLAIMS.md. Os limiares, casos e entradas foram pré-registados em tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisão { "2" }, 05bf9a19, registada isoladamente antes da execução). { "0.36" } primeira execução, um resultado (permanece MODELLED): { "1" } de { "6" } limiares passa. A cobertura é { "0.00" } em ambos os círculos face a >= { "0.95" }, e o erro p95 3-D corrigido é { "280.6" } m ({ "300" } km), e { "293.0" } m a { "600" } s de latência, face a <= { "1.5" } m. O limiar decimétrico (K4) não podia passar ao ruído de código de { "0.30" } m das fontes, o que reflete um conflito entre as fontes e não um resultado do modelo. K6 passa (razão { "1.39" } face a <= { "1.5" }), mas, sendo uma razão de duas grandezas dominadas pela geometria, não é evidência sobre a decorrelação em nenhum dos sentidos. Causa: os elementos dos satélites não são públicos, e nos elementos ILLUSTRATIVE da árvore um utilizador e a estação partilham quatro satélites acima de { "5" } graus em apenas { "8.2" } % ({ "300" } km) e { "6.3" } % ({ "600" } km) das épocas, com geometria quase singular (p95 não corrigido de { "3.8" } km face a < { "10" } m das fontes). As simulações das fontes usaram um filtro, uma restrição de altura e três satélites em visão comum, o que o tipo instantâneo não modela. A comparação não confirma nem refuta, por isso, o 'sub-métrico em todo o polo sul' publicado. Mostra que o resultado deste modelo depende de órbitas que não estão publicadas. Não é uma afirmação sobre nenhum sistema real; não é afiliado a nenhuma agência nem por ela apoiado

# text
seg-478225d0a8e1 = Núcleo de nível de proteção ARAIM lunar

# text
seg-863690a44f21 = O passo de geometria para covariância do nível de proteção lunar — (GᵀG)⁻¹ sobre a geometria com todos à vista e cada subgeometria de falha única, projetado na vertical local e no traço do bloco horizontal — e o seu núcleo estatístico: o multiplicador de detetor de Bonferroni, a cauda superior gaussiana de cada hipótese de falha e a resolução de raízes que mapeia um orçamento de risco de integridade num nível de proteção, sobre um volume de serviço lunar de 7 pontos

# text
seg-8191906fc700 = Duas implementações de terceiros consolidadas compostas, ambas executadas offline, com o fixture regenerado de ponta a ponta e verificado como idêntico byte a byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilado a partir de código C com -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverte a matriz normal por LU de Crout com pivotagem parcial, um algoritmo sem relação com o invert4() de Gauss-Jordan escrito à mão do kshana; numpy.linalg.inv (LAPACK getrf/getri) reinverte cada uma como terceira inversa independente, concordando com o RTKLIB até { "1.112e-12" } relativo. O SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) fornecem norm.isf, norm.sf (Cephes ndtri/ndtr) e optimize.brentq face à série da gama incompleta de Numerical-Recipes do kshana, à inversa por bisseção e à bisseção de 200 passos — e o sf direto do SciPy é um percurso numérico para a cauda distante diferente do { "1" } − Φ do kshana, pelo que o cancelamento na cauda profunda é medido e não espelhado. O eixo vertical é o vetor unitário radial (a definição de vertical local numa Lua esférica) e a variância horizontal é o traço do bloco horizontal, pelo que nenhuma convenção de azimute Este/Norte é partilhada. EXPLICITAMENTE NÃO VALIDATED POR ESTA LINHA: o σ_URE, o a priori de falha por satélite e a constelação ilustrativa de classe Moonlight/LCNS são entradas MODELLED entregues tal como dadas à referência independente; e a FORMA da equação de integridade MHSS de falha única é transcrita do mesmo limite publicado que o kshana implementa — uma forma fechada partilhada é um pressuposto partilhado, pelo que esta linha cobre uma avaliação errada dessa equação e não uma escolha errada dela. Não está ao alcance nenhuma implementação MHSS ARAIM de terceiros (o RTKLIB não expõe nenhum ponto de entrada de nível de proteção, não existe nenhuma distribuição PyPI desse tipo, o Stanford MAAST é MATLAB), o que é a melhoria pendente

# text
seg-0ec1699f5754 = Níveis de proteção ARAIM MHSS face a vetores de referência publicados

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = A própria equação de nível de proteção de separação de soluções com múltiplas hipóteses: mínimos quadrados ponderados com todos à vista e por modo de falha numa geometria Este/Norte/Cima com um estado de relógio por constelação, os sigmas das subsoluções, os sigmas de separação de soluções e as projeções unilaterais de viés nominal, os limiares K_fa de Bonferroni, a atribuição de risco de falhas não monitorizadas e os VPL/HPL que resolvem a equação de risco de integridade. Executável como o tipo de cenário <c1/>

# text
seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } de junho de { "2019" }), exemplo numérico trabalhado do Apêndice D — ENTRADAS publicadas (matriz de geometria de 10 satélites e 2 constelações, diagonais C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) e SAÍDAS publicadas (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } e seis intermédios de falhas de constelação), obtidas em 2026-09-20, SHA-256 da fonte 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Concordante à tolerância indicada pela PRÓPRIA referência TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT e σ_v_acc até à sua precisão impressa. O Milestone { "3" } Report ({ "2016" }) do mesmo subgrupo, Anexo A §A.IX, indica o mesmo exemplo mas é internamente inconsistente — um erro tipográfico de sinal na linha { "3" } de G (+{ "0.7477" } onde o documento de { "2019" } imprime −{ "0.7477" }; com o sinal mais, o σ_v_acc do próprio documento resulta em { "0.8690" } m face ao seu { "1.47" } m publicado), e um K_fa_3 avaliado a { "57" } modos de falha enquanto o documento indica N_fault_max = { "1" }, isto é, { "12" }, pelo que o seu EMT segue o limiar de 57 modos e o seu VPL/HPL não. Nenhuma implementação aderente à norma consegue reproduzir todas as suas saídas em simultâneo. Os seus intermédios de geometria reproduzem-se exatamente e os seus níveis de proteção são registados como discrepâncias medidas (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), excluídas do valor de aceitação; a tolerância não foi alargada para as absorver. ÂMBITO: apenas N_fault_max = { "1" } — subconjuntos de falhas de múltiplos eventos são recusados e não truncados, e a exclusão, a verificação de consistência por qui-quadrado e o passo de reatribuição de dupla contagem permanecem MODELLED

# text
seg-7bfcb5c6a985 = ARAIM com hipóteses de falha simultânea de vários satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: a regra de determinação de subconjuntos do ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorizados com menos remoções primeiro) generalizada de pares para combinações simultâneas de até max_order eventos de satélite e de constelação, com o a priori exato P_no fault prod q_e; add_v42_protection_levels_to_order executa sobre ele o percurso de nível de proteção do ADD v4.2 (a ordem { "2" } é exatamente o percurso existente). raim::araim_subset_raim (opcional): RAIM avançado sobre esse conjunto de hipóteses, cada subconjunto monitorizado como um modo (p_fault, T, b, sigma) na soma de risco de integridade, subconjuntos não observáveis movidos para o risco não monitorizado, o orçamento escalado pela atribuição do ADD do risco não monitorizado, e o subconjunto de maior separação normalizada comunicado quando é detetada uma falha. Os a priori que exigem subconjuntos mais profundos do que max_order são recusados, nunca truncados

# text
seg-6c6076ea1eee = Consistência interna (InternalConsistency): a redução de ordem 2 ao percurso ADD v4.2 verificado pelo MAAST, rederivação independente dos a priori e uma falha construída de dois satélites. Não foi feita nenhuma execução de MAAST ou RTKLIB para além de pares, pelo que os conjuntos de hipóteses mais profundos e os níveis de proteção do RAIM de subconjuntos não são verificados externamente. araim_subset_raim partilha as simplificações de araim_dual_raim (um sigma para integridade e exatidão, um relógio, a cauda normal simples): não é aderente à norma do ADD

# text
seg-48ca01332f8f = RAIM a par das figuras de mérito de holdover do relógio

# text
seg-890f1006a75d = A secção opcional [integrity] do tipo clock (clock_integrity::run): a partir de um local indicado e de presets de constelação (geometry::sky_geometry), em cada época de integridade enquanto a linha temporal GNSS não está negada, RAIM instantâneo (raim::snapshot_raim: teste de qui-quadrado de paridade, níveis de proteção de declive) sobre os satélites acima da máscara com resíduos gaussianos com semente do sigma indicado e um viés opcional indicado; um bloco integrity_fom separado com veredictos por época, níveis de proteção e disponibilidade. As épocas negadas são comunicadas como indisponíveis, nunca extrapoladas; as figuras de mérito de holdover permanecem inalteradas e, sem a secção, a saída é idêntica byte a byte

# text
seg-c2860bf4b562 = Consistência interna (InternalConsistency): os níveis de proteção são os de snapshot_raim, que é validado face ao RTKLIB na sua própria linha, recalculados sobre a mesma geometria; comportamento sem falhas e com falhas injetadas. O céu é uma geometria de preset representativa (não um almanaque datado), os resíduos são sintéticos e o sigma, os limites de alerta e as probabilidades são entradas indicadas; nada aqui é uma afirmação sobre a disponibilidade de um recetor real

# text
seg-9cbb4ee7588a = Observabilidade espacial, ruidosa e multifamília do comprimento de arco cislunar

# text
seg-5ebd771deef8 = O limiar de comprimento de arco de observabilidade cislunar no CR3BP ESPACIAL de seis estados e não no planar de quatro estados, em famílias DRO, halo L2 e halo quase retilíneo L2, com ruído de medição a entrar no Gramiano e DOIS critérios comunicados porque não existe um único honesto: o critério de característica publicado, que é comprovadamente invariante a um sigma de medição homocedástico (o branqueamento multiplica a matriz de observabilidade por um escalar, deixando inalterados o espetro relativo de valores singulares e, portanto, a característica, o defeito e a condição), e um critério de estimabilidade — o primeiro arco em que a incerteza formal de 1σ da posição do estado inicial do principal desce abaixo de um limite indicado — que é o que se move com o ruído. Cada limiar transporta o enquadramento da grelha de épocas em que se situa; um critério não atingido é null com uma razão. O modo planar permanece a predefinição e as famílias fora do plano são recusadas nele em vez de achatadas para um estado que não as consegue representar

# text
seg-046231819882 = Uma característica independente por forma escalonada por eliminação gaussiana com pivotagem parcial confirma cada veredicto de característica de seis estados — um algoritmo diferente que não partilha código com o percurso de valores próprios/SVD em teste. A matriz de transição de estado do CR3BP de { "6" }×{ "6" } que isto compõe transporta a sua própria referência independente ReferenceImpl face à integração variacional do SciPy, e as condições iniciais de halo/NRHO provêm de um corretor que reproduz a órbita Gateway L2 sul publicada de { "9" }:{ "2" }. O ramo existente do filtro de informação de raiz quadrada NÃO é contado como corroboração: consome os mesmos Jacobianos e reduz-se à mesma matriz normal, pelo que é uma verificação de consistência entre duas máquinas numéricas, e a etiqueta de extensão emitida di-lo. NÃO ancorada externamente, e por isso ExternalDataset é recusado em vez de emprestado da linha da STM: os próprios comprimentos de arco limiar dependem do desenho de constelação MODELLED, da grelha de épocas e — mensuravelmente, até { "40" }× — da tolerância de valores singulares. O valor planar publicado de { "2.09" } h é reproduzido exatamente a rel_tol = { "1e-6" } e é ele próprio dependente da tolerância ({ "10.25" } h a { "1e-4" }, { "0.42" } h a { "1e-8" }), o que é uma propriedade do critério e não da órbita. Nenhum conjunto de dados público publica um limiar de observabilidade de comprimento de arco para uma constelação cislunar escolhida. RESULTADO MEASURED: o limiar espacial de seis estados é { "22.17" } h para a NRHO L2 e { "40.42" } h para o halo L2, e NÃO EXISTE para a família DRO planar sobre a qual a afirmação publicada foi derivada — característica { "4" } de { "6" } com defeito de datum { "2" } e dois valores próprios exatamente nulos, um defeito estrutural que nenhum comprimento de arco recupera

# text
seg-e250321394bc = Erro de previsão da orientação da Terra de estilo operacional, medido previsto versus final

# text
seg-0e443d241460 = Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para o UT1; Chandler, anual e semianual para o polo — extrapolado com o último resíduo dentro da janela levado para a frente: a classe que o IERS Bulletin A usa, em lugar do preditor de persistência em que o horizonte publicado assentava. Avaliado da única forma honesta: uma previsão para T+h construída a partir de linhas rápidas do Bulletin A em T ou antes, medida face ao Bulletin B final PUBLICADO POSTERIORMENTE em T+h, com a persistência avaliada sobre o conjunto idêntico de épocas face aos finais idênticos a seu lado. Uma época-alvo sem final publicado é descartada em vez de reavaliada face à coluna rápida; um termo periódico que a janela não consegue restringir é comunicado como rejeitado com os ciclos que realmente abrange; uma janela incompleta é recusada em vez de silenciosamente encurtada

# text
seg-822a1ce99154 = Três percursos independentes, nenhum deles um valor publicado de exatidão de previsão. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única forma de exercitar a maquinaria periódica, dado que nenhuma série registada é suficientemente longa para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados em forma fechada de manual, álgebra diferente da resolução matricial em teste, sobre linhas reais. ({ "3" }) As linhas genuínas arquivadas de previsão do Bulletin A que o produto real de { "2026" } publica, comparadas por antecedência como estatística de CONCORDÂNCIA e explicitamente não como erro: { "0.256" } ms a { "1" } dia, { "0.695" } ms a { "2" } dias, { "1.252" } ms a { "3" } dias, a derivar para { "3.885" } ms a { "9" } dias. Portanto, esta é a CLASSE do Bulletin A, próxima a antecedência curta, não o Bulletin A. Os resíduos de previsto versus final são grandezas medidas reais sobre linhas reais do IERS, mas a sua magnitude é verificada apenas face ao SENTIDO da comparação, nunca face a um valor de exatidão publicado pelo IERS — ler um produto real é proveniência e não uma referência independente. MEASURED: ao dia { "1" } o preditor operacional dá { "3.78" } m de erro no referencial lunar contra { "11.39" } m da persistência ({ "3.01" }×), ao dia { "2" } { "10.23" } m contra { "21.72" } m ({ "2.12" }×), ao dia { "3" } { "20.33" } m contra { "30.57" } m ({ "1.50" }×) — e é PIOR para além de três dias ({ "0.87" }× aos { "5" } dias, { "0.43" }× aos { "10" }), o que o relatório emite em vez de mostrar apenas os horizontes que o favorecem. NÃO reproduzidos: o filtro autorregressivo de resíduos e a redução tabelada das marés zonais, a janela operacional de 365 dias é inalcançável com os dados registados, e NÃO existe NENHUMA versão arquivada anterior da série neste repositório — pelo que a tabela de versões arquivadas não comunica linhas em vez de avaliar uma sintetizada. { "0.30" } comparação externa, um resultado (permanece MODELLED): avaliado face aos mesmos finais sobre { "178" } emissões arquivadas do Bulletin A com a janela predefinida de 15 dias da crate, o MAE de UT1 do preditor é 2.4x a 12.6x o do Bulletin A a { "1" } a { "10" } dias (limiar 1.5x) e { "5.32" } ms a { "10" } dias, fora do intervalo de { "0.36" } a { "3.13" } ms do 2.º EOP PCC; o polo é 1.5x a 1.85x o do Bulletin A (dentro de 1.5x apenas aos { "6" } e { "7" } dias); { "19" } de { "21" } condições pré-registadas falham. Correção à via ({ "3" }): as linhas do produto de { "2026" } com que foi comparada transportam o indicador IERS I (medido), não P, pelo que esses valores de concordância são face a valores rápidos medidos e não a previsões do Bulletin A. { "0.30" } ronda { "2" }, um preditor de mínimos quadrados mais autorregressivo com as marés zonais removidas analiticamente, face a { "178" } emissões arquivadas do Bulletin A ao limiar da ronda 1 (pré-registado c93605b4), um resultado (permanece MODELLED): { "12" } de { "21" } condições verificam-se; o MAE de UT1 é { "1.73" } a 2.11x o do Bulletin A a { "2" } a { "10" } dias (limiar 1.5x) enquanto o polo está dentro de 1.27x em todas as antecedências. { "0.30" } revisão: com a entrada offline agora classificada pelo indicador IERS, os valores de concordância da via ({ "3" }) são face a previsões reais do Bulletin A (0.256/0.695/1.252/3.885 ms a 1/2/3/9 dias face a linhas rápidas -> 0.133/0.421/0.839/2.786 ms)

# text
seg-f4efd94dd746 = Datum de referencial lunar a partir de uma campanha de observação

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = O datum de Helmert de sete parâmetros propagado a partir de uma CAMPANHA DE OBSERVAÇÃO SIMULADA em vez de recuperado de uma transformação injetada. Estações terrestres observam um catálogo com origem identificada de balizas à superfície lunar segundo um calendário explícito; as derivadas parciais de atraso do VLBI lunar são acumuladas numa matriz de informação de Fisher de coordenadas das balizas e enviadas através do desenho de Helmert A = [I₃ | [p]ₓ | p] para H = AᵀM_bA, pelo que a exatidão de datum comunicada é função do programa de observação — exatamente linear no sigma de atraso e monótona no arco através da libração que o relatório MEDE. O defeito de datum é o assunto e não uma nota de rodapé: a característica, o defeito, o número de condição, o espetro, as direções inobserváveis na base de sete parâmetros, a direção mais fraca mesmo com característica completa e a parte de cada parâmetro nela são emitidos em cada execução, e qualquer parâmetro que a campanha não restrinja é publicado como NULL com um estado. A correlação do erro das balizas é MEASURED e não assumida — exatamente nula com as estações fixas, e impressa com o seu custo quando são estimadas. Executável como o tipo de cenário <c1/>

# text
seg-8eedf0240350 = Identidades em forma fechada e um percurso independente no próprio repositório, sem referência independente externa invocada. O desenho de Helmert — a única derivada nova no módulo — é rederivado por diferença finita central de lunar_frame_realise::apply_helmert, um caminho que não partilha nenhuma expressão com a forma analítica. A acumulação que compõe é a de lunar-vlbi-fim, cujo Jacobiano é diferenciado por diferenças finitas face a lunar_vlbi::vlbi_delay_s aí, e cujo núcleo de álgebra linear está separadamente ancorado externamente face ao numpy em tests/fim_observability_reference.rs — esta linha não pede emprestado nenhum dos estatutos. A referência independente de física é estrutural e não numérica: uma derivada parcial de atraso de baliza é a DIFERENÇA de campo próximo de dois vetores unitários quase paralelos, pelo que a direção de translação pior determinada TEM de ser a direção fixa ao corpo para a Terra, e o teste afirma a resposta calculada face à direção medida em separado. MEASURED: sigma de translação derivado da campanha { "6.3975" } m contra o erro de recuperação de { "0.3125" } m do cenário de transformação injetada ({ "20.5" }× mais apertado), enquanto a rotação e a escala vão no sentido OPOSTO, { "2.32" }× e { "13.5" }× mais folgadas — o percurso injetado assume um único sigma isotrópico e por isso espalha o seu erro uniformemente pelos sete parâmetros, o que o observável de atraso não faz. Característica 7/7 mas condição { "3.8e5" }, com uma direção { "99.57" } % pura translação-em-direção-à-Terra e quarenta vezes pior do que qualquer outra. O QUE ESTA LINHA NÃO AFIRMA: que o valor da campanha esteja certo em termos absolutos. Estabelece que o valor agora É DERIVADO de um calendário, de uma geometria e de um modelo de erro e não de uma resposta plantada. Permanece ReferenceImpl/MODELLED: não existe nenhum par publicado de campanha VLBI lunar mais covariância de datum, a rede de estações e o sigma de atraso são entradas ILLUSTRATIVE (o catálogo de balizas tem origem identificada, a campanha não), as observações são tratadas como independentes enquanto a troposfera e o relógio de uma sessão real são correlacionados entre varrimentos próximos, e as efemérides, os relógios, a troposfera e os parâmetros de orientação da Terra são mantidos FIXOS. { "0.30" } comparação externa, um resultado (permanece MODELLED): com cada linha do Jacobiano das balizas reconstruída a partir de tempos de luz NAIF SPICE (DE440, ITRF93, MOON_ME; pré-registado { "50863551" }), o calendário, a característica de Helmert, os sigmas de datum (dentro de { "4.7e-3" }), a condição, a direção mais fraca ({ "0.07" } graus), a varredura de libração e a ordenação dos arcos concordam em seis cenários dentro dos { "1" } % / { "0.2" } / { "0.05" } graus pré-registados. O NumPy sobre o Jacobiano do motor registado concorda até { "3e-14" } onde as estações são fixas. Com as estações estimadas, difere em { "6.8e-6" } face a um { "1e-9" } pré-registado, cuja premissa de número de condição estava errada (condição de Helmert { "2.1e8" }; rotas NumPy independentes discordam em { "3e-6" }; não se exclui uma contribuição da alternativa de pseudoinversa { "1e-9" } do motor), pelo que a linha não é promovida com base nesse pré-registo. { "0.36" } novo registo a um limiar escalado pela condição (pré-registado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir do condicionamento da informação conjunta e da sua redução de Helmert), um resultado (permanece MODELLED, NOT MET): o passo { "0" } exclui a alternativa de pseudoinversa para a diferença de { "6.8e-6" } (nenhuma matriz a montante da matriz de Helmert recorre à alternativa nos seis cenários originais, margem mais apertada de um fator { "2.6" }), o ramo SPICE continua a verificar-se em todos os seis, e o NumPy concorda dentro do limiar em seis de oito cenários (predefinição, os dois arcos, o sigma de atraso 3x, o defeito colinear e a nova execução com estações fixas em 2026-12-01; pior { "0.13" } do seu limiar). Falha em stations_estimated (sigmas de datum até { "6.8e-6" }, condição { "9.1e-6" }, norma com independência descartada { "3.5e-6" }, face a t = { "5.9e-7" }), e na nova data a baliza do polo sul não tem nenhuma observação, pelo que a informação da baliza tem deficiência de característica (alternativa de pseudoinversa a montante da matriz de Helmert em ambos os cenários novos) e a referência independente NumPy inalterada não consegue avaliar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-ca481f2d8f9e = Corroboração por estimador independente do limiar de comprimento de arco cislunar

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Um estimador de mínimos quadrados em lote que RECUPERA o estado inicial do principal a partir de medições entre satélites simuladas sobre prefixos crescentes da mesma grelha de épocas que a tabela de característica versus arco usa, com as derivadas parciais das medições tomadas como diferenças finitas centrais do modelo direto composto. Não consome nada da maquinaria com que o limiar foi medido — nenhuma linha de Jacobiano analítica, nenhuma matriz de transição de estado variacional, nenhuma decomposição em valores singulares ou próprios, nenhuma tolerância de característica, nenhum filtro de informação de raiz quadrada — e partilha apenas a dinâmica, as condições iniciais, o observável escalar e a grelha de épocas, cada um nomeado no documento emitido. Dois critérios, ambos varridos: recuperação sem ruído (o análogo da característica) e estimabilidade de Monte Carlo (o análogo da estimabilidade, medida face a uma verdade conhecida e não prevista a partir de uma covariância). Executável como o tipo de cenário <c1/>

# text
seg-60e30948cee7 = Um estimador separado nesta base de código com um algoritmo diferente e um percurso de código disjunto: Gauss-Newton ponderado não linear com derivadas parciais por diferenças finitas, com o veredicto lido como um erro medido de recuperação de estado em km e mm/s. Não tem nenhuma expressão em comum com o percurso de característica e covariância do Gramiano, e a separação é IMPOSTA por uma salvaguarda de texto de código-fonte e não afirmada. MEASURED na grelha DRO planar publicada: o critério de ESTIMABILIDADE é CORROBORATED — a fronteira de Monte Carlo medida é { "5.739130" } h face ao valor formal de { "5.739130" } h (razão { "1.0000" }), e o RMS medido reproduz o 1σ formal ao longo de { "21" } comprimentos de arco até uma razão de média geométrica de { "0.9804" }. O critério de CARACTERÍSTICA NÃO é corroborado como fronteira de recuperabilidade: o estimador recupera a partir de { "0.782609" } h face aos { "2.086957" } h do Gramiano, razão { "0.375" }, e a { "1.826087" } h — o último prefixo que a leitura de característica pontua { "3" } de { "4" } — recupera até { "1.96e-5" } do deslocamento a priori. A fronteira de recuperação não se move ao longo de três décadas do seu próprio limite enquanto o limiar de característica abrange de 'nunca' a { "0.782609" } h ao longo de quatro décadas de rel_tol, e os dois coincidem exatamente a rel_tol = { "1e-8" }. Esse intervalo foi inicialmente registado como atingindo { "0.260870" } h; esse valor era um ARTEFACTO, produzido por uma leitura de característica que contou { "4" } direções a partir de { "2" } linhas de medição abaixo do piso de ruído de f64, e é aqui corrigido em vez de deixado de pé. A leitura de característica é agora limitada pela desigualdade de Sylvester com a razão emitida, e o intervalo corrigido satura exatamente no arco onde o estimador independente recupera, o que reforça a validação cruzada desta linha em vez de a enfraquecer: o { "1e-6" } publicado é uma CONVENÇÃO conservadora de valores singulares e não uma afirmação sobre a recuperabilidade. O mesmo padrão espacialmente: NRHO { "9.290323" } h face a { "21.677419" } h, halo { "22.978723" } h face a { "39.829787" } h, com a estimabilidade a concordar exatamente em ambos. O DRO planar de seis estados não recupera em nenhum arco, a reproduzir de forma independente o defeito de datum estrutural dessa família a partir de um estimador a quem nada foi dito sobre ele. NÃO ancorado externamente — a dinâmica e as condições iniciais são partilhadas com a análise em teste e nenhum conjunto de dados público publica tal limiar — pelo que ExternalDataset é recusado

# text
seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) e inv em { "201" } entradas SPD registadas (tests/fixtures/gls_whitening_numpy_oracle) verificam o fator escrito à mão, o resíduo branqueado e o operador de branqueamento; o quadrado de Mahalanobis é verificado face a solve(Omega, r), que não usa Cholesky, pelo que a identidade z^T z = r^T Omega^-1 r é confirmada por um caminho separado. Tudo dentro de { "1e-12" } em termos relativos (pior caso { "7.9e-16" }), com a tolerância fixada antes da comparação. O maior número de condição é { "19.3" }, pelo que as matrizes mal condicionadas não estão cobertas. O branqueamento GLS/Aitken { "1935" } é citado.

# text
seg-1a3bb032960f = Estatística de consistência de modo comum (falha de referência partilhada invisível à separação)

# text
seg-1b03f522b8fc = Estatística de pontuação ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para um desvio de modo comum que a separação de soluções (contrastes ortogonais a { "1" }) não consegue ver; um desvio de modo comum aumenta-a, enquanto as separações entre pares se mantêm planas

# text
seg-d79071a5d9ec = Reprodução independente em numpy da estatística + teste de propriedade de que uma injeção de modo comum a aumenta (InternalConsistency). Cenário modelado. { "0.30" } ronda { "2" } (pré-registado f9aa360d), bloqueado (mantém-se MODELLED): o numpy { "2.3.5" } LAPACK gesv reproduz o valor da estatística em { "261" } casos registados (dentro de { "3.5e-15" } com bom condicionamento, { "1.2e-9" } com condição até { "6.1e7" }); a lei nula qui-quadrado({ "1" }) é um teorema citado e as separações planas entre pares são uma identidade sem saída do motor a comparar, pelo que a delimitação aguarda uma decisão do responsável

# text
seg-91fc18cde833 = Limite de modo comum indetetável de resíduo fora de Omega

# text
seg-0cc2c0f033c8 = Teto de modo comum indetetável: a maior magnitude de falha ao longo de uma direção d que escapa TANTO à separação (alpha_ss = T_ss / norma de contraste branqueada de d) COMO à estatística de modo comum (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), indicada como min(alpha_ss, alpha_cm). Sob uma Omega definida positiva, as duas direções cegas (d proporcional a { "1" } e { "1" }^T Omega^-1 d = { "0" }) são mutuamente exclusivas, pelo que o teto é FINITO para todo o d não nulo; só é infinito para uma direção nula ou para uma Omega que não seja definida positiva. Uma direção fora do eixo comum modelado é cega apenas à estatística de modo comum e é limitada pela separação

# text
seg-b67c71daa7de = P2: numpy { "2.3.5" } linalg.solve (LAPACK gesv, LU sem Cholesky) recalcula alpha_ss (o limiar sobre a norma de contraste branqueada de d depois de removido o seu coeficiente de modo comum GLS), alpha_cm e o seu mínimo em { "256" } entradas (Omega, d, T_ss, T_cm) registadas (tests/fixtures/gls_outside_omega_bound_numpy_oracle), incluindo direções de modo comum puro, direções fora do eixo comum modelado e os casos de direção nula e de matriz não definida positiva, que têm de dar +inf; pré-registado (d070699a; adenda 8a44267b, antes de qualquer comparação, a reformular a forma matricial); tolerâncias fixadas antes da comparação. O texto da capacidade foi corrigido por decisão do responsável (2026-10-02): dizia que o limite é infinito para uma direção fora do eixo comum, o que contradizia o código e esta comparação. Que o detetor idealizado de contraste único seja um limite inferior da magnitude indetetável de um detetor de subconjunto real mantém-se modelado

# text
seg-a7a33523bb1c = Identificabilidade do datum lunar - álgebra linear da decomposição

# text
seg-bd59cc76557a = Marginal por complemento de Schur do bloco { "{" }lunocenter-X, scale{ "}" } da Fisher do datum de Helmert de 7 parâmetros: a métrica escalar de degenerescência lambda_min(S), o CRLB da origem-X e a correlação origem-escala

# text
seg-0f7e4fb31c44 = Referência independente SciPy/NumPy (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): o complemento de Schur, os seus valores próprios e a inversa 2x2 calculados por uma biblioteca independente. Limitada à ÁLGEBRA LINEAR da decomposição; as MAGNITUDES da correlação e do CRLB lunares a partir de geometria real continuam MODELLED.

# text
seg-3359eee713a5 = Classificação do espaço nulo do datum lunar (aditividade de posto LLR + elevação do defeito por libração)

# text
seg-6d722c176052 = Classificação do problema de datum de medição de distâncias interna: uma única observação de distância contribui com posto { "1" } (espaço nulo de dimensão 6); o par origem-X e escala é quase nulo e a libração física DE440 eleva o defeito a zero, enquanto o par se mantém quase degenerado

# text
seg-ae6dc4e6ea8b = Estrutura geométrica reproduzida pelo motor mais a identidade de Schur 2x2 em forma fechada; consistente na ESTRUTURA com Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cujas magnitudes indicadas NÃO são aqui reproduzidas. A classificação é estrutural; as magnitudes da correlação e do CRLB sob geometria real são MODELLED (coordenadas e orientação dos refletores mantidas fixas). { "0.30" } comparação externa, uma constatação (mantém-se MODELLED): face a Sosnica et al. { "2025" }, a correlação origem-escala da Fisher de distâncias (-0.993 / -0.988) está a menos de { "0.05" } do valor publicado de -0.97, mas na geometria de cinco refletores do próprio artigo a correlação de Helmert de 7 parâmetros com pesos iguais é de -0.78 (o valor publicado assenta em erros por refletor que o artigo não apresenta), e o CRLB da origem ({ "0.6" } a { "1.2" } mm com ruído de distância de { "3" } mm) fica { "96" } a { "98" } % abaixo dos { "3.07" } cm do artigo, face a uma tolerância de { "20" } %. Magnitudes não reproduzidas

# text
seg-3fd19007ea67 = Informação de datum lunar multitécnica (LLR + VLBI lunar + distância de orbitador)

# text
seg-23d0dd7d0666 = Linhas do Jacobiano do datum para a distância LLR a refletores na Terra, o atraso diferencial VLBI lunar de duas estações e a distância orbitador-baliza sobre o datum de 7 parâmetros, combinadas numa única Fisher pré-condicionada de forma consistente; demonstra que o seguimento fora da radial (orbitador / diverso em profundidade) quebra a degenerescência entre origem-X e escala, enquanto o VLBI transversal só ajuda indiretamente

# text
seg-b2f5715c4577 = Verificações cruzadas analítico-versus-diferenças finitas das derivadas parciais de cada técnica (internas); a DIREÇÃO da melhoria é um facto geométrico. As localizações das balizas, os calendários e o ruído são MODELLED/representativos (ver tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = Fornecedor da orientação lunar de eixos principais DE440

# text
seg-ebe4519a40e4 = Rotação de MOON_PA_DE440 para J2000 em épocas arbitrárias entre 2014-01-01 e 2030-12-31 TDB, por interpolação geodésica R0·Exp(f·Log(R0ᵀR1)) entre os nós de uma série diária registada de { "6" } 209 linhas (as funções try_ devolvem OrientationSpanError fora dela, as infalíveis entram em pânico; nunca trunca); incorporada em tempo de compilação, pelo que não há E/S de sistema de ficheiros em tempo de execução e a compilação WASM a inclui

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 até spiceypy { "8.2.0" }, executado como ferramenta): pxform de MOON_PA_DE440 para J2000 a avaliar diretamente o PCK binário da JPL moon_pa_de440_200625.bpc, com o próprio kernel de referencial da NAIF moon_de440_250416.tf, em { "2 000" } épocas aleatórias fora dos nós na janela incorporada. O ângulo de rotação entre as matrizes do Kshana e do SPICE está dentro de { "1.7e-5" } rad ({ "30" } m ao raio médio de { "1737.4" } km, fixado antes da comparação); o pior valor medido foi { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, e o pior valor foi { "1.75e-6" } rad em { "6 000" } épocas adicionais sorteadas pelo verificador. Os nós diários foram eles próprios extraídos do mesmo kernel (scripts/gen_de440_moon_pa.py, SHA-256 do fixture 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), pelo que esta comparação testa a interpolação entre eles, que é a afirmação. Encontrado por esta comparação e corrigido: a anterior interpolação linear elemento a elemento com Gram-Schmidt mantinha o eixo mas não o ângulo da rotação de { "13.2" } deg/dia e tinha um erro até { "2.0e-4" } rad ({ "340" } m) perto dos pontos de quarto; o valor anterior de cerca de { "14" } m vinha de uma proteção que apenas amostra os pontos médios dos intervalos. A série cobre 2014-01-01 a 2030-12-31 e dá erro fora dela (ronda { "2" }); os seus nós de 2024-2025 regeneram-se a partir do mesmo kernel com { "4.3e-13" }. A comparação SPICE fora dos nós acima cobre apenas 2024-2025, que é a janela validada; os nós alargados vêm do mesmo kernel e script mas não são comparados fora dos nós. Um substrato de geometria para análise de identificabilidade, não um produto de orientação submétrico

# text
seg-ab96cfc8d48c = Substrato de geometria do datum LLR lunar (refletores de eixos principais, estações terrestres, derivadas parciais analíticas da distância)

# text
seg-40e91288f81a = Os cinco conjuntos de retrorrefletores do lado visível em metros no referencial do corpo PA e as estações terrestres LLR em coordenadas geodésicas; a colocação dos refletores do referencial do corpo para o inercial através da orientação PA DE440; as derivadas parciais analíticas da distância Terra-refletor em relação ao datum de 4 parâmetros; e a matriz de Fisher só de LLR que exibe a degenerescência entre lunocentro-X e escala que motiva a análise de 7 parâmetros

# text
seg-89ce1f95d9f6 = O cálculo é verificado internamente: cada derivada parcial analítica face a uma diferença finita e o caso de datum nulo face à distância nominal. O CATÁLOGO é verificado externamente e de forma independente - as coordenadas de eixos principais DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) são verificadas por cruzamento com a Tabela { "6" } do memorando de coordenadas de superfície DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído por máquina de um PDF verificado por SHA-256 através de tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) e concordam até { "1.12" } m, enquanto a realização de Terra média dos mesmos cinco conjuntos difere em { "672" } a { "871" } m. A ESTRUTURA DE DEGENERESCÊNCIA é verificada face a um resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que indica para o referencial lunar de eixos principais um coeficiente de correlação entre lunocentro-X e escala de r = -0.97, e que o LLR não consegue atingir o centro de massa real da Lua com uma exatidão melhor do que { "12" } cm por causa dessa correlação. Este módulo recupera a mesma estrutura (|corr(t_x, scale)| entre { "0.9" } e { "0.9999" }, defeito de datum <= { "1" }) a partir de um projeto de Fisher só de LLR. A corroboração é entre efemérides, não uma viagem de ida e volta: o artigo combina INPOP21a, DE430 e EPM2021, ao passo que este módulo é conduzido pela libração DE440. O que NÃO é reproduzido é a magnitude - a correlação aqui é de cerca de -0.988 face a -0.97 no artigo, e o CRLB de 4 parâmetros é submilimétrico face ao piso atingido de { "12" } cm do artigo, porque a orientação e as coordenadas dos refletores são aqui mantidas fixas e lá são resolvidas. Apenas estrutura de geometria e de degenerescência; nenhuma afirmação de exatidão sobre um datum resolvido. { "0.30" } comparação externa: as partes de distância medida deste módulo (reflectors(), stations_itrf(), a colocação PA DE440 e o tempo de luz baricêntrico llr_bcrs_one_way_m) são validadas na sua própria linha, modelo de distância medida LLR, face a { "192" } pontos normais ILRS (RMS de { "2.81" } m face a { "10" } m). Esta linha mantém-se MODELLED porque a comparação com medições não exercita o resto da sua afirmação. O catálogo de estações geodésicas stations() arredonda o APOLLO a { "0.001" } deg; com um tempo de luz geocêntrico dá { "22.7" } m nos mesmos pontos (teste reflector_ranges_against_ilrs_normal_points; { "96" } m com a anterior interpolação de orientação elemento a elemento). As derivadas parciais analíticas da distância e a Fisher só de LLR são calculadas através de llr_range_m e reflector_inertial com a série analítica da Lua (ephem::moon_position, cerca de { "0.3" } deg do GCRS) e sem tempo de luz

# text
seg-a78ba110b64c = Modelo de distância medida LLR (catálogo de refletores, estações ITRF2020, colocação de eixos principais DE440, tempo de luz baricêntrico IERS { "2010" })

# text
seg-c9827c1a427b = A distância unidirecional estação terrestre-refletor de um ponto normal de telemetria laser lunar: os cinco conjuntos de retrorrefletores do lado visível em metros no referencial do corpo de eixos principais (PA) DE440 (lunar_llr_geometry::reflectors); as estações de stations_itrf(), a saber Grasse { "7845" } e Matera { "7941" } a partir de ITRF2020 na época { "2015.0" } com as suas velocidades, colocadas no Sistema de Referência Celeste Geocêntrico (GCRS) pela transformação IERS { "2010" } com movimento polar do Bulletin A (lunar_vlbi::station_inertial_position_itrs), e APOLLO { "7045" } na sua posição geocêntrica aproximada publicada pelo operador (sem velocidade); a colocação dos refletores do referencial do corpo para o inercial através da orientação PA DE440 (lunar_orientation::try_de440_moon_pa_body_to_inertial, que dá erro fora de 2014-2030); e o tempo de luz baricêntrico da Secção { "11.2" } das IERS Conventions { "2010" } (lunar_llr_geometry::llr_bcrs_one_way_m: a transformação corpo-BCRS da Eq. { "11.19" } da estação e do refletor, e o atraso de Shapiro da Eq. { "11.17" } do Sol, da Terra e da Lua). ENTRADAS, que não fazem parte da afirmação: os estados e potenciais baricêntricos da Terra, da Lua e do Sol (DE440 através do SPICE), o UT1-UTC e o movimento polar do IERS e o tempo de ida e volta medido convertido de TT para TDB. DO LADO DA INFRAESTRUTURA DE ENSAIO, que não faz parte da afirmação: o atraso zenital de Mendes-Pavlis com mapeamento FCULa, no teste, com a elevação do catálogo geodésico stations(). Não modelado: marés, excentricidades das estações, termos térmicos dos refletores

# text
seg-536c75eebae3 = Medidos: { "192" } pontos normais lunares ILRS CRD v2 (EUROLAS Data Center, DGFI-TUM, 2024-04 a 2024-06; Grasse { "151" }, APOLLO { "32" }, Matera { "9" }; registados literalmente com SHA256SUMS). A distância unidirecional prevista é comparada com c vezes metade do tempo de ida e volta medido em TDB. Limiar fixado antes da comparação: RMS no máximo de { "10" } m sobre todos os { "192" } pontos E sobre os { "160" } pontos das duas estações ITRF2020 isoladamente. O limiar provém da terceira adenda de pré-registo 3e0f5cdf, registada antes da alteração do motor e da execução; o valor de { "10" } m mantém-se inalterado desde a ronda { "1" }. Medido: { "2.81" } m (média { "2.67" } m) em todos os pontos; { "2.96" } m nas estações ITRF2020; APOLLO { "1.94" } m; fatia de { "2015" } ({ "349" } pontos, secundária) { "3.82" } m. Mutação: anular as parcelas de Shapiro do Sol dá { "10.19" } m, o que falha. Histórico, divulgado: { "96" } m com interpolação de orientação elemento a elemento; { "22.7" } m após interpolação geodésica com o catálogo geodésico; { "10.94" } m com estações ITRF2020 e movimento polar mas com tempo de luz geocêntrico (um desvio comum de +{ "10.9" } m). O modelo baricêntrico foi escrito depois de este desvio ter sido visto. É o modelo publicado da Secção { "11.2" } do IERS { "2010" }, sem parâmetros livres. A terceira adenda substituiu uma condição autoimposta de tudo ITRF2020/SLRF2020 depois do resultado BLOCKED. O RMS só das ITRF2020 passa sem o APOLLO, que não tem solução ITRF2020 nem SLRF2020, e cuja posição é a aproximada indicada pelo operador. Permanece um desvio comum de +{ "2.7" } m, abaixo do limiar e não afinado. O limiar é folgado relativamente ao resultado: um termo solar em falta de { "7.6" } m continua a dar { "10.19" } m. Os termos abaixo do limiar não são resolvidos um a um: com o movimento polar anulado o RMS é de { "6.15" } m (estações ITRF2020 { "5.98" } m) e, com a transformação da Eq. { "11.19" } removida, é de { "2.96" } m; ambos continuariam a passar. As velocidades das estações e os termos de Shapiro da Terra e da Lua são ainda mais pequenos. A comparação valida a distância unidirecional montada a { "10" } m de RMS e o termo de Shapiro solar, não cada componente listado

# text
seg-9b1dfa736cb6 = Calibre acoplado de referencial lunar e escala de tempo: o espaço nulo conjunto de datum espacial, desvio de relógio e taxa de relógio

# text
seg-a000ef6ab2e0 = assemble_coupled_info constrói a Fisher acoplada de 9 parâmetros sobre [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space devolve uma decomposição invariante à base do seu espaço nulo em dimensões apenas espaciais, apenas temporais e genuinamente acopladas, mais a norma de acoplamento do projetor espacial-para-temporal; coupled_marginal_eigs dá a marginal por complemento de Schur { "{" }scale, offset{ "}" }. Nas redes registadas, o motor indica um datum de posto completo (defeito { "0" }) para o caso bem posto e um defeito exato de uma única direção de taxa para o caso de época única (tempo decorrido nulo, pelo que a taxa é inobservável por construção), e calcula a marginal { "{" }s, d_tau{ "}" } em ambos.

# text
seg-35eebbc8a2e9 = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: o kshana calcula a decomposição em valores próprios com o seu próprio resolvedor de Jacobi escrito à mão (fim::sym_eig) e a marginal com a sua própria pseudoinversa; a referência independente recalcula ambos com numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) através de scripts/gen_coupled_gauge_ref.py. A concordância a rel<{ "1e-3" } é, portanto, uma verificação com biblioteca independente da ARITMÉTICA DESTE CRATE face a uma implementação padrão, o que constitui a afirmação validada e a sua totalidade. O QUE NÃO É: a montagem e a classificação do espaço nulo são regras do próprio módulo, e a referência independente reproduz-nas a partir da mesma especificação e não de uma fonte independente - isso corrobora a implementação, não a regra. A geometria das balizas e do orbitador é modelada e representativa. As linhas de observação transportam de facto a orientação PA da Lua DE440 real (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), mas isso é uma ENTRADA que ambos os lados recebem, não evidência sobre a resposta, e fica aqui registado como proveniência e não como justificação do estado - a mesma distinção que o main já faz na linha de integridade de modo comum. Cada valor de vírgula flutuante de linha é arredondado a { "6" } casas decimais antes de network.json ser escrito, pelo que ambos os lados leem exatamente os mesmos doubles IEEE-754 e a única diferença que resta é o resolvedor.

# text
seg-63a8571f8eb0 = Degenerescência entre distância e desvio de relógio na medição de distâncias lunar unidirecional, e a lei de projeto da diversidade geométrica

# text
seg-cdd70f56051a = A degenerescência entre distância radial por nó e desvio do relógio do recetor é exata em { "1" } m para { "3.336" } ns (um sobre c). A marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) mostra que, numa rede geometricamente diversa, a medição de distâncias bidirecional eleva a marginal aproximadamente no mesmo fator que um número igual de dados unidirecionais adicionais, enquanto no regime idealizado de nó único a elevação bidirecional é maior em ordens de grandeza. A lei de projeto que daí decorre: a diversidade geométrica, e não a medição bidirecional como tal, é o que separa a escala do referencial lunar do desvio da escala de tempo na medição de distâncias unidirecional; uma ligação temporal bidirecional ou externa só é necessária no regime de baixa diversidade ou de utilizador único.

# text
seg-25dd0e9134c8 = Fisher marginal por complemento de Schur da matriz de informação acoplada, em álgebra linear de forma fechada, verificada face aos dois regimes limite que prevê. A equivalência de { "1" } m para { "3.336" } ns é a definição do metro através de c e não é um resultado empírico. As redes de observação são geometria modelada representativa, pelo que a lei de projeto é uma afirmação sobre a geometria que lhe é apresentada e não faz qualquer afirmação sobre nenhuma rede lunar em operação.

# text
seg-16ec8283f9b4 = Acoplamento relativista entre taxa de relógio e referencial para a escala de tempo lunar

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) dá a sensibilidade da taxa da escala de tempo lunar à realização do referencial, a partir do potencial efetivo equatorial truncado ao grau { "2" } (GM, raio equatorial, J2, rotação; LunarSurfacePotential): d_alpha/d_scale = L_m, cerca de +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, cerca de -1.11e-14 (dependente do tempo); d_alpha/d_r_radial = g_eff/c^{ "2" }, cerca de +{ "1.806e-17" } por metro. Para um deslocamento radial de datum de { "1" } m, isto é uma perturbação da taxa de cerca de { "1.8e-17" } (uma consequência aritmética da entrada radial), muito abaixo do desvio de taxa de cerca de { "1.7e-11" } de uma escala de tempo lunar face ao TT

# text
seg-6fc3d01ea825 = Pré-registado (5590ab21): L_m face a Ashby e Patla { "2024" } (AJ { "167" }:{ "149" }) Eq. ({ "10" }), { "3.13881" }({ "15" })e-11, a partir do GM, a_m, omega_m do artigo e do J2 dos dois campos de grau 350 que o artigo cita (Bertone et al. { "2021" }, AIUB-GRL350A/B), dentro de { "1e-4" }; a entrada radial face à gravidade equatorial de pyshtools { "4.14.1" } (BSD-3) dos mesmos campos dentro de { "1e-4" } (medido { "8.3e-5" } e { "6.7e-5" }, uma margem estreita); a entrada de velocidade face à velocidade lunar JPL Horizons DE441 dentro de { "4.5e-3" }. Uma forma fechada de grau 2 de um valor publicado de grau 350 (resíduo de grau 3-350; Referência, não P1). Divulgado: o resultado da entrada 1 era conhecido antes do pré-registo, e o raio por omissão fornecido de { "1738.14" } km é a definição de superfície do artigo, adotada após a ronda { "1" }. As contribuições de maré e a banda de comparação continuam a ser valores modelados de superfície de referência

# text
seg-a666792106d9 = Classificação invariante à base do espaço nulo acoplado de referencial e escala de tempo

# text
seg-5ee36574d1b4 = classify_null_space decompõe o espaço nulo do datum em partes apenas espaciais (dimensão d menos posto U_T), apenas temporais (d menos posto U_S) e genuinamente acopladas (posto U_S mais posto U_T menos d), mais a norma de acoplamento do projetor espacial-para-temporal p_st_norm, a norma de Frobenius do bloco fora da diagonal do projetor do espaço nulo. Cada uma destas é uma função do PROJETOR e não de uma base escolhida, pelo que são invariantes a qualquer escolha ortonormal de vetores nulos - o que torna a classificação passível de ser comunicada.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space e numpy.linalg.svd, LAPACK gesdd) classificam as mesmas matrizes registadas por interseção de subespaços, dim null([F; E_T]) e dim null([F; E_S]), e o projetor de espaço nulo por SVD, que difere dos vetores próprios de Jacobi e das fórmulas de posto de Gram do Kshana; pré-registado (d429993c): inteiros exatos, p_st_norm a { "1e-9" } (P2, uma biblioteca numérica independente), com o limiar de posto fixado antecipadamente e um intervalo espectral de pelo menos { "1e6" } afirmado. A afirmação da linha é a classificação de uma matriz indicada, pelo que P2 a cobre por inteiro. Os casos construídos incluem espaços nulos de soma direta, acoplados e mistos e mudanças de base aleatórias; as dimensões da rede real da linha de calibre acoplado não são aqui recontadas. O teste de invariância no crate (uma base nula rodada dá resultados idênticos) é mantido

# text
seg-2c074d6260ba = Menu representativo de medições multitécnica e regra aditiva de combinação de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock guarda uma campanha de medição candidata como uma contribuição de informação de Fisher 7x7 mais um custo relativo escalar; block_from_rows constrói uma a partir de linhas brutas do Jacobiano do datum, de modo que cada bloco é pré-condicionado de forma idêntica através de lunar_identifiability::assemble_multi_info; combine soma a informação de um subconjunto escolhido, o que é a regra correta porque a informação de Fisher é aditiva entre medições independentes; representative_lunar_menu fornece um menu determinista de quatro blocos (LLR, uma baliza VLBI de limbo transversal, um orbitador do lado visível e um orbitador do lado oculto). O otimizador de projeto com restrição orçamental que consome este menu não faz parte deste crate.

# text
seg-d83a9942ee72 = A aditividade da informação de Fisher entre medições independentes é uma propriedade de forma fechada, aqui verificada face a uma soma elemento a elemento escrita de forma independente e face à invariância de ordem e à monotonia que dela decorrem. NOTA SOBRE A EVIDÊNCIA: o combinador não tinha anteriormente qualquer teste, e o único teste do módulo somava as duas matrizes de informação em linha em vez de o chamar, pelo que um combinador avariado teria deixado o módulo a verde; o teste passa agora por combine e falha quando este é mutado. Todas as localizações de balizas, a geometria do orbitador, as precisões por técnica e os custos relativos são escolhas representativas e não valores de missão (ver tests/fixtures/llr_geometry/NOTICE.md), pelo que cada métrica de degenerescência e valor de CRLB obtido através deste menu herda o estado modelado de lunar_identifiability::decompose.

# text
seg-341eedfc47da = Consistência lunar de referencial/dinâmica entre fornecedores (inter-efemérides reais)

# text
seg-f8d94c0771cc = decomposição só de rotação (translação+rotação de 6 parâmetros) da discordância geocêntrica da Lua entre DE440/INPOP21a/EPM2021 numa ligação de referencial ICRF comum redutível e num excesso irredutível de orientação da órbita lunar (o ajuste completo de Helmert de 7 parâmetros é uma função pública separada NÃO coberta por esta verificação externa: a sua evidência é um teste unitário interno de recuperação analítica mais tests/lunar_helmert_fit_cross_check.rs, que o faz concordar com o ajuste exato de Gauss-Newton validado em lunar_frame_realise e fixa a convenção de sinal de rotação oposto entre os dois)

# text
seg-c69fd3fc645b = Três efemérides autorizadas independentes — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — amostradas através do calceph do IMCCE, verificadas por cruzamento com um ajuste independente de mínimos quadrados por SVD em numpy. PORQUE É ISTO validado ONDE lunar_common_mode NÃO O É, sobre as mesmas três efemérides: aqui a grandeza indicada É uma propriedade dos dados publicados — a sua discordância mútua — pelo que as efemérides são a referência independente, não uma entrada. Em lunar_common_mode a mesma discordância alimenta uma geometria de constelação MODELLED e a resposta é uma propriedade desse modelo, razão pela qual essa linha é corretamente Modelled/ReferenceImpl.

# text
seg-2d3347bcb15e = Tolerância de consistência entre fornecedores para um utilizador de fornecedores mistos

# text
seg-9decf2cb6b0c = consistency_tolerance: inverte um orçamento de posição do utilizador num requisito de concordância de Helmert entre fornecedores por parâmetro (origem/escala/rotação) a um braço de alavanca de referência, opcionalmente inflacionado pelo CRLB de realização de fornecedor único P1

# text
seg-b8dc68eb4bda = Limite de triângulo do pior caso sobre a ação do Jacobiano pontual de Helmert (forma fechada)

# text
seg-5450d921dfc9 = Orçamento de erro de interoperabilidade lunar multifornecedor e lei de projeto referencial-versus-efemérides

# text
seg-e1e30f5c17a6 = interop_budget: divisão entre redutível (ligação de referencial comum) e irredutível (dinâmica) sob as convenções PerProvider / CommonFrameTie / CommonEphemeris, com a métrica de lei de projeto de fração irredutível (~{ "0.69" } em DE440/INPOP/EPM reais: uma etiqueta de referencial comum por si só deixa o piso dominante)

# text
seg-46304ae1efa4 = Agregação RMS das divisões por par validadas sob cada convenção (forma fechada)

# text
seg-a01f394a36d3 = Pipeline de álgebra linear de observabilidade de falhas em rede livre autónoma (projetor de paridade, detetabilidade, não centralidade MDB, faísca de bloco bizantina)

# text
seg-b3389bb90e8d = Na rede lunar por nó com DE440 real (cada linha uma distância unidirecional diferencial entre nós construída através de pernode_range_row com uma linha de visão real no referencial PA da Lua DE440), o motor calcula o projetor de paridade ponderado P⊥ = I − G(GᵀWG)⁺GᵀW (a forma de pseudoinversa de posto deficiente que sobrevive ao calibre de datum⊕escala de tempo de 8 dimensões), o resíduo de detetabilidade T1 ‖P⊥·b‖ (falhas dentro do intervalo anuladas, falhas genéricas detetáveis), a forma quadrática de não centralidade MDB de Baarda cᵀWP⊥c (a forma ponderada correta de P⊥ único, NÃO a forma de P⊥ duplo cᵀP⊥WP⊥c) com MDB = √(λ₀/cᵀWP⊥c), e as contagens de deteção/identificação de faísca de bloco bizantina das assinaturas efetivas empilhadas de pares P⊥·B_T (posto de coluna, não meramente não nulas)

# text
seg-8cb248423fd0 = Reprodução independente de álgebra linear em numpy/scipy sobre linhas reais de linha de visão no referencial PA da Lua DE440 (P⊥ a partir da SVD do desenho branqueado W^{ "{" }1/2{ "}" }G; a não centralidade MDB a partir da norma quadrática do subespaço de paridade clássica de Baarda ({ "1968" }); o posto do bloco a partir de uma contagem de valores singulares por SVD em numpy) — um caminho numérico genuinamente diferente da decomposição em valores próprios por Jacobi cíclico de GᵀWG do crate. Âmbito (segundo tests/fixtures/faultobs/NOTICE.md): isto valida apenas o PIPELINE DE ÁLGEBRA LINEAR nestas linhas. A geometria dos nós é modelada. NÃO é uma garantia de integridade operacional, uma certificação de nível de proteção, nem qualquer afirmação de disponibilidade RAIM/ARAIM, e NÃO é uma garantia de missão de tolerância a falhas bizantinas — a CONTAGEM de falhas toleradas para esta rede é modelada, enquanto o LIMITE de faísca de bloco detetar>f / identificar>2f é citado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; faísca por blocos de Donoho–Elad { "2003" }) e é uma instanciação demonstrada em código

# text
seg-ebb827739614 = Limite de deteção/identificação por faísca de bloco bizantina na rede lunar autónoma por nó (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia o limite de codificação de estimação segura de estado / observabilidade esparsa sobre a geometria da rede por nó: um par bizantino injeta uma combinação linear arbitrária das medições em que participa, e a rede DETETA qualquer coligação de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única qualquer coligação de ≤ ⌊(block_spark − { "1" })/2⌋, onde block_spark é a menor coligação de pares cujas assinaturas efetivas empilhadas P⊥·B_T têm deficiência de posto de coluna. A detetabilidade de um par é o POSTO DE COLUNA COMPLETO de P⊥·B_j (um bloco não nulo mas com deficiência de posto é um ataque não nulo que cai em range(G) e não deixa resíduo), e não apenas P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Instanciação geométrica do limite de faísca por blocos / estimação segura de estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; faísca por blocos de Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NÃO o limiar de consenso 3f+{ "1" } de Lamport–Shostak–Pease ('bizantino' designa apenas o MODELO de falhas arbitrárias/em conluio). A contagem específica de falhas toleradas é uma propriedade modelada da geometria representativa da rede, verificada quanto à autoconsistência por casos analíticos construídos à mão e pelas fórmulas de contagem

# text
seg-4f57f586cf82 = Piso de calibre temporal de holdover autónomo para a constelação lunar autorreferencial (T4)

# text
seg-eb690e8f5c9b = holdover_floor estabelece que, num conjunto de nós autónomos ligados apenas por medições entre nós, a taxa de relógio comum (δα_j += { "1" } ∀j) é um parâmetro livre de tempo de conjunto que se situa em N(GᵀWG): nenhuma quantidade de medição adicional de distâncias entre nós a consegue observar (rate_in_gauge = true, temporal_gauge_dim = { "2" } com o desvio comum). Este é o verdadeiro piso de holdover — o análogo temporal do calibre de posição de referencial rígido. Acrescentar uma ligação externa de taxa absoluta (uma ligação direta a uma referência fora da rede) expulsa a taxa comum do espaço nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), o que prova que o piso é um calibre real e não um artefacto do modelo de oscilador

# text
seg-097f126797bb = Argumento do parâmetro livre de tempo de conjunto (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado na rede por nó representativa com DE440 real: um teste de nulidade em resíduo relativo do gerador analítico da taxa comum face a GᵀWG, com o contraste de rutura de ligação a distinguir o calibre genuíno de um artefacto do modelo de oscilador. Geometria modelada representativa, não um orçamento de temporização certificado

# text
seg-25ffd6e1979c = Divisão comum/diferencial por fornecedor, unificação da deficiência de um posto e declive da lacuna de proteção (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Três facetas da decomposição única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), com o calibre datum⊕escala de tempo de 8 dimensões como N(G) e as state_dim − { "8" } = { "32" } direções observáveis como range(G): (T5) provider_mismatch_split classifica um viés comum multifornecedor (∈ range(G)) como INDETETÁVEL — a precisar de uma ligação externa — e um viés diferencial (∉ range(G)) como automonitorizado / DETETÁVEL; (§{ "0" }) a unificação consiste em que o MESMO subespaço cego range(G) governa a classe de falhas indetetáveis, pelo que o calibre de datum N(G) e o subespaço cego às falhas range(G) são uma só geometria, não duas; (g7) slope devolve o declive de lacuna de proteção de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para uma falha b ∈ range(G) (estimador corrompido com paridade nula) e finito para uma falha detetável

# text
seg-e0fd3860fce9 = Álgebra de projetor de paridade / pseudoinversa em forma fechada na rede por nó representativa com DE440 real: a divisão comum/diferencial, a unificação N(G) ⊕ range(G) e o declive da lacuna de proteção de Brown ({ "1992" }) decorrem todos da anulação do alcance P⊥·G = { "0" }. Geometria modelada representativa, não um nível de proteção certificado

# text
seg-101b0551d987 = MTIE e TDEV de temporização de telecomunicações numa série de erro de tempo de holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> comunica, num registo de holdover à escala das telecomunicações: um MTIE de janela deslizante O(n) com fila monótona (telecom_timing::mtie_sliding, necessário para que um dia de amostras de um segundo continue rápido) e o TDEV do motor (allan::time_deviation), avaliados na grelha que o tipo de cenário comunica e lidos de volta a partir de uma execução completa que ingere a série

# text
seg-59cb2711355c = allantools { "2024.06" } — uma biblioteca independente de terceiros de estabilidade de frequência — mtie() e tdev() em tests/fixtures/telecom_timing/holdover_te_series.csv, a série lida a partir do mesmo texto de 17 algarismos significativos em ambos os lados; a referência regista o SHA-256 da série e pode ser regenerada offline através de tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida os ESTIMADORES neste registo, não o holdover sintético que o produziu

# text
seg-632add2dbd3c = Máscaras de sincronização de telecomunicações ITU-T com PASS/FAIL e margem

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado e holdover ePRTC-A (incluindo a envolvente de erro de tempo da Tabela { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes T-BC/T-TSC A-D e G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) ponto de referência C, cada intervalo aberto ou fechado como a tabela o indica, com todas as entradas «para estudo posterior» omitidas; um veredicto e uma margem no ponto condicionante por verificação, e o tempo até exceder cada orçamento. Executável como o tipo de cenário <c1/>

# text
seg-46b139a58bb0 = Transcrição das Recomendações indicadas (descarregáveis livremente em itu.int), cada limite com a sua tabela ou cláusula, listadas com todos os itens não confirmados ou não implementados em docs/TELECOM-TIMING.md; as identidades de continuidade dos pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de normas com verificações de consistência interna, não um ensaio de aderência à norma e não uma validação externa. { "0.30" } ronda { "2" } (pré-registado 970003ee), bloqueado (mantém-se MODELLED): os dez valores de máscara e os treze valores de holdover ePRTC-A que as Recomendações imprimem como números de exemplo (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } e Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 a 7-4) são reproduzidos dentro de metade de uma unidade impressa, a maioria constantes de tabela ou pontos de quebra; a Fig. 7-2 de G.8271.1 indica { "200" } ns a { "1.3" } s face à sua própria Tabela 7-1 ({ "197.5" } ns). Os limites das classes A-D de G.8273.2 não têm valor de exemplo impresso, e as etiquetas dos pontos de quebra de ePRTC bloqueado de G.8272.1 (em linhas de construção contínuas) foram excluídas pela regra de seleção pré-registada, pelo que continuam a ser transcrições

# text
seg-165ed2bc771a = Máscaras de geração de wander de sincronização de frequência ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sete máscaras de geração de wander de MTIE e TDEV a temperatura constante para o tipo de cenário <c1/>: G.811 (09/1997) PRC (autónomo), G.812 (06/2004) Tipos I, II e III, G.8262 (10/2024) EEC Opções { "1" } e { "2" } e G.8262.1 (11/2025) eEEC (modo bloqueado), incluindo as parcelas de lei de potência que as tabelas escrevem (<c2/> e semelhantes), cada intervalo aberto ou fechado como impresso, medidas através do filtro de { "10" } Hz que as cláusulas indicam (tomado como aplicado antes da amostragem); o cenário de referência scenarios/telecom-synce-eec.toml põe um OCXO em funcionamento livre contra as três máscaras EEC. Não implementado: as tolerâncias de temperatura variável, o holdover, os transitórios, o jitter e a exatidão de frequência de G.811

# text
seg-ca16d9c98dc5 = Transcrição das Recomendações indicadas (descarregadas de itu.int em 2026-10-13), cada linha relida face ao texto, com a continuidade dos pontos de quebra que os coeficientes impressos implicam limitada nos testes (por exemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns face ao patamar de { "100" } ns da Tabela { "4" } de G.812). Uma transcrição de normas com verificações de consistência interna, não um ensaio de aderência à norma e não uma validação externa. G.812 (06/2004) está listada como substituída por uma edição pré-publicada de 08/2026 e G.811 tem uma Amd. { "1" } (04/2016); nenhuma pôde ser lida, pelo que nenhuma é verificada. O cenário de OCXO em funcionamento livre sobrestima a contribuição do oscilador em intervalos de observação longos face à constante de tempo de uma malha; nada diz sobre o relógio de qualquer equipamento

# text
seg-5fc2ad88faf0 = Formatos de registo de relógio (relógio RINEX, TimeLab ASCII, TAPR TICC) lidos para uma série de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: uma camada de análise sintática que converte um ficheiro de relógio RINEX (registos AS/AR de um relógio indicado, versões { "2" } e { "3.00" } a { "3.04" }), um registo ASCII de fase ou frequência no estilo TimeLab, ou um registo de marcas temporais ou de intervalos TAPR TICC numa grelha de fase uniforme, com tau0 indicado, a partir de um cabeçalho, ou o espaçamento mediano, cada lacuna, leitura fora da grelha e duplicado contados, e uma política de lacunas de recusa, de maior sequência ou linear; ligada de forma opcional à série de temporização de telecomunicações (<c1/>, a acrescentar um bloco <c2/>) e ao tipo de cenário clock (<c3/>, a acrescentar um bloco <c4/> com ADEV, TDEV e MTIE, o SHA-256 da tabela e o SHA-256 da fase; runs = { "1" }). Sem a tabela, ambos os tipos de cenário são idênticos byte a byte

# text
seg-1d3df655c14c = Pré-registado em tests/fixtures/clock_log/PREREGISTRATION.md (registado isoladamente, 159334f2, antes de o fixture existir); registado em RESULTS.md. Três registos sintéticos com semente, um por formato (uma lacuna TICC de três épocas, um segundo relógio RINEX a ignorar), lidos de volta por um leitor independente escrito a partir de docs/CLOCK-LOG-FORMATS.md pelo mesmo autor: contagens de grelha, lacunas e preenchimento iguais e a maior diferença de fase de { "0" } s (limiar { "1e-13" } s). oadev, tdev e mtie do allantools { "2024.6" } sobre essa fase concordam dentro de { "2.5e-14" } em termos relativos (limiar { "1e-10" }) em cada fator de média que avalia; não avalia o MTIE sobre o registo completo, que o motor comunica, pelo que esse ponto por registo não tem valor de referência independente e o limiar tal como formulado não é atingido aí. MODELLED: registos sintéticos, e a referência independente do leitor partilha o autor; não foram comparados ficheiros de relógio TimeLab, TICC e RINEX reais provenientes de instrumentos

# text
seg-acdb0337bce7 = Formatos de registo de relógio linuxptp (ptp4l, phc2sys, ts2phc) e chrony (tracking, statistics) lidos para uma série de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input com os formatos ptp4l, phc2sys, ts2phc, chrony-tracking e chrony-statistics: o desvio registado de uma linha de servo linuxptp (ns, a marca temporal entre parênteses retos da própria linha, leituras anteriores à primeira comunicação de s2 pelo servo omitidas e contadas) ou de um registo tracking ou statistics do chrony (s, por posição de coluna, data e hora UTC) torna-se uma grelha de fase uniforme através das mesmas políticas de lacunas dos outros formatos; um seletor de fonte (<c1/>) designa uma de várias interfaces, relógios ou endereços; os registos alimentam a série de temporização de telecomunicações, o tipo de cenário clock e o tipo de cenário holdover-test

# text
seg-fb9393044576 = Fixtures escritos para o Kshana a partir dos formatos de linha públicos dos daemons, com valores inventados (NOTICE.md na pasta do fixture); não foi lido nenhum registo de uma instalação real e nenhuma referência independente compara a análise sintática com outro leitor, pelo que um formato que difira entre versões do daemon ainda pode ser recusado ou mal lido. Os estimadores alimentados pela série de fase são os validados face ao allantools nas linhas acima

# text
seg-97aebb84576e = Teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador

# text
# c1: holdover-test
seg-ab533cf99c56 = O tipo de cenário <c1/>: um registo de erro de tempo (um registo de relógio linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes que o operador indica para a remoção e o restabelecimento do GNSS numa fase de linha de base, uma de holdover e uma de recuperação; a linha de base é medida face às máscaras ITU-T escritas para um relógio bloqueado e o holdover face às escritas para holdover ou relógio autónomo, a envolvente de holdover ePRTC-A e os orçamentos de erro de tempo; o holdover comunica o desvio de frequência por mínimos quadrados que o sistema manteve, e a recuperação se e quando |TE| entrou numa banda indicada e nela permaneceu durante um tempo de permanência indicado, com o pico e o maior salto. Cada limite é o que o tipo de cenário telecom-timing transcreve; os dois instantes são a declaração do operador e não são verificados

# text
seg-a54380cf95ea = Cálculo manual em registos construídos a partir de fórmulas cujo declive, salto, extremo e tempo de recuperação são conhecidos antes da execução (os testes indicam-nos), e as máscaras, a envolvente e os orçamentos das linhas de temporização de telecomunicações acima. Nenhuma medição laboratorial de um holdover real foi pontuada e nenhuma referência independente externa foi comparada, pelo que o tipo de cenário não faz qualquer afirmação sobre nenhum relógio ou sistema; é necessário um parceiro de laboratório de temporização antes de qualquer valor por classe de relógio poder ser promovido

# text
seg-94cbac97a1aa = Disponibilidade de sinais GNSS no Volume de Serviço Espacial e para além dele, comparada com a brochura SSV do ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = As varreduras de disponibilidade do tipo de cenário <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (utilizador, época) com pelo menos um e pelo menos quatro sinais e a maior interrupção, para um utilizador numa esfera (a camada global de 2,562 pontos da brochura, { "14" } dias a { "1" } minuto) ou numa trajetória (GEO, HEO, transferência lunar), a partir das órbitas keplerianas do anexo C da brochura, uma potência radiada mínima constante dentro do ângulo de referência fora do eixo, bloqueio da Terra pela esfera mais { "50" } km e um limiar de C/N0; antenas de utilizador da tabela B10 da brochura

# text
seg-d71c9d361342 = A brochura do Volume de Serviço Espacial do ICG (UN OOSA ST/SPACE/75, { "2018" }), ela própria uma simulação, comparada ao abrigo de um pré-registo registado antes da execução (xval/gnss-ssv/PREREGISTRATION.md; resultados em xval/gnss-ssv/RESULTS.md, fixados por tests/ssv_booklet_results.rs, falhas incluídas). Execução { "1" } na leitura pré-registada: as constantes de potência radiada mínima e o limiar lunar concordam (S0, S6 atingidos); os limiares de SSV superior e inferior, de limiar de RF, de GEO e de HEO são NOT MET, quase todos por causa do GLONASS, para o qual a brochura dá { "20" } e { "28" } graus nas tabelas B2 e B6 e { "26" } e { "34" } graus na tabela { "4.2" }. Uma variante de diagnóstico com os ângulos da tabela { "4.2" } concorda em todas as células do SSV superior, do SSV inferior e das seis missões GEO (não substitui a execução { "1" }; as células de RF, HEO e lunares continuam a falhar). Os diagramas medidos de painel GPS L1 não são reproduzidos pelo substituto paramétrico (RMS de { "6" } a { "9" } dB face a um limiar de { "3" } dB). A concordância mostra que o método indicado na brochura é reproduzido, não que os sinais GNSS se comportem assim

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efeitos de ionosfera, plasmasfera e atmosfera em raios de limbo sobre sinais GNSS rasantes, e o projeto de recetor de sinal fraco, no tipo de cenário <c1/>

# text
seg-1a1786ba90b6 = Uma ionosfera de Chapman, uma plasmasfera do tipo Gallagher e uma atmosfera neutra (curvatura por refratividade, absorção de oxigénio, desfocagem) integradas ao longo do raio reto entre o emissor e o utilizador: conteúdo eletrónico total oblíquo, a sua parte plasmasférica, atraso em excesso, altitude da tangente e a perda em ligações rasantes; e um projeto de recetor de sinal fraco (integração coerente e não coerente, limite de bit de dados, auxílio, busca de Doppler) que define o limiar de C/N0 a partir dos modelos de aquisição e de malha de seguimento

# text
seg-4ca1217472ab = Formas fechadas e magnitudes publicadas nos testes (o pico de uma camada de Chapman e a curvatura do limbo da superfície, alguns TECU de plasmasfera num raio GPS-para-GEO); o projeto do recetor reutiliza os modelos de aquisição e de malha de seguimento e os seus testes. Não são comparados com ele dados medidos de sondagem de limbo ou de receção de sinal fraco

# text
seg-6b8f9f3ca2a3 = Filtro de navegação GNSS a bordo para veículos espaciais em órbita alta e de transferência lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = O modo <c2/> do tipo de cenário <c1/>: um filtro de Kalman estendido de nove estados (posição, velocidade, desvio e deriva do relógio do recetor, uma escala de pressão de radiação solar) sobre pseudodistâncias cuja disponibilidade, ruído e C/N0 provêm da mesma geometria de ligação das varreduras; a referência é integrada com J2, terceiros corpos Sol e Lua e pressão de radiação com sombra, o filtro modela J2 e os terceiros corpos e estima a pressão de radiação; comunica erros de posição e velocidade dentro e acima das órbitas GNSS, a maior lacuna de medição e o NEES médio

# text
seg-469602656ab4 = Referência simulada face à estimativa do próprio filtro (o erro de estimação normalizado quadrático médio de um filtro consistente é de cerca de { "3" } para a posição) e determinismo para uma semente fixa. Não são comparados dados GNSS de voo ou registados em órbita alta; o Sol e a Lua são substitutos circulares de baixa precisão

# text
seg-5fc242476828 = Navegação relativa de uma formação de vários veículos espaciais numa órbita muito elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = O modo <c2/> do tipo de cenário <c1/>: um chefe e subordinados executam cada um o filtro absoluto; a posição do subordinado relativa ao chefe é estimada subtraindo as estimativas absolutas e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambos os veículos seguem, sendo a dinâmica relativa a diferença de duas trajetórias não lineares

# text
seg-69c078b57fc8 = A mesma referência simulada que o filtro absoluto: o erro do filtro relativo face ao estado relativo verdadeiro, e a verificação de que se comporta pelo menos tão bem como a subtração de duas soluções absolutas independentes. Não são comparados dados de formações em voo

# text
seg-7038f6902820 = Termos de erro do interferómetro de átomos frios: ruído de fase do laser Raman, viés de curvatura de frente de onda e resolução da ambiguidade de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funções de biblioteca, ainda não acessíveis a partir de um tipo de cenário): a função de ponderação da fase Raman de um interferómetro de três pulsos de pulsos quadrados (Cheinet et al. { "2008" }, Eq. { "8" }) com a forma fechada de fase branca (pi/2)^{ "2" } S_phi0/tau_R e um caminho numérico para qualquer espectro; o ruído de frequência do laser que o atraso da retrorreflexão não cancela (Le Gouet et al. { "2007" }, Eqs. { "9" } a { "11" }); o viés de frente de onda de desfocagem pura sigma_v^2/R de uma nuvem térmica e a sua redução por um raio de deteção; a probabilidade de índice de franja errado erfc(pi/(sqrt({ "2" }) s)) para um auxílio de acelerómetro clássico e para dois tempos de interrogação, e a sua inversa

# text
seg-a7b220763674 = Cada forma fechada face a um caminho numérico independente nos testes (quadratura no domínio da frequência da função de transferência exata e do filtro de atraso, um Monte Carlo sobre átomos para o viés de frente de onda, um Monte Carlo sobre disparos para o índice de franja) e os seus casos-limite. Um valor de exemplo publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) afirmam que, com tau_R = { "20" } us, é necessário um ruído de fase Raman branco inferior a -111 dB rad^2/Hz para { "1" } mrad por disparo; o termo branco isolado dá { "0.99" } mrad (o artigo deriva o nível com a sua Eq. { "17" }, flicker mais branco). Consistência interna e um valor de exemplo, não uma validação externa; as aberrações de ordem superior e o ruído de qualquer laser específico não são modelados

# text
seg-c380ec16a4f8 = Graus de liberdade equivalentes exatos de Greenhall e Riley das variâncias de Allan, de Allan modificada e de Hadamard

# text
seg-dee2a54c5019 = allan::edf_greenhall (com os invólucros edf_greenhall_adev, _mdev e _hdev): o algoritmo completo de Greenhall e Riley, Proc. 35th PTTI ({ "2003" }), Secção { "3" } (Eqs. { "7" } a { "13" } e os coeficientes de J grande das Tabelas { "1" } a { "3" }), para ordens de diferença { "1" } a { "3" }, expoentes de ruído +{ "2" } a -4 sempre que alpha + 2d > { "1" }, estimadores sobrepostos e não sobrepostos, modificados e não modificados; NaN onde não se aplica, incluindo o caso de PM branco não modificado com ceil(M/S) <= d, cuja forma fechada não está implementada. assurance::uncertainty::edf passa a partilhar o código e mantém as suas saídas bit a bit

# text
seg-695ec24f9676 = allantools { "2024.6" } ci.edf_greenhall, uma implementação de terceiros do algoritmo publicado, executada por scripts/gen_greenhall_edf_ref.py sobre a grelha pré-registada em xval/greenhall-edf/PREREGISTRATION.md (registada isoladamente, 0db0bb7a, antes de qualquer comparação): em todos os { "4 876" } pontos em que devolve um edf finito, o kshana concorda dentro de { "6.0e-13" } em termos relativos (limiar { "1e-9" }); nos seus { "46" } pontos de NotImplementedError o kshana devolve NaN; todas as etiquetas de caso ocorrem; os invólucros são iguais ao núcleo bit a bit; uncertainty::edf é idêntico bit a bit em { "274 280" } valores (fixado como SHA-256 antes da refatorização). Em { "32" } pontos (alpha -4, d { "3" }, não modificado, caso { "2.2" }) o allantools falha na consulta da sua Tabela { "2" }, pelo que não têm valor de referência independente e não são contados. O Stable32 não foi executado. { "0.36" } revisão (docs/revisions/STUDIO15-greenhall-edf-portable.md): em matemática portátil o núcleo obtém o seu logaritmo a partir de uma avaliação em double-double arredondada uma só vez (allan::greenhall_ln), e o Limiar { "1" } inalterado volta a verificar-se em todos os { "4 876" } pontos, pior valor relativo { "6.0e-13" }; a salvaguarda de uncertainty::edf é rebaseada para o despejo portátil { "0.36" } ({ "3 746" } dos { "274 280" } valores mudaram, no máximo { "1.6e-12" } em termos relativos, face à base de matemática do anfitrião)

# text
seg-363705e03bac = Predefinições de holdover de osciladores a partir de folhas de dados públicas

# text
seg-9750d9e0ec7a = Quatro predefinições — OCXO (Microchip OX-208), rubídio (Microchip 8040C), césio (Microchip 5071A tubo de alto desempenho) e CSAC (Microchip SA.45s) — cada uma com os máximos de desvio de Allan, o envelhecimento e o limite de temperatura da sua folha de dados; um ajuste de ruído de frequência branco + flicker + passeio aleatório por mínimos quadrados não negativos escalado para envolver cada ponto da folha de dados, um piso de flicker nunca abaixo do valor de τ mais longo, envelhecimento linear e um termo de temperatura sinusoidal, sintetizado como um holdover com semente após uma perda de GNSS

# text
seg-95aaa171864b = As quatro folhas de dados Microchip indicadas (números de documento e URL em cada predefinição e em docs/TELECOM-TIMING.md) para os valores de entrada; a rampa de envelhecimento em forma fechada e a propriedade de envolvente do ajuste como verificações internas. A forma como os valores se tornam um modelo de ruído — o ajuste, a regra do piso, o mês de 30 dias, a leitura linear da temperatura — é uma escolha de modelação; nenhuma predefinição é uma medição de uma unidade. { "0.30" } ronda { "2" }, limiares unilaterais face a unidades medidas (pré-registado a01c491c), uma constatação (mantém-se MODELLED): a estação IGS THU2 Symmetricom 8040C nos relógios finais ESA MGEX tem um desvio de Allan de { "0.35" } a { "0.87" } da predefinição de rubídio mas um erro de holdover de { "1.07" } a { "1.60" } da mesma; o registo do 5071A fica fora da predefinição de césio até { "1000" } s (ruído de fase branco da medição, 30x a { "1" } s) e em holdover ({ "1.15" } a { "8.74" }); o pior SA.45s de produção de { "2011" } é 1.26x a predefinição CSAC a { "1" } s; o OX-208 não tem registo medido (bloqueado)

# text
seg-69f93d5ec864 = Previsão de holdover a partir de um registo de relógio medido, verificada com dados reservados

# text
# c1: slot-timing
seg-8bdc5a24c66d = O caminho de registo medido do tipo de cenário <c1/>: o desvio de Allan sobreposto de um registo de fase ajustado por mínimos quadrados não negativos ponderados por edf na base de modulação de frequência de fase branca e IEEE Std { "1139" } (slot_timing::fit_weighted), depois invertido para o tempo de deriva em que o erro de tempo atinge um limiar (slot_timing::slot_budget). O piso de ruído vermelho é medido a partir do registo em vez de assumido

# text
seg-c888226296fe = Um relógio atómico real em funcionamento livre: { "556 990" } amostras de fase de um segundo de um padrão de césio 5071A medido face a um maser de hidrogénio (A. Wallin, distribuído com o allantools; commit fixado e SHA-256 em scripts/fetch_cs5071a.sh), o mesmo registo que tests/cs5071a_reference.rs usa para os estimadores. Os dois terços reservados são uma medição externa que a previsão nunca viu. Condicionado por dados: o fluxo de trabalho realdata-clock descarrega o registo e executa o teste com KSHANA_REQUIRE_REALDATA={ "1" }. Valida o caminho de ajuste-e-inversão num padrão atómico dominado por FM branca em derivas até cerca de { "50 000" } s; não as fontes da folha de dados ou de classe, não os termos deterministas. NÃO um oscilador de cristal: num registo medido de OCXO (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h face a um maser de hidrogénio) a previsão reservada é conservadora, a { "0.59" } a { "0.70" } da violação medida, e na sua maior parte fora do limiar, porque o piso de ruído desse oscilador diminuiu para metade durante o registo; na amostra fica dentro de { "0.98" } a { "1.17" }. O caso do cristal mantém-se MODELLED. NÃO relógios atómicos em órbita também: em { "10" } relógios de satélites GPS Block IIF (tests/slot_timing_igs_holdout.rs, relógios finais IGS de { "30" } s, { "14" } dias, protocolo escrito antes da descarga) { "8" } ficam dentro do limiar e { "2" } (G25, G30) são otimistas até cerca de 2x, pelo que, ao abrigo do protocolo, o caso orbital se mantém MODELLED

# text
seg-d7e03158b972 = Segundos até um relógio em funcionamento livre sair da guarda de um intervalo indexado no tempo, e a cadência de correções que o mantém dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = O tipo de cenário <c1/>: o erro previsto E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para a violação, o tempo restante, o intervalo de ressincronização líquido da latência da correção e as correções por dia, cada termo discriminado com o dominante identificado; relógios a partir das seis predefinições de ClockClass (TCXO, OCXO e RAFS acrescentados, cada um a citar uma folha de dados), as predefinições de temporização de telecomunicações, uma folha de dados em linha ou um registo medido; uma violação além do maior tempo de média da fonte é assinalada como extrapolada

# text
seg-cc0464060e58 = Formas fechadas para cada termo isoladamente e a busca de raiz independente holdover::holdover_seconds; os valores da folha de dados são os dos documentos indicados (docs/SLOT-TIMING.md). Uma predefinição de classe assenta num piso de ruído vermelho assumido e uma fonte de folha de dados é uma envolvente de máximos, pelo que nenhuma é uma medição de qualquer unidade

# text
seg-2797643153dc = Nível de proteção de temporização para um recetor em órbita sob spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, acessível como a secção de spoofing do tipo de cenário <c1/>: velocidade e período em órbita circular, o maior tempo em que um spoofer em terra consegue alcançar o satélite por passagem, o piso do monitor assistido por relógio e a latência de deteção CUSUM, o nível de proteção condicional (piso mais deriva ao longo da latência), o arrastamento que um spoofer a uma taxa de rampa máxima indicada acumula antes de o satélite sair da sua pegada ou de ser executada uma verificação independente, e se cada verificação de contacto com a terra ou de ligação cruzada é independente de um spoofer em terra

# text
seg-3d441db3a373 = Redução ao nível de proteção de temporização existente e às formas fechadas de visibilidade de órbita circular e Terra esférica. Condicionado à deteção, a um spoofer terrestre a uma taxa de rampa indicada, a uma passagem pelo zénite sobre uma Terra sem rotação; não validado num recetor sujeito a spoofing em órbita

# text
seg-158a99d40b0d = Densidades espectrais de potência de sinais em banda L e coeficientes de separação espectral em forma fechada

# text
seg-17060c71fa54 = Densidades espectrais de potência de área unitária do GPS L1 C/A e L2C (BPSK({ "1" })), do GPS L5 e Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) e Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, com uma variante MBOC acrescentada), os seus nulos e máximos localizados numericamente (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), e o coeficiente de separação espectral de um sinal face a qualquer espectro a qualquer desvio (navsignal::spectral_separation_coeff_offset) ou face a um tom, ruído plano, um chirp ou ruído adaptado (spectrum::Jammer::ssc), com o coeficiente anti-jam Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Valores publicados em manuais: o lóbulo principal de BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo e os coeficientes anti-jam Q = { "1" } para um jammer de banda estreita (CW) e Q = { "1.5" } para um jammer de espectro alargado adaptado ao C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., secção { "9.4" }); os lóbulos principais de BOC(m,n) centrados em mais ou menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); os coeficientes de separação espectral -61.8, -64.8 e -67.8 dB/Hz para C/A com C/A, BOC({ "1,1" }) com BOC({ "1,1" }) e C/A com BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June { "2006" }), aqui reproduzidos a partir das suas formas fechadas de autocorrelação de Parseval. O máximo de BOC({ "1,1" }) não está em { "1.023" } MHz: o lóbulo estende-se do nulo da portadora até { "2.046" } MHz e tem o pico em { "0.759" } MHz, e o teste fixa ambos. A mistura MBOC é a definição do ICD, verificada apenas quanto a área unitária e linearidade

# text
seg-f134975d4ffa = Cascata de espectro em banda L com J/S por banda e C/N0 efetivo sob uma cronologia de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = O tipo de cenário <c1/>: uma grelha frequência por tempo da densidade espectral de potência em banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais às suas potências mínimas recebidas da especificação de interface, e jammers de onda contínua, de banda estreita, chirp e de ruído adaptado com instantes de ligar/desligar), cada célula com a média sobre o seu intervalo e linha (chirps exatamente sobre varrimentos completos e parciais, jammers pelo ciclo de trabalho), C/N0 efetivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por linha, J/S por banda, J/S em banda e uma cascata SVG com barras de C/N0. O relatório inclui uma verificação cruzada com a cadeia do tipo de cenário <c2/> nas mesmas entradas de ligação

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Redução à equação anti-jam e ao orçamento de ligação do tipo de cenário <c1/> existente (o mesmo código, chamado com as mesmas entradas), e à forma fechada do piso de ruído k T0 F. Os espectros de sinal subjacentes são os da linha validada acima; as potências dos jammers, a cronologia e as larguras de banda do front-end são entradas do cenário, os espectros são contínuos (sem linhas do código de espalhamento), e nenhum controlo automático de ganho, supressão ou diagrama de antena atua sobre o jammer. Não existe no repositório nenhum espectro medido com interferência para verificar o composto. A tabela de Q do tipo de cenário <c2/> (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde { "0.36" }: os valores dos manuais, fixados às formas fechadas de navsignal) concorda com o valor CW deste modelo e difere do que este deriva para o ruído adaptado ao C/A ({ "1.5" }) e para o ruído plano de nulo a nulo sem normalização em banda ({ "2.2" }); o relatório apresenta ambos

# text
seg-1461dcaed6be = Entrada e saída de gravações SigMF, e estimativas espectrais de Welch de IQ complexo

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: ler e escrever gravações Signal Metadata Format (JSON .sigmf-meta com os campos globais core, captures e annotations; .sigmf-data em bruto como cf32_le, ci16_le ou ci8, os descodificadores de inteiros partilhados com realdata::iqif::load_iq), tudo sobre cadeias de caracteres e buffers de bytes. spectrum::welch_psd: periodogramas com janela de Hann, sobrepostos e com média, com escala de densidade, sobre uma transformada de base 2 dentro do crate (spectrum::fft_in_place). Estas duas são a afirmação validada. spectrum::synthesise_iq desenha o modelo como IQ, e a secção [iq] do tipo de cenário <c1/> executa modelo para IQ para SigMF para Welch e compara com o modelo; a sua secção [recording] estima uma gravação real (compilações nativas); a síntese e essas comparações com o modelo ficam fora da afirmação validada

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) com a mesma janela de Hann periódica, sobreposição, escala de densidade, sem remoção de tendência e média bilateral: cada intervalo dentro de { "1e-12" } em termos relativos (observado { "6.0e-14" }) em { "27" } casos, com as contagens de segmentos tiradas do próprio espectrograma do scipy. sigmf-python { "1.13.0" } (LGPL-3.0, executado como ferramenta) escreve cinco gravações de terceiros (cf32_le, ci16_le, ci8, duas capturas com anotações, um primeiro sample_start não nulo) que o crate descodifica de forma idêntica bit a bit com campos core idênticos, e lê de volta as gravações do crate de forma idêntica bit a bit; o esquema de metadados SigMF { "v1.2.6" } comunica zero erros nos metadados do crate. Tolerâncias fixadas antes da primeira comparação. Fora da afirmação: spectrum::synthesise_iq e as comparações [iq] e [recording] com o modelo (uma síntese não tem uma única resposta certa; um chirp periódico mostra linhas, ondulação de Fresnel e caudas de bordo que o modelo suave omite, potência total dentro de { "2" } %), a convenção de escala de inteiro para vírgula flutuante (o crate divide por { "32767" } e { "127" }, o autoscale do sigmf-python por { "2" }^{ "15" } e { "2" }^{ "7" }, o que a especificação deixa em aberto; a comparação usa códigos brutos), gravações multicanal e os tipos de dados que o leitor recusa

# text
seg-bf2d02d76762 = Posições de planetas em todo o sistema solar a partir dos elementos keplerianos de Standish da JPL

# text
# c1: solar-system
seg-c9d3549045eb = Posições heliocêntricas de Mercúrio, Vénus, do baricentro Terra-Lua, da Terra, de Marte, Júpiter e Saturno a partir da Tabela { "1" } de Standish ({ "1800" } AD a { "2050" } AD), e de todos os oito planetas a partir das Tabelas 2a/2b ({ "3000" } BC a { "3000" } AD, com os termos de anomalia média b, c, s, f), seguindo passo a passo o algoritmo da página da JPL e rodadas para o ICRF (International Celestial Reference Frame) pela obliquidade da página; a Terra é separada do baricentro pela série lunar de Montenbruck & Gill e pela razão de massas. Composto como ephem_provider::AnalyticSolarSystem, de modo que qualquer corpo está disponível relativamente a qualquer outro, e executável como o tipo de cenário <c1/>

# text
seg-24e058d4d094 = Vetores heliocêntricos geométricos JPL Horizons DE441 (eclítica e ICRF), obtidos após os commits de pré-registo { "80451866" }, 8d38a28b e 558cc807. Limiar: por planeta e componente, RMS no máximo 1.0x os erros aproximados do Explanatory Supplement 3rd ed. Tabela { "8.10.1" } (a linha EMB para a Terra); a separação Terra-EMB é verificada diretamente face a DE441 { "399" } menos { "3" }, no máximo { "0.3" } deg e { "8.1" } km em cada época 1950-2050 (o limiar de comprimento de { "8.1" } km vem da exatidão da série lunar indicada na própria documentação de efemérides do Kshana, que cita Montenbruck e Gill, e não foi verificado face ao livro; o valor medido de { "6.09" } km fica perto dele). A estatística RMS foi escolhida sabendo que uma comparação anterior de 27 épocas atingira 1.87x o nominal no seu máximo; os erros de época única chegam a 3.83x (3.87x no caso ICRF). O Supplement não define os seus valores como RMS. O caso B roda ambos os lados com a obliquidade IAU { "1976" } escrita no teste, pelo que a rotação não é verificada face a si própria. A seleção de tabela por omissão de AnalyticSolarSystem não é exercitada (os testes forçam a Tabela { "1" }). Úrano e Neptuno da Tabela { "1" } são uma linha MODELLED separada

# text
seg-4ea08a296b37 = Posições do Sol, da Lua, de Mercúrio e de Vénus a partir do kernel DE440 em épocas UTC (KernelEphemeris)

# text
seg-8d47467c36e4 = Posições geométricas do Sol, de Mercúrio, de Vénus, da Terra e da Lua relativamente uns aos outros (eixos J2000/ICRF, metros) a partir de um kernel JPL DE440 através de ephem_provider::KernelEphemeris em épocas UTC: nomes de corpos mapeados para códigos NAIF, UTC levado através da tabela de segundos intercalares e TT para TDB com a série TDB-TT de dois termos, o kernel lido pelo leitor do próprio motor. Um corpo que o kernel guarda apenas como baricentro de sistema (de Marte a Neptuno, Plutão em de440s) é recusado, nunca substituído. A linha Standish sem kernel continua a ser o caminho do navegador e de recurso

# text
seg-f0e09f78814a = Skyfield { "1.54" } (MIT), com a sua própria tabela de segundos intercalares, o seu próprio TDB-TT e o seu próprio leitor do mesmo NAIF de440s.bsp (jplephem), executado como programa separado em épocas UTC. Pré-registado (0bfafe6d) antes de o fixture existir, a grelha gerada com semente a partir do hash desse commit, com um limiar de { "5e-5" } s vezes a velocidade relativa (a exatidão de dois termos de TDB-TT indicada pelo motor) mais { "1e-13" } da distância baricêntrica mais { "1e-5" } m, por componente. Resultado: todos os { "600" } dentro, o pior a { "0.66" } do limiar ({ "2.96" } m num par rápido, o erro da própria série TDB-TT). Mutação: TT usado como TDB falha a { "33" } vezes o limiar. Ambos os lados leem DE440: isto valida o fornecedor e a sua cadeia temporal, não o DE440. Fora da afirmação: os planetas para além de Vénus como corpos (de440s só contém os seus baricentros), as luas planetárias e a precisão abaixo da série TDB-TT de dois termos (alguns metros para os pares mais rápidos)

# text
seg-b59153f28d69 = Tempo de luz entre corpos do sistema solar

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = O tempo de luz newtoniano unidirecional de qualquer corpo para qualquer outro, recebido numa época, resolvido pelo resolvedor radiométrico de tempo de luz por ponto fixo (radiometric::light_time_solution, emissor na sua posição retardada) através de solar_system::link_on sobre qualquer EphemerisProvider; o tipo de cenário solar-system executa-o no sistema solar analítico no referencial heliocêntrico (solar_system::link). A distância bidirecional de radiometric::two_way_range e o atraso de Shapiro do Sol de radiometric::shapiro_delay são comunicados em separado e não são comparados externamente. Emitido para cada corpo face a um observador e para qualquer ligação extra pelo tipo de cenário <c1/>, e para a ligação descendente do corpo à Terra pelo tipo de cenário <c2/>

# text
seg-0685ab1ef2d3 = Tempo de luz newtoniano LT de perna descendente unidirecional JPL Horizons DE441 (VEC_CORR=LT, observador o centro da Terra), pré-registado (480037d3, adenda 54d5c86f que alterou apenas o espaçamento dos nós de interpolação depois de a primeira obtenção ter falhado a sua pré-condição de precisão de interpolação de { "10" } m, antes de qualquer tempo de luz ser comparado) com um limiar de { "1e-6" } s por tempo de luz, o resolvedor alimentado com posições baricêntricas DE441 para que a iteração do emissor retardado seja visível (um resolvedor de primeira iteração falha até { "0.1" } s). Nas posições analíticas de Standish o tempo de luz é apenas tão bom quanto essas posições (ver a linha de posições de planetas); a ligação fornecida trata o Sol como centro inercial, o que fica dentro desse erro de posição mas não é validado em separado. two_way_range e shapiro_delay não são comparados externamente

# text
seg-6e0b9687e8ee = Úrano e Neptuno a partir da Tabela { "1" } de Standish, Plutão e velocidades planetárias

# text
seg-df3bf502dfe9 = Posições de Úrano e Neptuno a partir da Tabela { "1" } de Standish (a predefinição entre { "1800" } AD e { "2050" } AD), Plutão a partir da linha da Tabela { "1" } de { "1992" } que a página atual da JPL já não lista, e a velocidade heliocêntrica de cada planeta: a derivada de dois corpos com o movimento médio que os elementos implicam mais a rotação da elipse pelas taxas do periélio, da inclinação e do nó

# text
seg-f49245efe44f = Medido face ao JPL Horizons DE441 (os mesmos fixtures registados), mas não validado: os valores indicados na Tabela { "1" } para Úrano e Neptuno são excedidos até { "2.0" } e { "5.2" } vezes face às posições heliocêntricas DE441 (Neptuno satisfaz-os face às posições baricêntricas, o que sugere que o ajuste não foi heliocêntrico), a página não indica erro para Plutão e não existe limite publicado para as velocidades. As Tabelas 2a/2b satisfazem os seus próprios valores para Úrano e Neptuno e estão cobertas pela linha validada

# text
seg-a50be56f605a = Posições da Lua e de sete luas principais (Fobos, Deimos, as luas galileanas, Titã)

# text
seg-2cfbe5a1eece = A Lua geocêntrica a partir da série de Montenbruck & Gill (cujo termo de -1.3972 deg por século já a refere ao equinócio J2000), e posições e velocidades planetocêntricas de Fobos, Deimos, Io, Europa, Ganimedes e Calisto a partir dos elementos médios da JPL Solar System Dynamics no plano de Laplace de cada lua, com a taxa de longitude média tirada da taxa de rotação síncrona da IAU (a tabela imprime o período com poucos dígitos para conservar a fase), e de Titã a partir do modelo de rotação da IAU (a lua sobre o eixo x fixo ao corpo, com sinal menos, à distância média), porque a linha do plano de Laplace impressa para Titã não reproduz o Horizons nem na sua própria época

# text
seg-6c81bd570fe5 = Medido face às efemérides de satélites JPL Horizons (DE441, MAR099, JUP365, SAT441) registadas em tests/fixtures/solar_system/horizons_satellites_icrf.csv com a consulta e a data de obtenção; não existe exatidão publicada para elementos médios nem para a colocação por modelo de rotação, pelo que os limiares fixados detetam regressões e não validam. Os elementos médios omitem as perturbações ressonantes e solares, e a aceleração secular de Fobos não é modelada

# text
seg-8b8c8e28ece9 = Constantes físicas de cada corpo do sistema solar e o relatório do sistema completo

# text
# c1: solar-system
seg-d225a30de35c = Body ganha Mercúrio, Vénus, Júpiter, Saturno, Úrano, Neptuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã (parâmetro gravitacional, raio de referência, J2 onde publicado com o raio a que se refere, polo IAU e meridiano de origem), uma consulta por nome e um registo BodyFacts (código NAIF, classe, progenitor, raio equatorial e médio); o tipo de cenário <c1/> comunica-os para todos os dezoito corpos com as posições, os tempos de luz e uma trajetória de órbita ao longo de uma revolução, cada corpo etiquetado VALIDATED ou MODELLED

# text
seg-6adc29de51fd = Transcrição de constantes publicadas, cada uma citada onde é definida: parâmetros gravitacionais a partir dos registos de corpos do JPL Horizons e da tabela de parâmetros físicos de satélites da JPL, raios a partir das tabelas de parâmetros físicos da JPL (IAU WGCCRE { "2015" }), polos e meridianos de origem a partir do Grupo de Trabalho da IAU sobre Coordenadas Cartográficas e Elementos de Rotação (valores médios, sem os termos de taxa T e periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } e { "2019" }, e Jacobson { "2009" } e { "2014" }. Verificado quanto à consistência interna (o período de rotação de Júpiter face à taxa do Sistema III, cada J2 face ao seu raio de referência), não face a uma referência independente externa. { "0.30" } ronda { "2" }: os valores de GM foram adotados de gm_de440 e os elementos de Fobos e Deimos de pck00011, pelo que { "0" } de { "84" } constantes dos catorze corpos acrescentados diferem agora da NAIF (eram { "12" }), o que é uma verificação de transcrição e não é contado. { "0.36" }: a orientação fixa ao corpo da IAU e o GM dos catorze corpos acrescentados foram separados para a sua própria linha VALIDATED ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); esta linha mantém o que resta. J2 e o raio médio são citados, não validados; as posições no relatório assentam nas suas próprias linhas; e o prime_meridian_deg do relatório para a Terra, a Lua e Marte continua em constantes convencionais (até { "6.6e-3" }, { "2.8e-2" } e { "9.6e-4" } rad de IAU_<BODY>). { "0.30" } revisões: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Úrano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutão { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; raio equatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg inclui agora os termos quadráticos e periódicos

# text
seg-fa8a4b082cd5 = Orientação IAU dos corpos e parâmetro gravitacional dos catorze corpos do sistema solar acrescentados

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, a rotação de J2000 para o referencial fixo ao corpo da IAU de Mercúrio, Vénus, Júpiter, Saturno, Úrano, Neptuno, Plutão, Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã com cada taxa secular, termo quadrático e termo periódico que o corpo tem em pck00011, e o campo de parâmetro gravitacional mu dos mesmos catorze corpos. O Sol, a Terra, a Lua e Marte têm constantes convencionais pertencentes a outras linhas e não estão cobertos

# text
seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 até spiceypy) pxform('J2000', 'IAU_<BODY>') em pck00011.tpc, uma implementação independente do mesmo modelo de rotação da IAU, e NAIF gm_de440.tpc para o GM, os fixtures gerados por um programa separado que não chama código Kshana (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Pré-registado 154bc54 (com o limiar original de { "1e-9" } rad de c2434204) antes de o fixture de época nova existir; o fixture novo foi regenerado de forma independente e é idêntico byte a byte. O GM é uma transcrição do DE440 verificada face ao ficheiro publicado, não uma determinação independente do GM. Resultados: docs/design/evidence/mr08-body-orientation/RESULTS.md

# text
seg-87ab655f8270 = Posicionamento em torno de qualquer corpo do sistema solar com uma constelação local e uma ligação de espaço profundo a partir da Terra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = O tipo de cenário <c1/>: um orbitador ou um módulo de aterragem à superfície em torno de um corpo escolhido por nome navega com pseudodistâncias unidirecionais de uma constelação de navegação Walker em torno do corpo (órbitas de dois corpos com a deriva secular J2 do corpo, um relógio de utilizador desconhecido) e uma distância bidirecional opcional, sem relógio, a partir da Terra, com a direção e a distância da Terra obtidas da efeméride analítica em cada época; linhas de visão bloqueadas pela esfera do corpo e uma máscara de elevação à superfície; por época o GDOP e o PDOP só da constelação (orbit::dop), a incerteza formal de posição com e sem a linha da Terra, e soluções de posição de Gauss-Newton com semente (batch_ls::gauss_newton) de cada forma, com o tempo de luz e o tempo de ida e volta entre o corpo e a Terra

# text
seg-3538c49df107 = Formas fechadas e autoconsistência: a terceira lei de Kepler para o período do relé, o raio da órbita e o raio da superfície mantidos ao longo da execução, o facto de acrescentar uma medição nunca aumentar a incerteza formal e os erros com semente concordarem com a covariância. As órbitas dos relés ignoram terceiros corpos (a atração de Júpiter sobre os relés em torno de Europa não é modelada), o ruído é gaussiano a níveis indicados e o modelo de medição é instantâneo, pelo que isto não é validado face aos dados de navegação de nenhuma missão

# text
seg-281b680a9897 = Geometria de constelações Walker e as posições nominais publicadas do GPS, Galileo e GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Os geradores do tipo de cenário <c1/>: padrões Walker delta e star na convenção T/P/F (espaçamento de nós 360/P ou 180/P, espaçamento no plano { "360" }·P/T, desfasamento de fase entre planos { "360" }·F/T), e as predefinições de linha de base do GPS e expansível de 24 posições, Galileo e GLONASS construídas a partir dos seus elementos nominais publicados, colocadas num referencial fixo à Terra pelo ângulo horário de Greenwich que os seus documentos indicam

# text
seg-bdf83007af50 = Documentos publicados de agências: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) Tabelas { "1" } e { "23" }, a constelação de referência em 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) secção { "5.2" }, a fórmula de posições para a longitude do nó e o argumento da latitude; GPS Standard Positioning Service Performance Standard 5th edition (April { "2020" }) Tabelas 3.2-1, 3.2-2 e 3.2-3, incluindo a coluna de cruzamento equatorial da trajetória no solo, que é uma declaração independente da geometria fixa à Terra que a predefinição tem de reproduzir. Valida os geradores e a transcrição; a fase de órbita média e os nós geossíncronos inclinados do BeiDou não são publicados e não estão cobertos

# text
seg-0f1d49ab5d51 = Diluição global da precisão da constelação de linha de base do GPS

# text
# c1: constellation-design
seg-83775b77f5ca = O motor de cobertura <c1/> na predefinição de linha de base do GPS de 24 posições sob as condições do Apêndice B do GPS Standard Positioning Service Performance Standard (SPS PS) (um dia sideral, { "287" } passos de cinco minutos, uma grelha global de { "4" } x { "4" } deg ponderada pelo cosseno da latitude, todos à vista, máscara de { "5" } deg, um relógio de recetor): a distribuição global de HDOP, a mediana de PDOP e a disponibilidade de PDOP no máximo de 6, globalmente e no pior local

# text
seg-6fb3c2028c4a = GPS SPS PS 5th edition (April { "2020" }) Apêndice B secções B.3.2.2 e B.3.2.3, a distribuição publicada de HDOP médio global da constelação de linha de base de 24 posições totalmente ocupada (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, média { "0.96" }), Tabela 3.8-1 (disponibilidade de PDOP) e Tabela B.3-1 (PDOP de conjunto de uma constelação degradada, usada apenas como limite superior), mais uma forma fechada derivada à mão para uma época. As distribuições de VDOP e PDOP da constelação completa são publicadas apenas como figura, pelo que o PDOP é fixado só de um lado; o pior ponto espaço-tempo (HDOP { "2.40" } e VDOP { "5.22" } aqui, { "2.49" } e { "5.43" } publicados) depende da grelha e é comunicado, não fixado

# text
seg-7d4d7200cbca = Mapas de cobertura e de diluição da precisão para projetos arbitrários multiconstelação à escala, em torno de qualquer corpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = O tipo de cenário <c1/> para além dos dois casos fixados: projetos explícitos e multicamada, várias constelações por execução com um relógio de recetor por constelação, a Terra, a Lua e Marte a partir das constantes dos corpos, a predefinição BeiDou (fase de órbita média e cruzamento geossíncrono inclinado a { "118" } deg E modelados), satélites à vista por célula, GDOP, PDOP, HDOP, VDOP e disponibilidade, trajetórias no solo subamostradas e um pré-filtro de visibilidade por latitude subsatélite que executa um projeto de { "5" } 000 satélites numa grelha de { "10" } deg numa fração de segundo

# text
seg-2c0f28426ab9 = Consistência interna: a varredura de elevação por força bruta, as reduções calculadas à mão e de orbit::dop, e a geometria Walker e geossíncrona em forma fechada. Órbitas de dois corpos com J2 secular opcional, um corpo esférico com a vertical local ao longo do raio, apenas visibilidade geométrica (sem potência de sinal, estado de saúde do satélite, terreno ou perturbação de terceiros corpos), e a fase relativa entre sistemas tomada de épocas de referência diferentes, pelo que não é um instantâneo de nenhuma data. { "0.30" } revisão, uma constatação (mantém-se MODELLED): as predefinições satisfazem os limites inferiores unilaterais publicados de disponibilidade de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) a { "100" } %, mas com o PDOP do motor duplicado numa cópia de trabalho continuam a satisfazê-los (pior ponto { "99.36" } %), pelo que os limites inferiores não conseguem detetar sequer um erro de { "100" } % na grandeza que esta linha calcula; apertá-los depois da execução seria uma tolerância a posteriori. A promoção exige uma comparação bilateral de valores de DOP em geometria idêntica com uma tolerância definida previamente. { "0.30" } ronda { "2" } (tests/coverage_dop_full_oracle.rs, pré-registado add671d6), uma constatação (mantém-se MODELLED): posições, elevação, azimute e trajetórias no solo do Orekit { "12.2" } com GDOP/PDOP/HDOP/VDOP do gnss_lib_py { "1.0.4" } (relógio comum) e uma inversa em numpy (um relógio por constelação) concordam em todos os limiares nos projetos Galileo, GPS, BeiDou, Galileo+GPS (um relógio cada) e de 1584 satélites na Terra (DOP dentro de { "2e-14" } em termos relativos, solução de posição, disponibilidade e contagens de visibilidade idênticas). Nos projetos da Lua e de Marte os elementos, as posições, a visibilidade e as trajetórias concordam, mas o DOP excede o limiar relativo pré-definido de { "1e-9" } em células cujo maior PDOP é { "1434" } ou mais (até { "8e-6" }), e { "4" } células diferem por uma época de solução de posição em geometria numericamente singular (pivô do motor { "1e-10" } face ao posto do numpy), pelo que a linha não é validada. { "0.30" } revisões: o relógio de referência de TDOP/GDOP é agora a constelação de menor número à vista (GDOP global máximo de constellation-multi-gnss-coverage { "2.2236" } -> { "2.1205" }, média { "1.122" } -> { "1.131" }), e as contagens de visíveis por constelação são somadas como inteiros

# text
seg-278c77438493 = Uma missão encadeada entre tipos de cenário numa cronologia partilhada

# text
# c1: campaign
seg-3dcfb26f6234 = As fases do tipo de cenário <c1/>: cada fase executa um ou mais cenários de tipos existentes através de run_toml, lê as suas saídas para canais com nome (erro de tempo de relógio e guarda, razão média efetiva portadora-densidade de ruído e piso de seguimento, nível de proteção vertical e limite de alerta, erro de posição, satélites em seguimento, indicadores de alarme) por predefinições por tipo de cenário ou caminhos de resultado explícitos, coloca-os no início da fase e mantém-nos numa grelha comum, com fronteiras de fase e eventos; o estado é passado por carry (um canal continua a partir do valor final da fase anterior), handoff (um número de uma fase anterior escrito no cenário seguinte) e end_at (uma fase termina num instante que uma execução calculou, como o instante de deteção de um monitor de spoofing); um hash da campanha e um digest de todos os resultados dos membros

# text
seg-fd018ef7bc3b = Identidades de composição face às execuções autónomas dos mesmos tipos de cenário: uma campanha de uma só fase reproduz a saída autónoma bit a bit, o desvio transportado é igual à última amostra da própria execução anterior e a fase terminada por end_at tem como duração exatamente o instante de deteção da execução. O carry aditivo através de uma fronteira de fase e a retenção de ordem zero são escolhas de modelação, e cada fase é tão boa quanto o tipo de cenário que a executou; nenhuma missão encadeada foi verificada face a uma medida

# text
seg-ad6105af464c = Varrimentos de parâmetros e conjuntos Monte Carlo com semente sobre qualquer tipo de cenário

# text
# c1: campaign
seg-95921611839e = As secções sweep (uma a três chaves com pontos de qualquer tipo de cenário, sobre os valores de eixo do varrimento genérico, opcionalmente com um conjunto em cada nó) e monte_carlo do tipo de cenário <c1/>: a realização k é executada com base_seed + k; cada métrica comunica a média, o desvio-padrão, os percentis 5.º/50.º/95.º por posto mais próximo e um intervalo de confiança de { "95" }% da média por bootstrap de percentis com semente fixa (inertial::metric_stat); as unidades das métricas são lidas do próprio bloco de unidades do tipo de cenário varrido

# text
seg-03d15c27b3b9 = A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções autónomas para a semeadura. Verifica a aritmética do conjunto sobre o modelo de relógio do próprio motor, não um conjunto de dados externo

# text
seg-24327a0ed82e = Vários cenários sob condições partilhadas, com um resumo combinado

# text
# c1: campaign
seg-5833fb3b06e3 = A secção compose do tipo de cenário <c1/>: valores partilhados com nome (por exemplo a potência e a posição de um jammer) escritos em cada membro nas chaves a que os liga, cada membro executado e, por métrica, o menor, o maior e o valor médio entre os membros com o membro identificado; as unidades das métricas têm de coincidir entre os membros

# text
seg-67ffd6684b1c = Identidade de composição face à execução autónoma. A aritmética das condições partilhadas é contabilidade; a física é a dos tipos de cenário membros, cada um com a sua própria linha

# text
seg-0bc866720bde = Otimização limitada de uma métrica sobre parâmetros de campanha

# text
# c1: campaign
seg-f9bdb89c2b4f = A secção optimize do tipo de cenário <c1/> (CAP-32): uma a três chaves de cenário com pontos limitadas a [lo, hi] numa escala lin ou log, uma métrica lida por caminho de resultado, objetivo minimize, maximize ou target; método grid (os valores de eixo do varrimento) ou um simplex de Nelder-Mead determinista em coordenadas normalizadas com projeção na caixa e os coeficientes padrão; uma métrica em falta ou não finita pontua como a pior e permanece no rasto; com runs > { "1" } a métrica é a média sobre sementes comuns; cada avaliação é uma execução real do tipo de cenário indicado, listada em trace e contada no digest de reprodutibilidade

# text
seg-e3a2f80b04dc = Apenas interno: a forma fechada exata -20 log10(distância) da equação de ligação, uma grelha independente de força bruta sobre o mesmo tipo de cenário e a função de Rosenbrock. O limiar 1-D da ronda { "1" } é NOT MET (a caixa pré-registada excluía a solução de { "3" } dB; o otimizador parou no limite), registado em docs/design/evidence/cap32-optimize/RESULTS.md e não repontuado. O ótimo é local à caixa e ao ponto de partida; nenhuma afirmação de ótimo global

# text
seg-b9b1637d326c = Formas fechadas de banda limitada para qualquer sinal de medição de distâncias: potência em banda e jitter de seguimento de código early-late face a valores publicados, com a largura de banda de Gabor e a separação espectral com desvio verificadas por cruzamento

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: o integral seno (sine_integral), a fração de potência BPSK-R dentro de uma banda bilateral em forma fechada (bpsk_power_in_band_closed_form), a largura de banda de Gabor BPSK de banda limitada em forma fechada (bpsk_gabor_bandwidth_closed_form_hz), o jitter da malha de seguimento de atraso early-late coerente e não coerente de banda limitada para qualquer espectro de área unitária segundo Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) e o seu limite de Gabor de espaçamento evanescente (dll_jitter_small_spacing_limit_s), o coeficiente de separação espectral BPSK com desvio em forma fechada (bpsk_offset_ssc_closed_form), o espectro Galileo E5 AltBOC({ "15,10" }) (altboc_15_10_psd) e um analisador de etiquetas de modulação (parse_modulation); usado pelo tipo de cenário <c1/> para cada projeto de sinal

# text
seg-15d8c44be46f = Fixados externamente: { "90.3" } por cento de potência do lóbulo principal, o jitter early-late coerente no ponto de operação indicado, os valores da tabela do integral seno e o coeficiente de autosseparação espectral BPSK 2/({ "3" } R_c) com desvio nulo. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor BPSK de banda limitada e a sua assíntota, e o coeficiente de separação espectral BPSK com desvio em desvios não nulos, ambos derivados aqui e verificados por quadratura. Formas fechadas publicadas: o espectro sinc ao quadrado de BPSK-R e a sua potência de lóbulo principal de { "90" } por cento (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.); o jitter de seguimento de código early-late coerente sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, secção { "8" }) e a generalização de banda limitada com o seu limite de largura de banda de Gabor (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); as tabelas do integral seno de Abramowitz & Stegun (Tabela { "5.1" }); o coeficiente de separação espectral como transformada de Fourier da autocorrelação ao quadrado (Betz { "2001" }). O espectro AltBOC é verificado apenas quanto à área unitária e à posição dos lóbulos (a expressão do Galileo Open Service Signal-in-Space Interface Control Document integra para { "8" } e é dividida por esse valor).

# text
seg-def449efa852 = Doppler máximo de um satélite de navegação em órbita terrestre baixa, que dimensiona a busca de aquisição

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: o maior Doppler do satélite numa passagem pelo zénite à máscara de elevação para uma órbita circular, v R_E cos(el) / (R_E + h) vezes f / c, a partir da portadora e da altitude de órbita de cada predefinição; o tipo de cenário <c1/> acrescenta termos de oscilador e de utilizador e converte-o em intervalos de Doppler

# text
seg-652e28dfa10f = Projetos de sinais de posicionamento, navegação e temporização em órbita terrestre baixa: seguimento de código, aquisição, compatibilidade com GNSS e um compromisso de banda para qualquer sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição ITU; componentes de aquisição, de dados e piloto com espectros BPSK(n), BOC(m,n), MBOC ou planos, partilhas de potência, subportadoras FDMA, comprimentos de código e taxas de dados) a partir de ficheiros de predefinições públicas compilados (Xona Pulsar, Iridium STL, sinal de oportunidade Starlink, CentiSpace, um projeto genérico de banda C e projetos genéricos UHF/L/S/C/C larga, cada um com o seu URL de fonte e os valores não publicados etiquetados REPRESENTATIVE) ou escritos em linha; por sinal a densidade espectral de potência de banda limitada, as frações de potência em banda, a largura de banda de Gabor, o jitter de código face a C/N0 e espaçamento e a exatidão de medição de distâncias, o espaço de busca de aquisição, a probabilidade de deteção de lei quadrática e o tempo médio de aquisição serial e paralela de código, o coeficiente de separação espectral para e a partir de GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b e AltBOC com a degradação de C/N0, e a tolerância de J/S CW, de banda larga e adaptada a partir da cadeia SSC do tipo de cenário spectrum; um compromisso de banda de atraso ionosférico, perda em espaço livre, exatidão de medição de distâncias a C/N0 igual e EIRP igual e tolerância a jammers; e verificações qualitativas de forma de um projeto face a uma medição descrita

# text
seg-040b3f5cc70e = As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos em si são entradas: as predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espectros QPSK Feher melhorado, de code shift keying e OFDM são aproximados, e as verificações de forma comparam formas, não níveis calibrados.

# text
seg-c2b9c8e4a364 = Cascata de espectro multibanda (UHF, L, S, C) com sinais projetados e jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = O tipo de cenário <c1/> alargado para além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com cada componente, de banda limitada à largura de banda de transmissão, C/N0 e J/S referidos à componente seguida) ou como uma portadora e modulação personalizadas; painéis de cascata adicionais sobre qualquer intervalo de frequências na mesma cronologia e escala de cor; um jammer de banda larga (barragem) ao lado de ruído CW, de banda estreita, chirp e adaptado; J/S por banda e C/N0 efetivo a partir da cadeia inalterada do coeficiente de separação espectral

# text
seg-a3b398f66ad3 = Redução à cadeia de espectro existente e à equação anti-jam do tipo de cenário jamming (uma banda de componente única dá os mesmos números que antes da extensão) e aos espectros de sinal das linhas validadas. As potências dos jammers, a cronologia, as larguras de banda do front-end e os sinais projetados são entradas, e um sinal projetado é truncado na sua banda de transmissão (sem emissão fora de banda).

# text
seg-f92d6cbc58d4 = Coeficientes de atenuação específica por chuva para qualquer banda que uma ligação LEO-PNT utilize

# text
# c1: leo-pass
seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 equações ({ "1" }) a ({ "5" }): k_H, alpha_H, k_V, alpha_V a partir dos ajustes de curva das Tabelas { "1" } a { "4" }, o (k, alpha) dependente do trajeto e da polarização e a atenuação específica k R^alpha; usado pelo termo de chuva do tipo de cenário <c1/>

# text
seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Tabela { "5" }, os próprios k_H, alpha_H, k_V, alpha_V tabelados da Recomendação, registados em tests/fixtures/leo_link/p838_3_table5.csv com o URL do PDF e a data de obtenção. A tabela está arredondada aos dígitos impressos, pelo que o limiar é esse arredondamento

# text
seg-f4a311f936de = Atenuação por chuva de longo prazo em trajeto oblíquo numa ligação Terra-espaço

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 secção { "2.2.1.1" } passos { "2" } a { "10" } (trajeto oblíquo e horizontal abaixo da altura da chuva, fatores de redução horizontal e de ajuste vertical, A0.01 e a sua escala para { "0.001" } % a { "5" } % de um ano médio), com a altura da chuva (P.839) e R0.01 (P.837) como entradas porque o motor não traz nenhum dos mapas digitais; aplicado por banda e época pelo tipo de cenário <c1/>

# text
seg-325d1bb9c26d = Ficheiro de exemplos de validação da ITU-R Study Group { "3" } CG-3M3J-13-ValEx-Rev8.3.0 para P.618-14, tal como tabulado pelas páginas de validação do ITU-Rpy, com a altura da chuva P.839-4 de cada local tirada dos mesmos exemplos; registado em tests/fixtures/leo_link/p618_14_rain_attenuation.csv com os URL e a data de obtenção. Valida o procedimento dado h_R e R0.01, não os mapas

# text
seg-6b51ec84bdce = Cintilação troposférica de amplitude numa ligação Terra-espaço

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 secção { "2.4.1" } passos { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do trajeto, fator de média da antena, profundidade de desvanecimento para { "0.01" } % a { "50" } % do tempo), com N_wet uma entrada ou calculado a partir da temperatura, humidade e pressão pelas expressões ITU-R P.453-14; abaixo de { "4" } GHz o tipo de cenário <c1/> assinala o valor como extrapolação

# text
seg-7fc4a1e7960a = Exemplos de validação da ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação de P.618-14, com o N_wet P.453-14 de cada local tirado dos mesmos exemplos; registados em tests/fixtures/leo_link/p618_14_scintillation.csv com os URL e a data de obtenção. A expressão da refratividade húmida a partir da temperatura e da humidade não é coberta por esta linha

# text
seg-e0d40cf4ea79 = Perda de penetração em edifícios para um utilizador LEO-PNT em interiores

# text
# c1: leo-pass
seg-4f06274e38ec = ITU-R P.2109-2 Anexo { "1" } equações ({ "1" }) a ({ "10" }) com a Tabela { "1" }: a perda não excedida com probabilidade P para edifícios tradicionais e termicamente eficientes à elevação do trajeto na fachada, { "80" } MHz a { "100" } GHz; aplicada por banda e época a um utilizador em interiores pelo tipo de cenário <c1/> (o caso UHF em interiores)

# text
seg-99c648f9c6eb = Os valores do livro de cálculo de validação Clutter and BEL da ITU-R Study Group { "3" }, tal como transcritos no script de validação da implementação MATLAB de referência (github.com/eeveetza/p2109), registados em tests/fixtures/leo_link/p2109_bel.csv com o URL e a data de obtenção. O livro de cálculo imprime três casas decimais

# text
seg-8c5e291c8ff8 = Atraso ionosférico de primeira ordem por banda, a combinação livre de ionosfera e a perda em espaço livre

# text
seg-89df726127f9 = Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes livres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação de ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) para qualquer par de bandas; a perda em espaço livre { "20" } log10({ "4" } pi R f/c) de linkbudget::free_space_loss_db na sua forma quilómetro-megahertz

# text
seg-9bf00f744174 = IS-GPS-200 secção { "20.3.3.3.3.2" }, que indica a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } que decorre da escala de primeira ordem 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escala, não um TEC oblíquo

# text
seg-c584a867fcda = Doppler máximo que um utilizador estático vê de uma órbita LEO ou MEO

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: uma busca sobre cada posição da órbita e cada utilizador no horizonte do satélite de uma órbita circular, com a Terra em rotação, da maior taxa de variação de distância, mais as velocidades orbital e a maior velocidade do satélite fixa à Terra; comunicada por banda como a envolvente de Doppler pelo tipo de cenário <c1/> e usada como janela de busca de arranque a frio do seu modelo de baixa energia

# text
seg-4abd3afebad2 = Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabela { "1" } (recetor estático numa esfera de { "6371" } km, a rotação da Terra o único outro efeito): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz em L1. Cobre órbitas circulares de dois corpos

# text
seg-d9eb3e7e69c2 = Uma passagem LEO-PNT e o seu orçamento de ligação por banda face aos satélites GNSS MEO à vista

# text
# c1: leo-pass
seg-d986e44443dd = O tipo de cenário <c1/>: satélites a partir de uma passagem projetada, elementos, um TLE através de SGP4 ou uma constelação Walker de constellation-design; por banda e época os ângulos de visada, a distância, a taxa de variação de distância e a aceleração de distância em forma fechada (verificadas em cada execução face a diferenças centrais e comunicadas), a perda em espaço livre, o EIRP com diagrama isofluxo, gaussiano ou plano, uma antena de utilizador de patch, hemisférica ou isotrópica, a atenuação gasosa do Anexo { "2" } de ITU-R P.676-10, a chuva e a cintilação de P.618, a perda de penetração em edifícios de P.2109, o desajuste de polarização, a temperatura de ruído do sistema, C/N0, Doppler e taxa de Doppler, e o atraso de primeira ordem a partir de um TEC oblíquo de Klobuchar ou de TEC vertical escalado pela fração de Chapman abaixo do satélite; pares livres de ionosfera com ruído de código no pico da passagem; portadoras Galileo ou GPS a partir das suas potências recebidas do documento de interface através do mesmo recetor

# text
seg-c558a6519038 = Formas fechadas e autoconsistência: as identidades de taxa de variação de distância e de aceleração de distância face a derivadas numéricas, o ganho isofluxo a cancelar o crescimento da distância, os limites de perda de polarização dos manuais, a observação qualitativa LEO-versus-GNSS (uma passagem em forma de sino de minutos com pico vários dB acima de portadoras GNSS planas de 44-51 dB-Hz). Os EIRP e os diagramas são potências recebidas publicadas convertidas em EIRP ou escolhas representativas, o termo gasoso é o método simplificado P.676-10 superado, e nada é comparado com um C/N0 LEO medido

# text
seg-95a077a980b6 = Predefinições de sistemas LEO-PNT com nome e fontes indicadas, e um motor agnóstico ao sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérico (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como sinal de oportunidade apenas de Doppler, CentiSpace e uma predefinição opcional Celeste IOD, cada uma com a sua fonte marcada PUBLIC (com URL), REPRESENTATIVE ou WORKSHOP, a de workshop no ficheiro opcional da predefinição Celeste IOD, compilada apenas quando esse ficheiro existe; cada banda e órbita podem ser substituídas num cenário, e um cenário pode não indicar nenhuma predefinição

# text
seg-399dc53ceafb = Transcrição dos valores públicos citados e uma verificação de consistência: um EIRP definido a partir de uma potência mínima recebida publicada prevê o máximo publicado a menos de { "0.5" } dB com um diagrama plano. Isso é uma verificação da dispersão de distância, não uma validação da antena de nenhum satélite; as predefinições representativas não fazem qualquer afirmação sobre um sistema real

# text
seg-a39f34973373 = Posicionamento de baixa energia: tempo até à primeira solução de posição e energia por solução de posição face ao ciclo de trabalho

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy e a secção [iot] do tipo de cenário <c1/>: integração coerente limitada pela taxa de Doppler, somas não coerentes de lei quadrática até um limiar de deteção, uma busca por intervalos de Doppler sobre a envolvente de utilizador estático da órbita (a frio) ou uma janela assistida (a quente), busca de código paralela ou serial, tempo de mensagem de navegação num arranque a frio, energia por solução de posição e duração da bateria ao longo dos intervalos de solução, para cada banda LEO e o sinal GNSS

# text
seg-a5fa1ef1be9b = Consistência interna de um modelo de projeto indicado: cada potência, limiar e escolha de busca é uma entrada, e o modelo ignora a ambiguidade de transição de bit, a falha de deteção e a reaquisição. Não comparado com um recetor medido

# text
seg-7e94f8b38cff = Pesos do erro de distância do sinal no espaço, em média global, para qualquer altitude de órbita

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: o peso radial w_R e o peso transversal ao quadrado w_AC^{ "2" } como médias de cos^{ "2" } e de metade de sin^{ "2" } do ângulo de nadir da linha de visão sobre utilizadores uniformemente distribuídos na calote terrestre visível acima de uma máscara de elevação, para qualquer raio de órbita, por integração de Simpson; usado por cada valor SISRE de leo-navmsg (a { "510" } km, w_R { "0.46" } e w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = A tabela publicada de fatores de ponderação SISRE de Montenbruck, Steigenberger e Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } e 1/49, GLONASS { "0.98" } e 1/45, Galileo { "0.98" } e 1/61, BeiDou MEO { "0.98" } e 1/54, BeiDou IGSO/GEO { "0.99" } e 1/126. A mesma média avaliada a raios LEO dá os pesos LEO; nenhuma tabela LEO publicada é fixada, pelo que os valores LEO são o método validado aplicado, não validados em separado

# text
seg-3cbb8b6afe3c = Algoritmo de utilizador de efemérides de difusão do Galileo ICD como base de uma mensagem de navegação LEO

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: a avaliação kepleriana do Galileo OS SIS ICD (equação de Kepler, correções de segundo harmónico, nó fixo à Terra) escrita em separado do avaliador RINEX do motor, que devolve a posição com o argumento de latitude, a inclinação e o nó a partir dos quais é construído o referencial de correção ao longo/transversal/radial, e os termos de extensão de Liu et al. { "2025" }

# text
seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos posições ECEF (uma implementação independente do mesmo algoritmo do ICD) para registos de difusão reais BKG/IGS de 2024-09-10, ambos registados com proveniência em tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Isto valida o algoritmo de utilizador kepleriano; as correções ao longo/transversal/radial acrescentadas por cima são cobertas pelas suas próprias linhas, e os termos de Liu pela linha de 22 parâmetros de Liu et al. { "2025" }

# text
seg-d65102fd4a1d = Verificação de trama CRC-24Q para a mensagem de navegação LEO

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: polinómio gerador 0x1864CFB, valor inicial { "0" }, sem reflexão, sem XOR final, a verificação que a trama LEO do Kshana transporta sobre cada byte precedente

# text
seg-18c79d18e4e4 = O valor de verificação do catálogo CRC para estes parâmetros (catálogo CRC reveng.sourceforge.io, CRC-24/LTE-A: largura { "24" }, poli 0x864CFB, init { "0" }, verificação 0xCDE703), que são os parâmetros CRC-24Q de RTCM { "10403" } e do Galileo OS SIS ICD, e a trama de exemplo do tipo de mensagem { "1005" } impressa em RTCM { "10403" }

# text
seg-82b9b0f7b07c = Ajustador de efemérides de difusão LEO e erro de distância do sinal no espaço face ao intervalo de ajuste e ao período de atualização

# text
# c1: leo-navmsg
seg-8c7065aa22bd = O ajustador e o compromisso do tipo de cenário <c1/>: uma órbita de referência integrada com gravidade zonal J2-J6 ou EGM2008 até ao grau escolhido e arrasto, e um relógio livre ou governado com semente; um ajuste de Levenberg-Marquardt do conjunto kepleriano do Galileo em elementos não singulares com priors fracos, depois polinómios de correção ao longo da trajetória, transversal e radial por mínimos quadrados lineares; o polinómio de relógio ajustado líquido do termo relativista do utilizador; SISRE (só órbita e com relógio) sobre períodos de utilização centrados nas suas janelas de ajuste, face ao intervalo de ajuste e ao período de atualização. Parte validada: o ajuste kepleriano de 16 parâmetros e o seu SISRE só de órbita face ao intervalo de ajuste em órbitas precisas reais, e a órbita de referência integrada J2-J6/EGM2008({ "20" }, { "70" })/arrasto face ao Orekit { "12.2" } a menos de { "4.6" } mm ao longo de { "6" } h (limiar { "2" } cm, mesma entrada de densidade); os polinómios de correção, o ajuste do relógio (relógio livre ou governado com semente) e o compromisso do período de atualização continuam modelados

# text
seg-7dfbc8297444 = Órbitas científicas precisas reais como referência (órbitas de dinâmica reduzida operacionais TU Graz IfG/ITSG, livres para qualquer utilização com reconhecimento; valores SHA-256 no NOTICE do fixture) ajustadas pelo conjunto de 16 parâmetros sobre arcos de { "20" } e { "30" } min, face às estatísticas que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publicam para os mesmos satélites e dias: RMS ao longo, transversal e radial cada um dentro de 1.5x (medido { "0.804" } a { "1.087" }), SISRE dentro de 1.5x (medido { "0.716" } a { "0.809" }) e pesos SISRE a menos de { "0.005" } da sua Tabela { "2" } (medido { "0.0007" }); tolerâncias fixadas antes da comparação. O critério por componente dá dentes ao teste: anular a taxa de inclinação deixa cada razão SISRE dentro de 1.5x mas falha o critério transversal. A razão SISRE uniforme de { "0.72" } a { "0.81" } é a do artigo: os seus valores SISRE impressos usam os pesos da Tabela { "2" } sem quadrado em vez da sua própria Eq. { "9" }, que o Kshana segue (Montenbruck et al. { "2018" }). A órbita de referência integrada (zonal J2-J6, EGM2008 até ao grau { "20" } e { "70" }, arrasto) concorda com o Orekit { "12.2" } (CS GROUP, Apache-2.0) e o Hipparchus { "3.1" }, propagados a partir do mesmo estado inicial nos mesmos referenciais com a mesma entrada de densidade, a menos de { "4.55" } mm ao longo de { "6" } h (limiar de { "0.02" } m fixado antes da execução, pré-registo 65e4d46c). Fora da afirmação: os polinómios de correção, o ajuste do relógio e o compromisso do período de atualização, que mantêm verificações internas (uma órbita de referência de dois corpos recuperada pelo conjunto de 16 parâmetros a menos de { "1" } mm, e uma verificação cruzada interna em numpy das mensagens exportadas em GRACE-FO com o seu relógio CLK1B, que foi escrita e executada por este projeto e não é uma referência independente)

# text
seg-8121e7db3db3 = Atualização da mensagem de navegação LEO a meio da passagem com verificação de continuidade na comutação

# text
# c1: leo-navmsg
seg-34c310d85c42 = A análise de atualização a meio da passagem <c1/>: a passagem mais alta sobre um utilizador dentro de um intervalo de busca, mensagens num calendário global com períodos de utilização centrados nas suas janelas de ajuste e, em cada comutação, o salto de posição 3D, o salto de relógio, o salto de pseudodistância do utilizador, o maior salto sobre qualquer linha de visão visível (forma fechada sobre o cone de nadir), o erro de distância antes e depois, e PASS/FAIL face a um limiar

# text
seg-418f2cd21141 = Consistência interna (a identidade do salto e o limite do cone face a amostragem por força bruta). O limiar é uma entrada; nenhum requisito de continuidade LEO publicado é fixado

# text
seg-7635a8339e78 = Codificação binária documentada da mensagem de navegação LEO com um orçamento de erro de quantização

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: a trama própria do Kshana (preâmbulo, versão, modelo, comprimento, carga útil, CRC-24Q) para os quatro modelos de efemérides, o polinómio de relógio, SVID, issue of data, banda, estado de saúde, um conjunto Klobuchar, coeficientes NeQuick-G e parâmetros UTC, cada campo com uma largura e um passo indicados (field_table), quantização com recusa de intervalo e um orçamento da maior variação de posição e de relógio que uma variação de meio passo de cada campo provoca ao longo da janela de validade

# text
seg-4261a9fac5d9 = Identidades de ida e volta e o próprio orçamento. O formato é o próprio do Kshana, modelado nos componentes de mensagem publicados e no conjunto de campos do Galileo ICD; não é o layout de bits do Celeste nem de qualquer outro sistema (nenhum é público), pelo que não existe layout externo face ao qual validar

# text
seg-17ca41d7fd71 = Exportações em estilo RINEX-4 e CSV de mensagens de navegação LEO

# text
seg-185e12ccef0d = leo_navmsg::text: um bloco em estilo RINEX-4 (cabeçalho de registo > EPH, linha de satélite e época com três termos de relógio, linhas de órbita de difusão D19.12) com letra de sistema L e tipos de registo KP16, KRAC, LU22 e APOL, etiquetado em cada cabeçalho como extensão do Kshana que não faz parte do RINEX { "4.02" }, e uma tabela CSV com um esquema de colunas por omissão e esquemas predefinidos, cada um com um importador

# text
seg-5cc5b6382437 = Idas e voltas e a aritmética de calendário. O RINEX { "4.02" } não define registos de navegação LEO (IGS RINEX { "4.02" }), pelo que o layout é uma extensão documentada com arXiv { "2401.17767" } citado como estado da técnica; não existe leitor externo dele face ao qual verificar

# text
seg-ff15935ba1b3 = Modelo de efemérides LEO de 22 parâmetros de Liu et al. { "2025" } e o seu ajuste em órbitas precisas reais

# text
seg-6af1b6f3bbd4 = a variante Liu22 de leo_navmsg::elements::EphemerisModel, avaliada por kepler_point com Liu22Extra: o conjunto de 16 parâmetros mais uma taxa do semieixo maior a_dot, uma taxa de movimento médio n_dot que entra como n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transcrita da Eq. { "1" } do artigo (a comparação de ajuste não depende desta convenção de escala, pelo que o significado de um valor nDot transmitido não é aqui validado), e harmónicos de raio de uma e de três por revolução Crs1, Crc1, Crs3, Crc3 sobre o argumento de latitude não corrigido. O seu ajuste por leo_navmsg::fit::fit_message adota o arranque e o estimador da Secção { "2.3" } do artigo (cada correção começa em zero; mínimos quadrados simples sem priors; o limite de 100 iterações do artigo), mas pára pela regra de convergência de parâmetros do Kshana (cada passo abaixo de { "1e-3" } do seu sigma formal) em vez da regra do artigo de uma variação de RMS abaixo de { "0.1" } mm. Ajustado sobre arcos de { "20" } e { "30" } minutos de uma órbita precisa tabulada

# text
seg-90768b99ab5f = Medido: as órbitas de dinâmica reduzida operacionais TU Graz IfG/ITSG (livres para qualquer utilização com reconhecimento; valores SHA-256 no NOTICE do fixture) de GRACE-A, GRACE-C, Sentinel-2A e Sentinel-6A são a referência, ajustadas sobre arcos de { "20" } e { "30" } min, e comparadas com as linhas de 22 parâmetros (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) das Tabelas { "4" }, { "5" }, { "6" } e { "8" } de Liu, Su, Xie, Zhou e Qu ({ "2025" }), Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894 (CC BY { "4.0" }; números citados, não incorporados). Limiares fixados antes da primeira comparação: RMS ao longo, transversal e radial cada um dentro de 1.5x bilateral, e SISRE dentro de 1.5x, para cada satélite e ambos os comprimentos de arco. A nova execução da ronda 2 foi pré-registada (aa559785) antes da alteração do motor e antes de as órbitas reservadas serem obtidas: o ajuste da Eq. { "1" } e da Secção { "2.3" } do artigo, mais dois novos dias reservados por satélite face aos mesmos valores impressos. Medido: cada razão dos dias do artigo { "0.755" } a { "1.138" }, e cada razão reservada { "0.683" } a { "1.186" }. Divulgado: as razões ao longo da trajetória de { "20" } min da primeira execução, { "1.71" } (Sentinel-2A) e { "1.86" } (Sentinel-6A), eram conhecidas antes da nova execução. As razões SISRE reservadas mais baixas ficam perto do limite inferior de { "0.667" } porque o SISRE impresso no artigo usa os pesos da Tabela { "2" } sem quadrado (ver a linha do ajustador de 16 parâmetros). O pré-registo descreveu mal a regra de paragem do artigo (o artigo pára numa variação de RMS abaixo de { "0.1" } mm); a regra de convergência de parâmetros pré-registada foi mantida. Mutação: restaurar priors centrados em zero dá, para o Sentinel-6A, { "1.08" } face a { "0.70" } cm ({ "1.54" }) ao longo da trajetória em { "20" } min, o que falha. Sonda do revisor: a convenção anterior à 0.30 (um fator 1/2 em n_dot) deixa todos os valores inalterados, pelo que a comparação restringe o espaço de funções do modelo de 22 parâmetros e a qualidade do seu ajuste, não a convenção de n_dot. Fora da afirmação: o polinómio ECEF ATOMIC e a tabela sintética de comparação de modelos a cinco altitudes, que têm a sua própria linha MODELLED

# text
seg-e79047fc95af = Polinómio ECEF de relógio nulo do ATOMIC e a comparação sintética de modelos LEO a cinco altitudes

# text
seg-e261843e35b1 = a variante EcefPoly de leo_navmsg::elements::EphemerisModel: um polinómio ECEF por eixo sem termos de relógio, o termo relativista a partir de -2 r.v/c^{ "2" }, avaliado face a um relógio governado. Também a análise de comparação de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta o modelo de 22 parâmetros às cinco altitudes do artigo sobre arcos de 20 minutos de uma órbita integrada pelo Kshana e imprime o resultado ao lado do SISRE publicado

# text
seg-a3b92fdcc591 = Factos do modelo ATOMIC do InsideGNSS (polinómio de 6.ª ordem, cerca de um minuto de validade, atualização a { "30" } s, relógio governado, erro de relógio de { "24" } cm). São factos descritivos sem valores publicados com que comparar. A tabela de cinco altitudes imprime o SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } e { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } e { "1336" } km num arco de 20 minutos) ao lado do ajuste do Kshana na sua própria órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } e { "0.51" } cm; razões { "0.46" } a { "0.77" }), não fixados, porque o artigo ajustou órbitas precisas reais e as referências diferem. O modelo de 22 parâmetros e o ajuste em si são validados face a órbitas reais na linha Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. { "0.30" } revisão: os valores da tabela mudaram com o ajuste na convenção do artigo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Serviços ionosféricos de frequência única e de UTC de uma mensagem de navegação LEO

# text
seg-bc73bfeca68e = leo_navmsg::services: o atraso de difusão Klobuchar em qualquer portadora (o modelo L1 do motor escalado por (f_L1/f)^{ "2" }), o nível efetivo de ionização NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } com as regras de zeros totais e de [{ "0" }, { "400" }] sfu, e a escala de tempo do sistema para UTC com os três casos de segundo intercalar do ICD

# text
seg-84500ea94d49 = GNSSTk { "15.3.1" } (ARL:UT, LGPL-3.0, commit 55ea3344, executado como programa separado através de uma infraestrutura de ensaio; nenhum código do GNSSTk é incorporado): getIonoCorr de KlobucharIonoNavData em L1, L2 e L5, getEffIonoLevel de NeQuickIonoNavData para Az com as regras de zeros totais e de [{ "0" }, { "400" }] sfu, e getOffset de GPSLNavTimeOffset para a deriva de UTC, dentro de { "1e-3" } m, { "1e-6" } sfu e { "1e-9" } s; e ERFA através do pyerfa { "2.0.1.5" } (BSD-3), que deriva o UTC da tabela de segundos intercalares do IERS, para os três casos de segundo intercalar do ICD nos segundos intercalares reais de 2015-06-30 e 2016-12-31, incluindo a leitura { "23" }:{ "59" }:{ "60" }, dentro de { "1e-9" } s (o GNSSTk não implementa a regra de comprimento do dia do caso (b) do ICD, pelo que não foi usado aí, como escrito no pré-registo). As entradas são os coeficientes reais do cabeçalho IGS BRDC. Pré-registado (6a66994b; a adenda 88807a7e registou um subconjunto de { "21" } 602 linhas da grelha de segundos intercalares antes de qualquer valor do Kshana ser comparado). A integração da densidade eletrónica NeQuick não está implementada, e não é feita qualquer correção para um satélite LEO que voa dentro da ionosfera

# text
seg-0af8030f4d21 = Doppler que um recetor em terra tem de tratar a partir de um satélite de navegação LEO

# text
# c1: leo-pvt
seg-9714103964d6 = Taxa de variação de distância exata de um satélite cuja posição e velocidade fixas à Terra provêm de uma órbita de dois corpos com a deriva secular J2 e a rotação da Terra (leo_fusion::geom::EarthOrbit::state, velocidade a derivada temporal exata da posição), convertida em Doppler numa portadora; o maior Doppler absoluto, taxa de Doppler e jerk acima de uma máscara de elevação numa janela (leo_fusion::doppler::doppler_envelope), comunicados por sistema LEO pelo tipo de cenário <c1/> no modo doppler

# text
seg-ebf6cee8ec4c = Valores publicados reproduzidos a partir da órbita e da portadora indicadas: Doppler do Iridium até mais ou menos { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) e Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe e Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). O valor do Iridium é um limite superior arredondado, daí o limiar de { "5" }%. A taxa de Doppler e o jerk são comunicados mas não validados: o jerk modelado de passagem pelo zénite do Pulsar X1 é de cerca de { "1.0" } Hz/s^{ "2" } face ao publicado { "1.26" }

# text
seg-d2e18c8bdc14 = Posicionamento a partir do Doppler LEO, com um ou vários satélites, com estados de deriva de relógio e de velocidade

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamento em lote de Gauss-Newton a partir da taxa de variação de distância com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade de utilizador constante como opção, uma pseudomedição de altura para um utilizador à superfície, passos amortecidos; a covariância formal na referência; projeções ao longo da trajetória, transversal e vertical; a exatidão de uma só passagem face ao desvio transversal do utilizador; o instante de maior aproximação. O modo doppler do tipo de cenário <c1/> acrescenta o erro face ao comprimento da janela e um modo de sinais de oportunidade só de Doppler (a predefinição starlink-sop)

# text
seg-84e2eb636579 = Consistência interna: recuperação sem ruído, a identidade cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivada numericamente, Doppler nulo na maior aproximação, a solução espelhada de uma única passagem e erros com semente face à covariância formal. O valor do Starlink de Kozhaya, Saroufim e Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: cerca de { "2" } m em { "20" } s com três satélites) é apenas uma comparação: o recetor modelado, com efemérides perfeitas e todo o erro num sigma de Doppler de { "30" } Hz, é várias vezes menos exato na mesma janela, e o recetor e a taxa de medição do artigo não são reproduzidos

# text
seg-7f462969d2d4 = Posicionamento conjunto por pseudodistâncias GNSS e LEO com desvios entre sistemas e modelos de erro por sinal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluções de posição de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de recetor por sistema (o desvio entre sistemas estimado com a posição) ou um desvio de difusão conhecido na escala de tempo de referência; sigmas por medição fornecidos pelo chamador, por omissão o ruído térmico da malha de seguimento de atraso do motor (navsignal::dll_code_jitter_chips) ao C/N0 da elevação combinado com o erro de distância do sinal no espaço; DOP sem ponderação (GDOP, PDOP, HDOP, VDOP, TDOP) no referencial geodésico local, sigmas formais este-norte-cima e os sigmas dos desvios; o modo conjunto de <c1/> compara soluções só GNSS, só LEO e fundidas e varre o DOP face ao número de satélites LEO acrescentados

# text
seg-e83699418c0e = Um DOP de quatro satélites derivado à mão (um satélite no zénite e três no horizonte a { "120" } deg uns dos outros, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com o seu próprio relógio e um satélite não acrescenta geometria, recuperação sem ruído da posição, do relógio e do desvio, e erros com semente face à covariância. Apenas verificações internas; não comparado com a saída de um recetor. { "0.30" } comparação externa, uma constatação (mantém-se MODELLED): num dia IGS multi-GNSS (ABMF 2018-05-13, GPS e Galileo C1C, efemérides de difusão, Klobuchar) o desvio entre sistemas concorda com o RTKLIB v2.4.2-p13 rnx2rtkp (diferença mediana -0.11 ns depois da correção do atraso de grupo de difusão { "0.30" }, -0.35 ns antes; limiar { "1" } ns), mas apenas { "93.6" } % de { "280" } épocas ({ "93.2" } % antes da correção) ficam a menos de { "3" } m da coordenada ITRF2020 face aos { "95" } % pré-registados. O próprio RTKLIB atinge { "88.2" } % nos mesmos dados, pelo que o limiar está além do posicionamento por difusão de frequência única nesta estação e dia e não se deve a uma discrepância do resolvedor; o teste de comparação está registado como ignorado. { "0.30" } ronda { "2" }, entradas mais estritas ao limiar inalterado de { "3" } m / { "95" } % / { "1" } ns, uma constatação (mantém-se MODELLED): com o par livre de ionosfera Galileo E1/E5a (pré-registado { "6927e039" }) { "79.9" } % das épocas ficam a menos de { "3" } m (RTKLIB { "67.9" } %); com órbitas, relógios, desvios de antena de satélite e desvios de código precisos CODE MGEX (pré-registado 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), e o desvio entre sistemas difere do RTKLIB em -1.03 ns porque o modo single do RTKLIB ignora os desvios de antena de satélite (+{ "0.04" } ns quando ambos os omitem)

# text
seg-ee9a4a0cb530 = Convergência de posicionamento de ponto preciso apenas com GNSS e com aumento por LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Um filtro de Kalman estendido PPP float sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de recetor branco, um desvio entre sistemas por sistema adicional, um atraso húmido zenital em passeio aleatório mapeado por 1/sin(elevação), uma ambiguidade float por arco de satélite acrescentada ao nascer e descartada ao pôr, e o erro preciso de órbita e relógio comum ao código e à fase de um satélite, processado como uma atualização correlacionada de duas linhas numa forma estabilizada de Joseph; medições simuladas a partir do mesmo modelo; tempo de convergência (erros abaixo dos limiares até ao fim da execução), curvas de erro e o NEES de posição médio da execução para apenas GNSS e cada caso LEO, executado como o tipo de cenário <c1/>

# text
seg-be4593802ccf = O teste qui-quadrado do NEES é uma verificação de consistência interna (a referência e o filtro partilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min encurtado para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário incluído dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com as suas próprias camadas representativas de { "1000" } km, { "60" } deg, ruído e estações; as constelações, o ruído e a definição de convergência do artigo não são reproduzidos, pelo que isto é uma consistência MODELLED da tendência (encurtamento monótono, a maior constelação abaixo de um terço do tempo só com GNSS), não uma validação

# text
seg-8ef013b46d0f = Exatidão de posicionamento de redes não terrestres 5G a partir da largura de banda do sinal

# text
# c1: ntn-positioning
seg-12b1e4657370 = O limite de Cramér-Rao sobre o tempo de chegada a partir da largura de banda quadrática média (Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espectro OFDM plano (beta = B/sqrt({ "12" })), um espectro BPSK de banda limitada (numerador em forma fechada) ou qualquer espectro por quadratura, e sobre a frequência de um tom complexo, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); soluções de posição por tempo de chegada em ligação descendente com um relógio de recetor desconhecido e uma solução de posição por Doppler de um só satélite ao longo de uma passagem na banda S MSS n256 do 3GPP, executados como o tipo de cenário <c1/>

# text
seg-f63e1d78cfff = Valores de exemplo publicados (P1): Bachl, Lei e Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), limites de SSB único de NR NTN reproduzidos a partir do mapa SSB do 3GPP TS { "38.211" } através das funções numéricas próprias do Kshana (W_rms { "1.9616" } vs { "1.96" } MHz, sigma_t { "38.755" } vs { "39" } us, sigma_f 100.79/87.28 vs 101/87 Hz, sigma_rho 0.5970/0.5831 vs 0.60/0.58 m, cada um dentro de meia unidade do último dígito impresso); larguras de banda RMS BPSK-R da Tabela { "1" } de Betz { "2001" } (1.128/3.477 vs 1.1/3.5 MHz, suplementar); as covariâncias das soluções de posição por tempo de chegada e por Doppler concordam com numpy { "2.4.6" } numpy.linalg.inv sobre a geometria exportada (P2; { "5e-15" } e { "1.2e-5" } em termos relativos, limiares { "1e-5" } e { "1e-3" }). Pré-registado (9f2875db; parte C 0d66dccd). A solução de posição do motor joint_pvt::formal_sigma_enu (o limite avaliado na posição verdadeira, não na solução com ruído) foi escrita depois de a primeira execução de { "200" } kHz ter falhado a { "6.5e-5" } e foi reexecutada à tolerância inalterada. As formas de espectro plano e de tom complexo que o cenário executa (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz) chegam à verificação P1 através de testes unitários de identidade no crate. Limites num canal sem multipercurso, não exatidão atingida. { "0.30" } revisão: ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m (NR { "5" } MHz) e { "25.938613" } -> { "25.938839" } m (NB { "200" } kHz)

# text
seg-9306f1c06081 = Transferência de tempo para UTC assistida por LEO face ao C/N0 e ao oscilador do recetor

# text
# c1: leo-pvt
seg-c618feb01476 = Medições de relógio de cada satélite LEO à vista numa posição conhecida, combinadas por variância inversa a partir do modelo de ruído de pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o ruído de frequência branco e de passeio aleatório da classe do oscilador (slot_timing::ClockNoise, clock_state::ClockClass; a variância de deriva de holdover::coast_phase_variance), um relógio de referência com semente dos mesmos níveis, e a expressão de escala de tempo do sistema para UTC da secção { "20.3.3.5.2.4" } do IS-GPS-200 com uma incerteza do desvio de difusão acrescentada como desvio por execução; o modo timing de <c1/> varre osciladores e desvios de C/N0

# text
seg-4a878bd4a90f = Consistência interna: a expressão de desvio publicada avaliada à mão, o erro normalizado sobre { "40" } sementes e o piso definido pela incerteza do desvio. O valor do NIST para recetores de temporização Iridium com um relógio atómico miniatura (abaixo de { "40" } ns de UTC(NIST) ao longo de { "40" } dias) é apenas uma comparação; o cenário Iridium incluído dá { "10" } a { "11" } ns de RMS à potência nominal com o seu erro de distância representativo de { "5" } m. O ruído de frequência flicker e o atraso ionosférico não são simulados

# text
seg-cef79d82f0d4 = Cobertura LEO e diluição da precisão para utilizadores polares e árticos face ao GNSS MEO

# text
# c1: leo-pvt
seg-462a5e95d480 = Satélites à vista e PDOP, HDOP e VDOP medianos com disponibilidade face à latitude, sobre longitudes e épocas amostradas, para os sistemas GNSS MEO isolados, os sistemas LEO isolados e todos em conjunto, cada sistema com a sua própria máscara e modelo de relógio, executado como o modo polar de <c1/>; as órbitas são conjuntos de elementos SGP4/SDP4 na época do varrimento (2026-01-01T00:{ "00" }:{ "00" } UTC no modo polar) levados para o referencial fixo à Terra no caminho de órbita terrestre validado (IAU 2006/2000A, UT1 = UTC, sem movimento polar)

# text
seg-a16896913438 = Orekit { "13.1.8" } (Apache-2.0) com Hipparchus { "4.0.3" }: os estados GCRS do motor rodados para ITRF pelo Orekit (IERS { "2010" }), visibilidade WGS-84 TopocentricFrame face à máscara de cada sistema, org.orekit.gnss.DOPComputer para uma incógnita de relógio e NumPy { "2.4.6" } numpy.linalg.inv (P2) para várias; com o caminho verificado face ao python-sgp4 e ao ERFA (linha 'One Earth-orbit path'). Limiares fixados antes da execução (pré-registado 72ea9eb0; T2 e T3 são os limiares da ronda 2 de { "0.30" }). O passo TEME -> GCRS congelado em J2000 faz o teste ficar vermelho ({ "4739" } falhas). Apenas geometria; sem cintilação, terreno nem potência de sinal. O VDOP do GNSS sobe em direção ao polo ({ "1.20" } no equador a { "1.51" } a { "89.9" } deg para GPS e Galileo no cenário incluído) enquanto uma camada LEO quase polar converge aí. Histórico: a ronda { "2" } (3254d456) concordou em estados de dois corpos tabulados; a afirmação completa da ronda 1 de D8 face à própria propagação TLE do Orekit (e947e69d) foi uma constatação, o SDP4 do Orekit com e = { "0" } e o seu TEME IERS { "1996" }, fixada

# text
seg-d92777401093 = Sistemas LEO PNT com nome como predefinições de dados opcionais, cada um com a sua fonte

# text
seg-5130bfe2410c = Entradas agnósticas ao sistema: cada sistema é camadas Walker, elementos explícitos ou uma predefinição GNSS, um sinal (portadora, taxa de chips, largura de banda, potência recebida ou intervalo de C/N0), um SISRE, um sigma de Doppler e um modelo de relógio; as predefinições preenchem apenas o que um cenário omite, um ficheiro cada, com fontes marcadas PUBLIC (com um URL), WORKSHOP ou DERIVED e os valores não publicados listados como representativos: Xona Pulsar X1/X5, Iridium STL, sinais de oportunidade Starlink, CentiSpace, um sistema representativo de banda C, o modelo de efemérides de relógio nulo ATOMIC e uma predefinição derivada de workshop no ficheiro opcional de predefinições Celeste IOD, retida ao apagar esse ficheiro e os seus cenários

# text
seg-c6f71b3937cd = Transcrição dos valores públicos citados, verificada quanto à estrutura (cada fonte pública tem um URL, os padrões Walker dividem-se uniformemente, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não face a uma referência independente externa. Os valores representativos são indicados em cada predefinição e são ilustrativos

# text
seg-dec52b5b9cd6 = Um sistema LEO-PNT de ponta a ponta: projeto de sinal, orçamento de ligação da passagem, mensagem de navegação e posicionamento fundido, com a saída de cada fase passada à seguinte

# text
# c1: leo-pnt-chain
seg-39443b31d418 = O tipo de cenário <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chips e a divisão de EIRP de uma banda leo-pass; a passagem dá o C/N0 da componente seguida e o jitter de código de banda limitada por época; uma reta de C/N0 por mínimos quadrados em sin(elevação), o SISRE da mensagem leo-navmsg (ajustado à órbita do satélite da passagem, mais um termo indicado de determinação de órbita em soma quadrática) e a portadora e a taxa de chips do projeto vão para cada sistema LEO de uma solução conjunta leo-pvt e, opcionalmente, para os casos LEO de leo-ppp; cada transferência é comunicada com o seu valor e unidade

# text
seg-854d3c1428d0 = Autoconsistência das transferências: cada valor transmitido é igual à saída da fase a montante, e alterar uma entrada a montante move cada valor a jusante que dela depende. As fases mantêm as suas próprias etiquetas; a cadeia não acrescenta física nem referência independente externa

# text
seg-55ca63edff02 = Deteção de spoofing por consistência do Doppler LEO e da geometria da passagem

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = A secção <c2/> do tipo de cenário <c1/>: um spoofer falsifica, de forma autoconsistente em distância e taxa de variação de distância, os sinais vistos numa posição declarada que salta e/ou é empurrada para longe da verdadeira após um início (por banda LEO e para o sinal GNSS MEO); o recetor prevê cada taxa de variação de distância a partir da órbita difundida e de uma posição e velocidade a priori independentes, e testa as taxas medidas com uma estatística qui-quadrado de mínimos quadrados generalizados sobre uma janela de épocas (deriva de relógio um incómodo ou com um prior), nos canais GNSS, nos canais LEO e em todos os canais, com ruído térmico da malha de bloqueio de frequência a partir do C/N0 (Kaplan & Hegarty { "2006" }, secção { "5.6.2" }); probabilidade de deteção a partir da lei qui-quadrado não central a uma probabilidade de falso alarme indicada, deteção declarada a uma probabilidade de deteção falhada indicada

# text
seg-787c07c08c7f = Formas fechadas e identidades, não uma medição externa: o gradiente da taxa de variação de distância face a uma diferença central, a estatística em forma de informação face à forma densa da covariância, uma deriva de relógio pura a dar zero, um empurrão explicado pelo prior a dar no máximo |dx|^2/sigma_p^{ "2" }, a estatística quadrática num salto. Nenhum valor de deteção é comparado com um ataque medido; o spoofer é idealizado (sem assinatura de potência, de ângulo de chegada ou de pico de correlação)

# text
seg-5f341f85ac07 = Deteção de spoofing por consistência entre bandas de um sinal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO e par de bandas de medição de distâncias, a secção <c1/> forma a combinação de pseudodistâncias livre de geometria, remove o modelo ionosférico do recetor e testa o seu salto de época para época face ao ruído de código das duas bandas e a uma taxa ionosférica não modelada tolerada indicada (gaussiana bilateral, probabilidade de deteção exata); um spoofer que falsifica algumas bandas e não outras, ou todas as bandas sem a ionosfera, é visto no seu início; um que falsifica todas as bandas e simula a ionosfera não o é, o que o resultado indica

# text
seg-87fd44fa1d94 = Identidades: o salto de início de um spoofer livre de ionosfera é igual à diferença de atraso ionosférico modelado do par, o limiar é o quantil normal bilateral vezes o desvio-padrão do salto mais o limite de taxa. O modelo ionosférico do recetor é o do motor, pelo que o resíduo autêntico é nulo em média por construção; nenhuma referência independente externa

# text
seg-97dbcd5f2728 = Sondagem da ionosfera: TEC oblíquo a partir do atraso de dupla banda de uma passagem LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de um satélite <c1/>, o relatório dá o conteúdo eletrónico total oblíquo que a combinação de código livre de geometria recupera no pico da passagem, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), e o seu 1-sigma a partir do ruído térmico de código das duas bandas, pelo que qualquer projeto LEO-PNT multibanda pode ser avaliado como sondador ionosférico

# text
seg-2562ae9e6180 = A identidade de dispersão de primeira ordem, exata por construção face ao próprio atraso de primeira ordem do motor (cuja escala 1/f^{ "2" } é VALIDATED face ao IS-GPS-200 na sua própria linha); a precisão é apenas o ruído térmico de código, sem multipercurso nem desvios entre frequências. { "0.30" } ronda { "2" }, medido (pré-registado 5e795f93), uma constatação (mantém-se MODELLED): o mapa global de ionosfera CODE CODG1330.18I face ao código ABMF C1C/C2W com os desvios CODE dá { "33" } de { "36" } médias de arco a menos de { "3" } TECU (pior +{ "6.84" } TECU num arco noturno; RMS por época { "3.95" } TECU), face a um limiar de todos os arcos; não validado

# text
seg-0a63a69e181d = Covariância do datum de referencial lunar com as estações estimadas, face a precisão estendida de 50 dígitos

# text
seg-de2ee45f6527 = A covariância do datum de Helmert de sete parâmetros do cenário lunar-frame-campaign com as estações terrestres estimadas (estação { "1" } ancorada), tal como lunar_frame_campaign a calcula em binary64: a informação de Fisher conjunta de estações e balizas acumulada a partir do Jacobiano de atraso, o bloco das estações marginalizado por um complemento de Schur através de uma inversa espectral de Jacobi, H = AᵀSA formada com o projeto de Helmert e invertida espectralmente. O problema é mal condicionado por construção (número de condição de Helmert { "2.1e8" } a { "2.3e8" }, número de condição da informação conjunta { "1.6e12" } a { "3.0e13" }): uma variação relativa de { "1e-9" } na correção de Schur move os sigmas do datum até { "28" } %. Comunicados: os sete sigmas do datum, o número de condição de Helmert e a direção mais fraca. AFIRMAÇÃO, RESTRINGIDA: os sigmas do datum e o número de condição do motor situam-se dentro do limite de erro de pior caso a priori de um pipeline de precisão dupla retroestável neste problema; isto não afirma que sejam tão exatos quanto a precisão dupla permite (uma via de fatorização é cerca de mil vezes mais exata nas mesmas entradas, e o resolvedor de raiz quadrada opcional cerca de dez milhões de vezes), e a direção mais fraca é validada apenas onde o seu limiar está abaixo de um ângulo reto (o controlo com estações fixas)

# text
seg-1aab389815b3 = mpmath { "1.3.0" } (BSD-3-Clause) a { "50" } algarismos significativos, autoverificado a { "80" } (concordância { "1.1e-38" } ou melhor), sobre o Jacobiano, os pesos e o projeto de Helmert registados do motor: a própria resolução LU do mpmath para o complemento de Schur, a sua inversa para H e a sua decomposição em valores próprios de Jacobi (P2, uma biblioteca numérica independente). Pré-registado 804662d5 antes de o fixture existir, com limiares a partir de uma fórmula de erro retroativo de primeira ordem: constante (3n+{ "1" })n + m vezes o arredondamento unitário (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "10.4" }, a forma de Nível B), vezes a sensibilidade exata de primeira ordem de cada grandeza à informação conjunta, ao complemento de Schur e a H. Medido: sigmas do datum dentro de { "4.8e-6" } em 2026-03-18 (limiares { "9.6e-2" } a { "2.2e-1" }), { "9.7e-6" } em 2024-01-01 (limiares { "2.8e-2" } a { "6.9e-2" }) e { "2.0e-14" } com as estações fixas (limiares { "1.0e-11" } a { "2.8e-7" }); número de condição dentro de { "4.6e-6" }, { "1.3e-5" } e { "4.1e-14" }. Nos cenários com estações estimadas, os limiares são de pior caso e quatro ordens de grandeza acima do erro medido, e o limiar da direção mais fraca aí excede um ângulo reto, pelo que essa verificação não é contada; no controlo com estações fixas, a direção mais fraca concorda a { "6.6e-16" } rad face a um limiar de { "9.4e-11" }, medida pela corda entre vetores unitários (um comparador acos anterior não conseguia resolver ângulos abaixo de { "1.5e-8" } rad; o limiar é inalterado). Diagnóstico: as vias de Cholesky e QR do NumPy { "2.3.5" } atingem { "9e-9" } e { "5e-9" } nas entradas de 2024-01-01, a sua inversa e as vias de valores próprios { "2.9e-6" } e { "6.2e-6" }: o motor está dentro do seu limite mas é cerca de mil vezes menos exato do que uma via de fatorização. Valida a álgebra linear nas entradas registadas, não o Jacobiano (a parte SPICE da linha da campanha fá-lo) e não a exatidão física da campanha ilustrativa

# text
seg-71b463388e80 = Resolvedor de datum por informação de raiz quadrada face a precisão estendida de 50 dígitos

# text
seg-5ec3e3c2bf19 = Um resolvedor opcional de informação de raiz quadrada (lunar-frame-campaign solver = "srif"; predefinição inalterada) que nunca forma nem inverte uma matriz de informação para o datum: QR de Householder (decomposição ortogonal-triangular) do Jacobiano de atraso branqueado como atualização de medição de um filtro de informação de raiz quadrada, as estações terrestres marginalizadas através do bloco triangular final (cujo produto de Gram é o complemento de Schur), um segundo QR de R_bb A para o datum de Helmert de sete parâmetros, sigmas como as normas das linhas da inversa triangular, e o espectro (número de condição, direção mais fraca) a partir de uma decomposição em valores singulares de Jacobi unilateral. Os produtos internos são compensados com um produto sem erro com divisão de Dekker, pelo que cada operação é uma operação básica IEEE-754 ou raiz quadrada corretamente arredondada; os resultados idênticos em todas as plataformas são argumentados a partir disso, não testados entre plataformas

# text
seg-271cba640489 = mpmath { "1.3.0" } (BSD-3-Clause) a { "50" } algarismos significativos, autoverificado a { "80" } (concordância { "1.4e-43" } ou melhor), sobre o Jacobiano, os pesos e o projeto de Helmert registados do motor (P2, uma biblioteca numérica independente: a própria resolução LU, inversa, Cholesky e decomposição em valores próprios de Jacobi do mpmath). Pré-registado b41908c9 antes de o resolvedor ser escrito, com limiares a partir de um limite de erro retroativo de primeira ordem em forma de raiz quadrada: constante QR de Householder mn mais (3n+{ "1" })n vezes o arredondamento unitário (Higham, Accuracy and Stability of Numerical Algorithms, Teorema { "19.4" } e Capítulo { "8" }) vezes sensibilidades exatas. Medido: sigmas do datum dentro de { "3.0e-13" } em 2026-06-09 (limiares { "4.1e-7" } a { "5.3e-7" }), { "1.9e-15" } com as estações fixas (limiares até { "4.8e-12" }), { "3.8e-13" } em 2026-03-18 e { "2.3e-13" } em 2024-01-01, onde o resolvedor espectral por omissão erra { "4.8e-6" } e { "9.7e-6" }; número de condição dentro de { "4.9e-13" }; direção mais fraca dentro de { "1.4e-13" } rad (controlo { "1.7e-16" } face a { "5.1e-10" }). LIMITE DA VERIFICAÇÃO: os limiares só atestam erros de datum abaixo de cerca de { "2e-7" } em termos relativos; os valores medidos de { "1e-13" } são observações, não o que os limiares atestam. A verificação rejeita o resolvedor espectral por omissão (sigmas { "9.7e-6" } face a { "2.9e-7" } em 2024-01-01; na data condicionante { "1.3e-6" } face a { "4.9e-7" }, uma margem de { "1.3" } a { "2.6" }) e uma inversa triangular mal tomada (normas de coluna: vermelho), mas um sinal de Householder invertido, um produto escalar não compensado e sigmas a partir de uma inversa espectral de H formada a partir do fator de raiz quadrada ({ "3.7e-9" }) passam todos, pelo que não mostra que cada passo de raiz quadrada seja necessário. Valida a álgebra linear do resolvedor opcional em entradas registadas, não o Jacobiano nem o resolvedor por omissão; a reprodutibilidade bit a bit entre plataformas é argumentada a partir das operações usadas e testada apenas como identidade de reexecução numa plataforma

# text
seg-433b52bf0ba2 = Monitores de confiança marítimos: a aritmética em que assentam (descodificação NMEA, desvios geodésicos, as estatísticas cinemáticas e de resíduos de sensores)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Para uma embarcação, <c1/> descodifica as sentenças NMEA { "0183" } que um recetor e os seus instrumentos emitem (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), forma o desvio este-norte entre posições (<c2/>) e, a partir destes, as estatísticas em que os seus monitores se baseiam para decidir: a velocidade implícita, o resíduo de navegação estimada, a aceleração implícita e a taxa de viragem implícita em janelas de { "30" } s, os resíduos de rumo face ao rumo de superfície, de odómetro face à velocidade sobre o fundo e de altitude da antena (medianas de { "10" } s), e a dispersão e a subida da relação sinal-ruído dos satélites.

# text
seg-32fcf6956dac = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: ({ "1" }) a descodificação de cada campo que os monitores leem, face ao pynmea2 { "1.19.0" } (MIT) em { "8" } registos sintéticos ({ "1,086" } épocas), até { "1e-9" } na unidade do campo (latitude e longitude, altitude, separação do geoide, HDOP, velocidades, rumo de superfície, rumo, relação sinal-ruído; inteiros e datas exatamente; hora do dia até { "1e-6" } s), com as maiores diferenças ao nível do último dígito de um double; ({ "2" }) o desvio este-norte entre duas posições, como distância e azimute, face à geodésica WGS84 do geographiclib { "2.1" } (MIT) em { "223" } pares de posições com linhas de base até { "2" } km, de -45 a { "70" } graus de latitude e através do antimeridiano, até { "0.01" } m e { "0.001" } graus (o azimute face ao azimute médio da geodésica, a direção da corda); ({ "3" }) as estatísticas de entrada dos monitores em { "341" } épocas pontuadas de uma viagem sintética de { "400" } s com uma viragem e um salto de posição, face a recálculos em Python que usam o geographiclib para distância e azimute, o pynmea2 para descodificação e o numpy para medianas e desvios-padrão: velocidade implícita até { "0.005" } m/s, resíduo de navegação estimada até { "0.02" } m, aceleração até { "5e-4" } m/s^{ "2" }, taxa de viragem até { "1e-3" } deg/s, as medianas dos resíduos e a dispersão e a subida da relação sinal-ruído até { "1e-6" }. O QUE NÃO É: os comprimentos de janela, as tolerâncias e os limiares dos monitores são regras do próprio projeto; o Python reproduz-os a partir da mesma documentação, pelo que a concordância corrobora a implementação da aritmética, não as regras. A sentença THS não tem classe no pynmea2 e a sentença ROT não é lida; nenhuma das duas está coberta. A tabela de um emissor NMEA e número de satélite para um identificador de satélite em estilo RINEX é do próprio projeto (só são comparados o número, o emissor e o valor). As entradas de passo de tempo, relógio do anfitrião e estado de autenticação não têm referência independente. Todos os dados são texto sintético de receiver_trust::synth; nada aqui é uma medição e não é feita nenhuma afirmação sobre o desempenho de qualquer monitor face a interferência real. Azimute: comparado com o azimute médio da geodésica. A comparação pré-registada face ao azimute direto na posição { "1" } falhou a { "0.001" } graus ({ "77" } de { "223" } pares, pior { "8.3e-3" } graus) por uma discordância de definição, não de aritmética; a adenda foi feita depois da primeira execução e ambos os resultados estão registados (a comparação com o azimute direto permanece no teste como um limite descritivo, não pré-registado, de { "0.01" } graus). Divulgado: as primeiras execuções encontraram entradas que exercitavam muito pouco (a aceleração e a taxa de viragem eram anuladas a zero em todas as épocas, e a trajetória do antimeridiano nunca o atravessava), um defeito no gerador sintético (sem reenrolamento de longitude) e, para o azimute, que a grandeza de referência independente registada (o azimute direto da geodésica na primeira posição) difere da direção da corda em cerca de metade da convergência dos meridianos ({ "77" } de { "223" } pares fora de { "0.001" } graus, pior { "8.3e-3" }); as entradas foram corrigidas e o azimute comparado com o azimute médio à mesma tolerância (adendas { "1" } a { "3" } no pré-registo, feitas depois de ver os resultados e, por isso, não cegas); as comparações de rumo de superfície e de rumo foram tornadas circulares ({ "360" } e { "0" } graus são um só rumo, adenda { "5" }). Mutação: uma escala de { "1e-4" } no desvio este falha a comparação geodésica.

# text
seg-1fdbb476c8ab = Pontuação de confiança marítima: a agregação da evidência dos monitores numa pontuação de 0-100 e as suas três bandas

# text
seg-0d76b33144f1 = Cada monitor reduz a sua evidência a uma razão entre estatística e limiar; a pontuação é { "100" } menos a soma, sobre os monitores, do peso vezes uma rampa linear limitada da razão ({ "0" } até { "0.5" }, { "1" } a { "1.5" }), limitada a { "0" } a { "100" } e arredondada a { "0.1" }, com bandas em { "90" } e { "55" }; cada época lista os monitores que deduziram e os seus pontos.

# text
seg-b2d3c6d6ac36 = Implementação face à especificação, NÃO uma referência independente externa: uma reimplementação em Python de sala limpa (scripts/maritime_score_cleanroom.py), escrita por um leitor a quem foram dados apenas docs/RECEIVER-TRUST.md e docs/MARITIME-TRUST.md e não o código-fonte em Rust, concorda com score_from_ratios em { "600" } vetores de razões (pontuação, banda, pontos e a ordem das deduções, diferença { "0" }), depois de a documentação ter sido completada onde o primeiro leitor a encontrou omissa ou inconsistente (ordem de empates, arredondamento, a razão de um monitor de passa-ou-falha, dois exemplos cujos números não coincidiam com a fórmula). Isso mostra que a documentação é suficiente e que o código faz o que diz. O QUE NÃO É VERIFICADO, e porque é que a linha se mantém MODELLED: a própria regra (os pesos, a rampa, os limites das bandas, a retenção de evidência) é do próprio projeto, pré-registada mas sem fonte externa, e nada aqui mostra que uma pontuação de { "80" } ou { "40" } signifique o que um navegador desejaria que significasse perante interferência real; nenhum valor desse tipo é dado. Os limiares dos monitores são igualmente do próprio projeto (a Linha A verifica apenas a sua aritmética).

# text
seg-f52fceaf06ca = Aderência à norma dos fluxos de treino NMEA { "0183" } e valores descodificados

# text
seg-684f86418933 = Fluxos NMEA { "0183" } sintéticos de ponte para treino de tripulações (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW e o marcador PKSHT, gerados a partir de uma trajetória de referência com efeitos modelados de recetor, céu, jamming e spoofing. Apenas saída de texto; nada é transmitido.

# text
seg-4591ed75149c = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: todas as { "225,227" } sentenças de oito fluxos de treino sintéticos (quatro cenários da biblioteca, sementes { "1" } e { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW e o marcador PKSHT) são analisadas no pynmea2 { "1.19.0" }, um analisador NMEA independente, com uma soma de verificação válida e o emissor e o tipo esperados. A posição, a velocidade sobre o fundo, o rumo sobre o fundo, o rumo, a hora e a data UTC, o estado da solução de posição e a contagem de satélites GGA que descodifica são iguais à trajetória de referência do gerador dentro de tolerâncias fixadas antes da primeira comparação ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg de rumo sobre o fundo, { "0.5" } deg de rumo, { "0.02" } s), executada por scripts/gen_nmea_training_ref.py com o fixture em tests/fixtures/nmea_training_ref/. A expectativa de contagem de satélites GGA foi corrigida após a primeira execução para a convenção NMEA ({ "00" } sem solução de posição); tolerâncias numéricas inalteradas face ao commit de pré-registo. O QUE NÃO É: que qualquer recetor, traçador de cartas ou sistema de ponte aceite os fluxos; o realismo dos modelos de recetor, céu, jamming ou spoofing (céu nominal, ruído modelado, perfis de arrastamento e de repetição, todos MODELLED); HDOP, altitude e o conteúdo DOP e GSA/GSV para além da sintaxe e das contagens; o registo do instrutor. Nada é transmitido e não é afirmado nenhum desempenho anti-jam ou anti-spoof.

# text
seg-1be1cfcb95c8 = Mapa de interferência: significados dos códigos de exatidão, valores AIS de não disponível, atribuição de células da grelha, comprimento de rota por estado de célula e mascaramento em terra

# text
seg-71cff2a675e8 = A leitura dos códigos de exatidão e integridade de navegação ADS-B que o mapa usa (o limite de EPU que um código NACp representa, o limite de raio de contenção que um código NIC representa e as classes baixa e boa que o método deriva deles); os valores de não disponível de posição e velocidade AIS que o leitor AIS descarta; a célula fixa da grelha de latitude/longitude em que cai uma posição; o comprimento da rota, e a sua divisão por estado de célula (degradada, não degradada, não avaliada, não observada), que a exposição da rota comunica; e se uma posição se situa em terra, para lá de um polígono de terra, por mais do que uma margem. Uma célula assinalada como degradada ou anómala é uma afirmação sobre campos de exatidão comunicados ou posições implausíveis, não uma constatação de interferência, e nada aqui verifica isso.

# text
seg-beee15333c89 = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: cinco implementações independentes leem as mesmas entradas sintéticas. ({ "1" }) O pyModeS { "2.21" } descodifica tramas sintéticas DF17 de estado operacional e de posição aérea; os limites de EPU de NACp do Kshana concordam até { "0.5" } m (maior diferença { "0.4" } m), os seus limites de contenção NIC para os códigos { "5" } a { "11" } concordam até { "1" } m, e as suas classes baixa e boa colocam todos os { "12" } códigos NACp e todos os códigos NIC que a referência independente produz ({ "0" } a { "11" }) do mesmo lado dos limiares que os limites da referência independente implicam ({ "0" } discordâncias). ({ "2" }) O pyais { "3.3.0" } descodifica sentenças AIVDM do tipo { "1" } cujos bits de carga útil o script empacota a partir dos valores brutos de campo ITU-R M.1371; o Kshana recusa exatamente as posições descodificadas de não disponível (latitude { "91" }, longitude { "181" }) e a velocidade ({ "102.3" } kn), e mantém { "0" } a { "102.2" } kn como descodificado ({ "0" } discordâncias em { "94" } tramas). ({ "3" }) O covers() do shapely { "2.2.0" } em polígonos de célula concorda com grid::Grid::cell_of para { "1770" } pontos em tamanhos de célula de { "0.5" }, { "0.25" }, { "1" } e { "0.07" } graus, incluindo pontos junto ao bordo, ambos os polos e o antimeridiano ({ "0" } discordâncias). ({ "4" }) A interseção rota/célula do shapely { "2.2.0" } com comprimentos geodésicos WGS84 do GeographicLib { "2.1" } concorda com a exposição da rota em { "8" } rotas sintéticas, incluindo duas que atravessam o antimeridiano: comprimento total até { "0.6" }% (maior diferença { "0.49" }%, a esfera face ao elipsoide) e o comprimento de cada estado de célula até { "0.6" }% mais { "125" } m por pedaço (maior { "21" }% dessa tolerância). ({ "5" }) O contains() do shapely { "2.2.0" } com a distância equidistante azimutal do pyproj à linha de costa concorda com a máscara de { "2000" } m em terra em { "992" } pontos de centro de reticulado em torno de quatro ilhas sintéticas, uma com um lago ({ "0" } discordâncias; { "4" } pontos a menos de { "20" } m da margem foram excluídos e contados). As tolerâncias foram fixadas em tests/fixtures/interference_map_ref/PREREGISTRATION.md antes de qualquer comparação e não foram alteradas depois; dois defeitos nas entradas sintéticas encontrados pela primeira execução estão aí registados. O QUE NÃO É: o Kshana não descodifica tramas Mode S em bruto nem sentenças AIVDM, pelo que isto valida a sua leitura de valores já descodificados, não um descodificador. Os raios de contenção NIC da referência independente para os códigos { "1" }, { "2" } e { "4" } diferem do DO-260B ({ "20" }, { "8" } e { "2" } NM), pelo que apenas os códigos { "5" } a { "11" } são comparados numericamente. A regra da posição ({ "0" }, { "0" }), o piso de altitude, o filtro de tipo de fonte, a codificação por hash dos identificadores, os limiares e as estatísticas do método e a escolha do tamanho de célula são do próprio Kshana e não são verificados face a nada. A comparação de rotas usa a mesma definição de trajeto reto em latitude e longitude em ambos os lados, pelo que verifica comprimentos e atribuição de células, não que esse trajeto seja o certo para uma embarcação ou aeronave. Nada aqui mostra que uma célula assinalada seja interferência. As entradas são sintéticas; os fixtures de referência independente são escritos por scripts/gen_interference_map_ref.py (o pyModeS é GPL-3.0 e é usado apenas nesse script offline; a CI não precisa de Python).

# text
seg-57ace69bdf1a = Formatos de transmissão da telemetria de confiança: exposição em texto Prometheus e JSON OpenTelemetry OTLP/HTTP

# text
seg-654126a9d073 = Confiança GNSS (pontuação, banda, motivos, porta e, a pedido, posição) como exposição em texto Prometheus servida em /metrics e como métricas JSON OTLP/HTTP, com um limite à cardinalidade das etiquetas de motivo.

# text
seg-9cbde962155c = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: a nossa exposição em texto Prometheus para um fluxo sintético de 84 linhas (valores de etiqueta com aspas, barras invertidas, mudanças de linha e texto não ASCII, { "64" } séries de motivos mais uma dobra 'other', indicadores de porta e de posição) é aceite pelo analisador de texto do prometheus_client { "0.26.0" }, e as famílias de métricas, os tipos, o texto de ajuda, os conjuntos de etiquetas e os valores que lê são exatamente iguais ao estado do registo (valores por igualdade f64). O nosso JSON OTLP/HTTP para o mesmo registo é analisado com protobuf { "7.36.2" } json_format.Parse(ignore_unknown_fields=False) para o ExportMetricsServiceRequest do opentelemetry-proto { "1.45.1" }, e cada nome de métrica, descrição, unidade, tipo, monotonicidade, temporalidade de agregação, atributo, valor, hora de início e hora é exatamente igual ao estado do registo. Mostrou-se que ambos os analisadores rejeitam um campo desconhecido, um valor com tipo errado e uma linha malformada (scripts/gen_telemetry_formats_ref.py). Esquema { "1.3" } ({ "0.36" }), pré-registado (fb226057) antes de qualquer ferramenta o ler: para um fluxo sintético de esquema 1.3 de 64 linhas (estados de geometria, DOP, etiquetas e perda de sinal presentes, nulos, ausentes e desconhecidos; classes de dedução; linhas não analisáveis) os mesmos dois analisadores leem as séries de geometria (Prometheus kshana_trust_geometry*, OTLP kshana.geometry.*) e a etiqueta de classe em kshana_trust_reason_active exatamente como o registo implica ({ "24" } famílias e { "54" } amostras; { "12" } métricas e { "31" } pontos), o promtool { "3.5.0" } check metrics termina com { "0" } sem problemas de lint, e o OpenTelemetry Collector contrib { "0.135.0" } aceita o JSON OTLP/HTTP (estado { "200" }, nada rejeitado) e o seu exportador de ficheiros regista o pedido inalterado (xval/telemetry-1.3, condicionado por dados: os tarballs de versão são obtidos com SHA-256 fixado e as suas saídas registadas). O QUE NÃO É: o ponto de acesso HTTP, a entrega, os tempos limite e a reconexão não são verificados por uma referência independente, nem o recetor prometheus do Collector; o registo é lido através de acessores, pelo que uma falha no próprio estado do registo não seria detetada; a verificação OTLP de 'saída registada está atual' só corre com a funcionalidade otlp; os nomes das métricas e a sua utilidade para um centro de operações não são validados; CEF e LEEF não estão cobertos (ver a linha seguinte).

# text
seg-b037c999443b = Eventos SIEM da telemetria de confiança: Common Event Format (CEF) sobre syslog

# text
seg-ffd8d7062055 = Eventos de mudança de banda (ou por época) como cargas Common Event Format num envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado e escape CEF.

# text
seg-59fd23d6607e = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: face a dois analisadores de código aberto independentes (referências independentes: pycef { "1.11" } (PyPI, MIT); o codec CEF do Logstash (logstash-codec-cef { "6.2.7" } no Logstash { "8.15.3" })), num corpus de linhas CEF que este crate escreveu ({ "157" } antes da adenda { "4" } abaixo, { "170" } depois dela, { "176" } depois da adenda { "5" }): cada mudança de banda e cada época de um fluxo de confiança sintético registado de 84 linhas, mais texto adversário em anfitriões, motivos, etiquetas de tempo e nomes de porta com sinais de igual, barras invertidas, barra invertida-igual, barras verticais, mudanças de linha, retornos de carro, tabulações, sequências de espaços, carateres multibyte e astrais e sósias de chaves, pontuações e desvios extremos, cada banda com e sem banda anterior. O pycef analisa as linhas cujo cabeçalho não precisa de escape ({ "153" } antes da adenda { "4" }, { "166" } depois dela, { "172" } depois da adenda { "5" }) e recupera, exatamente, os campos do cabeçalho, a gravidade, o conjunto exato de chaves de extensão e cada valor (números por igualdade f64), segundo as regras de remoção de escape da especificação CEF, que o pycef não aplica e que scripts/gen_cef_ref.py aplica. O codec do Logstash, que remove o escape por si, analisa todas as linhas ({ "157" }, depois { "170" }, depois { "176" }), satisfaz o mesmo limiar e recupera também quatro campos de cabeçalho que precisam de escape (uma barra vertical, uma barra invertida e um sinal de igual na cadeia da versão), que o padrão de cabeçalho do pycef não consegue ler, pelo que o escape do cabeçalho assenta apenas no codec do Logstash. O limiar de comparação foi registado nos commits { "5172e579" } (pycef) e 0a7598aa (Logstash) antes de qualquer dos analisadores ser executado, e ambos o atingiram na primeira comparação. São divulgadas cinco adendas. As adendas ({ "1" }) a ({ "3" }) não tocaram em nenhuma regra de comparação nem em nenhum valor esperado: ({ "1" }) uma asserção do tamanho do corpus foi corrigida de { "5" } para { "4" } mudanças de banda, uma contagem errada, dado que o fluxo tem { "4" }; ({ "2" }) a ligação do delimitador de pipeline do executor do Logstash foi corrigida após uma primeira tentativa que não produziu eventos; ({ "3" }) a pontuação de confiança e o desvio de época foram movidos dos campos inteiros CEF cn1 e cn2 para os campos de vírgula flutuante cfp1 e cfp2, uma alteração de formato de transmissão feita nesta versão, após a qual o corpus foi regenerado e ambas as referências independentes foram reexecutadas com o limiar inalterado e atingiram-no de novo. A adenda ({ "4" }), { "0.36" }, alargou o corpus e o conjunto esperado de chaves, registada em d6331429 antes de qualquer dos analisadores ser executado nas novas linhas: as entradas de esquema { "1.3" } acrescentam a geometria de satélites nos campos personalizados cs6 (etiqueta geometry: estado, depois ';' e as classes de dedução), cfp3 (geometryHdop) e cfp4 (geometryPdop); { "13" } casos de geometria (o corpus passa a { "170" } linhas) e as três novas chaves; ambos atingiram o limiar, sem outras alterações, na primeira comparação (pycef { "166" } de { "170" } linhas analisadas, os { "4" } casos de cabeçalho de nível { "2" } como antes; Logstash { "170" } de { "170" }). A adenda ({ "5" }), { "0.36" }, acrescentou { "6" } casos de etiqueta de geometria (o corpus passa a { "176" } linhas), registada em 9a8e4fa9 antes de qualquer dos analisadores ser executado neles: a partir de entradas que transportam a etiqueta de geometria, cs6 ganha um terceiro campo (';' e a etiqueta) e cn1 (geometryUsedSatellites) os satélites usados; a tabela de mapeamento do codec do Logstash foi lida primeiro (sem campos flexString, daí cs6 em vez de flexString1); ambos atingiram o limiar na primeira comparação (pycef { "172" } de { "176" }, Logstash { "176" } de { "176" }), e cada entrada de referência anterior foi reproduzida sem alterações. O QUE NÃO É: nenhum dos analisadores verifica o tipo dos valores cfp (ambos os mantêm como texto), pelo que a utilização dos campos de vírgula flutuante assenta no dicionário CEF e não numa referência independente; nenhum SIEM de fornecedor foi executado; os nomes das chaves de extensão e o seu mapeamento são uma escolha deste crate, e os analisadores mostram apenas que são lidos de volta como escritos; o envelope RFC { "5424" }, a entrega, os tempos limite e a reconexão não estão cobertos; o pycef é um analisador pequeno, lançado pela última vez em { "2020" }, e o codec do Logstash é a referência independente mais substancial.

# text
seg-51640405c9b7 = Eventos SIEM da telemetria de confiança: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de mudança de banda (ou por época) como cargas Log Event Extended Format { "2.0" } num envelope RFC { "5424" } sobre UDP ou TCP, com um mapeamento de campos documentado.

# text
seg-563ccb0adbe5 = O QUE É VERIFICADO: os testes de cadeia exata do próprio crate do mapeamento de campos LEEF documentado e os campos do envelope RFC { "5424" }; não existe nenhum analisador LEEF de código aberto mantido (uma pesquisa no índice de pacotes Python não encontrou nenhum), pelo que o formato é verificado face à sua própria especificação lida pelo mesmo autor, não face a uma referência independente externa. O QUE NÃO É: se as cargas LEEF são aceites pelo analisador ou SIEM de qualquer fornecedor; as regras de escape para além das documentadas; o comportamento de um coletor syslog real.

# text
seg-96a95b89faa5 = Integridade do pacote de evidências: assinatura, cadeia de hashes e procedimento de verificação

# text
seg-943a853d8a4a = Um pacote de evidências assinado e com cadeia de hashes de um evento de confiança GNSS: SHA-256 sobre cada ficheiro e uma cadeia sobre o manifesto, uma assinatura Ed25519 sobre os bytes exatos do manifesto e um verificador que nomeia cada falha (um ficheiro alterado, removido, renomeado, trocado ou acrescentado, um manifesto reordenado ou editado, um manifesto re-hasheado sem a chave, um pacote reassinado, uma chave fixada errada e um token de marca temporal que é removido, substituído, lixo ou sobre outro documento).

# text
# c1: kshana evidence verify --tsa-ca
seg-0699ef2074fd = O QUE É VERIFICADO EXTERNAMENTE, dito de forma estreita: ({ "1" }) as funções Ed25519 que o pacote usa para assinar e para verificar de forma estrita (evidence::bundle::sign_detached, evidence::verify::verify_detached) reproduzem byte a byte as chaves públicas e as assinaturas dos vetores de teste { "1" }, { "2" }, { "3" } e { "1024" } da secção { "7.1" } da RFC { "8032" }, aceitam-nos e rejeitam cada bit invertido do vetor { "1" } e cada sétimo bit dos outros e uma assinatura S+L não canónica; os vetores são analisados a partir do texto da RFC e reproduzidos por duas implementações independentes (cryptography/OpenSSL e PyNaCl/libsodium) em scripts/gen_ed25519_rfc8032_ref.py. ({ "2" }) evidence::bundle::sha256_hex, o hash por trás de cada hash do pacote e da cadeia, reproduz exatamente os exemplos SHA-256 da FIPS 180-4 (abc; a mensagem de 448 bits; um milhão de a), a mensagem vazia e os resumos hashlib de uma escada de { "0" } a { "130" } bytes através das fronteiras de preenchimento. ({ "3" }) Um verificador escrito em Python apenas a partir de docs/EVIDENCE-PACKS.md (scripts/evidence_verify_cleanroom.py: hashlib e cryptography; o seu autor não leu código Rust) concorda exatamente com o verificador em Rust em { "71" } pacotes sintéticos íntegros e adulterados, no veredicto, no conjunto de falhas com nomes de ficheiros, no veredicto da assinatura e na cabeça da cadeia recalculada a partir dos ficheiros e na que o manifesto regista. Na primeira execução concordaram { "64" } de { "71" }; as discordâncias foram uma ambiguidade da especificação (verificar uma chave fixada face a um manifesto ilegível), um desvio de interface da referência independente e um caso construído de forma incompleta; a frase da especificação foi clarificada, a referência independente reimplementada a partir do texto e o caso completado, sem alterar nenhuma tolerância nem expectativa (registado no commit d54e14c6). O QUE NÃO É: o verificador de sala limpa é uma implementação independente de um autor diferente, não uma autoridade de terceiros, e partilha as escolhas da especificação, pelo que corrobora esta implementação das regras, não as regras; os vetores validam as primitivas, não o desenho do formato do pacote. Nesta linha o token RFC { "3161" } é lido apenas pela sua impressão digital da mensagem e os tokens de teste são sintéticos e não assinados; a assinatura e a cadeia da autoridade são verificadas, a pedido (<c1/>), pela linha separada 'Verificação da assinatura e da cadeia do token de marca temporal RFC { "3161" }'. Os casos de adulteração são sintéticos. Nada aqui constitui um parecer jurídico sobre qualquer pacote nem uma atestação de qualquer pacote.

# text
seg-c15736afcbc9 = Verificação da assinatura e da cadeia do token de marca temporal RFC { "3161" }

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token, e <c1/> opcional para o timestamp.tsr de um pacote: uma TimeStampResp RFC { "3161" } ou um TimeStampToken simples (CMS SignedData sobre um TSTInfo) verificado offline face a âncoras de confiança da forma como <c2/> o verifica: o tipo de conteúdo dos atributos assinados e o resumo da mensagem sobre o TSTInfo; a assinatura sobre os atributos assinados (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 e P-384; operações públicas RSA em crypto-bigint); o hash ESS signing-certificate v1 (SHA-1) ou v2 que nomeia o certificado do signatário, encontrado entre os certificados não confiáveis do token e do chamador; a utilização de chave alargada timeStamping única e crítica do signatário; a cadeia até uma âncora de confiança autoemitida com a assinatura de cada certificado, o estado de CA e a utilização de chave, e cada certificado válido no genTime do token; e a impressão digital da mensagem face aos dados. Não verificado: revogação (CRL, OCSP), restrições de nome e de política, o nonce

# text
# c1: openssl ts -verify -attime genTime
# c2: openssl cms -verify -cades -purpose timestampsign
seg-d305c442506d = OpenSSL { "3.0.13" } (<c1/>, e <c2/> mais a impressão digital do TSTInfo para tokens RSA-PSS), executado por tests/fixtures/evidence_tsa/run_openssl.sh nos { "27" } casos de cases.tsv: RSA PKCS#1 v1.5 com SHA-256 e SHA-512 e ESS v1 e v2, uma raiz ECDSA P-384 sobre um intermédio P-256 e TSA P-256 e P-384, RSA-PSS, um token sem o certificado do signatário com e sem ele fornecido, tokens assinados em CAdES, um byte de assinatura invertido (três algoritmos), um TSTInfo alterado (dois), uma assinatura intermédia invertida, um certificado gémeo ESS, âncoras erradas (quatro), um certificado TSA expirado, uma utilização de chave alargada não crítica e uma errada, e dados errados (três). Pré-registado em tests/fixtures/evidence_tsa/PREREGISTRATION.md (registado isoladamente, 30ad70b2, antes de o verificador existir; os veredictos do OpenSSL reexecutados depois, idênticos byte a byte). Primeira execução: todos os { "27" } veredictos concordam (B1) e cada genTime concorda ao segundo (B2). Âmbito, dito de forma estreita: certificados e tokens de teste autogerados, feitos pelo mesmo OpenSSL que os avalia; o OpenSSL é uma implementação independente, não uma autoridade de marca temporal; nenhum token de uma autoridade pública é incorporado (o freetsa.org não indica licença). Nada aqui atesta qualquer marca temporal real

# text
seg-c04042b0270a = Limiares de interferência de confiança do recetor calibrados no conjunto de dados JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: a calibração pré-registada dos monitores de queda de C/N0, AGC e indicador de jamming no conjunto de dados público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtido em tempo de execução, nunca incorporado): por pasta uma cronologia de { "1" } s de mon_rf.csv e rinex.csv, os monitores executados uma vez, cada época pós-calibração etiquetada como limpa ou de jamming a partir do attack_log da pasta (deslocado de CEST para UTC, guarda de { "60" } s), cada limiar varrido sobre uma grelha fixa, selecionado o menor limiar com probabilidade de falso alarme limpo agregada no máximo de { "0.01" }, e contagens reservadas de deixar uma pasta de fora; uma verificação cruzada do leitor UBX. A seleção só é fornecida como o perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); a regra por omissão e cada saída sem ele permanecem inalteradas

# text
seg-3ccd1b09ad09 = Os registos de eventos publicados do conjunto de dados (janelas de attack_log), como referência de eventos, sob o pré-registo xval/jammertest-trust/PREREGISTRATION.md (registado isoladamente, 0fa012b, antes de a infraestrutura de ensaio ser executada). Primeira e única execução (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } pastas avaliáveis ({ "7" } com jamming), { "3,502" } épocas limpas e { "9,560" } de jamming. Probabilidade de falso alarme limpo reservada: cn0_drop_db { "0.0231" } (81/3502) face a um limiar de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, passa; jam_ind_threshold { "0.0094" }, passa; união dos três: falsos alarmes { "0.0328" }, deteção { "0.807" } face a { "0.05" } e { "0.50" }, passa. Pela regra registada a linha é MODELLED (um limiar falhou). Estreito: um tipo de recetor (u-blox ZED-F9P), um evento, intervalos programados de um minuto como referência (deteção um limite inferior; limpo significa fora das janelas registadas); calibrado nos registos CSV, e o leitor UBX dá mais falsos alarmes em duas pastas. As bandas de pontuação de confiança marítima não estão calibradas

# text
seg-f839285852d9 = Volume de serviço lunar a partir de geometria de constelação real, obtida de fontes externas

# text
# c1: ephemeris_path
seg-c3059fcced49 = Aceita uma efeméride de estado tabelada, centrada na Lua (a avaliação de um kernel SPK/BSP), ou uma definição de constelação publicada através de <c1/>, executa contra ela o mesmo varrimento de cobertura / DOP / nível de proteção e emite o requisito de alcance σ_URE que daí decorre AO LADO dos resultados keplerianos e perturbados ilustrativos, que permanecem inalterados, com a diferença como grandeza própria e nomeada. Cada valor traz uma classe de proveniência que distingue o derivado de kernel do derivado de elementos publicados e do modelado, de modo que nunca possam ser confundidos numa citação posterior

# text
seg-cbe9bd6bf989 = A GEOMETRIA é externa e tem soma de controlo: três conjuntos de dados de ensaio cujos números provêm apenas de documentos obtidos com URL, data de obtenção e SHA-256, regeneráveis por geradores versionados que verificam a soma de controlo de origem e ABORTAM em vez de emitir um número — a constelação de referência da demonstração de interoperabilidade LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), os casos de estudo LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) e uma efeméride genuína de veículos espaciais em voo para LRO, Danuri, Chandrayaan-2 e CAPSTONE, avaliada a partir dos kernels reconstruídos do próprio JPL através do Horizons. NÃO existe publicamente nenhum kernel de constelação de navegação lunar — Moonlight/LCNS, LCRNS e LNSS não estão em voo e a NAIF não publica nada sobre eles — e nenhum foi inventado. O requisito σ_URE DERIVED NÃO tem referência independente externa (ninguém publica a exatidão de alcance que um HPL lunar de { "50" } m exige neste volume de serviço), pelo que é verificado face à sua própria identidade algébrica e, de forma independente, repetindo todo o varrimento ao requisito calculado e confirmando que a disponibilidade se inverte nesse ponto. MEASURED: o projeto publicado de 8 satélites necessita de σ_URE de { "2.9044" } m com { "100" } % de cobertura, face aos { "0.3591" } m com { "37.85" } % da constelação ilustrativa — uma revisão de { "8.09" }× de um número publicado, ao abrigo da regra R4 do programa. A conclusão qualitativa mantém-se (um LNIS de classe { "30" } m continua a não fechar um HPL polar sul de { "50" } m), mas a insuficiência tinha sido sobrestimada oito vezes. A demonstração LANS de 5 satélites produz ZERO amostras de nível de proteção — cinco satélites não conseguem fornecer os seis em vista de que um conjunto de hipóteses de falha única necessita — e o campo do requisito fica AUSENTE em vez de fabricado; o mesmo vale para as quatro naves reais com { "0" } % de cobertura. InternalConsistency é o tipo honesto: os dados de ENTRADA são externos e têm soma de controlo, mas a grandeza de que esta linha trata só é validada face a si própria. { "0.30" } comparação externa, um resultado (continua MODELLED): face às estatísticas dos casos de estudo LNCSS de navi.613 em { "346" } pontos de grelha, { "4" } de { "12" } estatísticas de disponibilidade ficam fora dos { "2" } pontos percentuais fixados antecipadamente (caso A: -4.0, +{ "22.5" } e -3.6 pp; caso B: -12.1 pp). Causas prováveis: elementos lidos no referencial errado, Kepler de dois corpos ao longo de { "15" } dias face a um modelo de forças não indicado no artigo e uma grelha não reproduzível a partir do texto. A metade do PDOP não pôde ser avaliada (o LANS não imprime nenhuma estatística numérica); o teste de comparação está versionado, mas ignorado. { "0.30" } ronda { "2" }, um resultado (continua MODELLED): face a uma referência independente Orekit { "12.2" } / Hipparchus { "3.1" } que calcula o relatório inteiro (propagação Orekit, visibilidade e DOP com DOPComputer, níveis de proteção MHSS compostos com Hipparchus, o requisito resolvido por amostra; pré-registado d3ce97b2) nas cinco geometrias obtidas e em duas grelhas, { "155" } de { "160" } valores concordam dentro dos limiares fixados antecipadamente ({ "2" } pp, { "5" } %, { "1" } %), incluindo o requisito sigma_URE para LNCSS A e C ({ "3.879072208" } m em ambos os lados para o caso A) e o requisito ausente para o LANS e os orbitadores. O LNCSS B na grelha densa falha nas estatísticas da pior amostra (sigma_required { "0.000923" } contra { "0.001511" } m, hpl_max { "1.63e6" } contra { "0.99e6" } m), onde geometrias quase singulares (PDOP de cerca de { "1e6" }) amplificam a concordância de posição ao nível do metro; o seu requisito p95 concorda ({ "1.6343" } contra { "1.6357" } m). O requisito da pior amostra é mal posto em geometria degenerada. Face a navi.613: { "4" } de { "12" } continuam fora de { "2" } pp (fixado)

# text
seg-36a6cfaf5afa = Unidade e proveniência declaradas para cada grandeza reportada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Um esquema legível por máquina que indica a unidade, a classe de proveniência e a definição de cada campo numérico de cada relatório de cenário, mais uma única barreira global que executa todos os tipos de cenário registados e falha se um campo numérico emitido não tiver uma das duas. O vocabulário de proveniência é fechado e cada classe tem um nível de evidência, com duas classes deliberadamente mapeadas para <c1/> e <c2/>, em vez de lhes ser atribuído um nível que a classe não determina

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
seg-a8c4a6fd4989 = O próprio documento emitido: cada folha numérica tem de corresponder a uma entrada no bloco de unidades do próprio documento. Não existe nenhum registo externo de unidades face ao qual verificar uma unidade DECLARADA, pelo que uma unidade declarada é uma afirmação revista e não uma afirmação verificada — a barreira verifica a COMPLETUDE e a BOA FORMAÇÃO, não a verdade, e dizer validado estaria errado, porque nada externo confirma que <c1/> é a unidade correta para um campo chamado <c2/>. Foi realizada uma verificação cruzada independente por sufixo do nome sobre os { "1,434" } campos descritos NESSE MOMENTO: dos { "691" } que têm um sufixo indicador de unidade, { "40" } divergem da unidade declarada e todos os { "40" } estão explicados (sufixos por segundo, mínimos, segundos de abertura, newton-metros contra um sufixo com aspeto de nanómetro), pelo que não surgiu nenhuma unidade errada. Essa verificação cruzada não foi repetida desde então e a cobertura cresceu para além dela — o valor mantém-se no que foi efetivamente medido, em vez de ser reformulado para o total atual. No momento dessa alteração ({ "0.27.0" }), a cobertura passou de { "7" } de { "56" } tipos para { "60" } de { "61" }, e de { "389" } de { "1354" } campos para { "1,742" } de { "1,744" } (docs/field-units-schema.json, que uma verificação de desatualização mantém em dia). NENHUM tipo fica por cobrir (teto de { "0" }, FUT-28, { "0.36" }): o último era <c3/>, cujas duas colunas são indexadas pelo chamador, pelo que as suas unidades são dados; passam agora a ser descritas como <c4/> e a unidade de cada posição é lida da tabela de unidades do próprio pacote VARRIDO para <c5/> e <c6/> (ou tomada do <c7/> declarado do eixo, que tem de concordar com o do pacote quando ambos existem; nulo quando nenhum existe, indicado em vez de adivinhado). <c8/> era o anterior e saiu da lista quando o seu documento publicado ganhou um bloco de unidades: o teste de aditividade que nomeava <c9/> como chave proibida passa agora a PROVAR que o acréscimo é aditivo — retirando o bloco de novo, o documento continua a ter como soma de controlo as duas constantes fixadas antes de ele existir, pelo que um valor publicado que se tenha movido por baixo do acréscimo continua a falhar. O trabalho fez também surgir doze defeitos de unidades ou de documentação em código existente, reportados em vez de corrigidos ao abrigo da regra R1

# text
seg-cf779c468eed = Datum do referencial lunar a partir de uma campanha de observação REAL

# text
# c1: lunar-llr-datum
seg-96151f13a92b = A covariância do datum de Helmert de sete parâmetros, com as suas duas entradas simuladas substituídas por entradas medidas: o calendário são as épocas de emissão a partir do solo de { "337" } pontos normais arquivados de medição laser lunar da ILRS (2015-04-08 a 2015-06-27, Grasse MeO { "7845" } e Matera MLRO { "7941" }, todas as cinco matrizes de retrorrefletores) e cada peso de observação é a precisão arquivada desse ponto, bin_rms/√n_raw — mediana de { "5.13" } mm de alcance de ida, lida do ficheiro. Coordenadas das estações IERS ITRF2020, coordenadas dos refletores JPL DE430 Tabela { "7" }. Executável como o tipo de cenário <c1/>. A afirmação validada ({ "0.36" }) é estreita: no caminho analítico por omissão, o cálculo da covariância do datum concorda com uma referência independente SPICE e NumPy, calculada sobre pontos normais medidos novos; não é uma exatidão de LLR nem uma prova de que a Lua analítica seja exata

# text
seg-50c60fc25ded = Identidades de forma fechada, uma via independente dentro do repositório e, desde { "0.36" }, uma referência independente de biblioteca SPICE e NumPy sobre dados medidos novos (abaixo); não existe nenhum par publicado de covariância de datum LLR lunar com que comparar, pelo que não se reclama exatidão alguma. A única derivada nova — a derivada parcial do alcance em relação à posição do refletor fixa ao corpo — é rededuzida por diferença finita central do tempo de luz de ida e volta que ela diferencia, um caminho que não partilha nenhuma expressão com a forma analítica. A referência independente física é estrutural: a derivada parcial de um alcance É o dobro da linha de visada, pelo que a coordenada fixa ao corpo segundo a direção média para a Terra tem de ficar determinada muito melhor do que as duas coordenadas no plano do céu, que só a libração alcança — medida entre { "50.7" }× e { "71.7" }× nas cinco matrizes, face a um varrimento de libração que o relatório mede de forma independente, com a previsão isotrópica de pequeno ângulo e a anisotropia transversal que explica a diferença ambas impressas. O QUE MUDOU: o calendário, o número de observações e cada peso de observação são agora medidos; são usados { "337" } de { "349" } pontos arquivados e os { "12" } que não o são são ignorados e contados, porque o ITRF2020 não tem posição para Apache Point. MEASURED: sigma de translação do datum { "1.851746e-2" } m contra os { "6.3975" } m da campanha SIMULADA ({ "345" }×), rotação { "36" }×, escala { "24" }× — uma razão entre uma rede de alcance laser e uma rede de atraso VLBI, pelo que é um resultado e não uma validação. Característica da informação dos refletores 15/15 com acoplamento entre matrizes exatamente { "0" }; característica de Helmert 7/7, condição { "2.4e4" }. O QUE ESTA LINHA NÃO AFIRMA: que o valor esteja certo em termos absolutos. Uma solução LLR real coestima a órbita lunar, as librações físicas, a orientação da Terra, as coordenadas das estações e parâmetros de maré e relativistas, e reporta decímetros (os 0.12-0.27 m da própria DE430 Tabela { "7" }) onde este limite é muito menor; é um limite de Cramér-Rao para um conjunto reduzido de parâmetros indicado, não uma exatidão. Fora da afirmação validada (modelado, não validado): o centro da Lua da efeméride e a orientação do corpo IAU { "2015" } são modelados, e a troposfera, as marés, a excentricidade das estações, o movimento polar, UT1-UTC, o atraso relativista e os relógios das estações estão ausentes. A sua dimensão combinada é PUBLICADA em vez de argumentada — alcance de ida observado menos calculado de { "156,494" } m RMS sobre os { "337" } pontos — e o seu efeito na covariância é DELIMITADO em vez de argumentado: voltar a resolver o datum inteiro com todas as derivadas parciais inclinadas de { "0.1" }° (o dobro da inclinação medida da efeméride na pior época, com sinal alternado) desloca o resultado entregue em { "0.288" } %. VERIFICAÇÃO EXTERNA ({ "0.30" } ronda { "2" }, pré-registada 6b27964a), um resultado (continua MODELLED): o tempo de luz de ida e volta do SPICE (DE440, ITRF93, orientação lunar DE440) com derivadas parciais por diferenças finitas, e uma inversa em numpy, sobre os mesmos { "337" } pontos normais medidos e pesos, concordam na contabilidade, nas duas características, no acoplamento nulo, no RMS dos resíduos ({ "2.1e-5" }) e em { "15" } de { "16" } valores de covariância. O sigma da translação em z está { "1.03" } % acima, face ao limiar fixado antecipadamente de { "1" } %. Com o centro da Lua da DE440 desce para { "0.049" } % (c51f8b2, dados já vistos) e, em pontos normais novos de { "2019" }, o datum com a Lua de kernel satisfaz todos os limiares (linha "…, kernel Moon centre"), onde a Lua analítica também fica dentro dos limiares (pior { "3.8e-3" }, apenas informativo), pelo que essa comparação não distingue os modelos da Lua. EXECUÇÃO COM DADOS NOVOS DO CAMINHO ANALÍTICO ({ "0.36" }, pré-registada 31f5283 antes de qualquer ponto ser obtido): a referência independente SPICE e NumPy inalterada sobre { "151" } pontos normais EDC CRD v2 usados, de 2025-04..06 (um ano que nenhum teste usara; ficheiros obtidos de novo e referência independente executada de novo de forma independente, ver o NOTICE do conjunto de dados de ensaio), com os mesmos limiares: contabilidade, características, contagens por matriz e acoplamento nulo iguais; sigmas e normas no pior caso { "1.11e-3" } (limiar de { "1" } %), condição { "8.95e-4" } ({ "2" } %), razões transversal/longitudinal no pior caso { "1.79e-3" } ({ "2" } %); O-C do SPICE { "10.79" } m. VALIDATED com base nessa evidência apenas como verificação de biblioteca do cálculo da covariância; o RMS dos resíduos analíticos nessa fatia é { "222" } km, pelo que os limiares não discriminam modelos da Lua (tal como na linha do kernel). Resultados: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

# text
seg-c815cb90dcde = Geodesia de estações de referência lunares: retrorrefletor e baliza VLBI acrescentados face ao datum de cinco matrizes

# text
seg-103cf21173ac = As entradas opcionais extra_reflectors e extra_beacons no cenário lunar-llr-datum acrescentam um bloco station_geodesy: a informação de Helmert das cinco matrizes a partir da fatia arquivada de medição laser lunar, mais a informação que um retrorrefletor acrescentado (medido nas épocas arquivadas de pontos normais em que a estação de medição está acima do horizonte, cada uma com o peso arquivado desse ponto normal) e uma baliza VLBI acrescentada (observada pela rede e pelo calendário da campanha do referencial lunar com as estações terrestres fixas, através das derivadas parciais de atraso de lunar-vlbi-fim) em locais indicados introduzem no datum de sete parâmetros, voltado a resolver, com o 1-sigma de cada parâmetro de Helmert antes e depois, a sua razão, as normas antes e depois e os valores próprios extremos da diferença de Fisher. Ausentes ou vazias, o relatório não se altera

# text
seg-479a7e6bbedb = Apenas consistência interna: cada local acrescentado é um ponto distinto e uma medição laser ou um atraso VLBI de estação fixa toca num só ponto, pelo que a sua informação A_p^T M_p A_p é semidefinida positiva e soma-se; o teste verifica a diferença de Fisher e cada variância face a isso. O resultado das cinco matrizes é a linha de dados reais existente e não se altera. O refletor acrescentado reutiliza épocas programadas para as cinco matrizes existentes, um calendário ILLUSTRATIVE, e a rede, o calendário e o sigma de atraso da baliza acrescentada são as entradas ILLUSTRATIVE da campanha do referencial lunar; o local é uma posição polar sul ILLUSTRATIVE. Um local polar sul vê a Terra baixa no horizonte ou não a vê de todo, o que os testes de ângulo de observação existentes exprimem; nenhum dos locais é medido de forma contínua. Os valores são limites de Cramér-Rao para um conjunto reduzido de parâmetros, não um datum resolvido e não uma afirmação sobre qualquer estação real

# text
seg-d9f033ebf109 = Datum do referencial lunar a partir de uma campanha de observação REAL, centro da Lua de kernel

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = A covariância do datum de Helmert de sete parâmetros de lunar-llr-datum a partir de pontos normais ILRS arquivados e dos seus pesos medidos, no caminho de kernel: o centro geocêntrico da Lua é lido da JPL DE440 pelo leitor de kernels do próprio motor (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Só o centro da Lua difere da linha analítica; a orientação IAU { "2015" }, o movimento polar e o UT1 ausentes, os catálogos, as regras de seleção, os pesos e a álgebra linear são os mesmos. A afirmação validada é apenas que a covariância do datum deste caminho concorda com uma referência independente SPICE e NumPy em pontos normais novos e não vistos. A comparação não discrimina modelos da Lua e não verifica o centro da Lua: na mesma fatia, a Lua analítica também satisfaz todos os limiares, a mutação pré-registada (a Lua de kernel lida com uma hora de atraso) não foi detetada e um centro da Lua errado em cerca de { "4,650" } km também passa (ver o texto da referência independente). Não é prova de que a Lua de kernel melhore o datum. Executável como o cenário <c1/> com planetary_kernel_path (e normal_points_dir para outra fatia)

# text
seg-ec47513b1828 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) tempos de luz de ida e volta na DE440, orientação da Terra ITRF93 e orientação lunar DE440 (MOON_ME) com derivadas parciais por diferenças finitas de { "100" } m, e matriz de informação e inversa em numpy { "2.3.5" } (BSD-3-Clause, LAPACK): o gerador inalterado da comparação da linha analítica (6b27964a), executado sobre uma fatia nova (pontos normais EDC CRD, 2019-04..06) pré-registada em 830d945a antes de qualquer parte dela ser obtida, nos limiares da linha analítica ({ "1" } % para sigmas e normas, { "2" } % para condição e razões, contabilidade, características e acoplamento exatos) e a sua autoverificação da referência independente (O-C do SPICE { "10.86" } m < { "100" } m). Todas as grandezas satisfazem, no pior caso { "7.6e-5" }. Mutações: o atraso de uma hora da Lua planeado NÃO é detetado (a covariância depende da dispersão das linhas de visada, não da sua temporização); uma mutação estrutural escolhida depois e divulgada como tal, que elimina a derivada parcial do trajeto descendente, falha todos os sigmas. Resultado: nesta fatia a Lua analítica também passa (pior { "3.8e-3" }), pelo que o limiar não discrimina modelos da Lua e isto valida a covariância em dados novos, não uma melhoria da Lua de kernel. Verificação do integrador na dobra (não pré-registada): a Lua de kernel lida relativamente ao baricentro Terra-Lua em vez da Terra (RMS dos resíduos de { "4,649" } km) e a época de kernel sem TT menos UTC ({ "69" } s; resíduo de { "2.6" } km) continuam ambas a passar todos os limiares, enquanto retirar sqrt(n_raw) dos pesos medidos falha as { "16" } grandezas com banda; a comparação é sensível aos pesos, às derivadas parciais e à álgebra linear, não ao centro da Lua. Ambos os lados leem a DE440: isto valida o cálculo na DE440, não a DE440. Fora da afirmação: uma exatidão de LLR (um limite de Cramér-Rao para um conjunto reduzido de parâmetros)

# text
seg-bd3af378b613 = Efeméride lunar analítica integrada — o seu LIMITE DE EXATIDÃO INDICADO verificado com dados reais

# text
seg-a51c4e234a4f = ephem::moon_position, a série lunar geocêntrica de baixa precisão a que a biblioteca recorre quando não existe nenhum kernel DE/SPK, medida face a medições laser lunares reais e face a uma efeméride planetária publicada no mesmo intervalo. Esta linha valida o limite que o módulo indica sobre si próprio, NÃO uma exatidão: confirma-se que a série não é pior do que afirma, não que seja boa

# text
seg-81dff68ddd9c = DOIS conjuntos de dados externos independentes que não partilham nada. ({ "1" }) { "337" } pontos normais arquivados de medição laser lunar da ILRS (EUROLAS Data Center, DGFI-TUM, 2015-04-08 a 2015-06-27, cinco matrizes de retrorrefletores, versionados com SHA-256 por ficheiro e um script de nova descarga e verificação): alcance de ida observado menos calculado de { "156,494" } m RMS, com coordenadas das estações do IERS ITRF2020 e coordenadas dos refletores da JPL DE430 Tabela { "7" }, pelo que o resíduo é dominado pela série do centro da Lua. ({ "2" }) Estados geométricos geocêntricos da Lua do JPL Horizons no mesmo intervalo: { "112,567" } m RMS radial, { "195,655" } m RMS vetorial, pior época { "360,324" } m = { "0.0536" }°. Um resíduo de alcance responde à parte RADIAL de um erro de efeméride, pelo que ({ "1" }) e ({ "2" }) são a mesma grandeza alcançada por dois caminhos e concordam até { "1.39" }× — o que permite ao cenário lunar-llr-datum atribuir o seu resíduo à efeméride. A documentação do próprio módulo do motor afirma ~{ "0.3" }° / ~poucas·10² km; ambas as medições ficam dentro dela, a angular com uma margem de { "5.6" }×. ÂMBITO, indicado para que nenhum leitor o possa confundir: isto valida o LIMITE indicado, não um valor de exatidão. A série continua a ser inadequada para qualquer aplicação que precise de melhor do que ~{ "1e5" } m, e essa limitação é tanto o conteúdo da linha como a concordância. Regenerável offline pelos scripts versionados de obtenção e verificação

# text
seg-44f582b17fa9 = Integridade da barreira — um verde que significa o que diz

# text
# c1: cargo test --all
seg-43fbcfbe990c = Três guardas estruturais sobre o próprio processo de verificação, cada uma a fechar uma classe de defeito que chegou à barreira canónica como um vermelho intermitente ou espúrio. ({ "1" }) Todo o caminho temporário construído nas fontes Rust tem de ter um componente único por chamada; um identificador de processo é rejeitado, porque o cargo executa os testes da biblioteca como fios paralelos de UM só processo e o pid é partilhado por todos eles. ({ "2" }) Todo o teste de fixação byte a byte ou de soma de controlo tem de declarar, junto de si ou no cabeçalho do seu módulo, o que cobre e o que deliberadamente exclui — para que uma alteração transversal permita ver de relance quais as fixações abrangidas e quais se tornaram, sem alarde, detetores de alterações de todo o repositório. ({ "3" }) Um verde só pode ser reclamado a partir da bateria COMPLETA: scripts/gate.sh executa <c1/>, captura o código de saída verdadeiro sem nenhum pipe pelo meio e escreve um recibo que nomeia o commit, o número de binários de integração, o número de testes e a duração; a verificação antes do push recusa um push cujo commit nenhum recibo válido nomeie, numa árvore limpa. A repetibilidade é amostrada em separado por scripts/check-repeatability.sh, que executa a bateria da biblioteca N vezes e falha se o conjunto de testes que passam diferir.

# text
seg-17a5f9da54a4 = Forma fechada: cada guarda é executada sobre um excerto fixo conhecido como defeituoso, que tem de disparar, e um excerto fixo conhecido como correto, que tem de permanecer silencioso, ambos constantes literais que o detetor não pode influenciar. Os dois excertos defeituosos são os defeitos F22 e F25 na sua forma original. Esta é uma referência independente INTERNA e a linha é MODELLED por consequência: prova que as guardas distinguem o defeito da sua correção, não que as classes que descrevem sejam exaustivas. Os seus pontos cegos declarados — estado partilhado que não é um caminho, uma fixação mantida numa constante nomeada curta, uma condição de corrida rara que três execuções não amostram e um recibo que qualquer pessoa que possa escrever o ficheiro pode forjar — estão escritos na documentação do módulo de tests/source_guards.rs e no cabeçalho de cada script, em vez de ficarem para ser descobertos.

# text
seg-178192c9c87a = PL de temporização composto — especialização escalar MHSS (H=1_N)

# text
seg-431aaf94ec31 = TPL escalar de separação de soluções sobre fontes heterogéneas; PL determinado pelo ruído do subconjunto de pior exclusão + desvio UTC(k)

# text
seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq e scipy { "1.18.1" } (norm.isf, norm.sf, brentq) recalculam, pelos seus próprios algoritmos, os estimadores de mínimos quadrados ponderados dos subconjuntos, a covariância geral de separação sqrt(Δ Σ Δᵀ), os desvios e o nível de proteção a partir deles, em { "300" } entradas versionadas (tests/fixtures/tpl_scalar_numpy_oracle); o PL concorda dentro de { "1e-9" } relativo (pior { "1.2e-10" }) e o subconjunto de exclusão determinante é idêntico, tolerância fixada antes da comparação. Os multiplicadores, as distribuições a priori e os sobrelimites de desvio são entradas, e a estrutura da equação do PL (lista de modos, divisão ir/2, projeção do desvio) é uma entrada declarada, tal como na linha do núcleo de nível de proteção ARAIM lunar; a afirmação validada é a álgebra linear e o PL nessas entradas, não as magnitudes físicas de um cenário de temporização. Linhagem ARAIM Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = PL de temporização composto — atravessamento em holdover iniciado em P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); PL({ "0" }+)≥PL({ "0" }−) semicontínuo inferiormente; máximo corrente K(IR/2); expoentes de fase τ/τ³/τ⁵

# text
seg-1438193381be = Testes de propriedades (monotonia, sem queda na passagem) + verificação dos expoentes face a holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = PL de temporização composto — cobertura da envolvente de holdover, regime plurianual (tau>=90d)

# text
seg-d9520f6c1769 = A envolvente de máximo corrente sobrelimita (sem perfuração) uma série metrológica real em cada desfasamento tau>=90d testado, num segmento disjunto; tau curto (<=30d) é uma fronteira modelada divulgada

# text
seg-086baedd33a9 = Série de 5 dias BIPM Circular-T [UTC-UTC(USNO)] MJD 56074-60429 ({ "872" } pts, API webtai); ajuste e teste disjuntos, cobertura plurianual sem perfuração

# text
seg-096b6cdfe2dc = PL de temporização composto — envolvente LIL q.c. (impossibilidade + consistência)

# text
seg-1671add2210d = Não existe holdover finito no pior caso (o supremo browniano diverge); HPL atribuído por IR consistente com a envolvente de Hartman-Wintner quando IR→{ "0" }

# text
seg-c9ed8bbede70 = Identidade de forma fechada da envolvente q.c. √(2Dt·lnln t) + verificação de dominância do HPL; ponto de junção da impossibilidade de Baweja arXiv:{ "2606.24210" }

# text
seg-5a27c9f0a67d = Sobrelimite de integridade do desvio de rastreabilidade UTC(k) heterogéneo

# text
seg-fd09ab2adbf6 = Sobrelimite do desvio por fonte b = (U/k_cov)·Phi^-1(1-tail/2) + envelhecimento, a inflar uma incerteza expandida de Tipo B publicada até uma cauda de integridade atribuída; liga-se a tpl_scalar como bias_s

# text
seg-1fd53acf9a3f = Reprodução independente em numpy + stdlib-statistics da forma fechada do sobrelimite (InternalConsistency). A série BIPM Circular-T [UTC-UTC(USNO)] é apenas uma entrada CITADA — é a MESMA série já validada para a linha de cobertura de holdover R4 e NÃO é validada de novo aqui; reproduzir os seus valores não prova nada sobre R2. A cauda profunda de integridade é modelada. { "0.30" } comparação externa, um resultado (continua MODELLED): nos ficheiros UTC-UTC(k) por laboratório do BIPM ({ "102" } laboratórios, { "105 024" } linhas com incertezas publicadas), o sobrelimite b = { "2.576" } u na cauda de { "1e-2" } é excedido por { "50.8" } % das linhas (Clopper-Pearson { "95" } %: { "50.4" } a { "51.1" } %) e por mais de { "1" } % em { "101" } de { "102" } laboratórios. A incerteza u publicada é a incerteza da determinação de UTC-UTC(k) pelo BIPM, não um limite do desvio, que habitualmente chega a muitas vezes u; o sobrelimite tal como especificado não limita o desvio de rastreabilidade real de UTC(k). { "0.30" } ronda { "2" }, um sobrelimite dos desvios UTC-UTC(k) realizados, treinado em dados BIPM Circular T de 2015-2022 e testado em 2023-2026 (pré-registado ca0921a4, excedência agregada no máximo { "1e-2" }), um resultado (continua MODELLED): a excedência agregada é { "0.0333" } ({ "694" } de { "20 826" } linhas em { "82" } laboratórios; { "0.0127" } sem as { "430" } linhas que, por regra, não têm limite). D9 ronda { "3" }, um limite hierárquico agregado de envelhecimento (utck_bound), pré-registado fb475550 e avaliado de forma prospetiva em emissões do Circular T a partir de { "465" }: ainda não executado (a emissão { "465" } foi publicada em 2026-10-12 com cerca de { "285" } valores de teste; a regra pré-registada de 1000 valores precisa de emissões até cerca de { "468" }, e a execução precisa dos ficheiros por laboratório arquivados de 2026-09-30, uma vez que o BIPM entretanto reescreveu { "87" } dos { "113" })

# text
seg-d75b900ad25f = Covariância cruzada do desvio de rastreabilidade correlacionado (atribuição insegura em modo comum)

# text
seg-0641f6d38c23 = Covariância cruzada de desvios N×N com termos fora da diagonal rho·b_i·b_j para fontes que partilham um realizador UTC(k); PROVADO correlated_fused_bias >= independent_fused_bias (a atribuição independente ingénua subestima o limite do desvio fundido -> otimista -> insegura)

# text
seg-72359f29aab1 = Reprodução independente em numpy da covariância cruzada e da desigualdade entre o desvio fundido correlacionado e o independente (InternalConsistency). Conjunto de fontes representativo; cenário modelado.

# text
seg-0359a9194c60 = Branqueamento GLS de modo comum (Aitken) + identidade de Mahalanobis

# text
seg-67b11ff6d055 = Cholesky Omega=LL^T e branqueamento por substituição direta z=L^-1 r (Cov(z)=I quando Cov(r)=Omega) implementados à mão; quadrado de Mahalanobis z^T z = r^T Omega^-1 r

# text
seg-65a8361b4a22 = Pontuação do Jammertest: um registo de recetor pontuado por ensaio programado (latência de deteção, alarmes em falta, falsos alarmes, tempo de recuperação) face ao plano de ensaios publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): o catálogo de ensaios e o plano de transmissão da NPRA (MIT, obtidos com um SHA-256 fixado, nunca incorporados no repositório) lidos como verdade programada, com os identificadores do catálogo preservados; uma execução de receiver-trust pontuada por ensaio (primeiro alarme menos o início planeado, detetado/tardio/em falta face a uma tolerância, tempo até ao primeiro período sem alarmes, alarmes fora de todos os intervalos e da sua guarda), com um pacote de evidências assinado que transporta o quadro de pontuação. O calendário são intervalos planeados, não horas de emissão registadas

# text
seg-49b912adb7a9 = As contagens de intervalos do plano por área de ensaio ({ "76" }, { "77" } e { "45" } intervalos, dos quais { "61" }, { "63" } e { "32" } transmitem) foram contadas de forma independente com um script sobre o mesmo JSON; as janelas attack_log do conjunto de dados de { "2024" } como verdade de eventos, ao abrigo de xval/jammertest-score/PREREGISTRATION.md (versionado sozinho, c2e6d3b, antes de o pontuador ser executado). Primeira e única execução (xval/jammertest-score/RESULTS.md): a regra registada de dados mínimos FALHOU ({ "4" } janelas de jamming pontuáveis em { "4" } de { "12" } pastas UBX, contra um mínimo de { "10" } janelas em { "2" } pastas: { "5" } pastas excluídas pela regra da linha de base, { "3" } registos UBX só trazem a hora GPS da semana), pelo que os limiares B1 a B4 não são avaliáveis; nada foi afrouxado nem repetido. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, versionado sozinho, apenas tratamento de dados: registos só com hora GPS colocados a partir da data, as { "12" } pastas só com CSV, uma sessão de plataforma móvel para rovers em movimento; mesmos limiares e mesma regra de dados mínimos): { "14" } de { "24" } pastas mantidas, mas { "7" } janelas de jamming pontuáveis, regra de dados mínimos falhada de novo, nenhum limiar avaliável (RESULTS-v2.md). Verdade programada: um intervalo planeado não é um registo de emissão, uma falha pode ser um ensaio que nunca se realizou, uma latência conta-se desde o início planeado, e limpo significa fora dos intervalos planeados. A deteção por monitores no domínio das medições nada diz sobre um spoofer de baixa potência. Um só tipo de recetor (u-blox ZED-F9P). O conjunto de dados NMEA da SimulaMet de { "2025" } não é usado (sem licença indicada, acesso condicionado por subscrição)

# text
seg-0d227bbcb5f1 = Exportação para test bench (kshana bench-export): colunas de coordenadas fixas à Terra, geodésicas e de velocidade local, colunas de atitude e saída NMEA { "0183" }

# text
seg-c6a6e08afadd = As colunas do CSV de movimento de posição fixa à Terra, posição geodésica, velocidade fixa à Terra, rumo/inclinação longitudinal/inclinação lateral e UTC, e as frases NMEA GGA/RMC, escritas a partir de cenários sintéticos (gnss-ins, incluindo automotive-urban-canyon, jamming, gnss-sim). Apenas movimento e eventos; não é escrito nenhum sinal e não se reclama desempenho de nenhum simulador nem recetor.

# text
seg-f953ad11fe08 = O QUE É VERIFICADO EXTERNAMENTE, indicado de forma estreita: face a pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } e scipy { "1.18.1" }, executados por scripts/gen_testbench_ref.py em { "4" } cenários sintéticos, com tolerâncias fixadas antes da primeira comparação (cada uma o pior caso do arredondamento do escritor): as colunas fixas à Terra são iguais à conversão WGS { "84" } das colunas geodésicas (pior { "1.3e-4" } m, limiar { "3e-4" }) e o inverso ({ "1.3e-9" } graus, limiar { "2e-9" }; altura { "1.3e-4" } m, limiar { "3e-4" }) em todas as linhas; a velocidade fixa à Terra rodada para norte-este-baixo pela operação topocêntrica do PROJ é igual à velocidade NED verdadeira do motor ({ "7.5e-5" } m/s, limiar { "2e-4" }); o rumo, a inclinação longitudinal e a inclinação lateral são iguais ao yaw-pitch-roll do scipy do quaternião verdadeiro do motor ({ "5.0e-7" } graus, limiar { "1e-6" }); todas as frases NMEA são interpretadas pelo pynmea2 com soma de verificação válida e a sua posição descodificada ({ "1.2e-3" } m, limiar { "5e-3" }), altura, velocidade, rumo efetivo ({ "5.0e-4" } graus, limiar { "1e-3" }) e hora são iguais aos valores do movimento; a coluna UTC é igual a aritmética de data e hora independente. O SHA-256 dos bytes exatos de CSV e NMEA verificados está fixado. O QUE NÃO É: a própria trajetória verdadeira do cenário (o perfil de condução e a sua integração); as convenções (o rumo é a guinada do corpo, não o rumo efetivo, e difere dele até cerca de { "77" } graus em automotive-urban-canyon; a qualidade GGA, o número de satélites e o HDOP são valores provisórios); se algum simulador de laboratório lê os ficheiros como pretendido; o desempenho de qualquer simulador ou recetor. As referências independentes verificam conversões e codificações, não a física do cenário. O tratamento do referencial local é verificado apenas através da rotação da velocidade e da velocidade e rumo efetivo NMEA (o CSV não tem coluna de posição local).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): um mapeamento das saídas do Kshana para cláusulas de referenciais públicos apenas por número, preenchido a partir das execuções fornecidas; um resultado só conta para uma capacidade quando traz a evidência que o mapeamento nomeia, um conjunto vazio não evidencia nada, e a formulação é "fornece elementos de prova em apoio de"; o relatório não é uma conclusão de que algum referencial seja satisfeito nem uma classificação ou aprovação por quem quer que seja.

# text
seg-8659260fd38e = Referências verificadas face a um índice de títulos extraído por script dos documentos públicos citados, lidos em 2026-10-10 (tests/compliance_references.rs). O QUE É VERIFICADO: { "49" } referências citadas a cláusulas, secções, parágrafos ou títulos existem no documento citado, e { "7" } URLs citados resolveram na data registada ({ "2" } por uma segunda via); os controlos negativos falham. O QUE NÃO É: que alguma paráfrase, mapeamento ou lacuna esteja correta; as cláusulas da EN { "16803" } (paga, apenas texto do catálogo); revisões posteriores; o índice não é uma implementação independente.

# text
seg-98c360d82d56 = Integrações marítimas: plugin Signal K, fluxo de barreira e painel de pontuação do OpenCPN, compilação de referência

# text
seg-7af9ce566646 = A pontuação de confiança, a banda, os motivos, o estado da barreira e a posição comunicada pelo recetor publicados em navigation.gnss.kshana num servidor Signal K com uma notificação de aviso, de alarme e normal (integrations/signalk); o fluxo NMEA com barreira, com a posição marcada como inválida enquanto a confiança está colapsada e uma frase PKSHT por ciclo, servido ao OpenCPN por TCP pela própria barreira ou por um pequeno retransmissor, e um painel nativo de pontuação do OpenCPN que lê a frase PKSHT (integrations/opencpn); e unidades systemd e um contentor que executam a barreira (deploy/reference-build). Onde estes mostram saída, trazem a declaração consultiva: Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
seg-00a0f52f7458 = O QUE É VERIFICADO, indicado de forma estreita: que estas integrações funcionam com o software real para que foram escritas. A EVIDÊNCIA está versionada em integrations/signalk/evidence/README.md (com os seus ficheiros JSON) e em integrations/opencpn/evidence/README.md (com as suas capturas de ecrã e registos), cada uma com o script que a reproduz. ({ "1" }) Signal K: o plugin carregado no pacote npm signalk-server { "2.33.0" } fixado, num espaço de nomes de rede privado só de loopback, alimentado com dados sintéticos. As próprias interfaces REST e WebSocket do servidor mostraram os caminhos publicados, os metadados da pontuação e uma notificação que passou por ausente, aviso, alarme, normal (após a retenção) e aviso de novo quando os dados pararam. Com o kshana real executado pelo plugin sobre o NMEA que o próprio servidor recebeu, a notificação passou a aviso e depois a alarme e a posição comunicada foi publicada; o navigation.position do próprio servidor foi escrito pelo seu fornecedor NMEA, nunca pelo plugin. Executado de novo com o esquema JSON em direto { "1.2" }. ({ "2" }) OpenCPN: o plugin compilado com o cabeçalho da API de plugins do OpenCPN e wxWidgets { "3.2.4" }, carregado no pacote Ubuntu { "24.04" } do OpenCPN { "5.8.4" } sob um ecrã virtual; o OpenCPN carregou-o, executou a sua inicialização e entregou-lhe as frases PKSHT do fluxo com barreira, e o painel ficou vermelho na banda não fiável. Numa execução limpa, a posição do navio do próprio OpenCPN deixou de se atualizar, e o seu indicador de posição desceu, quando a barreira marcou a posição como inválida. Uma segunda execução, alimentada diretamente pelo recetor TCP da barreira, mostrou entrega ao plugin mas não um antes e depois limpo. ({ "3" }) Os testes do retransmissor reproduzem um excerto gravado do fluxo com barreira através de um socket TCP real e verificam o que um consumidor recebe (os bytes inalterados, somas de verificação válidas em todas as frases, incluindo as reescritas, GGA e RMC concordantes, uma PKSHT por ciclo com o campo da barreira quando a posição é inválida), e o script de ponta a ponta verifica que um consumidor do recetor da barreira recebe exatamente os bytes que a mesma barreira escreve na saída padrão. ({ "4" }) Os analisadores PKSHT (JavaScript e C++) são executados sobre frases gravadas da saída do kshana e rejeitam uma soma de verificação, uma versão ou uma pontuação fora de { "0" } a { "100" } erradas. ({ "5" }) As unidades systemd são verificadas com systemd-analyze verify (systemd { "255" }, binários substituídos por stubs) e com guardas para uma shell em ExecStart, a política de reinício e as chaves da sandbox; o tratamento de argumentos do ponto de entrada do contentor é verificado com um binário stub. O QUE NÃO É: não existe nenhuma referência independente externa para qualquer valor que estas integrações mostram. Os valores de confiança são as linhas acima, e uma execução de integração só mostra que a canalização os transporta; é por isso que esta linha é MODELLED e não VALIDATED (docs/VALIDATION.md). Não foi usado nenhum navio real, recetor, execução longa, outra versão de qualquer dos anfitriões, outro sistema operativo ou ambiente de trabalho; todos os dados são texto sintético e nada aqui é uma medição. O tratamento sonoro e visual da notificação por um cliente Signal K real, o botão da barra de ferramentas do OpenCPN, as preferências e o estado desatualizado, e o empacotamento para o gestor de plugins do OpenCPN não foram exercitados. As chaves da sandbox do systemd foram verificadas apenas quanto à sintaxe, não executadas sob um systemd em funcionamento, e a compilação da imagem do contentor e a sua verificação de saúde não têm aqui evidência versionada. Não se reclama nenhum valor de deteção nem de falsos alarmes. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
seg-89ab9ef155eb = Seguimento BOC({ "1,1" }): escala do DLL e resolução de ambiguidade bump-jump (opcional)

# text
seg-ef24be9b5917 = O campo boc de iq::track::LoopConfig (opcional, None por omissão): os três discriminadores do DLL reescalados para ler o erro de código em chips com declive unitário no pico principal do BOC({ "1,1" }) em seno, e um monitor bump-jump nos correladores muito adiantado e muito atrasado a meio período de subportadora ({ "0.5" } chip) que faz saltar o NCO de código para o pico principal quando um contador ascendente/descendente atinge N ({ "8" } por omissão). Sem a opção, todas as saídas permanecem inalteradas.

# text
seg-416ce4dfc6f5 = Consistência interna face a verdade injetada e a formas fechadas, sob limiares pré-registados em 6b68f6cc (docs/design/evidence/boc-bump-jump/). Um sinal de dados BeiDou B1C (PRN { "19" }, { "5" } MS/s) gerado por iq::scene: com a opção desligada, um arranque num pico lateral permanece com falso bloqueio nos ±({ "0.5" } + d/4) chip previstos (medido ±{ "0.549" }); com ela ligada, um salto para o pico principal aos { "0.08" } s e um RMS na janela tardia de { "0.0008" } chip a { "45" } dB-Hz e { "0.0048" } chip a { "35" } dB-Hz; nenhum salto a partir do pico principal a { "35" }, { "40" } e { "45" } dB-Hz ao longo de { "4" } s; o declive EMLP escalado de { "0.94" } a { "0.99" } sobre o sinal amostrado (sem escala { "3.6" } a { "3.8" }). O detetor bump-jump isolado, sobre trios de correladores com a covariância de ruído exata do BOC({ "1,1" }), não fez nenhum salto falso em { "100 000" } atualizações a { "25" } a { "45" } dB-Hz e detetou { "1000" } de { "1000" } arranques em pico lateral a { "35" } dB-Hz. NOT MET (resultado F1): a grelha de testes unitários pré-registada para a escala inclui desvios fora do intervalo linear dos discriminadores, onde as leituras escaladas falham o desvio até { "48" } %. O QUE NÃO É VERIFICADO: IQ de campo, front-ends de banda limitada, réplicas compostas MBOC/QMBOC e qualquer recetor externo.

# text
seg-2c32955cbfb3 = Canal de cintilação ionosférica IQ (modelo de Cornell) face a cintilação GPS L1 medida a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, o modelo de cintilação de Cornell (intensidade de Rice, espectro de Butterworth de segunda ordem, fase arg z) conduzido com o S4 e o tempo de decorrelação da intensidade de uma janela medida, comparado naquilo que gera para além dessas duas entradas; realdata::scint50 lê o registo medido, retira-lhe a tendência e executa a comparação.

# text
seg-bdc9fe963c5c = Dados medidos sob limiares pré-registados em b6ccb499 (xval/scint-malindi/): registo Zenodo { "16941224" } (INGV, Malindi, { "18" } de março de { "2023" }, GPS PRN { "26" }, intensidade e fase da portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 verificado). { "22" } janelas de { "60" } s elegíveis (N1 satisfeita). MET: a distribuição da intensidade (Kolmogorov-Smirnov D { "0.0415" }, limiar { "0.05" }) e a cintilação de fase ligada ao S4 (mediana de sigma-phi medido/modelo { "0.779" }, limiar 2/3 a 3/2). NOT MET (resultado F1): a fração de desvanecimento profundo do modelo é { "2.38" } vezes a medida (limiar { "0.5" } a { "2" }) e o seu desvanecimento médio é { "3.51" } vezes mais longo (limiar 2/3 a 3/2). Resultado F2: o processamento registado lê a fase enrolada do modelo, o que uma autoverificação revelou; B3 repetido a posteriori com a fase desenrolada dá { "0.804" }. O QUE NÃO É VERIFICADO: outras noites, estações, latitudes ou sinais; ruído do recetor no modelo. A linha continua MODELLED.

# text
seg-160507ac3702 = Opção CFAR de média de células na aquisição IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar e ca_cfar_cells (opcional): uma célula de uma grelha de aquisição é comparada com a média de células de referência da sua linha de Doppler (desfasamentos de guarda e de passo, a dar a volta ao período), com um fator alpha definido a partir da probabilidade de falso alarme CA-CFAR em forma fechada para M blocos não coerentes (ca_cfar_pfa, ca_cfar_alpha). O detetor de potência de amostra continua a ser o predefinido e todas as saídas existentes permanecem inalteradas.

# text
seg-ba35daac2aed = Forma fechada, sob limiares pré-registados em 3724aefa (docs/design/evidence/acq-cfar/). A probabilidade de falso alarme CA-CFAR para células Gamma(M), face a Monte Carlo do modelo exato: { "18" } de { "18" } casos dentro de { "3" } sigmas binomiais. Em todas as células de pesquisas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } células cada) com um valor de projeto de { "1" } %: { "0.977" } % e { "0.969" } % em ruído gaussiano e { "1.006" } % e { "0.999" } % em ruído quantizado a 2 bits (M = { "1" } e { "4" }; limiar de mais ou menos { "20" } %); decisões inalteradas quando a entrada é escalada. NOT MET (resultado F1): num sinal de 2 bits sem ruído, a deteção e a sua célula estão certas, mas { "1.28" } % das células fora do pico da linha do pico (limiar { "1" } %) excedem o limiar, nos lóbulos laterais de correlação determinísticos do código. O QUE NÃO É VERIFICADO: outras variantes de CFAR, janelas bidimensionais, front-ends de banda limitada, dados de campo.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou e Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resolve, apenas por nome (MORE_BAND_NAMES), GLONASS L1OF e L2OF em todos os canais FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a e B3I (BPSK({ "10" })) e Galileo E6 (BPSK({ "5" })), com as portadoras e as potências mínimas recebidas dos seus documentos de controlo de interface; o conjunto de bandas predefinido e todas as saídas existentes permanecem inalterados.

# text
seg-6d674bc4b40a = Documentos de controlo de interface publicados e formas fechadas, sob limiares pré-registados em 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edição { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } e B3I { "1.0" }, Galileo OS SIS ICD Edição { "2.1" }. MET: todas as portadoras, taxas de chip e potências recebidas tal como transcritas ({ "28" } canais GLONASS), os primeiros nulos do BPSK na taxa de chip, o B1C composto igual a MBOC(6,1,1/11) como indica a tabela de potências do seu ICD, a identidade do caminho C/N0 e cenários de espectro idênticos byte a byte. NOT MET: o limiar de área unitária, que era inatingível tal como escrito (resultado F1; as áreas são iguais à fração em banda em forma fechada), e a concordância por bin das formas de onda B1I e B1C da camada IQ com a envolvente do modelo ({ "1.26" } e { "1.56" } dB contra { "0.5" } dB, resultado F2; GLONASS { "0.07" } dB), porque os códigos Gold e Weil têm espectros de riscas irregulares; em média de banda, os lóbulos principais concordam dentro de { "0.25" } dB. O QUE NÃO É VERIFICADO: IQ gravado, outros sinais, interferência intrassistema.

# text
seg-63b7da996265 = Códigos de alcance primários BeiDou B1I face a um gerador independente

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits e b1i: os códigos Gold do BDS-SIS-ICD-B1I-3.0 truncados a { "2046" } chips, PRN { "1" } a { "63" }, tal como a camada IQ os gera, adquire e segue.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (etiqueta { "v0.0.19" }, commit 1ddd4562), uma implementação de código aberto independente do mesmo ICD: o seu beidou_b1i_code_gen_int, compilado de forma autónoma, gerou todos os { "63" } códigos. Apenas a sua saída de programa está versionada: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, um prefixo de 64 chips e o SHA-256 de cada código de 2046 chips. Essa saída são os códigos PRN BeiDou B1I que o BDS-SIS-ICD-B1I-3.0 público define; nenhum código-fonte nem binário do GNSS-SDR está no repositório. Limiar pré-registado em 911106d1 (xval/beidou-b1i-gnss-sdr/): todos os { "2046" } chips de todos os { "63" } PRN idênticos, sem inversão, deslocamento nem renomeação. Resultado: { "63" } de { "63" } idênticos; o conjunto de dados de ensaio foi regenerado a partir de uma cópia nova de { "v0.0.19" } (SHA-256 do ficheiro de origem tal como registado) e é idêntico byte a byte. O QUE NÃO É VERIFICADO: o código secundário NH20, a lista de PRN GEO, a portadora e a taxa de chip.

# text
seg-b4787b04338e = Códigos de alcance e de sobreposição GPS L1C face às colunas de verificação impressas da IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits e l1c_o_bits: os códigos de alcance Weil L1CP e L1CD (sequência de Legendre calculada, índice de Weil, sequência de expansão inserida antes do chip p) e os códigos de sobreposição L1CO S1, PRN { "1" } a { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, declaração de distribuição A), as colunas de verificação que imprime junto dos parâmetros do gerador: Tabela 3.2-2 os { "24" } chips iniciais e finais de cada código L1CP e L1CD, Tabela 3.2-3 os { "11" } bits iniciais e finais de cada código L1CO, Tabela 6.2-1 a sequência de Legendre de comprimento 10223; transcritas por scripts/extract_is_gps_800_tables.py a partir do PDF (SHA-256 c4aad710...). Limiares pré-registados em fe372e26 (docs/design/evidence/l1c-codes/): { "252" } de { "252" } colunas, { "63" } de { "63" } sobreposições e { "10 223" } de { "10 223" } bits de Legendre idênticos; a extração --check passa; um controlo negativo falha códigos renomeados, invertidos e deslocados. O QUE NÃO É VERIFICADO: os próprios parâmetros do gerador (vêm das mesmas tabelas), os chips entre as colunas impressas, o padrão de subportadora TMBOC e os códigos L1CO S2.

# text
seg-5cba09089e09 = Códigos primários LunaNet AFS-I e AFS-Q face às colunas de verificação impressas da LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits e afs_q_primary_bits (nomes de sinal lunanet-afs-i e lunanet-afs-q em kshana iq): o código Gold AFS-I ({ "2047" } com ciclo curto para { "2046" }, G2 atrasado por PRN) e o código primário Weil AFS-Q (sequência de Legendre calculada, índice de Weil, sequência de expansão inserida antes do chip p), PRN { "1" } a { "210" }.

# text
seg-330ed84e8e78 = Face às tabelas impressas da LSIS-AFS V1.0 (assinaladas TBC na especificação): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" } de janeiro de { "2025" } (NASA; SHA-256 do PDF { "986e0795" }...), as colunas de verificação que imprime junto dos parâmetros do gerador: Tabelas C-1 a C-5 e D-2 a D-6 os primeiros e últimos { "24" } chips de cada código AFS-I e AFS-Q, Tabela D-1 a sequência de Legendre de comprimento 10223; extraídas por scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Limiares pré-registados em b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md) antes de o gerador existir: B1 { "420" } de { "420" }, B2 idêntico, B3 { "420" } de { "420" }. O documento assinala as suas tabelas de códigos como { "{" }LSIS-TBC{ "}" } e diz que são só para ensaio e integração, pelo que isto valida a construção face às tabelas dessa edição, não às de uma posterior. Uma afirmação pré-registada sobre o estado inicial impresso de G2 (B1b) foi enunciada com o sentido errado e é NOT MET ({ "0" } de { "210" }), fixada; a relação corrigida ({ "2047" } menos o atraso) verifica-se em { "210" } de { "210" } e fica registada como a posteriori. O QUE NÃO É VERIFICADO: os próprios parâmetros do gerador (mesmas tabelas), os chips entre as colunas impressas, o código terciário, a camada de mensagens e a codificação LDPC.

# text
seg-7b1ae0c7ca28 = Códigos terciários e camada de mensagens LunaNet AFS (SB1 BCH, CRC-24Q, entrelaçador) face à LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: padrão de sincronização, codificador SB1 BCH({ "51,8" }) e descodificador de 256 hipóteses, CRC-24Q, o entrelaçador de blocos de { "60" } x { "98" }, um verificador de fluxo de símbolos (kshana lunanet-afs-check) e um gerador de fluxo de teste com subtramas provisórias. A codificação LDPC de taxa 1/2 das subtramas { "2" } a { "4" } não está implementada (as suas matrizes estão num anexo separado).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (como acima): a sequência de Legendre de comprimento 1499 (Tabela E-1, idêntica) e os primeiros e últimos { "24" } chips terciários (Tabelas E-2 a E-6: { "419" } de { "420" } colunas idênticas; o documento imprime os mesmos últimos { "24" } chips, A14850, para o PRN { "147" } e o PRN { "151" } e o gerador reproduz os do PRN { "151" }, pelo que a entrada do PRN { "147" } é muito provavelmente uma gralha; o limiar de { "420" } de { "420" } é NOT MET e a falha está fixada); o exemplo trabalhado da Figura { "8" } do código SB1 (um exemplo: 0x045 codifica-se em 0x229F61DBB84A0); CRC-24Q face ao valor de verificação de catálogo 0xCDE703 para o ASCII { "123456789" }; a aritmética de tramas do próprio documento. Limiares pré-registados em b3ba5d5. Uma falha registada e um exemplo trabalhado para a camada de mensagens, pelo que a linha continua MODELLED. O QUE NÃO É VERIFICADO: LDPC e as palavras CRC dentro das subtramas { "2" } a { "4" }, o conteúdo das mensagens e qualquer fluxo gravado

# text
seg-0d7b17524c04 = Pacotes de normas: cenários pontuados face a limiares indicados antes da execução

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): os perfis de ensaio do referencial DHS Resilient PNT para os níveis { "1" } a { "4" }, os níveis de exatidão e a avaliação de integridade da IMO MSC.1/Circ.1575, e os pacotes de monitorizar, avaliar e mitigar do Apêndice F do ICAO Doc { "9849" }: cada ensaio executa um tipo de cenário incluído e compara campos de resultado com limiares indicados no pacote, e os ensaios que precisam de um registo de recetor ficam listados como NEEDS INPUT e não são pontuados.

# text
seg-d9ea966abdd6 = Nenhuma referência externa para os resultados dos cenários: cada ensaio do pacote executa um tipo de cenário MODELLED. Os limiares são o perfil indicado pelo autor do pacote (o referencial DHS não indica valores; os limites de exatidão da IMO são a Tabela C-1 da MSC.1/Circ.1575, lida na íntegra; o pacote ICAO segue a apresentação do próprio Plano de Mitigação de RFI do ICAO porque o Doc { "9849" } é uma publicação paga e não foi lido), versionados antes de qualquer execução pontuada em ficheiros PREREGISTRATION.md ao estilo xval em standards/. Um limiar MET diz que um cenário modelado atingiu um limiar indicado, nada sobre um produto

# text
seg-8a8f2c85e0c3 = Pacote de evidências de ida e volta de laboratório (cenário, condições de ensaio, registo do recetor, pontuação)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) e a exportação do registo do recetor kshana.test-conditions/1 de kshana bench-export: um pacote assinado que regista a soma de controlo do cenário, a das condições indicadas, a do registo e a pontuação face aos eventos indicados, e que recusa condições que discordem dos eventos de pontuação ou um registo cuja soma de controlo não seja a indicada. Nenhum sinal é escrito, reproduzido nem programado.

# text
seg-76da58fe670a = Nenhuma externa: o pacote liga somas de controlo e uma pontuação MODELLED do registo do recetor, verificadas em dados sintéticos (o NMEA exportado de um cenário incluído tratado como o registo do recetor). Não se reclama nenhuma execução em laboratório

# text
seg-a9189e4fe413 = Motor de seguimento IQ face ao GNSS-SDR { "0.0.19" } em gravações independentes

# text
seg-364de05e5b1b = O motor de seguimento completo da camada IQ (iq::track através de kshana iq track: passagem da aquisição, correladores, NCO, PLL Costas de segunda ordem a { "15" } Hz, DLL de envolvente EML de primeira ordem a { "2" } Hz assistido pela portadora, indicador de bloqueio e estimadores de C/N0) em GPS L1 C/A a { "30" } a { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, o pacote Ubuntu { "24.04" }, executado como programa separado; apenas números derivados versionados) a seguir as mesmas gravações numpy (independentes do motor), ambos medidos face à verdade analítica. Limiares pré-registados em 48edd4a5, alterados antes de qualquer gravação de teste em 1e4288c4 (um FLL de { "10" } Hz apenas durante a captura inicial em ambos os recetores, depois de a calibração registada ter falhado numa passagem errada do GNSS-SDR, resultado F3). MET a { "30" }, { "35" }, { "40" } e { "45" } dB-Hz: jitter de portadora dentro de { "4.3" } %, jitter de código dentro de { "4.6" } % e média e dispersão de Doppler dentro dos do GNSS-SDR. NOT MET: o C/N0 NWPR do motor lê { "2.3" } a { "7.1" } dB abaixo do SNV do GNSS-SDR (resultado F4, o limite conhecido do NWPR; o seu M2M4 está a { "0.06" } dB da verdade); os indicadores de bloqueio de fase diferem por definição (F5); a { "30" } dB-Hz o GNSS-SDR deslizou duas vezes e o motor não (F6). A própria passagem do GNSS-SDR bloqueou numa frequência errada em { "3" } de { "30" } execuções de calibração. O QUE NÃO É VERIFICADO: outros sinais, remoção de bits de dados, reaquisição, gravações de campo. A linha continua MODELLED.

# text
seg-259d201c2ff8 = Ganhos de antena CRPA no tipo de cenário jamming face a um recálculo independente em numpy

# text
seg-192144c57783 = A secção opcional [crpa] do tipo de cenário jamming: um feixe por canal na direção de cada satélite (anulação direcionada com o jammer como nulo, ou MVDR em sigma^{ "2" } I + P_j a_j a_j^H), escalando o ruído de cada ligação por ||w||^{ "2" } e o jammer por |w^H a_j|^{ "2" } antes da equação de C/N0 anti-jam existente.

# text
seg-232d040b575d = Um recálculo independente em numpy (xval/crpa-jamming/oracle.py, sem código partilhado: vetores de direção numpy, numpy.linalg.solve e inv) de todas as ligações da geometria de jamming-demo com um agrupamento quadrado de 4 elementos, sob as duas ponderações. Limiares pré-registados em 08d83b4d. MET: A1 (todos os { "150" } resultados de cenário idênticos byte a byte sem a secção, após uma correção: a primeira compilação acrescentou as unidades crpa à tabela de unidades de cada execução de jamming), A2 (um elemento é igual a nenhum agrupamento até { "1e-12" } dB), A3 no ganho de ruído do agrupamento e no C/N0 efetivo ({ "912" } ponderações de ligação dentro de { "1e-9" } dB, pior { "2.1e-14" } dB) e no nulo do jammer com anulação direcionada (abaixo de -200 dB em ambos os lados), A4 (MVDR a { "0.1" } dB da anulação direcionada com um JNR de { "80" } dB). NOT MET: A3 no ganho do jammer do MVDR, { "194" } de { "456" } ligações acima de { "1e-9" } dB em { "0.36" } com matemática portátil ({ "202" } com matemática do anfitrião; docs/revisions/STUDIO15-batch4-rebaseline.md) (pior { "1.7e-6" } dB) em resíduos de -100 a -188 dB, onde o cancelamento em float64 limita ambas as implementações (o inv e o solve do numpy discordam entre si em { "169" } ligações, pior { "7.9e-7" } dB); o C/N0 efetivo que estes alimentam não é afetado. O QUE NÃO É VERIFICADO: acoplamento mútuo, desadaptação de elementos, processamento de banda larga, vários jammers, qualquer hardware de antena. Um recálculo das mesmas equações, não uma referência independente externa; a linha continua MODELLED.

# text
seg-a2f34cff9338 = Sombra de terreno sobre o jammer no tipo de cenário jamming face a um recálculo independente em numpy numa tesela SRTM real

# text
seg-334c569d9cae = A secção opcional [terrain] do tipo de cenário jamming: o perfil de terreno em círculo máximo entre o jammer e o recetor numa tesela SRTM .hgt com uma curvatura da Terra de fator k, o gume de faca dominante (maior nu de Fresnel-Kirchhoff) e a perda de gume de faca único da ITU-R P.526-15 secção { "4.1" }, subtraída à potência recebida do jammer.

# text
seg-615ea67dd756 = Um recálculo independente em numpy (xval/jamming-terrain/oracle.py, sem código partilhado: leitura própria de .hgt, interpolação bilinear, ida e volta WGS { "84" }, perfil, curvatura, nu e J(nu)) de dez posições de jammer em torno de um recetor em Badwater Basin, na tesela SRTM real versionada tests/fixtures/terrain/N36W117_sub6.hgt. Limiares e posições pré-registados em 92cd2bfd. Todos MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem a secção); os pontos do perfil e o obstáculo de cada posição iguais e nu e perda dentro de { "1.6e-10" } (limiar { "1e-9" }); a perda nunca aumenta quando o jammer sobe de { "2" } para { "4902" } m; a perda reduz cada J/S exatamente do seu valor e de mais nada; J(nu) dentro de { "1e-12" } dB do da referência independente. Resultados: as posições através das montanhas Black e Funeral perdem { "44" } a { "48" } dB; duas posições no fundo do vale perdem { "8" } e { "15" } dB só pela curvatura da Terra com antenas a { "2" } m de altura, o caso rasante do modelo de gume de faca único. O QUE NÃO É VERIFICADO: qualquer propagação medida, difração de vários gumes, reflexão no solo, clutter, o erro do próprio DEM. Um recálculo do mesmo modelo, não uma referência independente externa; a linha continua MODELLED.

# text
seg-825c121c7512 = Histerese de aquisição e quantizador do front-end no tipo de cenário jamming face a recálculos independentes

# text
seg-f7207263d881 = A secção opcional [acquisition] do tipo de cenário jamming (um satélite é adquirido num limiar de aquisição ou acima dele após um atraso de reaquisição e mantido enquanto estiver no limiar de seguimento ou acima dele) e a secção [front_end] (a leitura do AGC { "10" } log10({ "1" } + J/N) e a perda do quantizador do ADC para entrada gaussiana retiradas de cada ligação, assinalada como não válida para jammers não gaussianos).

# text
seg-6abc60ee9ec4 = Um recálculo independente em Python de cada indicador de aquisição (xval/jamming-acq-agc/hysteresis.py) a partir do C/N0 efetivo por época do motor, um Monte Carlo independente em numpy da perda do quantizador (xval/jamming-acq-agc/quantiser_mc.py, a sua própria pesquisa do passo ótimo, { "2" }^{ "22" } amostras) e o laço de AGC da camada IQ. Limiares pré-registados em 70c72fcc, com um conjunto suplementar de execuções definido em { "37793290" }. MET: aditividade (todos os { "150" } resultados de cenário idênticos byte a byte sem as secções); todos os indicadores iguais nas execuções suplementares ({ "1824" } ligações, { "732" } das quais com histerese); monótono no limiar; a perda do quantizador dentro de { "0.0007" } dB do Monte Carlo a { "1" } a { "4" } bits (limiar { "0.02" } dB); a leitura do AGC dentro de { "0.012" } dB do laço de AGC (limiar { "0.05" } dB). NOT MET: as execuções de histerese registadas (jamming-demo a { "10" } a { "30" } dBW) foram pouco informativas, com todas as ligações perdidas, e o seu H2 e H4 só são atingidos de forma trivial. Resultado: com um jammer CW, um ADC de 1 bit perde cerca de { "5" } dB mais do que o valor gaussiano que o motor aplica, e assinala como não válido. O QUE NÃO É VERIFICADO: a própria pesquisa de aquisição, a dinâmica do AGC no tempo, qualquer hardware de recetor. Recálculos do mesmo modelo, não uma referência independente externa; a linha continua MODELLED.

# text
seg-9c46f1c76486 = Captura inicial do FLL limitada abaixo do patamar de passagem de FLL para PLL do projeto predefinido (opcional)

# text
seg-efa1d1a9e904 = fll_pull_in_max_s opcional de iq::track (o campo fll_pull_in_max_s de iq::track::LoopConfig): com fll_assist = pull-in, o FLL passa o controlo ao PLL após um tempo fixo de captura inicial, seja qual for o PLI, com um tempo de permanência de regresso correspondente até o PLI atingir pela primeira vez fll_off_pli.

# text
seg-76cce58eaddd = Consistência interna face a verdade injetada: uma fonte GPS L1 C/A sintética sem dados (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dez sementes de ruído) cuja fase da portadora é conhecida, sob limiares pré-registados em 58789af0 (docs/design/evidence/fll-handover-floor/). MET: o controlo (o valor predefinido sem limite nunca passa o controlo em { "9" } de { "10" } sementes a { "33" } dB-Hz); aditividade (soma de controlo predefinida e testes de seguimento existentes inalterados); captura inicial de uma passagem desviada { "100" } Hz a { "45" } dB-Hz. NOT MET: com um limite de { "1.0" } s, passagem e manutenção em todas as execuções ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; as restantes alternam entre passagens forçadas e o regresso do FLL) e o jitter de fase dentro de { "25" } % do PLL isolado ({ "10.8" } contra { "6.1" } graus a { "33" } dB-Hz). O QUE NÃO É VERIFICADO: bits de dados, outros sinais e taxas de amostragem, gravações de campo. O valor predefinido não muda; a linha continua MODELLED.

# text
seg-ac0f97e945a7 = Leitor de soluções .pos do RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lê um ficheiro de solução do RTKLIB (hora de calendário ou semana GPS/TOW, posição em latitude/longitude ou ECEF, satélites usados) para a cronologia de receiver-trust (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Nenhuma externa: não foi lido nenhum ficheiro produzido pelo RTKLIB e a disposição das colunas vem do manual do RTKLIB. Verificado apenas em ficheiros escritos internamente; a conversão ECEF reutiliza frames::ecef_to_geodetic, que tem as suas próprias linhas

# text
seg-849393517c04 = Registos NovAtel OEM7 ASCII e binários (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lê BESTPOS (posição), RANGE (C/No por sinal) e RXSTATUS (o indicador de jammer do recetor, como autorrelato da época) de registos OEM7 ASCII e binários, com CRC verificado, só de leitura (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Nenhuma externa como limiar de passagem. As disposições dos campos e o CRC seguem a documentação pública do OEM7 (docs.novatel.com); a rotina de CRC foi verificada uma vez face ao CRC que a documentação indica para o seu próprio exemplo BESTPOSA (citado, não transcrito). Os conjuntos de dados de ensaio são escritos internamente; não foi lido nenhum registo de um recetor real

# text
seg-a45c53a9deb3 = Leitor de relação portadora-ruído RTCM { "3" } MSM4 e MSM7 para receiver-trust

# text
seg-0a0c9976236f = Lê o C/N0 de cada célula de sinal das mensagens RTCM { "3" } MSM4 e MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de um fluxo de tramas, com CRC-24Q verificado (receiver_trust::machines::rtcm3). Disposições das tabelas pyrtcm de licença BSD, não do texto da norma RTCM.

# text
seg-2af6fc1abe98 = ReferenceImpl numa verificação pontual, não um teste da bateria: o descodificador do pyrtcm { "1.2.0" } lê as mesmas tramas escritas internamente e obtém o mesmo C/N0 e a mesma hora de época. Partilha a origem das tabelas com este leitor, pelo que verifica o tratamento de bits, não a disposição. Não foi lida nenhuma captura de um recetor real nem de uma estação de base

# text
seg-cd554a7c1649 = Adaptador de monitor GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lê mensagens do Monitor do GNSS-SDR (Gnss_Synchro) e do monitor PVT, retransmitidas como linhas JSON com os nomes de campo do proto, para C/N0 por canal, posição, satélites usados, HDOP e céu (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Nenhuma externa: os nomes de campo vêm da documentação do GNSS-SDR; nem o leitor nem o relay.py foram executados contra um GNSS-SDR em funcionamento ou uma captura real

# text
seg-217e5953c128 = Ingestão de registos IMU, entrada de rumo por giroscópio e ajuste de Allan dos parâmetros de sensores híbridos

# text
seg-9dadc819daef = Lê um CSV de IMU (colunas documentadas ou a disposição EuRoC); integra a taxa de guinada no rumo que o monitor de rumo-trajetória lê ([log.imu]); e ajusta os parâmetros de ruído do acelerómetro e do giroscópio dos cenários híbridos e de fusão a partir de um registo estacionário por desvio de Allan sobreposto (imu-fit).

# text
seg-9099f3467e9e = Nenhuma externa: o ajuste é verificado em registos sintéticos de ruído branco com coeficientes conhecidos, o rumo em registos de taxa de guinada constante. Não foi ajustado nenhum registo IMU real e q_aa não é ajustado

# text
seg-15a852a2dcb0 = Descoberta MQTT do Home Assistant e exportador de estado para telemetria de confiança

# text
seg-6d6b07b26966 = Um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant para o fluxo de confiança, impressos como texto em todas as superfícies e publicados por MQTT { "3.1.1" } QoS { "0" } pela CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Nenhuma externa: os pacotes foram lidos por um recetor de loopback escrito para o teste, não por um broker real, e o Home Assistant não foi executado

# text
seg-68caf86157c2 = Pacote receiver-trust para ROS { "2" } e ponte gnss_lib_py

# text
seg-e7d7d99fe538 = Uma ponte sem ROS que escreve mensagens de posição e de satélites como NMEA e as pontua através da ligação Python (integrations/ros2/kshana_trust), e uma ponte de NavData do gnss_lib_py para receiver-trust através do formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Nenhuma externa: o nó ROS não foi executado num grafo ROS { "2" } em funcionamento e os nomes de campo ublox_ubx_msgs não foram verificados contra um controlador em execução. O gnss_lib_py (MIT) foi executado para o teste da ponte

# text
seg-c3c260b7063e = Testes

# text
seg-33d506570c1b = srp_shadow::tests (a forma fechada anular, a lei uniforme que reproduz a sombra cónica, limites de pleno sol e de umbra)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horários ao longo de { "24" } h, LEO, GEO e HEO, terceiro corpo e terceiro corpo + SRP: pior |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; o controlo de série analítica falha por { "9.96" } m; Sol { "6.39" } m e Lua { "0.244" } m a partir das posições DE440 do Orekit, uma falha registada); testes unitários do propagator (recusa do fornecedor, contagem de recurso partilhada entre clones)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (o termo S1 é diurno, roda { "90" } graus num quarto de dia e tem a amplitude do fator de carga de cada linha; magnitude física em LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit em { "8" } pontos fora do eixo: máx |da| { "2.2e-17" } m/s^{ "2" } com N = { "70" }, sempre executado; { "3.5e-17" }, { "3.9e-17" } e { "7.3e-17" } m/s^{ "2" } com N = { "200" }, { "360" }, { "2190" }, condicionado por dados em KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada por dados: pior |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; controlo de grau 70 { "0.726" } m); testes unitários de gravity_sh (concordância com o avaliador clássico até { "1e-13" } no grau { "70" }, diferença finita e continuidade no polo num campo de grau 2190, um termo de grau 2190 com subdepassamento face a um cálculo com expoente alargado)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } cenários: range-rate, az/el e misto, LEO e MEO, sem ruído e com sigma com semente { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } e { "10" } graus, face ao Orekit { "12.2" }: conjuntos visíveis idênticos; valores de medição a menos de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM a menos de { "1.2e-14" } relativo; estados com ruído a menos de { "1.74" } cm e { "1.14e-5" } m/s; RMS pós-ajuste por tipo a menos de { "2.7e-4" } relativo; kshana sem ruído face à referência { "1.06e-8" } m; kshana sem ruído face ao Orekit { "1.464" } e { "1.740" } cm em dois cenários, uma falha registada do limiar de { "1" } cm); testes unitários de orbit_determination e batch_ls

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = testes unitários de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (ficheiro de ensaio ESOC de { "8" } h submetido, sigma { "0.032" } m a partir do expoente de cabeçalho { "5" }: RMS 3D do nível 1 { "0.132" } m inalterado, nível 2 { "0.035" } m face a { "0.070" } m com sigma { "1" } m, vindo a alteração da restrição empírica a priori reequilibrada); tests/agency_swarm.rs (o produto Swarm não traz códigos de exatidão e recorre à alternativa, fixado)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de verificação do CRC-24Q 0xCDE703; resposta impulsional convolucional; o Viterbi corrige erros injetados; larguras da disposição); tests/gnss_navmsg_roundtrip.rs (os bits de início dos campos igualam os números de bit do ICD; codificar -> FEC -> entrelaçar -> Viterbi -> descodificar ida e volta a menos de meio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registos Galileo IGS BRDC 2018-133 na grelha de LSB, pior { "3.6e-3" } LSB; limiar pré-registado de contagem de satélites falhado, { "15" } de { "20" }, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (passagem sem ruído; variância de ruído branco 1/(2N-1); reinícios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: erro 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeiras { "4" } épocas do ficheiro IGS MGEX RINEX { "4.00" } MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: os registos do cabeçalho e os valores da primeira época igualam os literais publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabeçalho sintético { "4.02" } a partir da especificação)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registos reais C01-C04: raio geoestacionário, longitudes 140.02/80.04/110.55/159.99 graus nas posições publicadas, |latitude| { "2.13" } graus com a inclinação contra { "6.65" } sem ela; a comparação pré-registada entre SP3 difundido e preciso é condicionada por dados em KSHANA_BDS_GEO_SP3 e não foi executada); rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (percurso em figure-8: RMS 3-D estacionário de { "0.025" } m com portadora contra { "0.470" } m com código nas mesmas medições; { "12" } sementes, NIS/gl médio { "1.00" } e NEES/gl estacionário { "0.92" }; um salto de 1 ciclo detetado na sua época sem falsos alarmes e com a solução intacta; desligar as correções difundidas faz subir o erro de código de { "0.51" } m para { "19.6" } m (iono) e { "8.0" } m (tropo); a execução sem ruído converge para { "0.3" } mm)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), cenários gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada pacote: fundido abaixo do INS livre durante a falha para ambos os sensores; ferroviário: apertado { "5.3" } m contra solto { "12.9" } m de classe de navegação e { "15.6" } m contra { "18.8" } m de classe tática durante a falha, disponibilidade { "0.97" } contra { "0.95" }; tabela apertada validada); tests/gnss_ins_legacy_trajectory_pin.rs (a predefinição de acoplamento solto idêntica bit a bit)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D sobre { "60" } sementes: NEES médio da segunda metade { "8.12" } para { "8" } estados, soma de χ² da última época dentro da sua banda de { "95" } %; uma correção de relógio de { "0.1" } ns reduz o sigma de posição 3-D de { "5.58" } m para { "3.07" } m; filtro de desvio sobre { "60" } sementes: soma de χ²({ "5" }) dentro da banda, desvio dentro de { "3" } sigma em { "59" } de { "60" }; fusion-pnt-coupled com acelerómetros com desvio: p95 de posição { "18.7" } m / { "90.0" } m e integridade { "1.00" } / { "0.97" } acoplado contra { "430" } m / { "4060" } m e { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sem [coupled] idênticos bit a bit)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (a viragem coordenada não tem força lateral e tem fator de carga 1/cos φ; a importação de CSV reproduz um perfil voado a { "1e-3" } m/s e { "1" } m); tests/gnss_ins_trajectory_library.rs (todos os perfis são executados e a fusão supera o INS livre durante a falha; cada um voa o seu movimento nomeado; observabilidade do rumo: sigma de guinada após { "240" } s { "1.27" } graus em cruzeiro em linha reta contra { "0.039" } graus em figure-8 e { "0.062" } graus em arranca-e-para); tests/gnss_ins_legacy_trajectory_pin.rs (resultado herdado e hashes da referência idênticos bit a bit)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE março de { "2023" }, { "4" } perilunas e { "5" } apolunas: período { "6.5004" } d contra { "6.5699" } d ({ "1.07" } %, limiar { "3" } %), apolua { "71 182" } contra { "71 215" } km ({ "0.05" } %, limiar { "5" } %), perilua { "3 385" } contra { "3 245" } km ({ "4.1" } %, limiar { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: todas as { "104" } verificações passam na primeira execução após o pré-registo e50c88d2, pior variância { "3.2" } %, RMS { "1.6" } %, correlação { "0.012" }, média { "2.2" } erros-padrão, fração da elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos os controlos falham como exigido; position_error_is_sigma_times_dop_on_masked_skies: as duas geometrias de linha do horizonte mascarada da nota de conceção, o céu 10sat-mixed sob as predefinições city-street ({ "4" } satélites, PDOP { "16.6" }) e container-terminal ({ "9" } satélites, PDOP { "2.5" }), todas as { "26" } verificações passam na primeira execução após o pré-registo 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (uma primeira verificação, separada, em quatro céus escolhidos à mão (aberto, concentrado, desfiladeiro, meio céu; sigma { "1" } m, semente 0x0D0B5EED) com intervalos de confiança de qui-quadrado a { "1e-6" } no total sobre { "20" } verificações: razões de { "0.987" } a { "1.009" }, o PDOP/GDOP do próprio solucionador igual ao do núcleo até { "2.5e-12" }, e controlos negativos para um erro de DOP de { "10" } % e erros de 1/sin(elevação); executada antes do pré-registo, pelo que é registada, não pré-registada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: na travessia sintética de fiorde de scenarios/training/fjord-natural-degradation.toml as mesmas { "624" } épocas são deduzidas com e sem o [skyline] declarado; com ele, sky-blocked é indicado em { "680" } épocas ({ "0" } sem ele: o recurso à lacuna de azimute não vê nada num fiorde de dois lados), open_fraction é { "0.758" }, e as épocas de classe ambiente descem de { "78" } para { "33" }, sendo as restantes perdas de satélites que o skyline declarado deixa a céu aberto; fora do evento o skyline não altera nenhuma pontuação); receiver_trust::geometry::tests (razões derivadas à mão nos limiares, os limites dos limiares, a rampa e o limite máximo, o piso, os limites das etiquetas, substituições de [geometry], o DOP sobre o núcleo validado, céus retidos e expirados, desconhecido não adivinhado, perda de sinal, a tolerância de geometria fraca, sentinelas de ausência de solução de posição); tests/geometry_trust.rs (um céu mascarado razoável etiquetado e não pontuado, um céu mascarado fraco, uma perda a baixa elevação, uma queda de potência, um HDOP falsificado, perda total de sinal, um arrastamento durante geometria fraca, geometria desconhecida, substituições de sessão, o esquema em direto); tests/geometry_trust_no_change.rs (as duas sessões de exemplo idênticas byte a byte a { "0.35.0" } depois de removidas as chaves acrescentadas); tests/geometry_corpus_identity.rs (todos os corpora NMEA de embarcação submetidos, também como céu aberto só GPS, e os cenários de formação de tripulações: idênticos byte a byte a { "0.35.0" } exceto as épocas fracas, que diferem apenas pela dedução de geometria)

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
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (o núcleo de relógio único face ao gnss_lib_py)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (face à recursão de covariância de Kalman em vários passos; white-FM exato; ida e volta); núcleo de variância de deriva validado externamente em tests/gnss_denied_clock_holdover_reference.rs (face ao scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pré-registada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; condicionado por dados)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pré-registada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-3016100a7015 = clock_state::tests (Q de van-Loan analítico; NEES; positividade da PSD); tests/clock_state_reference.rs (trajetória completa de previsão + atualização — estado x e covariância P de { "3" }×{ "3" } ao longo de { "1925" } passos / { "4" } conjuntos de parâmetros face ao filterpy { "1.4.5" }; pior |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fixa a constatação); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ronda { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelamento recíproco; identidade de Sagnac de duas formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circum-navegação equatorial = { "207.386" } ns face ao valor publicado de Ashby { "207.4" } ns a menos de <{ "0.05" } ns; mais a geometria de Sagnac/geodist verificada cruzadamente com a geodist() do RTKLIB { "2.4.3" } compilada a partir de código-fonte C)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (auto-SSC de BPSK = 2/3R_c; PSD de área unitária; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (correspondência exata em inteiros da correlação cruzada/autocorrelação de Gold do GPS C/A face à geração de códigos independente do IS-GPS-200; PSD de BPSK-R({ "1" })/sine-BOC({ "1,1" }) face a um periodograma independente em scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fixado)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; limite inferior de Freier-2016 como intervalo); tests/quantum_inertial_sensor_reference.rs (função de transferência |H(ω)|, k_eff·T² e ASD de ruído de disparo face aos vetores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fixado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max situa-se no limite de meia franja ±π com o escalonamento de alcance 1/T²; a recuperação da fase enrolada é exata dentro de [−a_max,a_max] e produz aliasing de exatamente { "2" }·a_max fora dele; o alcance dinâmico não ambíguo a_max/σ_a=π/σ_Φ é idêntico para dois fatores de escala de comprimento de onda/T muito diferentes; os métodos de CaiAccelerometer coincidem com as funções livres)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (enviesamento face ao integrador AccelModel; VRW face ao integral analítico); tests/quantum_inertial_dead_reckoning_reference.rs (VRW face a uma dupla integração de Monte-Carlo independente em numpy do ruído de aceleração branco, pior desvio { "0.42" }% dentro de ±{ "3" }% ao longo de { "6" } tempos de deriva livre; enviesamento/fator de escala face a um valor de forma fechada de Groves { "2013" }; ciclos completos de holdover)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form e cw_q_equals_the_spectral_separation_closed_form: a tabela de Q, CW e banda estreita { "1" }, banda larga e varrida { "2" }, fixada às formas fechadas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efetivo face a uma nova derivação independente em numpy do orçamento de ligação de Kaplan & Hegarty §{ "9.4" }; o C/N₀ real do JammerTest desce monotonicamente através do limiar de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (pré-registado, bloqueado, não executado)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterização dos parâmetros TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fixa a constatação); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referências de forma fechada + CUSUM); examples/tpl_jammertest.rs (calibração com spoofing real do JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fixa a constatação); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondência de mapas; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (o bench de 60 min sem GPS no campo real EGM2008 de grau 70, pré-registado em xval/icgem-egm2008/: correspondência { "3106" } m, pelo que o limiar de < { "500" } m é NOT MET e afirmado como falhado, e a redução de dez vezes na deriva de { "70.6" } km é MET; mais o Monte Carlo de erro de mapa com semente); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel e tests/emag2_real_grid.rs (leitor EMAG2v3 condicionado por dados num recorte real; nenhum resultado de navegação é afirmado com ele); tests/terrain_slam_rbpf.rs (estimação conjunta do mapa, um RBPF ao estilo FastSLAM, face ao SITAN de mapa conhecido com um erro de mapa correlacionado de { "15" } m ao longo de { "20" } sementes, pré-registado em xval/terrain-slam-rbpf/: ganho médio de { "1.5" }% e melhor em { "10" } de { "20" }, pelo que os limiares de { "10" }% e de 12 em 20 são NOT MET e afirmados como falhados; sem prejuízo num mapa perfeito, MET)

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (o SBOM gerado valida sem erros face ao esquema JSON oficial CycloneDX { "1.5" } em todo o grafo distribuído de 66 componentes: funcionalidades predefinidas + python + wasm, dependências de desenvolvimento excluídas)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfeita=1/idêntica=0.5/empate={ "0.125" }, ROC monótona, fundida>{ "0.8" }, separação de camadas por classe, proteção contra fugas, corpus reprodutível, indicadores de mudança de distribuição apontam otimismo); dominance_demonstrators (alcançável + reprodutível + MODELLED-not-VALIDATED + lacuna de otimismo autoconsistente)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de referência por classe≈{ "1" }, lacuna de otimismo aprendida>{ "0" }, forma da grelha + o IC bootstrap contém a média + tendência de escala positiva, características de ID finitas, o preditor da lacuna supera o de prever a média tanto na validação cruzada leave-one-detector-out como na leave-one-class-out + determinístico); impairment_ml::tests (a regressão logística separa + determinística + perda↓, o MLP resolve o XOR que um modelo linear não resolve + com semente); eval_stats::tests (bootstrap/DeLong/Spearman/ridge face a formas fechadas)

# text
seg-e0f68f57399d = quantum_trade::tests (recuperação por ciclo completo de ADEV, não negatividade de NNLS, aviso de limite inferior presente/ausente, benefício>{ "1" }, envolvente monótona + limite alt-PNT); dominance_demonstrators (o ADEV medido é orientado por dados e não assumido pelo limite inferior, a classe assumida sinaliza limite inferior + aviso, curva malformada rejeitada, MODELLED-not-VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exato nos pontos da grelha + ciclo completo + monótono, média diária de Ap, T exosférica face às âncoras publicadas de mínimo/média/máximo solar + incremento de tempestade, densidade unitária na referência, oscilação do ciclo solar na banda observada de { "5" }–{ "10" }×, cenário reprodutível + MODELLED-not-VALIDATED + rejeição de valores fora do intervalo); dominance_demonstrators (alcançável + reprodutível + T física + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (o lançamento para leste atinge i=latitude, KSC→ISS = { "45" }° de manual, polar = N/S, i<lat inatingível, bónus equatorial de { "465" } m/s, mudança de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, contagens de oportunidades diárias, cenário reprodutível/MODELLED + trajetória dogleg); dominance_demonstrators (alcançável + reprodutível + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (g de pico independente do coeficiente balístico + banda física de g, cresce com γ mais íngreme / entrada mais rápida, velocidade do g de pico = V_e·e^(−1/2) e aquecimento de pico = V_e·e^(−1/6) mais rápido, altitude do g de pico física + mais profunda para B mais elevado, cenário reprodutível/MODELLED + geometria degenerada rejeitada); dominance_demonstrators (alcançável + reprodutível + fração V_e·e^(−1/2) + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (apenas verificação cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueado, não executado)

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
seg-257dfa053c24 = frugal::tests (custo por cobertura derivado à mão 48/96={ "0.5" }, razão de ROI { "2.667" }, ordenação de intervalos + proteções de cobertura nula)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (a mesma falha de deteção passa de Available→MI→HMI à medida que o contexto se aperta; PL conservador→Unavailable; HMI por eixo; proteções de entrada)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (o VRW físico situa-se dentro do intervalo VRW citado nos { "3" } níveis; alcance bruto de ambiguidade de franja calculado a partir de k_eff·T²; o orçamento conservador deriva mais do que o melhor; cada intervalo tem fonte e está sinalizado para confirmação; proteções de ordenação de intervalos)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatro regiões + limites inclusivos + |erro| + indisponibilidade PL>AL); tests/tib_scorer_reference.rs (contagens de classificação face a numpy independente num conjunto sintético fixo)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpo/subdelimitado/tudo indisponível/vazio); tests/tib_scorer_reference.rs (contagens + taxas + coverage_ok face a numpy até { "1e-12" })

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfis de desvio, deriva livre monótona, sinalização do conjunto não detetável, consistência de max_offset, exatamente duas classes não detetáveis)

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (PL de referência absorve; PL quebrado não absorvido-nunca detetado; veredicto de cobertura detetável; a propriedade de honestidade de que nenhum veredicto de cobertura/deteção é alcançável para um cenário não detetável)

# text
seg-6d963d838eed = hybrid_integrity::tests (a configuração resolvida é devolvida tanto para os valores predefinidos como para as substituições, sem passar o comprimento de onda por metros e de volta; cada entrada de unidades traz uma unidade e uma classe de proveniência; cada campo que o bloco de unidades nomeia é efetivamente emitido, pelo que não pode documentar um fantasma)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (a disponibilidade é igual ao produto dos dois indicadores recalculados a partir das margens do próprio relatório, e essas margens são elas próprias reconstituídas a partir do EIRP, da perda no espaço livre, da perda agregada, da figura de mérito, do termo de Boltzmann, do débito e do requisito do próprio relatório até { "1e-9" } dB; o valor é medido como { "0" } ou { "1" } enquanto a disponibilidade ótica na mesma execução é medida como estritamente entre ambos; cada linha de fator traz uma classe de proveniência do vocabulário fechado de field_schema; o alcance de fecho comunicado, executado de novo através do orçamento de ligação, devolve uma margem de { "0" } a { "1e-9" } dB e é medido como independente do alcance a que a execução estava ao longo de quatro décadas, enquanto a utilização do alcance se move exatamente pela razão de alcances; uma ligação de -40 dBW comunica disponibilidade { "0" }, LOST, e uma utilização acima de { "1" } em vez de uma fração; a nota substituída «nenhuma contrapartida de disponibilidade RF é calculada por este motor» é afirmada como removida e a substituta é afirmada como nomeando o novo campo; uma entrada RF malformada é recusada em vez de limitada)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (a razão é igual aos dois ramos emitidos divididos, até { "1e-15" } relativo, e as suas formas recíproca e em decibéis concordam; o alcance e o sigma de tempo de cada ramo relacionam-se exatamente por c; a configuração comum emitida é afirmada igual ao alcance e ao tempo de integração do próprio cenário e o alcance do ramo RF é afirmado igual ao do ramo ótico; o C/N0 do ramo RF é, bit a bit, o do bloco de disponibilidade, a partir de um único orçamento de ligação, não de uma nova derivação; a propriedade LIKE-FOR-LIKE é MEASURED em vez de afirmada -- quadruplicar o tempo de acumulação comum reduz a metade o ramo ótico até { "1e-12" } e o ramo RF até { "1e-7" } e deixa a razão inalterada até { "3.19e-9" } relativo, o que um ramo que calculasse secretamente a média sobre outra coisa não poderia fazer; uma substituição de rf_dll_bandwidth_hz que quebra o tempo de média comum torna a razão nula com um motivo que nomeia ambos os tempos, enquanto ambos os ramos continuam a ser emitidos; uma execução num só sentido torna o ramo de comparação, bit a bit, o resultado principal divulgado com um fator de penalização de exatamente { "1" }, e uma execução nos dois sentidos reproduz a penalização 0.5/sqrt(perda geométrica do percurso de retorno) recalculada a partir do geometric_loss_db do próprio relatório até { "1e-12" })

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (em três bandas, quatro décadas de alcance e ambos os veredictos de fecho, a margem e a perda no espaço livre subjacente são recalculadas apenas a partir do relatório com melhor que { "1e-9" } dB; o G/T necessário montado a partir dos termos da equação concorda com a mesma quantidade obtida como G/T menos margem, e voltar a executar com ele anula a margem; três orçamentos com EIRP, perda e limiar muito diferentes mas uma constante de ligação igual dão um requisito idêntico, enquanto { "1" } dB na constante o move exatamente { "1" } dB; a divisão do ganho está ausente a menos que seja indicada uma temperatura de ruído e uma não positiva é recusada; cada campo que o bloco de unidades nomeia é efetivamente emitido)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests e lunar_time_budget_scenario::tests (as quatro classes presentes numa só execução e numa ordem de subconjunto pedida; cada linha concorda com a sua própria forma fechada com melhor que { "1e-12" } relativo; escalar o erro de referencial por k escala o cruzamento por k para um relógio flicker-FM e por k^{ "2" } para um white-FM, verificado com k={ "2" } e k={ "3" }, o que separa as duas classes de ruído; cada linha reproduz o cruzamento de relógio único que o orçamento já tinha comunicado; cada linha recupera o único termo de referencial partilhado; um nome de relógio desconhecido é rejeitado)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests e attack_surface::tests (a grelha está completa e cada fração capturada situa-se em [{ "0,1" }]; a fração capturada é não decrescente na potência de transmissão em cada nó; NÃO é monótona na largura de feixe nem na altitude, o que é fixado por um teste próprio para que a varredura não possa vir a ser suavizada; o nó de linha de base reproduz a fração capturada existente bit a bit; a avaliação apenas no limbo é idêntica bit a bit ao último ponto da varredura completa; um cruzamento localizado situa-se no limiar até { "1e-9" } dB e é enquadrado)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (todos os { "57" } tempos de média x { "8" } termos presentes, o índice da grelha vai de { "0" }..={ "56" } e traz { "8" } linhas cada; a linha <c1/> é igual à raiz da soma dos quadrados dos sete termos ao seu lado em cada tau; a tabela segue uma grelha pedida em vez de uma codificada no código; emiti-la deixa o JSON do relatório idêntico ao byte)

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: com a correção desligada o termo de relógio é igual ao termo de relógio do orçamento ao bit para as quatro classes; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas as classes de ruído; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: o documento predefinido, a tabela e o resumo ficam inalterados e o bloco acrescenta apenas o seu próprio objeto e unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: ótico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, com as curvas PHM e RAFS a cruzarem-se entre { "7e5" } e { "8e5" } s fixadas como propriedade divulgada dos modelos de relógio de tipo de ruído único; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (o limite de campo distante coincide com delta_dor; correção de campo próximo; derivadas parciais por DF); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } testes de biblioteca: o semiângulo do limbo da Terra face à sua forma fechada asin(R/r) com uma afirmação adicional de que TODA a ligação não ocultada fica fora desse cone, para que o teste de ocultação e o ângulo do limbo não possam discordar; o predicado de ocultação verificado no lado próximo, no lado distante e no caso em que o corpo está ATRÁS do transmissor; perda de percurso limitada à banda plausível de alcance lunar em cada ligação; o conjunto seguível mostrado como um subconjunto do conjunto geometricamente visível e disjunto do ocultado; monotonia nos dois sentidos - mais ganho de receção nunca reduz a contagem, um limiar mais estrito nunca a aumenta; nenhuma ligação creditada com mais do que o ganho no eixo; um recetor dentro da Terra recusado; a varredura afirmada como efetivamente VARIÁVEL com a época; e a disponibilidade de sinal versus solução de posição afirmada como distinta, corretamente ordenada e consistente com as linhas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fixado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constatação fixada)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (limiar O1: a matriz de transição de estado encadeada ao longo de três dias e ao longo de um período é igual ao scipy DOP853 até um relativo de { "1e-6" }; limiar C1: q médio e a fração dentro de 95 %; limiar C2: amostra sobre traço formal de cada estimador; limiar C3, NOT MET e fixado: com { "3e-10" } m/s2 de aceleração não modelada o excedente dentro de 95 % é { "0.0525" }, não pelo menos { "0.5" } - a estimativa a bordo é conhecida apenas até centenas de metros, pelo que cerca de dez metros de deslocamento se escondem dentro da sua covariância); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (limiar Q1: sucesso de Monte Carlo pelo menos o limite de bootstrap menos três erros-padrão; Q2: nenhuma queda com o comprimento do arco além de três erros-padrão; Q4: LAMBDA é igual à enumeração por força bruta para { "200" } sorteios de dimensão até cinco; Q3: o projeto flutuante é igual a uma resolução independente em numpy até { "1e-9" } para as covariâncias de ambiguidade e de posição, e a taxa por bootstrap é NOT MET a { "1e-9" }, fixada: difere por um relativo de { "1.7e-6" } porque a CDF normal do LAMBDA é uma aproximação de Abramowitz e Stegun)

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (limiar F1: o traço do CRLB não sobe e o menor valor próprio não desce com ligações do orbitador, no exemplo e em { "20" } conjuntos aleatórios com semente; limiar F2: as derivadas parciais de alcance são iguais a uma diferença finita independente em numpy longdouble do modelo direto de Rodrigues em { "50" } geometrias; limiar F3: o menor valor próprio sobe pelo menos 2.0x, encontrado cerca de 111x)

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (limiar T1: os sigmas de translação não descem à medida que a ligação local se afrouxa; T2: com os sigmas das técnicas escalados por { "1e-6" } o sigma de translação de cada par está dentro de { "1" } % de sqrt({ "2" }) vezes o sigma da ligação local, encontrado dentro de { "3e-7" }; T3: a matriz de informação é igual a uma montagem empilhada independente em numpy até { "1e-9" }). A primeira execução de T2 com inversão das equações normais falhou ({ "1.3" } % com uma ligação de { "0.1" } m, valores abaixo do piso a { "1" } m); a causa foi numérica e a covariância passou para a via da raiz quadrada antes de o limiar ser reavaliado.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (limiar G1: as derivadas parciais analíticas são iguais a uma diferença finita central de cada modelo direto até { "1e-8" }; G2: a informação 5x5 é igual a uma montagem independente em numpy até { "1e-6" }; G4: a amplitude da maré de relógio e as suas sensibilidades a k2 e h2 são iguais a uma avaliação independente até { "1e-9" }; limiar G3 NOT MET na sua metade do traço, fixado: acrescentar uma família nunca baixa o menor valor próprio ({ "28" } de { "28" }) mas o traço da pseudoinversa subiu em { "12" } de { "28" } acréscimos porque a família acrescentada elevou o posto)

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidade do horizonte face à forma fechada L01; o DOP aumentado por balizas face ao simples; a raiz da soma dos quadrados do orçamento de erro; a relação DOP-para-metros); tests/validate_p2_beacon_before_after_table.rs (toda a tabela antes/depois fixada a um golden consolidado até { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (a mesma geometria através de um caminho DOP INDEPENDENTE, pelo que a aumentação não é verificada face ao núcleo que a produziu); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal limita o erro de posição horizontal a k-sigma contribuído pela classe cega de modo comum, formando blind_position_covariance = S<em>Cov</em>S^T e projetando-a em ENU; integrity_envelope comunica hpl_total = hpl_araim + cmpl. A distinção que o par existe para fazer: o teste de RESÍDUO RAIM/ARAIM é demonstravelmente cego a erros em range(G), mas o NÍVEL DE PROTEÇÃO ARAIM não é - o seu termo sem falhas já os limita até um URA do fornecedor mais o enviesamento nominal. O CMPL é, portanto, apenas o EXCESSO entre fornecedores que o URA/ISM por fornecedor de um único fornecedor não sobrelimita, e a soma é um limite conservador pela desigualdade triangular e não uma RSS, válido apenas quando esse excesso ainda não está dentro do URA.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (com deficiência de posto sem linhas de base com a Terra; três linhas de base restauram o posto completo — o limiar de 3 estações a partir do posto da informação, não do erro de solução; CRLB das estações atingido pelo estimador com eficiência { "0.98" }; o CRLB aperta-se monotonicamente com as linhas de base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registos de comprimento máximo, equilíbrio de Legendre, ciclo completo do atraso G2, composição de níveis); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sem a cache LSIS: quatro números citados fixam a constatação; com ela: { "2 937 232" } chips e bits face aos ficheiros do Anexo { "3" } do LSIS, primeiros/últimos { "24" } chips impressos, Tabelas de Legendre D-1 e E-1 e inicializações de G2 dão exatamente um item diferente, a célula «últimos { "24" } chips» do PRN { "147" } da Tabela E-5, que duplica a do PRN { "151" } enquanto o ficheiro do Anexo { "3" } concorda com o gerador); o teste estrito pré-registado afs_codes_match_lsis_v1_tables_and_annex3_bit_exact é ignorado com essa lacuna

# text
seg-8cd700abad59 = lunar_afs::waveform (gravação e etiquetas de referência), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (terceiro pré-registo: { "2" } nós, { "4" } canais seguidos, pior erro de Doppler { "0.57" } Hz, pior erro de desvio de código { "0.008" } chip, todas as { "6" } tramas descodificadas com o TOI correto através da passagem { "99" } -> { "0" } e com a subtrama { "2" } coincidente; G0 não satisfeita tal como escrita, a variação do próprio recetor entre execuções nos seus registos de aquisição); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segunda: { "5" } violações); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primeira: nula); os testes estritos dos três ficheiros são ignorados com as suas lacunas

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
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } blocos face ao intervalo binomial a { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razão { "0.0131" } face a { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } face a { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estrito, ignorado com a lacuna); testes de iq::campaign::detect; testes de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (os resumos fixados ficam inalterados sem a tabela)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } em eventos declarados que não atenuam nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estrito, ignorado com a lacuna); testes de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura PI90 { "0.891" } em { "558" } intervalos, { "0.900" } em { "10" } eventos de tempo até à perda sob cada modelo de bloqueio), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash e veredictos de [validation], auditoria do bloco de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db e bar_b_prime_ci_subset (estritos, ignorados com a lacuna); bar_b_prime_full_set_of_50_campaigns (ignorado, executado antes da publicação); testes de iq::labfit::cn0 (degenerescência exata Q-delta, recuperação de delta ao Q declarado, inverso de limiar de forma fechada); testes de iq::labfit::iqfit (as condições do modelo de bloqueio reproduzem exatamente o modelo de C/N0); tests/iq_labfit_followup.rs (o seguimento registado em 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign a afirmar o NOT MET registado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, em release)

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constatação fixada); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estrito, ignorado com a lacuna)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites do ficheiro de difusão do IGS de { "2" } de março de { "2025" }: { "960" } de { "960" } palavras passam a paridade do RTKLIB, { "96" } de { "96" } subtramas descodificam, { "608" } de { "608" } inteiros difundidos descodificados são iguais aos do Kshana, cada entrada dentro de meio quantum, semana e tempos exatos); gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constatação fixada, condicionada por dados); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estrito, ignorado com a lacuna); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constatação fixada, condicionada por dados); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estrito, ignorado com a lacuna)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constatação fixada, condicionada por dados); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constatação fixada, condicionada por dados); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estrito, ignorado com a lacuna)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (o modo comum do relógio cancela-se exatamente; o resíduo cresce com a linha de base; reutiliza o PL SBAS; a contagem de satélites é respeitada até ao limite de { "24" } do construtor, pelo que uma constelação maior não pode devolver silenciosamente uma menor); tests/lunar_differential_pnt_reference.rs (resíduo de diferença simples + solução de posição WLS face a lsq() do RTKLIB compilado a partir do código-fonte em C)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (o OEM transporta REF_FRAME/TIME_SYSTEM lunares; os metadados de tempo fazem ciclo completo; envelope KIF); tests/lunar_interoperability_export_reference.rs (o OEM lunar emitido pelo kshana relido pela biblioteca Python independente <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época até à precisão do formato; uma exportação corrompida é rejeitada); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonia, limites do compósito, teto de nível, proveniência modelada); resilience::diversity::tests (Simpson inversa, modo comum, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemplo à mão de tau de Kendall, simplex de Dirichlet, taxa de inversões); resilience::study::tests (controlo de estabilidade, testemunho de instabilidade, declarado-versus-medido, colapso da diversidade)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, campos JSON)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridade do benefício maior/menor-é-melhor, envolve fielmente um TradeResult real, evidência desonesta rejeitada, FoM validada precisa de âncora externa, JSON determinístico)

# text
seg-fe77856b9e9d = quantum_devices::tests (cartões de relógio honestos+ordenados; precisão do entrelaçamento ~1/sqrt(tau); taxa detetada -10x/10dB; contagens no escuro degradam; limites do piso sistemático; cartão modelado+válido)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (a precisão melhora com a integração; o quântico pode ganhar E perder; PL finito-positivo; FoM de segurança em [{ "0,1" }] e cresce com o atraso do ataque; Pd de anomalia monótona; a comparação is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (o quântico supera o clássico numa falha longa; a vantagem depende da duração da falha; a comparação is_honest); tests/gnss_free_quantum_navigation_reference.rs (crescimento da posição por navegação estimada face a uma dupla integração independente em Octave + a âncora de ruído publicada de Freier-2016)

# text
seg-8e49ee940482 = quantum_faults::tests (valores conhecidos da AUC analítica; a AUC bootstrap empírica contém a forma fechada; o quântico deteta falhas menores / AUC mais elevada; a vantagem desaparece para falhas enormes; catálogo de 5 classes; a comparação is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sem ruído direto→inverso até { "1e-6" } m; J·CRLB=I com uma covariância PD simétrica; o traço da variância de posição do CRLB não aumenta quando se acrescenta um recetor; TDOA+FDOA conjunto recupera a posição+velocidade de um emissor em movimento; <{ "4" } recetores rejeitados); tests/geolocation_reference.rs (ciclos completos em quatro geometrias com uma rede diversificada em 3-D; o estimador de Gauss–Newton atinge o seu limite de Cramér–Rao — a covariância do erro empírico acompanha o limite analítico ao longo de { "4000" } ensaios de Monte-Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound e finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fixados)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (regista { "746" } W/cm2 para a Stardust sem limiar)

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
seg-998c0585be86 = twstft_budget::tests (a equação bidirecional recupera exatamente o desvio; o termo de Sagnac é igual à forma fechada de ciclo do BIPM; o termo ionosférico segue a divisão de frequências e a troposfera cancela-se; a fase flicker tem um TDEV plano; um resíduo diurno eleva o TDEV perto de meio dia; um enviesamento de reciprocidade desloca o desvio e não o TDEV; a estabilidade da série remove uma taxa); time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (limiares pré-registados A1-A3 face à referência independente mpmath: { "216" } pontos da grelha de Rytov pior erro relativo { "3.4e-7" } face a um limiar de { "1e-6" }, cintilação pior { "4.5e-16" }, fator de abertura pior { "5.7e-16" }, { "96" } probabilidades de desvanecimento gama-gama pior { "1.3e-12" } em log10, profundidade ótica de nuvem e de céu limpo pior { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (limiar A5: o orçamento de ligação de perda agregada e as saídas existentes de disponibilidade de local são idênticos ao bit ao commit base em { "1,000" } conjuntos de parâmetros)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (limiar A4: rho = { "0" } é igual à união independente e rho = { "1" } ao melhor local isolado até { "1e-12" }, e zero violações de monotonia no número de locais e na correlação; a primeira execução deste limiar falhou por { "3e-9" } porque a CDF normal em uso era a forma de Abramowitz-Stegun de { "1.5e-7" }, um defeito de implementação substituído pela CDF da gama incompleta com o limiar inalterado); optical_weather::tests e optical_sitediv::tests (margem monótona, o teto de nuvens como forma fechada, as identidades de duração de indisponibilidade, inversão da pesquisa de margem)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (limiar A6: o erro de temporização por indisponibilidade é igual a holdover::coast_phase_sigma e o erro de alcance é igual a phase_to_range_m bit a bit em { "9" } relógios, { "3" } durações médias, { "3" } dispersões e { "4" } quantis); optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (limiares T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixados antes da primeira execução: a mesma semente dá os mesmos bytes e outra semente dá outros bytes; nenhuma chave sem a tabela; ao longo de { "8760" } h a { "600" } s, sementes { "37" } e { "38" }, a disponibilidade realizada de cada um dos três locais predefinidos dentro de { "6" } pontos da declarada (pior { "3.3" }) e a fração de nuvens realizada dentro de { "5" } pontos da probabilidade declarada (pior { "2.1" }); a margem é igual ao orçamento menos os dois desvanecimentos e «up» é igual a margem não negativa em cada passo; nenhuma chamada matemática não portável no módulo; execuções demasiado longas e passos inválidos recusados)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK tipo { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (um ODF real da MRO, 2007-304/305, face à sua etiqueta PDS: a contagem de registos, as posições dos grupos, as estações, as horas de início e de fim e os tipos de dados verificam-se; a contagem de linhas da tabela de fim de ficheiro falha por uma, uma inconsistência da etiqueta, fixada como constatação); odf::tests (ciclo completo de registo construído à mão, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (condicionado por dados, entradas fixadas por SHA-256, CI mensal com dados reais obrigatório: Doppler previsto a partir da reconstrução de navegação da MRO mro_psp5 nas passagens avaliadas DSS { "63" } e DSS { "14" }, { "12.5" } mHz RMS, limiar { "30" } mHz, atingido; a determinação de órbita registada não produziu órbita, fixada como constatação; execução { "2" } com um estimador amortecido, registada em separado: órbita { "0.36" } km RMS e { "0.53" } km no máximo face a mro_psp5, atingido, Doppler após o ajuste { "48.6" } mHz contra { "30" } mHz, não atingido, fixado como constatação; leitor SPK tipo { "1" } face ao CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } sementes, NEES médio de seis graus de liberdade na segunda metade dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (uma janela que termina exatamente quando a seguinte começa não disputa, e movê-la um segundo para trás custa exatamente um segundo — a proteção contra erro de uma unidade; janelas sobrepostas além do número de aberturas põem a sessão de classificação inferior em indisponibilidade, com o intervalo de disputa fixado; a política de arbitragem decide qual serviço detém a abertura, com os números das três políticas fixados num só plano; o primeiro a chegar é o primeiro a ser servido não faz preempção de uma sessão que já detém uma abertura; uma sessão que perde a arbitragem no seu início adquire uma abertura quando uma fica livre; os três ciclos de trabalho contabilizam cada segundo de abertura disponível em { "3" } políticas × { "4" } números de aberturas; acrescentar uma abertura nunca aumenta a indisponibilidade de nenhuma sessão, medido em { "200" } planos pseudoaleatórios × { "3" } políticas × cada número de aberturas; aberturas suficientes para cada sessão não deixam qualquer indisponibilidade; o horizonte de relatório corta o plano e define o denominador do ciclo de trabalho; uma lista de passagens previstas torna-se um plano de contactos sem um segundo tipo de janela; os números de ciclo de trabalho do plano incluído são saídas do motor para uma e duas aberturas; o relatório declara a política que produziu os números; cada valor comunicado traz uma unidade e uma classe de proveniência; o cenário é reprodutível e declara-se MODELLED; o cenário rejeita um plano que não consegue escalonar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } testes de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } testes de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (a curva de potência de deteção vai da taxa de falso alarme com falha nula até { "1" } − P_md no viés mínimo detetável; o viés mínimo detetável devolvido através de noncentral_chi2_cdf ao limiar que o próprio monitor aplicou devolve P_md até { "1e-9" }, em todos os eixos e através do auxiliar público; um viés efetivamente injetado na estimativa de RF desloca a própria estatística do monitor exatamente de b²/(σ_rf² + σ_opt²) calculado à mão; um viés sem ruído é detetado acima de √(T/λ*)×MDB e falhado abaixo, com a escada injetada a enquadrar esse cruzamento; a potência de deteção é monótona na magnitude da falha e idêntica nos quatro eixos em múltiplos de MDB; um Monte-Carlo com semente de 200,000 amostras da estatística do monitor reproduz a potência analítica dentro de 4σ em quatro pontos da curva; o MDB de temporização é fixado acima do limite de alerta de temporização, o que é uma fraqueza medida e não uma funcionalidade; o quantil de Wilson-Hilferty é medido como discordante do limiar exato do monitor em ~{ "4" }%, registando por que não foi usado; o valor da rampa é exatamente MDB/taxa e escala inversamente com a taxa, e uma taxa não positiva comunica nulo em vez de zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (a deriva livre começa exatamente do traço de covariância que o bloco de transferência comunica, nos dois sentidos, para que a diagonal reproduzida não possa divergir da transferência comunicada; o tempo de cruzamento comunicado é recalculado a partir do sigma de transferência, do PSD de ruído de processo e do fator de cobertura do próprio relatório, e o limite está dentro do limite de alerta imediatamente antes e fora imediatamente depois; o tempo de deriva livre escala exatamente de forma inversa com o PSD de ruído de processo e encurta-se quando o limite de alerta se aperta; uma deriva livre com PSD zero comunica nulo em vez de um tempo zero, porque nunca não é imediatamente; o perfil emitido cruza exatamente uma vez e enquadra o cruzamento comunicado; o tempo de duplicação da variância e o tempo de cruzamento do limite de alerta são fixados separados, sendo oito ordens de grandeza diferentes após a fase ótica apertada e dentro de uma ordem de grandeza após a fase RF laxa; abandonar a modalidade ótica dá mais tempo de deriva livre do que abandonar a RF, exatamente pela diferença de covariância dividida pela taxa de crescimento horizontal; e random_walk_time_to_limit separa já-fora, cruza-em-t e nunca-cruza)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests e lunar_service::tests (o cruzamento de meia potência localizado por bissecção no padrão coincide com o x = { "1.61634" } de Airy publicado e dá a largura exata de { "1.02899" }·λ/D, registando que o coeficiente convencional { "1.02" } se situa a −{ "2.955" } dB e não a −{ "3.010" } dB; o padrão é estritamente decrescente ao longo de { "400" } pontos desde o eixo até ao primeiro nulo; a álgebra da eficiência implícita faz ciclo completo até { "1e-12" } e reproduz { "0.641" } / { "0.920" }; o ângulo fora do eixo coincide com tan θ = R·sin γ/(r − R·cos γ) em { "20" } pontos e ambos os limites até { "1e-12" }; o cone aproximado contém o feixe real linha a linha; as contagens principais são iguais aos indicadores por linha que resumem e a correção é igual à sua diferença; cada veredicto de linha é recalculável apenas a partir do relatório emitido; cada campo numérico e booleano emitido tem uma unidade e uma classe de proveniência; uma abertura impossível não emite bloco; sem antena configurada a exportação mantém exatamente as suas seis chaves preexistentes, { "0" } folhas alteradas e { "0" } removidas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter do discriminador de Costas em malha aberta face a sdr::correlate avançado sobre IF sintética com semente, { "3" } realizações de ruído agregadas × { "900" } épocas, concordando a { "0.63" }% em 35-45 dB-Hz, com o termo de perda por elevação ao quadrado exigido a ajustar pelo menos { "3" }× melhor do que a forma sem perda por elevação ao quadrado onde quer que seja resolúvel; a saturação do discriminador atan a ~{ "32" } dB-Hz afirmada e não apenas declarada, para que o limite de validade seja fixado; σ em malha fechada face a uma malha de Costas sdr avançada ao longo de { "4000" } épocas até { "3.7" }%; atraso de rampa do DLL de primeira ordem face a um DLL sdr avançado até { "0.17" }%; bessel_i0 face a I₀ tabelado até { "7.4e-8" }; a largura de histerese exigida a cair em [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] em { "4" } razões × { "2" } tempos de integração × { "3" } larguras de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } testes de biblioteca: cada grafia de datum faz ciclo completo por parse/as_str e uma desconhecida é recusada; manter fixas todas as estações sem a baliza é recusado com um erro que nomeia <c1/>; o braço de alavanca é afirmado IGUAL a ρ/B e a equipartição da baliza IGUAL à equipartição da estação vezes ele, ambos até { "1e-15" }, com uma afirmação adicional de que o braço de alavanca excede { "10" } para que os dois orçamentos não sejam confundíveis nesta geometria; a linha de base publicada do ficheiro de teste é fixada em { "10726.748" } km e o seu horário de 49 amostras afirmado como dando estritamente menos de { "49" } observações de visibilidade mútua; o espectro da baliza numa única linha de base é medido como abrangendo pelo menos cinco décadas e a razão resultante afirmada acima de { "1" } pela AM-HM e acima de { "100" } de facto; a disposição estação-mais-baliza é afirmada com deficiência de posto com AMBOS os campos calculados nulos enquanto o termo de comparação modelado continua a comunicar. Mais uma proteção sobre o próprio ficheiro de teste: uma chave de nível superior inserida depois de uma matriz de tabelas passa a ser dados da estação, pelo que o ponto de inserção é afirmado e o cenário analisado verificado como contendo a chave — o modo de falha é uma execução que usa silenciosamente uma configuração diferente da que o teste nomeia)

# text
seg-08708f044bb5 = lunar_dpnt::tests (uma proteção puramente aditiva cujo delta de conjunto de chaves é exatamente { "{" }correction_link, units{ "}" } com cada valor preexistente idêntico ao bit a literais capturados antes da alteração; o erro de levantamento NÃO se descorrelaciona com a linha de base enquanto o termo de órbita o faz, e sobrevive a uma linha de base zero onde o termo de órbita é exatamente zero — a verificação estrutural que deteta o termo ligado no sítio errado; um erro de estação de { "1" } m transfere-se { "1" }:{ "1" } e prova-se não ser amplificado pelo DOP; latência zero reproduz o resíduo não envelhecido bit a bit e o resíduo é monótono na latência, com a curva emitida igual a execuções diretas; o passo de quantização reduz-se exatamente a metade por bit e σ² = passo²/12, e o fundo de escala acompanha as magnitudes injetadas; cada termo desligado por sua vez recupera os outros dois em quadratura; σ igual por satélite propaga-se exatamente para σ·PDOP e esse PDOP concorda com orbit::dop; cada campo emitido traz uma unidade e uma classe de proveniência, verificado nos dois sentidos)

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: até { "1e-12" } m com e sem ruído do recetor; zero_baseline_floor_is_zero_in_every_trial: { "0" } até { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro da banda de { "5" } % declarada antes da execução; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (o recálculo numpy pré-registado, registado com a sua falha); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs e os golden de registo e multiplataforma inalterados (aditividade); tests/field_units_global.rs (cada campo emitido descrito, sem isenção)

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: o avanço do raio reproduz -acos(R / (R + a)) até { "1e-3" } graus em cada azimute; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: o mesmo cone amostrado num mosaico de latitude/longitude de { "0.005" } graus concorda com o cone analítico até { "0.25" } graus; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: uma cratera de fundo plano sobre a esfera, observador no centro e a { "4" } km e { "7" } km dele, face à elevação de bordo de forma fechada atan2((R + H) cos s - (R + a), (R + H) sin s) com s da equação esférica de cruzamento do bordo, até { "0.01" } graus em cada azimute; rasterised_cone_matches_the_analytic_cone: um cone rasterizado numa grelha estereográfica polar de { "200" } m e lido através do amostrador da grelha concorda com o cone analítico até { "0.25" } graus; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos os tipos de cenário; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 mantém a sua contagem plana e as épocas que um horizonte custa são terrain_masked (a própria disponibilidade pode subir, porque um horizonte pode esconder um satélite que a estação não vê), e um horizonte de { "89" } graus na estação não deixa nada disponível; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: fundos das crateras Shackleton e Haworth baixos, o maciço Malapert alto, a imagem em espelho não; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: um mosaico reamostrado do recorte incluído dá à estação o horizonte do recorte até { "0.22" } graus (limite { "0.5" } graus, fixado antes da execução), com o eco do mosaico e as unidades, e dem_path com dem_tile_path recusado; the_export_site_is_masked_by_the_terrain: cada linha exportada passa o terreno exatamente quando é visível e está à altura do horizonte do local ou acima dele no seu azimute, a geometria não se move, o CSV ganha a coluna apenas com terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs e os golden de registo e multiplataforma inalterados (aditividade)

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma amostral sqrt({ "2" }) a dentro de { "6" } %; station_multipath_is_gauss_markov: correlação de desfasamento 1 exp(-dt / tau) dentro de { "0.01" }, variância unitária dentro de { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs e os golden inalterados (aditividade)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: o erro de ligação com crescimento ligado menos o erro com crescimento desligado tem sigma amostral taxa tau / sqrt({ "3" }) dentro de { "6" } % em { "1600" } extrações; linear_growth_is_the_first_order_propagated_error: um erro de velocidade dv propagado com o integrador de dois corpos da própria árvore a partir da órbita do cenário desloca a posição de dv tau até { "1" } % a { "60" } s e { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorado, o adendo registado)

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: é igual a lunar_dpnt::position_error_vector_from_range_errors até { "1e-8" } m, uma linha de altura frouxa não altera nada, uma apertada fixa o erro de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: cada valor até { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorado, o adendo registado)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (os valores registados face aos limiares registados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorado, cerca de { "7" } s em release: volta a executar os seis casos registados e afirma os valores registados)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, o risco não monitorizado dentro de P_THRES, um subconjunto que remove três ou mais satélites monitorizado, e mais de dez priores monitorizados rederivados de forma independente como P_no fault q^k até { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: sem alarme sem falhas, e um viés de { "30" } m em dois satélites detetado com o par como o subconjunto de maior separação normalizada); tests/araim_reference_vectors.rs e tests/integrity_araim_stanford_oracle.rs inalterados (o caminho de ordem 2 é o verificado pelo MAAST)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: valores de holdover inalterados, { "111" } épocas negadas indisponíveis sem nível de proteção, recusado com execuções > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: o HPL e o VPL de cada época amostrada são exatamente iguais a um snapshot_raim de resíduo zero no mesmo céu predefinido, e a execução sem falhas não emite alarme; a_stated_bias_is_detected_while_it_lasts: um viés de { "60" } m emite alarme exatamente nas { "10" } épocas que cobre; every_integrity_field_has_a_unit); clock_integrity::tests; os golden de relógio inalterados

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests e observability_gramian::tests (o documento predefinido fixado bit a bit por FNV-1a do seu JSON, resumo e SVG, com valores predefinidos explícitos afirmados como operação nula e as oito chaves de extensão afirmadas AUSENTES para que a captura não possa ser regenerada numa autocomparação; o bloco aditivo <c1/> excluído do congelamento por ser retirado e voltar a ser calculado o hash face à constante fixada antes de existir, o que prova em vez de assumir que nada do que foi divulgado se moveu; invariância do posto sob um sigma homocedástico afirmada em σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado escalar exatamente de forma linear com σ até { "1e-6" } relativo; o espaço nulo da DRO afirmado como sendo exatamente os eixos de coordenadas z e ż com as duas causas separadas — uma linha de alcance entre veículos espaciais coplanares tem û_z = { "0" }, e o bloco fora do plano do CR3BP desacopla-se exatamente em z = { "0" }; jacobianas espaciais face a diferenças finitas centrais e face à observável independente 3-D de taxa de alcance da crate; famílias fora do plano recusadas em modo planar)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests e tests/operational_eop_predictor_reference.rs (recuperação de coeficientes de sinal analítico até { "1e-9" } com uma janela de 365 dias; um ajuste de viés mais taxa igual ao declive e à ordenada na origem de mínimos quadrados ordinários de forma fechada até { "1e-12" } em linhas reais; DOIS detetores de antecipação que destroem as colunas rápidas de UT1 e de polo de cada linha posterior à época de emissão — deixando intactos os finais do Bulletin B — e exigem saída idêntica ao bit, verificados por mutação a pôr { "10" } testes a vermelho quando a barreira do ajuste é afrouxada em exatamente um dia; uma lista de épocas reconstruída de forma independente; o bloco do Bulletin B de um alvo em branco e a época mostrada a sair da tabela; admissão de termos verificada com janelas de { "6" }, { "15" }, { "150" } e 365 dias; contagens de linhas monótonas; e uma captura prévia congelada do relatório predefinido afirmada campo a campo sem tolerância, que afirma adicionalmente que a captura não contém as chaves novas para que não possa ser regenerada silenciosamente numa autocomparação); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (a extensão opcional EopSeries::with_ls_ar_prediction além da última linha: respostas dentro da tabela idênticas ao bit, linhas de previsão iguais a ls_ar_predict, argumentos de referencial além da tabela seguem a previsão em vez de truncar; consistência interna)

# text
seg-c77bd56a0619 = lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } testes de biblioteca: o projeto de Helmert face a uma diferença finita central de lunar_frame_realise::apply_helmert — o módulo PARA que o datum serve, que não calcula nenhuma derivada e por isso fixa a convenção de sinal [p]ₓ — todas as { "84" } entradas do projeto concordam a < { "1e-6" }; uma translação pura da rede relida como translação pura com < { "1e-6" } de fuga para os outros seis parâmetros; o sigma de datum exatamente linear no sigma de atraso até { "1e-8" } numa variação de { "3" }× em todos os sete parâmetros; um arco de { "16" } h medido pior e um arco de { "48" } h medido melhor do que { "24" } h, com a varredura de libração emitida ordenada da mesma maneira; o pior eixo de translação afirmado como SENDO o eixo dominante da direção fixa ao corpo para a Terra medida em separado e pior do que os outros em > { "5" }×, uma referência independente de física de que nada no resolvedor foi informado; três balizas colineares a produzir um defeito com cada sigma de datum NULO e as direções nulas emitidas na base de sete parâmetros; offblock_fraction e a correlação entre balizas exatamente { "0.0" } com as estações fixas e ambas > { "0" } com elas estimadas; os valores de transformação injetada do bloco de comparação mostrados iguais a uma execução independente desse cenário até { "1e-14" } relativo em vez de transcritos; uma proteção de que nenhum datum injetado/recuperado aparece em lado nenhum do documento; a emissão de realização do referencial lunar fixada byte a byte por FNV-1a-64 sobre json‖summary‖svg para três formas de entrada, registada por impressão digital antes de o trabalho começar); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (condicionado; o estrito lunar_frame_campaign_matches_spice_geometry_and_numpy continua ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (constatação; decisão do fundador 2026-10-02, opção A: esta linha continua MODELLED e não toma de empréstimo o estatuto da linha separada; face a uma referência independente mpmath de 50 dígitos, pré-registada 804662d5, os sigmas de datum do motor com estações estimadas estão dentro do seu limite de erro retrógrado a priori, a { "9.7e-6" } em 2024-01-01, e o limiar de { "1e-9" } estava abaixo do que qualquer via de precisão dupla atinge, sendo a melhor, uma projeção QR em NumPy, { "5.5e-9" } a mais; a evidência sustenta a linha separada «Covariância de datum do referencial lunar com as estações estimadas, face a precisão estendida de 50 dígitos»); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fixado); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fixado)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests e tests/cislunar_arc_recovery_reference.rs (ambas as fronteiras e os respetivos rácios fixados na grelha publicada; a curva do erro medido comparada com a covariância formal linha a linha, com um limite de fator dois por linha e um limite de média geométrica; um CONTROLO NEGATIVO — o DRO planar de seis estados — que afirma que o critério PODE falhar e que o estimador não regularizado diverge para além de { "1e6" } km em vez de devolver um erro pequeno plausível; invariância de parametrização afirmada em cada prefixo até { "1e-3" } em termos relativos; uma salvaguarda sobre o texto-fonte que remove os comentários, os literais de cadeia e o módulo de testes e depois falha perante qualquer menção da jacobiana, da STM, do posto SVD ou da maquinaria SRIF, verificada por mutação através da injeção de uma chamada proibida; uma verificação apenas de teste de que as diferenças finitas são iguais às linhas analíticas, de modo que a linearização é sabidamente boa enquanto a via analítica continua ausente do estimador; determinismo afirmado byte a byte; o documento publicado de observabilidade cisluar fixado por conjunto de chaves, impressão digital canónica e linha de resumo)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análise de formato e de referencial; interpolação de Lagrange exata nos nós e numa trajetória linear fora dos nós; os elementos ICRF recebem a redução IAU { "2015" } e são iguais byte a byte a uma aplicação explícita de icrf_to_iau_moon; ida e volta anomalia verdadeira↔média face a uma resolução de Kepler direta; ficheiros malformados recusados com o motivo indicado). lunar_service::tests (com <c1/> não definido, o conjunto de chaves do relatório e o SHA-256 ficam fixados; a linha kepleriana é igual à execução kepleriana autónoma campo a campo; a identidade σ_required · HPL_max / σ_URE = AL, depois uma repetição DE PONTA A PONTA no requisito calculado que atinge { "100" } % de disponibilidade do nível de proteção e uma repetição { "1" } % acima dele que não a atinge; cada campo numérico emitido dos dois novos blocos percorrido a partir do JSON produzido quanto a uma unidade e a uma classe de proveniência; os ficheiros de teste versionados confrontados com as respetivas tabelas de origem satélite a satélite; um horizonte para além do fim de uma tabela recusado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (todos os { "61" } tipos de cenário registados são executados, uma forma de documento cada: cada folha numérica tem de resolver para uma entrada no bloco de unidades desse mesmo documento; uma entrada malformada conta como em falta para TODOS os tipos de cenário, isentos ou não, pelo que um marcador de posição não compra cobertura; a lista de isenções não pode exceder o seu teto fixado, um tipo de cenário da lista que se revele totalmente coberto FAZ FALHAR a barreira, para que a lista não possa ser inflacionada, e um tipo de cenário registado ausente da tabela do executor faz falhar, para que um novo pacote não possa entrar sem ser examinado — o que aconteceu, apanhando ambos os tipos de cenário acrescentados depois de este trabalho ter começado; um mecanismo de sentido único sobre o acumulado de descrito-mas-indefinido; e uma verificação de obsolescência do documento de esquema versionado); field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for e solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: listas vazias e o exemplo de linha de base dão o relatório e o resumo por omissão byte a byte; an_added_site_never_increases_any_variance: o menor valor próprio de H_after - H_before é não negativo até { "1e-9" } do maior, todos os rácios sigma depois/antes são no máximo um e ambos os locais acrescentados são observados; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml e scenarios/lunar-station-geodesy-with-station.toml (o mesmo calendário arquivado e o mesmo bloco de campanha VLBI)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testes: ambas as salvaguardas sobre toda a árvore de código-fonte, mais ficheiros de teste de mutação que avaliam cada salvaguarda nos dois sentidos — o padrão F22 comunicado nos dois caminhos em colisão, a correção de sequência atómica entregue aceite, uma correção parcial comunicada exatamente no caminho que perdeu o seu componente único, um identificador de ficheiro temporário e um diretório único herdado aceites, um relógio de parede rejeitado; uma fixação não declarada comunicada, uma declarada aceite, um âmbito sem exclusão rejeitado, uma declaração no comentário de documentação do teste envolvente aceite e demonstrado que não passa para o teste seguinte; e cada grafia de fixação — hexadecimal, decimal, cadeia de digest, comprimento em bytes, contagem de bytes nomeada, ficheiro de referência — detetada, enquanto constantes de algoritmos, sementes de RNG e pequenas verificações de cardinalidade não o são)

# text
seg-416def055790 = integrity::composed_pl::tests (monótono, piso P0, K(IR/2), expoentes, semicontinuidade inferior)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergência, limiar, dominância do aperto por IR)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionado por dados: é ignorado com uma mensagem quando a série BIPM está ausente); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 ronda { "3" }, prospetivo, ainda não executado: a Circular T { "465" } apareceu em 2026-10-12 e a regra pré-registada de 1000 valores precisa de edições até cerca de { "468" })

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
seg-12c2f3ad1982 = lunar_datum::tests (derivadas parciais analíticas de LLR/VLBI/orbitador versus diferença finita); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - a seleção vazia dá a matriz nula, uma seleção única é a identidade, um par é igual a uma soma elemento a elemento escrita de forma independente, e o resultado é invariante face à ordem de seleção; adding_a_block_never_reduces_the_degeneracy_metric - monotonia sob informação acrescentada; radial_diversity_beats_transverse_for_breaking_the_degeneracy - o bloco do orbitador do lado oculto eleva a métrica de degenerescência mais do que o bloco VLBI transversal)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonia no orçamento; redução do orçamento RSS sob um CRLB por fornecedor; tolerância de rotação calculada ao braço de alavanca lunar; termo vinculativo = rotação)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris anula o orçamento; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } nas divisões reais; ordenação das convenções)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloco não nulo mas de posto deficiente ⇒ block_spark { "1" }, f_detect { "0" }; colunas independentes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (um par que possui todas as medições de um nó = um erro de desvio de relógio ∈ range(G), indetetável, com um claro intervalo espectral de Gram), byzantine_redundant_net_identifies_at_least_one (seis pares independentes de medição única ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (os casos manuais P⊥ = I fixam f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (rede autorreferencial: a taxa comum situa-se em N(GᵀWG), temporal_gauge_dim { "2" }; depois de uma linha de ligação de taxa externa: taxa expulsa do calibre, temporal_gauge_dim { "1" } com o desvio comum a subsistir)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (enviesamento comum indetetável, diferencial detetável), slope_infinity_in_range_finite_detectable (g7: declive ∞ para b ∈ range(G), finito para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, o calibre de 8 dimensões é todo o espaço nulo com um intervalo espectral >{ "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremidades abertas e fechadas, a lacuna τ = { "400" } s da Tabela 7-3 da G.8271.1, continuidade em cada ponto de quebra que as tabelas implicam; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de cenário clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (registos escritos à mão por formato: cabeçalhos, separadores, unidades, integração de frequência, canais e modos TICC, lacunas e políticas, recusas); tests/clock_log_allantools.rs (a comparação pré-registada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) nos ficheiros de teste em tests/fixtures/clock_log/linuxptp_chrony/

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
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relógios de satélites GPS Block IIF, { "14" } dias de relógios finais IGS: { "8" } dentro do limiar de { "1.5" }, G25 e G30 otimistas até cerca de 2x, fixado); tests/slot_timing_ocxo_holdout.rs (um OCXO medido: previsão reservada nunca otimista, { "0.59" } a { "0.70" } da quebra medida; na amostra dentro de { "0.98" } a { "1.17" }; sem o termo de frequência de fixação, a previsão na amostra é otimista em todos os limiares); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — cada classe face a holdover::holdover_seconds até { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exatamente tpl::timing_protection_level_ns quando o relógio não tem termo de flicker, de fase branca nem de passeio aleatório; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db e C/N0 efetivo igual a jamming::effective_cn0_dbhz com Q = 1/(R_c kappa) até { "1e-9" } dB, e a âncora de { "32.105" } dB do teste do próprio tipo de cenário jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fixado em { "2.04" } e { "5.16" } vezes o erro nominal de longitude, abaixo de seis vezes; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } arcsec e { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: pior { "3.7e-3" } da velocidade); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: pior erro angular visto do planeta entre { "2000" } e { "2040" }, Fobos { "5.65" } graus, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titã { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } graus); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: a raiz do valor quadrático médio de cada erro de posição sobre o seu próprio sigma formal em [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — cada mapa e contador é igual a uma varredura com o teste de elevação direto; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime o tempo de execução e os testes de pares mantidos; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (apenas verificação de regressão); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressão)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — o resultado do membro idêntico byte a byte à execução autónoma e cada valor alinhado igual à série autónoma; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } sementes de um relógio de ruído de frequência branco em marcha livre tau = { "3010" } s: a média verdadeira { "0" } dentro do intervalo comunicado, a meia-largura do intervalo dentro de { "25" }% de { "1.96" } sigma/sqrt(n), e a variância amostral dentro do intervalo qui-quadrado bilateral de { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; conjunto de calibração (CAP-10, pré-registo ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): em { "200" } conjuntos independentes o intervalo cobre a média verdadeira em { "192" } (dentro da região de { "99" } % de Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) e a verificação do qui-quadrado passa em { "196" }, enquanto a tolerância de percentil de semente única (p05 e p95 dentro de { "0.3" } sigma) passa em apenas { "183" } de { "200" }, NOT MET face aos { "190" } fixados previamente, uma verificação frágil face à semente registada em vez de afrouxada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — uma composição de um só membro lê o número autónomo e o digest do resultado)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (pré-registados fbe6c8b3 e, após uma falha de protocolo na ronda 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — resolução de alvo 1-D dentro de { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) em { "96" } avaliações; p3_prime_contour_target_grid_and_nelder_mead e p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — o melhor do método de grelha igual bit a bit a um ciclo independente de força bruta { "41" } x { "41" } sobre run_toml, Nelder-Mead pelo menos tão bom em { "177" } e { "161" } avaliações; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fixa a falha registada da ronda 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } em { "234" } avaliações; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (todo o cenário agnóstico quanto ao sistema fornecido corre sem dados do workshop, os rácios ionosféricos da troca de banda são iguais a (f_ref/f)^{ "2" } e as suas diferenças de espaço livre a { "20" } log10(f/f_ref), o jitter no C/N0 de referência situa-se entre o seu limite de Gabor e a sua forma de banda ilimitada, as verificações de forma E5 do cenário com parâmetros do workshop são consistentes quando esse ficheiro está presente, e nenhum ficheiro de código-fonte compila esse ficheiro)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (a cascata multibanda corre com quatro painéis, os emissores de jamming UHF, de banda L5, S e C negam cada um apenas a sua própria banda, e uma execução de banda simples não é alterada pela extensão); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: abaixo de { "0.01" } Hz e { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: a menos de { "0.5" } dB de -139.1 e -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (o salto de distância de cada comutação é igual à variação do erro de distância, e um ajuste corrigido de { "300" } s atualizado a cada { "150" } s passa um limiar de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (a forma fechada limita uma amostragem densa do cone)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (cada modelo a menos de { "2" } mm da mensagem exata após a descodificação, recodificação idêntica bit a bit, um bit invertido rejeitado pelo CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (cada modelo a menos de { "0.1" } mm após o bloco de texto, o CSV exato)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: até { "1" } mm e a deriva até { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: o RMS do resíduo ponderado em [{ "0.8" }, { "1.2" }] e o erro abaixo de quatro sigmas formais); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (um substituto pré-registado face aos percentis publicados do conjunto de dados 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: com { "3" } satélites (máscara de { "47" } graus), sem auxílio de altura e a { "30" } Hz, o erro 3-D p90 é de { "92.2" } m a { "20" } s e de { "870" } m a { "8" } s face aos { "2" } m e { "10" } m publicados, pelo que ambos os limiares de fator dois são NOT MET, pelo lado alto, e afirmados como falhados; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) até { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } sementes, média de NEES promediada por execução em [{ "2.4" }, { "3.6" }] e pelo menos { "75" }% das épocas dentro da banda qui-quadrado bilateral de { "95" }%; medido com { "150" } sementes, média { "2.84" } só com GNSS e { "2.87" } com LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: análises de texto-fonte de src, scenarios e tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: uma EIRP mais forte, um intervalo de ajuste mais longo e um termo de determinação de órbita maior movem cada um o valor transmitido e a solução de posição fundida; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

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
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: é igual ao TEC oblíquo da passagem no pico até { "1e-9" } e o seu sigma é igual ao ruído de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótona em cada estatística, acrescentar um monitor nunca aumenta a pontuação, estatísticas saudáveis mantêm-se em { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadeias LEEF exatas, escape, severidade, envelope RFC { "5424" }, tempos limite de entrega e religação); tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorado, condicionado por dados por KSHANA_JAMMERTEST_DIR: a seleção registada, as contagens reservadas, os veredictos dos limiares e o veredicto); receiver_trust::calibration::tests (marcas temporais, emparelhamento de janelas e o desvio de fuso horário, rótulos, bandas de guarda, exclusão, seleção); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionado por dados por KSHANA_JAMMERTEST_PLAN_DIR: contagens de slots por área de ensaio do plano de { "2025" }, identificadores de catálogo, ida e volta em TOML); tests/jammertest_score.rs (um registo sintético com uma queda conhecida: detetada, falhada, não avaliável, execução de falso alarme, pacote assinado com o cartão de pontuação); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionado por dados por KSHANA_JAMMERTEST_DIR: a execução registada)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); fora do crate: integrations/signalk (JavaScript), integrations/opencpn (relé em JavaScript, plugin nativo em C++), deploy/reference-build (unidades systemd, contentor)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (a barreira e o seu recetor TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } testes Node sobre saída sintética gravada); integrations/opencpn/test/relay.test.mjs ({ "5" } testes Node); integrations/opencpn/test/e2e-live.mjs (o binário real para um consumidor TCP, executado à mão e em CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (verificações em C++ do analisador PKSHT e do estado do painel); deploy/reference-build/check-units.sh e deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); testes unitários de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: o limiar de teste unitário B4 pré-registado mantido tal como escrito, as suas falhas registadas afirmadas como constatação F1)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, o veredicto registado afirmado tal como registado, constatação F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, apenas comunicado; condicionado por dados, obtido por scripts/fetch_scint_malindi.sh); testes unitários de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, constatação F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, o veredicto registado afirmado tal como registado, constatação F1, fixada por finding_noise_free_sidelobes_exceed_the_cfar_rate); teste unitário de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, constatação F1, fixada por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, constatação F2, fixada por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, apenas comunicado)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack; compliance (factos do pacote de normas em compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: o estado de cada teste, incluindo as falhas L4-T1 e os quatro testes de exatidão da IMO); standards_pack::tests

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
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), face a xval/crpa-jamming/expected.json de xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), face a xval/jamming-terrain/expected.json de xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), face a xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json e expected_quantiser.json

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
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fixado, registos ASCII e binários, CRC inválido ignorado, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de verificação do catálogo CRC-24Q, C/N0 e fusão de épocas MSM4/MSM7, hora GLONASS e mapeamento de identificadores SBAS, CRC inválido e outras mensagens)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes de ruído branco conhecidos recuperados a menos de { "10" } %, recusas, o TOML é analisado como AccelCfg); tests/receiver_trust_machines.rs (concordância e discordância de orientação, portadora em linha, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes dos pacotes, broker de loopback, broker inativo contabilizado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: o formato que a ponte gnss_lib_py escreve, processado por receiver-trust); os testes Python das pontes são integrations/ros2/kshana_trust/test/test_bridge.py (ponte com um motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (o wheel real pontua como nominal uma posição estável e como não fiável um salto de { "1.1" } km) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } e o wheel), executados com pytest, não com cargo

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Fonte: <c1/>

# text
seg-4cb1d67922ed = O registo de evidências completo e verificado por máquina: <b>{ "388" } linhas — { "176" } VALIDATED, { "208" } MODELLED, { "4" } PARTNER</b>. Uma linha só pode ser VALIDATED com uma referência independente externa (os testes de invariantes da matriz impõem-no). Os mesmos dados, com ligações clicáveis por linha para cada teste, módulo e dado de teste incluído no repositório, constituem o <em>registo de validação</em> em <a1>https://kshana.dev</a1>. Ver <a2>MODELLED-RATIONALE.md</a2> para saber porque é que cada linha modelada não está validada externamente.

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-b04cb81fc402 = tests/clock_library_lag1_noise_id_allantools.rs ({ "140" } casos: dez registos de lei de potência de Kasdin, b = { "0" } a -4, como dados de fase e de frequência, af = { "1" } a { "64" }; alpha_int e d idênticos, pior |d alpha| { "9.6e-13" } e |d rho| { "4.8e-13" } face a { "1e-9" }; pré-registado 2ec76864); allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (opcional, KSHANA_OSNMA_VECTORS: todos os { "18" } conjuntos de vetores, { "186,382" } etiquetas autenticadas, { "0" } falhadas, pisos por conjunto, cadeias anunciadas, ADKD 0/4/12, alerta verificado, autenticação a retomar após o fim da cadeia, revogação de cadeia e de chave e nova chave pública; offline, vetores não redistribuídos); tests/osnma_synthetic.rs (o conjunto de ataques: subtramas falsificadas num futuro distante, expiração e ligação aos dados, alerta e não usar, confirmação do cabeçalho, etiquetas fictícias, MACSEQ, conflito de chaves, KROOT desatualizada e repetida, CMAC-AES/SHA3-256/P-521 através do verificador); testes unitários de osnma (respostas conhecidas de RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } e CRC-24Q)

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 vs Stable32 a { "1e-4" }); allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (5071A Cs real vs maser de hidrogénio, { "556 990" } pts, { "16" } fatores de média vs Stable32 a { "1e-3" }; condicionado pelos dados através de scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (Stable32 PHASE.DAT, { "139" } fatores de média, OADEV/MDEV/TDEV a { "1e-3" }; condicionado pelos dados através de scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV no conjunto de dados LCG de 1000 pontos da NIST SP { "1065" } §{ "12.4" }, { "6" } + { "6" } fatores de média vs allantools { "2024.06" } a <{ "1e-9" }); allan::tests (seguimento em forma fechada de FM branco; identidade TOTVAR=ADEV com m={ "1" }; invariância de Theo1/TOTVAR a desvios de fase/frequência; inclinação de -1/2 do FM branco)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE na série de fase LCG hermética de 1000 pontos da NIST SP { "1065" } §{ "12.4" }, { "9" } fatores de média m={ "1" }..256 vs allantools { "2024.06" } mtie a <{ "1e-9" }, observado ≤{ "4e-15" }); allan::tests (pico a pico derivado à mão; monótona não decrescente em τ; exatamente a·m numa rampa pura)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV na série de fase LCG hermética de 1000 pontos da NIST SP { "1065" } §{ "12.4" }, { "8" } fatores de média m={ "1" }..200 vs allantools { "2024.06" } mdev/tdev a <{ "1e-9" } relativo, mais a identidade τ/√{ "3" } na série real); allan::tests (inclinação de −1/2 do FM branco; pequeno caso de MDEV derivado à mão)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (σ_y(τ) do relógio de pinças de ⁸⁸Sr de Norcia et al., { "8" } tempos de média { "0.92" }–{ "117.76" } s incluídos textualmente sob CC-BY-4.0: o NNLS reconstrói a curva a ~{ "10" }% de RMS / ≤{ "21" }% no pior ponto; √q_wf recuperado = { "4.33e-16" } coincide com o 4.7e-16/√τ publicado; q_rw > { "0" } piso de ruído vermelho medido)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } casos de geometria real, Celestrak GPS+Galileo e IGS SP3: pior |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m face ao TOL_PL { "0.05" } m do ADD); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (as diferenças com sigma uniforme, fixadas); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (IGS ABMF real 2018-05-13, { "288" } épocas, { "2016" } casos com vieses injetados de { "10" } a { "100" } m: 2016/2016 decisões de deteção e 801/801 de exclusão idênticas, HPL/VPL de inclinação a menos de { "2.7e-12" } m face a { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } pares utilizador-época em difusões WAAS reais, o mesmo conjunto protegido, pior |dVPL| { "7.1e-6" } m e |dHPL| { "1.6e-5" } m face a { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (a constatação de L5, fixada); tests/igs_real_data.rs e tests/araim_dual_real_data.rs (verosimilhança com SP3 real do IGS e geometria do Celestrak, mantidos como verificações de regressão, não como referências independentes)

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } vetores de verificação AIAA, pior { "4.12" } mm); tests/sgp4_crate_comparison.rs (crate sgp4 independente)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } épocas = { "11" } casos × { "25" } estados horários, LEO+GTO, vs Orekit { "12.2" } DormandPrince853; níveis conservativos T1–T5 pior |Δr| { "0.08" } m em { "24" } h; nível de resistência atmosférica caracterizado a { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } geometrias através do bordo da sombra, { "884" } na penumbra, de LEO a GEO, declinação do Sol { "0" } e +-23.44 deg, { "8" } azimutes: pior |dnu| { "7.41e-9" } para WGS-84 e { "2.24e-9" } para a linha de base esférica; as razões WGS-84 e esférica do Orekit diferem até { "0.98" }, pelo que o conjunto discrimina o achatamento); testes unitários de srp_shadow e propagator

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } geometrias de órbita Galileo, { "7" } casos do Sol incluindo as distâncias do periélio e do afélio, { "100" } atitudes aleatórias; soma de placa plana pior { "2.05e-15" } relativo em { "1056" } casos; de ponta a ponta com a atitude e a pressão do próprio Orekit pior { "2.39e-15" } em { "747" } casos de pleno Sol, enquanto as constantes de pressão predefinidas do Orekit diferem em >= { "4.43e-3" }, pelo que a comparação discrimina a constante; matriz de guinada nominal pior { "1.89e-15" }; derivada parcial do fator de radiação pior { "1.35e-15" }; derivadas parciais por painel pior { "4.12e-13" } relativo face a diferenças centrais do Orekit em { "10836" } casos de painel; aceleração e derivadas parciais ECOM2 pior { "1.74e-15" }); testes unitários de srp_boxwing (limites em forma fechada, derivadas parciais por diferenças finitas); testes de ligação de propagator e precise_od

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } pontos de grelha, { "90" } a { "1000" } km, { "4" } latitudes, { "2" } horas locais, { "3" } dias, atividade baixa/moderada/alta: densidade a menos de { "1.866e-6" } relativo e temperatura a menos de { "1.97e-4" } K do pymsis; idêntico bit a bit à portagem em C; os { "17" } casos de teste em C publicados, { "187" } valores a menos de { "0.496" } unidades do 7.º algarismo significativo); testes unitários de nrlmsise00

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } casos x { "25" } estados horários em { "24" } h, circular { "51.6" } deg, { "400" } km com atividade baixa/moderada/alta e { "300" } km: pior |dr| { "0.0303" } m e |dv| { "3.36e-5" } m/s face a { "3.3" } a { "141.8" } km de deslocamento por resistência atmosférica, pior erro/limiar { "0.003" }; o controlo de densidade exponencial falha por { "119.1" } m); testes unitários de forces e propagator (predefinição idêntica bit a bit; o nível avalia a portagem no ponto geodésico fixo à Terra)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (casos equatoriais E400, E300 e E250x600 em J2000.0, { "25" } estados horários em { "24" } h: o deslocamento induzido pela resistência atmosférica coincide com o do GMAT a no máximo { "0.016" } do limiar { "0.5" } m + { "1e-3" }|D| face a { "21.5" } a { "143.9" } km de deslocamento; uma variação de +{ "1" } % em Cd*A/m atinge { "9.83" } vezes o limiar; o caso inclinado I400 é comunicado, { "10.4" } % de diferença, a diferença declarada de definição de altura)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } de { "21" } ondas coincidem com o modelo publicado A2: pior { "0.00050" } cm, { "0.050" } deg face a limiares de { "0.0006" } cm, { "0.1" } deg); tests/tides_iers.rs (banda de amplitude S2)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } casos x { "25" } estados horários em { "24" } h: EGM2008 8x8 e 70x70 em LEO { "45" } deg, polar { "89.9" } deg, heliossíncrona { "98.2" } deg, GTO, e 70x70 com Sol/Lua e SRP; pior |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; controlos negativos falham por { "6168" } m (Terra congelada) e { "20871" } m (apenas zonal)); testes unitários de propagator (identidade no limite zonal a { "1e-12" }, referencial CIO bit a bit face a precise_od, integral de Jacobi mantido a { "1e-9" } em { "6" } h)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } passos únicos: estado a menos de { "5.55e-15" } relativo, derivada FSAL { "3.46e-15" }, saída densa { "1.99e-14" }, decisões de aceitação/rejeição idênticas; { "3" } execuções completas com rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } em { "5" } períodos, Arenstorf num período): passo inicial idêntico, passos aceites 502/501, 390/390, 298/298 e avaliações 6025/6013, 5497/5497, 4285/4285 face ao SciPy, estados finais a menos de { "2.95e-13" } relativo (dois corpos) e { "1.58e-12" } (Arenstorf), saída densa a menos de { "9.5e-13" }; exatidão face à solução de Kepler exata em mpmath igual à do SciPy (LEO { "8.44e-5" } m, periodicidade de Arenstorf { "1.475e-9" })); testes unitários de integrator e propagator ({ "24" } h de dois corpos face a Kepler exato abaixo de { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } pontos de grelha, e de { "0" } a { "0.999999" }, M em [-pi, pi] até { "1e-12" }: pior |E - E_ref| { "0.898" } eps|E| face a um limiar de { "8" } eps|E|; { "9" } pontos de M enrolado com pior { "0.013" } do seu limiar; nenhum passo de refinamento de Newton necessário em qualquer dos { "414" } pontos; invólucro idêntico bit a bit); testes unitários de kepler

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (os recortes de grau 20 são sempre executados: pior |dg|/|g| { "9.7e-16" }, relativo à perturbação { "3.4e-11" }; GMM-3 d/o { "120" } em toda a esfera { "3.7e-15" } / { "6.3e-12" } e GL0660B d/o { "660" } a |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, condicionado pelos dados; cabeçalhos e coeficientes selecionados iguais aos produtos PDS publicados, contagens de registos { "7380" } e { "218790" }); testes unitários de gravity_pds

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } cenários: { "6" } sem ruído LEO/MEO/excêntrica/3–4 estações + { "2" } σ={ "5" } m, vs Orekit { "12.2" }; pior em lote |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, sequencial |Δr| { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } pernas em { "8" } épocas { "2020" }–{ "2027" } vs ANISE DE440; pior |Δτ| { "1.03e-9" } s, |Δdistância| { "0.31" } m até { "2.5" } UA)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } casos SV-época: GPS + Galileo + BeiDou-MEO, { "12" } SV × { "7" } desvios, vs RTKLIB eph2pos; pior |Δ| por eixo { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } casos SV-época fora dos nós / { "6" } satélites vs RTKLIB peph2pos; pior |Δ| por eixo { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (mapa IONEX sintético incluído no repositório vs a referência por fórmula: { "20 075" } nós exatos, interpolação máx |Δ| { "3.5e-13" } TECU; condicionado pelos dados em KSHANA_IONEX_CODE_GIM_DIR, o recorte de latitude do GIM final real do CODE de 2018-05-13 obtido por fetch.sh com um SHA-256 fixado: nós exatos, interpolação máx |Δ| { "3.6e-13" } TECU em { "15 795" } amostras, TEC oblíquo { "5.1e-13" } TECU; iontec do RTKLIB v2.4.2-p13 condicionado pelos dados em { "6885" } pontos de consulta, executado em 2026-10-13: máx |Δ| { "3.6e-13" } TECU nos dois modos de tempo, limiar de { "1e-5" } pré-registado); ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (estações IGS WTZR base / WTZZ rover, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } épocas, posições fixas a { "100" } % a partir de { "00" }:{ "10" }, mediana do erro de linha de base fixa { "4.5" } mm, p95 { "5.5" } mm; primeiros { "10" } min fixos { "2.6" } mm vs flutuante { "13" } cm); rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } épocas: Kshana menos IGS desvio-padrão { "0.075" } ns, limiar { "0.20" }; média -0.659 ns, limiar { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (estação IGS WTZR, 2025-02-24 00-06 h, { "30" } s, reservada do desenvolvimento: horizontal na última época { "1.5" } mm, vertical −{ "2.9" } cm; 04-06 h 240/240 épocas a menos de { "0.10" } m em 3-D, p95 { "6.7" } cm; apenas código p95 { "1.70" } m; RMS de ZTD condicionado pelos dados { "1.7" } cm vs EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: o PPP do RTKLIB v2.4.2-p13 com as mesmas entradas concorda a menos de { "0.05" } m em 240/240 épocas, { "9.7" } mm na última, no terceiro registo após duas execuções cuja configuração do RTKLIB não tinha a maré sólida e colocava a antena na posição da base, ambas registadas como constatações; o limiar de paridade do SPP não foi atingido, mediana de { "1.085" } m vs { "0.50" } m; gLAB { "6.0.0" } na sua primeira execução registada, linha de comandos da emenda { "4" }: PPP a menos de { "0.05" } m em 240/240 épocas e { "5.0" } mm na última, limiar do SPP não atingido, mediana de { "1.187" } m, uma constatação: as soluções SPP das duas ferramentas de referência diferem entre si em { "0.852" } m de mediana, pelo que esse limiar foi fixado mais apertado do que a concordância entre ferramentas)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (IGS BRD400DLR_S RINEX { "4.02" } vs BRDM00DLR_S RINEX { "3.04" } de 2026-07-19, fatia 00-02 h: registos G { "37" } / E { "478" } / C { "72" } emparelhados nos dois sentidos, todos os campos idênticos, posição em Toe { "0" } m; dia completo condicionado pelos dados: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (SP3 final IGS de { "15" } min de 2025-02-24 vs os relógios finais IGS de { "30" } s, { "32" } satélites GPS: mediana nos nós |Δ| { "2.6e-13" } s; { "3038" } registos de ponto médio RMS { "0.121" } ns, p95 { "0.265" } ns; mantendo o nó em vez disso { "4.24" } ns de RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (carregadores sintéticos e testes de braço de alavanca com plataforma em rotação sempre; condicionado pelos dados em KSHANA_KFGINS_DIR, executado em 2026-10-13 no conjunto de dados de demonstração do KF-GINS: RMS horizontal / vertical { "0.0109" } / { "0.0090" } m face à trajetória de referência vs KF-GINS C++ { "0.0111" } / { "0.0083" } m, todos os seis limiares pré-registados mantidos; braço de alavanca desligado { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } testes: referência independente e cenários, bytes de exportação fixados, leitores NMEA e LLH, corte ECEF de quatro colunas, FINDING da execução 1 no CSV de largura total, grelha de linhas de { "10" } Hz)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (perfis estático/curva/coning, { "30" } épocas cada, vs NaveGo: atitude idêntica bit a bit { "0" } rad; velocidade/posição dentro de limites analíticos nomeados)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (a síntese GRS80 reproduz Somigliana a { "3.5e-12" }; mapa de perturbação ICGEM EGM2008 real fisicamente plausível)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } casos: { "12" } épocas em janeiro de { "2025" } x os pontos L1 e L2, dois estados iniciais de halo sul de L2 e um de DRO da API de Órbitas Periódicas de Três Corpos do JPL e um estado genérico; pior posição { "1.8e-7" } m face a { "1" } mm, velocidade { "1.2e-9" } m/s face a { "1e-6" } m/s; inverso { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Mercúrio, Vénus, a Terra e a Lua em 2026-01-01, 2030-06-15 e 2040-12-31: pior { "3.3e-5" } m e { "1.0e-11" } m/s face a { "1" } mm e { "1e-6" } m/s; o bloco de núcleo e as etiquetas exatos); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (da Terra ao baricentro de Marte, { "16" } partidas 2026-09-01..2027-01-29 x { "19" } chegadas 2027-06-01..2028-02-26: { "304" } células finitas em ambos os lados, pior C3 { "2.5e-14" } e V-infinito { "2.6e-14" } relativo face a { "1e-8" }, a mesma célula de C3 mínimo, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (da Terra ao baricentro de Marte, partidas 2026-09-15..2027-01-15 x chegadas 2027-05-01..2028-03-01, Tipo I/II x C3 mínimo / V-infinito mínimo: pior objetivo { "8.7e-13" } relativo, datas a menos de { "1e-5" } dia, outra grandeza a menos de { "2.5e-7" } relativo, face a limiares pré-registados de { "1e-7" }, { "0.01" } dia e { "1e-4" }; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (referência publicada secundária NASA/TM-2010-216764 Tabela { "2" }: Tipo II C3 mínimo { "9.182" } vs { "9.144" } e Tipo II V-infinito mínimo { "2.564" } vs { "2.565" } MET; Tipo I C3 mínimo { "10.535" } vs { "11.11" }, -5.18 %, NOT MET e verificado como não atingido, concordando a referência independente da biblioteca com o Kshana)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } casos: { "300" } 3-D aleatórios, { "18" } perto de { "180" } deg, { "24" } perto do tempo mínimo de M = { "1" }..3, { "40" } heliocêntricos; { "1058" } soluções; contagens e ordem de ramos iguais; velocidades a menos de { "1e-8" } relativo, pior { "1.6e-13" }; a menos de { "1" } % do tempo mínimo a menos de { "1e-6" }, pior { "7.5e-15" }; uma salvaguarda interna de aterragem de Kepler faz aterrar todas as soluções a menos de { "4.2e-12" } de |r2| exceto uma constatação fixada num arco com e = { "0.994" }, uma limitação de kepler_universal e não do solucionador)

# text
seg-67d3c2e5a311 = maneuver (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } transferências vs lamberthub izzo2015; pior |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado de ponta a ponta; vetores SOFA/ERFA)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } instantes UTC: seis em torno de cada um dos { "27" } segundos intercalares de 1972-2016, dois fixos, { "60" } com semente entre 1972-2026; dtf2d, utctai e taiutc cada um a menos de { "1e-6" } s, pior { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } datas UT1/TT em duas partes 1980-2050 incluindo passos de +{ "1" }, +{ "10" }, +{ "50" } us em duas datas: gmst82 a menos de { "1e-12" } rad, pior { "0" }; elementos GCRS para ITRS a menos de { "5e-12" }, pior { "2.7e-14" }; rotação em +1/+10/+{ "50" } us a menos de { "1e-13" } rad do ERFA, pior { "1.1e-14" } rad, onde o percurso em f64 simples falha por completo os passos de +{ "1" } e +{ "10" } us); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } épocas TT 1950-2100, dX e dY até { "0.5" } mas: elementos de precessão a menos de { "1e-13" }, pior { "0" }; TEME para GCRS a menos de { "5e-10" } rad, pior { "1.10e-10" } rad; CIO com desvios a menos de { "1e-13" }, pior { "0" }; desvios nulos idênticos bit a bit a cio::gcrs_to_cirs_matrix)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } instantes UTC: quatro em torno de cada um dos { "15" } inícios de uma expressão TAI-UTC 1960-1972 e { "60" } com semente entre 1960-1971; dtf2d, utctai e taiutc cada um a menos de { "1e-6" } s, pior { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (os { "224" } instantes da linha de { "1972" }+ inalterados bit a bit)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } casos: os { "4" } registos GLONASS do ficheiro de difusão IGS MGEX real de 2013-01-01 x { "73" } desvios dentro de +/-900 s; relógio a menos de { "1e-14" } s, pior { "0" } s; posição a menos de { "0.01" } m, pior { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (etapa { "1" }: { "4432" } posições TEME dos { "232" } conjuntos de elementos incluídos no repositório face ao python-sgp4 { "2.24" }, pior { "6.1e-8" } m, limiar { "1" } cm; etapa { "2" }: { "108" } instantes, { "23" } deles com parâmetros de orientação da Terra e um no último segundo de um dia com segundo intercalar, face ao ERFA: GCRS -> ITRS pior { "2.9e-6" } mas, limiar { "0.1" } mas; TEME -> ITRS pior { "0.41" } mas, limiar { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

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
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } casos: CDF/quantil de χ², CDF/quantil normal, CDF de χ² não central, pbias ao longo dos intervalos de P_fa/P_md/redundância)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independente (Cephes/Boost), um algoritmo diferente da série de gama incompleta do Kshana; coincidência a ≤{ "1e-6" } rel. Apenas o núcleo. A <em>atribuição</em> do orçamento de P_HMI do ARAIM MHSS já não está sem uma referência independente numérica publicada — o próprio exemplo trabalhado do Subgrupo Técnico ARAIM do WG-C sustenta agora a linha separada 'níveis de proteção ARAIM MHSS face a vetores de referência publicados', coincidente a TOL_PL = { "5e-2" } m da própria referência — pelo que o âmbito desta linha é o núcleo estatístico e essa linha cobre a atribuição (ver docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } épocas EGNOS reais: HPL comparado diretamente, d_U vertical verificado sem fator K)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } conjuntos de dados, { "24" } limiares; contagens exatas + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (ESA OPS-SAT real, a AUC reproduz o scikit-learn a { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } casos na divisão de teste OPSSAT-AD real: confusão completa no ponto de operação + Pd/Pfa/precisão/F1 vs scikit-learn, exatos em inteiros)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² com graus de liberdade operacionais ≥ { "48" }; Q de van Loan)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } pontos globais × altitudes vs ppigrf @ época { "2025.0" }; pior |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } casos vs scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score; pior |Δ| AUC { "6.9e-8" }, falha mínima detetável { "1.3e-8" }, AUC empírica { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } casos vs scipy { "1.18" } / numpy { "2.4" }: { "61" } τ-b de Kendall até { "2e-16" }, ordenação exata, média de Dirichlet + IC por percentis até { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (tabela do Índice Aleatório de Saaty { "1980" } n={ "1" }..10 EXATA; vetor de prioridades + λ_max + CR vs SciPy/LAPACK eig numa matriz consistente { "3" }×{ "3" } e em matrizes inconsistentes { "3" }×{ "3" } / { "4" }×{ "4" }, coincidentes a <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (pontuações WSM + ordenação) e tests/mcda_wpm_reference.rs (pontuações WPM + ordenação), cada um vs pymcdm a <{ "1e-9" } numa matriz de decisão fixa { "4" }×{ "3" } de benefício/custo

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (coeficientes de proximidade + ordenação vs pymcdm a <{ "1e-9" } numa matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (índice Q + ordenação vs pymcdm a <{ "1e-9" } numa matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (fluxo líquido de sobreclassificação + ordenação, critério usual, vs pymcdm a <{ "1e-9" } numa matriz de decisão fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (matrizes de concordância, discordância e dominância elemento a elemento + núcleo/conjunto dominado vs pyDecision a <{ "1e-9" } num conjunto de dados fixo { "4" }×{ "3" } só de benefício)

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (preferências WASPAS + ordenação) e tests/mcda_moora_reference.rs (pontuações MOORA + ordenação), cada um vs pymcdm a <{ "1e-9" } numa matriz de decisão fixa { "4" }×{ "3" } de benefício/custo

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (graus de utilidade + ordenação vs pyDecision a <{ "1e-9" } numa matriz fixa { "4" }×{ "3" } de benefício/custo)

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } casos de latência determinística EXATOS vs uma referência independente de primeira passagem; { "8" } casos de ARL₁, Monte Carlo @60k ensaios vs a aproximação de Siegmund + tabelas de Montgomery publicadas)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } casos vs scipy { "1.18" }: { "12" } variâncias de deriva livre vs linalg.expm Van-Loan Q₀₀ pior erro relativo { "1.1e-15" }; { "7" } inversões de holdover vs optimize.brentq pior erro relativo { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } casos: { "14" } vs scikit-bio inv_simpson + { "3" } fronteiras de zero fixado; pior |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-d4dabd188012 = tests/skyline_orekit_oracle.rs (skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered: { "1173" } ângulos de visada em seis locais e quatro épocas, seis tabelas de máscara, { "142" } conjuntos visíveis; pior |d el| { "1.3e-13" } deg e |d az| { "2.3e-13" } deg face a { "1e-9" }, pior |d mask| { "1.1e-12" } deg face a { "1e-9" }, conjuntos visíveis idênticos sem nenhum na banda de fronteira de { "1e-6" } deg, pior DOP { "3.3e-13" } relativo e cofator { "6.6e-13" } da escala da matriz face a { "1e-9" }; pré-registo e4b9d912); skyline::tests (table_interpolates_linearly_between_rows; table_wraps_through_north_without_a_seam); tests/skyline_scenarios.rs (every_wired_scenario_is_byte_identical_to_the_0_35_0_release)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-48069ecceb4a = tests/ellipse_numpy_oracle.rs (ellipse_and_cofactor_agree_with_numpy_as_pre_registered: { "270" } casos, os { "142" } conjuntos visíveis registados da comparação de skyline com um único relógio comum e com um relógio por sistema; pior eixo { "5.1e-13" } relativo e orientação { "5.3e-12" } deg, nenhum quase circular, cofator { "1.0e-12" } da escala da matriz, face a { "1e-9" } e { "1e-6" } deg; pré-registo 0bbeeaee); geometry::tests (ellipse_of_an_analytic_two_by_two_case)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } os primeiros 10 chips reproduzem exatamente os octais da Tabela 3-Ia da IS-GPS-200 1440/1620/1710/1744/1133/1455/1131/1454/1626; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (identidade UKF==KF linear; deriva livre em falha; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } casos vs filterpy { "1.4.5" }: EKF linear fraco/forte + posteriores PNT acopladas até ≤{ "2.4e-12" }; execução do UKF de 40 épocas pior |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (solução fracamente acoplada do NaveGo v1.4 no percurso real IMU/GNSS Ekinox do NaveGo: RMS horizontal 0.912x, vertical 0.940x, RMS da inovação de posição 0.861x do NaveGo, inovação normalizada média { "0.395" }; limiares 1.2x, 1.2x, 1.2x e { "1.5" } fixados antes da execução)

# text
seg-e53182bd8d30 = cr3bp::tests (STM vs diferenças finitas); tests/cislunar_mission_analysis_reference.rs ({ "5" } membros NRHO L2-S da JPL: os { "9" }:{ "2" } + { "4" } vizinhos; pior |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, perilúnio { "0.7" } km em unidades de comprimento da JPL)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values em CI em dez nós ICGEM citados; egm2008_n70_gravity_anomaly_sa_matches_icgem sobre as grelhas completas de 0.25 deg obtidas do Chade 9-15N 19-25E e do Vale da Morte 35-38N 242-245E, { "794" } nós: RMS { "1.3e-8" } e { "2.6e-8" } mGal, máx. { "2.9e-8" } mGal face a limiares pré-registados de { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — a decimação registada a 6 arcos-segundo do mosaico SRTM v3 N36W117, de domínio público, situa Badwater Basin, o ponto mais baixo da América do Norte, a −{ "78" } m dentro da banda de levantamento [−{ "95" },−{ "70" }] m e lê o verdadeiro relevo de cerca de ~{ "2.2" } km da cordilheira oriental do mosaico; além disso, em dois recortes registados literais de 361x361 a 1 arco-segundo de N36W119 e N36W117, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m na banda [{ "4380,4430" }] m em torno do levantamento de { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m em [−{ "95" },−{ "70" }] m) e gdal_cross_check (o nó mais próximo é igual ao gdallocationinfo do GDAL { "3.8.4" } nos mosaicos completos, exatamente em todos os { "8" } pontos pré-registados, xval/srtm-ungate/; além dos referências independentes de analisador de ponto médio bilinear construído à mão e de ficheiro sintético)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } estados / { "2" } ficheiros de teste descodificados byte a byte de forma idêntica pelo analisador independente <c1/>, Δ pos/vel = { "0" }); oem::tests (analisar um OEM de uma ferramenta externa com palavras-chave/comentários/covariância adicionais, ida e volta de escrita→leitura do estado completo, pos+vel+acel tolerados, só posição + metadados obrigatórios em falta rejeitados, ida e volta do cenário de alta fidelidade + ingestão externa); dominance_demonstrators (alcançável + reproduzível + ida e volta exata + MODELLED-não-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Analisador CCSDS-502 independente de terceiros <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — uma base de código separada que descodifica o OEM EME2000/UTC emitido pelo kshana de forma byte a byte idêntica ({ "24" } estados em { "2" } ficheiros de teste, Δ pos/vel = { "0" }) e cujo leitor estrito confirma os tokens de metadados; o analisador do kshana concorda igualmente com ele num OEM externo incluído no repositório. Dois resultados de interoperabilidade rigorosos (a biblioteca oem rejeita a convenção de múltiplos segmentos por satélite do kshana e as suas linhas de covariância com várias entradas) estão documentados no teste — pelo que isto valida o intercâmbio aderente à norma de objeto único, não a aderência à norma CCSDS-502 completa de todas as variantes do kshana

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (raio angular { "64" }° a { "700" } km + diminui com a altitude, nadir→zénite/alcance zero, horizonte→ε=0/ângulo central máximo, erros além do horizonte, a faixa cresce com o FOV / o GSD com a altitude, espaçamento de nós de ~{ "2750" } km, cenário reproduzível/MODELLED + rejeição de entradas inválidas); dominance_demonstrators (alcançável + reproduzível + raio angular de { "64" }° + MODELLED-não-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (altitudes 400-1500 km, inclinações 1-98 deg, meio FOV 7.5-50 deg, IFOV 10-50 microrad, rotação de { "30" } e { "89" } deg: cada grandeza dentro do seu limiar pré-registado, indicador de contiguidade 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regressão tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (os bits do cabeçalho coincidem com a disposição CCSDS-133, codificar→descodificar reproduz todos os campos, fora do intervalo/truncados rejeitados); tests/ccsds_space_packet_reference.rs ({ "33" } casos vs spacepackets { "0.32.0" }, incl. { "12" } comparações de pacote completo; zero octetos divergentes)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, controlo de erros do pacote, segmentação e reagrupamento, descodificação de fluxos)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (cinco limiares pré-registados: CRC, códigos de tempo, fluxos, lacunas e ordem, PUS TM; zero divergências); space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (inventário, avaliação, identidade de bits e de bytes, conversão de épocas OEM; quatro verificações de mutação planeadas fazem-no falhar)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (inventário, avaliação nos dois sentidos, identidade de bytes); spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 o Orekit lê { "33" } ficheiros do Kshana, L2 o Kshana lê { "31" } ficheiros do Orekit, L3 { "135" } rotações de registos; resultados fixados); adm::tests; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 o Orekit lê { "30" } ficheiros do Kshana, L2 o Kshana lê { "25" } ficheiros do Orekit; resultados fixados e verificados como recorrentes); odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (o binário GG anula-se para um corpo simétrico, cresce em baixo, linear em ΔI, soma em quadratura RSS, frações de variância somam 1); tests/attitude_gg_torque_reference.rs ({ "20" } casos vs um binário GG de tensor completo independente T=(3μ/R³)(n̂×(I·n̂)) maximizado numericamente sobre a atitude com álgebra linear Hipparchus { "3.1" }; pior erro relativo { "6e-15" }, + banda publicada de Wertz/Sidi O({ "1e-6" }) s⁻²); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } casos vs Basilisk { "2.9.1" } GravityGradientEffector: máximo na atitude de { "45" } deg dentro de { "1e-12" } relativo, pior { "2.1e-15" }; nenhum binário acima do máximo em { "2000" } atitudes aleatórias por caso, { "3" } tensores de inércia diagonais e { "5" } gerais, { "5" } altitudes)

# text
seg-49b30066ff1b = passes::tests (interpolação de cruzamento linear + segura em casos degenerados, passagens polar→latitude média, máscara mais alta ⇒ menos ou igual); tests/ground_station_pass_prediction_reference.rs ({ "22" } cenários / { "129" } passagens vs Orekit { "12.2" } ElevationDetector; pior |Δ| AOS/LOS { "0.0000" } s, elevação máxima { "0.0014" }°, acesso total { "0.0001" } s, mesmo número de passagens)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } casos, { "1210" } passagens: AOS/LOS dentro de { "3.4e-6" } s, limiar { "5" } ms; elevação máxima dentro de { "5.5e-7" } deg, limiar { "1e-3" } deg; { "8979" } direções aparentes dentro de { "8.8e-7" } deg, limiar { "1e-4" } deg); tests/earth_orbit_path_sgp4_erfa_oracle.rs (a trajetória); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (resultado da ronda 1, fixado; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (forma da perda em espaço livre, fecho da equação de ligação); tests/one_way_link_budget_reference.rs (DCT em banda X Galileo da DESCANSO/JPL reproduzido de ponta a ponta + { "6" } casos FSL da ITU-R P.525 nos centros de banda S/X/Ka da DSN; pior |ΔFSL| { "4.6e-3" } dB, |Δportadora| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (taxa em forma fechada; ida e volta); tests/lunar_coordinate_time_reference.rs (termos de autopotencial e de taxa secular do LTC vs valores publicados de Ashby & Patla { "2024" } + velocidade geocêntrica da Lua vs JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests e realtime_frame_eop::tests (as três componentes têm conjuntos de épocas iguais, idênticos elemento a elemento e estritamente crescentes nos dois extratos reais do IERS; o conjunto conjunto reduz-se à interseção quando os dois blocos do Boletim B realmente discordam, e um horizonte sem linhas partilhadas é omitido em vez de preenchido com zeros; o carácter vazio da tabela previsto-versus-final é declarado no documento em vez de implícito por um campo em falta; uma segunda versão real preenche-a, verificada linha a linha; uma versão posterior em falta é um erro, não uma tabela vazia silenciosa); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tabelas { "3" }, { "4" } e { "6" } do cenário de ponta a ponta: conjuntos de épocas exatos, estatísticas de UT1 e do polo dentro de { "1e-9" }, a combinação na Lua dentro de { "1e-5" } de uma rotação ERFA completa, o estado declarado de cada caso previsto-versus-final); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } a { "1.100" } a { "1" } até { "90" } dias); contagem de linhas: tests/embedded_eop_vintage_astropy_preregistered.rs (linha de entrada offline); regressão da ronda 1: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (seis critérios exatos: os bytes do extrato; { "174" } linhas; contagens por versão e listas MJD completas 30/54/90; indicador P tanto no movimento polar como no UT1 de cada linha prevista; a contagem da execução predefinida simples; cada linha prevista igual ao Boletim A do IERS Vol. XXXIX N.º { "039" } dentro do último dígito impresso, pior { "5.0e-5" } arcsec e { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (fixação de regressão do antigo extrato de 32 linhas sob o classificador de indicadores: { "20" } finais, { "12" } rápidas, { "0" } previstas); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (o resultado da ronda 1, mantido); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } atrasos em { "25" } épocas perto de J2000 sobre DSS-14, DSS-43 e DSS-63: atrasos dentro de { "1" } ps, pior { "0.06" } ps; derivadas parciais do farol no referencial do corpo dentro de { "1e-6" }, pior { "7.4e-9" }; derivadas parciais da estação ITRF93 dentro de { "1e-6" }, pior { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (verificação cruzada da avaliação do kernel); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } estados de de440s.bsp e { "200" } rotações MOON_PA_DE440 em { "200" } épocas de 1849-2150 e pares aleatórios de corpos obtidos a partir do próprio hash do commit de pré-registo, face a SPICE e ANISE em kernels recortados idênticos bit a bit aos da NAIF: pior diferença { "0.6" } % do seu limiar, { "1.95e-3" } m absolutos); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (o mesmo nos ficheiros NAIF completos, SHA-256 verificado; condicionado aos dados); tests/naif_kernel_reader_check.rs (salvaguarda de engenharia, não evidência); naif_kernel::tests; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } testes da biblioteca: a divisão é aditiva e reconstrói dy; uma covariância de modo comum produz um nível de proteção de modo comum positivo, enquanto uma covariância só de paridade produz um quase nulo; o projetor anula range(G)); tests/lunar_common_mode_integrity_reference.rs (a divisão do motor face a um cálculo numpy independente em entradas idênticas byte a byte sobre a amostra registada de 366 épocas, erro relativo E absoluto < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } casos com paridade na geometria de 8 satélites e num subconjunto de 6 satélites sobre os dois pares reais de inter-efemérides: blind_dx, resíduo e normas dentro de { "1e-12" } de |dy|, pior { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (recupera a verdade simulada; o VLBI restaura a observabilidade 3-D da estação; determinístico); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } geometrias × { "16" } parâmetros, { "31" } observações cada, vs Orekit { "12.2" } / Levenberg-Marquardt do Hipparchus sobre observações idênticas; estado recuperado pior |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (seis redes, incluindo uma sem VLBI: passos de Gauss-Newton dentro de { "4.3e-11" }, sigmas formais dentro de { "1.9e-11" }, erros de estação iguais; nas entradas de matemática portátil { "0.36" }, { "2.4e-11" } e { "1.3e-11" } nas entradas { "0.30" })

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (valores próprios vs numpy.linalg.eigh; covariância CRLB vs σ²(XᵀX)⁻¹ via numpy.linalg.inv; GDOP/PDOP/HDOP/VDOP/TDOP do GNSS a partir da matriz de informação vs numpy — todos coincidentes a { "1e-9" }); fim::tests (solucionador próprio de Jacobi vs espetros em forma fechada; CRLB vs formas fechadas de Kay { "1993" } — DC em WGN σ²/N e ajuste de reta σ²(XᵀX)⁻¹; atingimento do CRLB por Monte Carlo; identidade de Moore–Penrose MM⁺M=M; espaço nulo do defeito de datum)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (recupera a transformação de Helmert injetada); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } casos vs um solucionador independente em forma fechada de Umeyama-SVD; pior |Δ| translação { "2.0e-5" } m, rotação { "5.3e-12" } rad, escala { "9.3e-2" } ppb, RMS pós-ajuste { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (o DOP reutiliza o kernel validado; o PL reduz-se ao caso do polo sul); tests/lunar_navigation_service_volume_reference.rs (posição MCI por satélite a <{ "1e-3" } m + conjunto de satélites visíveis EXATO sobre toda a varredura grelha×época vs ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (os { "210" } códigos primários AFS-Q sempre; com KSHANA_LANS_RUN e a cache LSIS todos os { "630" } códigos, zero divergências de chips); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (com a cache LSIS: { "3" } tramas, zero divergências de símbolos; { "24" } janelas registadas de { "2" } ms, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (condicionado aos dados: execução completa de { "23.9" } s, |rho| = { "0.999990" }, pior bloco de { "2" } ms { "0.999948" }, fase { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (com a cache LSIS: as { "3" } tramas que o LANS-AFS-SIM transmite, construídas a partir dos mesmos FID, TOI e bits de dados: zero de { "18 000" } símbolos diferem); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (LSIS Figura { "8" }: 0x045 -> 0x229f61dbb84a0; valor de verificação CRC-24/LTE-A 0xCDE703; executa sempre); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } palavras de código, zero verificações não satisfeitas da H impressa); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (descodificador a partir de H apenas, sem ruído e a { "3" } dB Es/N0, e { "10" } tramas completas); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } canais: pior pseudodistância { "1.6e-3" } m face a { "0.05" } m, fase do código { "5.5e-6" } chip face a { "2e-4" }, Doppler { "7.4e-5" } Hz face a { "0.02" } Hz, ângulos de visada { "4e-9" } grau face a { "1e-4" }, conjunto visível idêntico); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (o harness de referência independente reproduz exatamente a listagem de canais impressa pelo próprio programa)

# text
seg-80e62d2d7748 = lunar_service::tests (topocêntrico face a geometria calculada à mão: zénite, norte/este/oeste exatos, antípoda e a direção este polar degenerada; o indicador de visibilidade exportado concorda com o filtro de visibilidade independente numa varredura completa de { "6" } h; a exportação está desligada por predefinição e comprovadamente não altera mais nada; os níveis de proteção são exatamente lineares no sigma exposto enquanto a geometria subjacente permanece intacta); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } amostras em { "8" } locais, { "12" } épocas e { "8" } satélites vs ANISE { "0.10.2" }: azimute e elevação dentro de { "1e-6" } deg, distância e posição do local dentro de { "1" } mm; pior { "2.2e-12" } deg, { "2.1e-13" } deg, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (aplicar/resolver inversa, binário nulo do pião esférico, ponto fixo do eixo principal, conservação de energia+momento em execuções curtas, q̇=½q⊗ω, sinal da taxa do pião simétrico + precessão do cone do corpo); tests/attitude_dynamics_reference.rs ({ "200" } 000 execuções de passos sem binário: |q|={ "1" } a { "1e-10" }, energia cinética T=½ωᵀIω conservada a { "1e-9" } rel, |Iω| e o vetor de momento inercial conservados a 1e-9/1e-8 rel, tanto num tri-axial como numa inércia geral não diagonal; precessão do cone do corpo do pião simétrico oblato + prolato reproduzida a { "1e-6" } vs a analítica λ=ω₃(I_a−I_t)/I_t); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (duas inércias gerais não diagonais, { "1e4" } s sem binário vs o hub de nave espacial Basilisk { "2.9.1" } com RKF78: quaternião dentro de { "1e-9" }, pior { "3.3e-11" }; taxas do corpo dentro de { "1e-9" } rad/s, pior { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, SHM desacoplado no sentido transversal); tests/cw_dynamics_reference.rs (Φ em forma fechada vs uma integração RK4 de passo fixo independente das mesmas EDO de Hill a <{ "1e-6" } ao longo de um terço de órbita; Φ(t)Φ(−t)=I a { "1e-9" }; a condição limitada ẏ₀=−2n·x₀ fecha o estado completo ao fim de um período a { "1e-9" } sem deriva secular ao longo da pista em { "10" } órbitas; um desvio radial puro deriva o −12π·x₀ analítico por órbita); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (quatro casos a { "100" } m ao longo de um terço de uma órbita de { "500" } km: pior { "1.15e-7" } m face a { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (só o Φ linear: { "1.2" } a { "6.3" } mm, fixado)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (pico de { "35.44" } g face aos { "33.4" } g publicados, +{ "6.1" } %, limiar { "10" } %; velocidade de entrada relativa ao planeta { "12.551" } km/s face a { "12.6" }, limiar { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (a energia no referencial rotativo diminui exatamente o trabalho do arrasto; a deriva no vácuo conserva a energia de Jacobi; o caso balístico não rotativo coincide com a massa pontual planar do módulo reentry; a forma fechada de Allen-Eggers no seu regime)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } casos, { "601" } amostras cada: MRP pior { "2.4e-14" }, limiar { "1e-9" }; taxa do corpo { "1.6e-15" } rad/s, limiar { "1e-9" }; velocidade da roda { "2.9e-11" } rad/s, limiar { "1e-6" }; binário do motor aplicado { "1.2e-13" } N m, limiar { "1e-9" }; binários em t = { "0" } dentro de { "1e-12" } N m; saturação atingida em ambas as ferramentas); aocs::tests (momento angular conservado, mapeamento de norma mínima, ramo MRP, convergência sob saturação); aocs_kind::tests

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(identity quaternion)=I; o resolvedor de valores próprios de Jacobi satisfaz Kv=λv e preserva o traço numa matriz simétrica conhecida; K é simétrica); tests/wahba_reference.rs (TRIAD, o método q de Davenport e o QUEST reproduzem a DCM ótima de scipy.spatial.transform.Rotation.align_vectors em conjuntos de vetores ponderados sem ruído com <{ "1e-9" } rad, através do ângulo de erro de atitude independente do referencial; além disso, o método q recupera uma rotação conhecida com λ_max=Σ pesos e perda de Wahba nula, a solução do método q minimiza a perda de Wahba sob perturbação, o QUEST concorda com o método q ótimo com <{ "1e-7" } rad, e o estimador ótimo supera o TRIAD de dois vetores no erro de atitude RMS ao longo de { "2000" } ensaios de Monte Carlo com ruído)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (caso central do Marcum-Q Q_1({ "0" },b)=exp(−b²/2); a identidade P_d=Q_M(√(2Mρ),√γ); ida e volta P_fa↔limiar em M e P_fa; monotonia da ROC — P_d aumenta com a SNR, diminui com o limiar, P_d→P_fa quando SNR→{ "0" }; o ganho de integração não coerente aumenta P_d com P_fa fixa; Marcum-Q monótono em a e b e limitado em [{ "0,1" }]); tests/acquisition_reference.rs (o Marcum Q_M(a,b) generalizado, P_d, P_fa e a inversão P_fa→limiar coincidem com scipy.stats.ncx2/chi2 numa grelha (M,a,b)/(M,P_fa)/(M,SNR) até ~{ "1e-6" })

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ reconstrói Q); tests/lambda_reference.rs (a transformação Z é unimodular |det Z|={ "1" } com Q_z=ZᵀQZ SPD, preserva o determinante e tem menor correlação total fora da diagonal; o ILS de Schnorr–Euchner coincide com a enumeração exaustiva em { "300" } covariâncias aleatórias; a cadeia completa decorrelação→pesquisa→transformação inversa é igual ao ILS direto e Z⁻ᵀZᵀ faz a ida e volta de inteiros; a taxa de sucesso bootstrapped em forma fechada coincide com um Monte Carlo de 200k ensaios de arredondamento condicional sequencial com <{ "0.01" }); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (os inteiros fixados são iguais aos de lambda() do RTKLIB v2.4.2-p13 em { "300" } covariâncias aleatórias, n de { "2" } a { "10" }, { "226" } delas não resolúveis por arredondamento; as duas melhores normas ao quadrado concordam até { "1e-9" } em termos relativos, medido { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (os escalares do sobrevoo satisfazem as formas fechadas, com duas identidades de |B| concordantes e |B|>r_p; o ângulo de viragem diminui com o raio do periápside e atinge os limites δ→{ "0" } / δ→π; a deflexão preserva a velocidade v∞ e roda exatamente δ; a magnitude do Δv de assistência é igual a { "2" }·v∞·sin(δ/2) e é limitada por { "2" }·v∞; os eixos do plano B são ortonormais e ⊥ Ŝ com |B|²=(B·T̂)²+(B·R̂)²; o parâmetro de Tisserand é invariante numa deflexão que preserva v∞ e que altera a,e,i, e é igual a { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (identidades da aritmética complexa, incl. z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; a anulação determinística dá ganho unitário exato do SV e nulos de jammers <{ "1e-9" } numa ULA de 4 elementos com { "3" } jammers; uma agregação de N elementos rejeita >N−{ "1" } jammers e anula de norma mínima os restantes; o MVDR mantém-se sem distorção em direção ao SV enquanto o nulo do jammer se aprofunda monotonamente com a potência do jammer até <{ "1e-3" } a { "60" } dB); tests/crpa_reference.rs (os vetores de pesos de MVDR e de anulação de norma mínima e os ganhos de resposta da agregação resultantes coincidem com um cálculo LAPACK numpy/scipy independente até ~{ "1e-9" })

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (cada tipo de ruído puro mostra o seu declive ADEV log-log característico — FM branco −½, FM flicker { "0" }, FM de passeio aleatório +½, PM branco −{ "1" }; o termo de FM flicker é um piso plano igual a √({ "2" } ln2·h_{ "{" }-1{ "}" }) ao longo de cinco décadas de τ; o ajuste da família FM recupera, em ida e volta, h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 conhecidos a partir de uma curva sintética com <{ "1e-6" }; e o piso de uma curva dominada por flicker é recuperado aqui, enquanto o ajuste de base de deriva (quantum_trade::qparams_from_adev_curve) erra em >{ "10" }% para τ longos — a fechar uma lacuna documentada); tests/powerlaw_oadev_reference.rs (σ_y(τ) coincide com as formas fechadas Noise.adev de allantools { "2024.06" } ao longo da escada de τ para os cinco tipos de ruído, além de uma corroboração do nível h_a entre o gerador de Kasdin de allantools e o estimador oadev)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (uma covariância PD simétrica faz a ida e volta KVN→análise até ao arredondamento f64 e mantém-se simétrica; o bloco emite exatamente as { "21" } entradas triangulares inferiores — i+{ "1" } por linha da matriz — com/sem COV_REF_FRAME; um bloco com o número de valores errado e um bloco em falta são ambos rejeitados); tests/ccsds_oem_covariance_reference.rs (a biblioteca oem { "0.4.5" } independente analisa um segmento OEM emitido pelo kshana e reconstrói a matriz simétrica { "6" }×{ "6" }, coincidindo com a covariância de entrada do kshana até ao arredondamento f64; com um controlo negativo perturbado e uma verificação de que o oem rejeita a variante CX_X rotulada)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — o MESMO analisador CCSDS-502 independente em que confia a linha validada 'CCSDS OEM interoperability', uma base de código completamente separada (com o seu próprio tokenizador KVN, máquina de estados da secção de covariância e montagem de matrizes em numpy). O kshana emite um segmento OEM completo com o seu bloco COVARIANCE triangular inferior de números simples sem rótulos; o oem analisa-o e reconstrói a matriz simétrica { "6" }×{ "6" }, coincidindo com a covariância de entrada do kshana elemento a elemento até ao arredondamento f64 — uma verdadeira ida e volta de intercâmbio entre bibliotecas (comparada com a reconstrução do oem, e não com uma nova análise do kshana), a fechar a anterior lacuna 'sem fixture de terceiros' da linha

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); tipo de cenário <c1/>

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } pontos, seis termos de erro de { "30" } s a { "3600" } s, grau Tactical, { "45" } deg N, nivelado e apontado a norte: todos os pontos a menos de { "5" } %, pior caso +{ "3.70" } % de passeio aleatório de velocidade a { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (a conclusão da ronda 1 sobre as leis de ordem dominante de Terra plana, mantida como regressão)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } testes de biblioteca: o jacobiano analítico face a uma diferença finita central de lunar_vlbi::vlbi_delay_s calculada por um caminho que roda para a frente as coordenadas do próprio estado e nunca toca numa derivada parcial, concordando até < { "1e-6" } de 1/c por coluna, com as duas matrizes de informação a concordar até < { "1e-6" } da maior diagonal e as covariâncias até < { "1e-5" } em termos relativos; uma geometria unitária ortogonal cuja covariância é c·σ_τ por eixo em forma fechada até { "1e-12" }, que é também o único caso em que a ligação de equipartição é exata; o espectro da covariância e o sigma 3-D de cada estação invariantes sob uma rotação rígida de toda a rede até { "1e-9" }, com C_rot = R·C·Rᵀ fixado por blocos E uma asserção explícita de que os sigmas por eixo se moveram, para que o teste não possa passar de forma vácua; escala da covariância exatamente como σ² e como 1/N; o limite do traço AM-HM nunca superado; o fecho do atraso τ_ik = τ_ij + τ_jk fixado a uma ULP nos atrasos e nas linhas do jacobiano, com uma linha de base redundante a acrescentar informação mas nunca característica; uma única época declarada deficiente em característica com um resultado principal nulo; um arco mais longo medido como condicionando melhor com o mesmo número de observações; o bloco de balizas mostrado como inobservável neste calendário; a parcial de Shapiro diferenciada negligenciada medida por diferença finita em tempo de execução e emitida em vez de ser despachada com um gesto); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (rede ancorada predefinida e rede livre: jacobiano construído com SPICE, o calendário de 16 observações idêntico, sigmas das estações a menos de { "2.2e-3" }, valores próprios { "2.3e-3" }, condição { "2.4e-3" }, resultado principal { "1.0e-3" }, linha de visão { "0.018" } deg, declinação { "0.007" } deg, face a limiares de { "1" } % e { "0.1" } deg; rede livre de característica 8/9 com resultado principal nulo, espaço nulo a { "0.006" } deg de distância; NumPy sobre o jacobiano registado até { "2e-13" })

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } observações idênticas; característica 3/3; valores próprios a menos de { "5.9e-5" }; condição { "5.9e-5" }; sigmas das balizas a menos de { "1.7e-3" } face a { "1e-2" }; RMS { "2.9e-5" }; braço de alavanca { "1.4e-8" }; sigmas de P2 { "3.9e-14" } face a { "1e-9" }); lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } casos de volume de serviço — polar sul, latitude média, equatorial, planalto elevado — { "6" } a { "19" } satélites, σ_URE 10/30/60 m, P_HMI { "1e-3" } até { "1e-7" }, níveis de proteção entre { "1.7e2" } e { "6.9e3" } m: HPL/VPL face à referência independente composta RTKLIB + SciPy, pior |Δ| { "1.061e-8" } m e { "1.044e-8" } m para uma tolerância de { "1e-6" } m; DOP face ao (GᵀG)⁻¹ do próprio RTKLIB até { "1.790e-14" } em termos relativos; K_fa face a scipy.stats.norm.isf até { "2.716e-11" } em termos relativos; três controlos negativos — um desvio de satélite de { "5" } km, uma alteração relativa de σ_URE de { "1e-6" } e um P_HMI { "0.1" } % mais apertado — cada um medido como deslocando o nível de proteção em pelo menos { "171" }× a tolerância; e uma salvaguarda contra fixtures obsoletas que fixa bit a bit a geometria registada ao que o código próprio do motor para constelação e visibilidade produz, de modo que um resultado verde não possa sobreviver a uma alteração da constelação por baixo dele)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } vetores publicados + { "6" } controlos negativos, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: omitir o desvio nominal falha o VPL publicado em { "2.6457" } m, um erro ISM de { "10" } % em { "0.2798" } m, K_fa a { "57" } modos em vez de { "12" } em { "0.4015" } m, um erro de variância de integridade de +{ "2" } %/+{ "5" } % em 0.0750/0.1971 m — e um erro de +{ "1" } % desloca-o apenas { "0.0339" } m, indicado como o limite de resolução da verificação em vez de ocultado; as respostas dos dois documentos falham cada uma a da outra por mais do que a tolerância, pelo que os vetores não são intermutáveis; a fixture registada e as constantes compiladas são duas transcrições independentes cuja coincidência é verificada por asserção, de modo que um valor publicado não possa ser editado de um dos lados para fazer passar uma verificação; e C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² é válido para todas as { "40" } variâncias transcritas, uma identidade aritmética que um erro de transcrição quebraria)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } testes: todos os { "15" } ficheiros CRD registados idênticos byte a byte aos seus resumos criptográficos registados; todos os { "349" } registos contabilizados, { "337" } usados e { "12" } ignorados por um motivo nomeado; cada distância arquivada dentro do envelope real de perigeu/apogeu; os pesos mostrados como SENDO bin_rms/√n_raw; a coordenada da linha de visão melhor determinada para cada agregação, com a varredura de libração que a obtém medida em separado; o resíduo e a sua confirmação independente face ao JPL Horizons; a sensibilidade à inclinação de geometria de 0.1 grau; a comparação da campanha simulada mostrada como igual a uma execução independente desse cenário; uma fixação bit a bit R1 dos três pacotes de referencial lunar preexistentes); lunar_llr::tests ({ "12" }: a parcial da distância face a uma diferença finita central do tempo de voo modelado até < { "1e-6" } em termos relativos; o tempo de luz uma ida e volta lunar convergida; o sigma do datum exatamente linear na escala dos pesos até { "1e-9" }; diagonalidade por blocos exata; um diretório de dados em falta recusado em vez de substituído; uma linha de catálogo editada detetada pela sua própria coluna de raio); realdata::llr_crd::tests ({ "7" }: semântica dos campos, transição da meia-noite, recusa de uma escala de tempo não UTC e de uma versão de formato não suportada, e nenhum sigma substituído para um bin vazio); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, fixado; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } pontos normais de 2025-T2 não vistos; sigmas e normas no pior caso { "1.11e-3" } de { "1e-2" }, condição { "8.95e-4" } de { "2e-2" }, rácios { "1.79e-3" } de { "2e-2" }, contabilidade, características e acoplamento exatos)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } pontos normais de 2019-T2 não vistos; sigmas e normas a menos de { "4.0e-5" } de { "1e-2" }, condição { "1.6e-5" } de { "2e-2" }, rácios { "7.6e-5" } de { "2e-2" }, contabilidade e características exatas); tests/validate_llr_datum_kernel_moon.rs (o diagnóstico de dados já vistos de { "2015" }, { "0.049" } % em tz; não constitui evidência para esta linha); lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } estados geocêntricos semanais, ângulo do pior caso de época afirmado < { "0.3" }° e RMS < { "5e5" } m face à alegação documentada do próprio módulo, além de o resíduo LLR ser afirmado como concordante com a discordância radial até < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } pontos normais reais)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (característica 1, fusão/exclusão, dominância do desvio, verificação cruzada de IR); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } casos registados: estimadores de subconjunto numpy lstsq, covariância de separação geral, PL de scipy brentq; PL a menos de { "1e-9" } em termos relativos, pior caso { "1.2e-10" }; subconjunto condutor exato)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } casos SPD registados: fator, resíduo branqueado, operador de branqueamento e quadrado de Mahalanobis face a numpy LAPACK a menos de { "1e-12" } em termos relativos, pior caso { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } casos registados: alpha_ss, alpha_cm e o mínimo a menos de { "1e-12" } em termos relativos em { "210" } casos bem condicionados e de fronteira, pior caso { "3.3e-15" }; { "40" } mal condicionados até à condição { "1.3e8" } dentro de um limite declarado escalado pela condição, pior caso { "1.1e-9" }; seis infinitos exatos)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } matrizes SPD 7x7 sintéticas, desde bem condicionadas a quase degeneradas { "{" }{ "0,3" }{ "}" }; Schur lambda_min / CRLB da origem / |corr| face a SciPy/NumPy com <{ "1e-9" } rel)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } épocas aleatórias fora de nó face a SPICE pxform no PCK binário: ângulo de rotação a menos de { "1.7e-5" } rad, pior caso { "1.7e-6" } rad, { "3" } m ao raio médio)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } pontos normais ILRS: RMS { "2.81" } m; só as duas estações ITRF2020 { "2.96" } m; ambos no máximo { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (o modelo de tempo de luz geocêntrico superado, { "10.94" } m, fixado)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } valores próprios, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm e a marginal de Schur de { "{" }scale,offset{ "}" } para as redes well_posed de 120 linhas e single_epoch de 30 linhas, com rel<{ "1e-3" } e abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m a menos de { "2.8e-6" } de Ashby e Patla { "2024" } com J2 de AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: a entrada radial a menos de { "8.3e-5" } da gravidade equatorial de grau 350 do pyshtools; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: a entrada de velocidade a menos de { "2.5e-3" } da velocidade lunar DE441 em { "2000" } épocas); lunar_gauge::tests; regressão tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - uma base nula alinhada com os eixos e a sua rotação de { "0.6" } rad dão defect, dim_spatial, dim_temporal, coupled_dim e p_st_norm idênticos; classify_direct_sum_null e classify_coupled_null - casos construídos de soma direta e genuinamente acoplados confirmam a decomposição de dimensões; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } matrizes de Fisher 9x9 construídas sobre { "18" } subespaços nulos, cada um em quatro rebases ortonormais aleatórios: defect, dim_spatial, dim_temporal e coupled_dim exatos; p_st_norm a menos de { "6.0e-15" }, limiar { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible para { "3" } pares de fornecedores face ao ajuste lstsq SVD SciPy independente em tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; fixtures + referência independente coerentes byte a byte através de scripts/gen_interop_ref.py sobre kernels públicos DE440/INPOP21a/EPM2021 via IMCCE calceph)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: o P⊥ de { "84" }×{ "84" } elemento a elemento, trace(P⊥) = parity_dim = { "52" } e rank(G) = { "32" }, normas de detetabilidade + indicadores, a forma quadrática do MDB cᵀWP⊥c + valor do MDB, e as contagens de deteção/identificação de block-spark para cada coligação de pares, reproduzidos face a uma referência independente numpy/scipy com rel<{ "1e-3" } abs<{ "1e-3" } e contagens inteiras exatas; entradas coerentes byte a byte através de examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } fatores de média MTIE e { "12" } TDEV numa série de holdover de relógio atómico à escala de chip registada de { "2" } 048 amostras com envelhecimento, flicker e temperatura, face a allantools { "2024.06" } até <{ "1e-12" } / <{ "1e-9" } em termos relativos, observado exato / { "1.1e-15" }; as mesmas curvas lidas de uma execução completa de telecom-timing que ingere o CSV); telecom_timing::tests (MTIE deslizante igual a allan::mtie em todas as janelas; MTIE e TDEV derivados à mão; MTIE monótono)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: ajuste no primeiro terço do registo, previsão da violação de um sigma a { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } e { "2.5" } ns, medida nos outros dois terços a partir de um ponto de sincronização a cada { "997" } s; limiar, fixado antes da primeira execução, de um fator de { "1.5" } em qualquer dos sentidos; rácios observados de { "0.84" } a { "1.03" }; um controlo, o desvio de Allan a um segundo lido como FM branco, falha por um fator de cerca de { "1 000" } e tem de falhar o limiar; uma mutação que reduz a metade o nível de FM branco faz falhar o teste); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz e BPSK({ "10" }) { "20.46" } MHz localizados numericamente na forma fechada; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — nulo da portadora, primeiro nulo a { "2.046" } MHz, centro do lobo { "1.023" } MHz, e o máximo exato a { "0.7590" } MHz face a uma resolução de Newton independente de tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, cada um a menos de { "0.02" } dB; q_values_match_kaplan_hegarty — CW na portadora Q = { "1" }, ruído de espectro adaptado Q = { "1.5" }, ruído plano de nulo a nulo Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — piso a menos de { "2" } % da variância sobre a taxa de amostragem, total de Parseval a menos de { "2" } %, largura de banda de ruído equivalente de Hann { "1.5" } bins; noise_like_synthesis_is_unbiased_through_welch — mediana de Welch menos modelo a menos de { "0.1" } dB através de uma ida e volta ci16_le; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (PSD de Welch face a scipy { "1.18.1" } signal.welch por bin até { "1e-12" } em termos relativos em { "27" } casos, observado { "6.0e-14" }; cinco gravações sigmf-python { "1.13.0" } descodificadas bit a bit de forma idêntica com metadados idênticos; gravações escritas pela crate relidas bit a bit de forma idêntica por sigmf-python e válidas segundo o esquema face a SigMF { "v1.2.6" })

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (baricentros 1800-2050 da Tabela { "1" } e { "3000" } BC-3000 AD da Tabela { "2" }, { "8908" } e { "21857" } épocas, pior RMS { "0.778" } do valor da Tabela { "8.10.1" }); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: a Terra através de AnalyticSolarSystem e icrf_to_ecliptic, RMS { "0.483" } do valor do EMB; icrf_positions_are_within_the_table_8_10_1_rms: posições ICRF dos corpos da Tabela { "1" } e da Terra, pior caso { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: a separação da série lunar, pior caso { "0.088" } deg e { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Regressão sem função de bloqueio: tests/solar_system_horizons_reference.rs

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } posições em { "200" } épocas UTC de 1973-2026 retiradas do hash de pré-registo; pior caso { "0.66" } do limiar, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (condicionado aos dados); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (baricentros de Mercúrio, Vénus, Marte, Júpiter e Saturno, o Sol e a Lua até ao centro da Terra, { "1576" } épocas cada em posições DE441 interpoladas, pior caso { "6.7e-9" } s face a { "1e-6" } s); declaração de exatidão sem função de bloqueio para o caminho analítico: tests/solar_system_light_time_preregistered.rs (RMS c dLT de { "0.17" } a { "0.30" } do limiar de posição da Tabela { "8.10.1" }); solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } épocas de { "1955" } a { "2044" }, { "574" } matrizes a menos de { "1e-9" } rad, pior caso Fobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } épocas de { "1961" } a { "2038" } nunca comparadas antes, { "574" } matrizes a menos de { "1e-9" } rad, pior caso Fobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } de { "84" } constantes dos catorze corpos diferem das da NAIF)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (todas as { "24" } linhas de RAAN e anomalia média até { "1e-9" } deg); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (a fórmula de posições do ICD e um Walker 24/3/1 são os mesmos { "24" } pares de nó e argumento de latitude); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (a passagem equatorial do traço no solo de todas as { "36" } posições GPS a partir de RAAN, argumento de latitude e do ângulo horário de { "100.765" } deg: { "35" } a menos de { "0.0108" } deg face a um limiar de arredondamento de { "0.015" } deg, e E3F a menos de { "0.06" } deg porque a própria linha E3F da tabela é inconsistente com o seu RAAN e argumento de latitude em cerca de { "0.06" } deg; a regressão nodal secular a menos de { "5" } % do valor de -0.0402 deg/dia da tabela); constellation::tests::walker_geometry_identities_are_exact (as três identidades de espaçamento para padrões delta e estrela até { "1 584" } satélites, até { "1e-9" } deg)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP mediana { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, média { "0.965" } face a { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } e { "0.96" }, limiar { "0.03" } em cada um, fixado antes da primeira execução; PDOP mediana { "1.795" } igual ou inferior ao { "1.815" } da Tabela B.3-1 para uma mistura degradada de 20-24 satélites; disponibilidade de { "100" } % global e no pior local face aos { "98" } % e { "88" } % da Tabela 3.8-1); constellation::tests::single_epoch_dop_matches_the_hand_computation (zénite mais três satélites a { "30" } deg de elevação: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } até { "1e-9" }, e igual a orbit::dop com um relógio comum)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) até { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } da potência no lobo principal para BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), e a forma fechada igual à quadratura até { "1e-7" } em { "10" }, { "15" }, { "20" } e { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — até { "1e-4" }, e a assíntota sqrt(B R_c / ({ "2" } pi^{ "2" })); bandlimited_dll_reduces_to_the_textbook_forms — BPSK({ "1" }) early-late coerente a { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms: { "0.0039564" } chips ({ "1.159" } m) a menos de { "1" } %, a forma não coerente igual a navsignal::dll_code_jitter_chips a menos de { "1" } %, o limite de espaçamento evanescente igual à sua forma fechada até { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form — desvios de { "0" } a { "3.2" } R_c a menos de { "0.01" } dB e -71.86 dB/Hz com desvio zero para BPSK({ "10" }); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz dentro dos { "32" } a { "34" } kHz publicados; Iridium ({ "1621" } MHz, { "780" } km) a menos de { "0.5" } kHz dos { "36" } kHz publicados

# text
seg-f1cdf8728c6b = Valores publicados: Doppler máximo do Xona Pulsar X1 de { "32" } a { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler do Iridium até +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). A rotação da Terra é omitida, o que desloca o valor em até cerca de { "2.3" } kHz; ambos os valores publicados são atingidos sem ela.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: todas as { "115" } linhas da Tabela { "5" }, de { "1" } GHz a { "1000" } GHz, cada coeficiente a menos de { "0.6" } do seu último dígito impresso; pior caso observado { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } casos em cinco locais, { "14.25" } e { "29" } GHz, { "0.001" } % a { "1" } %, a menos de { "1e-4" } dB; observado { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } casos em sete locais, { "14.25" } e { "20" } GHz, a menos de { "1e-5" } dB; observado { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } valores, { "28" } GHz a { "0" } deg e { "2" } GHz a { "45" } deg, ambas as classes, P de { "1e-7" } a { "0.998" }, a menos de { "0.001" } dB)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } até { "1e-12" }, amplificação L1/L2 e L1/L5 de { "2.978" } e { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f até { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } deg, Pulsar FOC polar { "1080" } km { "97" } deg, Pulsar FOC inclinada { "1080" } km { "53" } deg e GPS { "20180" } km { "55" } deg; velocidade orbital, velocidade máxima ECEF, velocidade relativa máxima e Doppler máximo da portadora nas bandas L1 e L5, { "20" } valores, cada um a menos de { "0.05" } %)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } e 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } e 1/61.1, BeiDou MEO 1/54.2, geoestacionário { "0.992" } e 1/126.2 com uma máscara de { "0" } deg, cada um a menos de { "0.005" } de w_R e { "0.5" } de 1/w_AC^{ "2" }; leo_weights_shift_toward_the_transverse_axes — ângulo de nadir do horizonte { "67.8" } deg a { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — quatro efemérides de difusão Galileo reais E10, E19, E24, E25 em tk = { "0" }, +/-600, +/-1800, +/-3600 s, cada eixo a menos de { "1" } mm do RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block — a menos de { "5" } mm após a trama binária Kshana e { "1" } mm após o bloco de estilo RINEX)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 para a cadeia ASCII { "123456789" }; crc24q_matches_the_rtcm_1005_example_frame — os três bytes de verificação 0x360B98 da trama de exemplo RTCM { "10403" } de tipo de mensagem { "1005" }, e zero sobre toda a trama)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (crescimento monótono de { "1" } a { "15" } minutos e melhoria de pelo menos três vezes aos { "15" } minutos); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (órbitas de dinâmica reduzida ITSG da TU Graz de GRACE-A, GRACE-C, Sentinel-2A e Sentinel-6A ajustadas em arcos de { "20" } e { "30" } min: RMS ao longo da órbita, transversal e radial de { "0.804" } a { "1.087" } e SISRE de { "0.716" } a { "0.809" } de Liu et al. { "2025" }, dentro de 1.5x; pesos SISRE a menos de { "0.0007" } da sua Tabela { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, mesmo estado inicial e mesma entrada de densidade: pior caso { "3.95" } mm dois corpos, { "3.92" } mm J2-J6 e EGM2008 até ao grau { "20" } e { "70" }, { "4.55" } mm EGM2008 de grau { "20" } com arrasto a { "400" } km, limiar { "0.02" } m ao longo de { "6" } h); verificação cruzada interna, não uma referência independente: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (quatro dias do artigo: rácios ao longo da órbita, transversal, radial e SISRE de { "0.755" } a { "1.138" } de Liu et al. { "2025" }, dentro de 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (oito dias reservados, dois arcos cada: { "0.683" } a { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — o valor L1 é o { "6.1278" } m do RTKLIB; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar em L1, L2 e L5 em { "4 320" } casos, pior caso { "7.0e-13" } m; Az em { "222" } conjuntos de coeficientes, incluindo todos nulos e as regras de { "400" } sfu, pior caso { "5.7e-14" } sfu; deriva UTC em { "50" } casos, pior caso { "3.6e-15" } s; os três casos de segundo intercalar em { "21 602" } instantes ao longo dos segundos intercalares reais de { "2015" } e { "2016" }, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: um satélite a { "780" } km e { "86.4" } deg voado durante um dia a { "1621" } MHz sobre quatro latitudes, máximo a menos de { "5" }% de { "36" } kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: um satélite de cada camada publicada, { "1080" } km a { "53" } e { "97" } deg, { "1593.3225" } MHz, o máximo da constelação dentro de { "32" } a { "34" } kHz sem alargamento ({ "33.6" } kHz, determinado pela camada de { "97" } deg; só a camada de { "53" } deg atinge o máximo de { "31.8" } kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m à mão a { "5" } MHz, { "45" } dB-Hz, { "0.1" } s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (configurações A e B, { "4040" } amostras: posições fixas à Terra a menos de { "6.8e-5" } m, limiar { "0.2" } m; contagens de satélites à vista idênticas em 4040/4040; DOP mediano a menos de { "2.3e-11" } em termos relativos, limiar { "1e-3" }; disponibilidade e média à vista idênticas); tests/earth_orbit_path_sgp4_erfa_oracle.rs (o caminho); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (ronda { "2" }, geometria em estados dados); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (conclusão da ronda 1 sobre a alegação completa, fixada)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: três cenários — estações estimadas numa nova data de campanha 2026-03-18 (vinculativo), estações fixas nessa data (controlo), estações estimadas em 2024-01-01 (o cenário da anterior falha em precisão dupla); cada sigma do datum, o número de condição e a direção mais fraca face a um limiar escalado pela condição, recalculado no teste a partir das sensibilidades exatas da referência independente; engine_inputs_match_the_committed_fixture: o jacobiano, os pesos e o projeto de Helmert registados são o que o motor constrói agora; record_engine_accuracy_against_a_factorisation_route: a banda de erro do motor e o diagnóstico de Cholesky NumPy fixados)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: quatro cenários — estações estimadas numa nova data de campanha 2026-06-09 (vinculativo), estações fixas nessa data (controlo), e as entradas com estações estimadas de 2026-03-18 e 2024-01-01; cada sigma do datum, o número de condição e a direção mais fraca face a um limiar em forma de raiz quadrada recalculado no teste a partir dos ingredientes exatos da referência independente; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } testes de biblioteca: o produto de Dekker igual ao resíduo da multiplicação-adição fundida em { "20 000" } pares, soma compensada de uma soma com cancelamento, R^T R igual a A^T A, atualizações sequenciais do filtro iguais a uma atualização em lote, o bloco final igual à raiz quadrada do complemento de Schur, a inversa triangular, a SVD de Jacobi, concordância com o datum espectral num caso bem condicionado, reexecuções idênticas bit a bit); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected e the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) face a tests/fixtures/maritime_trust/reference.json, regenerado por scripts/gen_maritime_trust_ref.py a partir do NMEA sintético escrito por examples/gen_maritime_trust_ref_inputs.rs; tolerâncias pré-registadas em tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (comparação com a referência independente pynmea2); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } códigos NACp, { "59" } linhas NIC); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } tramas); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } pontos, quatro tamanhos de célula); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } rotas, { "420" } troços, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } pontos); testes unitários de interference_map

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
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (vetores { "1" }, { "2" }, { "3" } e { "1024" } da RFC { "8032" } secção { "7.1" }; exemplos SHA-256 da FIPS 180-4; exato); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } casos); tests/evidence_pack.rs (testes de adulteração)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (a comparação pré-registada); evidence::tsa::tests (datas e horas civis, base64, a operação pública RSA); evidence::verify::tests::anchors_make_the_authority_checked (um token não assinado falha com âncoras; sem elas o relatório não se altera)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } testes: fixações da referência independente, bytes exportados, pior caso sobre todas as linhas, colunas de posição, velocidade local face à velocidade NED verdadeira, ângulos de Euler face a scipy, NMEA face a pynmea2); tests/interop_testbench.rs (as próprias idas e voltas do escritor)

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
seg-af826b47d00e = { "388" } linhas: { "176" } validadas externamente, { "208" } modeladas, { "4" } da responsabilidade do parceiro.

# text
seg-6bb40f180cf0 = <s1>Anterior</s1>Estado da validação

# text
seg-defb46c5bc80 = <s1>Seguinte</s1>Referência de capacidades
