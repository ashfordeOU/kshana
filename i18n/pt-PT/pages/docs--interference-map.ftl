# docs--interference-map: translations (pt-PT)

# attr:aria-label, text
seg-6555ff9a6d8e = Saída

# text
seg-2247a2344710 = Significado

# text
seg-c3c260b7063e = Testes

# text
seg-d4a762001549 = Licença

# text
# c1: docs/INTERFERENCE-MAP.md
seg-e7b6d071246e = Fonte: <c1/>

# text
# c1: kshana interference-map
# c2: kshana route-exposure
seg-143c73287d6c = <c1/> constrói uma imagem diária de onde aeronaves e navios comunicaram dados de navegação degradados, a partir de ficheiros de seguimento com licença aberta que o utilizador fornece. <c2/> indica depois que parte de uma rota planeada esteve dentro das células afetadas em cada dia.

# text
seg-158f33f95ec3 = O que isto é: uma descrição do aspeto que tiveram os relatos de posição publicados em dias passados. O que não é: uma medição de qualquer recetor, uma previsão ou uma prova de interferência. Uma célula degradada ou anómala tem várias causas possíveis (enumeradas abaixo), e uma célula sem entrada simplesmente não foi observada.

# text
seg-64d3ee269407 = Tudo funciona com ficheiros locais. Os comandos predefinidos nunca abrem uma ligação de rede; o único auxiliar de descarga opcional exige uma opção explícita.

# attr:alt
seg-e251b385ff46 = Dois dias sintéticos do mapa de interferência, desenhados a partir das amostras submetidas em examples/interference-map/output, cada um com a sua própria rota sintética e as parcelas de exposição da rota que o motor comunica. À esquerda, um dia ADS-B: { "1" } célula degradada, { "6" } não degradadas, { "4" } não avaliadas (a tracejado) e células sem entrada, desenhadas vazias, que não foram observadas. A rota tem { "525" } km: { "11.5" }% do seu comprimento em células degradadas, { "38.3" }% não degradadas, { "9.1" }% não avaliadas e { "41.1" }% não observadas. À direita, um dia AIS: células assinaladas pelos detetores de círculo e de terra firme, células não anómalas e células vazias; a rota tem { "454" } km, com { "10.5" }% em células anómalas, { "21.2" }% não anómalas, { "0.0" }% não avaliadas e { "68.3" }% não observadas. ADS-B e AIS são camadas separadas, nunca combinadas. Uma célula assinalada não é uma constatação de interferência, e uma célula sem cor não foi observada, o que não é o mesmo que livre. Todos os dados são inventados, em pleno meio do Atlântico, e não constituem uma medição.

# text
# c1: examples/interference-map/output/
# c2: examples/interference-map/input/
# c3: kshana route-exposure
seg-765f43228dc6 = Ambos os dias são as amostras sintéticas em <c1/>, cada uma com uma rota sintética em <c2/>; as parcelas de exposição da rota são as que <c3/> apresenta para elas. Nada nelas é um local, uma aeronave ou uma embarcação reais.

# text
seg-228f39c0305b = Dados e licenças

# text
# c1: data/INTERFERENCE-DATA-SOURCES.md
# c2: --dataset
seg-d3336cc18ff7 = Apenas as fontes revistas em <a1><c1/></a1> estão incorporadas, selecionadas com <c2/>:

# text
seg-b03d56f501c3 = Tipo

# text
seg-2328672e782f = Campo de licença da saída

# text
seg-2319c7a6f6e2 = ODbL { "1.0" }

# text
seg-7464d3c830f3 = AIS

# text
seg-c13f76567536 = Domínio público dos EUA (CC0 { "1.0" } segundo o editor)

# text
seg-636c2bb6f29d = domínio público

# text
seg-f6f4e431d36d = NLOD { "2.0" }

# text
seg-5621e3a3908f = qualquer um

# text
seg-6b3a1f8ca649 = o que o utilizador indicar

# text
# c1: --licence
# c2: --licence-url
# c3: --attribution
seg-be349e2c455f = <c1/>, <c2/>, <c3/> obrigatórios

# text
seg-590344d1eae5 = Cada ficheiro de saída incorpora a licença, o URL da licença, a atribuição exigida e os limites de cobertura da fonte. Não existe nenhuma entrada incorporada para fontes cujos termos proíbam a utilização comercial ou a redistribuição de mapas derivados.

# text
# c1: licence
seg-2d8eaefab0f8 = <b>ODbL e edições do Kshana.</b> Um ficheiro ADS-B por célula feito a partir de dados do adsb.lol é uma Derived Database e é lançado sob a ODbL { "1.0" }; o seu campo <c1/> di-lo. O código do próprio Kshana continua AGPL-3.0. As edições comerciais do Kshana que escrevem esses ficheiros incluem o mesmo aviso, e quem voltar a publicar o ficheiro tem de o manter. Os resultados ADS-B e AIS nunca são combinados num só ficheiro, pelo que a ODbL não se aplica à camada AIS.

# text
seg-bb4932d5d15c = <b>Viés de cobertura.</b> Os mapas herdam a cobertura da sua fonte. O adsb.lol depende de recetores voluntários, pelo que o mar aberto e as regiões com pouca cobertura são esparsos. Os dados abertos do Kystverket omitem embarcações de pesca com menos de { "15" } m e embarcações de recreio com menos de { "45" } m, pelo que o seu mapa reflete os navios maiores. O MarineCadastre cobre apenas águas dos EUA.

# text
seg-713babc3963b = <b>Identificadores.</b> As linhas de entrada têm um identificador de aeronave ou de embarcação. É calculado em hash em memória com um sal aleatório por execução, usado apenas para contar aeronaves ou embarcações distintas, e nunca escrito, registado nem impresso. As saídas são agregadas: nenhum identificador aparece nelas.

# text
# c1: 5
# c2: null
seg-fa3c70a8997a = <b>Supressão.</b> Uma célula com menos de <c1/> aeronaves ou embarcações distintas observadas nesse dia não é publicada de todo, e, para o AIS, uma contagem assinalada de um ou dois numa célula publicada é comunicada como <c2/>. Nenhum valor publicado pode identificar uma aeronave ou uma embarcação.

# text
seg-02dbfcb9c808 = Formatos de entrada

# text
# c1: YYYY-MM-DDTHH:MM:SS[.fff]Z
seg-2f291f986a87 = CSV simples com linha de cabeçalho, separado por vírgulas, sem aspas, horas UTC. A ordem das colunas é livre; as colunas desconhecidas são ignoradas. Uma marca temporal é em segundos Unix ou <c1/>. As linhas que não podem ser analisadas são contadas nos metadados da saída, não descartadas em silêncio.

# text
# c1: kshana interference-map adsb
seg-571365be20a5 = ADS-B (<c1/>):

# text
seg-aaeff8f42699 = Coluna

# text
seg-b10a51ed96c0 = Obrigatória

# text
seg-357c2320b43a = sim

# text
seg-14ac5d0f109b = hora do relato

# text
seg-6dbe5595d0be = identificador opaco (calculado em hash, nunca guardado)

# text
seg-c5fb6b91dc68 = graus

# text
# c1: ground
seg-e283838c85aa = altitude em pés; <c1/> ou vazio exclui a linha

# text
seg-9ab90c35bd7d = pelo menos uma

# text
seg-868e5b9c00ab = inteiros de { "0" } a { "11" }; vazio significa não comunicado

# text
seg-db907db790b1 = não

# text
# c1: adsb
seg-5c2ce9f61700 = se presente, só são usados os valores que começam por <c1/> (MLAT, TIS-B e semelhantes são excluídos)

# text
# c1: tar -xf -
# c2: trace_full_*.json
seg-412f40b8eeb1 = <b>Histórico readsb do adsb.lol, lido diretamente.</b> Os arquivos diários são um tar dividido de ficheiros de rasto do readsb. Extraia um como o editor descreve (concatenar as partes, <c1/>) e depois forneça ao Kshana o diretório extraído, um único ficheiro <c2/> ou um CSV:

# text
# c1: trace_full_*
# c2: trace_recent_*
# c3: .json
# c4: ground
# c5: nic
# c6: nac_p
# c7: trace_files_unreadable
seg-6e7d378bd89b = Um diretório é pesquisado recursivamente à procura de ficheiros <c1/> (os outros ficheiros, como <c2/>, são ignorados e as ligações simbólicas não são seguidas). Cada ficheiro está comprimido em gzip ou é JSON simples, detetado pelos seus primeiros bytes, porque o readsb escreve gzip sob um nome <c3/>; a descompressão está limitada a { "512" } MiB por ficheiro. De cada entrada de rasto, o Kshana lê o desvio temporal, a latitude, a longitude, a altitude (o marcador <c4/> exclui a entrada), os campos <c5/> e <c6/> do objeto de detalhes da aeronave e a cadeia da fonte da posição (as entradas de qualquer fonte que não ADS-B são excluídas). Uma entrada sem objeto de detalhes não tem campos de precisão e é contada como excluída. Um ficheiro que não possa ser lido é contado em <c7/> nos metadados da saída e ignorado.

# text
# c1: kshana interference-map ais
seg-b1502f7f4c98 = AIS (<c1/>):

# text
seg-91395984ddac = graus; os valores "não disponível" do AIS e ({ "0" }, { "0" }) são descartados

# text
seg-34ae94eb1797 = velocidade sobre o fundo em nós; { "102.3" } (não disponível) é tratado como em falta

# text
# c1: --land
# c2: --land
seg-a1e60af5adaa = O detetor em terra precisa de um ficheiro de polígonos de terra (<c1/>): GeoJSON Polygon ou MultiPolygon. A camada de terra do Natural Earth de { "1" }:{ "10" } milhões (domínio público) é o ficheiro previsto. Sem <c2/>, o detetor fica desligado e a saída di-lo. Para a descarregar (o único acesso à rede desta funcionalidade):

# text
# c1: curl
# c2: curl
seg-cd55a09894c5 = Isto executa o <c1/> do sistema (como lista de argumentos, não através de uma shell) por HTTPS, uma vez, para um ficheiro num endereço fixo que identifica um único commit do repositório de origem. A descarga só é mantida se o seu SHA-256 for igual ao valor fixado no código; uma divergência elimina-a e falha. Se <c2/> não estiver instalado, o comando di-lo e indica o endereço e a soma de verificação, para que o ficheiro possa ser obtido manualmente. Nada é incluído no repositório.

# text
# c1: --out
# c2: <source>-<dataset>-<YYYY-MM-DD>.geojson
# c3: <source>
# c4: adsb
# c5: ais
# c6: <dataset>
# c7: --dataset
# c8: adsb-lol
# c9: noaa-marinecadastre
# c10: kystverket
# c11: custom
# c12: adsb-adsb-lol-2026-03-01.geojson
# c13: ais-kystverket-2026-03-01.geojson
# c14: ^(adsb|ais)-(.+)-(\d{4}-\d{2}-\d{2})\.geojson$
# c15: source_kind
# c16: data.dataset
# c17: date
# c18: examples/interference-map/output/
# c19: kshana_interference_map
# c20: cell_i
# c21: cell_j
# c22: status
# c23: degraded
seg-95eeaa0033b3 = Um ficheiro GeoJSON por fonte e por dia UTC, no diretório <c1/>, com o nome <c2/>, em que <c3/> é <c4/> ou <c5/>, <c6/> é a chave <c7/> (<c8/>, <c9/>, <c10/> ou <c11/>) e a data é o dia UTC dos relatos: <c12/>, <c13/>. O conjunto de dados está no nome para que dois conjuntos de dados do mesmo tipo não possam partilhar um ficheiro, e o <b>Kshana nunca substitui um ficheiro</b>: se existir algum destino, o comando falha antes de escrever o que quer que seja. A CLI imprime uma linha por cada ficheiro que escreve. Um leitor pode recuperar as três partes com <c14/>; a mesma informação está dentro do ficheiro (<c15/>, <c16/>, <c17/>). Os ficheiros de amostra sintéticos, um por fonte, estão em <c18/>, com o comando que os regenera, para construir e testar um visualizador. Um membro de nível superior <c19/> contém o nome do esquema, a data, a grelha, o identificador do método e todos os parâmetros, os valores ao nível do dia, a licença dos dados e a atribuição, e um aviso. Cada elemento é um polígono de célula com <c20/>, <c21/>, <c22/>, <c23/> e as contagens agregadas.

# text
# c1: --cell-deg
# c2: --cell-deg
# c3: grid.preregistered_cell_deg
# c4: grid.is_preregistered
seg-1ee702004726 = A grelha é fixa: células quadradas de <c1/> graus (por predefinição { "0.5" }) em latitude e longitude, indexadas a partir de (-90, -180). A largura este-oeste diminui com a latitude: cerca de { "55" } km no equador e cerca de { "28" } km aos { "60" } graus para a predefinição. A latitude { "90" } pertence à última linha e a longitude { "180" } é o mesmo meridiano que -180. <b>Os métodos pré-registados estão definidos na grelha de { "0.5" } graus.</b> Outro <c2/> é executado, mas não é o método pré-registado: a CLI di-lo, e o ficheiro regista <c3/> e <c4/> (falso) para que um visualizador o possa dizer também.

# text
# c1: null
# c2: null
# c3: status
# c4: degraded
# c5: aircraft_observed
# c6: aircraft_sampled
# c7: aircraft_affected
# c8: null
# c9: affected_share
# c10: null
# c11: vessels_flagged
# c12: null
seg-6e1e8f2a9082 = <b>Contagens retidas.</b> Toda a contagem por célula abaixo do mínimo de publicação ({ "5" }) é <c1/>, incluindo o zero, pelo que <c2/> nunca significa "nenhuma" e nenhum número publicado pode identificar uma aeronave ou uma embarcação. Os campos <c3/> e <c4/> continuam a ser fornecidos. Nos ficheiros ADS-B, <c5/> é sempre pelo menos { "5" } para uma célula publicada; <c6/> e <c7/> são <c8/> abaixo de { "5" }, e <c9/> é <c10/> a menos que ambos sejam pelo menos { "5" } (uma parcela revelaria uma contagem retida). Nos ficheiros AIS, cada entrada de <c11/> é <c12/> abaixo de { "5" }.

# text
seg-fd929d6ee90b = Versão do formato e campos

# text
# c1: schema: "kshana-interference-map/v1"
# c2: format_version: 1
# c3: null
seg-ff443e9cbd20 = O formato está estabelecido como <c1/>, <c2/>. Uma alteração que remova ou renomeie um campo, ou altere o que um significa, aumenta a versão; acrescentar um campo não, pelo que um leitor tem de ignorar os campos que não conhece. Uma contagem que seja <c3/> está retida, não é zero.

# text
# c1: status
# c2: degraded
# c3: not_degraded
# c4: insufficient_sample
# c5: withheld_day_confounded
# c6: withheld_no_background
# c7: anomalous
# c8: not_anomalous
# c9: degraded
# c10: degraded
# c11: anomalous
# c12: kshana-route-exposure/v1
seg-60818bfc3f90 = Valores de <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> é verdadeiro apenas para <c10/> e <c11/>. O relatório de exposição de rota tem o seu próprio esquema <c12/>.

# text
seg-ea526ebdd260 = Observatório: o produto diário

# text
# c1: kshana interference-map daily
# c2: kshana interference-map sensitivity
# c3: --delay-hours
# c4: degraded
# c5: not_degraded
# c6: not_observed
# c7: observatory/METHOD.md
# c8: --bbox south,west,north,east
seg-e33f63fe5c0a = <c1/> transforma um dia UTC de relatos ADS-B nos três ficheiros do observatório (GeoJSON, PNG e um JSON de relatório de incidentes) e num manifesto de hashes, e <c2/> reproduz esse dia com alterações de um parâmetro de cada vez nos parâmetros pré-registados. O comando impõe as regras de publicação: pelo menos { "24" } h depois de o dia terminar (<c3/> só pode ser aumentado), células de { "0.5" } graus ou mais grosseiras, apenas três estados (<c4/>, <c5/>, <c6/>), nenhuma causa atribuída e nenhum dado do OpenSky. A nota de método, os formatos de ficheiro e os limites estão em <a1><c7/></a1>. Uma execução regional (<c8/>) lê apenas os relatos da caixa e di-lo no ficheiro.

# text
seg-31ce42fc05dc = Especificação da página de mapa do Studio

# text
seg-a9aca2e2d390 = Para a página de mapa do Studio, que carrega um ficheiro GeoJSON fornecido pelo utilizador (a página é construída no código-fonte do Studio, não neste repositório). Nada é carregado para um servidor: o ficheiro é lido no navegador, e a página não faz nenhum pedido a qualquer fonte de dados.

# text
# c1: kshana_interference_map.schema
# c2: kshana-interference-map/
# c3: format_version
seg-064ec5d4c91a = <b>Ler um ficheiro.</b> Aceite um ficheiro apenas se <c1/> começar por <c2/> e <c3/> for um número que a página suporte; caso contrário, indique que o ficheiro não é um mapa de interferência do Kshana suportado. Leia os campos enumerados acima; ignore os desconhecidos. Um ficheiro contém uma fonte e um dia. Podem ser carregados vários ficheiros.

# text
# c1: status
seg-5be32f8cff46 = <b>Células.</b> Desenhe o polígono de cada elemento. Colora segundo <c1/> e indique sempre numa legenda o que cada cor significa. Quatro estados, nenhum dos quais pode ser ocultado ou fundido:

# text
seg-b652b86e6b8e = Estado

# text
seg-4a511b6a03e3 = Origem

# text
seg-f92da2236260 = Degradada (ou anómala no AIS)

# text
seg-591ebe8007cb = uma parcela elevada de aeronaves comunicou baixa precisão, ou embarcações apresentaram anomalias, nesse dia

# text
# c1: degraded
seg-bd993c64b6e8 = <c1/> é verdadeiro

# text
seg-88d43eb1c14a = Livre

# text
seg-af5f7989fd09 = observada com aeronaves ou embarcações suficientes e não assinalada

# text
# c1: status
# c2: not_degraded
# c3: not_anomalous
seg-2bc810e02210 = <c1/> é <c2/> ou <c3/>

# text
seg-d894eaa21369 = Não avaliada

# text
seg-38c88ed94111 = observada mas sem aeronaves amostradas suficientes, o dia foi confundido, ou o fundo do dia não pôde ser estimado

# text
# c1: status
# c2: insufficient_sample
# c3: withheld_day_confounded
# c4: withheld_no_background
seg-e358a8c7903f = <c1/> é <c2/>, <c3/> ou <c4/>

# text
seg-013b7c903426 = Não observada

# text
seg-81bcffa57ec2 = aeronaves ou embarcações em número insuficiente, pelo que a célula não foi publicada

# text
seg-6828d71822bd = nenhum elemento para essa célula

# text
# c1: properties
# c2: null
# c3: grid.is_preregistered
seg-753192a770ac = "Não observada" é a ausência de um elemento: desenhe-a de forma neutra (sem preenchimento, ou com tracejado), nunca na cor de "livre". Use um esquema de cores que não dependa apenas do vermelho face ao verde. Os detalhes da célula ao passar o cursor ou ao selecionar mostram as contagens em <c1/> tal como fornecidas, e cada contagem <c2/> como "retida (menos de { "5" })", nunca como zero. Um visualizador deve também indicar, quando <c3/> é falso, que o ficheiro usa um tamanho de célula fora do método pré-registado.

# text
seg-e90fedf7ad89 = <b>Camadas.</b> ADS-B e AIS são camadas separadas, com os seus próprios interruptores, legendas e linhas de licença. Nunca as funda num só campo de cor ou numa só contagem, nunca as desenhe como uma célula combinada e nunca some as suas células. Dias diferentes são ficheiros diferentes: mostre um dia de cada vez, com um seletor de dia, em vez de sobrepor dias.

# text
# c1: data.attribution
# c2: data.licence
# c3: data.licence_url
# c4: data.coverage_notes
seg-6d500d3c0baa = <b>Licença e atribuição.</b> Para cada camada visível, mostre, no mapa e em qualquer exportação ou captura de ecrã, o texto de <c1/> literalmente, o <c2/> com uma ligação para <c3/>, e o <c4/>. Se for mostrada uma camada ADS-B, a sua licença ODbL aplica-se apenas a essa camada. Não ofereça a exportação de um ficheiro combinado.

# text
# c1: method.id
# c2: method.parameters
# c3: day
# c4: day_confounded
# c5: input_stats
seg-6f786153ef8e = <b>Método.</b> Ofereça o identificador e os parâmetros do método (<c1/>, <c2/>) e os valores de <c3/> num painel de detalhes, incluindo <c4/> (diga com clareza que nenhuma célula foi considerada degradada por causa do fundo do dia) e <c5/>.

# text
# c1: method.caveats
# c2: notice
seg-905348837439 = <b>Ressalvas a manter</b> (mostre os próprios <c1/> e <c2/> do ficheiro, e mantenha esta formulação, ou uma equivalente, visível junto do mapa):

# text
seg-1f70e308010a = Uma célula degradada ou anómala não é uma constatação de interferência. Existem outras causas.

# text
seg-7cde0ddadb73 = Uma célula sem cor não foi observada. Não é prova de que a área estivesse livre.

# text
seg-1135dfeadb8f = Isto é uma descrição de relatos de posição passados, não uma previsão e não uma medição de qualquer recetor.

# text
seg-3ad1216bf3ed = A cobertura segue a fonte de dados; leia as notas de cobertura.

# text
seg-046f6af48349 = A página não deve nomear nem mostrar nenhuma aeronave ou embarcação individual, e os ficheiros não contêm nenhuma.

# text
# c1: kshana-route-exposure/v1
# c2: caveats
# c3: map_licence
# c4: map_attribution
seg-ae79b67c3b98 = <b>Exposição de rota.</b> Se a página carregar também um relatório <c1/>, mostre as suas linhas por dia e fonte com as quatro parcelas (degradada, livre, não avaliada, não observada) em conjunto, nunca apenas a parcela degradada, mais os <c2/> do relatório, e o <c3/> e o <c4/> de cada linha.

# text
# c1: kshana-interference-map/adsb/v2
seg-98131acf49d8 = Método ADS-B (<c1/>)

# text
seg-83b660b0bfa6 = Cada relato ADS-B em voo inclui dois campos de qualidade de navegação autoavaliados: NIC (o raio de contenção da posição) e NACp (o limite de precisão de { "95" }%, EPU). Quando o recetor a bordo perde ou deixa de confiar na sua posição por satélite, ambos descem, razão pela qual constituem uma assinatura de interferência. Descem também por outros motivos.

# text
seg-4b9020a68db6 = <b>Parâmetros pré-registados</b> (constantes no código, escritas em cada ficheiro; uma alteração implica uma nova versão do método):

# text
seg-e73ea9921fcf = Parâmetro

# text
seg-8650fa804f14 = Limite mínimo de altitude

# text
seg-25056ee5a36c = altitude barométrica de pelo menos { "5000" } ft

# text
seg-17322eff480a = Relato de baixa precisão

# text
seg-48ab6ed5eedd = NACp no máximo { "6" } (o limite de EPU comunicado é { "556" } m, { "0.3" } NM, ou superior, ou desconhecido) ou NIC no máximo { "5" } (o limite do raio de contenção comunicado é { "1852" } m, { "1" } NM, ou superior, ou desconhecido)

# text
seg-84beb488319d = Bom relato

# text
seg-2595055d9593 = NACp pelo menos { "8" } e NIC pelo menos { "7" }; avaliado com os campos que a entrada tem (ambos quando ambos estão presentes, o que estiver presente caso contrário)

# text
seg-b4bbce695b2d = Linha de base do equipamento

# text
seg-4986ed51f600 = uma aeronave conta numa célula apenas com pelo menos { "5" } bons relatos fora dessa célula no mesmo dia

# text
seg-42859d1d785b = Aeronaves amostradas numa célula

# text
seg-1ae26d6d99a9 = pelo menos { "3" } relatos na célula

# text
seg-48bba15e2e0e = Aeronaves afetadas numa célula

# text
seg-1fe9c3ab930c = pelo menos { "50" }% dos seus relatos na célula são de baixa precisão

# text
seg-b147473d133c = Amostra mínima

# text
seg-33060cda8536 = pelo menos { "10" } aeronaves amostradas

# text
seg-009ca23b9cd6 = Degradada

# text
seg-afef85ae2a25 = pelo menos { "5" } aeronaves afetadas, uma parcela de afetadas entre as aeronaves amostradas de pelo menos { "0.30" }, e pelo menos { "0.15" } acima da parcela mediana das células nesse dia

# text
seg-890dcc56fa5c = Dia confundido

# text
seg-b27768e64d62 = parcela mediana das células (sobre pelo menos { "5" } células com amostra completa) de pelo menos { "0.15" }: nenhuma célula é declarada degradada

# text
seg-18fbf3c348c9 = Sem fundo

# text
# c1: withheld_no_background
seg-534111e0c6ad = menos de { "5" } células com amostra completa, pelo que a mediana não pode ser estimada: uma célula que atinja os limiares é <c1/>, não degradada

# text
seg-b571f127c595 = Mínimo de publicação

# text
seg-60621ffc5bcf = pelo menos { "5" } aeronaves distintas observadas

# text
# c1: degraded
# c2: not_degraded
# c3: insufficient_sample
# c4: withheld_day_confounded
# c5: withheld_no_background
seg-f36389caf81b = Estes valores foram fixados a partir das definições dos códigos NIC e NACp e da regra de privacidade antes de se olhar para quaisquer dados. Não foram ajustados com dados reais, e os testes usam apenas dados sintéticos. Estados das células: <c1/>, <c2/>, <c3/> (publicada mas com menos de { "10" } aeronaves amostradas), <c4/> e <c5/>.

# text
# c1: withheld_no_background
seg-c89afc07989b = <b>Versão { "2" }.</b> A versão { "1" } declarava uma célula degradada com apenas { "3" } aeronaves afetadas, menos do que o mínimo de publicação de 5 aeronaves, e saltava a verificação do fundo do dia, sem o dizer, quando menos de { "5" } células tinham amostra completa. A versão { "2" } exige pelo menos { "5" } aeronaves afetadas e retém a classificação (<c1/>) quando o fundo não pode ser estimado. Ambas as alterações tornam o método mais restritivo (nada que não estivesse degradado na versão { "1" } está degradado na versão { "2" }); o motivo é que uma classificação publicada nunca deve assentar em menos aeronaves do que o número abaixo do qual as contagens são retidas. Os ficheiros da versão { "1" } não foram publicados.

# text
seg-ffd0e5175548 = Porque descem os campos de precisão por motivos que não a interferência, e a salvaguarda para cada um:

# text
seg-12b613a77f64 = Causa

# text
seg-e30479c3e5d8 = Salvaguarda

# text
seg-ecac3d226210 = Transponders mais antigos que nunca comunicam NIC ou NACp, ou os comunicam com um valor baixo fixo

# text
seg-8b504b60fcc0 = a linha de base do equipamento: uma aeronave sem bons relatos noutros locais nesse dia não é contada

# text
seg-1df45f128708 = Baixa altitude e operações à superfície (ocultação pelo terreno, formatos de posição diferentes)

# text
# c1: ground
seg-cc5f23f0da05 = limite mínimo de altitude; as linhas marcadas <c1/> são excluídas

# text
seg-ddf6aeb47dbe = Posições MLAT ou outras não GNSS

# text
# c1: source_type
seg-51162a1835d1 = filtro <c1/> quando a coluna está presente

# text
seg-08196503a657 = Uma aeronave que envia muitos relatos

# text
seg-bf13dfa85dbe = contam-se as aeronaves distintas, não os relatos

# text
seg-bbcb809624bc = Uma falha de constelação ou de aumento, ou um evento de meteorologia espacial, que reduz a precisão numa área ampla

# text
seg-5f428bb7ad4a = a célula tem de exceder a parcela mediana das células do dia por uma margem, e um dia cuja mediana seja ela própria elevada é marcado como confundido e não declara nenhuma célula

# text
seg-30290253a95d = Uma falha no equipamento de uma aeronave

# text
seg-b673195405ff = exige uma parcela de muitas aeronaves distintas, com uma amostra mínima

# text
seg-aeebeded71be = Poucas aeronaves na célula

# text
seg-c33c60b49b17 = amostra mínima; abaixo de { "5" } observadas, a célula não é publicada

# text
seg-dc8abb9b411f = O que resta: o método não consegue distinguir interferência de uma causa regional que seja local e não ampla (um efeito local de geometria de satélites ou uma falha de aumento terrestre pareceriam o mesmo), e é conservador num sentido: uma aeronave que voa apenas dentro de uma região afetada durante todo o dia não tem linha de base e não é contada, pelo que as grandes áreas persistentes são subcomunicadas.

# text
# c1: kshana-interference-map/ais/v2
seg-41d725eeaba9 = Método AIS (<c1/>)

# text
# c1: anomalous
seg-7fd53079dccf = Por embarcação e por dia, cinco detetores. Um detetor <b>qualifica-se</b> numa célula quando assinala pelo menos { "5" } embarcações distintas que representem pelo menos { "20" }% das embarcações aí observadas; a célula é <c1/> se algum detetor se qualificar.

# text
seg-6d599353e8e1 = Detetor

# text
seg-551f38a9061c = Regra (pré-registada)

# text
seg-295e8a28a5b9 = pelo menos { "3" } relatos na célula a mais de { "2000" } m para o interior da linha de costa fornecida

# text
seg-fd21160e6685 = uma janela de { "20" } relatos consecutivos (passo { "10" }, intervalos de no máximo { "30" } min) cujo raio médio ao centroide é de { "500" } m a { "20" } km, coeficiente de variação do raio de no máximo { "0.15" }, um sentido de deslocação com enrolamento total de pelo menos { "270" } graus (passos de no máximo { "90" } graus, líquido de pelo menos { "80" }% do total) e velocidade média de pelo menos { "2" } kn

# text
seg-1aa30db06794 = pelo menos { "2" } saltos que chegam à célula: relatos consecutivos com pelo menos { "1000" } m de distância e no máximo { "1" } h de intervalo, implicando mais de { "70" } kn (a velocidade implícita usa pelo menos { "1" } s entre os relatos, pelo que dois relatos com a mesma marca temporal e posições a { "1" } km ou mais de distância contam como um salto)

# text
seg-7f9b22254009 = pelo menos { "3" } velocidades comunicadas acima de { "70" } kn na célula

# text
seg-e0d0968e8751 = pelo menos { "5" } embarcações distintas a comunicar a mesma posição (arredondada a { "1e-4" } graus, cerca de { "11" } m) na mesma janela de 10 minutos

# text
# c1: null
seg-1bf4c460672c = As células com menos de { "5" } embarcações distintas não são publicadas; toda a contagem assinalada abaixo de { "5" }, incluindo o zero, é comunicada como <c1/>.

# text
# c1: anomalous
seg-b2ea2ec6bad1 = <b>Versão { "2" }.</b> A versão { "1" } qualificava um detetor a partir de { "3" } embarcações assinaladas e publicava contagens de { "3" } e { "4" }. A versão { "2" } eleva o mínimo de embarcações assinaladas para { "5" }, o mínimo de publicação, de modo que uma classificação <c1/> nunca assenta em menos embarcações do que o número abaixo do qual as contagens são retidas. Isto torna o método mais restritivo e nenhum ficheiro da versão { "1" } foi publicado.

# text
seg-25593339aeb0 = <b>Causas conhecidas de falsos positivos</b>, que a regra da parcela e os limiares reduzem mas não eliminam: embarcações em rios, canais e portos próximos de uma linha de costa grosseira (a margem de { "2" } km para o interior existe por este motivo); duas embarcações que partilham um identificador, o que parece saltos; transponders com uma posição errada ou equipamento de ensaio; e a permanência em torno de uma zona por barcos de pilotos e de busca, que pode assemelhar-se a círculos. Um ficheiro de linha de costa de { "1" }:{ "10" } milhões tem uma exatidão de cerca de um quilómetro.

# text
seg-ac661440a29a = Os detetores de saltos e de velocidade comparam relatos dentro de um ficheiro de entrada; uma trajetória dividida por vários ficheiros ou dias não é reunida.

# text
seg-05f789b26904 = <b>Memória.</b> A entrada é lida linha a linha e nunca mantida por inteiro. O ADS-B guarda apenas contadores por aeronave e por célula. O AIS guarda cada relato aceite num registo compacto (cerca de { "40" } bytes) até o seu dia ser avaliado, pelo que a memória cresce com o número de relatos AIS na entrada; divida por dia uma entrada AIS muito grande.

# text
seg-206c78a69ded = Exposição de rota

# text
# c1: --route
# c2: lat,lon
# c3: --map
seg-0d8832796ab7 = <c1/> é um GeoJSON LineString (isolado, num Feature ou num FeatureCollection) ou um CSV de linhas <c2/>. <c3/> aceita ficheiros de mapa ou diretórios com eles, e pode ser repetido. Os pontos de passagem são unidos por linhas retas em latitude e longitude, pelo que se devem densificar os troços longos; um troço toma o caminho mais curto em longitude, pelo que um que atravesse o antimeridiano ({ "179.5" } E a { "179.5" } W) o atravessa. A rota é dividida em segmentos de cerca de { "250" } m. Cada segmento é medido entre os seus dois extremos numa esfera de raio { "6371.0088" } km (o mesmo caminho que decide em que célula se encontra) e atribuído à célula que contém o seu ponto médio.

# text
# c1: share_degraded
# c2: share_not_degraded
# c3: share_unassessed
# c4: share_not_observed
seg-cc5e2553700b = Por dia e por fonte, o relatório dá o comprimento da rota e quatro parcelas cuja soma é { "1" }: <c1/>, <c2/>, <c3/> (célula presente mas sem classificação) e <c4/> (célula ausente do mapa). Leia as duas últimas juntamente com a primeira: uma rota com uma parcela degradada baixa e uma parcela não observada elevada não foi demonstrada como livre. As linhas ADS-B e AIS são comunicadas em separado e nunca combinadas. Cada linha inclui a licença e a atribuição do mapa.

# text
seg-3a087d90e317 = Funções da biblioteca

# text
# c1: kshana::interference_map::api
seg-67ea1ff00bb8 = Para quem tem dados em memória (ligações, o servidor MCP, a versão de navegador), o módulo <c1/> expõe os mesmos métodos com texto ou bytes à entrada e JSON à saída, sem tocar em nenhum ficheiro nem na rede:

# text
seg-4dbf41c0ec3b = Função

# text
seg-95f87a38a522 = Entrada

# text
seg-0fe8ff25f4a1 = Saída

# text
seg-9e99af2c1f84 = texto CSV ADS-B

# text
seg-e144f449c5b4 = uma fatia de bytes por ficheiro de rasto do readsb (gzip ou simples)

# text
seg-7effd7110c4c = texto CSV AIS, texto GeoJSON de terra opcional

# text
# c1: YYYY-MM-DD
seg-10c5e0c0a9c8 = texto da rota, textos GeoJSON de mapas, limites <c1/> opcionais

# text
# c1: kshana-route-exposure/v1
seg-be00d23d96e9 = JSON <c1/>

# text
# c1: DayMap
# c2: file_name
# c3: <source>-<dataset>-<date>.geojson
# c4: date
# c5: geojson
# c6: DatasetSpec
# c7: Preset("adsb-lol" | "noaa-marinecadastre" | "kystverket")
# c8: Custom { licence, licence_url, attribution }
# c9: DEFAULT_CELL_DEG
# c10: MapError
seg-20a842d675c2 = Um <c1/> tem <c2/> (<c3/>), <c4/> e <c5/> (o documento v1). <c6/> é <c7/> ou <c8/>; <c9/> é { "0.5" }. Os erros são <c10/>. As regras do conjunto de dados (predefinições aceites, texto de licença obrigatório, o tipo tem de coincidir) aplicam-se exatamente como na linha de comandos.

# text
seg-1195686de09b = Validação externa

# text
# c1: tests/interference_map_reference.rs
# c2: tests/fixtures/interference_map_ref/PREREGISTRATION.md
# c3: scripts/gen_interference_map_ref.py
seg-0de37085f544 = <c1/> compara o Kshana com implementações independentes sobre entradas sintéticas, com tolerâncias pré-registadas em <c2/>: os significados dos códigos NIC e NACp face à descodificação por pyModeS de tramas ADS-B sintéticas, os valores "não disponível" do AIS face à descodificação por pyais de frases AIVDM sintéticas, a atribuição de células da grelha face ao shapely, o comprimento da rota por estado de célula face ao shapely e ao GeographicLib, e o mascaramento em terra face ao shapely e ao pyproj. Os dados de teste são produzidos por <c3/>; a CI não precisa de Python. Isto valida a forma como os códigos e os valores dos campos são lidos e a geometria. Não valida que uma célula assinalada seja interferência.

# text
# c1: src/interference_map/
# c2: tests/interference_map_cli.rs
seg-56a3e955cbcc = Todos os testes usam dados sintéticos gerados e nenhuma rede: testes unitários em <c1/>, e <c2/> para os comandos de ponta a ponta, incluindo que nenhum identificador chega a uma saída e que as recusas não deixam ficheiros para trás.

# text
seg-212c43d1a41c = <s1>Anterior</s1>Fluxos de treino NMEA

# text
seg-7f13ee5d254e = <s1>Seguinte</s1>Mapa de interferência: fontes de dados e licenças

# text
seg-1fc1794d9388 = Método ADS-B (kshana-interference-map/adsb/v2)

# text
seg-a3a97ab49ed1 = Método AIS (kshana-interference-map/ais/v2)

# text
# c1: interference-map locate
seg-e3949a1e6082 = Região do emissor (<c1/>)

# attr:title
seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

# text
# c1: kshana interference-map locate
# c2: VM-bc70cb57
# c3: emitter-region/PREREGISTRATION.md
seg-4fc5a1dcc963 = <c1/> estima <b>onde pode estar uma fonte de interferência</b> a partir dos mesmos relatos abertos ADS-B ou AIS: uma região em níveis de confiança declarados, um centroide com uma elipse de incerteza e as sessões no tempo. Nunca devolve um ponto isolado. <b>MODELLED</b> (linha <c2/> do registo): a física é a linha de vista de rádio dos manuais, a credibilidade das regiões depende do modelo, e a única verificação externa é a comparação com o Jammertest fixada antecipadamente em <s1><c3/></s1>. A publicação de regiões de emissores no observatório público é uma decisão separada do responsável e está <b>desativada</b>: o observatório não lê este módulo, e um teste fixa-o.

# text
# c1: --levels 0.5,0.9,0.95
# c2: --cell-km
# c3: --session-gap-min
# c4: --emitter-height-m min,max
# c5: --ship-height-m
# c6: --tdoa fix.json
seg-194d573cb817 = Opções: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> (AIS), <c6/> (fundir uma solução TDOA; abaixo). Qualquer opção que difira do valor fixado antecipadamente é anunciada como "não é o método fixado antecipadamente". Os ficheiros nunca são substituídos.

# text
seg-5767c749117a = <b>Modelo.</b> Os relatos são agrupados em <em>unidades</em> (uma aeronave ou embarcação num intervalo de 2 minutos), cada uma <em>afetada</em> (ADS-B: pelo menos metade dos seus relatos tem NIC ou NACp baixo pela regra do próprio mapa; AIS: uma velocidade ou salto implausível, ou uma posição no interior do continente face à linha de costa) ou não. Uma aeronave ou embarcação só conta com pelo menos { "5" } bons relatos na entrada (a mesma proteção de linha de base de equipamento do mapa). As unidades afetadas são agrupadas em <em>sessões</em>: um intervalo de mais de { "30" } minutos separa no tempo e, dentro de um agrupamento no tempo, duas unidades pertencem ao mesmo grupo quando um único emissor poderia estar ao alcance de ambas. Para uma sessão, cada posição candidata numa grelha recebe uma verossimilhança:

# text
# c1: h
# c2: h_e
# c3: 4.122 (sqrt h + sqrt h_e)
# c4: h_e
seg-0e3abeb21526 = <b>Linha de vista.</b> Uma aeronave à altura <c1/> e uma antena de emissor em <c2/> veem-se mutuamente até <c3/> km num raio terrestre de 4/3. <c4/> é marginalizada sobre { "2" } a { "100" } m ({ "8" } valores espaçados logaritmicamente).

# text
seg-75f5afea310e = <b>Potência.</b> A potência do emissor é desconhecida, portanto um alcance efetivo de { "12" } km a { "426" } km (em passos de { "1.25" }) ou "apenas linha de vista" limita o alcance, marginalizado com peso igual. O limite do alcance é suave: uma unidade conta como ao alcance com um peso que cai linearmente ao longo de { "15" }% do alcance de cada lado (pelo menos três quartos de uma célula da grelha), porque o terreno, o diagrama da antena e o trajeto não são conhecidos com precisão melhor do que essa.

# text
seg-ff9cf5fc9fbe = <b>Afetadas e não afetadas.</b> Uma aeronave ou embarcação é <em>suscetível</em> com probabilidade { "0.6" } (o equipamento recetor, a antena e o trajeto do sinal diferem), uma unidade de uma suscetível dentro do alcance é afetada com probabilidade { "0.9" }, e qualquer outra unidade é afetada com a probabilidade de fundo { "0.03" } (outras causas). A suscetibilidade é uma propriedade latente da aeronave, somada por aeronave, assim como uma falha persistente de equipamento (probabilidade { "0.03" }: todas as unidades dessa aeronave são afetadas onde quer que ela esteja), o que impede que um transponder defeituoso arraste a região. Assim, uma aeronave <b>afetada</b> puxa a posterior para posições que a alcançam, e uma <b>aeronave não afetada com linha de vista</b> empurra contra posições que a teriam alcançado no máximo com o peso de uma aeronave, por mais relatos que tenha enviado, enquanto uma aeronave não afetada sem linha de vista nada diz.

# text
seg-51e09cf3944c = <b>Sem terreno.</b> O terreno, a formação de condutas e a difração não são modelados (o terreno só pode remover a linha de vista).

# text
# c1: docs/emitter-region/PREREGISTRATION.md
seg-b966c198786a = <b>Atenuação.</b> O logaritmo da verossimilhança é multiplicado por { "0.3" } (uma posterior de potência). A evidência do modelo é mais dependente e os seus extremos menos nítidos do que a independência que a verossimilhança supõe, e em dados sintéticos com essas falhas as regiões sem atenuação continham a fonte verdadeira em proporção bem inferior à declarada; { "0.3" } foi escolhido apenas com dados sintéticos (a derivação está em <c1/>, secção { "8" }).

# text
# c1: unconstrained
seg-4488bddfd8da = A posterior fornece <b>regiões de maior densidade</b> nos níveis declarados (aninhadas; polígonos com furos quando necessário), o <b>centroide</b> ponderado pela posterior e a sua <b>elipse de momentos</b> (escalada a { "95" }% sob uma gaussiana; os polígonos, e não a elipse, são os níveis calibrados). A grelha é grosseira (cerca de { "5" } a { "10" } km) sobre todo o domínio e toda célula grosseira que contém massa é dividida { "4" } por { "4" }. O <b>enviesamento de cobertura</b> é tratado condicionando a onde existem relatos: uma região é larga onde havia poucas aeronaves, e uma sessão cuja região de { "95" }% ocupa mais de { "80" }% de do seu domínio de busca é informada como <c1/> sem centroide.

# text
# c1: 5
# c2: null
seg-2ee93e45c01e = <b>Sessões e perfil.</b> Cada sessão publicada tem início, fim, duração, a área das células de 0,5 grau que contêm uma unidade afetada e pelo menos { "5" } aeronaves ou embarcações distintas, as contagens de afetadas e observadas distintas, e a contraevidência (distintas não afetadas com linha de vista ao centroide; retida abaixo de { "5" }). Uma sessão com menos de <c1/> aeronaves ou embarcações afetadas distintas é retida e contada. O perfil fornece, por hora UTC do dia, as aeronaves afetadas distintas (<c2/> abaixo de { "5" }) e os minutos de tempo de sessão, e as horas de tempo de sessão por dia UTC.

# text
seg-857aad210cde = Fusão TDOA opcional.

# text
# c1: --tdoa fix.json
# c2: {"receivers": [[lat, lon, height_m], ...], "tdoa_s": [...], "sigma_s": 1e-7, "start": [lat, lon]}
# c3: tdoa_s[i]
# c4: i+1
# c5: geolocation::tdoa_predict
# c6: geolocation::tdoa_crlb_on_sphere
seg-fcfc554b4f3d = <c1/> recebe <c2/> (pelo menos três recetores; <c3/> é o recetor <c4/> menos o recetor { "0" }). A posição é resolvida na superfície da Terra por Gauss-Newton sobre <c5/>, a sua covariância é <c6/>, e a gaussiana é multiplicada na posterior. O limite de Cramer-Rao é um limite inferior sobre um modelo, não uma precisão medida.

# text
# c1: emitter-<source>-<dataset>-<day>
# c2: .geojson
# c3: -summary.json
# c4: -sessions.csv
# c5: -figure.svg
# c6: kshana-interference-map/emitter-region/v1
# c7: # evidence
# c8: evidence
# c9: examples/emitter-region/
# c10: regenerate.sh
seg-55c1c9c80601 = <b>Saídas</b> (<c1/>): <c2/> (região MultiPolygon por nível e sessão, o polígono da elipse, o ponto do centroide que leva a respetiva elipse), <c3/>, <c4/>, <c5/>. Cada uma incorpora a licença do conjunto de dados, a URL da licença e a atribuição, o id do método <c6/>, todos os parâmetros, as hipóteses e os limites, e traz a sua <b>etiqueta de evidência</b> (nível MODELLED, ids das linhas do registo; a faixa sob a figura, linhas <c7/> na tabela, um membro <c8/> no JSON). Os ficheiros de máquina são em inglês qualquer que seja o idioma; o texto da figura e as linhas da linha de comandos são localizados. Há um exemplo sintético em <c9/> (<c10/>).

# text
# c1: null
seg-7f93e7987855 = <b>Privacidade e formulação.</b> Nenhum identificador de aeronave ou embarcação aparece em qualquer saída; nenhuma posição de relato é desenhada; uma sessão precisa de pelo menos { "5" } aeronaves ou embarcações distintas; contagens abaixo de { "5" } são <c1/>. A formulação é neutra: "região estimada do emissor", "região da fonte de interferência". Uma região não é a posição de ninguém, não é uma constatação da causa e nada diz sobre quem ou o que está por trás de uma fonte; o teste de formulação ampliado verifica nas saídas as palavras de atores, intenção e conflito.

# text
# c1: emitter-region/PREREGISTRATION.md
# c2: emitter-region/RESULTS.md
# c3: unconstrained
seg-5298b30a7857 = <b>Limites.</b> A credibilidade depende do modelo. Em dados sintéticos (um gerador que partilha o modelo, com extremos de alcance incertos em { "15" }% por aeronave, falhas persistentes de equipamento, potência desconhecida e altura de antena desconhecida) a região de { "95" }% continha a fonte verdadeira em { "0.99" } (geometria de aeronaves) e { "1.00" } (geometria de navios) das sessões e a região de { "50" }% em cerca de { "0.77" }: os níveis são conservadores, pelo expoente da verossimilhança de { "0.3" }, e o erro do centroide de uma sessão tem mediana de { "23" } km (aeronaves) e { "12" } km (navios). A calibração é verificada apenas com dados sintéticos; a comparação com o Jammertest foi fixada antecipadamente (<c1/>) e executada uma vez: NOT ASSESSABLE para as duas fontes (<c2/>). Uma fonte por sessão; várias fontes próximas parecem uma só. Uma causa regional (uma avaria de constelação, clima espacial) dá uma região que não é uma fonte. O ADS-B fornece poucos relatos fora do espaço aéreo movimentado, e apenas cerca de um quarto dos pontos de rasto do readsb traz NIC e NACp, de modo que áreas esparsas dão regiões largas ou nenhuma ({ "31" }% das sessões de geometria de navios foram <c3/>).

# text
seg-d8eb178ef226 = Região do emissor (interference-map locate)
