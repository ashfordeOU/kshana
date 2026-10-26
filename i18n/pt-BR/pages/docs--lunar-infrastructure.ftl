# docs--lunar-infrastructure: translations (pt-BR)

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
seg-bfb9c5efbe57 = Tipo de cenário <c1/>, cinco estudos selecionados por <c2/>. <b>MODELLED</b>: um modelo restrito de três corpos com simplificações declaradas e entradas ILLUSTRATIVE. A numérica é conferida com programas independentes em numpy/scipy; nada é comparado com uma medição de uma grandeza lunar e nada aqui é uma declaração sobre qualquer missão ou sistema. Sem afiliação nem endosso de qualquer agência. Software de caráter consultivo, não um equipamento homologado. O Kshana não transmite nada e não aciona hardware algum.

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Os projetos, as entradas e os limiares foram fixados em <c1/> (versionado antes de qualquer estudo ser pontuado) e em duas emendas divulgadas (<c2/>). O veredito de cada limiar está em <c3/>.

# text
seg-d9d9d0864ae0 = Estudo

# text
seg-3b01a756c305 = O que calcula

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Determinação de órbita a bordo Terra-GNSS em uma NRHO (ou <c1/>) contra uma determinação de órbita independente em solo por distância e taxa de variação da distância a partir de três estações DSN; a covariância formal de cada estimativa; um Monte Carlo com semente para saber se as duas covariâncias explicam sua diferença (q, qui-quadrado com { "6" } graus de liberdade); uma aceleração não modelada injetada

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (rápido), <c2/> (pontuado, cerca de oito minutos)

# text
seg-b9c6eb8d778c = Fase da portadora com dupla diferença conjunta de estação de superfície e orbitador; covariância de ambiguidade flutuante; LAMBDA; sucesso por bootstrap e por Monte Carlo; sigma de posição flutuante e fixa

# text
seg-74c347e0bc69 = Informação de Fisher do datum lunar de 7 parâmetros a partir de medições de distância de estações terrestres, com e sem distâncias entre orbitador e estação de superfície; conjuntos de estações aleatórios com semente

# text
seg-4ed875c39781 = GNSS, VLBI e medição laser de distância em uma só espaçonave: precisão de Cramer-Rao dos deslocamentos entre técnicas em face do erro de ligação local

# text
seg-de25104c09a2 = Informação sobre h2, k2, l2 e a libração física a partir de medição laser de distância, rastreamento de orbitador, um gravímetro e um relógio de superfície (constantes compartilhadas com os módulos de tempo lunar)

# attr:alt
seg-18fc4ba766df = Consistência de uma determinação de órbita a bordo Terra-GNSS em uma órbita de halo quase retilínea com uma determinação de órbita em solo independente, a partir de execuções reais do motor v{ $version } em scenarios/lunar-infrastructure-od-consistency.toml e na variante com erro de modelo ({ "400" } ensaios cada). A diferença média normalizada q é { "5.81" } sem erro de modelo e { "5.95" } com um erro de aceleração injetado de { "3e-10" } m/s2, contra { "6" } esperado: as duas soluções de órbita são consistentes (limiar C1 MET). A fração de ensaios acima do ponto de { "95" } % é { "0.040" } e { "0.052" }; o limiar para detectar o erro injetado era de pelo menos { "0.5" }, portanto é NOT MET (C3): a solução a bordo é conhecida a cerca de { "352" } m contra { "23" } m da solução em solo, de modo que um deslocamento de dez metros se esconde dentro de sua covariância. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-4c08262e2556 = Fixação da ambiguidade inteira da fase da portadora entre estações da superfície lunar e um orbitador, a partir do resultado versionado da execução pontuada do motor v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } comprimentos de arco, um Monte Carlo de { "400" } sorteios cada, escrito por scenarios/carrier-phase-scored.toml). { "1" } dia: sucesso { "1.0" } % (erro padrão { "0.5" } %), { "134" } ambiguidades, sigma de posição do orbitador { "45.6" } m flutuante e { "18.5" } m fixo; { "2" } dias: sucesso { "0.5" } % (erro padrão { "0.4" } %), { "259" } ambiguidades, sigma de posição do orbitador { "21.5" } m flutuante e { "8.7" } m fixo; { "3" } dias: sucesso { "2.8" } % (erro padrão { "0.8" } %), { "375" } ambiguidades, sigma de posição do orbitador { "6.3" } m flutuante e { "2.1" } m fixo. A fixação inteira não é alcançada: o sucesso permanece entre { "1" } % e { "3" } % a { "25" } dBi e, aos { "12" } dBi registrados, o problema não pode ser formado. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-7e5b10641b20 = Precisão do datum lunar de sete parâmetros (três translações, uma escala e três rotações) a partir de medições de distância de estações terrestres, com e sem distâncias entre orbitador e estação de superfície, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-frame-coestimation.toml. O sigma de Cramer-Rao das translações e rotações diminui com os enlaces do orbitador (por exemplo t_z de { "0.98" } m para { "0.046" } m); o menor autovalor de informação sobe 111 vezes e o traço do CRLB cai para { "1.0" } % (limiar F3 MET). Isso supõe que a órbita é conhecida nos eixos lunares, com seu erro levado pelo sigma de distância do orbitador de { "1" } m. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-377d29dcc6e8 = Precisão dos deslocamentos entre as posições por medição laser de distância, VLBI e GNSS de uma espaçonave, em face do erro da ligação local em solo, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-space-tie.toml (um arco de 6.56 dias, sigmas das técnicas GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Com uma ligação local de { "1" } mm a { "1" } m, o sigma da translação laser menos GNSS permanece perto de { "1.04" } m até que a ligação chegue a { "1" } m: ele é limitado pelo ruído de medição das técnicas, não pela ligação local. O piso definido apenas pela ligação é a raiz quadrada de dois vezes o seu sigma. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-9d507a371319 = Qual família de observáveis é sensível aos números de Love lunares h2, k2 e l2, a partir de uma execução real do motor v{ $version } em scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Cada célula é a derivada parcial RMS das observações de uma família em relação a um parâmetro, nas unidades próprias dessa família (de modo que as células se comparam ao longo de uma linha, não ao longo de uma coluna); um traço significa que a família não tem sensibilidade. Medição laser de distância: h2 { "7.6" }, k2 nenhuma, l2 { "9.8" }. Rastreamento de orbitador: h2 nenhuma, k2 { "0.00086" }, l2 nenhuma. Gravímetro de superfície: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 nenhuma. Relógio de superfície: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 nenhuma. Com as quatro famílias, o sigma de Cramer-Rao é { "0.36" } % do h2 nominal, { "0.52" } % do k2 e { "1.16" } % do l2. Acrescentar uma família nunca reduziu o menor autovalor ({ "28" } de { "28" } acréscimos), mas o traço da pseudoinversa não foi maior em apenas { "16" } de { "28" }: essa metade do limiar G3 é NOT MET. A família do orbitador vê a integral de linha de visada da aceleração de k2, um valor de extremo superior. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# text
seg-570b9276834b = Simplificações declaradas

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = Terra e Lua como massas pontuais em órbita circular, sem Sol, sem harmônicos do campo gravitacional lunar; o eixo de rotação da Terra é a normal da órbita; o referencial inercial é igual ao referencial girante em t = { "0" }; uma Lua esférica; um referencial lunar síncrono (sem libração), exceto em <c1/>; a órbita é mantida conhecida nos eixos lunares em <c2/> (seu erro é levado pelo sigma de distância do orbitador); a família do orbitador de <c3/> vê a integral de linha de visada da aceleração de k2 depois de removidas uma constante e uma tendência linear, um valor de extremo superior.

# text
seg-fd644b1f33ec = Forma do relatório

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Todo relatório traz <c1/>, <c2/>, <c3/>, <c4/>, os campos do estudo e um bloco <c5/> (uma unidade e uma classe de proveniência para cada campo numérico). Nenhuma série por instante é emitida. Listas de campos: o bloco <c6/> de cada relatório e <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), usado como nominal. h2 e l2 são pontos de linearização, não valores verificados. As coordenadas das estações DSN são os valores ITRF93 nos comentários do kernel NAIF <c1/>; as faixas de precisão do DSN foram lidas apenas de resumos de busca. O conceito de ligação espacial segue as descrições públicas do GRASP e do ESA Genesis. A tabela completa, com a forma como cada valor foi lido, está no pré-registro.

# text
seg-6cd670ae6eea = Resultados em resumo (ver RESULTS.md)

# text
seg-6334f82991d3 = Não atendidos, e fixados por testes que afirmam a falha: C3 (a métrica de erro injetado não dispara a { "3e-10" } m/s2), a metade de taxa por bootstrap de Q3 a { "1e-9" } e a metade de traço do CRLB de G3. A fixação da ambiguidade inteira não é alcançada nas entradas registradas. Nada é VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Anterior</s1>Navegação de usuários no espaço (gnss-ssv)

# text
seg-90932eed0074 = <s1>Próxima</s1>Posicionamento, navegação e temporização em LEO
