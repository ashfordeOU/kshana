# docs--kind-lunar-beacon: translations (pt-PT)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Fonte: <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (tipo de cenário)

# text
seg-142ad48fe422 = Aumento de um serviço de navegação orbital lunar por balizas de superfície, como uma tabela executável de antes/depois. Um utilizador no polo sul vê um conjunto orbital esparso numa faixa estreita do céu, pelo que a geometria de medição de distâncias é mal condicionada; algumas BALIZAS DE SUPERFÍCIE TOPOGRAFADAS fornecem as linhas de linha de vista de baixa elevação e grande azimute que falta a um conjunto todo ele zenital, e a diluição horizontal da precisão desce abruptamente. O cenário indica três configurações numa época — só os satélites, os satélites mais as balizas visíveis, e uma constelação maior como via alternativa para a mesma geometria — cada uma com as suas contagens de fontes visíveis, o seu DOP completo e a exatidão realizada de 1 sigma em METROS, obtida multiplicando por um erro de distância equivalente do utilizador por baliza, montado como a soma quadrática dos termos de sincronização de relógio, multipercurso e levantamento. A visibilidade das balizas é o horizonte geométrico de duas alturas da Lua sem atmosfera (sem atmosfera, pelo que o limite é exato), e a montagem do DOP é o mesmo núcleo verificado face ao gnss_lib_py em tests/dop_reference.rs. PORQUE EXISTE ESTE TIPO DE CENÁRIO: o módulo subjacente existe no motor e foi verificado face a um percurso de DOP independente desde L08/L09, mas não era acessível a partir de uma execução — sem tipo de cenário, sem ramo de despacho, sem ficheiro incluído. O README anunciava a capacidade e a matriz de verificação não tinha NENHUMA linha para ela, pelo que era simultaneamente afirmada em prosa e não afirmada no registo, ao mesmo tempo que era inacessível no motor. As predefinições são a geometria que já tem uma referência de ouro registada (um utilizador a -80 graus com uma antena de { "2" } m, três balizas a -80/0, -79/+{ "60" } e -79/-60 a { "2" } km, um instantâneo ilustrativo de seis satélites LCNS em t={ "0" }, uma máscara de { "5" } graus), pelo que uma execução simples reproduz uma tabela que uma referência independente já cobre, em vez de inventar números novos. MODELLED: o projeto da constelação, a colocação das balizas e todas as magnitudes do orçamento de erro são entradas ilustrativas, não um levantamento no terreno nem uma ligação medida; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE estão ancoradas externamente. Não é um compromisso de desempenho do serviço.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Uma execução de <c1/> resume-se assim: Aumento por balizas de superfície lunares — máscara de { "5.0" } graus, época +{ "0" } s, sigma_URE por baliza de { "1.1576" } m { "6" } satélites, sem balizas sats { "5" } balizas { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } 1 sigma realizado: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satélites + { "1" } balizas visíveis sats { "5" } balizas { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } 1 sigma realizado: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satélites, sem balizas sats { "19" } balizas { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } 1 sigma realizado: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m as balizas melhoram o PDOP em 2.355x; uma constelação maior em alternativa, 4.002x MODELLED: a constelação, a colocação das balizas e o orçamento de erro são entradas ilustrativas. O núcleo de DOP subjacente é o validado face ao gnss_lib_py e o horizonte das balizas é a forma fechada L01.

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
seg-89e2f6bb2540 = <b>MODELLED</b> Diluição da precisão aumentada por balizas para um utilizador à superfície lunar: as linhas de linha de vista dos satélites visíveis e as linhas de medição de distâncias das balizas de superfície visíveis são concatenadas numa única matriz de projeto e avaliadas através do núcleo de DOP partilhado, e t Ensaios: <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Diluição da precisão aumentada por balizas para um utilizador à superfície lunar: as linhas de linha de vista dos satélites visíveis e as linhas de medição de distâncias das balizas de superfície visíveis são concat. Referência independente (ReferenceImpl): A aritmética do DOP é o núcleo crate::orbit::dop, validado externamente em separado face ao gnss_lib_py em tests/dop_reference.rs; esta linha não toma de empréstimo o estado dessa linha. O horizonte de visibilidade das balizas é a forma fechada L01, e sigma = DOP x sigma_URE é a relação GNSS padrão (Kaplan e Hegarty, Understanding GPS/GNSS, secção { "7" }). Nesta linha, o próprio aumento é verificado face a uma independente

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED: o projeto da constelação, a colocação das balizas e todas as magnitudes do orçamento de erro são entradas ilustrativas, não um levantamento no terreno nem uma ligação medida; apenas a aritmética do DOP, a forma fechada do horizonte e a relação sigma = DOP x sigma_URE estão ancoradas externamente. (catálogo de tipos de cenário (<c1/>))

# text
seg-aaafed663400 = O QUE ESTÁ ANCORADO E O QUE NÃO ESTÁ Ancorado: a montagem do DOP é o núcleo verificado face ao gnss_lib_py em tests/dop_reference.rs; a visibilidade das balizas é a forma fechada do horizonte geométrico de duas alturas da Lua sem atmosfera (sem atmosfera, pelo que não há extensão refrativa e o limite é exato); e sigma = DOP x sigma_URE é a relação padrão (Kaplan & Hegarty, Understanding GPS/GNSS, secção { "7" }). NÃO ancorado — MODELL (comentário do ficheiro de cenário, linhas { "40" } a { "49" })

# text
seg-2516c4208769 = O aumento do DOP por balizas de superfície lunares é MODELLED, não validado: verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Anterior</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Seguinte</s1>lunar-differential-pnt
