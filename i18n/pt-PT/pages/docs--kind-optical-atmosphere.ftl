# docs--kind-optical-atmosphere: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-72ad48275ebe = Tipo de cenário do motor v{ $version }, família <a1>PNT ótico</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a97755cb13eb = Página da família: <a1>PNT ótico</a1>

# text
seg-9fd02351d844 = ms

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Fonte: <c1/>

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (tipo de cenário)

# text
seg-a878d9be65b7 = PNT ótico MODELLED através da atmosfera: para uma ligação ótica e um conjunto de locais em terra com climas de nuvens indicados, indica a perda em céu limpo dependente do comprimento de onda e da elevação (lei de visibilidade de Kim mais Rayleigh), o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, parâmetros gama-gama, média de abertura), a disponibilidade determinada pelo tempo meteorológico face à margem da ligação (profundidade ótica das nuvens a partir de um clima de água líquida log-normal, extinção de ótica geométrica, desvanecimento por turbulência independente), a margem de ligação necessária para disponibilidades-alvo, a distribuição da duração das interrupções, o crescimento do erro de temporização e de medição de distâncias por interrupção através do modelo de holdover do relógio, a disponibilidade de diversidade de locais correlacionada pela distância e os ganhos hipotéticos de técnicas de melhoramento (comprimento de onda, abertura de receção, redução da cintilação por ótica adaptativa, margem adicional). VALIDATED como implementação das fórmulas indicadas face a uma referência independente mpmath: variância de Rytov, índice de cintilação, probabilidade de desvanecimento gama-gama, fator de média de abertura, profundidade ótica das nuvens e do céu limpo. MODELLED: toda a entrada meteorológica, de técnica e de relógio e os pressupostos de independência e de cópula; não foi comparado nenhum registo de disponibilidade medida. Análise de caráter consultivo, não um produto certificado de disponibilidade nem de navegação.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Uma execução de <c1/> resume-se assim: optical-atmosphere: { "1550" } nm a { "30" } graus de elevação, margem de { "19.2" } dB antes da atmosfera; melhor local, o do sul, { "74.66" } %; rede de 3 locais { "92.72" } % com tempo independente / { "91.62" } % com tempo correlacionado (MODELLED, consultivo)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-e466ecbd4e6d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-8adae3ea6e60 = O exemplo <c1/> define, entre outros:

# text
seg-687f2930a40d = downlink

# text
seg-e794d481aed4 = plane

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Etiqueta do resultado (a do motor): MODELLED — PNT ótico através da atmosfera: extinção em céu limpo (lei de visibilidade de Kim + Rayleigh), profundidade ótica das nuvens a partir de um clima de água líquida indicado (quantidade P.840, extinção de ótica geométrica), turbulência de Hufnagel-Valley com desvanecimentos gama-gama e média de abertura, disponibilidade face à

# attr:alt
seg-4e2b759aff17 = O gráfico que o motor escreve para scenarios/optical-atmosphere-network.toml, tipo de cenário optical-atmosphere

# text
seg-a18d144f149e = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado ao longo de um trajeto oblíquo para a variância de Rytov de onda plana e esférica (ligação ascendente e descendente), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, Ensaios: <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Disponibilidade de uma ligação ótica face a uma margem de ligação indicada a partir de um clima log-normal de água líquida das nuvens (quantidade ITU-R P.840, extinção de ótica geométrica) e do desvanecimento por turbulência gama-gama independente, a margem de ligação necessária para a Ensaios: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> A distribuição da duração das interrupções de um local ótico acoplada à variância de deslize de forma fechada do modelo de holdover do relógio: erro de temporização e de medição de distâncias em quantis de interrupção indicados, o holdover até um limiar de temporização, a fração de interrupções e Ensaios: <a1>optical_atmosphere_identities.rs</a1>.

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Uma tabela <c1/> opcional (duração, passo, semente) faz com que o tipo de cenário <c2/> escreva também, por local, uma realização de semente fixa do modelo do local indicado ao longo do tempo: episódios de nuvens (períodos limpos exponenciais, interrupções por nuvens log-normais Ensaios: <a1>optical_atmosphere_timeseries.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado ao longo de um trajeto oblíquo para a variância de Rytov de onda plana e esférica (ligação ascendente e descendente), o índice de cintilação de Andrews-Phillips. Referência independente (ExternalDataset): A numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } com { "30" } dígitos, quadratura tanh-sinh sobre a variável de altura original e densidades gama-gama de Bessel-K) que não partilha código com o Kshana, sob limiares fixados antes de existir qualquer implementação (xval/optical-atmosphere/PREREGISTRATION.md). PORQUE É MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, pelo que verifica a im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Disponibilidade de uma ligação ótica face a uma margem de ligação indicada a partir de um clima log-normal de água líquida das nuvens (quantidade ITU-R P.840, extinção de ótica geométrica) e . Referência independente (InternalConsistency): Consistência interna: limites de forma fechada e monotonia do modelo de diversidade, a forma fechada do teto de nuvens e as identidades das interrupções log-normais. NENHUMA referência independente externa é alegada e nenhuma foi comparada: não se utiliza nenhum registo medido de disponibilidade de estações óticas em terra nem de linha de vista sem nuvens. PORQUE É MODELLED: o clima de nuvens (probabilidade de nuvens, mediana e dispersão da coluna de água líquida, durações das interrupções),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> A distribuição da duração das interrupções de um local ótico acoplada à variância de deslize de forma fechada do modelo de holdover do relógio: erro de temporização e de medição de distâncias em quantis de interrupção ind. Referência independente (InternalConsistency): Consistência interna com o módulo de holdover, bit a bit; NÃO se alega nenhuma referência independente externa. As PSD das classes são os patamares sintetizados de tau longo que o módulo de holdover já inclui, pelo que os valores herdam a sua ressalva indicada de que o holdover até um limiar apertado é determinado pelo patamar de ruído vermelho assumido e não pelo desvio de Allan citado. As durações das interrupções são um modelo log-normal com parâmetros indicados, não um c medido

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — PNT ótico através da atmosfera: extinção em céu limpo (lei de visibilidade de Kim + Rayleigh), profundidade ótica das nuvens a partir de um clima de água líquida indicado (quantidade P.840, extinção de ótica geométrica), turbulência de Hufnagel-Valley com desvanecimentos gama-gama e média de abertura, disponibilidade face à margem da ligação, durações de interrupção acopladas ao holdover do relógio e diversidade de locais correlacionada pela distância. A numérica é verificad (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-32c6524b0baf = PNT ótico MODELLED através da atmosfera: para uma ligação ótica e um conjunto de locais em terra com climas de nuvens indicados, indica a perda em céu limpo dependente do comprimento de onda e da elevação (lei de visibilidade de Kim mais Rayleigh), o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, parâmetros gama-gama, média de abertura), a disponibilidade determinada pelo tempo meteorológico face à margem da ligação (profundidade ótica das nuvens a partir de (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED: toda a entrada meteorológica, de técnica e de relógio e os pressupostos de independência e de cópula; não foi comparado nenhum registo de disponibilidade medida. (catálogo de tipos de cenário (<c1/>))

# text
seg-b4402211e3fe = PNT ótico através da atmosfera: três locais em terra ILLUSTRATIVE (um local do norte mais nublado, um local central intermédio e um local do sul mais limpo) a observar um terminal ótico LEO a { "30" } graus de elevação a { "1550" } nm. Os climas de nuvens são entradas indicadas, não medições nem valores de qualquer conjunto de dados, pelo que toda a disponibilidade abaixo é MODELLED. A execução indica por local a perda em céu limpo, o estado de turbulência de Hufnagel-Valley, t (comentário do ficheiro de cenário, linhas { "1" } a { "8" })

# text
seg-384f5c73cdf9 = Uma realização de semente fixa da ligação de cada local ao longo do tempo (MODELLED; uma amostra do modelo acima, não o clima). Se ausente, não é escrita nenhuma série e o resultado é o documento { "0.37" }. (comentário do ficheiro de cenário, linhas { "78" } a { "79" })

# text
seg-c75fa5787bd4 = A numérica da atmosfera ótica em trajeto oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade ótica das nuvens e do céu limpo é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade no seu conjunto compõe peças modeladas, pelo que a capacidade continua a ser apenas modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = A disponibilidade de locais óticos em terra determinada pelo tempo meteorológico e a diversidade de locais correlacionada pela distância é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Página do tema: <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Anterior</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Seguinte</s1>orbit
