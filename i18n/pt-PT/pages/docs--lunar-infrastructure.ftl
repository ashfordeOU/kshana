# docs--lunar-infrastructure: translations (pt-PT)

# text
seg-cae10fb9bff8 = Cenário

# text
seg-61817375c8ea = Órbita e superfície lunares como infraestrutura de navegação e geodésica

# text
seg-9872e31ebd72 = Fontes

# text
# c1: docs/LUNAR-INFRASTRUCTURE.md
seg-922905241a6b = Fonte: <c1/>

# text
# c1: lunar-infrastructure
# c2: study
seg-bfb9c5efbe57 = Tipo de cenário <c1/>, cinco estudos selecionados por <c2/>. <b>MODELLED</b>: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ILLUSTRATIVE. A numérica é verificada face a programas numpy/scipy independentes; nada é comparado com uma medição de uma grandeza lunar e nada aqui é uma afirmação sobre qualquer missão ou sistema. Sem filiação nem aval de qualquer agência. Software de caráter consultivo, não um equipamento homologado. O Kshana não transmite nada e não controla equipamento.

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Os projetos, os dados de entrada e os limiares foram fixados em <c1/> (registado antes de qualquer estudo ser pontuado) e em duas alterações divulgadas (<c2/>). O veredicto de cada limiar está em <c3/>.

# text
seg-d9d9d0864ae0 = Estudo

# text
seg-3b01a756c305 = O que calcula

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Determinação de órbita GNSS da Terra a bordo numa NRHO (ou <c1/>) face a uma determinação de órbita independente a partir de terra por distância e taxa de variação da distância a partir de três estações da DSN; a covariância formal de cada estimativa; um Monte Carlo com semente sobre se as duas covariâncias explicam a sua diferença (q, qui-quadrado com { "6" } graus de liberdade); uma aceleração não modelada injetada

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (rápido), <c2/> (pontuado, cerca de oito minutos)

# text
seg-b9c6eb8d778c = Fase da portadora com dupla diferença conjunta de estação à superfície e de orbitador; covariância da ambiguidade flutuante; LAMBDA; sucesso por bootstrap e Monte Carlo; sigma de posição flutuante e fixa

# text
seg-74c347e0bc69 = Informação de Fisher do referencial lunar de 7 parâmetros a partir da medição de distância a estações da Terra, com e sem distâncias orbitador-estação à superfície; conjuntos de estações aleatórios com semente

# text
seg-4ed875c39781 = GNSS, VLBI e medição de distância por laser numa só nave: precisão de Cramer-Rao dos desvios entre técnicas face ao erro de ligação local

# text
seg-de25104c09a2 = Informação sobre h2, k2, l2 e a libração física a partir de medição de distância por laser, seguimento de orbitador, um gravímetro e um relógio à superfície (constantes partilhadas com os módulos de tempo lunar)

# attr:alt
seg-18fc4ba766df = Coerência de uma determinação de órbita GNSS da Terra a bordo numa órbita de halo quase retilínea com uma determinação de órbita independente a partir de terra, a partir de execuções reais do motor v{ $version } em scenarios/lunar-infrastructure-od-consistency.toml e na variante com erro de modelo ({ "400" } ensaios cada). A diferença normalizada média q é { "5.81" } sem erro de modelo e { "5.95" } com um erro de aceleração injetado de { "3e-10" } m/s2, face a { "6" } esperado: as duas soluções de órbita são coerentes (limiar C1 MET). A parte dos ensaios acima do ponto dos { "95" } % é { "0.040" } e { "0.052" }; o limiar para detetar o erro injetado era de pelo menos { "0.5" }, pelo que é NOT MET (C3): a solução a bordo é conhecida a cerca de { "352" } m face a { "23" } m para a de terra, pelo que um deslocamento de dez metros se esconde dentro da sua covariância. MODELLED: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ilustrativos, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-4c08262e2556 = Fixação da ambiguidade inteira da fase da portadora entre estações à superfície lunar e um orbitador, a partir do resultado registado da execução pontuada do motor v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } comprimentos de arco, um Monte Carlo de { "400" } sorteios cada, escrito por scenarios/carrier-phase-scored.toml). { "1" } dia: sucesso { "1.0" } % (erro-padrão { "0.5" } %), { "134" } ambiguidades, sigma de posição do orbitador { "45.6" } m flutuante e { "18.5" } m fixo; { "2" } dias: sucesso { "0.5" } % (erro-padrão { "0.4" } %), { "259" } ambiguidades, sigma de posição do orbitador { "21.5" } m flutuante e { "8.7" } m fixo; { "3" } dias: sucesso { "2.8" } % (erro-padrão { "0.8" } %), { "375" } ambiguidades, sigma de posição do orbitador { "6.3" } m flutuante e { "2.1" } m fixo. A fixação inteira não é alcançada: o sucesso mantém-se entre { "1" } % e { "3" } % a { "25" } dBi e, aos { "12" } dBi registados, o problema não pode ser formado. MODELLED: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ilustrativos, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-7e5b10641b20 = Precisão do referencial lunar de sete parâmetros (três translações, uma escala e três rotações) a partir da medição de distância a estações da Terra, com e sem distâncias orbitador-estação à superfície, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-frame-coestimation.toml. O sigma de Cramer-Rao das translações e das rotações diminui com as ligações do orbitador (por exemplo, t_z de { "0.98" } m para { "0.046" } m); o menor valor próprio da informação sobe 111 vezes e o traço do CRLB desce para { "1.0" } % (limiar F3 MET). Isto pressupõe que a órbita é conhecida nos eixos lunares, com o seu erro transportado pelo sigma de distância do orbitador de { "1" } m. MODELLED: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ilustrativos, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-377d29dcc6e8 = Precisão dos desvios entre as posições por medição de distância a laser, VLBI e GNSS de uma nave, face ao erro da ligação local em terra, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-space-tie.toml (um arco de 6.56 dias, sigmas das técnicas GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Com uma ligação local de { "1" } mm a { "1" } m, o sigma de translação laser menos GNSS mantém-se perto de { "1.04" } m até a ligação atingir { "1" } m: é limitado pelo ruído de medição das técnicas, não pela ligação local. O piso definido apenas pela ligação é a raiz quadrada de dois multiplicada pelo seu sigma. MODELLED: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ilustrativos, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-9d507a371319 = Que família de observáveis é sensível aos números de Love lunares h2, k2 e l2, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Cada célula é a derivada parcial RMS das observações de uma família relativamente a um parâmetro, nas unidades próprias dessa família (pelo que as células se comparam ao longo de uma linha, não ao longo de uma coluna); um travessão significa que a família não tem sensibilidade. medição de distância por laser: h2 { "7.6" }, k2 nenhuma, l2 { "9.8" }. seguimento do orbitador: h2 nenhuma, k2 { "0.00086" }, l2 nenhuma. gravímetro à superfície: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 nenhuma. relógio à superfície: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 nenhuma. Com as quatro famílias, o sigma de Cramer-Rao é { "0.36" } % do h2 nominal, { "0.52" } % do k2 e { "1.16" } % do l2. Acrescentar uma família nunca baixou o menor valor próprio ({ "28" } de { "28" } acréscimos), mas o traço da pseudo-inversa não foi maior em apenas { "16" } de { "28" }: essa metade do limiar G3 é NOT MET. A família do orbitador vê o integral ao longo da linha de visada da aceleração de k2, um valor do extremo superior. MODELLED: um modelo restrito de três corpos com simplificações indicadas e dados de entrada ilustrativos, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# text
seg-570b9276834b = Simplificações declaradas

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = Terra e Lua como massas pontuais numa órbita circular, sem Sol e sem harmónicos do campo gravitacional lunar; o eixo de rotação da Terra é a normal à órbita; o referencial inercial coincide com o referencial rotativo em t = { "0" }; uma Lua esférica; um referencial lunar síncrono (sem libração), exceto em <c1/>; a órbita é mantida conhecida nos eixos lunares em <c2/> (o seu erro é transportado pelo sigma da distância do orbitador); a família de orbitadores de <c3/> vê o integral ao longo da linha de visada da aceleração de k2 depois de removidas uma constante e uma tendência linear, um valor do extremo superior.

# text
seg-fd644b1f33ec = Estrutura do relatório

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Todos os relatórios incluem <c1/>, <c2/>, <c3/>, <c4/>, os campos do estudo e um bloco <c5/> (uma unidade e uma classe de proveniência para cada campo numérico). Não é emitida nenhuma série por instante. Listas de campos: o bloco <c6/> de cada relatório e <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), usado como valor nominal. h2 e l2 são pontos de linearização, não valores verificados. As coordenadas das estações da DSN são os valores ITRF93 dos comentários do kernel NAIF <c1/>; as bandas de exatidão da DSN foram lidas apenas em resumos de pesquisa. O conceito de ligação espacial segue as descrições públicas do GRASP e do Genesis da ESA. A tabela completa, com a forma como cada valor foi lido, consta do pré-registo.

# text
seg-6cd670ae6eea = Resultados num relance (ver RESULTS.md)

# text
seg-6334f82991d3 = Não atingidos, e fixados por testes que afirmam a falha: C3 (a métrica de erro injetado não dispara a { "3e-10" } m/s2), a metade de Q3 da taxa obtida por bootstrap a { "1e-9" } e a metade de G3 do traço do CRLB. A fixação da ambiguidade inteira não é conseguida nas entradas registadas. Nada é VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Anterior</s1>Navegação de utilizadores espaciais (gnss-ssv)

# text
seg-90932eed0074 = <s1>Seguinte</s1>Posicionamento, navegação e temporização em LEO

# text
seg-c3b27dfb7bca = <s1>Seguinte</s1>Cadeia da missão: do lançamento à reentrada
