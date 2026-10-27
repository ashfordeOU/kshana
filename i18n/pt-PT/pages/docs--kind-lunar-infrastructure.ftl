# docs--kind-lunar-infrastructure: translations (pt-PT)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-d0fb90f506c9 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos num único tipo de cenário selecionado por <c1/>: od-consistency (determinação de órbita a bordo com Earth-GNSS numa NRHO ou ELFO face à determinação de órbita radiométrica independente a partir do solo, avaliadas pelas suas próprias covariâncias sobre um Monte Carlo de semente fixa), carrier-phase (fase da portadora de dupla diferença conjunta superfície-orbitador e resolução de ambiguidades inteiras com LAMBDA), frame-coestimation (uma estação de superfície e orbitadores acrescentados à medição de distâncias de estações terrestres para o datum de referencial lunar de sete parâmetros), space-tie (GNSS, VLBI e telemetria laser numa única nave, precisão da ligação de referenciais face ao erro de ligação local) e geodesy-sensitivity (informação de Fisher dos números de Love lunares h2, k2, l2 e da libração física a partir de telemetria laser, seguimento de orbitadores, um gravímetro de superfície e um relógio de superfície). Um modelo restrito de três corpos com simplificações indicadas; a numérica é verificada face a programas independentes e nada é comparado com uma medição de uma grandeza lunar.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Uma execução de <c1/> resume-se assim: lunar-infrastructure space-tie: { "4" } pontos de varrimento em { "1" } arcos; laser-vs-GNSS x sigma de translação { "1.0363" } m na ligação local registada

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
seg-def582a1f2ca = Etiqueta do resultado (a do motor): MODELLED — um modelo restrito de três corpos (Terra e Lua como massas pontuais, sem Sol, sem harmónicos do campo gravítico lunar) com simplificações indicadas e entradas ILLUSTRATIVE etiquetadas com as suas fontes públicas. A numérica é verificada face a programas independentes; nada é comparado com uma medição de uma grandeza lun

# text
seg-f3b4a80a739b = sem gráfico: o exemplo não escreve nenhum gráfico

# text
seg-35a4a7a25561 = <b>MODELLED</b> Determinação de órbita numa órbita de halo quase retilínea (ou numa órbita elíptica congelada) a partir de dois tipos de dados independentes: pseudodistâncias Earth-GNSS recebidas a bordo. Referência independente (ReferenceImpl): Um programa scipy/numpy independente integra as mesmas equações variacionais (limiar O1). Nada é comparado com uma medição de uma órbita lunar. A referência independente verifica a numérica de fórmulas indicadas, não a física, pelo que a linha continua a ser MODELLED. Modelo restrito de três corpos: sem Sol, sem harmónicos lunares, com o eixo de rotação da Terra ao longo da normal à órbita, entradas de recetor e de estação ILLUSTRATIVE.

# text
seg-32455bf5f804 = <b>MODELLED</b> Fase da portadora e código Earth-GNSS de diferença simples entre recetores numa estação de superfície lunar e num orbitador, com a diferença de relógio por época eliminada por perfilagem. Referência independente (ReferenceImpl): Uma resolução numpy independente das mesmas equações normais a partir das linhas exportadas (Q3) e uma enumeração de inteiros por força bruta (Q4). Nenhuma medição de fase da portadora GNSS ou lunar é comparada com. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Informação de Fisher do datum de referencial lunar de sete parâmetros a partir de telemetria laser de estações terrestres para os cinco refletores, isoladamente e com orbitador-estação de superfície ra. Referência independente (ReferenceImpl): Uma diferença finita numpy independente do modelo direto (F2). Nada é comparado com soluções reais do referencial lunar. O fator está condicionado à órbita conhecida assumida e ao sigma de distância de { "1" } m. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Precisão de Cramer-Rao dos desvios de translação, escala e rotação entre técnicas, entre referenciais GNSS, VLBI e de telemetria laser, quando uma única nave transporta todos. Referência independente (ReferenceImpl): Um sistema empilhado numpy independente com as incógnitas de posição eliminadas por complementos de Schur explícitos (T3). Nenhum dado de GRASP, Genesis ou de outra missão é comparado com. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED — um modelo restrito de três corpos (Terra e Lua como massas pontuais, sem Sol, sem harmónicos do campo gravítico lunar) com simplificações indicadas e entradas ILLUSTRATIVE etiquetadas com as suas fontes públicas. A numérica é verificada face a programas independentes; nada é comparado com uma medição de uma grandeza lunar, e nada aqui é uma afirmação sobre qualquer missão ou sistema. Sem afiliação nem aval de nenhuma agência. Consulti (resultado <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = Estudos MODELLED da órbita e da superfície da Lua como infraestrutura de navegação e geodésica, cinco estudos num único tipo de cenário selecionado por <c1/>: od-consistency (determinação de órbita a bordo com Earth-GNSS numa NRHO ou ELFO face à determinação de órbita radiométrica independente a partir do solo, avaliadas pelas suas próprias covariâncias sobre um Monte Carlo de semente fixa), carrier-phase (fase da portadora de dupla diferença conjunta superfície-orbitador e ambiguidades inteiras (catálogo de tipos de cenário (<c2/>))

# text
seg-4658f67623b5 = Cenário lunar-infrastructure do Kshana: space-tie. MODELLED; o projeto, as entradas e os limiares estão fixados em xval/lunar-infra/PREREGISTRATION.md (registado antes de qualquer execução). As entradas ILLUSTRATIVE estão aí etiquetadas com as suas fontes públicas. (comentário do ficheiro de cenário, linhas { "1" } a { "3" })

# text
seg-f7257c25f137 = A determinação de órbita lunar: Earth-GNSS face a radiométrica a partir do solo é MODELLED, não validada: verificada face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = A resolução de ambiguidades da fase da portadora lunar: superfície e orbitador é MODELLED, não validada: verificada face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = A coestimação do referencial lunar: estações de superfície e orbitadores é MODELLED, não validada: verificada face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = A precisão da ligação de referenciais space-tie: GNSS, VLBI e telemetria laser no mesmo local é MODELLED, não validada: verificada face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Página do tema: <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Anterior</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Seguinte</s1>lunar-integrity
