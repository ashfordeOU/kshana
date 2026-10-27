# docs--kind-lunar-infrastructure: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/lunar-infrastructure.md
seg-e821670a8b55 = Fonte: <c1/>

# text
# c1: lunar-infrastructure
seg-56953faa67ae = <c1/> (tipo de cenário)

# text
# c1: study
seg-d0fb90f506c9 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos sob um único tipo de cenário, selecionados por <c1/>: od-consistency (determinação de órbita a bordo por GNSS terrestre em uma NRHO ou ELFO contra determinação de órbita radiométrica independente em solo, julgadas pelas suas próprias covariâncias em um Monte Carlo com semente), carrier-phase (fase da portadora com dupla diferença conjunta entre superfície e orbitador e resolução de ambiguidade inteira com LAMBDA), frame-coestimation (uma estação de superfície e orbitadores acrescentados à medição de distância por estações terrestres para o datum de referencial lunar de sete parâmetros), space-tie (GNSS, VLBI e medição laser em uma mesma espaçonave, precisão da amarração de referencial contra o erro de amarração local) e geodesy-sensitivity (informação de Fisher dos números de Love lunares h2, k2, l2 e da libração física a partir de medição laser, rastreamento de orbitadores, um gravímetro de superfície e um relógio de superfície). Um modelo restrito de três corpos com simplificações declaradas; a numérica é verificada contra programas independentes e nada é comparado com uma medição de uma grandeza lunar.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Uma execução de <c1/> resume-se assim: lunar-infrastructure space-tie: { "4" } sweep points on { "1" } arcs; laser-vs-GNSS x translation sigma { "1.0363" } m at the registered local tie

# text
# c1: study
seg-f2594b18e718 = Campos obrigatórios: <c1/>

# text
# c1: seed
# c2: orbit
# c3: gnss
# c4: ground
# c5: monte_carlo
# c6: surface
# c7: llr
# c8: orbiter
# c9: gravimeter
# c10: clock
# c11: techniques
# c12: nominal
seg-4875c29c517c = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-7b33bdb70a30 = O exemplo <c1/> define, entre outros:

# text
seg-5fad84cbb2be = nrho

# text
seg-def582a1f2ca = Rótulo do resultado (o do motor): MODELLED — um modelo restrito de três corpos (Terra e Lua como massas pontuais, sem Sol, sem harmônicos do campo gravitacional lunar) com simplificações declaradas e entradas ILLUSTRATIVE rotuladas com as suas fontes públicas. A numérica é verificada contra programas independentes; nada é comparado com uma medição de uma grandeza lunar

# text
seg-f3b4a80a739b = sem gráfico: o exemplo não escreve nenhum gráfico

# text
seg-35a4a7a25561 = <b>MODELLED</b> Determinação de órbita em uma órbita de halo quase retilínea (ou em uma órbita elíptica congelada) a partir de dois tipos de dados independentes: pseudodistâncias GNSS terrestres recebidas a bordo . Referência independente (ReferenceImpl): um programa independente em scipy/numpy integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente verifica a numérica de fórmulas declaradas, não a física, de modo que a linha continua MODELLED. Modelo restrito de três corpos: sem Sol, sem harmônicos lunares, com o eixo de rotação da Terra ao longo da normal da órbita, entradas de receptor e de estação ILLUSTRATIVE.

# text
seg-32455bf5f804 = <b>MODELLED</b> Fase da portadora e código GNSS terrestres com diferença simples entre receptores em uma estação de superfície lunar e em um orbitador, com a diferença de relógio por época perfilada f. Referência independente (ReferenceImpl): uma resolução independente em numpy das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração inteira por força bruta (Q4). Nenhuma medição de fase da portadora GNSS ou lunar é comparada. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Informação de Fisher do datum de referencial lunar de sete parâmetros a partir da medição laser de estações terrestres para os cinco refletores isolados e com medição de distância entre orbitador e estação de superfície ra. Referência independente (ReferenceImpl): uma diferença finita independente em numpy do modelo direto (F2). Nada é comparado com soluções reais de referencial lunar. O fator é condicional à órbita conhecida presumida e ao sigma de distância de { "1" } m. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Precisão de Cramer-Rao dos deslocamentos de translação, escala e rotação entre técnicas, entre os referenciais GNSS, VLBI e de medição laser, quando uma única espaçonave leva todos . Referência independente (ReferenceImpl): um sistema empilhado independente em numpy, com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Nenhum dado do GRASP, do Genesis ou de outra missão é comparado. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED — um modelo restrito de três corpos (Terra e Lua como massas pontuais, sem Sol, sem harmônicos do campo gravitacional lunar) com simplificações declaradas e entradas ILLUSTRATIVE rotuladas com as suas fontes públicas. A numérica é verificada contra programas independentes; nada é comparado com uma medição de uma grandeza lunar, e nada aqui é uma declaração sobre qualquer missão ou sistema. Sem afiliação nem endosso de nenhuma agência. Consult (resultado <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos sob um único tipo de cenário, selecionados por <c1/>: od-consistency (determinação de órbita a bordo por GNSS terrestre em uma NRHO ou ELFO contra determinação de órbita radiométrica independente em solo, julgadas pelas suas próprias covariâncias em um Monte Carlo com semente), carrier-phase (fase da portadora com dupla diferença conjunta entre superfície e orbitador e ambiguidade int (catálogo de tipos de cenário (<c2/>))

# text
seg-4658f67623b5 = Cenário lunar-infrastructure do Kshana: space-tie. MODELLED; o projeto, as entradas e os limiares estão fixados em xval/lunar-infra/PREREGISTRATION.md (registrado antes de qualquer execução). As entradas ILLUSTRATIVE estão rotuladas ali com as suas fontes públicas. (comentário do arquivo de cenário, linhas { "1" } a { "3" })

# text
seg-f7257c25f137 = A determinação de órbita lunar: GNSS terrestre contra radiométrica em solo é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = A resolução de ambiguidade da fase da portadora lunar: superfície e orbitador é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = A coestimação do referencial lunar: estações de superfície e orbitadores é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = A precisão da amarração de referencial space-tie: GNSS, VLBI e medição laser colocalizados é MODELLED, não validada: verificada contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Página do tema: <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Anterior</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Próximo</s1>lunar-integrity
