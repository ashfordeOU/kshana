# docs--capability-map: translations (pt-BR)

# text
seg-76b323512350 = Sistemas de tempo

# text
seg-ee2e250497f9 = Exportação para test bench

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Fonte: <c1/>

# text
seg-891eb89a8801 = Mapa de capacidades: o que o Kshana faz, faz parcialmente e não faz

# text
# c1: POSITIONING.md
seg-f9b372e8832b = O Kshana é um <b>motor de evidências de desempenho e resiliência de PNT (posicionamento, navegação e temporização)</b>, não um conjunto completo de ferramentas de sistemas espaciais. Ele prioriza a temporização e o holdover, seu domínio mais bem validado (veja <a1><c1/></a1>). Esta página é o mapa honesto do escopo: para cada área de capacidade que um revisor de aquisição ou de pesquisa possa conferir, ela indica o status, o que realmente existe no código, o que está faltando e onde isso se situa no roteiro. O status é um destes:

# text
seg-1b3a49d09c7d = <b>completo</b>: implementado de ponta a ponta e validado até um nível indicado na linha;

# text
seg-0da2570a5ca3 = <b>parcial</b>: um modelo real, porém limitado (escopo explicitamente delimitado abaixo);

# text
seg-6e02edaa8f54 = <b>nenhum</b>: não modelado (fora do escopo atualmente).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Estes três são os únicos valores que a coluna de status assume. Eles classificam a <em>maturidade da capacidade</em>, que é um eixo diferente da classificação VALIDATED / MODELLED / PARTNER em <a1><c1/></a1>: aquela classifica a <em>proveniência da evidência</em>, linha por linha, e é verificada por máquina a partir de <c2/>.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Nada aqui é aspiracional: "parcial" nunca significa "quase pronto", significa "isto tanto e nada além". Veja também <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> e o registro de encerramento de afirmações exageradas <a4><c4/></a4> (cada afirmação exagerada histórica, como foi resolvida e uma verificação de CI (integração contínua) que a mantém resolvida).

# text
seg-b55f7e5a69cc = PNT central (onde o Kshana realmente atua)

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Status

# text
seg-2ee4023e3a27 = O que existe

# text
seg-25843dc03c73 = O que está faltando

# text
seg-331d2821d43f = Roteiro

# text
seg-724b1929b536 = Determinação de órbita e propagação

# text
seg-9aa33b4484ca = parcial

# text
# c1: ephemeris
# c2: src/ephemeris.rs
# c3: --export-oem
# c4: src/propagator.rs
# c5: forces::zonal_accel
# c6: J2..J6
# c7: integrate_dopri
# c8: propagate_dopri
# c9: solve_kepler_checked
# c10: Err
# c11: ForceModel::third_body
# c12: accel_at
# c13: src/ephem.rs
# c14: epoch_jd_tt + t/86400
# c15: third_body_accel
# c16: forces::srp_accel
# c17: ForceModel::solar_radiation
# c18: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c19: forces::conical_shadow
# c20: forces::drag_accel
# c21: ForceModel::drag
# c22: accel_rv
# c23: −½·ρ(h)·(C_D·A/m)·|v_rel|·v_rel
# c24: v_rel = v − ωₑ ẑ × r
# c25: ρ
# c26: forces::atmospheric_density
# c27: forces::relativistic_accel
# c28: ForceModel::relativity
# c29: β = γ = 1
# c30: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c31: 3μ²/(c²r³)·r̂
# c32: ≈1.9e-9
# c33: forces::lense_thirring_accel
# c34: ForceModel::lense_thirring
# c35: src/orbit_determination.rs
# c36: src/batch_ls.rs
# c37: [r, v]
seg-7f4957a488b7 = <b>SGP4/SDP4</b> sem dependências (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), validado a { "4.12" } mm contra todos os { "666" } vetores AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (posição <b>e</b> velocidade, esta última a { "1" } mm/s); kepleriano analítico + J2 secular; velocidade inercial exposta e levada <b>de ponta a ponta</b> por meio do <b>cenário <c1/></b> executável (<c2/>, acessível por CLI/Python/WASM/MCP (CLI: interface de linha de comando; WASM: WebAssembly; MCP: Model Context Protocol)): a cada passo ele emite o estado TEME (true equator, mean equinox) <b>e</b> GCRS (Geocentric Celestial Reference System) (posição + velocidade), a posição ITRF/ECEF (ITRF: International Terrestrial Reference Frame; ECEF: Earth-centred, Earth-fixed), a <b>projeção da trajetória no solo (ground track) do subsatélite</b> WGS-84 (WGS: World Geodetic System) (lat/lon/alt), e azimute/elevação/distância de estação + <b>taxa de variação da distância/Doppler</b> (a taxa radial de variação da distância coincide com a derivada verdadeira da posição, livre de ruído de JD (JD: data juliana), a { "6e-9" } m/s), e por meio da exportação de efemérides com velocidade em <b>OEM</b> (Orbit Ephemeris Message) do CCSDS (Consultative Committee for Space Data Systems) (<c3/>). Um <b>propagador numérico (Cowell)</b> (<c4/>) integra um modelo de forças de <b>gravidade zonal</b> configurável: o <b>campo zonal completo da Terra até o grau { "6" }</b> (<c5/>, o <c6/> publicado do EGM-96 (EGM: Earth Gravitational Model)), com a escolha de um integrador adaptativo, seja o RK4 (Runge–Kutta de quarta ordem) com <b>duplicação de passo</b>, seja o par embutido <b>Dormand–Prince RK5({ "4" })</b> (<c7/> / <c8/>, uma estimativa de erro embutida mais barata, com 7 avaliações, que satisfaz o mesmo critério de Kepler e concorda com o caminho RK4 a <{ "1" } m em uma órbita J2..J6), confrontado com <b>uma verdade analítica mais forte do que uma verificação cruzada numérica entre ferramentas</b>: a órbita sem perturbações reproduz a <b>solução de Kepler exata em variáveis universais com precisão submétrica em { "24" } h</b> (um critério mais apertado do que o "contra a referência < { "10" } m" do marco), a energia e o momento angular se conservam a ~{ "1e-9" } em termos relativos, a regressão nodal de J2 concorda com a taxa secular em forma fechada pela teoria de primeira ordem, verifica-se que a aceleração zonal é o <b>gradiente exato do seu próprio potencial</b> (e que se reduz à forma fechada de J2 validada com 666 vetores), e <c9/> <b>devolve <c10/> em vez de uma resposta errada</b> quando o Newton não converge (por exemplo, perto do perigeu com e = { "0.999" }). A gravidade de <b>terceiros corpos (Sol e Lua) conduzida pela época</b> é <b>ligada ao integrador variável no tempo</b> (<c11/> / <c12/>, com as efemérides de baixa precisão do Sol e da Lua de Montenbruck & Gill em <c13/>; nenhum kernel DE/SPK (DE: Development Ephemeris; SPK: kernel de efemérides planetárias) é necessário): cada avaliação do RHS (lado direito da equação) amostra as posições dos perturbadores na época avançada <c14/>, de modo que o Sol e a Lua se movem ao longo de suas órbitas durante a integração. Verifica-se que a perturbação é o gradiente exato do seu potencial perturbador, que se anula no geocentro e que tem as magnitudes típicas de LEO (órbita terrestre baixa) (~{ "5e-7" } m/s² do Sol, ~{ "1.1e-6" } m/s² da Lua); as efemérides do Sol atingem âncoras de J2000 derivadas à mão (distância do periélio, declinação de solstício de ~−{ "23" }°, movimento de ~{ "1" }°/dia) e as da Lua, seu envelope de perigeu/apogeu, distância média de ~{ "384 400" } km, limite de inclinação ≤ { "5.3" }° e retorno da direção após o mês sideral; e a ligação com a integração é comprovada <b>exata bit a bit</b> (o termo do RHS é igual a <c15/> na posição amostrada em t = { "0" } e t = { "1" } dia), com um deslocamento de época de um quarto de ano produzindo uma trajetória diferente. A <b>pressão de radiação solar</b> (SRP) usa o mesmo RHS conduzido pela época (<c16/> / <c17/>): o modelo de bola de canhão <c18/> com um fator de eclipse de umbra + penumbra <c19/> (ν suave ∈ [{ "0,1" }], verificado como decaindo por uma penumbra monotônica que se estende além do cilindro da umbra), verificada contra a pressão de livro-texto a 1 AU (AU: unidade astronômica) (≈ { "4.54e-6" } N/m²), a magnitude de ~{ "1.36e-7" } m/s² em LEO empurrando para longe do Sol, a queda com o inverso do quadrado (dobrar a distância ao Sol a reduz a um quarto), uma aceleração <b>exatamente nula</b> no cilindro da umbra, e um deslocamento propagado que escala ~linearmente com A/m. O <b>arrasto atmosférico</b> é o primeiro termo dependente da velocidade (<c20/> / <c21/> + o novo RHS <c22/> / com passagem de velocidade): arrasto quadrático <c23/> contra a atmosfera em co-rotação <c24/>, com <c25/> a <c26/> exponencial por partes de Vallado, verificado pela âncora de { "1.225" } kg/m³ ao nível do mar, um decaimento em LEO estritamente monotônico com uma altura de escala física de ~{ "58" } km, a magnitude de arrasto de ~{ "2e-6" } m/s² opondo-se à velocidade relativa, e a <b>assinatura de dissipação</b> (uma órbita de { "300" } km perde energia específica de forma monotônica e seu semieixo maior decai a ~km/dia limitados, enquanto a órbita no vácuo conserva a energia). A <b>correção relativística pós-newtoniana (Schwarzschild)</b> é o segundo termo dependente da velocidade (<c27/> / <c28/>): a forma <c29/> do IERS (International Earth Rotation and Reference Systems Service) <c30/>, o principal responsável pelo avanço relativístico do perigeu, verificada contra seu valor circular em forma fechada <c31/> (radial, para fora), sua razão de livro-texto <c32/> em relação ao problema de dois corpos em LEO, a forma simplificada à mão de velocidade radial e a <b>assinatura conservativa</b> (ela perturba a órbita, mas mantém o semieixo maior abaixo de um metro/dia, o oposto estrutural do arrasto). O termo de arrasto de referencial de <b>Lense–Thirring</b> (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) é a correção gravitomagnética além de Schwarzschild: opcional, ~{ "1" }–{ "2" } ordens de grandeza abaixo dele em LEO, verificado como se anulando sem a rotação da Terra e como ficando abaixo da magnitude de Schwarzschild. A <b>determinação de órbita</b> (OD, <c35/>) fecha o ciclo das observações de volta a um estado: um corretor de <b>lote de Gauss–Newton</b> (<c36/>) leva um <c37/> candidato ao melhor ajuste das distâncias de estações terrestres propagadas ao longo do arco (submétrico / mm·s⁻¹ a partir de distâncias sem ruído; ~{ "2" } m com um resíduo pós-ajuste no piso de ruído de { "5" } m, a assinatura de um ajuste de mínimos quadrados consistente), com uma variante recursiva <b>sequencial</b> sobre o filtro unscented

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = O modelo de forças padrão de Cowell traz apenas o campo zonal: o campo <b>tesseral</b> de alto grau do EGM2008 (Earth Gravitational Model { "2008" }) (<c1/>, grau/ordem { "70" }, com um carregador <c2/> para arquivos ICGEM (International Centre for Global Earth Models)) é composto apenas no mecanismo preciso de ajuste de efemérides (<c3/>; veja <a1><c4/></a1>); a densidade de arrasto é a exponencial por partes de Vallado, <b>estática</b> (independente da atividade solar), e <b>não</b> o NRLMSISE-00 (o modelo de atmosfera Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended; a cláusula de densidade termosférica < { "5" } %); a SRP é o modelo de <b>bola de canhão</b> com uma sombra geométrica <b>cônica de umbra + penumbra</b> (sem escurecimento de limbo solar, sem sombra de Terra oblata, sem forma/atitude do satélite); a relatividade cobre os termos de <b>Schwarzschild e de Lense–Thirring</b> (arrasto de referencial), ambos opcionais, mas sem ajuste de parâmetros PPN (PPN: pós-newtoniano parametrizado); <b>terceiros corpos/SRP usam as efemérides de baixa precisão (~{ "0.005" }° para o Sol, ~{ "0.3" }° para a Lua), e não a exatidão de um kernel DE/SPK</b>. Os níveis conservativos do modelo de forças (dois corpos → J2–J6 → Sol/Lua → SRP) são <b>VALIDATED contra o Orekit { "12.2" }</b> (pior caso { "0.08" } m em { "24" } h, <c5/>), e a determinação de órbita em lote/sequencial é <b>VALIDATED contra os estimadores do Orekit { "12.2" }</b> (<c6/>); o nível de arrasto e a fidelidade absoluta das entradas de efemérides/densidade permanecem MODELLED; não há verificação cruzada com o GMAT (General Mission Analysis Tool)

# text
seg-c66f25447fe9 = gravidade tesseral no modelo padrão de Cowell + arrasto NRLMSISE-00 + escurecimento de limbo solar + efemérides de nível DE + validação cruzada com o GMAT + medições de taxa de variação da distância/ângulo na OD e STM analítica (matriz de transição de estado): P2+

# text
# c1: src/timescales.rs
# c2: eraEra00
# c3: gstime
# c4: ephemeris
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: finals2000A
# c9: eop_finals2000a
# c10: kshana --eop <file>
# c11: EopSeries
# c12: precise_od
seg-fffd275219ff = <c1/>: API de data juliana (civil↔JD, MJD (data juliana modificada)), UTC↔TAI (UTC: Tempo Universal Coordenado; TAI: Tempo Atômico Internacional) por meio da tabela completa de segundos intercalares do IERS ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT: Tempo Terrestre), UT1 (Tempo Universal { "1" }, tempo de rotação da Terra) por meio de DUT1 (o tempo de rotação da Terra menos o Tempo Universal Coordenado) e o <b>Ângulo de Rotação da Terra</b> IAU-2000 (IAU: União Astronômica Internacional) (ERA validado bit a bit contra o vetor <c2/> do SOFA (Standards of Fundamental Astronomy)). A <b>aproximação DUT1≈{ "0" } do caminho SGP4 está explicitamente documentada</b> no ponto de chamada de <c3/> (um erro de GMST (tempo sideral médio de Greenwich) de ≤ ~{ "13" }″, bem dentro do erro do próprio modelo SGP4), e o cenário <c4/> aceita parâmetros explícitos <c5/>/<c6/>/<c7/> <b>ou uma série IERS <c8/> real incorporada</b> (<c9/> / <c10/>, interpolada pelo mesmo <c11/> que <c12/> usa), de modo que a projeção no solo (ground track) seja reduzida por meio do UT1 e do movimento polar reais do IERS, e não apenas dos escalares nominais

# text
# c1: f64
# c2: timescales::TwoPartJd
# c3: src/jd2.rs
# c4: Jd2
# c5: Sgp4::propagate_at(Jd2)
# c6: tests/jd2_sofa_time_oracle.rs
# c7: jd2::gmst82
# c8: cio::gcrs_to_itrs_matrix_jd2
# c9: orbit::Propagator::position_in_frame_jd2
# c10: two_part_jd
# c11: tests/jd2_earth_rotation_erfa_oracle.rs
# c12: Jd2
# c13: TwoPartJd
# c14: f64
# c15: two_part_jd
# c16: f64
# c17: jd2
# c18: timescales::tai_minus_utc_on_date
# c19: tests/jd2_pre1972_sofa_oracle.rs
# c20: f64
# c21: timescales::tai_minus_utc
# c22: src/eop_ls_ar.rs
# c23: EopSeries::with_ls_ar_prediction
# c24: tests/eop_prediction_beyond_table.rs
seg-d488e9db94e9 = Os caminhos de órbita terrestre ainda usam uma JD de <c1/> único (resolução de ~{ "50" } µs perto de { "2020" }; este, e não o algoritmo, é o piso de uma verificação cruzada por diferenças finitas); existe uma JD de duas partes (<c2/>, usada pelos caminhos radiométrico, CCSDS-TDM, do simulador de segmento terrestre e do sistema solar, e por <c3/> <c4/>) que é aplicada ao longo do SGP4 (<c5/>), à predição de passagens, à geometria e aos projetos Walker (validada contra o SOFA, <c6/>), e à rotação da Terra no caminho de órbita (<c7/>, <c8/>, <c9/>, o <c10/> opcional do cenário de efemérides; VALIDATED contra o ERFA, <c11/>), com conversões sem perdas entre <c12/> e <c13/>; os caminhos padrão de órbita terrestre mantêm a data de <c14/> único, a menos que <c15/> esteja definido, e a época do modelo de forças de Cowell permanece de <c16/> único de propósito (seu erro analítico de Sol/Lua é muito maior que um arredondamento de { "40" } µs); o UTC de segundo elástico anterior a 1972 ({ "1960" }–{ "1971" }) é modelado no caminho de duas partes (<c17/>, <c18/>, VALIDATED contra o ERFA, <c19/>), mas o <c21/> de <c20/> único ainda limita a { "10" } s antes de { "1972" }; um preditor de orientação da Terra por mínimos quadrados + autorregressivo (<c22/>, comparado com o Boletim A do IERS como um achado) agora pode estender uma série de EOP além de sua última linha (<c23/>, opcional; <c24/>), de modo que os argumentos de referencial além da tabela seguem a previsão em vez de serem limitados; a série padrão ainda limita, e nenhuma chave de cenário ativa ainda a predição

# text
seg-d59294cf367c = <b>concluído</b> (fundação); JD de duas partes até a rotação da Terra no caminho de órbita: <b>concluído</b> (opcional no cenário de efemérides) ; predição de EOP além da tabela: <b>concluído</b> (biblioteca, opcional); UTC anterior a 1972 no caminho de duas partes: <b>concluído</b>

# text
seg-798b3b5db6d6 = Referenciais

# text
seg-69930da8bc5a = completo

# text
# c1: src/frames.rs
# c2: src/precession.rs
# c3: (γ̄, φ̄, ψ̄, ε̄_A)
# c4: src/nutation.rs
# c5: nutation_iau2000a
# c6: nutation_matrix_2000a
# c7: nut00a
# c8: tools/gen_nut00a.py
# c9: iauNumat
# c10: teme_to_gcrs(r, v, jd_tt)
# c11: nut00a
# c12: nut00b
# c13: teme_to_itrf
# c14: polar_motion_matrix
# c15: iauPom00
# c16: x_p
# c17: y_p
# c18: src/cio.rs
# c19: X,Y
# c20: s
# c21: gcrs_to_cirs_matrix
# c22: gcrs_to_itrs_matrix
# c23: eraXys06a
# c24: eraC2ixys
# c25: eraEra00
# c26: tests/frame_reference_vectors.rs
# c27: ephemeris
seg-4b3fe53b3dcd = <c1/>: TEME↔ECEF baseado em GMST, geodésica WGS-84↔ECEF (exata + inversa iterativa, com precisão de máquina em todas as altitudes) e um observador geodésico de estação terrestre (azimute/elevação/distância); <b>precessão IAU { "2006" }</b> (<c2/>: os ângulos de Fukushima–Williams <c3/> + a matriz de viés-precessão GCRS↔média da data); <b>nutação IAU 2000A/2000B + cadeia completa TEME→GCRS</b> (<c4/>: a série <b>IAU 2000A completa</b>, com { "678" } termos lunissolares + { "687" } planetários, <c5/> / <c6/>, tabela gerada por máquina a partir da referência <c7/> do ERFA (Essential Routines for Fundamental Astronomy) por <c8/>, ao lado da série 2000B de 77 termos, argumentos de Delaunay, a matriz de nutação <c9/> do SOFA, a equação dos equinócios e <c10/> por meio de TEME→TOD→MOD→GCRS (verdadeiro da data, médio da data); ambas as séries validadas <b>bit a bit</b> contra os vetores de referência <c11/>/<c12/> do SOFA/ERFA, Δψ/Δε a { "1e-13" } rad); <b>movimento polar do IERS</b> PEF→ITRF (pseudo-fixo à Terra para terrestre) (<c13/> / <c14/>, <c15/> do SOFA, <c16/>/<c17/> fornecidos pelo chamador, um efeito de dezenas de metros no raio orbital); <b>redução IAU 2006/2000A baseada no CIO</b> (CIO: Origem Intermediária Celeste) (<c18/>: a cadeia GCRS↔CIRS↔ITRS livre de equinócio (CIRS: Sistema de Referência Intermediário Celeste; ITRS: Sistema de Referência Terrestre Internacional), com o CIP (Polo Intermediário Celeste) <c19/> a partir da matriz NPB (nutação-precessão-viés) 2006/2000A, a série de 66 termos do localizador de CIO <c20/>, <c21/>, o ângulo de rotação da Terra e o <c22/> completo, validada <b>bit a bit</b> contra os vetores <c23/>/<c24/>/<c25/> do SOFA). As transformações <b>de ponta a ponta</b> agora estão fixadas a um exemplo trabalhado publicado de referência, e não apenas à autoconsistência: contra o estado <b>Vallado</b> AIAA 2006-6753 (2004-04-06, com seus EOP (parâmetros de orientação da Terra) do IERS; <c26/>), TEME→PEF coincide a <b>{ "0.1" } mm</b>, TEME→ITRF a <b>{ "0.6" } mm</b>, o GCRS→ITRS completo por CIO a <b>{ "4" } mm</b>, e ECEF→geodésica reproduz lat/lon/alt do Exemplo 3-3 de Vallado até o último dígito publicado. A cadeia inteira é <b>acessível ao usuário</b> por meio do cenário <c27/> (posição ITRF/ECEF + projeção da trajetória no solo do subsatélite WGS-84 a cada passo)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = A cadeia padrão TEME→GCRS usa 2000B (~{ "1" } mas, abaixo de sua própria simplificação da rotação do referencial de velocidade); o caminho completo de < { "0.1" } mas (2000A) está disponível por <c1/>, e a redução rigorosa <b>CIO (X, Y, s)</b> está disponível por <c2/>. O caminho TEME legado usa o GMST IAU-1982 (convenção do SGP4). A verificação cruzada numérica independente com ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um kit de ferramentas de geometria planetária em Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) está <b>entregue</b> (<c3/>: <c4/> contra o GCRF→ITRF93 do ANISE (GCRF: Referencial Celeste Geocêntrico; ITRF93: Referencial Terrestre Internacional { "1993" }) em oito épocas de { "2020" }–{ "2023" }, ≤ { "0.86" } m no solo, ≤ { "3.6" } m em órbita de GNSS (sistema global de navegação por satélite)); é um crate independente, fora das verificações padrão de CI. <c5/> e <c6/> também são verificadas diretamente contra o ERFA em { "40" } épocas de { "1950" }–{ "2100" }, e a cadeia CIO aceita os deslocamentos do polo celeste do IERS dX, dY (<c7/>; <c8/>); os caminhos padrão ainda desprezam dX, dY. A matriz de verificação classifica esta linha como <b>VALIDATED</b> (vetores SOFA/ERFA + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + geodésica: <b>concluído</b> (verificado com Vallado); TEME→GCRS inercial: <b>concluído</b> (2000B + 2000A completa); ITRF com movimento polar: <b>concluído</b> (verificado com Vallado); GCRS→ITRS por CIO: <b>concluído</b> (verificado com Vallado)

# text
seg-7e3e210ca43c = Temporização e frequência

# text
# c1: src/filter_health.rs
# c2: filter_health
# c3: src/allan.rs
# c4: tests/allan_reference.rs
# c5: src/timetransfer.rs
# c6: src/holdover.rs
# c7: σ_x²(t) = q_wf·t + q_rw·t³/3 + q_drift·t⁵/20
# c8: clock_state
# c9: src/tpl.rs
# c10: cargo run --example tpl_jammertest
# c11: allantools
# c12: tests/mtie_reference.rs
# c13: tests/mdev_tdev_reference.rs
# c14: tests/gnss_denied_clock_holdover_reference.rs
# c15: telecom-timing
# c16: TELECOM-TIMING.md
seg-97de2d9d9ccf = Relógio de Kalman de dois estados com Q exata de van Loan (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) com uma <b>atualização de covariância estabilizada de Joseph</b> (semidefinida positiva sob razões Q/R extremas, verificada por Cholesky na CI) e um <b>monitor de saúde da consistência do filtro</b> (<c1/>): uma avaliação NIS/NEES (NIS: inovação normalizada ao quadrado; NEES: erro de estimação normalizado ao quadrado) de Monte Carlo contra bandas de confiança χ², exposta como <c2/> no JSON (JavaScript Object Notation) do resultado e como um cartão verde/âmbar no playground, com um teste de varredura de descasamento Q/R que prova que o monitor passa a <em>inconsistent</em> quando a sintonia está errada (Bar-Shalom §{ "5.4" }); estimadores sobrepostos de <b>ADEV (desvio de Allan), MDEV (desvio de Allan modificado), TDEV (desvio de tempo), HDEV</b> (desvio de Hadamard) + intervalos de confiança baseados em χ² com <b>graus de liberdade efetivos específicos do tipo de ruído</b> (formas fechadas da Tabela { "5" } do NIST SP { "1065" } para WPM/FPM/WFM/FFM/RWFM (WPM: modulação de fase branca; FPM: modulação de fase flicker; WFM: modulação de frequência branca; FFM: modulação de frequência flicker; RWFM: modulação de frequência por passeio aleatório), o conjunto que o Stable32 usa; a curva ADEV exportada identifica o tipo de lei de potência do registro a partir de sua inclinação MDEV e anexa uma banda de { "95" }% por τ — <c3/>), <b>validados numericamente contra os desvios de referência do Stable32 para o conjunto de dados canônico NBS14 a { "1e-4" }</b> (<c4/>) e o edf verificado de forma cruzada por um conjunto de Monte Carlo de FM (modulação de frequência) branca; uma FoM (figura de mérito) de holdover honesta, limitada pela grade; conjuntos de relógios; um <b>modelo de transferência de tempo bidirecional</b> com cancelamento de atraso recíproco + um piso de atraso diferencial não recíproco de FM por passeio aleatório (<c5/>, assinatura de Allan relatada); uma <b>calculadora de holdover de relógio sem GNSS</b> (<c6/>) que expõe o crescimento do erro em deriva de van Loan em forma fechada <c7/> como uma inversão voltada ao usuário de <em>holdover até o limiar</em> (por quanto tempo um relógio funciona livremente antes que seu erro de temporização exceda o orçamento), com classes representativas de relógios quânticos (rede óptica/íon aprisionado/íon de mercúrio): <b>modelada, não validada externamente</b>, verificada de forma cruzada contra a recursão de covariância de múltiplos passos de <c8/>, e declarando honestamente que, para um relógio muito estável, o holdover até um limiar apertado é <b>governado pelo piso de ruído vermelho de tau longo <em>assumido</em>, e não pelo ADEV citado</b> (use pisos medidos para obter um número defensável). Um <b>Nível de Proteção de Temporização condicional</b> (<c9/>) se apoia na mesma maquinaria de holdover para o caso de <em>spoofing</em>: um limite sobre o erro de tempo <b>não detectado</b> dada uma verificação cruzada independente (um piso de monitor de k-σ mais a variância de deriva de van Loan sobre a latência de detecção mais um tempo até o alarme de CUSUM (soma cumulativa)), calibrado em um <b>spoof real gravado</b> (JammerTest { "2024" }, Zenodo { "15911589" }) e reproduzível por meio de <c10/>. Composição <b>modelada</b>, condicionada à detecção: não existe um limite <em>incondicional</em> finito (uma rampa suficientemente lenta escapa de um único monitor auxiliado por relógio). O <b>erro máximo de intervalo de tempo (MTIE)</b> e o <b>TDEV</b> são VALIDATED contra <c11/> (<c12/>, <c13/>), e a inversão da variância de deriva do holdover é VALIDATED contra o SciPy (<c14/>); o tipo de cenário <c15/> os aplica às máscaras G.8272 / G.8272.1 / G.8273.2 / G.8271.1 do ITU-T (União Internacional de Telecomunicações, Setor de Normalização das Telecomunicações); veja <a1><c16/></a1>

# text
seg-cf16b15c0a27 = edf completo pelo algoritmo de Greenhall (as formas fechadas simples têm viés limitado, mas são mais grosseiras que o BasicSum exato) e identificação de misturas de múltiplos ruídos

# text
seg-d35d1a9e0ed3 = edf exato + identificação de ruído misto: P2

# text
seg-cdfb50bca79e = Processamento GNSS / PNT

# text
# c1: gnss-sim
# c2: src/gnss_sim.rs
# c3: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c4: gnss_measurements[]
# c5: Propagator
# c6: rinex
# c7: scenarios/orbit-rinex.toml
# c8: pvt
# c9: src/pvt.rs
# c10: −TGD
# c11: tests/pvt_abmf.rs
# c12: scenarios/pvt-abmf.toml
seg-733cf51a8c5e = Uma <b>simulação de pseudodistância no domínio da medição</b> (tipo de cenário <c1/>, <c2/>): por satélite visível, ela sintetiza <c3/> e o Doppler em L1, com a <b>ionosfera monofrequência de Klobuchar</b> (IS-GPS-200 (IS: Especificação de Interface; GPS: Sistema de Posicionamento Global) §{ "20.3.3.5.2.5" }) e a <b>troposfera zenital de Saastamoinen</b> (Davis { "1985" }) projetadas pela <b>função de mapeamento de Niell ({ "1996" })</b>, cada modelo testado em unidade contra cálculo manual, e então alimenta os resíduos ao <b>RAIM instantâneo</b> (monitoramento autônomo de integridade pelo receptor) para obter HPL/VPL (HPL: nível de proteção horizontal; VPL: nível de proteção vertical) por época, e emite um array <c4/> (pseudodistância, Doppler, C/N₀, correções de iono/tropo por SV (veículo espacial, ou seja, um satélite)). Além disso, DOP/disponibilidade (DOP: diluição de precisão) e RAIM de separação de soluções a partir de órbitas; <b>ingestão de NAV multi-GNSS RINEX (Receiver Independent Exchange Format) { "3" }</b> (GPS/Galileo/QZSS/BeiDou (QZSS: Sistema de Satélites Quase-Zenitais do Japão) via IS-GPS-200, GLONASS (Sistema Global de Navegação por Satélite da Rússia) por vetor de estado) interpretada → posição ECEF do SV e viés do relógio, utilizável como fonte <c5/> de primeira classe E como bloco <c6/> de constelação embutido (<c7/>); <b>ingestão de OBSERVAÇÃO RINEX { "3" }</b> (espera-se que o layout de observação { "4.00" } seja interpretado, mas nenhum arquivo { "4.00" } foi exercitado; os arquivos de NAVEGAÇÃO RINEX { "4" } são recusados pelo nome em vez de decodificados incorretamente); um <b>solucionador de posicionamento por ponto único</b> (tipo de cenário <c8/>, <c9/>) que transforma pseudodistâncias de código RINEX reais + efemérides transmitidas em uma <b>posição do receptor</b> por mínimos quadrados ponderados iterados: correção de Sagnac/rotação da Terra, relógio do satélite transmitido com <c10/>, a <b>combinação livre de ionosfera de dupla frequência L1/L2</b> (ou Klobuchar de frequência única), troposfera de Saastamoinen/Niell, ponderação por elevação, DOP e RAIM instantâneo, <b>validado em dados reais do IGS (International GNSS Service)</b> (estação ABMF, Guadalupe, 2018-05-13) a <b>{ "5.7" } m de RMS (raiz do valor quadrático médio) 3-D / { "1.1" } m horizontal</b> contra a coordenada levantada da estação (<c11/>, <c12/>); e leitura/escrita de órbitas precisas SP3 (Standard Product { "3" }, o formato de órbitas precisas)

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = Um motor de posicionamento por <b>código</b> e, a partir da { "0.36" }, processamento de fase da portadora em observações reais: o solucionador <c1/> calcula uma posição real a partir de medições reais de código (posicionamento por ponto único, nível de metro, com a combinação livre de ionosfera de dupla frequência); <c2/> faz RTK de linha de base curta em código e fase GPS reais de dupla frequência (diferenças duplas, um filtro de Kalman float, fixação de ambiguidade inteira LAMBDA com teste de razão, <c3/>), e um filtro PPP float estático é executado em código e fase reais com órbitas e relógios finais do IGS. Ambos são VALIDATED contra coordenadas ITRF2020 publicadas de estações do IGS (WTZR/WTZZ, <c4/>, <c5/>, limiares fixados antecipadamente); o que continua ausente é a resolução de ambiguidade inteira em PPP, o RTK cinemático ou em rede e a operação em tempo real. O alisamento de portadora de Hatch é um achado MODELLED fixado (seus limiares fixados antecipadamente não foram atingidos). O tipo de cenário <c6/> executa um filtro PPP float sobre medições que ele mesmo simula, para estudos de convergência; o pacote direto <c7/> continua sendo um simulador a partir da verdade de referência; BeiDou-GEO (GEO: órbita geoestacionária) excluído

# text
seg-61b43da61326 = Fixação de ambiguidade em PPP, RTK cinemático ou em rede, operação em tempo real: use RTKLIB/gLAB (RTKLIB: uma biblioteca de código aberto de posicionamento cinemático em tempo real)

# text
seg-820a5f1f7e3b = Fusão de sensores / navegação estimada (dead-reckoning) com INS (sistema de navegação inercial)

# text
# c1: src/inertial/{attitude,mechanization,imu_errors}.rs
# c2: src/fusion/pack.rs
# c3: kind = "gnss-ins"
# c4: src/fusion/{gnss_ins_ekf,closed_loop}.rs
# c5: inertial
# c6: update_tightly_coupled
# c7: fuse_tightly_coupled
# c8: src/fusion/tightly_coupled17.rs
# c9: q_va
# c10: src/fusion/hybrid_ukf.rs
# c11: kind = "hybrid-ukf"
# c12: q_va
# c13: clock_state::q_from_allan
# c14: q_wf
# c15: q_rw
# c16: gnss-ins
# c17: [imu_*.error_model]
seg-4181becfd059 = <b>Biblioteca strapdown de 3 eixos</b> (<c1/>): atitude por quatérnios com compensação de coning/sculling, mecanização NED (norte-leste-baixo) completa (taxa da Terra + taxa de transporte, gravidade de Somigliana WGS-84) e um modelo determinístico de erros de IMU (unidade de medição inercial) (<b>fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa</b> modelados). O navegador strapdown agora está <b>ligado a um pacote GNSS/INS fracamente acoplado executável</b> com uma figura de mérito (<c2/>, <c3/>): a mecanização de três eixos é disciplinada pelo <b>EKF de estado de erro de 15 estados</b> (filtro de Kalman estendido) (<c4/>, realimentação de posição/velocidade/atitude/viés) enquanto o GNSS está disponível, e depois segue em deriva durante a interrupção, substituindo o reajuste à verdade de referência por fusão genuína e relatando o erro horizontal fundido contra a deriva do INS livre em malha aberta. O pacote <c5/> legado separado ainda executa o orçamento <b>escalar de 1 DOF (DOF: grau de liberdade)</b> com reajuste à verdade de referência. Uma atualização de <b>pseudodistância fortemente acoplada</b> (<c6/> / <c7/>) também está implementada: ela forma a inovação no domínio da distância (jacobiana de linha de visada em δp) e continua corrigindo com <b>menos de quatro satélites</b>, onde uma solução PVT (posição, velocidade e tempo) fracamente acoplada não existe. Um <b>filtro de Kalman unscented (UKF) GNSS/INS fortemente acoplado de 17 estados completo</b> (<c8/>) carrega posição, velocidade, erro de atitude, vieses de acelerômetro e de giroscópio e o relógio do receptor (viés + deriva), com <b>navegação estimada (dead-reckoning) quântica CAI (CAI: interferômetro de átomos frios)</b>: o ruído de processo de passeio aleatório de velocidade é o <c9/> derivado do acelerômetro de átomos frios, mantendo uma interrupção de 120 segundos limitada a algumas centenas de metros (contra os quilômetros de um INS livre de classe de navegação). Este UKF de 17 estados agora está <b>exposto como um cenário executável</b> (<c10/>, <c11/>, acessível por CLI/Python/WASM/MCP): os <b>{ "15" } estados de erro do INS</b> são aumentados com a <b>correção de viés do acelerômetro derivada do CAI</b> (o interferômetro de átomos frios define o piso de passeio aleatório de velocidade <c12/>) e um <b>relógio de 2 estados de fase + frequência</b> cujo ruído de processo vem do <b>motor de relógio por parâmetros q</b> (<c13/>, perfil de Allan → <c14/>/<c15/>), conduzido pelo modelo de erro do CAI delimitado por limites, de modo que a execução demonstre a hibridização de curto prazo da IMU clássica + longo prazo quântica. Sua figura de mérito é a <b>autoconsistência do filtro</b>: <b>NEES + brancura da inovação (NIS)</b> agregados sobre um conjunto de Monte Carlo contra suas bandas χ² de { "95" }% (o filtro casado fica dentro das bandas; um filtro mal sintonizado é sinalizado, um critério verificável de forma objetiva). <b>Esta é uma afirmação de AUTOCONSISTÊNCIA sob o ruído modelado, NÃO uma garantia de exatidão no mundo real</b>: as entradas de CAI/relógio são delimitadas/modeladas, o hardware CAI pertence ao parceiro, e nada aqui implica TRL (nível de maturidade tecnológica)>{ "3" }, herança de voo ou validação externa. O modelo determinístico de erros de IMU é <b>configurável por sensor a partir do arquivo de cenário <c16/> TOML</b> (Tom's Obvious Minimal Language) (<c17/>: fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa), assumindo por padrão uma fonte de viés constante pura quando omitido

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = O acoplamento forte é <b>apenas por pseudodistância</b> (fase da portadora está no roteiro); o cenário <c1/> usa uma <b>única trajetória nivelada de velocidade constante</b>, na qual os estados de erro de atitude e de viés da IMU são apenas fracamente observáveis, de modo que a consistência NEES é avaliada sobre o <b>subconjunto estimável</b> (posição, velocidade, relógio = { "8" } estados); a observabilidade completa de 17 estados exige uma trajetória com manobras (roteiro); o par viés do acelerômetro/inclinação em acoplamento fraco é pouco separável, portanto a calibração por viés não é afirmada; o modelo de erros de IMU omite a retificação de vibração e a deriva por gradiente de temperatura; o UKF de 17 estados e os caminhos fortemente acoplados são <b>autovalidados</b> (integração analítica de velocidade constante, convergência do auxílio GNSS, recuperação de viés, o limite de interrupção de 120 s limitado pelo CAI e a referência independente de consistência χ² de NEES/NIS); a <b>mecanização</b> strapdown em si é VALIDATED contra o NaveGo v1.4 (<c2/>: atitude idêntica bit a bit, velocidade/posição dentro de limites analíticos nomeados), mas nenhuma validação cruzada em nível de filtro (NaveGo ou o conjunto de dados de veículo KF-GINS) foi executada

# text
seg-5d4529365f46 = acoplamento forte com fase da portadora, observabilidade completa de 17 estados com trajetória de manobras, biblioteca de trajetórias, validação cruzada em nível de filtro com NaveGo/KF-GINS: <b>P2</b>

# text
seg-7d33171c5e26 = <b>Integridade / RAIM / ARAIM</b> (monitoramento autônomo avançado de integridade pelo receptor)

# text
# c1: src/raim.rs
# c2: araim_raim
# c3: P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)
# c4: araim_dual_raim
# c5: P_const = 0
# c6: araim_raim
# c7: IntegritySupportMessage
# c8: integrity
# c9: stanford_svg
# c10: PL=error
# c11: ARAIM_REFERENCE.md
seg-fd0afb948d1f = <b>RAIM instantâneo real</b> em <c1/>: solução de mínimos quadrados + detecção de falhas por χ² dos resíduos (limiar exato a partir de um χ² de gama incompleta sem dependências) e <b>HPL/VPL baseados em inclinação</b> (pbias a partir de um χ² não central para os P_fa/P_md configurados); <b>RAIM de separação de soluções (MHSS)</b> com detecção/identificação de falhas; <b>orçamento de risco de integridade (P_HMI) do ARAIM</b> (<c2/>) que resolve o menor HPL/VPL cujo <c3/> somado satisfaz uma alocação explícita de risco de integridade, o <b>modo de falha em toda a constelação para duas ou mais constelações</b> (<c4/>, ARAIM TN (nota técnica) da UE (União Europeia) / DO-316; <c5/> ⇒ <c6/> bit a bit), uma <b>mensagem de suporte à integridade</b> explícita (<c7/>: σ_URA/σ_URE/b_nom/P_sat/P_const, com os valores de referência GPS+Galileo do WG-C (WG: Grupo de Trabalho)), além de um <b>diagrama de integridade de Stanford(-ESA, a Agência Espacial Europeia)</b> (o tipo de cenário <c8/> e um renderizador independente <c9/> das quatro zonas + fronteira <c10/>). Documentado de ponta a ponta em <a1><c11/></a1>. Além disso, a autoconsistência de filtro da FoM do cenário (limite de k-σ)

# text
# c1: integrity
# c2: integrity_fom
# c3: [integrity]
# c4: raim::snapshot_raim_fde
# c5: raim_fde
# c6: tests/integrity_snapshot_raim_rtklib_oracle.rs
# c7: src/araim_reference.rs
# c8: tests/integrity_araim_stanford_oracle.rs
# c9: raim::araim_raim
# c10: araim_subset_raim
# c11: add_v42_protection_levels_to_order
# c12: araim_dual_raim
# c13: araim_dual
# c14: scenarios/araim-gps-galileo.toml
# c15: araim_dual_constellation_availability
# c16: tests/igs_real_data.rs
# c17: tests/araim_dual_real_data.rs
# c18: xval/araim-m3/
seg-f5fa7c20d28d = O RAIM é acessível pelo tipo de cenário <c1/> e ({ "0.36" }, opcional) ao lado da FoM de relógio/holdover como um bloco <c2/> separado (<c3/>: RAIM instantâneo em um céu predefinido a partir de um local declarado, indisponível enquanto o GNSS está negado; MODELLED), nunca incorporado à FoM de holdover, que continua relatando autoconsistência; o RAIM instantâneo traz <b>FDE</b> (detecção e exclusão de falhas) de um único satélite (<c4/>, VALIDATED contra o RTKLIB <c5/> em <c6/>); a separação de soluções de múltiplas hipóteses do ARAIM ADD v4.2 com determinação de subconjuntos de vários satélites está em <c7/> (VALIDATED contra o Stanford MAAST, <c8/>), mas o orçamento <c9/> de sigma uniforme ainda cobre apenas falhas de um único SV e de toda a constelação e não é aderente à norma ADD ({ "0.36" }, opcional: falhas simultâneas em subconjuntos de vários SVs pela regra de subconjuntos do ADD v4.2 generalizada além de pares, <c10/>, <c11/>; MODELLED, sem execução do MAAST além de pares), e a exclusão de vários SVs não é modelada; e <c12/> está ligado ao executor de cenários TOML por meio do sinalizador <c13/> (<c14/>), com um caminho de disponibilidade por época <c15/>; os núcleos instantâneo/MHSS/ARAIM são exercitados em <b>geometria real de órbita precisa (SP3) do IGS</b> (<c16/>) e em <b>TLEs reais de GPS+Galileo do Celestrak</b> (<c17/>, com todos os satélites propagados até uma época UTC comum, a época de TLE (conjunto de elementos de duas linhas) mais recente do conjunto, 2026-06-07T07:{ "21" }:{ "04" }, para um usuário de { "400" } km com inclinação de { "45" }° em { "24" } h: a disponibilidade sob um VAL (limite de alerta vertical) de { "12" } m / HAL (limite de alerta horizontal) de { "10" } m é { "0.993" } só com GPS, { "1.000" } com GPS+Galileo combinados e { "0.990" } no modo duplo robusto a falhas de constelação; o valor publicado antes aqui, { "0.21" }→{ "0.67" } com o modo robusto "limitado", veio da propagação de cada satélite a partir da sua própria época de TLE, um céu que nunca existiu, e está retirado); a comparação anterior da "Tabela A-3 do EU-ARAIM-TN" está retirada (sem fonte pública), e uma reprodução das entradas de URA máxima do Marco { "3" } do ARAIM do WG-C UE-EUA, públicas (Tabelas { "5" } a { "7" }, linhas Depleted e Baseline), é tentada em <c18/> sob desvios declarados (MODELLED, veja INTEGRITY.md); não certificado DO-229/ARAIM

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = ARAIM com múltiplas falhas (ADD v4.2): <b>concluído</b>; subconjuntos de vários SVs em <c1/> + paridade com o gLAB no domínio do receptor + ligação à FoM: <b>P2</b> (veja <a1><c2/></a1>)

# text
seg-7244b585a932 = Modelagem de ameaças de spoofing / jamming

# text
# c1: spoof
# c2: src/spoof.rs
# c3: src/detection.rs
# c4: P_fa
# c5: P_md
# c6: 1 − P_md
# c7: jamming
# c8: src/jamming.rs
# c9: Q
# c10: availability_under_jamming
# c11: src/spoof_monitors.rs
# c12: parity_raim_test
# c13: AgcMonitor
# c14: SqmMonitor
# c15: fuse_spoof_layers
# c16: CombinedSpoofDetector
# c17: evaluate
# c18: spoof-detect
# c19: src/spoof_detect.rs
# c20: tests/spoof_texbat_validation.rs
seg-0cf86b61224c = Um <b>detector estocástico de spoofing de tempo</b> (tipo de cenário <c1/>, <c2/> + <c3/>): quatro formas de injeção (rampa linear, salto em degrau, meaconing, repetição/replay) contra um monitor auxiliado por relógio com um <b>teste de energia χ²₁ bilateral / de Neyman–Pearson</b>, com o limiar de detecção definido a partir de um orçamento-alvo de alarmes falsos <c4/>, e a <b>probabilidade de não detecção <c5/> relatada tanto em forma fechada quanto por Monte Carlo</b> (as duas concordam a alguns ×1/√N); a figura de mérito de segurança é <c6/>. Além disso, um <b>modelo de jamming por orçamento de enlace</b> (tipo de cenário <c7/>, <c8/>): razão entre jammer e sinal a partir da geometria (perda de propagação no espaço livre + ganho da antena de recepção por direção), a <b>equação padrão de C/N₀ efetivo anti-jam</b> (ganho de processamento de desespalhamento + fator de separação espectral <c9/>; Kaplan & Hegarty §{ "9.4" }), perda de travamento por satélite em um limiar de rastreamento configurável e uma figura de mérito <c10/> sobre uma constelação Walker. Além disso, uma <b>suíte multicamada de monitores de spoofing de RF/medição (RF: radiofrequência)</b> (<c11/>): um teste de paridade de <b>consistência RAIM de vários satélites</b> (<c12/>, SOS (soma dos quadrados) ponderada dos resíduos contra um limiar χ²(m−{ "4" }); e ele sinaliza corretamente que um viés de modo comum é invisível ao RAIM), um <b>monitor de AGC (controle automático de ganho)</b> (<c13/>, excesso de potência recebida acima do piso esperado), um <b>monitor de qualidade do sinal / SQM (monitoramento da qualidade do sinal)</b> (<c14/>, desequilíbrio dos correladores Early/Late) e um combinador de fusão de camadas (<c15/>). Eles se compõem em um <b><c16/> integrado</b> cujo <c17/> ingere uma época de observáveis (geometria + resíduos, potência do AGC, taps Early/Late) e executa as três camadas pela fusão ponderada em uma única chamada, devolvendo os diagnósticos por camada; ele é exposto como o <b>cenário <c18/></b> executável (<c19/>, acessível por CLI / Python / playground, JSON + SVG (Scalable Vector Graphics)) e <b>caracterizado contra os parâmetros publicados dos cenários do TEXBAT (Texas Spoofing Test Battery)</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" }; <c20/>), reproduzindo o padrão documentado de detectabilidade, inclusive os resultados negativos: o ds2 superpotente capturado por AGC + SQM, o ds3 de potência igualada só pelo SQM, o ds4 de empurrão de posição pelo RAIM, e o ds7 de potência igualada com fase da portadora alinhada deixado (corretamente) ao detector auxiliado por relógio

# text
# c1: jamming
# c2: [crpa]
# c3: src/crpa.rs
# c4: [terrain]
# c5: src/jamming_terrain.rs
# c6: [acquisition]
# c7: [front_end]
# c8: src/jamming_rx.rs
# c9: src/iq/channel/multipath.rs
# c10: src/iq/channel/land_mobile.rs
# c11: src/iq/frontend/agc.rs
# c12: jamming
# c13: Q
# c14: navsignal
# c15: CombinedSpoofDetector
seg-e423ffff332b = O tipo de cenário <c1/> é um <b>orçamento de enlace</b>: ele não tem multipercurso nem dinâmica de AGC no tempo. Desde a { "0.36" } ele aceita quatro seções opcionais: <c2/>, um feixe de arranjo adaptativo por canal (anulação de direção ou MVDR a partir de <c3/>, verificado contra um recálculo independente em numpy; MODELLED), e <c4/>, a perda por difração em gume de faca único do caminho do jammer sobre um bloco SRTM (<c5/>, ITU-R P.526-15 §{ "4.1" }, verificada contra um recálculo independente em numpy em um bloco real; MODELLED, apenas um gume de faca), <c6/>, a histerese entre aquisição e rastreamento, e <c7/>, a leitura estabilizada do AGC e a perda do quantizador do ADC para entrada gaussiana (<c8/>; sinalizada como não válida para jammers não gaussianos; MODELLED). O multipercurso especular, o desvanecimento em móvel terrestre e o AGC existem na camada IQ (<c9/>, <c10/>, <c11/>) e não estão ligados ao tipo de cenário <c12/>; a tabela <c13/> de separação espectral guarda os valores de livro-texto por tipo (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde a { "0.36" }), <b>fixados aos coeficientes derivados das densidades espectrais de potência (PSD)</b> em <c14/> (veja a linha de sinal de navegação). O detector de spoofing auxiliado por relógio é de relógio único; os monitores de RF/medição agora estão integrados (<c15/>) e <b>caracterizados contra os <em>parâmetros</em> publicados dos cenários do TEXBAT</b> (Humphreys et al.); o que resta é a validação contra os vetores <b>brutos</b>: amostras IQ (fase/quadratura) do TEXBAT (que exigem um front-end de aquisição/rastreamento SDR (rádio definido por software) que o kshana não tem, por ser um simulador, não um receptor) ou um cenário Spirent licenciado, um desdobramento documentado

# text
seg-34e1b6a6b738 = auxiliado por relógio + <b>detector combinado</b> integrado de consistência RAIM multi-SV + AGC + SQM + caracterização com parâmetros do TEXBAT: <b>concluído</b>; validação com vetores brutos (IQ do TEXBAT / Spirent licenciado): desdobramento futuro

# text
seg-557448077fb0 = Modulação do sinal de navegação e desempenho de rastreamento de código

# text
# c1: src/navsignal.rs
# c2: κ = 2/(3R_c)
# c3: κ = ∫ G_s(f)G_i(f) df
# c4: Q
# c5: jamming
# c6: Q = 1/(R_c·κ)
# c7: CodeFamily
# c8: 1/L
# c9: t(n)/L
# c10: φ(2ⁿ−1)/n
# c11: n mod 4 = 0
seg-22893b9a2c7a = <c1/>: o <b>nível do sinal</b> entre o orçamento de enlace e o domínio da medição. <b>Densidades espectrais de potência</b> de área unitária para <b>BPSK-R(n)</b> (modulação por deslocamento de fase binária, chips retangulares) e <b>BOC-seno(m,n)</b> (portadora com deslocamento binário) (validadas na CI para área unitária, para a forma fechada do coeficiente de separação espectral (SSC) próprio do BPSK <c2/> e para a divisão espectral do BOC: nulo na portadora, picos em ±f_s); o <b>coeficiente de separação espectral</b> <c3/>, que agora <b>deriva o <c4/> anti-jam</b> usado por <c5/> a partir dos espectros reais do sinal e do jammer (<c6/>) em vez de uma constante representativa (a referência de banda larga é verificada de forma cruzada na CI); a <b>largura de banda RMS (de Gabor)</b> (BOC > BPSK: a medida de informação de distância / de Cramér–Rao); o <b>jitter de ruído térmico do rastreamento de código por DLL (malha de travamento de atraso) coerente early–late</b> (Kaplan & Hegarty §{ "8" }; ~submétrico para o C/A a { "45" } dB-Hz, monotônico em C/N₀); e o <b>envelope de erro de multipercurso</b> (EML (early-minus-late) coerente, obtido localizando o zero do discriminador composto; supressão do correlador estreito verificada). Uma camada de <b>compromisso de projeto de códigos de distância</b> (<c7/>) acrescenta o lóbulo lateral da autocorrelação periódica de sequências m/Gold (<c8/> para uma sequência m) e o <b>limite de correlação cruzada de Gold</b> de três valores <c9/>, reproduzindo a correlação cruzada de Gold publicada do <b>GPS C/A de −{ "23.9" } dB</b> (uma âncora externa) e a contagem de sequências m <c10/>, além da inversão entre comprimento do código e distância não ambígua; as garantias de Gold devolvem honestamente <em>None</em> onde não existe par preferencial (<c11/>), em vez de relatar um limite que não vale.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Desde a { "0.31.0" }, a <b>camada IQ</b> separada (<c1/>, os comandos <c2/>; projeto em <a1><c3/></a1>) acrescenta uma cadeia de receptor por software: aquisição por FFT (transformada rápida de Fourier), um banco de rastreamento multicanal com DLL/PLL/FLL (malhas de travamento de atraso, de fase e de frequência), filtragem de front-end e quantização de 1 a 14 bits, e transmissão contínua (streaming) de conjuntos de dados gravados. Um receptor por software independente recupera a verdade de referência injetada em suas cenas, e os códigos GPS L1 C/A e os bits LNAV (mensagem de navegação legada) são idênticos bit a bit aos do gps-sdr-sim. Ainda falta: os discriminadores das malhas supõem o triângulo de correlação BPSK ideal, de modo que não há resolução da ambiguidade de rastreamento do BOC; os modelos de canal e de malha são MODELLED, verificados contra formas fechadas e a verdade de referência injetada, <b>e não contra IQ de campo medido</b>; apenas malhas escalares (sem rastreamento vetorial). O projeto de <b>hardware</b> de antena/carga útil de RF (diagramas de radiação, front-end) está deliberadamente fora do escopo: é o papel de um parceiro de carga útil.

# text
seg-a62a0d9aa1d0 = ambiguidade do BOC + validação da camada IQ com IQ de campo: P2+

# text
seg-6b974aba070f = Física de sensores quânticos de PNT

# text
# c1: src/inertial/quantum_imu.rs
# c2: Φ = k_eff·a·T²
# c3: σ_Φ = 1/(C√N)
# c4: q_va
# c5: |H(ω)|
# c6: coriolis_phase
# c7: 2Ω×v
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: QuantumNavBudget
# c11: ½·b·t²
# c12: AccelModel
# c13: QUANTUM.md
seg-3773b241a9e5 = A maioria dos sensores usa <b>coeficientes publicados de Allan/orçamento de ruído</b> (CSAC, óptico), <b>mais um acelerômetro de interferômetro de átomos frios (CAI) a partir de primeiros princípios</b> em <c1/>: a fase de Mach–Zehnder de três pulsos <c2/>, o ruído de projeção quântica (shot) <c3/>, a PSD de passeio aleatório de velocidade derivada <c4/> que a pilha inercial consome, o decaimento de contraste, a função de transferência de vibração <c5/> + variância de PSD branca e, agora, os sistemáticos de <b>Coriolis/rotação</b> (<c6/>, viés equivalente <c7/>) e de <b>deslocamento luminoso AC-Stark (AC: corrente alternada)</b> (<c8/>, cancelamento simétrico) + uma <b>varredura de deriva</b> do tempo de ciclo (<c9/>), e um <b>orçamento de erro de navegação estimada (dead-reckoning) inercial quântico composto</b> (<c10/>) que reúne o passeio aleatório de velocidade de ruído branco do CAI com o viés residual (<c11/>, verificado de forma cruzada contra o integrador de Euler independente <c12/>), o erro de fator de escala e uma degradação opcional de estabilidade de <b>longo prazo</b> (distinta da decoerência por disparo) em uma única figura de deriva de posição ao longo do holdover mais um holdover inercial até o limiar, o gêmeo de navegação estimada do holdover do relógio. O piso quântico modelado é <b>delimitado por limites (não igualado)</b> contra os { "96" } nm/s²/√Hz do gravímetro móvel de Freier et al. { "2016" } (arXiv:{ "1512.05660" }): ele fica abaixo e a cerca de ~{ "2" } ordens de grandeza dele. Documentado em <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Os sistemáticos de frente de onda/apontamento do feixe não são modelados; o <em>limite</em> de ambiguidade de franjas de Mach–Zehnder é modelado (<c1/>, <c2/> em <c3/>), mas resolver a ambiguidade não é; os orçamentos exatos de teste em voo do CARIOQA-PMP (CARIOQA: Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense (que exigem PSDs de plataforma publicadas + SNR (relação sinal-ruído) por disparo) e uma predefinição de playground em JS (JavaScript) são resíduos

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = sistemáticos de frente de onda + reprodução de teste em voo: P2+ (<a1><c1/></a1>)

# text
# c1: src/walker.rs
# c2: tests/igs_real_data.rs
# c3: {planes × sats × inclination}
# c4: constellation-design
# c5: optimize_walker_design
# c6: MinSatellitesForCoverage
# c7: MaxCoverage
# c8: MinWorstPdop
# c9: coverage_half_angle_rad
# c10: street_half_width_rad
seg-59e99de860b2 = Walker sintético (tanto kepleriano analítico <b>quanto de elementos médios do SGP4</b>, este propagado pelo núcleo validado a { "4.12" } mm: <c1/>) + visibilidade e DOP de multiconstelação com TLEs reais (GPS+Galileo até { "100" }%), validado contra um <b>instantâneo real do gps-ops do Celestrak</b> (<c2/>); uma <b>varredura de projeto de PDOP (diluição de precisão de posição)</b> sobre a grade <c3/> e figuras de mérito de <b>fração de cobertura / tempo de revisita</b>; o <b>tipo de cenário <c4/></b> executável (padrões Walker delta e estrela na convenção i: T/P/F, listas explícitas de elementos, projetos de várias camadas e predefinições publicadas, em torno da Terra, da Lua, de Marte ou de qualquer outro corpo catalogado), cuja geometria Walker e cujos slots publicados de GPS, Galileo e GLONASS são VALIDATED contra as tabelas publicadas e cuja diluição de precisão global de linha de base do GPS é VALIDATED contra o padrão de desempenho do Serviço de Posicionamento Padrão do GPS, enquanto os mapas de cobertura para projetos arbitrários permanecem MODELLED; um <b>otimizador de projeto sem gradiente</b> (<c5/>) que pesquisa a grade pelo melhor projeto sob um objetivo escolhido (<c6/> / <c7/> / <c8/>), validado para devolver o vencedor por força bruta; e <b>geometria analítica de ruas de cobertura</b> (<c9/>, <c10/>; formas fechadas de Rider/Beste, verificadas à mão: GPS com máscara de { "5" }°: λ ≈ { "71.2" }°, meia-largura da rua de 4 satélites ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Existe um dimensionamento idealizado de <b>número mínimo de satélites por ruas de cobertura</b> (<c1/>); a correção exata de junção de Rider na fronteira de planos em contrarrotação não está implementada; o playground desenha uma vista 3-D de órbitas sem dependências (<c2/>), e uma exportação CZML (Cesium Language), <c3/>, carrega a geometria no globo do CesiumJS; o núcleo de DOP é VALIDATED contra o gnss_lib_py (<c4/>), e todo o pipeline de visibilidade de multiconstelação é verificado de forma cruzada de ponta a ponta contra o Orekit { "12.2" } + gnss_lib_py (<c5/>): os projetos para a Terra concordam em todos os limiares, mas os projetos para a Lua e Marte não atingem o limiar de DOP em geometria numericamente singular, de modo que a linha permanece MODELLED; "acima" geodésico versus geocêntrico no referencial do DOP

# text
seg-3fcc2a2a90ba = dimensionamento por ruas de cobertura + vista 3-D de órbitas + verificação cruzada de ponta a ponta para a Terra: <b>concluído</b>; correção exata de junção de Rider + DOP fora da Terra mal condicionado: P2

# text
seg-afd5b595ee5e = Verificação e validação

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Verificações com referência independente externa em todo o motor (SGP4 contra { "666" } vetores AIAA, a família de Allan contra o Stable32 e o allantools, referenciais contra SOFA/ERFA, modelo de forças e determinação de órbita contra o Orekit, ARAIM contra o exemplo trabalhado do WG-C, e mais; a contagem atual é o cabeçalho gerado de <a1><c1/></a1>); verificações determinísticas de Allan; uma <b>matriz de verificação verificada por máquina</b> (<c2/>), uma referência cruzada requisito→módulo→teste→referência independente→status cujas invariantes de honestidade são <b>testadas em unidade</b>: uma linha só pode ser rotulada <em>validada</em> se trouxer uma referência independente <b>externa</b> (NIST/AIAA/SOFA/IGS/valor publicado), de modo que uma verificação interna de autoconsistência não possa se passar por validação; é renderizada para Markdown/CSV (CSV: valores separados por vírgula) para uma referência cruzada de verificação ECSS-E-ST-10-02 (ECSS: European Cooperation for Space Standardization) e registra como tais as quatro lacunas de hardware/PA (PA: garantia do produto) pertencentes a parceiros

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Até agora, os conjuntos de calibração cobrem três verificações de semente única (<a1><c1/></a1>, fixadas antecipadamente: o intervalo de bootstrap de Monte Carlo cobre em { "96" } % de { "200" } sementes; uma tolerância de percentil é frágil em relação à semente, NOT MET a { "91.5" } %); as demais linhas ainda são calibradas em sementes únicas. A matriz impõe a <em>classificação</em> das linhas, e a CI agora também verifica que todo teste, arquivo e item interno do crate citado por uma linha existe (<c2/>, <c3/>) e que as figuras publicadas ainda são reproduzidas (<c4/>); ela não avalia a própria referência independente, que um revisor ainda lê

# text
seg-d3b92a831cd9 = conjuntos de calibração: P1

# text
seg-f382bb1b5d54 = LEO-PNT (posicionamento, navegação e temporização a partir da órbita terrestre baixa)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Sete tipos de cenário, agnósticos de sistema, com predefinições públicas nomeadas: <b><c1/></b> (projetos de sinal de qualquer banda e estrutura: BPSK, BOC, MBOC (BOC multiplexado) ou componentes planos do tipo OFDM (multiplexação por divisão de frequências ortogonais), rastreamento de código, aquisição, compatibilidade com GNSS, compromisso de banda), <b><c2/></b> (uma passagem projetada, de elementos, de TLE ou Walker com orçamento de enlace por banda: chuva, cintilação e perda de entrada em edificações do ITU-R (Setor de Radiocomunicações da União Internacional de Telecomunicações), ionosfera, antena, Doppler, contra os satélites GNSS MEO (órbita terrestre média) em visada), <b><c3/></b> (efemérides e relógio transmitidos sobre a base kepleriana do ICD (documento de controle de interface) do Galileo ou modelos LEO selecionáveis, ajustados e codificados com verificação de quadro CRC-24Q (verificação de redundância cíclica de 24 bits)), <b><c4/></b> (posicionamento fundido MEO + LEO por pseudodistância e Doppler sobre quaisquer constelações), <b><c5/></b> (convergência de PPP com e sem aumento por LEO, em medições simuladas), <b><c6/></b> (limites de posicionamento 5G NTN, rede não terrestre, a partir da largura de banda do sinal) e <b><c7/></b> (um sistema de ponta a ponta, com a saída de cada etapa repassada à seguinte). Peças VALIDATED: os termos de enlace do ITU-R contra as tabelas e os exemplos de validação das Recomendações, o Doppler máximo contra uma tabela publicada, o algoritmo de usuário do Galileo contra o RTKLIB a { "1" } mm, o CRC-24Q, os pesos de SISRE (erro de alcance do sinal no espaço)

# text
seg-5f87d4e409d5 = Sem dados de campo nem sinais gravados; as figuras de posicionamento, PPP, NTN e temporização são MODELLED (formas fechadas, consistência de filtro, comparações com tendências publicadas); as predefinições vêm de fontes públicas ou são derivadas, não são dados de operadores

# text
seg-d29a58fe2c84 = validação com sinais gravados reais: P3

# text
seg-4ea6f7ecc4a7 = Espectro / ambiente de RF

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>Tipo de cenário <c1/></b> (<c2/>): a banda L do GNSS (e projetos multibanda de frequência ultra-alta (UHF), banda S e banda C) como uma única densidade espectral de potência, com a frequência na horizontal e o tempo na vertical, sob uma linha do tempo roteirizada de jammers (jammers de onda contínua, de banda estreita, chirp e de banda larga casada), com J/S (razão entre jammer e sinal) por banda e C/N₀ (densidade de portadora sobre ruído) efetivo; gravações SigMF de entrada e saída e estimativas espectrais de Welch de amostras complexas. Os espectros de sinal em forma fechada e os coeficientes de separação espectral são VALIDATED; o waterfall é MODELLED

# text
seg-970852c2e2e8 = Sinais GLONASS, BeiDou e Galileo E6 não são modelados; sem validação de front-end de receptor nem de IQ (fase/quadratura) gravado

# text
seg-5402957c3eb5 = comparação com sinais gravados: P3

# text
seg-a5e741fa9d69 = Confiança em registros de receptor (embarcação e geral)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/>: monitores sobre o próprio registro de um receptor (densidade de portadora sobre ruído, consistência de posição, velocidade e rumo, tempo) com eventos e previsões declarados antes da execução; em uma plataforma de embarcação, uma pontuação de 0-100 com os motivos; modo ao vivo sobre um fluxo com a sentença <c2/> e um portão (gate) opcional. MODELLED; consultivo, não é um equipamento de navegação homologado

# text
seg-810132d58fbf = Os limiares são padrões declarados, não medidos em receptores em campo; um registro pontua somente aquele registro; sem entrada nem saída de radiofrequência; não é um equipamento de navegação homologado

# text
seg-82017a0ec045 = Pacotes de evidências e telemetria de confiança

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/>: um pacote assinado e encadeado por hash de uma janela do registro, sua configuração e o resultado do motor, verificável offline, com um token de carimbo de tempo RFC { "3161" } opcional. <c2/>: o fluxo de confiança como métricas Prometheus, eventos syslog (CEF ou LEEF) e OpenTelemetry opcional, com um painel Grafana de exemplo

# text
seg-9d2138e7a040 = Um pacote é um registro técnico, não um parecer jurídico, e não diz o que causou um evento; a assinatura da autoridade de carimbo de tempo não é verificada; a telemetria transmite somente telemetria

# text
seg-744f186bdf09 = Fluxos para treinamento de tripulações e mapas de interferência

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/>: NMEA de ponte sintético com eventos roteirizados de jamming, arrasto (drag-off), falsificação de tempo e repetição (replay) e um registro do instrutor (somente texto). <c2/>: mapas agregados de navegação degradada a partir de relatórios de aeronaves e navios com licença aberta e a exposição de uma rota, a partir de arquivos locais

# text
seg-91174c1a81be = Os fluxos são dados de treinamento, nunca para os sistemas de navegação em operação de uma embarcação; os mapas são agregados, não uma previsão, e dependem dos relatórios fornecidos

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/>: o movimento do veículo e os eventos de um cenário <c2/>, <c3/> ou <c4/> como um CSV de movimento, NMEA, texto de waypoints e arquivos de eventos para um simulador GNSS de laboratório

# text
seg-e5aa0f32fb2a = Nenhum sinal é gerado; nenhum desempenho de simulador ou de receptor é afirmado; os arquivos são verificados como relidos pelos leitores de movimento de um simulador de código aberto (gps-sdr-sim), mas a física da própria trajetória de verdade de referência do cenário não é verificada externamente

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> e <c2/>: lê páginas I/NAV do Galileo ou um fluxo UBX e informa, por satélite e época, se os dados de navegação estão autenticados (chave assinada com raiz de Merkle, cadeia TESLA, MACs), com o motivo da falha de uma verificação e um tempo de referência independente opcional para frescor; também <c3/> em Python e WebAssembly

# text
seg-0e782e8a2775 = Autentica dados contra chaves fornecidas pelo usuário; não afirma desempenho anti-spoofing e não é um serviço de integridade de navegação nem um equipamento homologado; verificado em vetores sintéticos, os vetores de teste oficiais do ICD são um download externo

# text
seg-98d0bc6b40ce = Mapeamento de compliance para frameworks públicos

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> e <c2/>: saídas do Kshana mapeadas para seis frameworks e normas públicos de resiliência, com fontes e uma lacuna em cada linha; uma execução só conta quando seu resultado traz os campos que seu tipo de cenário escreve

# text
seg-50652c747b6a = Um mapeamento é um julgamento; o relatório diz em que um conjunto de execuções fornece evidências em apoio de, nunca que um framework é satisfeito nem que um produto foi aprovado; a EN { "16803" } é citada apenas a partir do texto do catálogo

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Um plugin Signal K, o OpenCPN por NMEA em modo gate sobre TCP e uma compilação de referência para um computador pequeno ao lado do receptor (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Testado em saída sintética gravada; o plugin não está publicado no npm; consultivo, não é um equipamento de navegação homologado

# text
seg-8281218f1c7c = Domínios mais amplos de sistemas espaciais (fora do escopo atualmente)

# text
# c1: partial
seg-b564e0b42adc = Vários destes são <b>nenhum</b>; outros agora são <b>modelos <c1/> de primeira ordem</b> (os tipos de cenário de análise de missão / ambiente adicionados na série { "v0.17.0" }): listados para que o escopo seja inequívoco, e não implícito pelo silêncio. O Kshana é um simulador de PNT, não um GMAT/STK/Orekit (STK: Systems Tool Kit); esses modelos adjacentes são deliberadamente de primeira ordem e MODELLED, nunca ferramentas de voo validadas.

# text
seg-8125b00a48e4 = Nota / roteiro

# text
seg-6779cc4a0e99 = Projeto de missão / otimização de trajetória

# text
# c1: src/maneuver.rs
# c2: maneuver::lambert_multirev
# c3: tests/lambert_multirev_oracle.rs
# c4: maneuver::porkchop_kernel
# c5: tests/porkchop_de440_oracle.rs
# c6: maneuver::optimise_transfer_kernel
# c7: tests/transfer_optimiser_oracle.rs
# c8: src/ephem_provider.rs
# c9: xval/anise-mars-od
seg-3c1a80170fd5 = <c1/>: nós impulsivos de ΔV com propagação de covariância { "6" }×{ "6" } (referenciais de erro de execução ECI/LVLH (ECI: inercial centrado na Terra; LVLH: vertical local, horizontal local)), integração de queima finita verificada contra a equação de <b>Tsiolkovsky</b> em forma fechada a < { "0.01" } %, um solucionador de <b>Lambert de revolução única de Izzo-2015</b> + um <b>propagador de Kepler</b> exato em variáveis universais (saídas de Lambert reconduzidas contra a verdade de referência de dois corpos) e uma varredura <b>porkchop</b> (lançamento × chegada) de C3 / V∞ de chegada emitida como uma grade de contornos em JSON cujo mínimo é verificado contra o piso analítico de Hohmann. <b>Sem otimizador de trajetória</b>; um solucionador de <b>Lambert de múltiplas revoluções</b> (<c2/>, até três revoluções, ambos os ramos) é VALIDATED contra o pykep { "3.0.1" } (<c3/>); o porkchop é executado sobre o modelo sintético circular coplanar ou, com <c4/>, sobre um SPK DE440 (VALIDATED contra estados do SPICE + o Lambert do pykep, <c5/>); <c6/> encontra o ótimo contínuo de data (C3 mínimo ou V∞ de chegada mínimo, Tipo I ou II) em DE440, VALIDATED contra um otimizador independente SPICE + pykep + SciPy (<c7/>); contra os mínimos Terra–Marte de { "2026" } publicados no NASA/TM-2010-216764, ele coincide com os valores do Tipo II e erra o C3 mínimo do Tipo I em −{ "5.18" } % (registrado). O próprio GMAT não foi executado; o pykep é a referência independente da biblioteca. Uma <b>interface de efemérides planetárias</b> de espaço profundo (<c8/>) e uma <b>verificação cruzada com a DE440 (Development Ephemeris { "440" })</b> (<c9/>, { "137" } m em um arco de Marte de 1 dia) agora existem; veja a linha de PNT de espaço profundo / interplanetário. A camada de simulação de desempenho acima do GMAT/Orekit, não uma substituição. P3

# text
seg-e42e299359d6 = AOCS (sistema de controle de atitude e órbita) / GNC (guiamento, navegação e controle) / atitude

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
# c3: 1.5·(μ/R³)·ΔI
# c4: src/attitude_dynamics.rs
# c5: tests/attitude_dynamics_basilisk_oracle.rs
# c6: tests/attitude_gg_torque_basilisk_oracle.rs
# c7: src/wahba.rs
# c8: aocs
# c9: src/aocs.rs
# c10: src/aocs_kind.rs
# c11: AOCS.md
# c12: src/aocs_mekf.rs
seg-a1bccf1c2e01 = Tipo de cenário <c1/> (<c2/>): <b>torque de gradiente de gravidade</b> de pior caso <c3/> + <b>orçamento de erro de apontamento RSS (raiz da soma dos quadrados)</b> sobre termos de 1σ por contribuinte: um orçamento escalar MODELLED de apontamento/perturbação anterior ao hardware. A <b>dinâmica de atitude de corpo rígido</b> sem torque, com estado em quatérnio (<c4/>: equações de Euler + cinemática de quatérnios, RK4), é VALIDATED contra o hub de espaçonave do Basilisk { "2.9.1" } (<c5/>, quatérnio dentro de { "1e-9" } em { "1e4" } s), e o pico do torque de gradiente de gravidade contra o GravityGradientEffector do Basilisk (<c6/>); a determinação de atitude de Wahba está em <c7/>. <b>Tipo de cenário <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>): uma manobra de apontamento inercial com rodas de reação balanceadas sob realimentação MRP, torques de roda de norma mínima com limites de motor; a malha fechada é <b>VALIDATED</b> contra o Basilisk { "2.9.1" } em três casos fixados antecipadamente, até o erro de arredondamento. Um MEKF a partir de um giroscópio e de um rastreador estelar (<c12/>) pode fechar a malha sobre sua estimativa (MODELLED, consistência de filtro). Sem guiamento de rastreamento, realimentação integral, gerenciamento de momento angular, magnetorquers, propulsores, atrito de roda nem limites de velocidade; sem ambiente de torques externos na dinâmica de atitude; não é um controlador de voo. P3

# text
seg-eb137d279247 = Referenciais → fixos à Terra

# text
seg-c45f5e2f4bec = <b>Concluído</b>: TEME→ECEF/ITRF, o movimento polar e a cadeia GCRS→ITRS baseada no CIO estão implementados e VALIDATED (bit a bit contra SOFA/ERFA; { "4" } mm de ponta a ponta contra Vallado). Veja a linha de <b>Referenciais</b> acima

# text
seg-aa268d6f1635 = Comunicações e orçamentos de enlace

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/>: um <b>orçamento de enlace de Friis de espaço profundo</b> (potência de Tx · ganhos de antena · ruído → C/N₀ · Eb/N₀ · margem) que alimenta o caminho radiométrico/GSE (GSE: equipamento de apoio em solo), além dos enlaces ópticos/RF de transferência de tempo (<c2/>), e o <b>tipo de cenário <c3/></b> executável: a equação de enlace unidirecional CCSDS-401/DSN-810-005 (DSN: Deep Space Network) <c4/> com entradas de <b>EIRP (potência isotrópica radiada efetiva) / G-T</b> e seleção de banda S/X/Ka (orçamento de enlace de engenharia MODELLED, não uma folha de dados calibrada de terminal). Sem programação de acessos, sem codificação adaptativa. P2

# text
seg-cd6f9d8d0dc2 = Segmento terrestre e operações

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = Tipo de cenário <c1/> (<c2/>): <b>predição de passagens de nascer/pôr de uma estação terrestre</b>: AOS/TCA/LOS (AOS: aquisição do sinal; TCA: instante de maior aproximação; LOS: perda do sinal), elevação máxima, duração por passagem e acesso total ao longo de um horizonte, a partir de um conjunto de elementos SGP4 no referencial fixo à Terra IAU 2006/2000A com refração ITU-R P.834-9 e tempo de luz, <b>VALIDATED contra o Orekit { "13.1.8" }</b> em estações ao nível do mar ({ "60" } casos / { "1210" } passagens, <c3/>); o <c4/> geométrico é VALIDATED contra o detector de elevação do Orekit { "12.2" } ({ "22" } cenários / { "129" } passagens, <c5/>); sem otimizador de programação nem resolução de conflitos. P3

# text
seg-ec6ce48c783e = Telemetria / TT&C / CCSDS

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
# c4: oem
# c5: src/ccsds_tdm.rs
# c6: space-packet
# c7: src/space_packet.rs
# c8: src/omm.rs
# c9: src/naif_kernel.rs
# c10: ephem_provider::KernelEphemeris
seg-4f1158386205 = TOML de entrada/JSON de saída sob medida; <b>exportação <em>e importação</em> de OEM (Orbit Ephemeris Message) do CCSDS</b> (502.0-B KVN (notação palavra-chave-valor), GMAT/Orekit/STK) por meio do <b>tipo de cenário <c1/></b> executável (ponte de ida e volta <c2/> <c3/>; a troca aderente à norma de objeto único é <b>VALIDATED</b> contra o interpretador independente <c4/> { "0.4.5" }); <b>interpretação + emissão de Tracking Data Message CCSDS-TDM ({ "503" })</b> (<c5/>, o formato de intercâmbio radiométrico de espaço profundo); e o <b>tipo de cenário <c6/></b> (<c7/>): codificação/decodificação do cabeçalho primário de <b>Space Packet CCSDS 133.0-B</b> com ida e volta exata bit a bit. Um gravador de <b>OMM do CCSDS</b> (Orbit Mean-Elements Message, 502.0-B-2, parte da família ODM) (<c8/>) publica elementos médios do SGP4 em KVN, e um <b>leitor de kernels NAIF SPICE</b> em Rust puro (<c9/>: contêiner DAF, SPK tipo { "2" }, PCK binário tipo { "2" }) sustenta <c10/>. Outros tipos de mensagem CCSDS (OPM, OCM, AEM (AEM: Attitude Ephemeris Message)) e a <em>escrita</em> de SPICE continuam como item do roteiro (P2)

# text
seg-a3e6c2c5e7df = Interoperabilidade e normas (RINEX/SP3/SPICE/CCSDS)

# text
# c1: Propagator::Sp3Precise
# c2: kshana <orbit.toml> --export-sp3 out.sp3
# c3: export_sp3 = true
# c4: tests/sp3_export_roundtrip.rs
# c5: kshana <orbit.toml> --export-oem out.oem
# c6: export_oem = true
# c7: tests/sp3_export_roundtrip.rs
# c8: pvt
# c9: src/ccsds_tdm.rs
# c10: --export
# c11: src/interop/
# c12: tests/interop_formats.rs
# c13: --import-route
# c14: spectrum
# c15: INTEROP.md
# c16: STANDARDS.md
# c17: oem-interop
# c18: src/omm.rs
# c19: src/naif_kernel.rs
seg-b41f3b5644a8 = <b>NAV multi-GNSS</b> RINEX { "3" } — GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>e GLONASS</b> (vetor de estado PZ-90 (PZ: Parametry Zemli, o datum geodésico russo) com RK4) — ingerido + propagado + executável como uma única constelação mista; <b>interpretador de OBSERVAÇÃO RINEX { "3" }</b> (pseudodistância/portadora/Doppler/SNR por código de observação, com sinalizadores LLI/SSI (LLI: indicador de perda de travamento; SSI: indicador de intensidade do sinal); espera-se que a { "4.00" } seja interpretada, não testada); <b>ida e volta de leitura ↔ escrita</b> de efemérides precisas SP3-c/d (interpretação + exportação para Ginan/RTKLIB/gLAB) <b>e um propagador de Lagrange de 10ª ordem (11 pontos)</b> (<c1/>); a exportação SP3 é <b>exposta na CLI</b> (<c2/>, ou <c3/>) e <b>validada por ida e volta</b> contra a constelação GPS real a <{ "0.5" } m em { "24" } h (<c4/>); <b>gravador de efemérides OEM { "2.0" } do CCSDS</b>, a exportação de estado TEME com velocidade para ferramentas de dinâmica de voo, agora <b>exposto na CLI</b> (<c5/>, ou <c6/>) e verificado por ida e volta contra o estado do propagador (<c7/>). O <b>interpretador de observações RINEX agora alimenta uma solução de posicionamento por ponto único</b> (<c8/>, validada em dados reais do IGS; veja a linha GNSS / PNT). Além disso, interpretação + emissão de mensagem de dados de rastreamento <b>CCSDS-TDM ({ "503" })</b> (<c9/>). Exportações de geometria para visualizadores e ferramentas de análise de missão: <b>CZML, KML (Keyhole Markup Language), GeoJSON e efemérides STK</b> (<c10/>, <c11/>), cada uma lida de volta por um validador escrito a partir da especificação do formato (<c12/>), uma importação de rotas GeoJSON (<c13/>), gravações <b>SigMF</b> (Signal Metadata Format) de entrada e saída para o tipo de cenário <c14/>, e texto no estilo RINEX 4 / CSV para a mensagem de navegação LEO (<a1><c15/></a1>, <a2><c16/></a2>). Ainda sem BeiDou-GEO, sem fixação de ambiguidade inteira em PPP nem RTK cinemático (existem PPP float estático e RTK de linha de base curta em dados reais, veja a linha GNSS / PNT), sem gravador SPICE e sem OPM/AEM (o <b>leitor de OEM</b> existe por meio do tipo de cenário <c17/>, o <b>gravador de OMM</b> em <c18/> e um <b>leitor de SPK/PCK do SPICE</b> em <c19/>) — <b>P2</b> "anexar domínios adjacentes por meio de formatos padrão"

# text
seg-437dbb962136 = Clima espacial / ambiente (iono/atmo/radiação)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = Tipo de cenário <c1/> (<c2/>): índices solares/geomagnéticos (tabela de 28 passos <b>Kp↔ap</b> da IAGA (Associação Internacional de Geomagnetismo e Aeronomia), Ap diário, <b>F10.7a</b> centrado de 81 dias), <b>temperatura exosférica de Jacchia-71</b> e um <b>acoplamento de densidade termosférica conduzido pela atividade</b> sobre uma atmosfera estática: MODELLED de primeira ordem, <b>NÃO</b> um modelo de densidade absoluta NRLMSISE. Ionosfera: o modelo transmitido de Klobuchar (VALIDATED contra o RTKLIB) e um leitor de mapas TEC (conteúdo total de elétrons) IONEX (formato de intercâmbio de mapas da IONosfera) (<c3/>, testado em unidade). Um mapa global de ionosfera real do CODE (<c4/>) é a referência independente medida da linha de TEC oblíquo livre de geometria (<c5/>), mas esse teste avalia o mapa em seu próprio gerador de fixtures, de modo que o leitor <c6/> em si ainda não foi verificado de forma cruzada contra um produto real; sem modelo de ionosfera baseado em física nem conduzido pelo clima espacial; P2+

# text
seg-78a2c5a930e8 = Navegação por mapa de gravidade / alt-PNT

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: mapmatch
# c4: particle_filter
# c5: run_gps_denied_gravity_nav
# c6: scenarios/gps-denied-gravity-nav.toml
# c7: src/igrf.rs
# c8: igrf14coeffs.txt
# c9: src/altpnt/terrain.rs
# c10: .hgt
# c11: run_terrain_nav
# c12: run_combined_altpnt
# c13: src/altpnt/sequential.rs
# c14: run_sequential_trn
# c15: particle_filter
# c16: kind=
# c17: gravity-map
# c18: terrain-nav
# c19: combined-altpnt
# c20: terrain-slam
# c21: scenarios/terrain-nav.toml
# c22: scenarios/combined-altpnt.toml
# c23: scenarios/terrain-slam.toml
# c24: gravity-map
# c25: [reference]
# c26: .gfc
# c27: xval/icgem-egm2008/
# c28: [map_error_mc]
# c29: scenarios/gravity-map-error-mc.toml
# c30: combined-altpnt
# c31: [magnetic_grid]
# c32: terrain-nav
# c33: combined-altpnt
# c34: terrain-nav
# c35: combined-altpnt
# c36: xval/srtm-ungate/
# c37: run_sequential_trn_on_map
# c38: xval/terrain-slam-rbpf/
seg-431b3f05c08c = <c1/>: um <b>modelo de medição de gravímetro</b> de átomos frios cujo piso de ruído branco é derivado da ASD do acelerômetro CAI (<c2/>), um <b>campo de anomalia de gravidade em harmônicos esféricos totalmente normalizados</b> de baixo grau (validado contra as funções de Legendre em forma fechada e uma anomalia de termo único derivada à mão) mais <b>mascons</b> sintéticos, e um <b>filtro de partículas de casamento com mapa de gravidade</b> (compondo <c3/> + <c4/>) que recupera uma trajetória sem GPS a partir da sequência de anomalias que ela atravessa. O <b>benchmark de 60 minutos sem GPS</b> (<c5/>, <c6/>) voa uma interrupção de ~{ "700" } km / uma hora em que a solução inercial deriva até <b>≈ { "70" } km</b>, e um casador <b>hierárquico do grosseiro ao fino</b>, com o ruído branco determinístico com semente do gravímetro, a recupera a <b>≈ { "145" } m (< { "500" } m)</b>, estável entre realizações de ruído e comprovadamente limitada pelo refinamento (uma única grade grosseira estaciona em ~{ "2" } km). Além disso, um <b>modelo completo do campo principal geomagnético IGRF-14 (IGRF: Campo Geomagnético Internacional de Referência)</b> (<c7/>: o campo em harmônicos esféricos normalizados de Schmidt da IAGA até grau/ordem { "13" }, { "2025.0" } + variação secular, coeficientes gerados por máquina a partir do <c8/> oficial; validado contra o dipolo inclinado em forma fechada, uma diferença finita do potencial escalar e o polo/intensidade geomagnéticos conhecidos), o campo magnético com que uma plataforma pode fazer o casamento de mapas para navegação por anomalia magnética. Além disso, <b>navegação referenciada ao terreno (TERCOM/SITAN (TERCOM: casamento de contornos de terreno; SITAN: Sandia Inertial Terrain-Aided Navigation))</b> e o <b>navegador combinado de gravidade + magnetismo + terreno</b> (<c9/>): um interpretador artesanal de modelo digital de elevação (DEM) <c10/> do SRTM (Shuttle Radar Topography Mission) (inteiros de 16 bits com sinal, big-endian, ordem por linhas, linha norte primeiro, vazio -32768; validado contra a especificação do driver SRTMHGT (formato de arquivo de altura da Shuttle Radar Topography Mission) do GDAL (Geospatial Data Abstraction Library) e uma referência independente em forma fechada do ponto médio bilinear), um modelo de <b>altímetro</b> radar/barométrico e um casador <c11/> que recupera uma trajetória sem GPS a partir do perfil de elevação do terreno contra o DEM, e <c12/>, que funde <b>três canais de campo escalar</b> por waypoint (Δg mGal · |B| nT de anomalia crustal · elevação m), de modo que a posteriori conjunta é mais aguda (CRLB (limite inferior de Cramér–Rao) menor) do que qualquer campo isolado: limitada a < { "500" } m ao longo da interrupção de 60 min e, em expectativa, não pior que o melhor canal isolado. Além disso, <b>navegação sequencial (recursiva) referenciada ao terreno: o SITAN como um filtro em execução</b> (<c13/>, <c14/>): o mesmo modelo de medição altímetro-contra-DEM executado <b>época a época</b> pelo motor SIR (reamostragem por importância amostrada) de <c15/> (predição pelo incremento do INS + ruído de processo → reponderação pelo casamento com o terreno → reamostragem na degeneração), de modo que uma deriva do INS <b>variável no tempo</b> é <em>rastreada</em> ao longo da trajetória, enquanto o casador em lote só recupera um único deslocamento constante: a estimativa recursiva permanece limitada e reconverge (final ≈ { "70" } m), enquanto a solução sem auxílio diverge sem limite até ≈ { "5" } km, com o erro por época acompanhando a distintividade do terreno e um monitor de saúde do tamanho efetivo da amostra. Escopo honesto: o mapa é <b>conhecido e fixo</b>, uma <em>localização</em> recursiva contra um DEM armazenado (a metade de localização do SLAM de terreno (localização e mapeamento simultâneos)); a estimação conjunta do mapa é o RBPF separado abaixo. Todos os quatro agora estão <b>ligados ao motor de cenários <c16/></b> (<c17/>, <c18/>, <c19/>, <c20/>) com um gráfico SVG de deriva (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10):</b> o navegador <c24/> aceita um campo de referência real opcional (<c25/>: EGM2008 incluído até o grau { "70" }, ou um arquivo <c26/> do ICGEM), cuja síntese de anomalia coincide com o Serviço de Cálculo do ICGEM a cerca de { "1e-8" } mGal (VALIDATED, <c27/>); nesse campo de grau 70, o benchmark de 60 min termina em { "3106" } m, de modo que o limiar de < { "500" } m é NOT MET (fixado antecipadamente e previsto: o grau { "70" } é suave demais). Um Monte Carlo opcional de erro de mapa (<c28/>, <c29/>) mostra que a fixação sintética de { "144" } m supõe um mapa exato ({ "1" } de { "20" } realizações dentro de { "500" } m sob um erro correlacionado de { "2" } mGal; exploratório). <c30/> aceita uma grade magnética crustal EMAG2v3 opcional (<c31/>; o EMAG2 é baixado, não incorporado ao repositório, e nenhum resultado de navegação é afirmado com ele). <c32/> permanece apenas com DEM por projeto: é o casador TERCOM/SITAN de canal único, e o casamento magnético fica em <c33/>, que funde o terreno com os canais magnético e de gravidade; um canal magnético em <c34/> o duplicaria, de modo que o item de auditoria "EMAG2 em terrain-nav" é coberto pela ligação em <c35/> (RM-16). As verificações com SRTM real são executadas na CI em dois recortes de resolução total versionados (nó a nó iguais ao GDAL { "3.8.4" }, <c36/>). Existe estimação conjunta do mapa (<c37/>, um RBPF no estilo FastSLAM): em uma única passagem, ela ganha { "1.5" } % sobre o SITAN com mapa conhecido em um mapa errôneo, deixando de atingir seu limiar de { "10" } % fixado antecipadamente (<c38/>). <b>Ainda falta:</b> um modelo de gravidade de alto grau em uma execução de navegação (exige um novo pré-registro), um resultado de navegação magnética com grade real e um caso de SLAM com revisita (fechamento de laço). P3

# text
seg-bf09e5d705a0 = Reentrada / EDL (entrada, descida e pouso), análise de lançamento, EO/carga útil (EO: observação da Terra)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Geometria MODELLED de primeira ordem por meio de três tipos de cenário executáveis: <b><c1/></b> (<c2/>, corredor balístico de <b>Allen-Eggers</b>: desaceleração de pico, velocidades de pico de g e de pico de aquecimento, altitude de pico de g), <b><c3/></b> (<c4/>, <b>azimute de lançamento</b> de dois corpos <c5/>, Δv de mudança de plano, bônus de rotação do local, oportunidades diárias) e <b><c6/></b> (<c7/>, geometria de <b>faixa / GSD (distância de amostragem no solo) / acesso / revisita</b> de EO pelo triângulo espacial do SMAD (Space Mission Analysis and Design)). <b>Sem</b> simulação EDL/aerotérmica de 6-DoF, sem otimizador de trajetória, sem radiometria de sensor/MTF (MTF: função de transferência de modulação). P3

# text
seg-439bd85c8bbc = PNT lunar / cislunar (LunaNet)

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: south_pole_hpl_pass
# c6: src/cr3bp.rs
# c7: cr3bp_jacobian
# c8: propagate_state_stm
# c9: differential_correct_halo
# c10: src/lunar_orientation.rs
# c11: moon_pa_de440
# c12: pxform
# c13: tests/lunar_pa_orientation_spice_oracle.rs
# c14: lunar::mci_to_mcmf
# c15: lunar-integrity
# c16: scenarios/lunanet-araim.toml
seg-a7a12eb111fc = <c1/>: um motor de <b>ARAIM lunar</b> que reutiliza o núcleo MHSS do lado da Terra com os parâmetros do LNIS (LunaNet Interoperability Specification) da LunaNet (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), a <b>redução de referencial cislunar MCI↔MCMF (MCI: inercial centrado na Lua; MCMF: centrado e fixo à Lua)</b> (<c2/> / <c3/>, um modelo simplificado de rotação média à taxa sideral) e lat/lon/alt <b>selenográficos</b> (<c4/>), e uma <b>passagem de nível de proteção no polo sul</b> (<c5/>) que quantifica a lacuna de integridade: com alcance de { "30" } m, o HPL é finito, mas excede um limite de alerta de operações em superfície de { "50" } m. <c6/> acrescenta o <b>CR3BP</b> Terra–Lua (problema circular restrito de três corpos) (dinâmica em referencial girante + propagador RK4 + constante de Jacobi + os cinco pontos de Lagrange, validado contra os valores publicados de L1/L2/L3 e os exatos de L4/L5), o núcleo de três corpos de que uma NRHO (órbita de halo quase retilínea) real precisa, e um <b>corretor diferencial de tiro simples com matriz de transição de estado</b> (<c7/>, <c8/>, <c9/>) que produz órbitas de halo/NRHO L2 genuinamente periódicas: a STM é validada contra diferenças finitas, os halos corrigidos se fecham sobre si mesmos com precisão de máquina (conservando Jacobi), e a semeadura com o estado de apolune publicado reproduz a <b>NRHO L2 sul { "9" }:{ "2" }</b> (a órbita do Gateway) com <b>período ≈ { "6.57" } d</b> e <b>perilune ≈ { "3,250" } km</b>, consistente com o publicado ≈ { "6.56" } d / ≈ { "3,370" } km | As ICs (condições iniciais) da NRHO corrigidas por diferenciais agora estão ligadas, mas a <b>transformação selenocêntrica (MCI/MCMF) desnormalizada da órbita corrigida</b> e a continuação de família ainda são desdobramentos futuros; a orientação lunar de eixos principais da DE440 com libração física real existe (<c10/>, a partir do PCK <c11/>, verificada contra o SPICE <c12/> em <c13/>), mas o caminho <c14/> mais antigo ainda usa a rotação média sem libração nem o polo em precessão; a NRHO é uma solução do CR3BP (circular, sem Sol), <b>não</b> validada contra uma efeméride real de LANS/Gateway (LANS: Lunar Augmented Navigation Service); um tipo de cenário <c15/> executável (<c16/>) expõe a passagem do polo sul pela CLI | transformação selenocêntrica + continuação de família + interface SPICE/LunaNet: <b>P3</b>

# text
seg-e3d975b70014 = PNT de espaço profundo / interplanetário (Marte, radiométrico)

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
# c3: src/deepspace_od.rs
# c4: clock_state.rs
# c5: mars_atmos.rs
# c6: src/body.rs
# c7: src/mars_frame.rs
# c8: EphemerisProvider
# c9: src/ephem_provider.rs
# c10: mars-pnt
# c11: src/mars_pnt.rs
# c12: src/gse_sim.rs
# c13: xval/anise-mars-od
# c14: from_shadr
# c15: Body::with_gravity_field
seg-584d79a8ba08 = <b>Entregue na { "v0.17.0" }.</b> Um motor de navegação radiométrica: tempo de luz iterativo + atraso de Shapiro, Doppler e distância bidirecional/unidirecional/tridirecional (duas pernas de Moyer), retorno coerente do transponder, medição de distância regenerativa/PN (PN: pseudoaleatório) (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), meios de plasma solar/tropo/iono (<c1/>); interpretação + emissão <b>CCSDS-TDM ({ "503" })</b> (<c2/>); um <b>SRIF de dinâmica reduzida</b> (filtro de informação em raiz quadrada) com acelerações empíricas RTN (radial, transversal, normal) + um relógio de bordo de 3 estados + arrasto de Marte (<c3/>, <c4/>, <c5/>) que faz <b>OD de Marte-LMO (LMO: órbita baixa de Marte) ≈ { "0.2" } m</b> em uma malha fechada sintética; fusão unidirecional + bidirecional; um núcleo de dinâmica de múltiplos corpos (<c6/>, Mars GMM-3 (GMM: Goddard Mars Model), referencial IAU de Marte <c7/>, uma interface <c8/> <c9/>, JD de duas partes + TT↔TDB (TDB: Tempo Dinâmico Baricêntrico)); e o cenário de PNT por retransmissão <b><c10/></b> (constelação areoestacionária MARCONI, <c11/>) + um simulador de desempenho de GSE de ponta a ponta (<c12/>). <b>Validado por simulação</b> (FoM de covariância/malha fechada); dinâmica centrada no Sol verificada de forma cruzada contra a DE440 do JPL (Jet Propulsion Laboratory) ({ "137" } m em um arco de 1 dia, <c13/>). <b>Falta:</b> validação com dados reais de rastreamento da DSN/ESTRACK (ESTRACK: rede europeia de rastreamento espacial); gravidade de Marte em seu referencial nativo (o campo GMM-3 de grau/ordem { "120" } é carregado da tabela SHADR do PDS, <c14/>, VALIDATED contra o pyshtools, e é anexado por meio de <c15/>, mas é avaliado no referencial IAU e não no seu próprio referencial Konopliv-2006); efemérides de nível DE no núcleo (condicionadas a kernel no xval). P3

# text
seg-00450a6acae0 = Sistema solar e PNT em torno de qualquer corpo

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>Tipo de cenário <c1/></b>: posições, velocidades e constantes físicas do Sol, dos planetas, de Plutão, da Lua e de sete luas principais em uma época, com o tempo de luz entre corpos; as posições dos planetas (elementos de Standish do JPL) e o tempo de luz são VALIDATED contra o JPL Horizons (<c2/>); as luas, Plutão e a tabela dos planetas externos permanecem MODELLED. <b>Tipo de cenário <c3/></b>: um orbitador ou módulo de pouso em torno de qualquer corpo catalogado (Marte, a Lua, Europa, Ganimedes, Titã e os demais) navegando por pseudodistâncias unidirecionais de uma constelação Walker local, mais uma distância bidirecional opcional a partir da Terra: MODELLED. Sem kernel de efemérides planetárias no núcleo (elementos analíticos); as órbitas de retransmissão de <c4/> usam apenas J2 (os campos completos GMM-3 de Marte de grau/ordem { "120" } e GRAIL GL0660B da Lua de grau/ordem { "660" } são carregados de tabelas SHADR do PDS e anexados a um <c5/> para o propagador, <c6/>). P3

# text
seg-433128dbc8a9 = Campanhas / composição de missões

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>Tipo de cenário <c1/></b> (<c2/>): tipos de cenário existentes encadeados em uma única linha do tempo compartilhada (por exemplo jamming, depois spoofing, depois holdover com um INS em deriva, depois um alarme de integridade, depois recuperação), varreduras de parâmetros e conjuntos de Monte Carlo com sementes sobre qualquer tipo de cenário, e vários cenários sob condições compartilhadas com um resumo combinado; todo número é lido de uma execução real do tipo de cenário do membro. As identidades de composição são testadas (<c3/>: uma campanha de uma fase reproduz a execução isolada byte a byte); MODELLED. Uma seção <c4/> (grade ou Nelder–Mead limitado sobre uma a três chaves, uma métrica, minimizar, maximizar ou atingir um alvo) satisfaz seus limiares de forma fechada e de força bruta fixados antecipadamente (<c5/>); MODELLED, uma busca local sem afirmação de ótimo global e sem método de gradiente nem bayesiano. P3

# text
seg-378c53e44b92 = Relatórios, animação e saídas

# text
# c1: result.json
# c2: report.html
# c3: report.json
# c4: tests/advanced_report_cli.rs
# c5: --animate
# c6: src/animation.rs
# c7: ANIMATION.md
# c8: --export
seg-7bd95909787f = Toda execução grava <c1/>, um gráfico e um relatório (<c2/>, <c3/>) cujos rótulos são lidos da matriz de verificação e cujo comando registrado reproduz o resultado byte a byte (<c4/>); <c5/> (svg, html ou frames) renderiza uma série temporal como uma animação (<c6/>, <a1><c7/></a1>); <c8/> grava os formatos de intercâmbio da linha de interoperabilidade. Essas são renderizações da execução, não evidência sobre a física.

# text
seg-3c3d3427723f = Ecossistema e prontidão (acompanhados com honestidade, não uma capacidade de código)

# text
seg-5770537524d3 = Área

# text
seg-e0426ffe2628 = Nota

# text
seg-bdee8089afb0 = Bindings de linguagem e empacotamento

# text
# c1: RunOutput
# c2: array
# c3: columns
# c4: series
# c5: ScenarioKind
# c6: ErrorKind
# c7: KindMeta
# c8: run_typed
# c9: RunOutput
# c10: scenario_kinds
# c11: units
seg-89fd1e232849 = Rust + Python (abi3) + WASM em três registros. Superfícies tipadas ({ "0.36" }, CAP-34): <c1/> em Python com acessores NumPy (<c2/>, <c3/>, <c4/>) e <c5/> / <c6/> / <c7/> com tipagem por stubs; <c8/> em JavaScript (um objeto <c9/> tipado) e <c10/>, com o mesmo vocabulário nas declarações TypeScript. Os documentos de resultado continuam sendo JSON por tipo de cenário, tipados apenas pelo seu envelope compartilhado (<c11/>, versões)

# text
seg-e1dee294d0fe = Educação / UX (experiência do usuário) de integração

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Playground de navegador com <b>modo guiado entregue</b>: controles deslizantes guiados adaptados ao cenário (<c1/>, até seis ajustes por cenário) e um tour guiado interativo (<c2/>, que pode ser repetido no playground). Cada execução também recebe uma frase de <b>significado</b> em linguagem simples e suas figuras principais, lidas do documento de resultado (<c3/>, com modelos por tipo de cenário em <c4/>; um tipo de cenário sem modelo recebe sua primeira figura de destaque declarada de forma simples). Falta: explicações guiadas por figura além dessa frase (o <a1><c5/></a1> em linguagem simples as cobre)

# text
seg-becc4cd71f4c = Comunidade / governança

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Estrutura de governança presente: <c1/> (modelo de mantenedor benevolente + critério técnico + fronteira entre aberto e fechado), <c2/>, <c3/>, <c4/>, modelos de issues/PR (PR: pull request), <c5/>, dependabot. Fundador único; uma <b>comunidade externa ativa</b> (contribuidores, citações) depende de pessoas/tempo e ainda está se formando (divulgação pendente de revisão)

# text
seg-5e222a61a61e = Financiamento e prontidão para aquisições

# text
seg-fdbb9db68f1d = nenhuma

# text
seg-86709f7f67c0 = TRL ~{ "3" }; ainda sem citações/contratos de agências (veja as notas de estratégia)

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = Adições da demonstração FutureNAV (modeladas, verificadas internamente de forma cruzada, <b>não</b> validadas externamente): ({ "1" }) <b>Bancada de avaliação de detecção de degradações de RF por aprendizado de máquina</b> <c1/>: um corpus rotulado <b>sintético</b> de degradações (ancorado em parâmetros, não em IQ) + um harness ROC/AUC/confusão/Pfa-Pmd (ROC: característica de operação do receptor; AUC: área sob a curva) agnóstico quanto ao detector, com proteção contra vazamento e partição estratificada; os detectores incluídos são linhas de base transparentes de métodos publicados, não o estado da arte, e uma AUC alta aqui demonstra o pipeline, não desempenho em campo. ({ "2" }) <b>Motor de compromisso PNT quântico versus clássico</b> <c2/>: ingestão de ADEV medido (ajuste NNLS (mínimos quadrados não negativos) de <c3/>, verificado por ida e volta contra <c4/>), uma tabela de benefício de holdover de temporização/inercial que carrega no artefato a ressalva da hipótese de piso e um envelope de resiliência versus tempo sem GNSS; ele <b>quantifica</b> o benefício quântico de um parceiro e nunca valida o dispositivo. Ambos revisados de forma adversarial (um erro de base de deriva τ²→τ³ e uma afirmação falsa de resiliência "limitada indefinidamente" foram detectados e corrigidos). { "911" } testes da biblioteca no momento dessa adição, fmt+clippy limpos.

# text
# c1: src/interchange.rs
# c2: Envelope
# c3: format
# c4: SCHEMA_VERSION
# c5: engine_version
# c6: compatibility()
# c7: Envelope::parse
# c8: wrap
# c9: to_json
# c10: parse
# c11: payload_as::<T>()
# c12: Deserialize
# c13: SCHEMA.md
seg-deb7124d3c70 = Adição de intercâmbio / formato padrão (<c1/>): o <b>Kshana Interchange Format (KIF)</b>, um <c2/> neutro, versionado e autodescritivo que envolve qualquer artefato (cenário, resultado, estudo de compromisso) com uma etiqueta <c3/> reconhecível, o <c4/> como fonte única de verdade (a versão do esquema, antes copiada como literal em { "15" } lugares, agora pertence a uma única constante que o crate inteiro referencia), o <c5/> produtor e um contrato de compatibilidade explícito e testado (<c6/>: mesma versão principal / versão secundária igual ou mais antiga é legível sob a disciplina de campos aditivos; uma versão secundária mais nova ou uma versão principal diferente é recusada na fronteira por <c7/> em vez de ser interpretada incorretamente em silêncio). Com ida e volta (<c8/>→<c9/>→<c10/>→<c11/>) para qualquer carga <c12/>; deliberadamente <b>sem carimbo de tempo</b>, para preservar a reprodutibilidade bit a bit do Kshana. Documentado em <a1><c13/></a1>, de modo que o formato seja <b>citável</b>, e não apenas emitido: o posicionamento de "padrão em espera" do núcleo aberto. { "923" } testes da biblioteca no momento dessa adição, fmt+clippy limpos.

# text
# c1: src/frugal.rs
# c2: walker
# c3: src/integrity_impact.rs
# c4: classify_stanford
# c5: src/verification.rs
# c6: VERIFICATION-MATRIX.md
# c7: src/impairment_eval.rs
# c8: stratified_split
# c9: Split::has_leakage
seg-adc959257e0b = Adições da versão de dominância FutureNAV (modeladas, verificadas internamente de forma cruzada, <b>não</b> validadas externamente): ({ "1" }) <b>Camada frugal de custo por cobertura / ROI (retorno sobre o investimento)</b> <c1/>: uma camada de enquadramento de benefícios sobre o motor de dimensionamento de constelações (<c2/>) que relata o custo por ponto percentual de cobertura e o ROI de cobertura por euro em relação a uma linha de base; o custo por satélite é uma <b>faixa baixa/nominal/alta fornecida pelo chamador e com fonte</b> (sem preços pontuais inventados), de modo que as saídas são intervalos, e não pontos espúrios; um enquadramento econômico modelado de uma figura de cobertura modelada, não uma cotação. ({ "2" }) <b>Mapeamento do impacto de integridade de uma detecção perdida</b> <c3/>: mapeia um viés de posição não detectado induzido por spoofing/jamming para seu erro efetivo → região de Stanford (disponível / sistema indisponível / enganosa / perigosamente enganosa) contra <b>limites de alerta específicos do contexto</b> (céu aberto versus urbano, HAL versus VAL), compondo o <c4/> do RAIM ancorado externamente; a ponte entre detecção perdida e limite de alerta é modelada, não uma alocação de integridade certificada. Ambos são mapeados na matriz de verificação verificada por máquina (<c5/>, invariante Validado⇒ExternalDataset intacta; a contagem atual de linhas é o cabeçalho gerado de <a1><c6/></a1>). A validação cruzada / proteção contra vazamento / partição estratificada por parâmetros para o harness de avaliação de IA já havia sido entregue em <c7/> (<c8/>, <c9/>). { "951" } testes da biblioteca no momento dessa adição, fmt+clippy limpos.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = Adições do estudo de lacuna de otimismo FutureNAV (modeladas, verificadas internamente de forma cruzada contra formas fechadas, <b>não</b> validadas externamente, <b>não</b> uma afirmação de transferência da simulação para o campo): um estudo <b>sintético</b> controlado da <b>lacuna de otimismo</b> da AUC entre dentro e fora da distribuição para detectores de degradações de RF. ({ "1" }) <b>Detectores aprendidos</b> <c1/>: um mapa de atributos fixo + padronizador ajustado no treino, uma linha de base de regressão logística (descida de gradiente determinística em lote completo) e um <b>MLP</b> (perceptron multicamada; backprop com SGD (descida de gradiente estocástica) com semente) de uma camada oculta, por trás do mesmo trait <c2/> que as linhas de base de métodos publicados usam. ({ "2" }) <b>Estatísticas derivadas à mão</b> <c3/>: intervalos de confiança (ICs) por bootstrap de percentis, variância/IC da AUC de <b>DeLong</b>, ρ de <b>Spearman</b> e regressão <b>ridge</b>, cada um verificado contra uma forma fechada (AUC binormal Φ(d′/√{ "2" }), uma variância de DeLong calculada à mão, um ρ de postos empatados de livro-texto, recuperação exata por OLS (mínimos quadrados ordinários)). ({ "3" }) <b>O estudo</b> <c4/>: AUC por classe, a tendência de lei de escala por <c5/> (lacuna versus { "1" }−severidade) e um <b>preditor ridge de lacuna apenas com dados dentro da distribuição</b> que estima a lacuna de otimismo apenas a partir de diagnósticos dentro da distribuição, pontuado por <b>exclusão de um detector</b> e por <b>exclusão de uma classe</b> contra uma linha de base que prevê a média. Artefato de um único comando por <c6/>. Todo número é uma AUC sobre rótulos derivados de modelo em um corpus sintético ancorado em parâmetros; a lacuna é um deslocamento de severidade sintético→sintético, nunca um resultado de detecção em campo. Mapeado na matriz de verificação verificada por máquina (<c7/>, invariante Validado⇒ExternalDataset intacta).

# text
seg-441b67566d5a = <s1>Anterior</s1>Reprodutibilidade

# text
seg-861984989d07 = <s1>Próximo</s1>Normas e interoperabilidade
