# docs--kind-leo-pvt: translations (pt-BR)

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = sem valor

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-be21370c2446 = joint

# text
# c1: docs/kinds/by-kind/leo-pvt.md
seg-dfe64e82e4e9 = Fonte: <c1/>

# text
# c1: leo-pvt
seg-fdba999dab11 = <c1/> (tipo de cenário)

# text
seg-093aac4b5ff1 = Posicionamento, navegação e temporização (PNT) fundidos em órbita terrestre média (MEO) e baixa (LEO) sobre QUALQUER constelação: cada [[system]] é uma predefinição de GNSS do tipo de cenário constellation-design, uma predefinição LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, o modelo de efemérides atomic-zero-clock, ou outro arquivo de predefinição, cada um em seu próprio arquivo com as fontes marcadas PUBLIC, WORKSHOP ou DERIVED), camadas Walker ou conjuntos explícitos de elementos, com uma portadora, uma taxa de chips, um envelope de densidade de portadora sobre ruído (C/N0) da máscara de elevação até o zênite, um erro de distância do sinal no espaço (SISRE), um sigma de Doppler e um modelo de relógio (o seu próprio relógio de receptor, de modo que o viés entre sistemas é estimado, ou um deslocamento de transmissão conhecido). Quatro modos. DOPPLER: posicionamento em lote de Gauss-Newton a partir da taxa de variação da distância com derivadas parciais analíticas, estados de deriva do relógio e, opcionalmente, de velocidade e uma restrição opcional de altura, com um ou vários satélites, o erro em função da duração da janela, o envelope de Doppler, de taxa de Doppler e de jerk de cada sistema LEO, e a exatidão ao longo da trilha e transversal de uma única passagem em função do afastamento transversal (o erro transversal cresce sem limite à medida que a passagem fica sobre o usuário; uma única passagem também tem uma solução espelhada do outro lado do traço no solo). Um sinal de oportunidade apenas de Doppler (starlink-sop) roda aqui. CONJUNTO: soluções de pseudodistância por mínimos quadrados ponderados a cada época apenas com GNSS, apenas com LEO e com ambos, sigmas por medição de um modelo de ruído térmico de malha de captura de atraso em C/N0 mais o SISRE (ou um sigma fixo, para que um modelo de sinal possa alimentá-los), os vieses entre sistemas estimados, e PDOP/HDOP/VDOP em função do número de satélites LEO acrescentados. POLAR: satélites à vista e DOP em função da latitude para GNSS, LEO e ambos. TEMPORIZAÇÃO: transferência de tempo para o Tempo Universal Coordenado (UTC) a partir de satélites LEO em posição conhecida com um filtro de relógio de dois estados cujo ruído de processo vem das classes de osciladores do motor, em função do C/N0 e do oscilador, e a expressão do IS-GPS-200 de tempo do sistema para UTC; com [timing] trace = true cada linha também informa o seu erro de tempo e o sigma previsto a cada época. VALIDATED: o maior Doppler de uma passagem do zênite ao horizonte contra os valores publicados do Iridium (até { "36" } kHz) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz). MODELLED: todo o resto; o DOP é conferido contra um caso derivado à mão, as soluções contra a sua covariância e o modelo de Doppler contra a identidade da aceleração da distância.

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Uma execução de <c1/> resume-se assim: LEO PVT (conjunto) em { "61.10" }, { "6.60" } ao longo de { "1800" } s GPS gnss { "24" } sats a { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats a { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats a { "1080" } km, { "1190.52" } MHz satélite de medição de distância LEO à vista em { "100.0" }% das épocas apenas GNSS disponibilidade { "1.000" }, PDOP mediano { "1.48" }, erro 3D RMS { "1.29" } m apenas LEO disponibilidade { "1.000" }, PDOP mediano { "2.33" }, erro 3D RMS { "0.69" } m fundido disponibilidade { "1.000" }, PDOP mediano { "1.14" }, erro 3D RMS { "0.63" } m

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-e271a69236bf = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f850cba7d96e = O exemplo <c1/> define, entre outros:

# text
seg-bb3b3e8be839 = fjord

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-b43a7ee40372 = Rótulo do resultado (o do motor): posicionamento conjunto por pseudodistância de mínimos quadrados ponderados MODELLED com um relógio por sistema ou um deslocamento conhecido; ruído do modelo de malha de captura de atraso no envelope de C/N0 mais o erro de distância do sinal no espaço

# attr:alt
seg-90361a6f4e3c = O gráfico que o motor gera para scenarios/leo-pvt-fjord-skyline.toml, tipo de cenário leo-pvt

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Taxa de variação da distância exata de um satélite cuja posição e velocidade fixas à Terra vêm de uma órbita de dois corpos com a deriva secular de J2 e a rotação da Terra (leo_fusion::geom::EarthOrbit::state, velocidade a derivada temporal exata da posição), Testes: <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Posicionamento em lote de Gauss-Newton a partir da taxa de variação da distância com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade constante do usuário como opção, uma pseudomedição de altura para um usuário na superfície, s amortecido Testes: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de receptor por sistema (o viés entre sistemas estimado junto com a posição) ou um deslocamento de transmissão conhecido na escala de tempo de referência; sigmas por medição fornecidos por Testes: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Medições de relógio de todo satélite LEO à vista em posição conhecida, combinadas por variância inversa a partir do modelo de ruído de pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o da classe de oscilador w Testes: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer mistura de sistemas, um relógio de receptor por sistema (o viés entre sistemas estimado junto com a posição) ou um conhecido. Referência independente (InternalConsistency): Um DOP de quatro satélites derivado à mão (um satélite no zênite e três no horizonte separados por { "120" } graus, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com o seu próprio relógio e um satélite não acrescenta geometria, recuperação sem ruído de posição, relógio e viés, e erros com semente contra a covariância. Apenas verificações internas; não comparado com a saída de um receptor. { "0.30" } comparação externa, um achado

# text
seg-4056b0470099 = <b>MODELLED</b> Entradas agnósticas de sistema: todo sistema é camadas Walker, elementos explícitos ou uma predefinição de GNSS, um sinal (portadora, taxa de chips, largura de banda, potência recebida ou faixa de C/N0. Referência independente (InternalConsistency): Transcrição dos valores públicos citados, conferida quanto à estrutura (toda fonte pública tem um URL, os padrões Walker dividem-se em partes iguais, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não contra uma referência independente externa. Valores representativos são nomeados em cada predefinição e são ilustrativos

# text
# c1: label
seg-df745ccdaceb = Posicionamento conjunto por pseudodistância em mínimos quadrados ponderados, MODELLED, com um relógio por sistema ou um deslocamento conhecido; ruído do modelo da malha de captura de atraso (DLL) no envelope de C/N0 mais o erro de distância do sinal no espaço (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED: todo o resto; o DOP é verificado contra um caso deduzido à mão, as soluções de posição contra a sua covariância e o modelo Doppler contra a identidade da aceleração em distância. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = A predefinição de skyline é REPRESENTATIVE (proveniência em docs/SKYLINE.md e <c1/>): da ordem de grandeza da largura e do relevo dos profundos fiordes do oeste da Noruega, não um levantamento de nenhum fiorde. Apenas linha de visada: sem difração, reflexão nem recepção sem linha de visada. Remova a seção [skyline] para comparar com o céu aberto. MODELLED. (comentário do arquivo de cenário, linhas { "15" } a { "18" })

# text
seg-1d0ab26930e1 = O posicionamento conjunto por pseudodistância GNSS e LEO, com vieses entre sistemas e modelos de erro por sinal, é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Sistemas LEO PNT nomeados como predefinições de dados opcionais, cada um com a sua fonte, é MODELLED, não validado: verificado contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Anterior</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Próximo</s1>leo-signal
