# docs--quantum-physics: translations (pt-PT)

# text
seg-5ad814c7ef9e = Notas

# text
seg-ad856ad710eb = Estado

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Fonte: <c1/>

# text
seg-5df810623ef1 = Física de sensores inerciais quânticos (interferómetro de átomos frios)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = A maior parte do Kshana conduz os seus sensores quânticos a partir de <b>coeficientes de Allan/ruído publicados</b> — consultas a folhas de especificações (consulte <a1><c1/></a1> e <a2><c2/></a2>). Este documento abrange o único local onde o motor calcula, em vez disso, o desempenho do sensor <b>a partir de princípios fundamentais</b>: o modelo de acelerómetro de interferómetro de átomos frios (CAI) em <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = É deliberadamente uma camada de física <em>mínima e honesta</em> — o patamar do ruído de projeção quântica e o fator de escala do interferómetro — e não um simulador completo de instrumento. As secções abaixo indicam exatamente o que é e o que não é modelado.

# text
seg-64509c048541 = O que é modelado

# text
seg-9fa6211c962e = Um interferómetro atómico de Mach–Zehnder de três impulsos (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), a geometria padrão de acelerómetro de átomos frios:

# text
seg-3c513ef2fd3b = Grandeza

# text
seg-c0a13eeb346d = Fórmula

# text
seg-f838cd800e16 = Vetor de onda efetivo

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Raman de dois fotões; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Fase do interferómetro

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Força específica uniforme <c1/> ao longo de <c2/>, separação de impulsos <c3/>. A escala <c4/> é a principal alavanca de sensibilidade (a microgravidade permite <c5/> longo).

# text
seg-f5b8b6c35dce = Ruído de projeção quântica

# text
# c1: C
# c2: N
seg-8902ae6f313c = Por disparo, contraste de franjas <c1/>, número de átomos <c2/> — o limite de ruído de disparo de uma leitura de população de duas portas.

# text
seg-b95d4d1e45f0 = Sensibilidade de aceleração por disparo

# text
seg-c97f2fd35d48 = Ruído de fase referido à aceleração.

# text
seg-cda09ac79409 = ASD (densidade espectral de amplitude) limitada pelo ruído de disparo

# text
# c1: T_c
seg-4d84800a3adb = Amostragem a cada tempo de ciclo <c1/>; unidades (m/s²)/√Hz.

# text
seg-707ee648d1d5 = PSD (densidade espectral de potência) do passeio aleatório de velocidade

# text
# c1: AccelModel
seg-be0ac61054db = <b>O coeficiente que o <c1/> clássico consome</b> — agora <em>derivado</em>, não fornecido.

# text
seg-939e12a62637 = Decaimento do contraste

# text
seg-05b0e7130b78 = Decoerência durante a interrogação.

# text
seg-e64f748b35ab = Função de transferência da vibração

# text
# c1: T²
seg-1754ac375452 = Resposta aceleração→fase da geometria ideal de três impulsos (Cheinet et al. { "2008" }); limite DC (frequência zero) <c1/>.

# text
seg-a710cfe4f533 = Fase limitada pela vibração

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = PSD de aceleração plana <c1/> ao longo do eixo Raman; <c2/>.

# text
seg-13109dcfc52b = Aceleração limitada pela vibração

# text
# c1: k_eff
seg-812990a8f058 = Por disparo; note que <c1/> se cancela — é definida apenas pela PSD da plataforma e pelo tempo de interrogação.

# text
seg-1c2764469718 = Ambiguidade de franjas

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, gama em células <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = A fase das franjas é lida módulo 2π, pelo que uma única leitura só não é ambígua dentro de ±<c1/> e produz aliasing a cada <c2/> fora dele; o número de células não depende de <c3/> nem de <c4/>.

# text
seg-14bbedf1cd0d = Projeção no eixo

# text
seg-1ac2d4904b8a = O acoplamento de primeira ordem tem posto 1: apenas a componente ao longo do feixe entra na fase.

# text
seg-7200f91fa19a = Fase de Coriolis / rotação

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Efeito sistemático de rotação para um veículo em movimento (Lan et al. { "2012" }); enviesamento equivalente <c1/> = o termo clássico de Coriolis.

# text
seg-9eaff8d90a83 = Fase de AC-Stark (desvio de luz) (AC: corrente alternada)

# text
seg-62630dc178e6 = Desvio de luz de um fotão; um desvio <em>constante</em> anula-se pela simetria π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = O fecho do ciclo é o ponto essencial: <c1/> produz exatamente a PSD de aceleração branca que o resto da pilha inercial já integra num erro de velocidade/posição — pelo que o ruído de um sensor quântico pode ser rastreado até ao seu número de átomos, tempo de interrogação e contraste, em vez de uma linha de folha de especificações.

# text
# c1: T = 10 ms
# c2: N = 10⁶
# c3: C = 0.5
# c4: T_c = 0.5 s
# c5: Φ(1 g) ≈ 1.58×10⁴ rad
# c6: σ_Φ = 2×10⁻³ rad
# c7: σ_a ≈ 1.24×10⁻⁶ m/s²
# c8: n_a ≈ 0.09 µg/√Hz
# c9: S_a = 10⁻¹⁰ (m/s²)²/Hz
# c10: σ_a ≈ 5.8×10⁻⁵ m/s²
# c11: a_max ≈ 1.95×10⁻³ m/s²
# c12: Φ(1 g)
seg-e2363d639ccc = Um valor resolvido (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) por disparo, e um patamar de ruído de disparo <c8/>. Com uma PSD de vibração da plataforma modesta <c9/>, o patamar por disparo <b>limitado pela vibração</b> é <c10/> (≈ { "5.9" } µg) — cerca de { "46" }× o patamar de ruído de disparo, o que mostra porque é que os dispositivos reais são limitados pela vibração e não pela projeção. O mesmo interferómetro lê a força específica sem ambiguidade apenas dentro de <c11/> (≈ { "199" } µg), cerca de { "1 571" } células de resolução: <c12/> são milhares de franjas, pelo que uma única leitura de { "1" } g sofre aliasing.

# text
seg-c209b86f41d8 = O que NÃO está modelado (e porque o limite mínimo é otimista)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = O limite mínimo de ruído de disparo acima é um <b>limite inferior fundamental</b>. Os instrumentos CAI reais situam-se acima dele: um gravímetro estático de laboratório (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) cerca de { "60" }× acima do limite mínimo calculado para os seus parâmetros, e uma tríade de acelerómetros em utilização de campo muito mais acima (o dispositivo Exail citado em <c1/> indica { "22" } µg/√Hz). O termo dominante — o <b>acoplamento de vibrações</b> — e os dois principais erros sistemáticos determinísticos — a <b>força de Coriolis/rotação</b> e o <b>desvio de luz AC-Stark</b> — estão modelados (as linhas da função de transferência, de Coriolis e do desvio de luz acima), tal como o <b>intervalo dinâmico de ambiguidade de franjas</b> (<c2/>, <c3/>, <c4/>, <c5/>). A diferença restante corresponde ao que esta camada ainda não inclui:

# text
seg-c56d85817bc6 = A <b>aberração da frente de onda</b> e os erros sistemáticos de apontamento do feixe de ordem superior — <b>não modelados</b>.

# text
# c1: a_max
seg-525c382e813b = A <b>resolução da ambiguidade de franjas</b> — o modelo indica o intervalo não ambíguo e devolve a fase enrolada; não desenrola uma leitura fora de ±<c1/> (por exemplo, com um acelerómetro clássico ou vários tempos de interrogação), e limita o intervalo para uma franja ideal de três impulsos, sem termos de frente de onda nem de perda de contraste.

# text
seg-7555132ef2c6 = Correspondência com a literatura: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (tecnologia quântica; GNSS: sistema global de navegação por satélite); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) para a sensibilidade/função de transferência do interferómetro (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) para o orçamento de erros do gravímetro móvel; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) para o regime de parâmetros do acelerómetro espacial.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Este é o item da <b>camada de física quântica P2</b> de <c1/>: a fase de Mach–Zehnder, o ruído de projeção, o fator de escala, o <c2/> derivado, o decaimento do contraste, <b>e a função de transferência do acoplamento de vibrações / variância de PSD branca</b> estão implementados e testados unitariamente face ao cálculo manual (incluindo uma verificação cruzada numérica por integral de banda da função de transferência face ao seu resultado analítico em <c3/>).

# text
# c1: ImuKind::QuantumCai
# c2: cai
# c3: [accel_quantum.cai]
# c4: [accel_classical.cai]
# c5: inertial
# c6: [accel.cai]
# c7: hybrid-ukf
# c8: scenarios/hybrid-ukf.toml
# c9: scenarios/quantum-cai-coast.toml
# c10: wavelength_m
# c11: pulse_sep_t
# c12: T
# c13: atom_number
# c14: N
# c15: contrast
# c16: C
# c17: cycle_time_s
# c18: T_c
# c19: vibration_psd
# c20: q_va
# c21: [cai]
seg-42e8dc204be9 = O modelo está também <b>ligado a cenários executáveis</b>: um acelerómetro é resolvido para <c1/> quando tem uma tabela <c2/> — <c3/> ou <c4/> num cenário <c5/>, <c6/> num cenário <c7/> (<c8/> inclui um, e a predefinição fornecida <c9/> confronta um CAI com especificação física com um acelerómetro de quartzo de qualidade de navegação durante uma interrupção do GNSS) — com os campos <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) e uma <c19/> opcional da plataforma. A sua PSD de passeio aleatório de velocidade <c20/> é então <b>derivada</b> da física do interferómetro — o limite mínimo de ruído de disparo mais, quando é dada uma PSD de vibração, a contribuição limitada pela vibração em quadratura — em vez de fornecida como coeficiente de ficha técnica. Os cenários sem um bloco <c21/> são clássicos e inalterados ao byte.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Os erros sistemáticos de Coriolis (<c1/> / <c2/>) e de desvio de luz AC-Stark (<c3/>) estão implementados e testados unitariamente (o viés equivalente de Coriolis é verificado face ao <c4/> clássico; a fase AC-Stark face ao seu cancelamento simétrico). Um varrimento da deriva com o tempo de ciclo (<c5/>) indica a deriva de posição por navegação à estima do CAI quântico em função do tempo de ciclo — o núcleo computacional de uma comparação quântico-versus-clássico. O tipo de cenário <c6/> reutiliza o mesmo acelerómetro através de <c7/>, e <c8/> contém uma folha de parâmetros com intervalos (melhor, nominal, conservador), com uma citação por valor.

# text
seg-e2acbef44395 = O que mostram as verificações externas.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> verifica a função de transferência face a um integral numérico no domínio do tempo da função de sensibilidade de Cheinet, <c2/> face a comprimentos de onda de linha publicados, e o viés de Coriolis face a <c3/> — correspondências exatas das formas publicadas. O limite mínimo de ruído de disparo é um intervalo unilateral: para os parâmetros publicados do gravímetro de césio de Peters et al. { "2001" } e do gravímetro de rubídio GAIN de Freier et al. { "2016" } (arXiv:{ "1512.05660" }) o limite mínimo modelado situa-se no ruído atingido por cada dispositivo ou abaixo dele e a menos de três ordens de grandeza dele (para o GAIN o limite mínimo é { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz face ao { "9.6" }×{ "10" }⁻⁸ atingido, um fator de cerca de { "63" }). Isto é consistente com o facto de os dispositivos reais serem limitados pela vibração ou por razões técnicas, mas é um intervalo, não uma validação de um modelo de ruído do instrumento, pelo que a linha da matriz continua MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Os trabalhos seguintes que restam são os erros sistemáticos de frente de onda/apontamento do feixe, a resolução da ambiguidade de franjas, uma reprodução numericamente exata dos orçamentos Monte-Carlo do CARIOQA-PMP e dos orçamentos de ensaio em voo sem GPS (GPS: Global Positioning System) da Boeing/AOSense (que exigem as PSD de plataforma publicadas e a SNR por disparo, a relação sinal-ruído), e uma predefinição de comparação quântico-versus-clássico no espaço de experimentação do navegador, por cima de <c1/>.

# text
seg-2452f58aedf0 = <s1>Anterior</s1>Modelos de sensores quânticos

# text
seg-206d5a9704f0 = <s1>Seguinte</s1>API Python
