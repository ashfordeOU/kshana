# docs--kind-optical-atmosphere: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-72ad48275ebe = Tipo de cenário do motor v{ $version }, família <a1>PNT óptico</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-a97755cb13eb = Página da família: <a1>PNT óptico</a1>

# text
seg-9fd02351d844 = ms

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Fonte: <c1/>

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (tipo de cenário)

# text
seg-a878d9be65b7 = PNT óptico MODELLED através da atmosfera: para um enlace óptico e um conjunto de locais em solo com climas de nuvens declarados, informa a perda em céu limpo dependente do comprimento de onda e da elevação (lei de visibilidade de Kim mais Rayleigh), o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, parâmetros gama-gama, média de abertura), a disponibilidade dirigida pelo tempo contra a margem do enlace (profundidade óptica das nuvens a partir de um clima log-normal de água líquida, extinção de óptica geométrica, desvanecimento por turbulência independente), a margem de enlace necessária para disponibilidades-alvo, a distribuição da duração de interrupções, o crescimento do erro de temporização e de medição de distância por interrupção pelo modelo de holdover do relógio, a disponibilidade com diversidade de locais correlacionada pela distância, e ganhos hipotéticos de técnicas de melhoria (comprimento de onda, abertura de recepção, redução de cintilação por óptica adaptativa, margem extra). VALIDATED como implementação das fórmulas declaradas contra uma referência independente em mpmath: variância de Rytov, índice de cintilação, probabilidade de desvanecimento gama-gama, fator de média de abertura, profundidade óptica de nuvens e de céu limpo. MODELLED: toda entrada de clima, de técnica e de relógio e as hipóteses de independência e de cópula; nenhum registro medido de disponibilidade foi comparado. Análise de caráter consultivo, não um produto certificado de disponibilidade ou de navegação.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Uma execução de <c1/> resume-se assim: optical-atmosphere: { "1550" } nm at { "30" } deg elevation, margin { "19.2" } dB before the atmosphere; best site southern { "74.66" } %; 3-site network { "92.72" } % independent / { "91.62" } % correlated weather (MODELLED, advisory)

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
seg-687f2930a40d = enlace de descida

# text
seg-e794d481aed4 = plana

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Rótulo do resultado (o do motor): MODELLED — PNT óptico através da atmosfera: extinção em céu limpo (lei de visibilidade de Kim + Rayleigh), profundidade óptica das nuvens a partir de um clima declarado de água líquida (quantidade P.840, extinção de óptica geométrica), turbulência de Hufnagel-Valley com desvanecimentos gama-gama e média de abertura, disponibilidade contra a margem do enlace, durações de interrupção acopladas ao holdover do relógio e diversidade de locais correlacionada pela distância. A numérica é verifica

# attr:alt
seg-4e2b759aff17 = O gráfico que o motor escreve para scenarios/optical-atmosphere-network.toml, tipo de cenário optical-atmosphere

# text
seg-a18d144f149e = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado ao longo de um percurso oblíquo para a variância de Rytov de onda plana e de onda esférica (enlace de subida e de descida), o índice de cintilação de Andrews-Phillips e os parâmetros gama-gama, a probabilidade de desvanecimento gama-gama e a margem de desvanecimento, Testes: <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Disponibilidade de um enlace óptico contra uma margem de enlace declarada a partir de um clima log-normal de água líquida das nuvens (quantidade ITU-R P.840, extinção de óptica geométrica) e do desvanecimento por turbulência gama-gama independente, a margem de enlace necessária para a Testes: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> A distribuição da duração de interrupções de um local óptico acoplada à variância de deriva de forma fechada do modelo de holdover do relógio: erro de temporização e de medição de distância em quantis de interrupção declarados, o holdover até um limiar de temporização, a fração de interrupções e Testes: <a1>optical_atmosphere_identities.rs</a1>.

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Uma tabela opcional <c1/> (duração, passo, semente) faz o tipo de cenário <c2/> escrever também, por local, uma realização com semente do modelo declarado do local ao longo do tempo: episódios de nuvens (intervalos de céu limpo exponenciais, interrupções por nuvens log-normais Testes: <a1>optical_atmosphere_timeseries.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Cn2 de Hufnagel-Valley integrado ao longo de um percurso oblíquo para a variância de Rytov de onda plana e de onda esférica (enlace de subida e de descida), o índice de cintilação de Andrews-Phillips. Referência independente (ExternalDataset): a numérica é comparada com um programa independente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } com { "30" } dígitos, quadratura tanh-sinh sobre a variável de altura original e densidades gama-gama com Bessel-K) que não compartilha nenhum código com o Kshana, sob limiares fixados antes de existir qualquer implementação (xval/optical-atmosphere/PREREGISTRATION.md). POR QUE MODELLED: essa referência independente avalia as mesmas fórmulas publicadas, de modo que verifica a im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Disponibilidade de um enlace óptico contra uma margem de enlace declarada a partir de um clima log-normal de água líquida das nuvens (quantidade ITU-R P.840, extinção de óptica geométrica) e . Referência independente (InternalConsistency): consistência interna: limites de forma fechada e monotonicidade do modelo de diversidade, a forma fechada do teto de nuvens e as identidades de interrupção log-normais. NENHUMA referência externa independente é alegada e nenhuma foi comparada: não se usa nenhum registro medido de disponibilidade de estação óptica em solo nem de linha de visada livre de nuvens. POR QUE MODELLED: o clima de nuvens (probabilidade de nuvens, mediana e dispersão da coluna de água líquida, durações de interrupção),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> A distribuição da duração de interrupções de um local óptico acoplada à variância de deriva de forma fechada do modelo de holdover do relógio: erro de temporização e de medição de distância em quantis de interrupção declarados. Referência independente (InternalConsistency): consistência interna com o módulo de holdover, bit a bit; NENHUMA referência externa independente é alegada. As PSDs das classes são os pisos sintetizados de tau longo que o módulo de holdover já traz, de modo que os valores herdam a sua ressalva declarada de que o holdover até um limiar estreito é governado pelo piso presumido de ruído vermelho e não pelo desvio de Allan citado. As durações de interrupção são um modelo log-normal com parâmetros declarados, não um c medido

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — PNT óptico através da atmosfera: extinção em céu limpo (lei de visibilidade de Kim + Rayleigh), profundidade óptica das nuvens a partir de um clima declarado de água líquida (quantidade P.840, extinção de óptica geométrica), turbulência de Hufnagel-Valley com desvanecimentos gama-gama e média de abertura, disponibilidade contra a margem do enlace, durações de interrupção acopladas ao holdover do relógio e diversidade de locais correlacionada pela distância. A numérica é verifica (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-32c6524b0baf = PNT óptico MODELLED através da atmosfera: para um enlace óptico e um conjunto de locais em solo com climas de nuvens declarados, informa a perda em céu limpo dependente do comprimento de onda e da elevação (lei de visibilidade de Kim mais Rayleigh), o estado de turbulência de Hufnagel-Valley (variância de Rytov, índice de cintilação, parâmetros gama-gama, média de abertura), a disponibilidade dirigida pelo tempo contra a margem do enlace (profundidade óptica das nuvens a partir (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED: toda entrada de clima, de técnica e de relógio e as hipóteses de independência e de cópula; nenhum registro medido de disponibilidade foi comparado. (catálogo de tipos de cenário (<c1/>))

# text
seg-b4402211e3fe = PNT óptico através da atmosfera: três locais em solo ILLUSTRATIVE (um local ao norte mais nublado, um local central intermediário e um local ao sul mais claro) que observam um terminal óptico LEO a { "30" } graus de elevação em { "1550" } nm. Os climas de nuvens são entradas declaradas, não medições nem valores de nenhum conjunto de dados, de modo que toda disponibilidade abaixo é MODELLED. A execução informa por local a perda em céu limpo, o estado de turbulência de Hufnagel-Valley, t (comentário do arquivo de cenário, linhas { "1" } a { "8" })

# text
seg-384f5c73cdf9 = Uma realização com semente do enlace de cada local ao longo do tempo (MODELLED; um sorteio do modelo acima, não o clima). Se ausente, nenhuma série é escrita e o resultado é o documento da versão { "0.37" }. (comentário do arquivo de cenário, linhas { "78" } a { "79" })

# text
seg-c75fa5787bd4 = A numérica da atmosfera em percurso óptico oblíquo: variância de Rytov, cintilação, probabilidade de desvanecimento gama-gama, média de abertura, profundidade óptica de nuvens e de céu limpo é MODELLED, não validada: uma subalegação é verificada externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = A disponibilidade de locais ópticos em solo dirigida pelo tempo e a diversidade de locais correlacionada pela distância são MODELLED, não validadas: verificadas contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Página do tema: <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Anterior</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Próximo</s1>orbit
