# docs--tutorial-first-orbit: translations (pt-PT)

# text
seg-51ae9468b92a = O que é este cenário

# text
seg-08f3fdc9252a = Ler o resumo de uma linha

# text
seg-def5271a207d = O que o teste fixa

# text
seg-e5f926d1055b = Armadilhas e unidades

# text
seg-cb457294fc53 = Para onde ir a seguir

# text
# c1: docs/tutorials/01-first-orbit.md
seg-dcb2d0b170c1 = Fonte: <c1/>

# text
seg-f57d8b38bf08 = Tutorial { "1" } — A minha primeira órbita: onde estão os satélites GPS

# text
# c1: orbit
# c2: scenarios/orbit-sgp4-gps.toml
# c3: scenarios/orbit.toml
seg-1b9e1178555d = <c1/> · <b>Cenário:</b> <c2/> (cópia didática: <a1><c3/></a1>) · <b>Dificuldade:</b> principiante · <b>~{ "15" } min</b>

# text
seg-d065731294a1 = No final, terá propagado a constelação GPS operacional <em>real</em>, lido a sua disponibilidade e geometria e exportado uma tabela de onde cada satélite está realmente no espaço — e saberá que essa tabela é validada face a uma referência externa, não face a si própria.

# text
seg-b07bb365235d = Os satélites GPS (Global Positioning System) dizem a um utilizador <em>onde está</em> e <em>que horas são</em>. Antes de tudo isso, é preciso saber <b>onde estão os satélites</b> e <b>quantos deles um utilizador consegue ver</b>. Isso é geometria, e a geometria estabelece o limite mínimo da exatidão com que se pode ser posicionado (a diluição da precisão, ou DOP). Este tutorial:

# text
# c1: gps-ops
seg-dec5079e7715 = toma um instantâneo genuíno <c1/> do Celestrak da constelação GPS (2021-07-28, { "30" } satélites, elementos de duas linhas reais, TLE),

# text
seg-693859c435d8 = propaga cada satélite com o modelo SGP4/SDP4 validado (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

# text
seg-74b73260c7bc = em cada passo de tempo calcula que satélites um utilizador em órbita terrestre baixa consegue ver (linha de vista, ocultação pela Terra e uma máscara de elevação de { "5" }°),

# text
seg-605c40b73e96 = transforma essa geometria num <b>PDOP</b> (diluição da precisão da posição) e numa <b>exatidão de posição</b>, e

# text
seg-356e96d219b5 = exporta as posições efetivas dos satélites, centradas na Terra e fixas à Terra (ECEF), para um ficheiro SP3 (Standard Product { "3" }, o formato de órbita precisa do International GNSS Service, IGS; GNSS é Global Navigation Satellite System).

# text
seg-ff1666fe175e = A espinha dorsal é: <b>TLE → propagação SGP4 → ECEF por época → visibilidade → número de satélites visíveis → PDOP → sigma da posição = PDOP · σ_UERE</b>, em que σ_UERE é o erro equivalente de distância do utilizador (o erro de medição de distância de 1-σ por satélite).

# text
seg-379da723ae57 = Ou abra o <a1>Studio no navegador</a1> e escolha o cenário de órbita.

# text
seg-441743833f1e = A execução determinística (seed = { "17" }) imprime:

# text
seg-918a30fea48a = Campo a campo:

# text
# c1: scenario 4c51512369a6
seg-375fad797dcf = <b><c1/></b> — o hash do cenário, de 12 carateres. Identifica as entradas exatas (seed, limiares, parâmetros do modelo, o bloco TLE). Altere qualquer entrada e este valor muda; mantenha-as iguais e reproduz a execução bit a bit. O mesmo hash está carimbado no rodapé do gráfico e no ficheiro JSON (JavaScript Object Notation) do resultado.

# text
# c1: 345/361 samples GNSS-nominal
seg-133711d1ad9f = <b><c1/></b> — dos { "361" } passos de tempo, o utilizador tem uma solução de posição utilizável em { "345" } ({ "95.6" } %). A execução é uma passagem de { "12" } h ({ "43,200" } s) com um passo de { "120" } s.

# text
# c1: best PDOP 1.07
seg-a500c0473784 = <b><c1/></b> — a melhor diluição da precisão da posição (a mais baixa) ao longo da passagem. Um PDOP próximo de { "1" } é uma geometria excelente; quanto mais baixo, melhor.

# text
# c1: pos 1.07m
# c2: sigma_uere_m = 1.0
seg-98a24f0170d2 = <b><c1/></b> — a melhor exatidão de posição: <b>sigma da posição = PDOP · σ_UERE</b>. Neste cenário <c2/>, pelo que os dois números são <em>numericamente iguais</em> aqui — mas a regra é PDOP × UERE, <b>não</b> “posição = PDOP.” Com um UERE de { "3" } m, o sigma da posição seria ~{ "3.2" } m. (Ver a armadilha no final.)

# text
# c1: holdover
# c2: p95
# c3: integrity
# c4: security
# c5: security
# c6: n/a (no attack)
seg-410081c6dcab = Os valores do relógio (<c1/>, <c2/>, <c3/>, <c4/>) aparecem porque o pacote de órbita também transporta um relógio ao longo da passagem; são o foco do <a1>Tutorial { "2" }</a1>, não deste. (<c5/> lê-se <c6/> porque nenhum ataque está configurado.)

# text
seg-95ccef0d94ae = O bloco de geometria no JSON contém os números subjacentes:

# text
seg-89cb7db9b9eb = Onde estão os satélites? (a recompensa)

# text
seg-81678afa0cee = A geometria é boa <em>porque</em> os satélites estão realmente na camada GPS. Prove-o — exporte as suas posições fixas à Terra:

# text
seg-1452dfac9e06 = Os três primeiros satélites no primeiro passo de amostragem, ECEF em km (o ficheiro SP3 traz uma quarta coluna, de relógio, escrita com o marcador de “sem valor” { "999999.999999" }):

# text
seg-4fd0f95da0cf = Tome o raio geocêntrico do PG01:

# text
seg-cb02d7c01561 = A referência independente não circular: é mesmo uma órbita GPS?

# text
seg-a7c478360464 = Um tutorial que verifica o motor face a si próprio não prova nada. Eis a âncora externa e <em>não circular</em> para cada afirmação acima.

# text
# c1: a
# c2: tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell
# c3: 26000 km < |r(PG01)| < 27200 km
# c4: a
seg-eec62069a957 = <b>{ "1" }. Os satélites situam-se na camada real da órbita terrestre média (MEO) do GPS.</b> O semieixo maior nominal do GPS é <b>a = { "26,560" } km</b>, altitude ≈ { "20,180" } km acima do raio médio da Terra de { "6,378" } km (IS-GPS-200, a especificação de interface do GPS; o GPS Standard Positioning Service (SPS) Performance Standard, Departamento de Defesa dos EUA (DoD); Misra & Enge, <em>Global Positioning System</em>, 2.ª ed.). O raio instantâneo do PG01, de <b>{ "26,480.9" } km</b>, situa-se a algumas centenas de km de <c1/> — exatamente o que a excentricidade real do GPS (~{ "0.005" }–{ "0.02" }) produz. O teste <c2/> afirma <c3/> face a este <c4/> publicado, que é <b>externo ao Kshana</b>.

# text
# c1: T = 2π√(a³/μ)
# c2: a = 26,560 km
# c3: μ = 398,600.4418 km³/s²
# c4: T = 43,078 s = 11.967 h
seg-a052774de08f = <b>{ "2" }. A duração da passagem é uma revolução GPS.</b> A terceira lei de Kepler dá o período <c1/> com <c2/> e <c3/> (World Geodetic System { "1984" }, WGS-84; relatório técnico NIMA TR8350.2 da National Imagery and Mapping Agency): <c4/>, meio dia sideral. A duração do cenário de { "43,200" } s (“~uma revolução GPS”) coincide com isso a menos de { "0.3" } %, e a projeção no solo do GPS repete-se a cada dia sideral (duas revoluções), segundo a IS-GPS-200.

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
# c3: sgp4
seg-067fb466e396 = <b>{ "3" }. As posições propagadas são validadas, não apenas autoconsistentes.</b> O propagador SGP4/SDP4 que produziu esta tabela ECEF coincide com <b>todos os { "666" } vetores de verificação AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 até um pior caso de { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) e coincide com a crate independente <c3/> a menos de um mícron. Assim, a tabela exportada é verificada face a uma implementação de referência externa, não face à aritmética do próprio Kshana.

# text
seg-652ec3b3d3b8 = <b>Uma nota sobre as datas do SP3.</b> O cabeçalho de época do SP3 mostra uma data de calendário provisória (2000-01-01); a propagação decorre, na realidade, a partir da época própria de cada TLE ({ "2021" }). Leia a tabela como “posições ECEF no primeiro passo de amostragem”, não “em { "1" } de janeiro de { "2000" }.”

# text
# c1: tests/tutorials.rs
seg-74dcb96a27a9 = <c1/> transforma cada número acima num contrato de CI:

# text
# c1: tutorial1_orbit_headline_holds
# c2: best_pdop ≈ 1.071
# c3: best_position_sigma_m == best_pdop
# c4: sigma_uere_m = 1.0
# c5: samples_total == 361
# c6: 345/361
seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (porque <c4/>), <c5/>, e o resumo contém <c6/>.

# text
# c1: tutorial1_satellites_are_in_the_gps_meo_shell
# c2: a = 26,560 km
seg-241d75b1502b = <c1/> — o raio do PG01 está na banda da camada GPS, verificado face ao <c2/> publicado.

# text
seg-34328f4f148b = Se o motor alguma vez deixar de produzir uma camada GPS real, a compilação fica vermelha.

# text
# c1: sigma_uere_m = 1.0
seg-3c23c11911cb = <b>O sigma da posição é PDOP × UERE, não PDOP.</b> Os dois são iguais <em>apenas porque</em> <c1/> aqui. Altere o UERE e separam-se.

# text
seg-6bb2f31c15dc = <b>Os valores de temporização estão em nanossegundos</b>, o valor de posição em metros. Não os misture.

# text
# c1: holdover_s
seg-5bc68d0c144d = <b><c1/> é quantizado pela grelha</b> (um limite inferior ao passo da grelha de tempo). Nesta passagem o utilizador está essencialmente sempre com solução de posição, pelo que o holdover é { "0" } s (sem interrupção a atravessar) — esse é o caso <em>bom</em>.

# text
# c1: mask_deg
seg-9c36a5c64af5 = Aperte ou alargue a máscara de elevação (<c1/>) e veja a disponibilidade mudar — é um exercício de Nível 2.

# text
# c1: scripts/fetch_tles.sh
seg-b0222934237e = Substitua por um instantâneo TLE novo com <c1/> (Nível 2 “utilizar dados novos”).

# text
seg-e487166204f8 = Avance para o <a1>Tutorial { "2" } — Holdover do relógio</a1>, onde o sinal GNSS é <em>retirado</em> e o relógio de bordo tem de navegar em inércia.

# text
seg-795315608752 = <s1>Anterior</s1>Tutoriais

# text
seg-97ca5a3cc77e = <s1>Seguinte</s1>{ "2" } · Holdover do relógio
