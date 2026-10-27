# docs--quantum-models: translations (pt-PT)

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
seg-daf0e0c0b16f = O Kshana é um <b>simulador de resiliência de PNT (PNT: posicionamento, navegação e temporização) com modelos de desempenho de sensores quânticos</b>. <em>Não</em> é um simulador de física quântica a partir de princípios fundamentais. Esta página explica exatamente o que isso significa, para que o enquadramento "quântico" não possa ser tomado por mais do que é.

# text
seg-6e504d97c41e = O que É modelado

# text
seg-7884c9a7d883 = Cada sensor quântico (e clássico) é um <b>modelo de erro</b> conduzido por parâmetros publicados de orçamento de ruído:

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Relógios</b> — PSD (densidades espectrais de potência) de frequência branca e de frequência de passeio aleatório, um patamar de Allan de flicker (1/f) e deriva linear, a partir de folhas de especificações e artigos: o CSAC (relógio atómico à escala de chip) Microchip SA.45s; o relógio ótico de rede de estrôncio de Origlia et al. (arXiv:{ "1503.08457" }), um objetivo orientado para o espaço; e as seis predefinições de <c1/> (CSAC; USO, oscilador ultraestável; DSAC, Deep Space Atomic Clock; TCXO, oscilador de cristal compensado em temperatura; OCXO, oscilador de cristal com forno; RAFS, padrão de frequência atómico de rubídio), cada uma citando uma fonte. O desvio de Allan que estas produzem é validado face às inclinações padrão dos tipos de ruído (consulte <a1><c2/></a1>). Uma curva de relógio ótico é real: o desvio de Allan medido do relógio de pinças de ⁸⁸Sr de Norcia et al. (<em>Science</em> { "2019" }) é reproduzido pelo ajuste de ruído, uma linha VALIDATED em <a2><c3/></a2>; os valores de holdover construídos sobre a classe ótica continuam MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Sensores inerciais</b> — nos pacotes <c1/> e híbrido, um orçamento de erro de acelerómetro/giroscópio de eixo único (1-DOF, um grau de liberdade): passeio aleatório de velocidade, passeio aleatório angular, passeio aleatório de aceleração e um patamar de Allan de instabilidade do enviesamento. Os tipos <c2/> e <c3/> executam, em vez disso, a mecanização strapdown de três eixos em <c4/> (atitude por quaterniões, equações de navegação norte-este-baixo, um modelo determinista de erros da IMU).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Os tipos de cenário quânticos — <c1/>, <c2/>, <c3/>, <c4/> e <c5/> — são construídos a partir destes modelos de erro e são MODELLED; <c6/>, <c7/> e <c8/> comunicam também um registo de representatividade com as lacunas até ao voo.

# text
seg-05bbaddd4df6 = O motor é <b>neutro</b>: "quântico" e "clássico" são o mesmo percurso de código com coeficientes diferentes. O contraste nas figuras de mérito vem inteiramente dos parâmetros de ruído de entrada, cada um rastreável até uma fonte citada.

# text
seg-a1a067588520 = O que NÃO é modelado

# text
seg-49a656243210 = Para os sensores de relógio e de transferência de tempo, nada da física quântica subjacente é simulado — apenas a contribuição líquida de Allan, fornecida como coeficiente. Para o <b>acelerómetro de átomos frios</b> existe agora uma camada de princípios fundamentais (consulte abaixo); os restantes efeitos sistemáticos continuam ao nível de coeficientes ou não modelados:

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = a <b>fase de Mach–Zehnder</b> do interferómetro atómico (<c1/>), o <b>ruído de projeção quântica / de disparo</b> (<c2/>), o decaimento do <b>contraste</b> do interferómetro, o <b>tempo de ciclo</b> e a <b>função de transferência do acoplamento de vibração</b> (<c3/>, variância de PSD branca <c4/>) <em>são agora modelados a partir de princípios fundamentais</em> para o acelerómetro CAI (interferómetro de átomos frios) (<c5/>), derivando a PSD de aceleração branca <c6/> que o modelo clássico consome, em conjunto com a <b>gama dinâmica de ambiguidade de franjas</b> (<c7/>) — consulte <a1><c8/></a1>;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = o efeito sistemático de <b>Coriolis</b> (<c1/> / <c2/>, o acoplamento cruzado <c3/>) e o efeito sistemático de <b>AC-Stark (AC: corrente alternada) / desvio de luz</b> (<c4/>, que se anula sob uma dessintonia de dois fotões simétrica) <em>são agora modelados e testados unitariamente</em> em <c5/>;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = três outros termos de erro do CAI <em>são agora modelados</em> como funções de biblioteca em <c1/> ({ "0.36" }; MODELLED; ainda não acessíveis a partir de um tipo de cenário):

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>ruído de fase do laser Raman</b>: a ponderação pela função de sensibilidade de Cheinet et al. ({ "2008" }), Eq. { "8" }, com a forma fechada de ruído de fase branco <c1/> (Eq. { "18" } a um ciclo) e uma via numérica para qualquer espectro de ruído de fase, mais o ruído de frequência do laser que o atraso de retrorreflexão <c2/> não cancela (Le Gouët et al. { "2007" }, Eqs. { "9" } a { "11" });

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>curvatura da frente de onda</b> (apenas desfocagem pura): o enviesamento <c1/> de uma nuvem térmica num feixe de raio de curvatura <c2/>, e a sua redução quando só se contam os átomos dentro de um raio de deteção (segundo Louchet-Chauvet et al. { "2011" } e Schkolnik et al. { "2015" }); as aberrações de ordem superior não são modeladas;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>resolução da ambiguidade de franjas</b>: a probabilidade de um índice de franja errado, <c1/>, para um auxiliar de acelerómetro clássico (Lautier et al. { "2014" }) e para dois tempos de interrogação (segundo Bonnin et al. { "2018" }), com o inverso que dá o maior ruído clássico para uma probabilidade de falha indicada.

# text
# c1: τ_R
seg-f383678fb806 = Cada forma fechada é verificada face a uma via numérica independente (quadratura no domínio da frequência, ou um Monte Carlo sobre átomos ou disparos) e aos seus casos-limite. O único valor publicado reproduzido é o nível de ruído de fase branco de Cheinet et al.: −{ "111" } dB·rad²/Hz com <c1/> = { "20" } µs dá cerca de { "1" } mrad por disparo ({ "0.99" } mrad; o artigo deriva esse nível com a sua Eq. { "17" }, flicker mais branco). Nada disto é uma medição de qualquer instrumento;

# text
seg-150f8b9dfea4 = continuam a <b>não</b> ser modeladas: as aberrações da frente de onda de ordem superior, o ruído de fase de um sistema laser específico e a física de princípios fundamentais do lado do relógio;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = o pacote <c1/> de quântico versus clássico é de eixo único; o percurso strapdown de três eixos só é executado em <c2/> e <c3/> (consulte a nota sobre a IMU, unidade de medição inercial, no README e <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Concluir a camada de física quântica (alcançar os termos de erro do CAI a partir de um tipo de cenário, as aberrações da frente de onda de ordem superior e a física de princípios fundamentais do lado do relógio) é o trabalho P2 restante em <c1/>.

# text
seg-f09a31b33faa = Valores de laboratório de solo versus qualificados para voo

# text
seg-dcef4579d2a9 = As tabelas de parâmetros misturam níveis de maturidade; trate-as em função disso:

# text
seg-4f25895df32f = Valor de origem

# text
seg-cef61e912cd0 = CSAC (por exemplo SA.45s)

# text
seg-4a016be9bca9 = folha de especificações σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = componente comercial <b>em utilização</b> (existem variantes espaciais tolerantes à radiação)

# text
seg-d38d20629ed6 = Relógio ótico de rede de estrôncio

# text
seg-1f0d3ec00922 = objetivo σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>laboratório de solo</b> — o Kshana desconhece qualquer desempenho publicado em órbita de um deles

# text
seg-ce1d7994188b = Acelerómetro de átomos frios

# text
seg-b07fa6b8cebc = valores de Allan de laboratório publicados

# text
seg-60864f168701 = laboratório de solo / foguetão de sondagem

# text
seg-84a68aeb467d = Os valores de relógios óticos no Kshana são <em>objetivos espaciais em hardware de solo</em>. Não existe nenhum relógio ótico que tenha voado; o README e a proveniência do resultado dizem-no explicitamente.

# text
seg-a204c1b854fa = Benchmark: ACES/PHARAO na ISS (operacional desde abril de { "2025" })

# text
seg-fb88de1257bd = A carga útil <b>ACES/PHARAO</b> da ESA (European Space Agency) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — um relógio de césio arrefecido por laser mais um maser de hidrogénio ativo, em operação na ISS (International Space Station) desde abril de { "2025" } — é a atual referência operacional de estabilidade de relógio em órbita (estabilidade fracionária alvo da ordem de { "1e-16" } após alguns dias de integração). O modelo de relógio ótico do Kshana representa um objetivo de laboratório de solo <em>mais ambicioso</em> do que o desempenho de césio/maser que o ACES voou; ao comparar os números óticos do Kshana com "o que realmente voou", o ACES/PHARAO é o ponto de referência honesto, e é um sistema de micro-ondas/maser, não um relógio de rede ótica.

# text
seg-9d2e850cb986 = Os valores exatos de desempenho do ACES em órbita devem ser citados a partir dos resultados publicados pela ESA à medida que forem divulgados; o ponto aqui é a <em>lacuna de maturidade</em>, não um número específico — os valores óticos do Kshana são objetivos, não desempenho em voo.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — rótulos <c2/> / <c3/> por parâmetro.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — definições de figuras de mérito (FoM) e todas as abreviaturas.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — o que as FoM de Integridade e de Segurança são e não são.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — o acelerómetro de átomos frios a partir de princípios fundamentais.

# text
seg-41ba2c8f70fe = <s1>Anterior</s1>Projeto de constelações

# text
seg-136fa589fed5 = <s1>Seguinte</s1>Interferómetro de átomos frios
