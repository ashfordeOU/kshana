# docs--quantum-physics: translations (pt-BR)

# text
seg-5ad814c7ef9e = Observações

# text
seg-ad856ad710eb = Status

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Fonte: <c1/>

# text
seg-5df810623ef1 = Física de sensores inerciais quânticos (interferômetro de átomos frios)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = A maior parte do Kshana alimenta seus sensores quânticos com <b>coeficientes de Allan/ruído publicados</b> — consultas a folhas de dados (veja <a1><c1/></a1> e <a2><c2/></a2>). Este documento trata do único ponto em que o motor, em vez disso, calcula o desempenho do sensor <b>a partir de primeiros princípios</b>: o modelo de acelerômetro de interferômetro de átomos frios (CAI) em <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = É deliberadamente uma camada de física <em>mínima e honesta</em> — o piso de ruído de projeção quântica e o fator de escala do interferômetro —, não um simulador completo de instrumento. As seções abaixo declaram exatamente o que é e o que não é modelado.

# text
seg-64509c048541 = O que é modelado

# text
seg-9fa6211c962e = Um interferômetro atômico Mach–Zehnder de três pulsos (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), a geometria padrão do acelerômetro de átomos frios:

# text
seg-3c513ef2fd3b = Grandeza

# text
seg-c0a13eeb346d = Fórmula

# text
seg-f838cd800e16 = Vetor de onda efetivo

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Raman de dois fótons; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Fase do interferômetro

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Força específica uniforme <c1/> ao longo de <c2/>, separação entre pulsos <c3/>. A escala em <c4/> é a principal alavanca de sensibilidade (a microgravidade permite <c5/> longo).

# text
seg-f5b8b6c35dce = Ruído de projeção quântica

# text
# c1: C
# c2: N
seg-8902ae6f313c = Por disparo, contraste de franja <c1/>, número de átomos <c2/> — o limite de ruído de disparo de uma leitura de população em duas portas.

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
seg-939e12a62637 = Decaimento de contraste

# text
seg-05b0e7130b78 = Decoerência durante a interrogação.

# text
seg-e64f748b35ab = Função de transferência de vibração

# text
# c1: T²
seg-1754ac375452 = Resposta aceleração→fase da geometria ideal de três pulsos (Cheinet et al. { "2008" }); limite DC (frequência zero) <c1/>.

# text
seg-a710cfe4f533 = Fase limitada por vibração

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = PSD de aceleração plana <c1/> ao longo do eixo Raman; <c2/>.

# text
seg-13109dcfc52b = Aceleração limitada por vibração

# text
# c1: k_eff
seg-812990a8f058 = Por disparo; observe que <c1/> se cancela — é definida apenas pela PSD da plataforma e pelo tempo de interrogação.

# text
seg-1c2764469718 = Ambiguidade de franja

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, faixa em células <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = A fase da franja é lida módulo 2π, de modo que uma única leitura é inequívoca apenas dentro de ±<c1/> e sofre aliasing a cada <c2/> fora dessa faixa; o número de células não depende de <c3/> nem de <c4/>.

# text
seg-14bbedf1cd0d = Projeção de eixo

# text
seg-1ac2d4904b8a = O acoplamento de primeira ordem tem posto 1: apenas a componente ao longo do feixe entra na fase.

# text
seg-7200f91fa19a = Fase de Coriolis / rotação

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Sistemático de rotação para um veículo em movimento (Lan et al. { "2012" }); viés equivalente <c1/> = o termo clássico de Coriolis.

# text
seg-9eaff8d90a83 = Fase de AC-Stark (deslocamento de luz) (AC: corrente alternada)

# text
seg-62630dc178e6 = Deslocamento de luz de um fóton; um deslocamento <em>constante</em> se cancela pela simetria π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = O ponto central é o fechamento do ciclo: <c1/> produz exatamente a PSD de aceleração branca que o restante da pilha inercial já integra em um erro de velocidade/posição — de modo que o ruído de um sensor quântico pode ser rastreado até seu número de átomos, tempo de interrogação e contraste, e não até uma linha de folha de dados.

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
seg-e2363d639ccc = Um exemplo numérico (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) por disparo, e um piso de ruído de disparo <c8/>. Com uma PSD de vibração de plataforma modesta <c9/>, o piso por disparo <b>limitado por vibração</b> é <c10/> (≈ { "5.9" } µg) — cerca de { "46" }× o piso de ruído de disparo, o que mostra por que dispositivos reais são limitados por vibração, e não por projeção. O mesmo interferômetro lê a força específica sem ambiguidade apenas dentro de <c11/> (≈ { "199" } µg), cerca de { "1 571" } células de resolução: <c12/> corresponde a milhares de franjas, de modo que uma única leitura de { "1" } g sofre aliasing.

# text
seg-c209b86f41d8 = O que NÃO é modelado (e por que o piso é otimista)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = O piso de ruído de disparo acima é um <b>limite inferior fundamental</b>. Instrumentos CAI reais ficam acima dele: um gravímetro estático de laboratório (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) cerca de { "60" }× acima do piso calculado para seus parâmetros, e uma tríade de acelerômetros em campo muito mais acima (o dispositivo Exail citado em <c1/> indica { "22" } µg/√Hz). O termo dominante — o <b>acoplamento de vibração</b> — e os dois principais sistemáticos determinísticos — <b>Coriolis/rotação</b> e o <b>deslocamento de luz AC-Stark</b> — são modelados (as linhas de função de transferência, Coriolis e deslocamento de luz acima), assim como a <b>faixa dinâmica de ambiguidade de franja</b> (<c2/>, <c3/>, <c4/>, <c5/>). A lacuna restante é o que esta camada ainda não inclui:

# text
seg-c56d85817bc6 = <b>Aberração de frente de onda</b> e sistemáticos de apontamento de feixe de ordem superior — <b>não modelados</b>.

# text
# c1: a_max
seg-525c382e813b = <b>Resolução de ambiguidade de franja</b> — o modelo declara a faixa sem ambiguidade e devolve a fase dobrada; ele não desdobra uma leitura fora de ±<c1/> (por exemplo, com um acelerômetro clássico ou vários tempos de interrogação), e delimita a faixa para uma franja ideal de três pulsos, sem termos de frente de onda nem de perda de contraste.

# text
seg-7555132ef2c6 = Correspondência com a literatura: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (tecnologia quântica; GNSS: sistema global de navegação por satélite); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) para a sensibilidade e a função de transferência do interferômetro (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) para o orçamento de erro do gravímetro móvel; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) para o regime de parâmetros do acelerômetro espacial.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Este é o item da <b>camada de física quântica P2</b> de <c1/>: a fase Mach–Zehnder, o ruído de projeção, o fator de escala, o <c2/> derivado, o decaimento de contraste, <b>e a função de transferência de acoplamento de vibração / variância de PSD branca</b> estão implementados e testados por unidade em relação a cálculo manual (incluindo uma verificação cruzada por integral numérica em banda da função de transferência contra seu resultado analítico em <c3/>).

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
seg-42e8dc204be9 = O modelo também está <b>ligado a cenários executáveis</b>: um acelerômetro é resolvido como <c1/> quando traz uma tabela <c2/> — <c3/> ou <c4/> em um cenário <c5/>, <c6/> em um cenário <c7/> (<c8/> traz um, e o preset incluído <c9/> contrapõe um CAI especificado por física a um acelerômetro de quartzo de grau de navegação durante uma interrupção de GNSS) — com os campos <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) e um <c19/> de plataforma opcional. Sua PSD de passeio aleatório de velocidade <c20/> é então <b>derivada</b> da física do interferômetro — o piso de ruído de disparo mais, quando uma PSD de vibração é fornecida, a contribuição limitada por vibração em quadratura — em vez de fornecida como coeficiente de folha de dados. Cenários sem um bloco <c21/> são clássicos e permanecem inalterados byte a byte.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Os sistemáticos de Coriolis (<c1/> / <c2/>) e de deslocamento de luz AC-Stark (<c3/>) estão implementados e testados por unidade (o viés equivalente de Coriolis é verificado em relação ao termo clássico <c4/>; a fase AC-Stark, em relação ao seu cancelamento simétrico). Uma varredura de deriva por tempo de ciclo (<c5/>) informa a deriva de posição por dead-reckoning do CAI quântico em função do tempo de ciclo — o núcleo computacional de uma comparação quântico versus clássico. O tipo de cenário <c6/> reutiliza o mesmo acelerômetro por meio de <c7/>, e <c8/> traz uma folha de parâmetros em faixas (melhor, nominal, conservador) com uma citação por valor.

# text
seg-e2acbef44395 = O que as verificações externas mostram.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> verifica a função de transferência em relação a uma integral numérica no domínio do tempo da função de sensibilidade de Cheinet, <c2/> em relação a comprimentos de onda de linha publicados, e o viés de Coriolis em relação a <c3/> — coincidências exatas com as formas publicadas. O piso de ruído de disparo é um limite unilateral: para os parâmetros publicados do gravímetro de césio de Peters et al. { "2001" } e do gravímetro de rubídio GAIN de Freier et al. { "2016" } (arXiv:{ "1512.05660" }), o piso modelado fica igual ou abaixo do ruído alcançado por cada dispositivo e a até três ordens de grandeza dele (para o GAIN, o piso é { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz contra os { "9.6" }×{ "10" }⁻⁸ alcançados, um fator de cerca de { "63" }). Isso é consistente com dispositivos reais serem limitados por vibração ou tecnicamente, mas é um limite, não uma validação de um modelo de ruído de instrumento, de modo que a linha da matriz permanece MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Os desdobramentos restantes são sistemáticos de frente de onda/apontamento de feixe, resolução de ambiguidade de franja, uma reprodução numericamente exata dos orçamentos Monte Carlo do CARIOQA-PMP e de teste em voo sem GPS (GPS: Sistema de Posicionamento Global) da Boeing/AOSense (que exigem as PSDs de plataforma publicadas e a SNR por disparo, a razão sinal-ruído), e um preset de comparação quântico versus clássico no playground do navegador, sobre <c1/>.

# text
seg-2452f58aedf0 = <s1>Anterior</s1>Modelos de sensores quânticos

# text
seg-206d5a9704f0 = <s1>Próximo</s1>API Python
