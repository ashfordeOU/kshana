# docs--capability-map: translations (pt-PT)

# text
seg-76b323512350 = Sistemas de tempo

# text
seg-ee2e250497f9 = Exportação para test bench

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Fonte: <c1/>

# text
seg-891eb89a8801 = Mapa de capacidades — o que o Kshana faz, faz parcialmente e não faz

# text
# c1: POSITIONING.md
seg-f9b372e8832b = O Kshana é um <b>motor de evidências de desempenho e resiliência PNT (posicionamento, navegação e temporização)</b>, não um conjunto completo de ferramentas de sistemas espaciais. Dá primazia à temporização e ao holdover, o seu domínio mais bem validado (ver <a1><c1/></a1>). Esta página é o mapa franco do âmbito: para cada área de capacidade que um revisor de aquisições ou de investigação possa verificar, indica o estado, o que realmente existe no código, o que falta e em que ponto do roteiro se encontra. O estado é um de:

# text
seg-1b3a49d09c7d = <b>full</b> — implementado de ponta a ponta e validado a um nível indicado na linha;

# text
seg-0da2570a5ca3 = <b>partial</b> — um modelo real mas limitado (âmbito explicitamente delimitado abaixo);

# text
seg-6e02edaa8f54 = <b>none</b> — não modelado (fora do âmbito atualmente).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Estes três são os únicos valores que a coluna de estado assume. Classificam a <em>maturidade da capacidade</em>, que é um eixo diferente da classificação VALIDATED / MODELLED / PARTNER em <a1><c1/></a1> — essa classifica a <em>proveniência da evidência</em>, linha a linha, e é verificada por máquina a partir de <c2/>.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Nada aqui é aspiracional: "partial" nunca significa "quase concluído", significa "isto e nada mais". Ver também <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> e o registo de encerramento de afirmações excessivas <a4><c4/></a4> (cada afirmação excessiva histórica, como foi resolvida e uma proteção de CI (integração contínua) que a mantém resolvida).

# text
seg-b55f7e5a69cc = PNT essencial (onde o Kshana realmente atua)

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Estado

# text
seg-2ee4023e3a27 = O que existe

# text
seg-25843dc03c73 = O que falta

# text
seg-331d2821d43f = Roteiro

# text
seg-724b1929b536 = Determinação e propagação de órbita

# text
seg-9aa33b4484ca = partial

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
seg-7f4957a488b7 = <b>SGP4/SDP4</b> sem dependências (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), validado até { "4.12" } mm face a todos os { "666" } vetores AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (posição <b>e</b> velocidade, esta última até { "1" } mm/s); kepleriano analítico + secular de J2; velocidade inercial exposta e disponibilizada <b>de ponta a ponta</b> através do <b>cenário <c1/></b> executável (<c2/>, acessível a partir de CLI/Python/WASM/MCP (CLI: interface de linha de comandos; WASM: WebAssembly; MCP: Model Context Protocol)) — por passo emite o estado TEME (true equator, mean equinox) <b>e</b> GCRS (Geocentric Celestial Reference System) (posição + velocidade), a posição ITRF/ECEF (ITRF: International Terrestrial Reference Frame; ECEF: Earth-centred, Earth-fixed), a <b>projeção do ponto subsatélite</b> WGS-84 (WGS: World Geodetic System) (lat/lon/alt), e azimute/elevação/distância da estação + <b>taxa de variação da distância/Doppler</b> (a taxa radial de variação da distância coincide com a derivada real da posição, sem ruído de JD (JD: data juliana), até { "6e-9" } m/s) — e através da exportação de efemérides com velocidade <b>OEM</b> (Orbit Ephemeris Message) do CCSDS (Consultative Committee for Space Data Systems) (<c3/>). Um <b>propagador numérico (Cowell)</b> (<c4/>) integra um modelo de forças de <b>gravidade zonal</b> configurável — o <b>campo zonal completo da Terra até ao grau { "6" }</b> (<c5/>, o <c6/> publicado do EGM-96 (EGM: Earth Gravitational Model)) — com uma escolha de integrador adaptativo — RK4 (Runge–Kutta de quarta ordem) com <b>duplicação de passo</b> ou o par embebido <b>Dormand–Prince RK5({ "4" })</b> (<c7/> / <c8/>, uma estimativa de erro embebida mais económica, com 7 avaliações, que satisfaz a mesma barreira de Kepler e concorda com o caminho RK4 até <{ "1" } m numa órbita J2..J6) — fixado face a <b>uma referência analítica mais forte do que uma comparação numérica entre ferramentas</b>: a órbita sem perturbações reproduz a <b>solução de Kepler exata em variáveis universais a menos de um metro ao longo de { "24" } h</b> (uma barreira mais apertada do que a do marco, "face à referência < { "10" } m"), a energia e o momento angular conservam-se até ~{ "1e-9" } em termos relativos, a regressão nodal de J2 coincide com a taxa secular de forma fechada segundo a teoria de primeira ordem, verifica-se que a aceleração zonal é o <b>gradiente exato do seu próprio potencial</b> (e que se reduz à forma fechada de J2 validada com os 666 vetores), e <c9/> <b>devolve <c10/> em vez de uma resposta errada</b> quando o Newton não converge (por exemplo, perto do perigeu com e = { "0.999" }). A gravidade de <b>terceiro corpo (Sol e Lua) dirigida por época</b> está <b>ligada ao integrador variável no tempo</b> (<c11/> / <c12/>, com as efemérides de baixa precisão do Sol e da Lua de Montenbruck & Gill em <c13/> — sem necessidade de kernel DE/SPK (DE: Development Ephemeris; SPK: kernel de efemérides planetárias)): cada avaliação do RHS (right-hand side, membro direito) amostra as posições dos perturbadores na época avançada <c14/>, de modo que o Sol e a Lua se movem ao longo das suas órbitas durante a integração. Verifica-se que a perturbação é o gradiente exato do seu potencial perturbador, anula-se no geocentro e tem as magnitudes LEO (órbita terrestre baixa) de manual (~{ "5e-7" } m/s² do Sol, ~{ "1.1e-6" } m/s² da Lua); as efemérides do Sol atingem âncoras J2000 derivadas à mão (distância ao periélio, declinação de solstício de ~−{ "23" }°, movimento de ~{ "1" }°/dia) e as da Lua o seu envelope de perigeu/apogeu, a distância média de ~{ "384 400" } km, o limite de inclinação ≤ { "5.3" }° e o retorno da direção ao fim de um mês sideral; e a ligação da integração está comprovada como <b>exata ao bit</b> (o termo do RHS é igual a <c15/> na posição amostrada em t = { "0" } e t = { "1" } dia), com um desvio de época de um quarto de ano a produzir uma trajetória diferente. A <b>pressão da radiação solar</b> (SRP) usa o mesmo RHS dirigido por época (<c16/> / <c17/>): o modelo de bola de canhão <c18/> com um fator de eclipse de umbra+penumbra <c19/> (ν ∈ [{ "0,1" }] suave, verificado como decaindo através de uma penumbra monótona que se estende para além do cilindro de umbra), verificado face à pressão de manual a 1 UA (UA: unidade astronómica) (≈ { "4.54e-6" } N/m²), à magnitude LEO de ~{ "1.36e-7" } m/s² que empurra para longe do Sol, à queda com o inverso do quadrado (duplicar a distância ao Sol divide-a por quatro), a uma aceleração <b>exatamente nula</b> no cilindro de umbra e a um deslocamento propagado que escala de forma ~linear com A/m. O <b>arrastamento atmosférico</b> é o primeiro termo dependente da velocidade (<c20/> / <c21/> + o novo RHS <c22/> / com passagem de velocidade): arrastamento quadrático <c23/> face à atmosfera em co-rotação <c24/>, sendo <c25/> o <c26/> exponencial por troços de Vallado — verificado pela âncora de { "1.225" } kg/m³ ao nível do mar, por um decaimento LEO estritamente monótono com uma altura de escala física de ~{ "58" } km, pela magnitude de arrastamento de ~{ "2e-6" } m/s² a opor-se à velocidade relativa e pela <b>assinatura de dissipação</b> (uma órbita de { "300" } km perde energia específica de forma monótona e o seu semieixo maior decai uns ~km/dia limitados, ao passo que a órbita no vácuo conserva a energia). A <b>correção relativista pós-newtoniana (Schwarzschild)</b> é o segundo termo dependente da velocidade (<c27/> / <c28/>): a forma <c29/> do IERS (International Earth Rotation and Reference Systems Service) <c30/>, o principal responsável pelo avanço relativista do perigeu — verificada face ao seu valor circular de forma fechada <c31/> (radial, para fora), à sua razão de manual <c32/> para LEO em relação ao problema de dois corpos, à forma de velocidade radial simplificada à mão e à <b>assinatura conservativa</b> (perturba a órbita mas mantém o semieixo maior a menos de um metro/dia, o oposto estrutural do arrastamento). O termo de arrastamento de referencial de <b>Lense–Thirring</b> (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) é a correção gravitomagnética para além de Schwarzschild — opcional, ~{ "1" }–{ "2" } ordens de grandeza abaixo dela em LEO, verificado como anulando-se sem rotação da Terra e situando-se abaixo da magnitude de Schwarzschild. A <b>determinação de órbita</b> (OD, <c35/>) fecha o ciclo das observações de volta a um estado: um corretor <b>em lote de Gauss–Newton</b> (<c36/>) leva um <c37/> candidato ao melhor ajuste de distâncias de estações terrestres propagadas ao longo do arco (sub-métrico / mm·s⁻¹ a partir de distâncias sem ruído; ~{ "2" } m com um resíduo pós-ajuste no piso de ruído de { "5" } m — a assinatura de um ajuste de mínimos quadrados consistente), com uma variante recursiva <b>sequencial</b> sobre o filtro unscented

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = O modelo de forças de Cowell predefinido inclui apenas o campo zonal: o campo <b>tesseral</b> EGM2008 (Earth Gravitational Model { "2008" }) de alto grau (<c1/>, grau/ordem { "70" }, com um carregador <c2/> para ficheiros ICGEM (International Centre for Global Earth Models)) só é composto no motor de ajuste preciso de efemérides (<c3/>; ver <a1><c4/></a1>); a densidade de arrastamento é a exponencial por troços de Vallado <b>estática</b> (independente da atividade solar), <b>não</b> a NRLMSISE-00 (o modelo de atmosfera estendido de espetrómetro de massa e radar de dispersão incoerente do Naval Research Laboratory; a cláusula de densidade termosférica de < { "5" } %); a SRP é o modelo de <b>bola de canhão</b> com uma sombra geométrica <b>cónica de umbra+penumbra</b> (sem escurecimento de bordo solar, sem sombra de Terra achatada, sem forma/atitude do satélite); a relatividade abrange os termos de <b>Schwarzschild e de Lense–Thirring</b> (arrastamento de referencial), ambos opcionais, mas sem ajuste de parâmetros PPN (PPN: pós-newtoniano parametrizado); <b>o terceiro corpo e a SRP usam as efemérides de baixa precisão (~{ "0.005" }° para o Sol, ~{ "0.3" }° para a Lua), não a exatidão de kernels DE/SPK</b>. Os níveis conservativos do modelo de forças (dois corpos → J2–J6 → Sol/Lua → SRP) são <b>VALIDATED face ao Orekit { "12.2" }</b> (pior caso { "0.08" } m ao longo de { "24" } h, <c5/>), e a determinação de órbita em lote/sequencial é <b>VALIDATED face aos estimadores do Orekit { "12.2" }</b> (<c6/>); o nível de arrastamento e a fidelidade absoluta dos dados de efemérides/densidade mantêm-se MODELLED; não existe verificação cruzada com o GMAT (General Mission Analysis Tool)

# text
seg-c66f25447fe9 = gravidade tesseral no modelo de Cowell predefinido + arrastamento NRLMSISE-00 + escurecimento de bordo solar + efemérides de nível DE + validação cruzada com o GMAT + medições de taxa de variação da distância/ângulo em OD e STM (matriz de transição de estado) analítica: P2+

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
seg-fffd275219ff = <c1/>: API de datas julianas (civil↔JD, MJD (data juliana modificada)), UTC↔TAI (UTC: Tempo Universal Coordenado; TAI: Tempo Atómico Internacional) através da tabela completa de segundos intercalares do IERS ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT: Tempo Terrestre), UT1 (Tempo Universal { "1" }, tempo de rotação da Terra) através de DUT1 (o tempo de rotação da Terra menos o Tempo Universal Coordenado) e o <b>Ângulo de Rotação da Terra</b> IAU-2000 (IAU: União Astronómica Internacional) (ERA validado bit a bit face ao vetor <c2/> do SOFA (Standards of Fundamental Astronomy)). A <b>aproximação DUT1≈{ "0" } do caminho SGP4 está explicitamente documentada</b> no ponto de chamada de <c3/> (um erro de GMST (tempo sideral médio de Greenwich) de ≤ ~{ "13" }″, bem dentro do erro do próprio modelo SGP4), e o cenário <c4/> aceita parâmetros explícitos <c5/>/<c6/>/<c7/> <b>ou uma série IERS <c8/> real incorporada</b> (<c9/> / <c10/>, interpolada através da mesma <c11/> que <c12/> usa), de modo que a projeção no solo é reduzida através de UT1 e do movimento polar reais do IERS, e não apenas dos escalares nominais

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
seg-d488e9db94e9 = Os caminhos de órbita terrestre ainda usam um JD de <c1/> único (~{ "50" } µs de resolução perto de { "2020" } — este, e não o algoritmo, é o limite de uma verificação cruzada por diferenças finitas); existe um JD em duas partes (<c2/>, usado pelos caminhos radiométrico, CCSDS-TDM, de simulador de segmento terrestre e do sistema solar, e por <c3/> <c4/>) e é propagado através do SGP4 (<c5/>), da previsão de passagens, da geometria e dos projetos Walker (validado face ao SOFA, <c6/>), e através da rotação da Terra no caminho de órbita (<c7/>, <c8/>, <c9/>, o <c10/> opcional do cenário de efemérides; VALIDATED face ao ERFA, <c11/>), com conversões sem perdas entre <c12/> e <c13/>; os caminhos de órbita terrestre predefinidos mantêm a data de <c14/> único, a menos que <c15/> esteja definido, e a época do modelo de forças de Cowell permanece de <c16/> único de propósito (o seu erro analítico do Sol/Lua ofusca um arredondamento de { "40" } µs); o UTC de segundo elástico anterior a 1972 ({ "1960" }–{ "1971" }) é modelado no caminho de duas partes (<c17/>, <c18/>, VALIDATED face ao ERFA, <c19/>), mas <c21/> de <c20/> único continua a limitar-se a { "10" } s antes de { "1972" }; um preditor de orientação da Terra por mínimos quadrados + autorregressivo (<c22/>, comparado com o Boletim A do IERS como um resultado) pode agora estender uma série EOP para além da sua última linha (<c23/>, opcional; <c24/>), de modo que os argumentos de referencial para lá da tabela seguem a previsão em vez de ficarem limitados; a série predefinida continua a limitar-se e nenhuma chave de cenário ativa ainda a previsão

# text
seg-d59294cf367c = <b>concluído</b> (base); JD em duas partes na rotação da Terra no caminho de órbita: <b>concluído</b> (opcional no cenário de efemérides) ; previsão de EOP para além da tabela: <b>concluído</b> (biblioteca, opcional); UTC anterior a 1972 no caminho de duas partes: <b>concluído</b>

# text
seg-798b3b5db6d6 = Referenciais

# text
seg-69930da8bc5a = full

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
seg-4b3fe53b3dcd = <c1/>: TEME↔ECEF baseado em GMST, geodésico WGS-84↔ECEF (exato + inversa iterativa, com precisão de máquina a todas as altitudes) e um observador geodésico de estação terrestre (azimute/elevação/distância); <b>precessão IAU { "2006" }</b> (<c2/>: os ângulos de Fukushima–Williams <c3/> + a matriz de enviesamento-precessão GCRS↔média da data); <b>nutação IAU 2000A/2000B + cadeia completa TEME→GCRS</b> (<c4/>: a série <b>IAU 2000A completa</b> — { "678" } termos luni-solares + { "687" } planetários, <c5/> / <c6/>, tabela gerada por máquina a partir da referência <c7/> do ERFA (Essential Routines for Fundamental Astronomy) por <c8/> — a par da série 2000B de 77 termos, dos argumentos de Delaunay, da matriz de nutação <c9/> do SOFA, da equação dos equinócios e de <c10/> através de TEME→TOD→MOD→GCRS (verdadeiro da data, médio da data) — ambas as séries validadas <b>bit a bit</b> face aos vetores de referência <c11/>/<c12/> do SOFA/ERFA, Δψ/Δε até { "1e-13" } rad); <b>movimento polar do IERS</b> PEF→ITRF (pseudo-fixo à Terra para terrestre) (<c13/> / <c14/>, <c15/> do SOFA, <c16/>/<c17/> fornecidos por quem chama — um efeito de dezenas de metros ao raio orbital); <b>redução IAU 2006/2000A baseada no CIO (CIO: Origem Intermédia Celeste)</b> (<c18/>: a cadeia GCRS↔CIRS↔ITRS sem equinócio (CIRS: Sistema de Referência Intermédio Celeste; ITRS: Sistema de Referência Terrestre Internacional) — CIP (Polo Intermédio Celeste) <c19/> a partir da matriz NPB (nutação-precessão-enviesamento) 2006/2000A, a série de 66 termos do localizador do CIO <c20/>, <c21/>, o ângulo de rotação da Terra e o <c22/> completo — validada <b>bit a bit</b> face aos vetores <c23/>/<c24/>/<c25/> do SOFA). As transformações <b>de ponta a ponta</b> estão agora fixadas a um exemplo trabalhado de referência e publicado, e não apenas à autoconsistência: face ao estado <b>Vallado</b> AIAA 2006-6753 (2004-04-06, com os seus EOP (parâmetros de orientação da Terra) do IERS; <c26/>), TEME→PEF coincide até <b>{ "0.1" } mm</b>, TEME→ITRF até <b>{ "0.6" } mm</b>, o GCRS→ITRS completo por CIO até <b>{ "4" } mm</b>, e ECEF→geodésico reproduz lat/lon/alt do Exemplo 3-3 de Vallado até ao último dígito publicado. A cadeia completa é <b>acessível ao utilizador</b> através do cenário <c27/> (posição ITRF/ECEF + projeção do ponto subsatélite WGS-84 por passo)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = A cadeia TEME→GCRS predefinida usa 2000B (~{ "1" } mas, abaixo da sua própria simplificação de rotação de referencial de velocidade); o caminho de < { "0.1" } mas completo 2000A está disponível através de <c1/>, e a redução rigorosa por <b>CIO (X, Y, s)</b> está disponível através de <c2/>. O caminho TEME legado usa o GMST IAU-1982 (convenção SGP4). A verificação cruzada numérica independente com ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um conjunto de ferramentas de geometria planetária em Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) está <b>entregue</b> (<c3/>: <c4/> face ao GCRF→ITRF93 do ANISE (GCRF: Referencial Celeste Geocêntrico; ITRF93: Referencial Terrestre Internacional { "1993" }) ao longo de oito épocas { "2020" }–{ "2023" }, ≤ { "0.86" } m no solo, ≤ { "3.6" } m em órbita GNSS (sistema global de navegação por satélite)); é uma crate autónoma fora das barreiras de CI predefinidas. <c5/> e <c6/> são também verificadas diretamente face ao ERFA em { "40" } épocas { "1950" }–{ "2100" }, e a cadeia CIO aceita os desvios do polo celeste do IERS dX, dY (<c7/>; <c8/>); os caminhos predefinidos continuam a desprezar dX, dY. A matriz de verificação classifica esta linha como <b>VALIDATED</b> (vetores SOFA/ERFA + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + geodésico: <b>concluído</b> (verificado com Vallado); TEME→GCRS inercial: <b>concluído</b> (2000B + 2000A completa); ITRF com movimento polar: <b>concluído</b> (verificado com Vallado); GCRS→ITRS por CIO: <b>concluído</b> (verificado com Vallado)

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
seg-97de2d9d9ccf = Relógio de Kalman de dois estados com Q de van Loan exata (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) com uma <b>atualização de covariância estabilizada de Joseph</b> (semidefinida positiva sob razões Q/R extremas, verificada por Cholesky em CI) e um <b>monitor de saúde da consistência do filtro</b> (<c1/>): uma avaliação NIS/NEES de Monte Carlo (NIS: inovação normalizada ao quadrado; NEES: erro de estimação normalizado ao quadrado) face a bandas de confiança χ², apresentada como <c2/> no JSON (JavaScript Object Notation) do resultado e como um cartão verde/âmbar no playground, com um teste de varrimento de incompatibilidade Q/R que prova que o monitor passa a <em>inconsistente</em> quando a afinação está errada (Bar-Shalom §{ "5.4" }); estimadores sobrepostos de <b>ADEV (desvio de Allan), MDEV (desvio de Allan modificado), TDEV (desvio de tempo), HDEV</b> (desvio de Hadamard) + intervalos de confiança baseados em χ² com <b>graus de liberdade efetivos específicos do tipo de ruído</b> (formas fechadas da Tabela { "5" } do NIST SP { "1065" } para WPM/FPM/WFM/FFM/RWFM (WPM: modulação de fase de ruído branco; FPM: modulação de fase de ruído flicker; WFM: modulação de frequência de ruído branco; FFM: modulação de frequência de ruído flicker; RWFM: modulação de frequência de passeio aleatório), o conjunto que o Stable32 usa; a curva ADEV exportada identifica o tipo de lei de potência do registo a partir da sua inclinação MDEV e anexa uma banda de { "95" }% por τ — <c3/>), <b>validados numericamente face aos desvios de referência do Stable32 para o conjunto de dados canónico NBS14 até { "1e-4" }</b> (<c4/>) e com o edf verificado de forma cruzada por um conjunto de Monte Carlo de FM (modulação de frequência) branca; FoM (figura de mérito) de holdover limitada pela grelha e franca quanto aos limites; conjuntos de relógios; <b>modelo de transferência de tempo bidirecional</b> com cancelamento de atraso recíproco + um piso de atraso diferencial não recíproco de FM de passeio aleatório (<c5/>, assinatura de Allan indicada); uma <b>calculadora de holdover de relógio sem GNSS</b> (<c6/>) que expõe o crescimento do erro de deslize de van Loan de forma fechada <c7/> como uma inversão de <em>holdover até ao limiar</em> orientada ao utilizador (durante quanto tempo um relógio funciona em regime livre antes de o seu erro de temporização exceder o orçamento), com classes representativas de relógios quânticos (rede ótica/iões aprisionados/iões de mercúrio) — <b>modelada, não validada externamente</b>: verificada de forma cruzada face à recursão de covariância <c8/> em vários passos, e declarando com franqueza que, para um relógio muito estável, o holdover até um limiar apertado é <b>determinado pelo piso de ruído vermelho de tau longo <em>assumido</em>, e não pelo ADEV citado</b> (usar pisos medidos para obter um número defensável). Um <b>Nível de Proteção de Temporização condicional</b> (<c9/>) assenta no mesmo mecanismo de holdover para o caso de <em>spoofing</em>: um limite para o erro de tempo <b>não detetado</b> dada uma verificação cruzada independente — um piso de monitor de k-σ mais a variância de deslize de van Loan sobre a latência de deteção mais um tempo até ao alarme de CUSUM (soma cumulativa) — calibrado sobre um <b>spoof real registado</b> (JammerTest { "2024" }, Zenodo { "15911589" }) e reproduzível através de <c10/>. Composição <b>modelada</b>, condicionada à deteção: não existe um limite <em>incondicional</em> finito (uma rampa suficientemente lenta escapa a um único monitor assistido por relógio). O <b>erro máximo de intervalo de tempo (MTIE)</b> e o <b>TDEV</b> são VALIDATED face ao <c11/> (<c12/>, <c13/>), e a inversão da variância de deslize de holdover é VALIDATED face ao SciPy (<c14/>); o tipo de cenário <c15/> aplica-os às máscaras ITU-T (International Telecommunication Union Telecommunication Standardization Sector) G.8272 / G.8272.1 / G.8273.2 / G.8271.1 — ver <a1><c16/></a1>

# text
seg-cf16b15c0a27 = edf completo pelo algoritmo de Greenhall (as formas fechadas simples têm viés limitado mas são mais grosseiras do que o BasicSum exato) e identificação de misturas de vários ruídos

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
seg-733cf51a8c5e = Uma <b>simulação de pseudodistâncias no domínio da medição</b> (tipo de cenário <c1/>, <c2/>): por cada satélite visível sintetiza <c3/> e o Doppler em L1, com a <b>ionosfera de frequência única de Klobuchar</b> (IS-GPS-200 (IS: Especificação de Interface; GPS: Sistema de Posicionamento Global) §{ "20.3.3.5.2.5" }) e a <b>troposfera zenital de Saastamoinen</b> (Davis { "1985" }) projetadas pela <b>função de mapeamento de Niell ({ "1996" })</b> — cada modelo testado unitariamente face a um cálculo manual — e depois alimenta os resíduos ao <b>RAIM instantâneo</b> (monitorização autónoma da integridade pelo recetor) para HPL/VPL por época (HPL: nível de proteção horizontal; VPL: nível de proteção vertical) e emite uma matriz <c4/> (pseudodistância, Doppler, C/N₀, correções de ionosfera/troposfera por SV (veículo espacial, isto é, um satélite)). Além disso, DOP/disponibilidade (DOP: diluição da precisão) e RAIM por separação de soluções a partir de órbitas; <b>ingestão NAV multi-GNSS RINEX (Receiver Independent Exchange Format) { "3" }</b> (GPS/Galileo/QZSS/BeiDou (QZSS: Sistema Quase-Zenital de Satélites do Japão) via IS-GPS-200, vetor de estado do GLONASS (Sistema Global de Navegação por Satélite da Rússia)) analisada → posição ECEF e desvio de relógio do SV, utilizável como fonte <c5/> de primeira classe E como bloco <c6/> de constelação em linha (<c7/>); <b>ingestão de OBSERVAÇÕES RINEX { "3" }</b> (espera-se que o formato de observação { "4.00" } seja analisado, mas nenhum ficheiro { "4.00" } foi exercitado; os ficheiros de NAVEGAÇÃO RINEX { "4" } são recusados pelo nome em vez de serem descodificados incorretamente); um <b>solucionador de posicionamento de ponto único</b> (tipo de cenário <c8/>, <c9/>) que transforma pseudodistâncias de código RINEX reais + efemérides difundidas numa <b>posição do recetor</b> por mínimos quadrados ponderados iterados — correção de Sagnac/rotação da Terra, relógio do satélite difundido com <c10/>, a <b>combinação L1/L2 de dupla frequência sem ionosfera</b> (ou Klobuchar de frequência única), troposfera de Saastamoinen/Niell, ponderação por elevação, DOP e RAIM instantâneo — <b>validado com dados IGS (International GNSS Service) reais</b> (estação ABMF, Guadalupe, 2018-05-13) até <b>{ "5.7" } m de RMS (raiz do valor quadrático médio) 3-D / { "1.1" } m na horizontal</b> face à coordenada levantada da estação (<c11/>, <c12/>); e leitura/escrita de órbitas precisas SP3 (Standard Product { "3" }, o formato de órbitas precisas)

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = Um motor de posicionamento por <b>código</b> e, a partir da { "0.36" }, processamento de fase da portadora em observações reais: o solucionador <c1/> calcula uma posição real a partir de medições de código reais (posicionamento de ponto único, ao nível do metro, com a combinação de dupla frequência sem ionosfera); <c2/> faz RTK de linha de base curta sobre código e fase GPS reais de dupla frequência (diferenças duplas, um filtro de Kalman de valores flutuantes, fixação de ambiguidade inteira LAMBDA com teste de razão, <c3/>), e um filtro PPP estático de valores flutuantes funciona sobre código e fase reais com órbitas e relógios finais do IGS. Ambos são VALIDATED face a coordenadas ITRF2020 publicadas de estações IGS (WTZR/WTZZ, <c4/>, <c5/>, limiares fixados antecipadamente); o que continua em falta é a resolução de ambiguidade inteira em PPP, o RTK cinemático ou em rede e a operação em tempo real. O alisamento da portadora de Hatch é um resultado MODELLED fixado (os seus limiares fixados antecipadamente não foram atingidos). O tipo de cenário <c6/> executa um filtro PPP de valores flutuantes sobre medições que simula, para estudos de convergência; o pacote direto <c7/> continua a ser um simulador a partir da referência; BeiDou-GEO (GEO: órbita geoestacionária) excluído

# text
seg-61b43da61326 = Fixação de ambiguidades PPP, RTK cinemático ou em rede, operação em tempo real: usar RTKLIB/gLAB (RTKLIB: uma biblioteca de código aberto de posicionamento cinemático em tempo real)

# text
seg-820a5f1f7e3b = Fusão de sensores / navegação à estima por INS (sistema de navegação inercial)

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
seg-4181becfd059 = <b>Biblioteca strapdown de 3 eixos</b> (<c1/>): atitude por quaterniões com compensação de coning/sculling, mecanização NED (norte-este-baixo) completa (taxa da Terra + taxa de transporte, gravidade de Somigliana WGS-84) e um modelo determinista de erros de IMU (unidade de medição inercial) (<b>fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa</b> modelados). O navegador strapdown está agora <b>ligado a um pacote GNSS/INS fracamente acoplado executável</b> com uma figura de mérito (<c2/>, <c3/>): a mecanização de três eixos é disciplinada pelo <b>EKF (filtro de Kalman estendido) de estados de erro de 15 estados</b> (<c4/>, realimentação de posição/velocidade/atitude/enviesamento) enquanto o GNSS está disponível, e depois desliza através da indisponibilidade — substituindo a reposição forçada à referência por fusão genuína, e indicando o erro horizontal fundido face ao deslize de INS livre em malha aberta. O pacote <c5/> legado e separado continua a executar o orçamento <b>escalar de 1 DOF (DOF: grau de liberdade)</b> com reposição forçada à referência. Está também implementada uma atualização de <b>pseudodistância fortemente acoplada</b> (<c6/> / <c7/>): forma a inovação no domínio da distância (Jacobiano de linha de vista sobre δp) e continua a corrigir com <b>menos de quatro satélites</b>, onde uma solução PVT (posição, velocidade e tempo) fracamente acoplada não existe. Um <b>UKF (filtro de Kalman unscented) GNSS/INS fortemente acoplado completo de 17 estados</b> (<c8/>) transporta a posição, a velocidade, o erro de atitude, os enviesamentos do acelerómetro e do giroscópio e o relógio do recetor (enviesamento + deriva), com <b>navegação à estima quântica CAI (CAI: interferómetro de átomos frios)</b> — o ruído de processo de passeio aleatório de velocidade é o <c9/> derivado do acelerómetro de átomos frios — a deslizar numa indisponibilidade de 120 segundos limitada a algumas centenas de metros (face aos quilómetros de um INS livre de grau de navegação). Este UKF de 17 estados está agora <b>disponibilizado como cenário executável</b> (<c10/>, <c11/>, acessível a partir de CLI/Python/WASM/MCP): os <b>{ "15" } estados de erro do INS</b> são aumentados com a <b>correção de enviesamento do acelerómetro derivada do CAI</b> (o interferómetro de átomos frios define o piso de passeio aleatório de velocidade <c12/>) e um <b>relógio de 2 estados fase+frequência</b> cujo ruído de processo vem do <b>motor de relógio de parâmetros q</b> (<c13/>, perfil de Allan → <c14/>/<c15/>), conduzido pelo modelo de erro CAI delimitado, de modo que a execução demonstra a hibridação de curto prazo de IMU clássica + longo prazo quântico. A sua figura de mérito é a <b>autoconsistência do filtro</b> — <b>NEES + brancura da inovação (NIS)</b> agregados sobre um conjunto de Monte Carlo face às suas bandas χ² de { "95" }% (o filtro ajustado fica dentro das bandas; um filtro mal afinado é assinalado, uma barreira objetivamente verificável). <b>Esta é uma afirmação de AUTOCONSISTÊNCIA sob o ruído modelado, NÃO uma garantia de exatidão no mundo real</b> — as entradas CAI/relógio são delimitadas/modeladas, o equipamento CAI é propriedade do parceiro, e nada aqui implica TRL (nível de maturidade tecnológica)>{ "3" }, herança de voo ou validação externa. O modelo determinista de erros de IMU é <b>configurável por sensor a partir do ficheiro de cenário TOML (Tom's Obvious Minimal Language) <c16/></b> (<c17/>: fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa), com predefinição de uma fonte de enviesamento constante pura quando omitido

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = O acoplamento forte é <b>apenas de pseudodistância</b> (a fase da portadora está no roteiro); o cenário <c1/> usa uma <b>única trajetória nivelada de velocidade constante</b> na qual os estados de erro de atitude e de enviesamento de IMU são apenas fracamente observáveis, pelo que a consistência NEES é avaliada sobre o <b>subconjunto estimável</b> (posição, velocidade, relógio = { "8" } estados) — a observabilidade plena dos 17 estados exige uma trajetória com manobras (roteiro); o par enviesamento do acelerómetro/inclinação do acoplamento fraco é pouco separável, pelo que a calibração por enviesamento não é afirmada; o modelo de erros de IMU omite a retificação de vibração e a deriva por gradiente de temperatura; o UKF de 17 estados e os caminhos fortemente acoplados são <b>autovalidados</b> (integração analítica a velocidade constante, convergência do auxílio GNSS, recuperação de enviesamento, o limite de indisponibilidade de 120 s limitado por CAI e a referência de consistência χ² de NEES/NIS) — a <b>mecanização</b> strapdown em si é VALIDATED face ao NaveGo v1.4 (<c2/>: atitude idêntica bit a bit, velocidade/posição dentro de limites analíticos indicados), mas não foi executada nenhuma validação cruzada ao nível do filtro (NaveGo ou o conjunto de dados de veículo KF-GINS)

# text
seg-5d4529365f46 = acoplamento forte com fase da portadora, observabilidade plena dos 17 estados com trajetória com manobras, biblioteca de trajetórias, validação cruzada ao nível do filtro com NaveGo/KF-GINS: <b>P2</b>

# text
seg-7d33171c5e26 = <b>Integridade / RAIM / ARAIM</b> (monitorização autónoma avançada da integridade pelo recetor)

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
seg-fd0afb948d1f = <b>RAIM instantâneo real</b> em <c1/>: solução de mínimos quadrados + deteção de falhas por χ² dos resíduos (limiar exato a partir de um χ² de gama incompleta sem dependências) e <b>HPL/VPL baseados em declive</b> (pbias a partir de um χ² não central para os P_fa/P_md configurados); RAIM por <b>separação de soluções (MHSS)</b> com deteção/identificação de falhas; <b>orçamento de risco de integridade (P_HMI) do ARAIM</b> (<c2/>) que resolve o menor HPL/VPL cujo <c3/> somado satisfaz uma atribuição explícita de risco de integridade, o <b>modo de falha de toda a constelação em dupla/múltipla constelação</b> (<c4/>, EU (União Europeia) ARAIM TN (nota técnica) / DO-316; <c5/> ⇒ <c6/> idêntico bit a bit), uma <b>mensagem de suporte de integridade</b> explícita (<c7/>: σ_URA/σ_URE/b_nom/P_sat/P_const, com os valores de referência GPS+Galileo do WG-C (WG: Grupo de Trabalho)), além de um <b>diagrama de integridade de Stanford(-ESA, a Agência Espacial Europeia)</b> (o tipo de cenário <c8/>, e um renderizador autónomo <c9/> das quatro zonas + fronteira <c10/>). Documentado de ponta a ponta em <a1><c11/></a1>. Além disso, a autoconsistência do filtro da FoM do cenário (limite de k-σ)

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
seg-f5fa7c20d28d = O RAIM é acessível através do tipo de cenário <c1/> e ({ "0.36" }, opcional) ao lado da FoM de relógio/holdover como um bloco <c2/> separado (<c3/>: RAIM instantâneo num céu predefinido a partir de um local indicado, indisponível enquanto o GNSS está negado; MODELLED), nunca integrado na FoM de holdover, que continua a indicar a autoconsistência; o RAIM instantâneo inclui <b>FDE</b> de satélite único (deteção e exclusão de falhas, <c4/>, VALIDATED face ao RTKLIB <c5/> em <c6/>); a separação de soluções por hipóteses múltiplas do ARAIM ADD v4.2 com determinação de subconjuntos de vários satélites está em <c7/> (VALIDATED face ao Stanford MAAST, <c8/>), mas o orçamento <c9/> de sigma uniforme continua a cobrir apenas falhas de um só SV e de toda a constelação e não é aderente à norma ADD ({ "0.36" }, opcional: falhas simultâneas de subconjuntos de vários SV através da regra de subconjuntos do ADD v4.2 generalizada para além de pares, <c10/>, <c11/>; MODELLED, sem execução MAAST para além de pares), e a exclusão de vários SV não é modelada; e <c12/> está ligado ao executor de cenários TOML através da opção <c13/> (<c14/>), com um caminho de disponibilidade por época <c15/>; os núcleos instantâneo/MHSS/ARAIM são exercitados com <b>geometria real de órbitas precisas IGS (SP3)</b> (<c16/>) e com <b>TLE reais GPS+Galileo do Celestrak</b> (<c17/>, cada satélite propagado para uma época UTC comum — a época do TLE (conjunto de elementos de duas linhas) mais recente do conjunto, 2026-06-07T07:{ "21" }:{ "04" } — para um utilizador a { "400" } km com inclinação de { "45" }° ao longo de { "24" } h: a disponibilidade sob um VAL (limite de alerta vertical) de { "12" } m / HAL (limite de alerta horizontal) de { "10" } m é { "0.993" } só com GPS, { "1.000" } com GPS+Galileo agregados e { "0.990" } no modo duplo robusto a falhas de constelação; o valor anteriormente publicado aqui, { "0.21" }→{ "0.67" } com o modo robusto "limitado", resultou de propagar cada satélite a partir da sua própria época de TLE — um céu que nunca existiu — e foi retirado); a anterior comparação "EU-ARAIM-TN Table A-3" foi retirada (sem fonte pública), e uma reprodução das entradas de URA máxima do Marco { "3" } do ARAIM do WG-C UE-EUA, públicas (Tabelas { "5" } a { "7" }, linhas Depleted e Baseline), é tentada em <c18/> com desvios declarados (MODELLED, ver INTEGRITY.md); não certificado segundo DO-229/ARAIM

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = ARAIM de falhas múltiplas (ADD v4.2): <b>concluído</b>; subconjuntos de vários SV em <c1/> + paridade em domínio de recetor com o gLAB + ligação à FoM: <b>P2</b> (ver <a1><c2/></a1>)

# text
seg-7244b585a932 = Modelação de ameaças de spoofing / jamming

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
seg-0cf86b61224c = Um <b>detetor estocástico de time spoof</b> (tipo de cenário <c1/>, <c2/> + <c3/>): quatro formas de injeção (rampa linear, salto em degrau, meaconing, replay) face a um monitor assistido por relógio com um <b>teste de energia χ²₁ / de Neyman–Pearson</b> bilateral, com o limiar de deteção definido a partir de um orçamento-alvo de falsos alarmes <c4/>, e a <b>probabilidade de deteção falhada <c5/> indicada tanto em forma fechada como por Monte Carlo</b> (as duas concordam até alguns ×1/√N) — a figura de mérito de segurança é <c6/>. Além disso, um <b>modelo de jamming por orçamento de ligação</b> (tipo de cenário <c7/>, <c8/>): razão entre o jammer e o sinal a partir da geometria (perda de percurso em espaço livre + ganho da antena de receção por direção), a <b>equação normalizada de C/N₀ efetivo antijamming</b> (ganho de processamento de despreading + fator de separação espetral <c9/>; Kaplan & Hegarty §{ "9.4" }), perda de sincronização por satélite num limiar de seguimento configurável e uma figura de mérito <c10/> sobre uma constelação Walker. Além disso, uma <b>suite de monitores de spoofing em múltiplas camadas de RF/medição (RF: radiofrequência)</b> (<c11/>): um teste de paridade de <b>consistência RAIM com vários satélites</b> (<c12/>, SOS (soma dos quadrados) ponderada dos resíduos face a um limiar χ²(m−{ "4" }) — e assinala corretamente que um enviesamento de modo comum é invisível ao RAIM), um <b>monitor de AGC (controlo automático de ganho)</b> (<c13/>, excesso de potência recebida acima do piso esperado), um <b>monitor de qualidade do sinal / SQM (monitorização da qualidade do sinal)</b> (<c14/>, desequilíbrio dos correlacionadores Early/Late) e um combinador de fusão de camadas (<c15/>). Estes compõem um <b><c16/> integrado</b> cujo <c17/> ingere uma época de observáveis (geometria + resíduos, potência de AGC, derivações Early/Late) e executa as três camadas através da fusão ponderada numa única chamada, devolvendo os diagnósticos por camada; está exposto como o <b>cenário <c18/></b> executável (<c19/>, acessível por CLI / Python / playground, JSON + SVG (Scalable Vector Graphics)) e <b>caracterizado face aos parâmetros publicados dos cenários TEXBAT (Texas Spoofing Test Battery)</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" }; <c20/>) — reproduzindo o padrão de detetabilidade documentado, incluindo os resultados negativos: ds2 de potência excessiva apanhado por AGC + SQM, ds3 de potência igualada apenas por SQM, ds4 de empurrão de posição por RAIM, e ds7 de potência igualada e alinhado em fase da portadora deixado (corretamente) ao detetor assistido por relógio

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
seg-e423ffff332b = O tipo de cenário <c1/> é um <b>orçamento de ligação</b> — não tem multipercurso nem dinâmica de AGC no tempo. Desde a { "0.36" } aceita quatro secções opcionais: <c2/>, um feixe de agrupamento adaptativo por canal (anulação direcional ou MVDR a partir de <c3/>, verificado face a um recálculo independente em numpy; MODELLED), e <c4/>, a perda de difração única em aresta de faca do percurso do emissor de jamming sobre um mosaico SRTM (<c5/>, ITU-R P.526-15 §{ "4.1" }, verificada face a um recálculo independente em numpy num mosaico real; MODELLED, apenas uma aresta de faca), <c6/>, a histerese entre aquisição e seguimento, e <c7/>, a leitura estabilizada do AGC e a perda do quantizador do ADC para entrada gaussiana (<c8/>; assinalada como não válida para emissores de jamming não gaussianos; MODELLED). O multipercurso especular, o desvanecimento em móvel terrestre e o AGC existem na camada IQ (<c9/>, <c10/>, <c11/>) e não estão ligados ao tipo de cenário <c12/>; a tabela de separação espetral <c13/> contém os valores de manual por tipo (CW e banda estreita { "1" }, banda larga e varrido { "2" } desde a { "0.36" }), <b>fixada aos coeficientes derivados das densidades espetrais de potência (PSD)</b> em <c14/> (ver a linha do sinal de navegação). O detetor de spoofing assistido por relógio é de relógio único; os monitores de RF/medição estão agora integrados (<c15/>) e <b>caracterizados face aos <em>parâmetros</em> publicados dos cenários TEXBAT</b> (Humphreys et al.); o que resta é a validação face aos vetores <b>em bruto</b> — amostras IQ (em fase/quadratura) do TEXBAT (que exigem um front-end de aquisição/seguimento SDR (rádio definido por software) que o Kshana não tem, por ser um simulador e não um recetor) ou um cenário Spirent licenciado — um desenvolvimento seguinte documentado

# text
seg-34e1b6a6b738 = <b>detetor combinado</b> assistido por relógio + consistência integrada RAIM multi-SV + AGC + SQM + caracterização com parâmetros TEXBAT: <b>concluído</b>; validação com vetores em bruto (TEXBAT IQ / Spirent licenciado): desenvolvimento seguinte

# text
seg-557448077fb0 = Modulação do sinal de navegação e desempenho do seguimento de código

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
seg-22893b9a2c7a = <c1/>: o <b>nível do sinal</b> entre o orçamento de ligação e o domínio da medição. <b>Densidades espetrais de potência</b> de área unitária para <b>BPSK-R(n)</b> (modulação por desvio de fase binária, chips retangulares) e <b>sine-BOC(m,n)</b> (portadora com desvio binário) (validadas em CI quanto à área unitária, à forma fechada do coeficiente de separação espetral (SSC) próprio do BPSK <c2/> e à divisão espetral do BOC — nulo na portadora, picos em ±f_s); o <b>coeficiente de separação espetral</b> <c3/>, que agora <b>deriva o <c4/> antijamming</b> usado por <c5/> a partir dos espetros reais do sinal e do emissor de jamming (<c6/>) em vez de uma constante representativa (a referência de banda larga é verificada de forma cruzada em CI); a <b>largura de banda RMS (Gabor)</b> (BOC > BPSK — a medida de informação de distância / de Cramér–Rao); a <b>instabilidade de ruído térmico do seguimento de código por DLL (malha de bloqueio de atraso) coerente early–late</b> (Kaplan & Hegarty §{ "8" } — ~sub-métrica para C/A a { "45" } dB-Hz, monótona em C/N₀); e o <b>envelope do erro de multipercurso</b> (EML (early-minus-late) coerente, obtido localizando o zero do discriminador composto — supressão do correlacionador estreito verificada). Uma camada de <b>compromissos de projeto de códigos de distância</b> (<c7/>) acrescenta o lóbulo lateral da autocorrelação periódica de sequências-m/Gold (<c8/> para uma sequência-m) e o <b>limite de correlação cruzada de Gold <c9/></b> de três valores — reproduzindo a correlação cruzada de Gold do <b>GPS C/A de −{ "23.9" } dB</b> publicada (uma âncora externa) e a contagem de sequências-m <c10/> — além da inversão entre comprimento do código e distância não ambígua; as garantias de Gold devolvem com franqueza <em>None</em> onde não existe par preferencial (<c11/>), em vez de indicarem um limite que não se verifica.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Desde a { "0.31.0" }, a <b>camada IQ</b> separada (<c1/>, os comandos <c2/>; projeto em <a1><c3/></a1>) acrescenta uma cadeia de recetor por software: aquisição por FFT (transformada rápida de Fourier), um banco de seguimento multicanal DLL/PLL/FLL (malhas de bloqueio de atraso, de fase e de frequência), filtragem de front-end e quantização de 1 a 14 bits, e transmissão contínua de conjuntos de dados registados. Um recetor por software independente recupera a referência injetada das suas cenas, e os códigos GPS L1 C/A e os bits LNAV (mensagem de navegação legada) são idênticos bit a bit aos do gps-sdr-sim. Continua em falta: os discriminadores das malhas assumem o triângulo de correlação BPSK ideal, pelo que não existe resolução da ambiguidade de seguimento BOC; os modelos de canal e de malha são MODELLED, verificados face a formas fechadas e à referência injetada, <b>não face a IQ de terreno medido</b>; apenas malhas escalares (sem seguimento vetorial). O projeto de <b>hardware</b> de antenas/carga útil de RF (diagramas de radiação, front-end) está deliberadamente fora do âmbito — é o papel de um parceiro de carga útil.

# text
seg-a62a0d9aa1d0 = Ambiguidade BOC + validação da camada IQ com IQ de terreno: P2+

# text
seg-6b974aba070f = Física de sensores quânticos para PNT

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
seg-3773b241a9e5 = A maioria dos sensores são <b>coeficientes publicados de Allan/orçamento de ruído</b> (CSAC, ótico), <b>mais um acelerómetro de interferómetro de átomos frios (CAI) de primeiros princípios</b> em <c1/>: a fase de Mach–Zehnder de três impulsos <c2/>, o ruído de projeção quântica (shot) <c3/>, a PSD derivada de passeio aleatório de velocidade <c4/> que a pilha inercial consome, o decaimento do contraste, a função de transferência de vibração <c5/> + variância de PSD branca e, agora, os sistemáticos de <b>Coriolis/rotação</b> (<c6/>, enviesamento equivalente <c7/>) e de <b>desvio de luz AC-Stark (AC: corrente alternada)</b> (<c8/>, cancelamento simétrico) + uma <b>varredura de deriva</b> do tempo de ciclo (<c9/>), e um <b>orçamento composto de erro de navegação à estima quântico-inercial</b> (<c10/>) que reúne o passeio aleatório de velocidade de ruído branco do CAI com o enviesamento residual (<c11/>, verificado de forma cruzada face ao integrador de Euler <c12/> independente), o erro de fator de escala e uma degradação opcional da estabilidade <b>de longo prazo</b> (distinta da decoerência por disparo) numa única figura de deriva de posição ao longo do holdover, mais um holdover inercial até ao limiar — o gémeo de navegação à estima do holdover do relógio. O piso quântico modelado está <b>delimitado (não igualado)</b> face aos { "96" } nm/s²/√Hz do gravímetro móvel de Freier et al. { "2016" } (arXiv:{ "1512.05660" }) — situa-se abaixo dele e a ~{ "2" } ordens de grandeza. Documentado em <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Sistemáticos de frente de onda/apontamento do feixe não modelados; o <em>limite</em> de ambiguidade de franjas de Mach–Zehnder está modelado (<c1/>, <c2/> em <c3/>), mas a resolução da ambiguidade não; os orçamentos exatos de ensaio em voo do CARIOQA-PMP (CARIOQA: Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense (exigem PSD de plataforma publicadas + SNR (relação sinal-ruído) por disparo) e uma predefinição de playground em JS (JavaScript) permanecem por fazer

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = sistemáticos de frente de onda + reprodução de ensaio em voo: P2+ (<a1><c1/></a1>)

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
seg-59e99de860b2 = Walker sintético (tanto kepleriano analítico <b>como de elementos médios SGP4</b>, este último propagado através do núcleo validado a { "4.12" } mm — <c1/>) + visibilidade e DOP de multiconstelação com TLE reais (GPS+Galileo até { "100" }%), validados face a um <b>instantâneo real gps-ops do Celestrak</b> (<c2/>); uma <b>varredura de projeto de PDOP (diluição da precisão de posição)</b> sobre a grelha <c3/> e figuras de mérito de <b>fração de cobertura / tempo de revisita</b>; o <b>tipo de cenário <c4/></b> executável (padrões Walker delta e estrela na convenção i: T/P/F, listas explícitas de elementos, projetos de várias camadas e predefinições publicadas, em torno da Terra, da Lua, de Marte ou de qualquer outro corpo catalogado) cuja geometria Walker e cujas posições GPS, Galileo e GLONASS publicadas são VALIDATED face às tabelas publicadas e cuja linha de base global de diluição da precisão do GPS é VALIDATED face à norma de desempenho do Serviço de Posicionamento Padrão do GPS, enquanto os mapas de cobertura de projetos arbitrários permanecem MODELLED; um <b>otimizador de projeto sem gradiente</b> (<c5/>) que procura na grelha o melhor projeto para um objetivo escolhido (<c6/> / <c7/> / <c8/>), validado por devolver o vencedor da força bruta; e a <b>geometria analítica de ruas de cobertura</b> (<c9/>, <c10/>; formas fechadas de Rider/Beste, verificadas à mão — GPS com máscara de { "5" }°: λ ≈ { "71.2" }°, semilargura da rua de 4 satélites ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Existe um dimensionamento idealizado de <b>número mínimo de satélites por ruas de cobertura</b> (<c1/>); a correção de Rider exata na junção, na fronteira de planos em contrarrotação, não está implementada; o playground desenha uma vista orbital 3-D sem dependências (<c2/>), e uma exportação CZML (Cesium Language), <c3/>, carrega a geometria no globo CesiumJS; o núcleo de DOP é VALIDATED face ao gnss_lib_py (<c4/>), e toda a cadeia de visibilidade de multiconstelação é verificada de forma cruzada de ponta a ponta face ao Orekit { "12.2" } + gnss_lib_py (<c5/>): os projetos para a Terra concordam em todos os limiares, mas os projetos para a Lua e Marte falham o limiar de DOP em geometria numericamente singular, pelo que a linha continua MODELLED; "cima" geodésico vs geocêntrico no referencial de DOP

# text
seg-3fcc2a2a90ba = dimensionamento por ruas de cobertura + vista orbital 3-D + verificação cruzada de ponta a ponta para a Terra: <b>concluído</b>; correção de Rider exata na junção + DOP fora da Terra mal condicionado: P2

# text
seg-afd5b595ee5e = Verificação e validação

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Verificações com referência independente externa em todo o motor (SGP4 face a { "666" } vetores AIAA, a família de Allan face ao Stable32 e ao allantools, referenciais face ao SOFA/ERFA, modelo de forças e determinação de órbita face ao Orekit, ARAIM face ao exemplo trabalhado do WG-C, e mais; a contagem atual é o cabeçalho gerado de <a1><c1/></a1>); verificações de Allan deterministas; uma <b>matriz de verificação verificada por máquina</b> (<c2/>) — uma referência cruzada requisito→módulo→teste→referência independente→estado cujas invariantes de rigor são <b>testadas unitariamente</b>: uma linha só pode ser etiquetada como <em>validada</em> se tiver uma referência independente <b>externa</b> (NIST/AIAA/SOFA/IGS/valor publicado), de modo que uma verificação de autoconsistência interna não possa passar por validação; produz Markdown/CSV (CSV: valores separados por vírgulas) para uma referência cruzada de verificação ECSS-E-ST-10-02 (ECSS: European Cooperation for Space Standardization) e regista como tal as quatro lacunas de hardware/PA (PA: garantia do produto) que são da responsabilidade de parceiros

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Os conjuntos de calibração cobrem até agora três verificações de semente única (<a1><c1/></a1>, fixadas antecipadamente: o intervalo de bootstrap de Monte Carlo cobre em { "96" } % de { "200" } sementes; uma tolerância de percentil é frágil à semente, NOT MET a { "91.5" } %); as restantes linhas continuam calibradas com sementes únicas. A matriz impõe a <em>classificação</em> das linhas, e a CI verifica agora também que todos os testes, ficheiros e itens da crate citados por uma linha existem (<c2/>, <c3/>) e que as figuras publicadas continuam a reproduzir-se (<c4/>); não avalia a própria referência independente, que um revisor continua a ler

# text
seg-d3b92a831cd9 = conjuntos de calibração: P1

# text
seg-f382bb1b5d54 = LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Sete tipos de cenário, agnósticos quanto ao sistema, com predefinições públicas nomeadas: <b><c1/></b> (projetos de sinal de qualquer banda e estrutura: componentes BPSK, BOC, MBOC (BOC multiplexado) ou de tipo OFDM plano (multiplexagem por divisão de frequências ortogonais), seguimento de código, aquisição, compatibilidade GNSS, compromisso de bandas), <b><c2/></b> (uma passagem projetada, por elementos, TLE ou Walker com um orçamento de ligação por banda: chuva, cintilação e perda de entrada em edifícios segundo o ITU-R (Setor de Radiocomunicações da União Internacional das Telecomunicações), ionosfera, antena, Doppler, face aos satélites GNSS MEO (órbita terrestre média) à vista), <b><c3/></b> (efemérides e relógio difundidos sobre a base kepleriana do ICD (documento de controlo de interface) do Galileo ou modelos LEO selecionáveis, ajustados e codificados com uma verificação de trama CRC-24Q (verificação de redundância cíclica de 24 bits)), <b><c4/></b> (posicionamento fundido MEO + LEO por pseudodistância e Doppler sobre quaisquer constelações), <b><c5/></b> (convergência de PPP com e sem aumentação LEO, sobre medições simuladas), <b><c6/></b> (limites de posicionamento 5G NTN, redes não terrestres, a partir da largura de banda do sinal) e <b><c7/></b> (um sistema de ponta a ponta, com a saída de cada fase entregue à seguinte). Partes VALIDATED: os termos de ligação do ITU-R face às tabelas e aos exemplos de validação das Recomendações, o Doppler máximo face a uma tabela publicada, o algoritmo de utilizador do Galileo face ao RTKLIB até { "1" } mm, o CRC-24Q, os pesos do SISRE (erro de alcance do sinal no espaço)

# text
seg-5f87d4e409d5 = Sem dados de terreno nem sinais registados; as figuras de posicionamento, PPP, NTN e temporização são MODELLED (formas fechadas, consistência de filtros, comparações de tendências publicadas); as predefinições são de fonte pública ou derivadas, não dados de operadores

# text
seg-d29a58fe2c84 = validação com sinais reais registados: P3

# text
seg-4ea6f7ecc4a7 = Espetro / ambiente de RF

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>Tipo de cenário <c1/></b> (<c2/>): a banda L do GNSS (e projetos multibanda UHF (frequência ultra-alta), banda S e banda C) como uma única densidade espetral de potência, com a frequência na horizontal e o tempo na vertical, sob uma cronologia programada de emissores de jamming (de onda contínua, de banda estreita, chirp e de banda larga igualada), com J/S (razão entre o jammer e o sinal) e C/N₀ (densidade de portadora/ruído) efetivo por banda; gravações SigMF de entrada e saída e estimativas espetrais de Welch de amostras complexas. Os espetros de sinal de forma fechada e os coeficientes de separação espetral são VALIDATED; a cascata é MODELLED

# text
seg-970852c2e2e8 = Sinais GLONASS, BeiDou e Galileo E6 não modelados; sem front-end de recetor nem validação com IQ (em fase/quadratura) registado

# text
seg-5402957c3eb5 = comparação com sinais registados: P3

# text
seg-a5e741fa9d69 = Confiança nos registos do recetor (embarcações e uso geral)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/>: monitores sobre o próprio registo de um recetor (densidade de portadora/ruído, consistência de posição, velocidade e rumo, tempo) com eventos e previsões declarados antes da execução; numa plataforma de embarcação, uma pontuação de 0-100 com razões; modo em direto sobre um fluxo com a frase <c2/> e uma barreira opcional. MODELLED; consultivo, não é um equipamento de navegação homologado

# text
seg-810132d58fbf = Os limiares são predefinições declaradas, não medidas face a recetores em serviço; um registo pontua apenas esse registo; sem entrada nem saída de radiofrequência; não é um equipamento de navegação homologado

# text
seg-82017a0ec045 = Pacotes de evidências e telemetria de confiança

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/>: um pacote assinado e encadeado por hash de uma janela de registo, da sua configuração e do resultado do motor, verificável offline, com um token de marca temporal RFC { "3161" } opcional. <c2/>: o fluxo de confiança como métricas Prometheus, eventos syslog (CEF ou LEEF) e OpenTelemetry opcional, com um painel Grafana de exemplo

# text
seg-9d2138e7a040 = Um pacote é um registo técnico, não um parecer jurídico, e não diz o que causou um evento; a assinatura da autoridade de marcação temporal não é verificada; a telemetria transmite apenas telemetria

# text
seg-744f186bdf09 = Fluxos de formação de tripulações e mapas de interferência

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/>: NMEA sintético de ponte com eventos programados de jamming, drag-off, time spoof e replay e um registo de instrutor (apenas texto). <c2/>: mapas agregados de navegação degradada a partir de relatórios de aeronaves e navios de licença aberta e a exposição de uma rota, a partir de ficheiros locais

# text
seg-91174c1a81be = Os fluxos são dados de formação, nunca para os sistemas de navegação em funcionamento de uma embarcação; os mapas são agregados, não uma previsão, e dependem dos relatórios fornecidos

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/>: o movimento do veículo e os eventos de um cenário <c2/>, <c3/> ou <c4/> como CSV de movimento, NMEA, texto de pontos de passagem e ficheiros de eventos para um simulador GNSS de laboratório

# text
seg-e5aa0f32fb2a = Não é escrito nenhum sinal; não é afirmado nenhum desempenho de simulador ou de recetor; os ficheiros são verificados tal como relidos pelos leitores de movimento de um simulador de código aberto (gps-sdr-sim), mas a física da própria trajetória de referência do cenário não é verificada externamente

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> e <c2/>: lê páginas I/NAV do Galileo ou um fluxo UBX e indica, por satélite e época, se os dados de navegação estão autenticados (chave assinada com raiz de Merkle, cadeia TESLA, MAC), com a razão da falha de uma verificação e uma referência temporal independente opcional para a atualidade; também <c3/> em Python e WebAssembly

# text
seg-0e782e8a2775 = Autentica dados face a chaves fornecidas pelo utilizador; não afirma desempenho antispoofing e não é um serviço de integridade de navegação nem um equipamento homologado; verificado com vetores sintéticos, os vetores de teste oficiais do ICD são um descarregamento externo

# text
seg-98d0bc6b40ce = Mapeamento de compliance de referenciais públicos

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> e <c2/>: saídas do Kshana associadas a seis referenciais e normas públicos de resiliência, com fontes e uma lacuna em cada linha; uma execução só conta quando o seu resultado inclui os campos que o seu tipo de cenário escreve

# text
seg-50652c747b6a = Um mapeamento é um juízo; o relatório diz o que um conjunto de execuções fornece elementos de prova em apoio de, nunca que um referencial é satisfeito ou que um produto é aprovado; a EN { "16803" } é citada apenas a partir do texto do catálogo

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Um plugin Signal K, o OpenCPN através de NMEA em modo de barreira sobre TCP e uma compilação de referência para um computador pequeno junto ao recetor (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Testado sobre saída sintética registada; o plugin não está publicado no npm; consultivo, não é um equipamento de navegação homologado

# text
seg-8281218f1c7c = Domínios mais amplos de sistemas espaciais (fora do âmbito atualmente)

# text
# c1: partial
seg-b564e0b42adc = Vários destes são <b>none</b>; outros são agora <b>modelos de primeira ordem <c1/></b> (os tipos de cenário de análise de missão / ambiente acrescentados na série { "v0.17.0" }) — listados para que o âmbito seja inequívoco, e não implícito pelo silêncio. O Kshana é um simulador PNT, não o GMAT/STK/Orekit (STK: Systems Tool Kit); estes modelos adjacentes são deliberadamente de primeira ordem e MODELLED, nunca ferramentas de voo validadas.

# text
seg-8125b00a48e4 = Nota / roteiro

# text
seg-6779cc4a0e99 = Conceção de missões / otimização de trajetórias

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
seg-3c1a80170fd5 = <c1/>: nós de ΔV impulsivos com propagação de covariância { "6" }×{ "6" } (referenciais de erro de execução ECI/LVLH (ECI: inercial centrado na Terra; LVLH: vertical local, horizontal local)), integração de queima finita verificada face à equação de <b>Tsiolkovsky</b> de forma fechada até < { "0.01" } %, um solucionador de <b>Lambert de revolução única Izzo-2015</b> + um <b>propagador de Kepler</b> exato em variáveis universais (saídas de Lambert reconduzidas à referência de dois corpos) e uma varredura <b>porkchop</b> (lançamento × chegada) de C3 / V∞ de chegada emitida como grelha de contornos JSON cujo mínimo é verificado face ao piso analítico de Hohmann. <b>Sem otimizador de trajetória</b>; um solucionador de <b>Lambert de várias revoluções</b> (<c2/>, até três revoluções, ambos os ramos) é VALIDATED face ao pykep { "3.0.1" } (<c3/>); o porkchop corre sobre o modelo sintético circular coplanar ou, com <c4/>, sobre um SPK DE440 (VALIDATED face a estados SPICE + o Lambert do pykep, <c5/>); <c6/> encontra o ótimo contínuo de data (C3 mínimo ou V∞ de chegada mínimo, Tipo I ou II) em DE440, VALIDATED face a um otimizador independente SPICE + pykep + SciPy (<c7/>); face aos mínimos Terra–Marte { "2026" } publicados no NASA/TM-2010-216764 coincide com os valores do Tipo II e falha o C3 mínimo do Tipo I em −{ "5.18" } % (registado). O GMAT em si não foi executado; o pykep é a referência independente de biblioteca. Existem agora uma <b>junção de efemérides planetárias</b> de espaço profundo (<c8/>) e uma <b>verificação cruzada DE440 (Development Ephemeris { "440" })</b> (<c9/>, { "137" } m @ arco de Marte de 1 dia) — ver a linha de PNT de espaço profundo / interplanetário. A camada de simulação de desempenho acima do GMAT/Orekit, não uma substituição. P3

# text
seg-e42e299359d6 = AOCS (sistema de controlo de atitude e órbita) / GNC (guiamento, navegação e controlo) / atitude

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
seg-a1bccf1c2e01 = Tipo de cenário <c1/> (<c2/>): <b>binário de gradiente de gravidade</b> no pior caso <c3/> + <b>orçamento de erro de apontamento RSS (raiz da soma dos quadrados)</b> sobre termos de 1σ por contribuinte — um orçamento escalar MODELLED de apontamento/perturbações antes do hardware. A <b>dinâmica de atitude de corpo rígido</b> sem binário com estado em quaterniões (<c4/>: equações de Euler + cinemática de quaterniões, RK4) é VALIDATED face ao hub de veículo espacial Basilisk { "2.9.1" } (<c5/>, quaternião dentro de { "1e-9" } ao longo de { "1e4" } s), e o pico do binário de gradiente de gravidade face ao GravityGradientEffector do Basilisk (<c6/>); a determinação de atitude de Wahba está em <c7/>. <b>Tipo de cenário <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>): uma manobra de apontamento inercial com rodas de reação equilibradas sob realimentação MRP, binários de roda de norma mínima com limites de motor; a malha fechada é <b>VALIDATED</b> face ao Basilisk { "2.9.1" } em três casos fixados antecipadamente até ao erro de arredondamento. Um MEKF a partir de um giroscópio e de um seguidor de estrelas (<c12/>) pode fechar a malha sobre a sua estimativa (MODELLED, consistência do filtro). Sem guiamento de seguimento, sem realimentação integral, sem gestão de momento, sem magnetorquers, propulsores, atrito de rodas ou limites de velocidade; sem ambiente de binários externos na dinâmica de atitude; não é um controlador de voo. P3

# text
seg-eb137d279247 = Referenciais → fixos à Terra

# text
seg-c45f5e2f4bec = <b>Concluído</b> — TEME→ECEF/ITRF, movimento polar e a cadeia GCRS→ITRS baseada no CIO estão implementados e VALIDATED (bit a bit face ao SOFA/ERFA; { "4" } mm de ponta a ponta face a Vallado). Ver a linha <b>Referenciais</b> acima

# text
seg-aa268d6f1635 = Comunicações e orçamentos de ligação

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/>: um <b>orçamento de ligação de Friis para espaço profundo</b> (potência de Tx · ganhos de antena · ruído → C/N₀ · Eb/N₀ · margem) que alimenta o caminho radiométrico/GSE (GSE: equipamento de apoio em terra), além das ligações óticas/RF de transferência de tempo (<c2/>), e o <b>tipo de cenário <c3/></b> executável — a equação de ligação unidirecional CCSDS-401/DSN-810-005 (DSN: Deep Space Network) <c4/> com entradas de <b>EIRP (potência isotrópica radiada equivalente) / G-T</b> e seleção de banda S/X/Ka (orçamento de ligação de engenharia MODELLED, não uma ficha técnica de terminal calibrada). Sem agendamento de acessos, sem codificação adaptativa. P2

# text
seg-cd6f9d8d0dc2 = Segmento terrestre e operações

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = Tipo de cenário <c1/> (<c2/>): <b>previsão de passagens com nascimento/ocaso para estações terrestres</b> — AOS/TCA/LOS (AOS: aquisição do sinal; TCA: instante de maior aproximação; LOS: perda do sinal), elevação máxima, duração por passagem e acesso total ao longo de um horizonte, a partir de um conjunto de elementos SGP4 no referencial fixo à Terra IAU 2006/2000A com refração ITU-R P.834-9 e tempo de luz — <b>VALIDATED face ao Orekit { "13.1.8" }</b> em estações ao nível do mar ({ "60" } casos / { "1210" } passagens, <c3/>); o <c4/> geométrico é VALIDATED face ao detetor de elevação do Orekit { "12.2" } ({ "22" } cenários / { "129" } passagens, <c5/>); sem otimizador de agendamento nem resolução de conflitos. P3

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
seg-4f1158386205 = TOML de entrada/JSON de saída à medida; <b>exportação <em>e importação</em> CCSDS OEM (Orbit Ephemeris Message)</b> (502.0-B KVN (notação chave-valor), GMAT/Orekit/STK) através do <b>tipo de cenário <c1/></b> executável (ponte de ida e volta <c2/> <c3/>; a troca aderente à norma de objeto único está <b>VALIDATED</b> face ao analisador <c4/> { "0.4.5" } independente); <b>análise + emissão de Tracking-Data-Message CCSDS-TDM ({ "503" })</b> (<c5/>, o formato de intercâmbio radiométrico de espaço profundo); e o <b>tipo de cenário <c6/></b> (<c7/>): codificação/descodificação do cabeçalho primário do <b>Space Packet CCSDS 133.0-B</b> com ida e volta exata ao bit. Um escritor <b>CCSDS OMM</b> (Orbit Mean-Elements Message, 502.0-B-2, parte da família ODM) (<c8/>) publica elementos médios SGP4 em KVN, e um <b>leitor de kernels NAIF SPICE</b> em Rust puro (<c9/>: contentor DAF, SPK tipo { "2" }, PCK binário tipo { "2" }) suporta <c10/>. Outros tipos de mensagem CCSDS (OPM, OCM, AEM (AEM: Attitude Ephemeris Message)) e a <em>escrita</em> SPICE continuam a ser um item do roteiro (P2)

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
seg-b41f3b5644a8 = <b>NAV multi-GNSS</b> RINEX { "3" } — GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>e GLONASS</b> (vetor de estado PZ-90 (PZ: Parametry Zemli, o datum geodésico russo) RK4) — ingerida + propagada + executável como uma constelação mista; <b>analisador de OBSERVAÇÕES RINEX { "3" }</b> (pseudodistância/portadora/Doppler/SNR por código de observação, com indicadores LLI/SSI (LLI: indicador de perda de sincronização; SSI: indicador de intensidade do sinal); espera-se que { "4.00" } seja analisado, não testado); <b>ida e volta de leitura ↔ escrita</b> de efemérides precisas SP3-c/d (análise + exportação para Ginan/RTKLIB/gLAB) <b>e um propagador de Lagrange de ordem 10 (11 pontos)</b> (<c1/>); a exportação SP3 está <b>exposta na CLI</b> (<c2/>, ou <c3/>) e <b>validada em ida e volta</b> face à constelação GPS real até <{ "0.5" } m ao longo de { "24" } h (<c4/>); <b>escritor de efemérides CCSDS OEM { "2.0" }</b> — a exportação do estado TEME com velocidade para ferramentas de dinâmica de voo — agora <b>exposto na CLI</b> (<c5/>, ou <c6/>) e verificado em ida e volta face ao estado do propagador (<c7/>). O <b>analisador de observações RINEX alimenta agora uma solução de posicionamento de ponto único</b> (<c8/>, validada com dados IGS reais — ver a linha GNSS / PNT). Além disso, <b>análise + emissão de tracking-data-message CCSDS-TDM ({ "503" })</b> (<c9/>). Exportações de geometria para visualizadores e ferramentas de análise de missão: <b>CZML, KML (Keyhole Markup Language), GeoJSON e efemérides STK</b> (<c10/>, <c11/>), cada uma analisada de volta por um validador escrito a partir da especificação do formato (<c12/>), uma importação de rota GeoJSON (<c13/>), gravações <b>SigMF</b> (Signal Metadata Format) de entrada e saída para o tipo de cenário <c14/>, e texto em estilo RINEX-4 / CSV para a mensagem de navegação LEO (<a1><c15/></a1>, <a2><c16/></a2>). Sem BeiDou-GEO, sem fixação de ambiguidade inteira em PPP nem RTK cinemático (existem PPP estático de valores flutuantes e RTK de linha de base curta com dados reais, ver a linha GNSS / PNT), sem escritor SPICE e ainda sem OPM/AEM (o <b>leitor OEM</b> existe através do tipo de cenário <c17/>, o <b>escritor OMM</b> em <c18/> e um <b>leitor SPICE SPK/PCK</b> em <c19/>) — <b>P2</b> "anexar domínios adjacentes através de formatos normalizados"

# text
seg-437dbb962136 = Meteorologia espacial / ambiente (iono/atmo/radiação)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = Tipo de cenário <c1/> (<c2/>): índices solares/geomagnéticos (tabela de 28 níveis <b>Kp↔ap</b> da IAGA (International Association of Geomagnetism and Aeronomy), Ap diário, <b>F10.7a</b> centrado de 81 dias), <b>temperatura exosférica de Jacchia-71</b> e um <b>acoplamento de densidade termosférica dirigido pela atividade</b> sobre uma atmosfera estática — MODELLED de primeira ordem, <b>NÃO</b> um modelo de densidade absoluta NRLMSISE. Ionosfera: o modelo difundido de Klobuchar (VALIDATED face ao RTKLIB) e um leitor de mapas IONEX (IONosphere map EXchange format) de TEC (conteúdo eletrónico total) (<c3/>, testado unitariamente). Um mapa ionosférico global CODE real (<c4/>) é a referência medida da linha de TEC oblíquo sem geometria (<c5/>), mas esse teste avalia o mapa no seu próprio gerador de fixtures, pelo que o leitor <c6/> em si ainda não foi verificado de forma cruzada face a um produto real; sem modelo de ionosfera de base física nem dirigido pela meteorologia espacial; P2+

# text
seg-78a2c5a930e8 = Navegação por mapas gravíticos / alt-PNT

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
seg-431b3f05c08c = <c1/>: um <b>modelo de medição de gravímetro</b> de átomos frios cujo piso de ruído branco é derivado da ASD do acelerómetro CAI (<c2/>), um <b>campo de anomalia gravítica em harmónicos esféricos totalmente normalizados</b> de baixo grau (validado face às funções de Legendre de forma fechada e a uma anomalia de termo único derivada à mão) mais <b>mascons</b> sintéticos, e um <b>filtro de partículas de correspondência com mapas gravíticos</b> (que compõe <c3/> + <c4/>) que recupera uma trajetória sem GPS a partir da sequência de anomalias que atravessa. O <b>teste de referência de 60 minutos sem GPS</b> (<c5/>, <c6/>) percorre uma indisponibilidade de ~{ "700" } km / uma hora em que a solução inercial deriva até <b>≈ { "70" } km</b>, e um correlacionador <b>hierárquico de grosseiro a fino</b> com o ruído branco determinista com semente do gravímetro recupera-a até <b>≈ { "145" } m (< { "500" } m)</b> — estável entre realizações de ruído, e comprovadamente limitado pelo refinamento (uma única grelha grosseira estagna em ~{ "2" } km). Além disso, um <b>modelo completo do campo principal geomagnético IGRF-14 (IGRF: Campo Geomagnético Internacional de Referência)</b> (<c7/>: o campo em harmónicos esféricos normalizado de Schmidt da IAGA até ao grau/ordem { "13" }, { "2025.0" } + variação secular, coeficientes gerados por máquina a partir do <c8/> oficial; validado face ao dipolo inclinado de forma fechada, a uma diferença finita do potencial escalar e ao polo/intensidade geomagnéticos conhecidos) — o campo magnético que uma plataforma pode correlacionar com mapas para navegação por anomalias magnéticas. Além disso, <b>navegação referenciada ao terreno (TERCOM/SITAN (TERCOM: correspondência de contornos do terreno; SITAN: Sandia Inertial Terrain-Aided Navigation))</b> e o <b>navegador combinado de gravidade+magnetismo+terreno</b> (<c9/>): um analisador <c10/> SRTM (Shuttle Radar Topography Mission) de modelo digital de elevação (DEM) escrito de raiz (inteiros de 16 bits com sinal em big-endian, por linhas, linha norte primeiro, vazio -32768; validado face à especificação do controlador SRTMHGT (formato de ficheiros de altura da Shuttle Radar Topography Mission) do GDAL (Geospatial Data Abstraction Library) e a uma referência independente de ponto médio bilinear de forma fechada), um modelo de <b>altímetro</b> radar/barométrico e um correlacionador <c11/> que recupera uma trajetória sem GPS a partir do perfil de elevação do solo face ao DEM, e <c12/>, que funde <b>três canais de campo escalares</b> por ponto de passagem (Δg mGal · |B| nT de anomalia crustal · elevação m), de modo que a posterior conjunta é mais nítida (CRLB (limite inferior de Cramér–Rao) mais baixo) do que qualquer campo isolado — limitada a < { "500" } m ao longo da indisponibilidade de 60-min e, em valor esperado, não pior do que o melhor canal isolado. Além disso, <b>navegação referenciada ao terreno sequencial (recursiva) — SITAN como filtro em execução</b> (<c13/>, <c14/>): o mesmo modelo de medição altímetro-versus-DEM executado <b>época a época</b> através do motor SIR (reamostragem por importância amostrada) de <c15/> (predizer pelo incremento do INS + ruído de processo → repesar pela correspondência do terreno → reamostrar na degenerescência), de modo que uma deriva do INS <b>variável no tempo</b> é <em>seguida</em> ao longo da trajetória onde o correlacionador em lote recupera apenas um desvio constante único — a estimativa recursiva mantém-se limitada e reconverge (final ≈ { "70" } m) enquanto a solução sem auxílio diverge sem limite até ≈ { "5" } km, com o erro por época a acompanhar a distintividade do terreno e um monitor de saúde do tamanho efetivo da amostra. Âmbito com franqueza: o mapa é <b>conhecido e fixo</b> — <em>localização</em> recursiva face a um DEM armazenado (a metade de localização do SLAM de terreno (localização e mapeamento simultâneos)); a estimação conjunta do mapa é o RBPF separado abaixo. Todos os quatro estão agora <b>ligados ao motor de cenários por <c16/></b> (<c17/>, <c18/>, <c19/>, <c20/>) com um gráfico SVG de deriva (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10):</b> o navegador <c24/> aceita um campo de referência real opcional (<c25/>: EGM2008 incluído até ao grau { "70" }, ou um ficheiro <c26/> do ICGEM), cuja síntese de anomalias coincide com o Serviço de Cálculo do ICGEM até cerca de { "1e-8" } mGal (VALIDATED, <c27/>); nesse campo de grau 70, o teste de referência de 60 min termina em { "3106" } m, pelo que o limiar de < { "500" } m é NOT MET (fixado antecipadamente e previsto: o grau { "70" } é demasiado suave). Um Monte Carlo opcional de erro do mapa (<c28/>, <c29/>) mostra que a correção sintética de { "144" } m pressupõe um mapa exato ({ "1" } de { "20" } realizações dentro de { "500" } m sob um erro correlacionado de { "2" } mGal; exploratório). <c30/> aceita uma grelha magnética crustal EMAG2v3 opcional (<c31/>; o EMAG2 é obtido, não incorporado, e não é afirmado nenhum resultado de navegação com ela). <c32/> permanece apenas com DEM por conceção: é o correlacionador TERCOM/SITAN de canal único, e a correspondência magnética vive em <c33/>, que funde o terreno com os canais magnético e gravítico; um canal magnético em <c34/> duplicá-lo-ia, pelo que o item de auditoria "EMAG2 em terrain-nav" é coberto pela ligação a <c35/> (RM-16). As verificações com SRTM real correm em CI sobre dois recortes de resolução total versionados (nó a nó iguais ao GDAL { "3.8.4" }, <c36/>). Existe estimação conjunta do mapa (<c37/>, um RBPF ao estilo FastSLAM): numa única passagem ganha { "1.5" } % sobre o SITAN de mapa conhecido num mapa errado, falhando o seu limiar fixado antecipadamente de { "10" } % (<c38/>). <b>Continua em falta:</b> um modelo gravítico de alto grau numa execução de navegação (exige um novo pré-registo), um resultado de navegação magnética com grelha real e um caso de SLAM com revisita (fecho de ciclo). P3

# text
seg-bf09e5d705a0 = Reentrada / EDL (entrada, descida e aterragem), análise de lançamento, EO/carga útil (EO: observação da Terra)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Geometria MODELLED de primeira ordem através de três tipos de cenário executáveis: <b><c1/></b> (<c2/>, corredor balístico de <b>Allen-Eggers</b> — desaceleração máxima, velocidades de g máximo e de aquecimento máximo, altitude de g máximo), <b><c3/></b> (<c4/>, <b>azimute de lançamento</b> de dois corpos <c5/>, Δv de mudança de plano, bónus da rotação do local, oportunidades diárias) e <b><c6/></b> (<c7/>, geometria EO de <b>faixa / GSD (distância de amostragem no solo) / acesso / revisita</b> em triângulo espacial segundo o SMAD (Space Mission Analysis and Design)). <b>Sem</b> simulação EDL/aerotérmica de 6 graus de liberdade, sem otimizador de trajetória, sem radiometria de sensor/MTF (MTF: função de transferência de modulação). P3

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
seg-a7a12eb111fc = <c1/>: um motor de <b>ARAIM lunar</b> que reutiliza o núcleo MHSS do lado da Terra com parâmetros LNIS (LunaNet Interoperability Specification) do LunaNet (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), a <b>redução de referencial cislunar MCI↔MCMF (MCI: inercial centrado na Lua; MCMF: centrado e fixo à Lua)</b> (<c2/> / <c3/>, um modelo simplificado de rotação média à taxa sideral) e latitude/longitude/altitude <b>selenográficas</b> (<c4/>), e uma <b>passagem de nível de proteção no polo sul</b> (<c5/>) que quantifica a lacuna de integridade — com { "30" } m de medição de distância, o HPL é finito mas excede um limite de alerta de operações à superfície de { "50" } m. <c6/> acrescenta o <b>CR3BP</b> (problema restrito circular de três corpos) Terra–Lua (dinâmica em referencial rotativo + propagador RK4 + constante de Jacobi + os cinco pontos de Lagrange, validado face aos valores publicados de L1/L2/L3 e aos exatos de L4/L5) — o núcleo de três corpos de que uma NRHO (órbita de halo quase retilínea) real necessita — e um <b>corretor diferencial de tiro único com matriz de transição de estado</b> (<c7/>, <c8/>, <c9/>) que produz órbitas de halo/NRHO L2 genuinamente periódicas: a STM é validada face a diferenças finitas, os halos corrigidos fecham-se sobre si próprios com precisão de máquina (com conservação de Jacobi), e a semeadura com o estado de apolúnio publicado reproduz a <b>NRHO L2 sul { "9" }:{ "2" }</b> (a órbita do Gateway) com <b>período ≈ { "6.57" } d</b> e <b>perilúnio ≈ { "3,250" } km</b> — coerente com os ≈ { "6.56" } d / ≈ { "3,370" } km publicados | As IC (condições iniciais) da NRHO corrigidas por diferenciação estão agora ligadas, mas a <b>transformação selenocêntrica (MCI/MCMF) desnormalizada da órbita corrigida</b> e a continuação de famílias continuam a ser desenvolvimentos seguintes; a orientação lunar de eixos principais DE440 com libração física real existe (<c10/>, a partir do PCK <c11/>, verificada face ao SPICE <c12/> em <c13/>), mas o caminho <c14/> mais antigo ainda usa a rotação média sem libração nem o polo em precessão; a NRHO é uma solução CR3BP (circular, sem Sol), <b>não</b> validada face a uma efeméride real LANS/Gateway (LANS: Lunar Augmented Navigation Service); um tipo de cenário <c15/> executável (<c16/>) expõe a passagem do polo sul a partir da CLI | transformação selenocêntrica + continuação de famílias + interface SPICE/LunaNet: <b>P3</b>

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
seg-584d79a8ba08 = <b>Entregue na { "v0.17.0" }.</b> Um motor de navegação radiométrica: tempo de luz iterativo + atraso de Shapiro, Doppler e distância bi/uni/tridirecionais (duas pernas de Moyer), retorno coerente do transponder, medição de distância regenerativa/PN (PN: pseudo-ruído) (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), meios de plasma solar/tropo/iono (<c1/>); análise + emissão <b>CCSDS-TDM ({ "503" })</b> (<c2/>); um <b>SRIF de dinâmica reduzida</b> (filtro de informação em raiz quadrada) com acelerações empíricas RTN (radial, transversal, normal) + um relógio de bordo de 3 estados + arrastamento de Marte (<c3/>, <c4/>, <c5/>) que alcança <b>OD em LMO de Marte (LMO: órbita baixa de Marte) ≈ { "0.2" } m</b> num ciclo fechado sintético; fusão unidirecional+bidirecional; um núcleo de dinâmica multicorpo (<c6/>, GMM-3 de Marte (GMM: Goddard Mars Model), referencial IAU de Marte <c7/>, uma junção <c8/> <c9/>, JD em duas partes + TT↔TDB (TDB: Tempo Dinâmico Baricêntrico)); e o cenário de PNT de retransmissão <b><c10/></b> (constelação areoestacionária MARCONI, <c11/>) + um simulador de desempenho de GSE de ponta a ponta (<c12/>). <b>Validado por simulação</b> (FoM de covariância/ciclo fechado); dinâmica centrada no Sol verificada de forma cruzada face ao DE440 do JPL (Jet Propulsion Laboratory) ({ "137" } m @ arco de 1 dia, <c13/>). <b>Em falta:</b> validação com dados reais de seguimento DSN/ESTRACK (ESTRACK: European Space Tracking network); gravidade de Marte no seu referencial nativo (o campo GMM-3 de g/o { "120" } carrega-se a partir da tabela PDS SHADR, <c14/>, VALIDATED face ao pyshtools, e liga-se através de <c15/>, mas é avaliado no referencial IAU e não no seu próprio referencial Konopliv-2006); efemérides de nível DE no núcleo (condicionadas a kernel em xval). P3

# text
seg-00450a6acae0 = Sistema solar e PNT em torno de qualquer corpo

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>Tipo de cenário <c1/></b>: posições, velocidades e constantes físicas do Sol, dos planetas, de Plutão, da Lua e de sete grandes luas numa época, com o tempo de luz entre corpos; as posições dos planetas (elementos de Standish do JPL) e o tempo de luz são VALIDATED face ao JPL Horizons (<c2/>), as luas, Plutão e a tabela dos planetas exteriores permanecem MODELLED. <b>Tipo de cenário <c3/></b>: um orbitador ou módulo de aterragem em torno de qualquer corpo catalogado (Marte, a Lua, Europa, Ganimedes, Titã e os restantes) a navegar com pseudodistâncias unidirecionais de uma constelação Walker local mais uma distância bidirecional opcional a partir da Terra — MODELLED. Sem kernel de efemérides planetárias no núcleo (elementos analíticos), as órbitas de retransmissão <c4/> usam apenas J2 (os campos completos GMM-3 de Marte de g/o { "120" } e GRAIL GL0660B da Lua de g/o { "660" } carregam-se a partir de tabelas PDS SHADR e ligam-se a um <c5/> para o propagador, <c6/>). P3

# text
seg-433128dbc8a9 = Campanhas / composição de missões

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>Tipo de cenário <c1/></b> (<c2/>): tipos de cenário existentes encadeados numa cronologia partilhada (por exemplo jamming, depois spoofing, depois holdover com um INS a deslizar, depois um alarme de integridade, depois recuperação), varreduras de parâmetros e conjuntos de Monte Carlo com semente sobre qualquer tipo de cenário, e vários cenários sob condições partilhadas com um resumo combinado; cada número é lido de uma execução real do tipo de cenário membro. As identidades de composição são testadas (<c3/>: uma campanha de uma só fase reproduz a execução autónoma byte a byte); MODELLED. Uma secção <c4/> (grelha ou Nelder–Mead limitado sobre uma a três chaves, uma métrica, minimizar, maximizar ou atingir um alvo) satisfaz os seus limiares de forma fechada e de força bruta fixados antecipadamente (<c5/>); MODELLED, uma procura local sem qualquer afirmação de ótimo global, e sem método de gradiente nem bayesiano. P3

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
seg-7bd95909787f = Cada execução escreve <c1/>, um gráfico e um relatório (<c2/>, <c3/>) cujas etiquetas são lidas da matriz de verificação e cujo comando registado reproduz o resultado byte a byte (<c4/>); <c5/> (svg, html ou frames) apresenta uma série temporal como animação (<c6/>, <a1><c7/></a1>); <c8/> escreve os formatos de intercâmbio da linha de interoperabilidade. São representações da execução, não evidência sobre a física.

# text
seg-3c3d3427723f = Ecossistema e prontidão (acompanhados com franqueza, não uma capacidade do código)

# text
seg-5770537524d3 = Área

# text
seg-e0426ffe2628 = Nota

# text
seg-bdee8089afb0 = Ligações de linguagem e empacotamento

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
seg-89fd1e232849 = Rust + Python (abi3) + WASM em três registos. Superfícies tipadas ({ "0.36" }, CAP-34): <c1/> em Python com acessores NumPy (<c2/>, <c3/>, <c4/>) e <c5/> / <c6/> / <c7/> com stubs tipados; <c8/> em JavaScript (um objeto <c9/> tipado) e <c10/>, com o mesmo vocabulário nas declarações TypeScript. Os documentos de resultados continuam a ser JSON por tipo de cenário, tipados apenas pelo seu envelope partilhado (<c11/>, versões)

# text
seg-e1dee294d0fe = Educação / UX (experiência do utilizador) de integração

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Playground no navegador com <b>modo guiado entregue</b>: controlos deslizantes guiados adaptados ao cenário (<c1/>, até seis parâmetros por cenário) e uma visita guiada interativa (<c2/>, repetível a partir do playground). Cada execução recebe também uma frase de <b>significado</b> em linguagem simples e as suas figuras principais, lidas do documento de resultados (<c3/>, com modelos por tipo de cenário em <c4/>; um tipo de cenário sem modelo recebe a sua primeira figura de destaque indicada de forma simples). Em falta: explicações guiadas por figura para além dessa frase (o <a1><c5/></a1> em linguagem simples cobre-as)

# text
seg-becc4cd71f4c = Comunidade / governação

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Estrutura de governação presente — <c1/> (modelo de mantenedor benevolente + limiar técnico + fronteira aberto/fechado), <c2/>, <c3/>, <c4/>, modelos de issues/PR (PR: pull request), <c5/>, dependabot. Fundador único; uma <b>comunidade externa ativa</b> (contribuidores, citações) depende de pessoas/tempo e ainda está a formar-se (divulgação a aguardar revisão)

# text
seg-5e222a61a61e = Prontidão de financiamento e aquisição

# text
seg-fdbb9db68f1d = none

# text
seg-86709f7f67c0 = TRL ~{ "3" }; ainda sem citações/contratos de agências (ver notas de estratégia)

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = Acrescentos do demonstrador FutureNAV (modelados, verificados internamente de forma cruzada — <b>não</b> validados externamente): ({ "1" }) <b>Banco de ensaio de avaliação de deteção de degradação de RF por aprendizagem automática</b> <c1/> — um corpus de degradação <b>sintético</b> etiquetado (com base em parâmetros, não IQ) + uma estrutura de ROC/AUC/confusão/Pfa-Pmd independente do detetor (ROC: característica de funcionamento do recetor; AUC: área sob a curva) com proteção contra fugas e divisão estratificada; os detetores incluídos são linhas de base transparentes de métodos publicados, não o estado da arte (SOTA), e uma AUC elevada aqui demonstra o pipeline, não o desempenho em terreno. ({ "2" }) <b>Motor de compromisso PNT quântico versus clássico</b> <c2/> — ingestão de ADEV medido (ajuste NNLS (mínimos quadrados não negativos) de <c3/>, verificado em ida e volta face a <c4/>), uma tabela de benefícios de holdover de temporização/inercial que transporta no artefacto a ressalva do pressuposto de piso, e uma envolvente de resiliência versus tempo sem GNSS; <b>quantifica</b> o benefício quântico de um parceiro, nunca valida o dispositivo. Ambos revistos de forma adversarial (um erro de base de deriva τ²→τ³ e uma afirmação falsa de resiliência "limitada indefinidamente" foram detetados e corrigidos). { "911" } testes da biblioteca na altura desse acrescento, fmt+clippy limpos.

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
seg-deb7124d3c70 = Acrescento de intercâmbio / formato normalizado (<c1/>): o <b>Kshana Interchange Format (KIF)</b> — um <c2/> neutro, versionado e autodescritivo que envolve qualquer artefacto (cenário, resultado, estudo de compromisso) com uma etiqueta <c3/> reconhecível, a <c4/> de fonte única de verdade (a versão do esquema, antes copiada como literal em { "15" } locais, é agora detida numa só constante que toda a crate referencia), o <c5/> produtor e um contrato de compatibilidade explícito e testado (<c6/>: a mesma versão principal / versão secundária igual ou mais antiga é legível sob a disciplina de campos aditivos; uma versão secundária mais recente ou uma versão principal diferente é recusada na fronteira por <c7/> em vez de ser analisada incorretamente em silêncio). Reversível (<c8/>→<c9/>→<c10/>→<c11/>) para qualquer carga <c12/>; deliberadamente <b>sem marcas temporais</b> para preservar a reprodutibilidade bit a bit do Kshana. Documentado em <a1><c13/></a1>, para que o formato seja <b>citável</b> e não apenas emitido — o posicionamento de "norma em espera" do núcleo aberto. { "923" } testes da biblioteca na altura desse acrescento, fmt+clippy limpos.

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
seg-adc959257e0b = Acrescentos da construção de dominância FutureNAV (modelados, verificados internamente de forma cruzada — <b>não</b> validados externamente): ({ "1" }) <b>Camada frugal de custo por cobertura / ROI (retorno do investimento)</b> <c1/> — uma camada de enquadramento de benefícios sobre o motor de dimensionamento de constelações (<c2/>) que indica o custo por ponto percentual de cobertura e o ROI de cobertura por euro face a uma linha de base; o custo por satélite é um <b>intervalo baixo/nominal/alto com fonte, fornecido por quem chama</b> (sem preços pontuais inventados), pelo que as saídas são intervalos e não pontos espúrios; um enquadramento económico modelado de um valor de cobertura modelado, não uma cotação. ({ "2" }) <b>Mapeamento do impacto na integridade das deteções falhadas</b> <c3/> — associa um enviesamento de posição não detetado, induzido por spoofing/jamming, ao seu erro efetivo → região de Stanford (disponível / sistema indisponível / enganoso / perigosamente enganoso) face a <b>limites de alerta específicos do contexto</b> (céu aberto vs urbano, HAL vs VAL), compondo o RAIM <c4/> ancorado externamente; a ponte deteção falhada→limite de alerta é modelada, não é uma atribuição de integridade certificada. Ambos estão associados à matriz de verificação verificada por máquina (<c5/>, invariante Validated⇒ExternalDataset intacta; a contagem atual de linhas é o cabeçalho gerado de <a1><c6/></a1>). A divisão com validação cruzada / proteção contra fugas / estratificada por parâmetros para a estrutura de avaliação de IA já tinha sido entregue em <c7/> (<c8/>, <c9/>). { "951" } testes da biblioteca na altura desse acrescento, fmt+clippy limpos.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = Acrescentos do estudo da diferença de otimismo FutureNAV (modelados, verificados internamente de forma cruzada face a formas fechadas — <b>não</b> validados externamente, <b>não</b> uma afirmação de simulação-para-terreno): um estudo <b>sintético</b> controlado da <b>diferença de otimismo</b> da AUC entre dentro da distribuição→fora da distribuição para detetores de degradação de RF. ({ "1" }) <b>Detetores aprendidos</b> <c1/> — um mapa de características fixo + normalizador ajustado ao treino, uma linha de base de regressão logística (descida de gradiente determinista em lote completo) e um <b>MLP</b> (perceptrão multicamada; retropropagação com SGD (descida de gradiente estocástica) com semente) de uma camada oculta, por trás do mesmo trait <c2/> que as linhas de base de métodos publicados usam. ({ "2" }) <b>Estatísticas derivadas à mão</b> <c3/> — intervalos de confiança (IC) por bootstrap de percentis, variância/IC da AUC de <b>DeLong</b>, ρ de <b>Spearman</b> e regressão <b>ridge</b>, cada uma verificada face a uma forma fechada (AUC binormal Φ(d′/√{ "2" }), uma variância de DeLong calculada à mão, um ρ de postos empatados de manual, recuperação exata por OLS (mínimos quadrados ordinários)). ({ "3" }) <b>O estudo</b> <c4/> — AUC por classe, a tendência de lei de escala por <c5/> (diferença vs { "1" }−gravidade) e um <b>preditor ridge da diferença apenas com dados ID</b> que estima a diferença de otimismo apenas a partir de diagnósticos dentro da distribuição, pontuado <b>deixando de fora um detetor</b> e <b>deixando de fora uma classe</b> face a uma linha de base que prevê a média. Artefacto de um só comando através de <c6/>. Cada número é uma AUC sobre etiquetas derivadas de modelo num corpus sintético, com base em parâmetros; a diferença é uma variação de gravidade sintético→sintético, nunca um resultado de deteção em terreno. Associados à matriz de verificação verificada por máquina (<c7/>, invariante Validated⇒ExternalDataset intacta).

# text
seg-441b67566d5a = <s1>Anterior</s1>Reprodutibilidade

# text
seg-861984989d07 = <s1>Seguinte</s1>Normas e interoperabilidade

seg-312673730e83 = Atualizado em 2026-10-29 para o motor { $version } ({ "92" } tipos de cenário, a partir de <c1/>; novos na { $version }: <c2/>, <c3/>, <c4/>, <c5/> e <c6/>). 2026-10-22: motor { "0.39.0" }, { "87" } tipos, nenhum tipo novo. 2026-10-19: motor { "0.38.0" }, { "87" } tipos (novos na { "0.38.0" }: <c7/>, <c8/> e <c9/>). 2026-10-18: { "84" } tipos (novo na { "0.37" }: <c10/>). 2026-10-16: { "83" } tipos (novos na { "0.36" }: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/> e <c18/>). 2026-10-10: motor { "0.35.0" }, { "75" } tipos, nenhum tipo novo. 2026-10-09 e 2026-10-08: revisões anteriores. 2026-10-04: a linha Nav-signal anota a camada IQ da { "0.31.0" }. 2026-09-29: linhas de LEO-PNT, espectro, PNT do sistema solar / de qualquer corpo, campanha e saída adicionadas. Antes: alinhado à matriz de 27 linhas de capacidades da grande auditoria de 2026-06-02; linha de PNT de espaço profundo / Marte adicionada na { "v0.17.0" }. As adições de PNT quântico (holdover de relógio sem GNSS <c19/>, orçamento composto de navegação inercial-quântica por estima <c20/>, estudo de compromisso de projeto de códigos de alcance <c21/>, matriz de verificação verificada por máquina <c22/>) foram incorporadas às linhas de Temporização, sensor de PNT quântico, Nav-signal e V&V — cada uma etiquetada como validada ou modelada conforme a sua referência independente real.
