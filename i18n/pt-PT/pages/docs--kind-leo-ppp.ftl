# docs--kind-leo-ppp: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Fonte: <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (tipo de cenário)

# text
seg-32a570f1a4fa = Convergência do posicionamento pontual preciso (PPP) só com GNSS e com aumento por LEO: um filtro de Kalman estendido de parâmetros flutuantes sobre código e fase da portadora sem ionosfera, com as coordenadas estáticas da estação, um relógio do recetor branco, um desvio entre sistemas por cada sistema adicional, um atraso zenital húmido em passeio aleatório projetado por 1/sin(elevação) e uma ambiguidade flutuante por arco de satélite; o erro preciso de órbita e relógio é branco e comum ao código e à fase de um satélite, pelo que cada satélite é uma atualização correlacionada de duas linhas, numa forma estabilizada de Joseph. As medições são simuladas a partir do mesmo modelo com ruído de semente fixa, em vários locais e sementes, e cada caso (primeiro só GNSS, depois cada [[case]] de sistemas LEO, qualquer constelação ou predefinição) indica o tempo de convergência mediano (a primeira época a partir da qual os erros horizontal e vertical se mantêm abaixo dos limiares, { "10" } cm por predefinição), a fração convergida, as curvas de erro medianas e a consistência do filtro (o NEES da posição médio da execução face à banda do qui-quadrado bilateral de { "95" }%). Opcionalmente, a par dos valores de latitudes médias publicados por Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min para multi-GNSS, encurtados para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Uma execução de <c1/> resume-se assim: convergência PPP para { "0.10" } m na horizontal / { "0.10" } m na vertical, { "12" } execuções por caso, { "96" } satélites GNSS só GNSS { "0" } LEO mediana de { "7.4" } min convergido { "100" }% NEES médio { "3.13" } { "60" } LEO { "60" } LEO mediana de { "4.8" } min convergido { "100" }% NEES médio { "3.08" } { "96" } LEO { "96" } LEO mediana de { "3.2" } min convergido { "100" }% NEES médio { "2.74" } { "192" } LEO { "192" } LEO mediana de { "2.7" } min convergido { "100" }% NEES médio { "2.65" } { "288" } LEO { "288" } LEO mediana de { "2.3" } min convergido { "100" }% NEES médio { "3.06" } Li et al. { "2019" } (publicado, min) vs modelado: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

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
seg-2750ec8c218f = Etiqueta do resultado (a do motor): PPP de parâmetros flutuantes MODELLED (código e fase sem ionosfera, relógio branco, atraso húmido em passeio aleatório, ambiguidades flutuantes por arco) sobre medições simuladas a partir do mesmo modelo; os valores de Li et al. ({ "2019" }) são uma comparação de tendência, não uma reprodução

# attr:alt
seg-225ef04c64af = O gráfico que o motor escreve para scenarios/leo-ppp-convergence.toml, tipo de cenário leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Um filtro de Kalman estendido PPP de parâmetros flutuantes sobre código e fase sem ionosfera: coordenadas estáticas, um relógio do recetor branco, um desvio entre sistemas por cada sistema adicional, um atraso zenital húmido em passeio aleatório projetado por 1/sin(elevação), uma ambiguidade flutuante por satél Ensaios: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Um filtro de Kalman estendido PPP de parâmetros flutuantes sobre código e fase sem ionosfera: coordenadas estáticas, um relógio do recetor branco, um desvio entre sistemas por cada sistema adicional, um passeio aleat. Referência independente (ExternalDataset): O teste do qui-quadrado do NEES é uma verificação de consistência interna (a verdade e o filtro partilham o modelo). A tendência é comparada com Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min, encurtados para { "7.0" }, { "3.2" }, { "2.1" } e { "1.3" } min com { "60" }, { "96" }, { "192" } e { "288" } satélites LEO. O cenário incluído dá { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } e { "2.3" } min com i

# text
# c1: label
seg-302365809dbf = PPP de parâmetros flutuantes MODELLED (código e fase sem ionosfera, relógio branco, atraso húmido em passeio aleatório, ambiguidades flutuantes por arco) sobre medições simuladas a partir do mesmo modelo; os valores de Li et al. ({ "2019" }) são uma comparação de tendência, não uma reprodução (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED: uma comparação de consistência da tendência, não uma reprodução das constelações, do ruído ou das estações desse estudo; sem resolução de ambiguidades, saltos de ciclo, phase wind-up, marés nem erros de produtos correlacionados no tempo. (catálogo de tipos de cenário (<c1/>))

# text
seg-ba2fd25fdcff = As quatro constelações LEO aqui utilizadas são camadas Walker delta representativas a { "1000" } km e { "60" } graus, com { "60" }, { "96" }, { "192" } e { "288" } satélites; NÃO são os projetos do artigo, e o ruído, as estações e a definição de convergência (erros horizontal e vertical abaixo de { "10" } cm até ao fim da execução) são os deste modelo. A comparação é, por isso, uma verificação de consistência MODELLED da tendência: a convergência tem de encurtar monotonicamente com t (comentário do ficheiro de cenário, linhas { "10" } a { "14" })

# text
seg-b641b835570c = A convergência do posicionamento pontual preciso só com GNSS e com aumento por LEO é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe peças modeladas, pelo que a capacidade continua a ser apenas modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Anterior</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Seguinte</s1>leo-pvt
