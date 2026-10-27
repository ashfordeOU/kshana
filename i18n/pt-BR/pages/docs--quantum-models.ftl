# docs--quantum-models: translations (pt-BR)

# text
seg-638b8d451550 = Sensor

# text
seg-c35a20fa2529 = Maturidade

# text
# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Fonte: <c1/>

# text
seg-39ab7752d86d = Modelos de sensores quânticos: o que o Kshana modela e o que não modela

# text
seg-daf0e0c0b16f = O Kshana é um <b>simulador de resiliência de PNT (PNT: posicionamento, navegação e temporização) com modelos de desempenho de sensores quânticos</b>. Ele <em>não</em> é um simulador de física quântica a partir de primeiros princípios. Esta página declara exatamente o que isso significa, para que o enquadramento "quântico" não seja tomado por mais do que é.

# text
seg-6e504d97c41e = O que É modelado

# text
seg-7884c9a7d883 = Cada sensor quântico (e clássico) é um <b>modelo de erro</b> dirigido por parâmetros publicados de orçamento de ruído:

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Relógios</b> — PSDs (densidades espectrais de potência) de frequência branca e de passeio aleatório de frequência, um piso de Allan flicker (1/f) e deriva linear, obtidos de folhas de dados e artigos: o CSAC (relógio atômico em escala de chip) Microchip SA.45s; o relógio óptico de rede de estrôncio de Origlia et al. (arXiv:{ "1503.08457" }), uma meta voltada ao espaço; e os seis padrões de <c1/> (CSAC; USO, oscilador ultraestável; DSAC, Deep Space Atomic Clock; TCXO, oscilador de cristal com compensação de temperatura; OCXO, oscilador de cristal em forno; RAFS, padrão de frequência atômico de rubídio), cada um citando uma fonte. O desvio de Allan que eles produzem é validado em relação às inclinações padrão por tipo de ruído (consulte <a1><c2/></a1>). Uma curva de relógio óptico é real: o desvio de Allan medido do relógio de pinças de ⁸⁸Sr de Norcia et al. (<em>Science</em> { "2019" }) é reproduzido pelo ajuste de ruído, uma linha VALIDATED em <a2><c3/></a2>; as figuras de holdover construídas sobre a classe óptica continuam MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Sensores inerciais</b> — nos pacotes <c1/> e híbridos, um orçamento de erro de acelerômetro/giroscópio de eixo único (1-DOF, um grau de liberdade): passeio aleatório de velocidade, passeio aleatório angular, passeio aleatório de aceleração e um piso de Allan de instabilidade de viés. Os tipos de cenário <c2/> e <c3/>, em vez disso, executam a mecanização strapdown de três eixos em <c4/> (atitude por quatérnions, equações de navegação norte-leste-baixo, um modelo determinístico de erros de IMU).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Os tipos de cenário quânticos — <c1/>, <c2/>, <c3/>, <c4/> e <c5/> — são construídos a partir desses modelos de erro e são MODELLED; <c6/>, <c7/> e <c8/> também relatam um registro de representatividade com as lacunas até o voo.

# text
seg-05bbaddd4df6 = O motor é <b>neutro</b>: "quântico" e "clássico" são o mesmo caminho de código com coeficientes diferentes. O contraste nas figuras de mérito vem inteiramente dos parâmetros de ruído de entrada, cada um rastreável até uma fonte citada.

# text
seg-a1a067588520 = O que NÃO é modelado

# text
seg-49a656243210 = Para os sensores de relógio e de transferência de tempo, nenhuma da física quântica subjacente é simulada — apenas a contribuição líquida de Allan, fornecida como um coeficiente. Para o <b>acelerômetro de átomos frios</b> agora existe uma camada de primeiros princípios (veja abaixo); os demais efeitos sistemáticos continuam no nível de coeficiente ou não modelados:

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = a <b>fase de Mach–Zehnder</b> do interferômetro atômico (<c1/>), o <b>ruído de projeção quântica / de disparo</b> (<c2/>), o decaimento do <b>contraste</b> do interferômetro, o <b>tempo de ciclo</b> e a <b>função de transferência de acoplamento de vibração</b> (<c3/>, variância de PSD branca <c4/>) <em>agora são modelados a partir de primeiros princípios</em> para o acelerômetro CAI (interferômetro de átomos frios) (<c5/>), derivando a PSD de aceleração branca <c6/> que o modelo clássico consome, junto com a <b>faixa dinâmica de ambiguidade de franjas</b> (<c7/>) — veja <a1><c8/></a1>;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = o efeito sistemático de <b>Coriolis</b> (<c1/> / <c2/>, o acoplamento cruzado <c3/>) e o efeito sistemático de <b>AC-Stark (AC: corrente alternada) / deslocamento de luz</b> (<c4/>, que se cancela sob uma dessintonia simétrica de dois fótons) <em>agora são modelados e testados unitariamente</em> em <c5/>;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = mais três termos de erro de CAI <em>agora estão modelados</em> como funções da biblioteca em <c1/> ({ "0.36" }; MODELLED; ainda não acessíveis a partir de um tipo de cenário):

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>ruído de fase do laser Raman</b>: a ponderação pela função de sensibilidade de Cheinet et al. ({ "2008" }), Eq. { "8" }, com a forma fechada para ruído de fase branco <c1/> (Eq. { "18" } com um ciclo) e uma via numérica para qualquer espectro de ruído de fase, mais o ruído de frequência do laser que o atraso de retrorreflexão <c2/> não cancela (Le Gouët et al. { "2007" }, Eqs. { "9" } a { "11" });

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>curvatura da frente de onda</b> (apenas desfocagem pura): o viés <c1/> de uma nuvem térmica em um feixe com raio de curvatura <c2/>, e sua redução quando apenas os átomos dentro de um raio de detecção são contados (segundo Louchet-Chauvet et al. { "2011" } e Schkolnik et al. { "2015" }); aberrações de ordem superior não são modeladas;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>resolução de ambiguidade de franja</b>: a probabilidade de um índice de franja errado, <c1/>, para o auxílio de um acelerômetro clássico (Lautier et al. { "2014" }) e para dois tempos de interrogação (segundo Bonnin et al. { "2018" }), com a inversa que fornece o maior ruído clássico para uma probabilidade de falha declarada.

# text
# c1: τ_R
seg-f383678fb806 = Cada forma fechada é verificada em relação a uma via numérica independente (quadratura no domínio da frequência, ou um Monte Carlo sobre átomos ou disparos) e aos seus casos-limite. O único número publicado reproduzido é o nível de ruído de fase branco de Cheinet et al.: −{ "111" } dB·rad²/Hz com <c1/> = { "20" } µs resulta em cerca de { "1" } mrad por disparo ({ "0.99" } mrad; o artigo deriva esse nível com sua Eq. { "17" }, flicker mais branco). Nada disso é uma medição de qualquer instrumento;

# text
seg-150f8b9dfea4 = ainda <b>não</b> modelados: aberrações de frente de onda de ordem superior, o ruído de fase de um sistema laser específico e a física de primeiros princípios do lado do relógio;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = o pacote <c1/> quântico versus clássico é de eixo único; o caminho strapdown de três eixos roda apenas em <c2/> e <c3/> (veja a nota sobre a IMU, unidade de medição inercial, no README e <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Concluir a camada de física quântica (alcançar os termos de erro de CAI a partir de um tipo de cenário, aberrações de frente de onda de ordem superior e física de primeiros princípios do lado do relógio) é o trabalho P2 restante em <c1/>.

# text
seg-f09a31b33faa = Valores de laboratório em solo versus qualificados para voo

# text
seg-dcef4579d2a9 = As tabelas de parâmetros misturam níveis de maturidade; trate-as de acordo:

# text
seg-4f25895df32f = Valor da fonte

# text
seg-cef61e912cd0 = CSAC (p. ex., SA.45s)

# text
seg-4a016be9bca9 = folha de dados σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = componente comercial <b>em uso</b> (existem variantes espaciais tolerantes à radiação)

# text
seg-d38d20629ed6 = Relógio óptico de rede de estrôncio

# text
seg-1f0d3ec00922 = meta σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>laboratório em solo</b> — o Kshana desconhece qualquer desempenho publicado em órbita para um deles

# text
seg-ce1d7994188b = Acelerômetro de átomos frios

# text
seg-b07fa6b8cebc = valores de Allan de laboratório publicados

# text
seg-60864f168701 = laboratório em solo / foguete de sondagem

# text
seg-84a68aeb467d = Os valores de relógio óptico no Kshana são <em>metas espaciais em hardware de solo</em>. Não existe relógio óptico que tenha voado; o README e a proveniência dos resultados dizem isso explicitamente.

# text
seg-a204c1b854fa = Benchmark: ACES/PHARAO na ISS (em operação desde abril de { "2025" })

# text
seg-fb88de1257bd = A carga útil <b>ACES/PHARAO</b> da ESA (Agência Espacial Europeia; ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — um relógio de césio resfriado a laser mais um maser de hidrogênio ativo, em operação na ISS (Estação Espacial Internacional) desde abril de { "2025" } — é o atual benchmark operacional de estabilidade de relógio em órbita (estabilidade fracionária alvo da ordem de { "1e-16" } após alguns dias de integração). O modelo de relógio óptico do Kshana representa uma meta de laboratório em solo <em>mais agressiva</em> do que o desempenho de césio/maser que o ACES de fato levou ao espaço; ao comparar os números ópticos do Kshana com "o que de fato voou", o ACES/PHARAO é o ponto de referência honesto, e é um sistema de micro-ondas/maser, não um relógio de rede óptica.

# text
seg-9d2e850cb986 = Os valores exatos de desempenho do ACES em órbita devem ser citados a partir dos resultados publicados pela ESA à medida que forem divulgados; o ponto aqui é a <em>defasagem de maturidade</em>, não um número específico — os valores ópticos do Kshana são metas, não desempenho de voo.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — rótulos <c2/> / <c3/> por parâmetro.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — definições das figuras de mérito (FoM) e de todas as abreviações.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — o que as FoMs de integridade e de segurança são e não são.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — o acelerômetro de átomos frios de primeiros princípios.

# text
seg-41ba2c8f70fe = <s1>Anterior</s1>Projeto de constelação

# text
seg-136fa589fed5 = <s1>Próximo</s1>Interferômetro de átomos frios
