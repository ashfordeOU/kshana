# docs--kind-leo-ppp: translations (pt-BR)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Fonte: <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (tipo de cenário)

# text
seg-32a570f1a4fa = Convergência do posicionamento preciso por ponto (PPP) apenas com GNSS e com aumentação por LEO: um filtro de Kalman estendido flutuante sobre código e fase da portadora livres de ionosfera, com as coordenadas estáticas da estação, um relógio de receptor branco, um viés entre sistemas por sistema adicional, um atraso úmido zenital em passeio aleatório mapeado por 1/sin(elevação) e uma ambiguidade flutuante por arco de satélite; o erro de órbita e relógio preciso é branco e comum ao código e à fase de um satélite, de modo que cada satélite é uma atualização correlacionada de duas linhas em uma forma estabilizada de Joseph. As medições são simuladas a partir do mesmo modelo com ruído com semente em vários locais e sementes, e cada caso (primeiro apenas GNSS, depois cada [[case]] de sistemas LEO, de qualquer constelação ou predefinição) informa o tempo mediano de convergência (a primeira época depois da qual os erros horizontal e vertical permanecem abaixo dos limiares, { "10" } cm por padrão), a fração convergida, as curvas medianas de erro e a consistência do filtro (o NEES de posição médio da execução contra a faixa de qui-quadrado bilateral de { "95" }%). Opcionalmente ao lado dos valores publicados de Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) em latitudes médias: { "9.6" } min para multi-GNSS reduzidos a { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Uma execução de <c1/> resume-se assim: convergência do PPP para { "0.10" } m na horizontal / { "0.10" } m na vertical, { "12" } execuções por caso, { "96" } satélites GNSS apenas GNSS { "0" } LEO mediana { "7.4" } min convergidas { "100" }% NEES médio { "3.13" } { "60" } LEO { "60" } LEO mediana { "4.8" } min convergidas { "100" }% NEES médio { "3.08" } { "96" } LEO { "96" } LEO mediana { "3.2" } min convergidas { "100" }% NEES médio { "2.74" } { "192" } LEO { "192" } LEO mediana { "2.7" } min convergidas { "100" }% NEES médio { "2.65" } { "288" } LEO { "288" } LEO mediana { "2.3" } min convergidas { "100" }% NEES médio { "3.06" } Li et al. { "2019" } (publicado, min) contra modelado: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-aee2e93b2c20 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-3589a089c89d = O exemplo <c1/> define, entre outros:

# text
seg-4dbe1423bb57 = { "60" } LEO

# text
seg-85b65d194f0d = { "96" } LEO

# text
seg-2750ec8c218f = Rótulo do resultado (o do motor): PPP flutuante MODELLED (código e fase livres de ionosfera, relógio branco, atraso úmido em passeio aleatório, ambiguidades flutuantes por arco) sobre medições simuladas a partir do mesmo modelo; os valores de Li et al. ({ "2019" }) são uma comparação de tendência, não uma reprodução

# attr:alt
seg-225ef04c64af = O gráfico que o motor gera para scenarios/leo-ppp-convergence.toml, tipo de cenário leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Um filtro de Kalman estendido de PPP flutuante sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de receptor branco, um viés entre sistemas por sistema adicional, um atraso úmido zenital em passeio aleatório mapeado por 1/sin(elevação), uma ambiguidade flutuante por satél Testes: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Um filtro de Kalman estendido de PPP flutuante sobre código e fase livres de ionosfera: coordenadas estáticas, um relógio de receptor branco, um viés entre sistemas por sistema adicional, um passeio alea. Referência independente (ExternalDataset): O teste de qui-quadrado do NEES é uma verificação de consistência interna (a verdade e o filtro compartilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min reduzidos a { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário incluído dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com i

# text
# c1: label
seg-302365809dbf = PPP flutuante MODELLED (código e fase livres de ionosfera, relógio branco, atraso úmido em passeio aleatório, ambiguidades flutuantes por arco) sobre medições simuladas a partir do mesmo modelo; os valores de Li et al. ({ "2019" }) são uma comparação de tendência, não uma reprodução (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo. (catálogo de tipos de cenário (<c1/>))

# text
seg-ba2fd25fdcff = As quatro constelações LEO aqui são camadas Walker delta representativas a { "1000" } km e { "60" } graus com { "60" }, { "96" }, { "192" } e { "288" } satélites; elas NÃO são os projetos do artigo, e o ruído, as estações e a definição de convergência (erros horizontal e vertical abaixo de { "10" } cm até o fim da execução) são os deste modelo. A comparação é, portanto, uma verificação de consistência MODELLED da tendência: a convergência deve encurtar monotonicamente com t (comentário do arquivo de cenário, linhas { "10" } a { "14" })

# text
seg-b641b835570c = A convergência do posicionamento preciso por ponto apenas com GNSS e com aumentação por LEO é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Anterior</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Próximo</s1>leo-pvt
