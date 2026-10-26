# docs--optical-atmosphere: translations (pt-BR)

# text
seg-6cb7a787ac67 = Referências

# text
seg-1c6199627b90 = Dados

# text
seg-ad856ad710eb = Status

# text
seg-53a7343c076e = Afirmação

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Fonte: <c1/>

# text
seg-333a1114746a = PNT óptico através da atmosfera

# text
# c1: optical-atmosphere
seg-47118f54f060 = O tipo de cenário <c1/> responde com que frequência um enlace óptico com o solo funciona, por que ele falha, que margem ou técnica ajudaria e o que um relógio faz enquanto o enlace está fora do ar.

# text
seg-06db0ea8f428 = O Kshana é apenas o lado da análise. Ele não executa um experimento de estação óptica terrestre e não nomeia nenhum parceiro de medição. O tipo é <b>MODELLED</b>: sua numérica é verificada contra um programa independente, mas nenhum registro medido de disponibilidade foi comparado, e toda entrada de clima, técnica e relógio é uma suposição. É uma análise consultiva, não um produto certificado de disponibilidade, integridade ou navegação.

# text
seg-83c16fd89005 = Os dois cenários incluídos trazem climas de nuvens ILLUSTRATIVE. São entradas, não medições e não valores de nenhum conjunto de dados.

# attr:alt
seg-e9dbbd9cfa32 = Uma realização com semente da margem do enlace do sítio 'northern' ao longo de { "336" } h, a partir de uma execução real do motor v{ $version } em scenarios/optical-atmosphere-network.toml (semente { "37" }, passo de { "600" } s). A margem cai abaixo de zero durante episódios de nuvens; neste sorteio o enlace está ativo em { "40.5" } % do tempo, com { "27" } interrupções e uma interrupção mais longa de { "30.7" } h. As entradas são ilustrativas, a série é um sorteio do modelo e não o clima, e difere da disponibilidade estatística ({ "37.8" } %) pelo erro de amostragem do sorteio. Apenas análise consultiva: não é um produto certificado de disponibilidade, integridade ou navegação, e não é uma previsão para nenhum sítio real, a menos que suas entradas de clima venham de um conjunto de dados declarado.

# text
seg-13a52dfbd8d1 = O que é calculado

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Perda em céu limpo</b> no comprimento de onda e na elevação: extinção por aerossol a partir da lei de visibilidade de Kim, McArthur e Korevaar, exponencial na altura, mais espalhamento Rayleigh e uma entrada declarada de absorção por gases. Isso substitui o <c1/> único e agrupado de <c2/> quando uma atmosfera é fornecida. Sem ela, o orçamento do enlace é idêntico bit a bit a { "0.36" } (limiar A5 pré-registrado).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulência.</b> Um perfil <c1/> de Hufnagel–Valley (HV 5/7 por padrão) integrado ao longo do trajeto oblíquo fornece a variância de Rytov para onda plana ou esférica, em enlace de subida ou de descida. Dela decorrem o índice de cintilação de Andrews–Phillips, os parâmetros gama-gama, o fator de média de abertura em turbulência fraca (Churnside) e a probabilidade de desvanecimento e a margem de desvanecimento gama-gama. A média de abertura é aplicada por casamento de momentos: o índice de cintilação é escalado pelo fator de média e ambas as variâncias logarítmicas são reescaladas para reproduzi-lo exatamente.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Nuvens.</b> O clima de nuvens de um sítio tem a forma da ITU-R P.840: uma probabilidade de nuvem e, havendo nuvem, uma coluna de água líquida log-normal. A P.840 fornece a quantidade de nuvem. A atenuação é a profundidade óptica de óptica geométrica <c1/>, porque a lei de atenuação própria da P.840 é uma lei de micro-ondas e não se aplica a { "0.85" } a { "1.55" } µm, onde as gotículas são muito maiores que o comprimento de onda.

# text
# c1: null
seg-18311430b2a3 = <b>Disponibilidade</b> de um sítio: o enlace está ativo enquanto os desvanecimentos de nuvem e de turbulência, somados, permanecem dentro da margem que sobra após a perda em céu limpo. Nuvem e turbulência são tomadas como independentes. O relatório informa a disponibilidade, a disponibilidade em céu limpo, o <b>teto</b> que nenhuma margem pode elevar (um enlace óptico não atravessa nuvem espessa) e a margem extra necessária para cada disponibilidade-alvo, ou <c1/> se o alvo estiver acima do teto.

# text
seg-885e06050a9a = <b>Interrupções.</b> As durações são log-normais, com média e dispersão declaradas. O relatório informa as interrupções por ano, a duração na mediana, no percentil 90 e no percentil 99, e a probabilidade e a parcela do tempo de interrupção além de { "1" }, { "6" }, { "24" } e { "72" } horas.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Diversidade de sítios.</b> Os melhores <c1/> sítios combinados com clima independente (<c2/>) e com clima correlacionado pela distância: correlação de pares <c3/>, combinada em uma cópula gaussiana de um fator. Em <c4/> é a união independente e, com correlação total, o melhor sítio isolado.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Técnicas.</b> Cada <c1/> é um e-se: um novo comprimento de onda (o orçamento de céu limpo, a perda em céu limpo e a média de abertura são reavaliados), uma nova abertura de recepção, uma redução fracionária declarada da cintilação (óptica adaptativa) e margem extra. O resultado é o ganho de disponibilidade sobre a linha de base no mesmo sítio. O Kshana não modela um laço de óptica adaptativa, de modo que os ganhos são entradas.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Temporização e medição de distância durante uma interrupção.</b> Cada duração de interrupção é mapeada pela variância de deriva em forma fechada do modelo de holdover do relógio, para os relógios listados em <c1/>. O relatório informa o erro de temporização e de medição de distância em durações de interrupção declaradas, o holdover até o limiar de temporização, a parcela de interrupções dentro dele e a disponibilidade de temporização <c2/>. Os pisos de lei de potência da classe são os sintetizados pelo módulo de holdover, de modo que um limiar estreito é governado por esse piso presumido, como <c3/> declara.

# text
seg-59774a9e8685 = Margem do enlace ao longo do tempo ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Uma tabela <c1/> (<c2/> até { "8760" }, <c3/>, <c4/>) acrescenta a cada sítio uma <b>realização com semente</b> do modelo acima: a linha de visada alterna entre períodos de céu limpo (exponenciais, com média ajustada para que a parcela do tempo com nuvem seja a <c5/> declarada) e interrupções por nuvem (log-normais, com a média e a dispersão declaradas); cada interrupção sorteia uma coluna de água líquida do clima declarado e a mantém; cada passo sorteia uma amostra de cintilação gama-gama (independente de passo para passo, uma simplificação declarada) e o terminal está apontado ao alvo com a disponibilidade de apontamento declarada. A margem do passo é o orçamento de desvanecimento menos os desvanecimentos de nuvem e de cintilação, e o enlace está ativo quando a margem não é negativa e o terminal está apontado ao alvo, a condição que a integral de disponibilidade usa.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = É um sorteio, não o clima: sua disponibilidade difere da estatística pelo erro de amostragem do sorteio, e o primeiro episódio é sorteado inteiro. O resultado traz <c1/>, <c2/>, <c3/> e <c4/> por passo e um bloco <c5/> (disponibilidade, fração de nuvem, contagem de interrupções, interrupção mais longa). <b>MODELLED</b>; as verificações (<c6/>, limiares fixados em <c7/> antes da primeira execução) são determinismo e consistência com as cifras declaradas, não uma referência independente externa. Sem a tabela nada é gravado e o resultado é o documento { "0.37" }.

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
seg-4ba70196355d = Todos os campos de nível superior são opcionais. Um <c1/> simples executa três sítios ilustrativos. Veja os dois arquivos incluídos para todas as chaves: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Estado da verificação

# text
seg-6598ced4218b = Variância de Rytov, índice de cintilação, probabilidade de desvanecimento gama-gama, fator de média de abertura, profundidade óptica de nuvem e de céu limpo são calculados como as fórmulas declaradas dizem

# text
seg-2442f7529fbb = Linha MODELLED; numérica verificada contra um programa independente em mpmath

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = limiares A1 a A3, todos atingidos (<c1/>)

# text
seg-b91d83aea0e8 = Orçamento do enlace e disponibilidade existente inalterados sem atmosfera

# text
seg-2192262e26c1 = atingido

# text
seg-a71527a271df = limiar A5, idêntico bit a bit em { "1,000" } conjuntos de parâmetros

# text
seg-0db8cf4c2ee0 = Limites de diversidade e monotonicidade; acoplamento de holdover exato bit a bit

# text
seg-2a5c5967540c = atingido (identidades)

# text
seg-4b0e5e3ac558 = limiares A4, A6

# text
seg-f842c688e29a = Disponibilidade de um sítio real, cintilação real, estatísticas de nuvem reais

# text
seg-9a0ead7b1670 = não afirmado

# text
seg-9cc220190772 = nenhuma referência independente externa foi comparada

# text
seg-7c5050135e2b = A referência independente verifica a implementação das fórmulas declaradas, não a atmosfera, de modo que nenhuma linha é VALIDATED. Valores de validação da ITU-R não são usados e são mantidos fora do repositório.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Nenhum conjunto de dados meteorológicos está incluído. As entradas de clima de nuvens para um sítio real viriam de um conjunto de dados público (Copernicus ERA5, NASA MODIS ou ISCCP); a licença de cada conjunto de dados precisa ser lida e registrada antes do uso, e os dados brutos obtidos no momento do teste com um SHA-256 fixado. A única climatologia já presente no repositório é a tabela de noites claras de Cavazzani et al. usada por <c1/>.

# text
seg-44d197f3209c = Andrews e Phillips, <em>Laser Beam Propagation through Random Media</em>, 2ª ed. (variância de Rytov, índice de cintilação, parâmetros gama-gama).

# text
seg-9e9a33d44013 = Kim, McArthur e Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (lei de visibilidade).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (fator de média de abertura).

# text
seg-309c70f2f4f8 = ITU-R P.840 (estatísticas de água líquida em nuvens), P.1814 e P.1817 (métodos de óptica em espaço livre).

# text
seg-83b30e1ca261 = <s1>Anterior</s1>Pacotes de evidências

# text
seg-1474b58fb35a = <s1>Próximo</s1>Temporização de slot
