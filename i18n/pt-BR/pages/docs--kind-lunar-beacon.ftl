# docs--kind-lunar-beacon: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Fonte: <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (tipo de cenário)

# text
seg-142ad48fe422 = Aumento por balizas de superfície de um serviço lunar de navegação em órbita, como uma tabela executável de antes e depois. Um usuário polar sul vê um conjunto orbital esparso em uma faixa estreita do céu, de modo que a geometria de medição de distância é mal condicionada; algumas BALIZAS DE SUPERFÍCIE LEVANTADAS TOPOGRAFICAMENTE fornecem as linhas de linha de visada de baixa elevação e amplo azimute que um conjunto todo sobre a cabeça não tem, e a diluição horizontal da precisão colapsa. O cenário informa três configurações em uma época -- só os satélites, os satélites mais as balizas visíveis, e uma constelação maior como caminho alternativo para a mesma geometria -- cada uma com as suas contagens de fontes visíveis, o seu DOP completo e a precisão realizada de 1 sigma em METROS, obtida multiplicando por um erro equivalente de medição de distância do usuário por baliza, montado como a raiz da soma dos quadrados dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade das balizas é o horizonte geométrico de duas alturas da Lua sem ar (sem atmosfera, de modo que o limite é exato), e a montagem do DOP é o mesmo núcleo verificado de forma cruzada contra o gnss_lib_py em tests/dop_reference.rs. POR QUE ESTE TIPO DE CENÁRIO EXISTE: o módulo por trás dele está no motor e é verificado contra um caminho de DOP independente desde L08/L09, mas não era alcançável a partir de uma execução -- sem tipo de cenário, sem ramo de despacho, sem arquivo incluído. O README anunciava a capacidade e a matriz de verificação NÃO trazia nenhuma linha para ela, de modo que ela era ao mesmo tempo afirmada na prosa e não afirmada no registro, enquanto era inalcançável no motor. Os valores padrão são a geometria que já tem um golden registrado (um usuário a -80 graus com uma antena de { "2" } m, três balizas em -80/0, -79/+{ "60" } e -79/-60 a { "2" } km, um instantâneo LCNS ilustrativo de seis satélites em t={ "0" }, uma máscara de { "5" } graus), de modo que uma execução simples reproduz uma tabela que uma referência independente já cobre em vez de inventar números novos. MODELLED: o projeto da constelação, a posição das balizas e toda magnitude do orçamento de erros são entradas ilustrativas, não um levantamento em campo nem um enlace medido; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE têm âncora externa. Não é um compromisso de desempenho de serviço.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Uma execução de <c1/> resume-se assim: Lunar surface-beacon augmentation — mask { "5.0" } deg, epoch +{ "0" } s, per-beacon sigma_URE { "1.1576" } m { "6" } satellites, no beacons sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realised 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellites + { "1" } visible beacons sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realised 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellites, no beacons sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realised 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m beacons improve PDOP by 2.355x; a larger constellation instead, 4.002x MODELLED: the constellation, the beacon placement and the error budget are illustrative inputs. The DOP kernel underneath is the gnss_lib_py-validated one and the beacon horizon is the L01 closed form.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-25522022cf9a = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/lunar-beacon.toml
seg-acfef3f325e4 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-a53e353706f6 = O gráfico que o motor escreve para scenarios/lunar-beacon.toml, tipo de cenário lunar-beacon

# text
seg-89e2f6bb2540 = <b>MODELLED</b> Diluição da precisão com aumento por balizas para um usuário na superfície lunar: as linhas de linha de visada dos satélites visíveis e as linhas de medição de distância das balizas de superfície visíveis são concatenadas em uma única matriz de projeto e avaliadas pelo núcleo de DOP compartilhado, e t Testes: <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Diluição da precisão com aumento por balizas para um usuário na superfície lunar: as linhas de linha de visada dos satélites visíveis e as linhas de medição de distância das balizas de superfície visíveis são concat. Referência independente (ReferenceImpl): a aritmética do DOP é o núcleo crate::orbit::dop, validado separadamente e de forma externa contra o gnss_lib_py em tests/dop_reference.rs; esta linha não toma emprestado de novo o status daquela linha. O horizonte de visibilidade das balizas é a forma fechada L01, e sigma = DOP x sigma_URE é a relação padrão do GNSS (Kaplan and Hegarty, Understanding GPS/GNSS, section { "7" }). Dentro desta linha, o próprio aumento é verificado contra uma independente

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED: o projeto da constelação, a posição das balizas e toda magnitude do orçamento de erros são entradas ilustrativas, não um levantamento em campo nem um enlace medido; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE têm âncora externa. (catálogo de tipos de cenário (<c1/>))

# text
seg-aaafed663400 = O QUE TEM ÂNCORA E O QUE NÃO TEM Com âncora: a montagem do DOP é o núcleo verificado de forma cruzada contra o gnss_lib_py em tests/dop_reference.rs; a visibilidade das balizas é a forma fechada do horizonte geométrico de duas alturas da Lua sem ar (sem atmosfera, de modo que não há extensão por refração e o limite é exato); e sigma = DOP x sigma_URE é a relação padrão (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). SEM âncora — MODELL (comentário do arquivo de cenário, linhas { "40" } a { "49" })

# text
seg-2516c4208769 = O aumento do DOP por balizas de superfície lunar é MODELLED, não validado: verificado contra uma implementação separada nesta mesma base de código -- independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Anterior</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Próximo</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Próximo</s1>lunar-descent
