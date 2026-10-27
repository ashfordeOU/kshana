# docs--optical-atmosphere: translations (pt-PT)

# text
seg-6cb7a787ac67 = Referências

# text
seg-1c6199627b90 = Dados

# text
seg-ad856ad710eb = Estado

# text
seg-53a7343c076e = Afirmação

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Fonte: <c1/>

# text
seg-333a1114746a = PNT ótico através da atmosfera

# text
# c1: optical-atmosphere
seg-47118f54f060 = O tipo de cenário <c1/> responde à questão de com que frequência funciona uma ligação ótica ao solo, porque falha, que margem ou técnica ajudaria, e o que faz um relógio enquanto a ligação está em baixo.

# text
seg-06db0ea8f428 = O Kshana é apenas o lado da análise. Não executa uma experiência com uma estação ótica terrestre e não nomeia nenhum parceiro de medição. O tipo é <b>MODELLED</b>: a sua numérica é verificada face a um programa independente, mas nenhum registo medido de disponibilidade foi comparado, e todas as entradas de meteorologia, de técnica e de relógio são pressupostos. É uma análise de caráter consultivo, não um produto certificado de disponibilidade, de integridade ou de navegação.

# text
seg-83c16fd89005 = Ambos os cenários incluídos têm climas de nuvens ILLUSTRATIVE. São entradas, não medições e não valores de nenhum conjunto de dados.

# attr:alt
seg-e9dbbd9cfa32 = Uma realização com semente da margem da ligação do local 'northern' ao longo de { "336" } h, a partir de uma execução real do motor v{ $version } em scenarios/optical-atmosphere-network.toml (semente { "37" }, um passo de { "600" } s). A margem desce abaixo de zero durante os episódios de nuvens; nesta amostra a ligação está ativa { "40.5" } % do tempo, com { "27" } interrupções e uma interrupção mais longa de { "30.7" } h. As entradas são ilustrativas, a série é uma amostra do modelo e não o clima, e difere da disponibilidade estatística ({ "37.8" } %) pelo erro de amostragem da amostra. Apenas análise de caráter consultivo: não é um produto certificado de disponibilidade, de integridade ou de navegação, nem uma previsão para qualquer local real, a menos que as suas entradas de clima provenham de um conjunto de dados indicado.

# text
seg-13a52dfbd8d1 = O que é calculado

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Perda em céu limpo</b> ao comprimento de onda e à elevação: extinção por aerossóis a partir da lei de visibilidade de Kim, McArthur e Korevaar, exponencial na altura, mais dispersão de Rayleigh e uma entrada indicada de absorção por gases. Isto substitui o único <c1/> global de <c2/> quando é fornecida uma atmosfera. Sem ela, o balanço da ligação é idêntico bit a bit a { "0.36" } (limiar A5 pré-registado).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulência.</b> Um perfil de <c1/> de Hufnagel–Valley (HV 5/7 por predefinição) integrado ao longo do trajeto oblíquo dá a variância de Rytov para onda plana ou esférica, em ligação ascendente ou descendente. Dela resultam o índice de cintilação de Andrews–Phillips, os parâmetros gama-gama, o fator de média de abertura em turbulência fraca (Churnside) e a probabilidade de desvanecimento gama-gama e a margem de desvanecimento. A média de abertura é aplicada por correspondência de momentos: o índice de cintilação é escalado pelo fator de média e ambas as variâncias logarítmicas são reescaladas para o dar exatamente.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Nuvens.</b> O clima de nuvens de um local tem a forma da ITU-R P.840: uma probabilidade de nuvem e, dada nuvem, uma coluna de água líquida log-normal. A P.840 fornece a quantidade de nuvem. A atenuação é a profundidade ótica da ótica geométrica <c1/>, porque a lei de atenuação da própria P.840 é uma lei de micro-ondas e não se aplica a { "0.85" } a { "1.55" } µm, onde as gotículas são muito maiores do que o comprimento de onda.

# text
# c1: null
seg-18311430b2a3 = <b>Disponibilidade</b> de um local: a ligação está ativa enquanto os desvanecimentos de nuvens e de turbulência em conjunto permanecem dentro da margem que sobra após a perda em céu limpo. As nuvens e a turbulência são tomadas como independentes. O relatório indica a disponibilidade, a disponibilidade em céu limpo, o <b>teto</b> que nenhuma margem consegue elevar (uma ligação ótica não atravessa nuvens espessas) e a margem adicional necessária para cada disponibilidade-alvo, ou <c1/> se o alvo estiver acima do teto.

# text
seg-885e06050a9a = <b>Interrupções.</b> As durações são log-normais com uma média e uma dispersão indicadas. O relatório indica as interrupções por ano, a duração na mediana, no percentil 90 e no percentil 99, e a probabilidade e a proporção do tempo de interrupção para além de { "1" }, { "6" }, { "24" } e { "72" } horas.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Diversidade de locais.</b> Os melhores <c1/> locais combinados com meteorologia independente (<c2/>) e com meteorologia correlacionada com a distância: correlação entre pares <c3/>, combinada numa cópula gaussiana de um fator. Em <c4/> é a união independente, e com correlação total é o melhor local individual.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Técnicas.</b> Cada <c1/> é um cenário hipotético: um novo comprimento de onda (o balanço em céu limpo, a perda em céu limpo e a média de abertura são reavaliados), uma nova abertura de receção, uma redução fracionária indicada da cintilação (ótica adaptativa) e margem adicional. O resultado é o ganho de disponibilidade face à linha de base no mesmo local. O Kshana não modela uma malha de ótica adaptativa, pelo que os ganhos são entradas.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Temporização e medição de distâncias durante uma interrupção.</b> A duração de cada interrupção é mapeada através da variância de deriva em forma fechada do modelo de holdover do relógio, para os relógios listados em <c1/>. O relatório indica o erro de temporização e de medição de distâncias a durações de interrupção indicadas, o holdover até ao limiar de temporização, a proporção de interrupções dentro dele e a disponibilidade de temporização <c2/>. Os pisos de lei de potência da classe são os sintetizados pelo módulo de holdover, pelo que um limiar apertado é governado por esse piso assumido, como <c3/> indica.

# text
seg-59774a9e8685 = Margem da ligação ao longo do tempo ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Uma tabela <c1/> (<c2/> até { "8760" }, <c3/>, <c4/>) acrescenta a cada local uma <b>realização com semente</b> do modelo acima: a linha de visão alterna entre períodos limpos (exponenciais, com média definida de modo que a proporção do tempo com nuvens seja o <c5/> indicado) e interrupções por nuvens (log-normais, com a média e a dispersão indicadas); cada interrupção extrai uma coluna de água líquida do clima indicado e mantém-na; cada passo extrai uma amostra de cintilação gama-gama (independente de passo para passo, uma simplificação indicada) e o terminal está apontado ao alvo com a disponibilidade de apontamento indicada. A margem do passo é o orçamento de desvanecimento menos os desvanecimentos de nuvens e de cintilação, e a ligação está ativa quando a margem não é negativa e o terminal está apontado ao alvo, a condição que o integral de disponibilidade utiliza.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = É uma amostra, não o clima: a sua disponibilidade difere da estatística pelo erro de amostragem da amostra, e o primeiro episódio é extraído por inteiro. O resultado inclui <c1/>, <c2/>, <c3/> e <c4/> por passo e um bloco <c5/> (disponibilidade, fração de nuvens, número de interrupções, interrupção mais longa). <b>MODELLED</b>; as verificações (<c6/>, limiares fixados em <c7/> antes da primeira execução) são o determinismo e a consistência com os valores indicados, não uma referência independente externa. Sem a tabela nada é escrito e o resultado é o documento { "0.37" }.

# text
seg-4a9b065bdb28 = Campos do cenário

# text
# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Todos os campos de nível superior são opcionais. Um <c1/> simples executa três locais ilustrativos. Consulte os dois ficheiros incluídos para todas as chaves: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Estado da verificação

# text
seg-6598ced4218b = A variância de Rytov, o índice de cintilação, a probabilidade de desvanecimento gama-gama, o fator de média de abertura, e a profundidade ótica das nuvens e do ar limpo são calculados como as fórmulas indicadas determinam

# text
seg-2442f7529fbb = Linha MODELLED; numérica verificada face a um programa mpmath independente

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = limiares A1 a A3, todos atingidos (<c1/>)

# text
seg-b91d83aea0e8 = Balanço da ligação e disponibilidade existente inalterados sem atmosfera

# text
seg-2192262e26c1 = atingido

# text
seg-a71527a271df = limiar A5, idêntico bit a bit em { "1,000" } conjuntos de parâmetros

# text
seg-0db8cf4c2ee0 = Limites de diversidade e monotonia; acoplamento de holdover exato ao bit

# text
seg-2a5c5967540c = atingido (identidades)

# text
seg-4b0e5e3ac558 = limiares A4, A6

# text
seg-f842c688e29a = Disponibilidade de um local real, cintilação real, estatísticas reais de nuvens

# text
seg-9a0ead7b1670 = não afirmado

# text
seg-9cc220190772 = nenhuma referência independente externa foi comparada

# text
seg-7c5050135e2b = A referência independente verifica a implementação das fórmulas indicadas, não a atmosfera, pelo que nenhuma linha é VALIDATED. Os valores de validação da ITU-R não são utilizados e são mantidos fora do repositório.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Não está incluído nenhum conjunto de dados meteorológicos. As entradas de clima de nuvens para um local real viriam de um conjunto de dados público (Copernicus ERA5, NASA MODIS ou ISCCP); a licença de cada conjunto de dados tem de ser lida e registada antes da utilização, e os dados em bruto obtidos no momento do teste com um SHA-256 fixado. A única climatologia já presente no repositório é a tabela de noites limpas de Cavazzani et al. utilizada por <c1/>.

# text
seg-44d197f3209c = Andrews e Phillips, <em>Laser Beam Propagation through Random Media</em>, 2.ª ed. (variância de Rytov, índice de cintilação, parâmetros gama-gama).

# text
seg-9e9a33d44013 = Kim, McArthur e Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (lei de visibilidade).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (fator de média de abertura).

# text
seg-309c70f2f4f8 = ITU-R P.840 (estatísticas de água líquida das nuvens), P.1814 e P.1817 (métodos de ótica em espaço livre).

# text
seg-83b30e1ca261 = <s1>Anterior</s1>Pacotes de evidências

# text
seg-1474b58fb35a = <s1>Seguinte</s1>Temporização de slots
