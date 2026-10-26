# docs--kind-leo-pvt: translations (pt-PT)

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = sem valor

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-093aac4b5ff1 = Posicionamento, navegação e temporização (PNT) fundidos de órbita terrestre média (MEO) e órbita terrestre baixa (LEO) sobre QUALQUER constelação: cada [[system]] é uma predefinição GNSS do tipo de cenário constellation-design, uma predefinição LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, o modelo de efemérides atomic-zero-clock, ou outro ficheiro de predefinição, cada um no seu próprio ficheiro com as fontes assinaladas como PUBLIC, WORKSHOP ou DERIVED), camadas Walker ou conjuntos de elementos explícitos, com uma portadora, uma taxa de chips, uma envolvente da densidade de ruído da portadora (C/N0) desde a máscara de elevação até ao zénite, um erro de distância do sinal no espaço (SISRE), um sigma de Doppler e um modelo de relógio (o seu próprio relógio do recetor, pelo que o desvio entre sistemas é estimado, ou um desvio de difusão conhecido). Quatro modos. DOPPLER: posicionamento em lote por Gauss-Newton a partir da taxa de variação da distância, com derivadas parciais analíticas, estados de deriva do relógio e de velocidade opcionais e uma restrição de altura opcional, com um ou vários satélites, o erro em função da duração da janela, a envolvente do Doppler, da taxa de Doppler e do jerk de cada sistema LEO, e a exatidão ao longo da trajetória e transversal numa única passagem em função do desvio transversal (o erro transversal cresce sem limite à medida que a passagem se torna zenital; uma única passagem tem também uma solução espelhada através do traço no solo). Aqui executa-se um sinal de oportunidade só com Doppler (starlink-sop). JOINT: soluções de pseudodistância por mínimos quadrados ponderados em cada época, só com GNSS, só com LEO e com ambos, sigmas por medição a partir de um modelo de ruído térmico do laço de bloqueio de atraso em C/N0 mais o SISRE (ou um sigma fixo, de modo que um modelo de sinal os possa alimentar), os desvios entre sistemas estimados e PDOP/HDOP/VDOP em função do número de satélites LEO acrescentados. POLAR: satélites à vista e DOP em função da latitude para GNSS, LEO e ambos. TIMING: transferência de tempo para o Tempo Universal Coordenado (UTC) a partir de satélites LEO numa posição conhecida, com um filtro de relógio de dois estados cujo ruído de processo provém das classes de osciladores do motor, em função do C/N0 e do oscilador, e a expressão do IS-GPS-200 do tempo do sistema para o UTC; com [timing] trace = true cada linha indica também o seu erro de tempo e o sigma previsto em cada época. VALIDATED: o maior Doppler de uma passagem do zénite ao horizonte face aos valores publicados do Iridium (até { "36" } kHz) e do Xona Pulsar X1 ({ "32" } a { "34" } kHz). MODELLED: tudo o resto; o DOP é verificado face a um caso derivado à mão, as soluções de posição face à sua covariância e o modelo de Doppler face à identidade da aceleração da distância.

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Uma execução de <c1/> resume-se assim: LEO PVT (joint) em { "61.10" }, { "6.60" } ao longo de { "1800" } s GPS gnss { "24" } satélites a { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } satélites a { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } satélites a { "1080" } km, { "1190.52" } MHz satélite de medição de distâncias LEO à vista em { "100.0" }% das épocas só GNSS disponibilidade de { "1.000" }, PDOP mediano de { "1.48" }, erro 3D RMS de { "1.29" } m só LEO disponibilidade de { "1.000" }, PDOP mediano de { "2.33" }, erro 3D RMS de { "0.69" } m fundido disponibilidade de { "1.000" }, PDOP mediano de { "1.14" }, erro 3D RMS de { "0.63" } m

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
seg-99a3c57c7926 = { "7" } cenários incluídos utilizam este tipo de cenário; os restantes estão em <a1><c1/></a1>.

# text
seg-b43a7ee40372 = Etiqueta do resultado (a do motor): posicionamento MODELLED conjunto por pseudodistância de mínimos quadrados ponderados, com um relógio por sistema ou um desvio conhecido; ruído a partir do modelo do laço de bloqueio de atraso na envolvente do C/N0 mais o erro de distância do sinal no espaço

# attr:alt
seg-90361a6f4e3c = O gráfico que o motor escreve para scenarios/leo-pvt-fjord-skyline.toml, tipo de cenário leo-pvt

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Taxa de variação da distância exata de um satélite cuja posição e velocidade fixas à Terra provêm de uma órbita de dois corpos com a deriva secular J2 e a rotação da Terra (leo_fusion::geom::EarthOrbit::state, sendo a velocidade a derivada temporal exata da posição), Ensaios: <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Posicionamento em lote por Gauss-Newton a partir da taxa de variação da distância, com derivadas parciais analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), uma velocidade constante do utilizador como opção, uma pseudomedição de altura para um utilizador à superfície, s amortecido Ensaios: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer combinação de sistemas, um relógio do recetor por sistema (o desvio entre sistemas estimado com a posição) ou um desvio de difusão conhecido na escala de tempo de referência; sigmas por medição fornecidos por Ensaios: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Medições de relógio de cada satélite LEO à vista numa posição conhecida, combinadas por variância inversa a partir do modelo de ruído da pseudodistância, filtradas por um filtro de Kalman de dois estados (fase, frequência) cujo ruído de processo é o da classe do oscilador w Ensaios: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Soluções de Gauss-Newton por mínimos quadrados ponderados sobre qualquer combinação de sistemas, um relógio do recetor por sistema (o desvio entre sistemas estimado com a posição) ou um . Referência independente (InternalConsistency): Um DOP de quatro satélites derivado à mão (um satélite no zénite e três no horizonte, afastados { "120" } graus, cuja matriz normal se inverte à mão), a identidade estrutural de que um sistema com o seu próprio relógio e um satélite não acrescenta geometria, a recuperação sem ruído da posição, do relógio e do desvio, e erros de semente fixa face à covariância. Apenas verificações internas; não comparado com a saída de um recetor. { "0.30" } comparação externa, uma constatação

# text
seg-4056b0470099 = <b>MODELLED</b> Entradas agnósticas quanto ao sistema: cada sistema é composto por camadas Walker, elementos explícitos ou uma predefinição GNSS, um sinal (portadora, taxa de chips, largura de banda, potência recebida ou intervalo de C/N0. Referência independente (InternalConsistency): Transcrição dos valores públicos citados, verificada quanto à estrutura (cada fonte pública tem um URL, os padrões Walker dividem-se por igual, o C/N0 a partir da potência recebida sobre kT a { "290" } K), não face a uma referência independente. Os valores representativos são indicados em cada predefinição e são ilustrativos

# text
# c1: label
seg-df745ccdaceb = Posicionamento MODELLED conjunto por pseudodistância de mínimos quadrados ponderados, com um relógio por sistema ou um desvio conhecido; ruído a partir do modelo do laço de bloqueio de atraso na envolvente do C/N0 mais o erro de distância do sinal no espaço (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED: tudo o resto; o DOP é verificado face a um caso derivado à mão, as soluções de posição face à sua covariância e o modelo de Doppler face à identidade da aceleração da distância. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = A predefinição de skyline é REPRESENTATIVE (proveniência em docs/SKYLINE.md e <c1/>): a ordem de grandeza da largura e do relevo dos fiordes profundos do oeste da Noruega, não um levantamento de nenhum fiorde. Apenas linha de vista: sem difração, reflexão nem receção sem linha de vista. Remova a secção [skyline] para comparar com céu aberto. MODELLED. (comentário do ficheiro de cenário, linhas { "15" } a { "18" })

# text
seg-1d0ab26930e1 = O posicionamento conjunto por pseudodistância GNSS e LEO, com desvios entre sistemas e modelos de erro por sinal, é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Sistemas LEO PNT designados, como predefinições de dados opcionais, cada um com a sua fonte, é MODELLED, não validado: verificado face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Anterior</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Seguinte</s1>leo-signal
