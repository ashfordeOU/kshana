# docs--interference-map: translations (pt-BR)

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
seg-143c73287d6c = <c1/> constrói um retrato diário de onde aeronaves e navios informaram dados de navegação degradados, a partir de arquivos de rastreamento com licença aberta que você fornece. <c2/> informa então quanto de uma rota planejada ficou dentro das células afetadas em cada dia.

# text
seg-158f33f95ec3 = O que isto é: uma descrição de como eram os relatórios de posição publicados em dias passados. O que não é: uma medição de qualquer receptor, uma previsão ou prova de interferência. Uma célula degradada ou anômala tem várias causas possíveis (listadas abaixo), e uma célula sem entrada simplesmente não foi observada.

# text
seg-64d3ee269407 = Tudo roda em arquivos locais. Os comandos padrão nunca abrem uma conexão de rede; o único auxiliar de download opcional exige uma flag explícita.

# attr:alt
seg-e251b385ff46 = Dois dias sintéticos de mapa de interferência, desenhados a partir das amostras versionadas em examples/interference-map/output, cada um com a sua própria rota sintética e as parcelas de exposição de rota que o motor informa. À esquerda, um dia de ADS-B: { "1" } célula degradada, { "6" } não degradadas, { "4" } não avaliadas (hachuradas) e células sem entrada, desenhadas vazias, que não foram observadas. A rota tem { "525" } km: { "11.5" }% do seu comprimento em células degradadas, { "38.3" }% não degradadas, { "9.1" }% não avaliadas e { "41.1" }% não observadas. À direita, um dia de AIS: células sinalizadas pelos detectores de círculo e de terra firme, células não anômalas e células vazias; a rota tem { "454" } km, com { "10.5" }% em células anômalas, { "21.2" }% não anômalas, { "0.0" }% não avaliadas e { "68.3" }% não observadas. ADS-B e AIS são camadas separadas, nunca combinadas. Uma célula sinalizada não é uma constatação de interferência, e uma célula sem cor não foi observada, o que não é o mesmo que livre. Todos os dados são inventados, no Atlântico central aberto, e não são uma medição.

# text
# c1: examples/interference-map/output/
# c2: examples/interference-map/input/
# c3: kshana route-exposure
seg-765f43228dc6 = Os dois dias são as amostras sintéticas em <c1/>, cada uma com uma rota sintética em <c2/>; as parcelas de exposição de rota são o que <c3/> imprime para elas. Nada nelas é um lugar, uma aeronave ou uma embarcação reais.

# text
seg-228f39c0305b = Dados e licenças

# text
# c1: data/INTERFERENCE-DATA-SOURCES.md
# c2: --dataset
seg-d3336cc18ff7 = Apenas as fontes revisadas em <a1><c1/></a1> estão embutidas, selecionadas com <c2/>:

# text
seg-b03d56f501c3 = Tipo

# text
seg-2328672e782f = Campo de licença da saída

# text
seg-2319c7a6f6e2 = ODbL { "1.0" }

# text
seg-7464d3c830f3 = AIS

# text
seg-c13f76567536 = Domínio público dos EUA (CC0 { "1.0" } segundo o publicador)

# text
seg-636c2bb6f29d = domínio público

# text
seg-f6f4e431d36d = NLOD { "2.0" }

# text
seg-5621e3a3908f = qualquer um

# text
seg-6b3a1f8ca649 = o que você declarar

# text
# c1: --licence
# c2: --licence-url
# c3: --attribution
seg-be349e2c455f = <c1/>, <c2/>, <c3/> obrigatórios

# text
seg-590344d1eae5 = Cada arquivo de saída incorpora a licença, o URL da licença, a atribuição exigida e os limites de cobertura da fonte. Não há entrada embutida para fontes cujos termos proíbem o uso comercial ou a redistribuição de mapas derivados.

# text
# c1: licence
seg-2d8eaefab0f8 = <b>ODbL e edições do Kshana.</b> Um arquivo de ADS-B por célula feito a partir de dados do adsb.lol é um Derived Database e é lançado sob a ODbL { "1.0" }; o seu campo <c1/> diz isso. O código do próprio Kshana continua AGPL-3.0. As edições comerciais do Kshana que gravam esses arquivos levam o mesmo aviso, e quem republicar o arquivo deve mantê-lo. Os resultados de ADS-B e de AIS nunca são combinados em um único arquivo, de modo que a ODbL não se aplica à camada de AIS.

# text
seg-bb4932d5d15c = <b>Viés de cobertura.</b> Os mapas herdam a cobertura de sua fonte. O adsb.lol segue receptores voluntários, de modo que o mar aberto e as regiões pouco cobertas ficam esparsos. Os dados abertos do Kystverket omitem embarcações pesqueiras com menos de { "15" } m e embarcações de recreio com menos de { "45" } m, de modo que seu mapa reflete navios maiores. O MarineCadastre cobre apenas águas dos EUA.

# text
seg-713babc3963b = <b>Identificadores.</b> As linhas de entrada trazem um identificador de aeronave ou de embarcação. Ele passa por hash em memória com um sal aleatório por execução, é usado apenas para contar aeronaves ou embarcações distintas e nunca é gravado, registrado em log nem impresso. As saídas são agregadas: nenhum identificador aparece em lugar algum delas.

# text
# c1: 5
# c2: null
seg-fa3c70a8997a = <b>Supressão.</b> Uma célula com menos de <c1/> aeronaves ou embarcações distintas observadas naquele dia não é publicada de forma alguma e, para AIS, uma contagem sinalizada de um ou dois em uma célula publicada é informada como <c2/>. Nenhum valor publicado pode individualizar uma aeronave ou uma embarcação.

# text
seg-02dbfcb9c808 = Formatos de entrada

# text
# c1: YYYY-MM-DDTHH:MM:SS[.fff]Z
seg-2f291f986a87 = CSV simples com linha de cabeçalho, separado por vírgulas, sem aspas, horários em UTC. A ordem das colunas é livre; colunas desconhecidas são ignoradas. Um carimbo de data e hora é em segundos Unix ou <c1/>. As linhas que não podem ser analisadas são contadas nos metadados da saída, não descartadas silenciosamente.

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
seg-14ac5d0f109b = horário do relatório

# text
seg-6dbe5595d0be = identificador opaco (passa por hash, nunca é armazenado)

# text
seg-c5fb6b91dc68 = graus

# text
# c1: ground
seg-e283838c85aa = altitude em pés; <c1/> ou vazio exclui a linha

# text
seg-9ab90c35bd7d = pelo menos uma

# text
seg-868e5b9c00ab = inteiros de { "0" } a { "11" }; vazio significa não informado

# text
seg-db907db790b1 = não

# text
# c1: adsb
seg-5c2ce9f61700 = se presente, só são usados os valores que começam com <c1/> (MLAT, TIS-B e semelhantes são excluídos)

# text
# c1: tar -xf -
# c2: trace_full_*.json
seg-412f40b8eeb1 = <b>Histórico readsb do adsb.lol, lido diretamente.</b> Os arquivos diários são um tar dividido de arquivos de rastro do readsb. Extraia um como o publicador descreve (concatene as partes, <c1/>) e então forneça ao Kshana o diretório extraído, um único arquivo <c2/> ou um CSV:

# text
# c1: trace_full_*
# c2: trace_recent_*
# c3: .json
# c4: ground
# c5: nic
# c6: nac_p
# c7: trace_files_unreadable
seg-6e7d378bd89b = Um diretório é pesquisado recursivamente em busca de arquivos <c1/> (outros arquivos, como <c2/>, são ignorados e links simbólicos não são seguidos). Cada arquivo é compactado em gzip ou é JSON simples, detectado pelos seus primeiros bytes, porque o readsb grava gzip sob um nome <c3/>; a descompressão é limitada a { "512" } MiB por arquivo. De cada entrada de rastro, o Kshana lê o deslocamento de tempo, a latitude, a longitude, a altitude (o marcador <c4/> exclui a entrada), os campos <c5/> e <c6/> do objeto de detalhes da aeronave e a cadeia de fonte da posição (entradas de qualquer fonte que não seja ADS-B são excluídas). Uma entrada sem objeto de detalhes não tem campos de precisão e é contada como excluída. Um arquivo que não pode ser lido é contado em <c7/> nos metadados da saída e ignorado.

# text
# c1: kshana interference-map ais
seg-b1502f7f4c98 = AIS (<c1/>):

# text
seg-91395984ddac = graus; os valores "não disponível" do AIS e ({ "0" }, { "0" }) são descartados

# text
seg-34ae94eb1797 = velocidade sobre o fundo em nós; { "102.3" } (não disponível) é tratado como ausente

# text
# c1: --land
# c2: --land
seg-a1e60af5adaa = O detector de terra firme precisa de um arquivo de polígonos de terra (<c1/>): GeoJSON Polygon ou MultiPolygon. A camada de terra do Natural Earth de { "1" }:{ "10" } milhões (domínio público) é o arquivo pretendido. Sem <c2/>, o detector fica desligado e a saída informa isso. Para baixá-lo (o único acesso à rede neste recurso):

# text
# c1: curl
# c2: curl
seg-cd55a09894c5 = Isto executa o <c1/> do sistema (como lista de argumentos, não por meio de um shell) por HTTPS, uma vez, para um arquivo em um endereço fixo que nomeia um único commit do repositório de origem. O download só é mantido se o seu SHA-256 for igual ao valor fixado no código; uma divergência o exclui e falha. Se o <c2/> não estiver instalado, o comando informa isso e fornece o endereço e a soma de verificação para que o arquivo possa ser obtido manualmente. Nada é incluído no repositório.

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
seg-95eeaa0033b3 = Um arquivo GeoJSON por fonte por dia UTC, no diretório <c1/>, com o nome <c2/>, em que <c3/> é <c4/> ou <c5/>, <c6/> é a chave <c7/> (<c8/>, <c9/>, <c10/> ou <c11/>) e a data é o dia UTC dos relatórios: <c12/>, <c13/>. O conjunto de dados está no nome para que dois conjuntos do mesmo tipo não possam compartilhar um arquivo, e <b>o Kshana nunca sobrescreve um arquivo</b>: se qualquer destino existir, o comando falha antes de gravar qualquer coisa. A CLI imprime uma linha por arquivo gravado. Um leitor pode recuperar as três partes com <c14/>; a mesma informação está dentro do arquivo (<c15/>, <c16/>, <c17/>). Arquivos de amostra sintéticos, um por fonte, estão em <c18/>, com o comando que os regenera, para construir e testar um visualizador. Um membro de nível superior <c19/> contém o nome do esquema, a data, a grade, o id do método e todos os parâmetros, as figuras do nível do dia, a licença e a atribuição dos dados e um aviso. Cada feature é um polígono de célula com <c20/>, <c21/>, <c22/>, <c23/> e as contagens agregadas.

# text
# c1: --cell-deg
# c2: --cell-deg
# c3: grid.preregistered_cell_deg
# c4: grid.is_preregistered
seg-1ee702004726 = A grade é fixa: células quadradas de <c1/> graus (padrão { "0.5" }) em latitude e longitude, indexadas a partir de (-90, -180). A largura leste-oeste diminui com a latitude: cerca de { "55" } km no equador e cerca de { "28" } km a { "60" } graus para o padrão. A latitude { "90" } pertence à última linha e a longitude { "180" } é o mesmo meridiano que -180. <b>Os métodos pré-registrados são definidos na grade de { "0.5" } grau.</b> Outro <c2/> executa, mas não é o método pré-registrado: a CLI informa isso, e o arquivo registra <c3/> e <c4/> (false) para que um visualizador também possa dizê-lo.

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
seg-6e1e8f2a9082 = <b>Contagens retidas.</b> Toda contagem por célula abaixo do mínimo de publicação ({ "5" }) é <c1/>, inclusive o zero, de modo que <c2/> nunca significa "nenhum" e nenhum número publicado pode individualizar uma aeronave ou uma embarcação. Os campos <c3/> e <c4/> continuam sendo fornecidos. Nos arquivos de ADS-B, <c5/> é sempre de pelo menos { "5" } para uma célula publicada; <c6/> e <c7/> são <c8/> abaixo de { "5" }, e <c9/> é <c10/> a menos que ambos sejam de pelo menos { "5" } (uma parcela revelaria uma contagem retida). Nos arquivos de AIS, cada entrada de <c11/> é <c12/> abaixo de { "5" }.

# text
seg-fd929d6ee90b = Versão do formato e campos

# text
# c1: schema: "kshana-interference-map/v1"
# c2: format_version: 1
# c3: null
seg-ff443e9cbd20 = O formato está estabelecido como <c1/>, <c2/>. Uma mudança que remove ou renomeia um campo, ou altera o que um campo significa, aumenta a versão; acrescentar um campo não aumenta, de modo que um leitor deve ignorar campos que não conhece. Uma contagem que é <c3/> está retida, não é zero.

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
seg-60818bfc3f90 = Valores de <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> é verdadeiro apenas para <c10/> e <c11/>. O relatório de exposição de rota tem seu próprio esquema <c12/>.

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
seg-e33f63fe5c0a = <c1/> transforma um dia UTC de relatórios de ADS-B nos três arquivos do observatório (GeoJSON, PNG e um JSON de relatório de incidente) e em um manifesto de hashes, e <c2/> reexecuta esse dia sob alterações de um parâmetro por vez dos parâmetros pré-registrados. O comando impõe as regras de lançamento: pelo menos { "24" } h depois do fim do dia (<c3/> só pode ser aumentado), células de { "0.5" } grau ou mais grossas, apenas três estados (<c4/>, <c5/>, <c6/>), nenhuma causa atribuída e nenhum dado do OpenSky. A nota de método, os formatos de arquivo e os limites estão em <a1><c7/></a1>. Uma execução regional (<c8/>) lê apenas os relatórios da caixa e informa isso no arquivo.

# text
seg-31ce42fc05dc = Especificação da página de mapa do Studio

# text
seg-a9aca2e2d390 = Para a página de mapa do Studio, que carrega um arquivo GeoJSON fornecido pelo usuário (a página é construída no código-fonte do Studio, não neste repositório). Nada é enviado: o arquivo é lido no navegador, e a página não faz nenhuma requisição a qualquer fonte de dados.

# text
# c1: kshana_interference_map.schema
# c2: kshana-interference-map/
# c3: format_version
seg-064ec5d4c91a = <b>Leitura de um arquivo.</b> Aceite um arquivo apenas se <c1/> começar com <c2/> e <c3/> for um número que a página suporta; caso contrário, informe que o arquivo não é um mapa de interferência do Kshana suportado. Leia os campos listados acima; ignore os desconhecidos. Um arquivo contém uma fonte e um dia. Vários arquivos podem ser carregados.

# text
# c1: status
seg-5be32f8cff46 = <b>Células.</b> Desenhe o polígono de cada feature. Colora por <c1/> e sempre diga o que cada cor significa em uma legenda. Quatro estados, nenhum dos quais pode ser ocultado ou mesclado:

# text
seg-b652b86e6b8e = Estado

# text
seg-4a511b6a03e3 = De onde vem

# text
seg-f92da2236260 = Degradada (ou anômala, para AIS)

# text
seg-591ebe8007cb = uma parcela alta das aeronaves informou baixa precisão, ou as embarcações apresentaram anomalias, naquele dia

# text
# c1: degraded
seg-bd993c64b6e8 = <c1/> é verdadeiro

# text
seg-88d43eb1c14a = Livre

# text
seg-af5f7989fd09 = observada com aeronaves ou embarcações suficientes e não sinalizada

# text
# c1: status
# c2: not_degraded
# c3: not_anomalous
seg-2bc810e02210 = <c1/> é <c2/> ou <c3/>

# text
seg-d894eaa21369 = Não avaliada

# text
seg-38c88ed94111 = observada, mas sem aeronaves amostradas suficientes, o dia foi confundido ou o fundo do dia não pôde ser estimado

# text
# c1: status
# c2: insufficient_sample
# c3: withheld_day_confounded
# c4: withheld_no_background
seg-e358a8c7903f = <c1/> é <c2/>, <c3/> ou <c4/>

# text
seg-013b7c903426 = Não observada

# text
seg-81bcffa57ec2 = aeronaves ou embarcações em número insuficiente, de modo que a célula não foi publicada

# text
seg-6828d71822bd = nenhuma feature para essa célula

# text
# c1: properties
# c2: null
# c3: grid.is_preregistered
seg-753192a770ac = "Não observada" é a ausência de uma feature: desenhe-a de forma neutra (sem preenchimento, ou com hachura), nunca na cor de "livre". Use um esquema de cores que não dependa apenas de vermelho contra verde. Os detalhes da célula ao passar o mouse ou ao selecionar mostram as contagens de <c1/> como fornecidas e toda contagem <c2/> como "retida (menos de { "5" })", nunca como zero. Um visualizador também deve informar, quando <c3/> for false, que o arquivo usa um tamanho de célula fora do método pré-registrado.

# text
seg-e90fedf7ad89 = <b>Camadas.</b> ADS-B e AIS são camadas separadas, com seus próprios controles, legendas e linhas de licença. Nunca as mescle em um único campo de cor ou em uma única contagem, nunca as desenhe como uma célula combinada e nunca some suas células. Dias diferentes são arquivos diferentes: mostre um dia por vez, com um seletor de dia, em vez de sobrepor dias.

# text
# c1: data.attribution
# c2: data.licence
# c3: data.licence_url
# c4: data.coverage_notes
seg-6d500d3c0baa = <b>Licença e atribuição.</b> Para cada camada visível, mostre, no mapa e em qualquer exportação ou captura de tela, o texto de <c1/> literalmente, o <c2/> com um link para <c3/> e o <c4/>. Se uma camada de ADS-B for mostrada, a sua licença ODbL se aplica apenas a essa camada. Não ofereça a exportação de um arquivo combinado.

# text
# c1: method.id
# c2: method.parameters
# c3: day
# c4: day_confounded
# c5: input_stats
seg-6f786153ef8e = <b>Método.</b> Ofereça o id e os parâmetros do método (<c1/>, <c2/>) e as figuras de <c3/> em um painel de detalhes, incluindo <c4/> (diga claramente que nenhuma célula foi considerada degradada por causa do fundo do dia) e <c5/>.

# text
# c1: method.caveats
# c2: notice
seg-905348837439 = <b>Ressalvas a manter</b> (mostre os próprios <c1/> e <c2/> do arquivo e mantenha esta redação, ou o seu equivalente, visível junto ao mapa):

# text
seg-1f70e308010a = Uma célula degradada ou anômala não é uma constatação de interferência. Existem outras causas.

# text
seg-7cde0ddadb73 = Uma célula sem cor não foi observada. Isso não é evidência de que a área estava livre.

# text
seg-1135dfeadb8f = Esta é uma descrição de relatórios de posição passados, não uma previsão e não uma medição de qualquer receptor.

# text
seg-3ad1216bf3ed = A cobertura segue a fonte de dados; leia as notas de cobertura.

# text
seg-046f6af48349 = A página não deve nomear nem mostrar nenhuma aeronave ou embarcação individual, e os arquivos não contêm nenhuma.

# text
# c1: kshana-route-exposure/v1
# c2: caveats
# c3: map_licence
# c4: map_attribution
seg-ae79b67c3b98 = <b>Exposição de rota.</b> Se a página também carregar um relatório <c1/>, mostre suas linhas por dia e fonte com as quatro parcelas (degradada, livre, não avaliada, não observada) em conjunto, nunca apenas a parcela degradada, além dos <c2/> do relatório e do <c3/> e do <c4/> de cada linha.

# text
# c1: kshana-interference-map/adsb/v2
seg-98131acf49d8 = Método de ADS-B (<c1/>)

# text
seg-83b660b0bfa6 = Cada relatório ADS-B em voo traz dois campos de qualidade de navegação autoavaliados: NIC (o raio de contenção da posição) e NACp (o limite de precisão de { "95" }%, EPU). Quando o receptor a bordo perde ou deixa de confiar na sua posição por satélite, ambos caem, e é por isso que carregam uma assinatura de interferência. Eles também caem por outros motivos.

# text
seg-4b9020a68db6 = <b>Parâmetros pré-registrados</b> (constantes no código, gravadas em cada arquivo; uma mudança significa uma nova versão do método):

# text
seg-e73ea9921fcf = Parâmetro

# text
seg-8650fa804f14 = Piso de altitude

# text
seg-25056ee5a36c = altitude barométrica de pelo menos { "5000" } ft

# text
seg-17322eff480a = Relatório de baixa precisão

# text
seg-48ab6ed5eedd = NACp no máximo { "6" } (o limite de EPU informado é { "556" } m, { "0.3" } NM, ou maior, ou desconhecido) ou NIC no máximo { "5" } (o limite do raio de contenção informado é { "1852" } m, { "1" } NM, ou maior, ou desconhecido)

# text
seg-84beb488319d = Bom relatório

# text
seg-2595055d9593 = NACp de pelo menos { "8" } e NIC de pelo menos { "7" }; avaliados nos campos que a entrada tem (ambos quando ambos estão presentes, o que estiver presente caso contrário)

# text
seg-b4bbce695b2d = Linha de base do equipamento

# text
seg-4986ed51f600 = uma aeronave só conta em uma célula com pelo menos { "5" } bons relatórios fora dessa célula no mesmo dia

# text
seg-42859d1d785b = Aeronaves amostradas em uma célula

# text
seg-1ae26d6d99a9 = pelo menos { "3" } relatórios na célula

# text
seg-48bba15e2e0e = Aeronaves afetadas em uma célula

# text
seg-1fe9c3ab930c = pelo menos { "50" }% dos seus relatórios na célula são de baixa precisão

# text
seg-b147473d133c = Amostra mínima

# text
seg-33060cda8536 = pelo menos { "10" } aeronaves amostradas

# text
seg-009ca23b9cd6 = Degradada

# text
seg-afef85ae2a25 = pelo menos { "5" } aeronaves afetadas, uma parcela afetada das aeronaves amostradas de pelo menos { "0.30" } e pelo menos { "0.15" } acima da parcela mediana das células do dia

# text
seg-890dcc56fa5c = Dia confundido

# text
seg-b27768e64d62 = parcela mediana das células (sobre pelo menos { "5" } células com amostra completa) de pelo menos { "0.15" }: nenhuma célula é declarada degradada

# text
seg-18fbf3c348c9 = Sem fundo

# text
# c1: withheld_no_background
seg-534111e0c6ad = menos de { "5" } células com amostra completa, de modo que a mediana não pode ser estimada: uma célula que atinge os limiares é <c1/>, não degradada

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
seg-f36389caf81b = Esses valores foram definidos a partir das definições dos códigos NIC e NACp e da regra de privacidade, antes de qualquer dado ser examinado. Não foram ajustados com dados reais, e os testes usam apenas dados sintéticos. Estados das células: <c1/>, <c2/>, <c3/> (publicada, mas com menos de { "10" } aeronaves amostradas), <c4/> e <c5/>.

# text
# c1: withheld_no_background
seg-c89afc07989b = <b>Versão { "2" }.</b> A versão { "1" } declarava uma célula degradada com apenas { "3" } aeronaves afetadas, menos do que o mínimo de publicação de 5 aeronaves, e pulava a verificação do fundo do dia, sem avisar, quando menos de { "5" } células eram totalmente amostradas. A versão { "2" } exige pelo menos { "5" } aeronaves afetadas e retém a classificação (<c1/>) quando o fundo não pode ser estimado. As duas mudanças tornam o método mais rigoroso (nada que não era degradado na versão { "1" } é degradado na versão { "2" }); o motivo é que uma classificação publicada nunca deve se apoiar em menos aeronaves do que o número abaixo do qual as contagens são retidas. Os arquivos da versão { "1" } não foram lançados.

# text
seg-ffd0e5175548 = Por que os campos de precisão caem por motivos que não são interferência, e a salvaguarda para cada um:

# text
seg-12b613a77f64 = Causa

# text
seg-e30479c3e5d8 = Salvaguarda

# text
seg-ecac3d226210 = Transponders mais antigos que nunca informam NIC ou NACp, ou os informam com um valor baixo fixo

# text
seg-8b504b60fcc0 = a linha de base do equipamento: uma aeronave sem bons relatórios em outros lugares naquele dia não é contada

# text
seg-1df45f128708 = Baixa altitude e operações em superfície (mascaramento pelo terreno, formatos de posição diferentes)

# text
# c1: ground
seg-cc5f23f0da05 = piso de altitude; linhas marcadas com <c1/> excluídas

# text
seg-ddf6aeb47dbe = MLAT ou outras posições que não são de GNSS

# text
# c1: source_type
seg-51162a1835d1 = filtro de <c1/> quando a coluna está presente

# text
seg-08196503a657 = Uma aeronave enviando muitos relatórios

# text
seg-bf13dfa85dbe = contam-se aeronaves distintas, não relatórios

# text
seg-bbcb809624bc = Uma interrupção de constelação ou de aumentação, ou um evento de clima espacial, que reduz a precisão em uma área ampla

# text
seg-5f428bb7ad4a = a célula deve exceder a parcela mediana das células do dia por uma margem, e um dia cuja mediana já é alta é marcado como confundido e não declara nenhuma célula

# text
seg-30290253a95d = Uma falha no equipamento de uma aeronave

# text
seg-b673195405ff = exige uma parcela de muitas aeronaves distintas, com uma amostra mínima

# text
seg-aeebeded71be = Poucas aeronaves na célula

# text
seg-c33c60b49b17 = amostra mínima; com menos de { "5" } observadas, a célula não é publicada

# text
seg-dc8abb9b411f = O que resta: o método não consegue distinguir interferência de uma causa regional que seja local e não ampla (um efeito local de geometria de satélites ou uma interrupção de aumentação terrestre pareceria igual), e é conservador em um sentido: uma aeronave que voa apenas dentro de uma região afetada o dia todo não tem linha de base e não é contada, de modo que áreas grandes e persistentes são subnotificadas.

# text
# c1: kshana-interference-map/ais/v2
seg-41d725eeaba9 = Método de AIS (<c1/>)

# text
# c1: anomalous
seg-7fd53079dccf = Por embarcação por dia, cinco detectores. Um detector <b>qualifica</b> em uma célula quando sinaliza pelo menos { "5" } embarcações distintas que representem pelo menos { "20" }% das embarcações observadas ali; a célula é <c1/> se algum detector qualificar.

# text
seg-6d599353e8e1 = Detector

# text
seg-551f38a9061c = Regra (pré-registrada)

# text
seg-295e8a28a5b9 = pelo menos { "3" } relatórios na célula a mais de { "2000" } m para o interior da linha de costa fornecida

# text
seg-fd21160e6685 = uma janela de { "20" } relatórios consecutivos (passo { "10" }, intervalos de no máximo { "30" } min) cujo raio médio em relação ao centroide é de { "500" } m a { "20" } km, coeficiente de variação do raio de no máximo { "0.15" }, um sentido de deslocamento com enrolamento total de pelo menos { "270" } graus (passos de no máximo { "90" } graus, líquido de pelo menos { "80" }% do total) e velocidade média de pelo menos { "2" } kn

# text
seg-1aa30db06794 = pelo menos { "2" } saltos chegando à célula: relatórios consecutivos separados por pelo menos { "1000" } m, com no máximo { "1" } h de intervalo, que implicam mais de { "70" } kn (a velocidade implícita usa pelo menos { "1" } s entre os relatórios; assim, dois relatórios com o mesmo carimbo de tempo e posições distantes { "1" } km ou mais contam como um salto)

# text
seg-7f9b22254009 = pelo menos { "3" } velocidades informadas acima de { "70" } kn na célula

# text
seg-e0d0968e8751 = pelo menos { "5" } embarcações distintas informando a mesma posição (arredondada a { "1e-4" } graus, cerca de { "11" } m) na mesma janela de 10 minutos

# text
# c1: null
seg-1bf4c460672c = Células com menos de { "5" } embarcações distintas não são publicadas; toda contagem sinalizada abaixo de { "5" }, inclusive o zero, é informada como <c1/>.

# text
# c1: anomalous
seg-b2ea2ec6bad1 = <b>Versão { "2" }.</b> A versão { "1" } qualificava um detector a partir de { "3" } embarcações sinalizadas e publicava contagens de { "3" } e { "4" }. A versão { "2" } eleva o mínimo de embarcações sinalizadas para { "5" }, o mínimo de publicação, de modo que uma classificação <c1/> nunca se apoie em menos embarcações do que o número abaixo do qual as contagens são retidas. Isso torna o método mais rigoroso, e nenhum arquivo da versão { "1" } foi lançado.

# text
seg-25593339aeb0 = <b>Causas conhecidas de falsos positivos</b>, que a regra de parcela e os limiares reduzem, mas não eliminam: embarcações em rios, canais e portos próximos de uma linha de costa grosseira (a margem de { "2" } km para o interior existe por isso); duas embarcações que compartilham um mesmo identificador, o que parece saltos; transponders com posição ruim ou equipamento de teste; e a permanência de lanchas de praticagem e embarcações de busca em uma área, que pode se parecer com círculos. Um arquivo de linha de costa em { "1" }:{ "10" } milhões é preciso a cerca de um quilômetro.

# text
seg-ac661440a29a = Os detectores de salto e de velocidade comparam relatórios dentro de um mesmo arquivo de entrada; uma trilha dividida entre arquivos ou dias não é unida.

# text
seg-05f789b26904 = <b>Memória.</b> A entrada é lida linha a linha e nunca mantida inteira. O ADS-B guarda apenas contadores por aeronave e por célula. O AIS guarda cada relatório aceito em um registro compacto (cerca de { "40" } bytes) até o seu dia ser avaliado, de modo que a memória cresce com o número de relatórios de AIS na entrada; divida por dia uma entrada de AIS muito grande.

# text
seg-206c78a69ded = Exposição de rota

# text
# c1: --route
# c2: lat,lon
# c3: --map
seg-0d8832796ab7 = <c1/> é um LineString GeoJSON (simples, dentro de uma Feature ou de uma FeatureCollection) ou um CSV de linhas <c2/>. <c3/> aceita arquivos de mapa ou diretórios deles e pode ser repetido. Os pontos de passagem são unidos por retas em latitude e longitude, portanto densifique os trechos longos; um trecho toma o caminho mais curto em longitude, de modo que um que cruze o antimeridiano ({ "179.5" } E a { "179.5" } W) o cruza. A rota é dividida em partes de cerca de { "250" } m. Cada parte é medida entre os seus dois pontos extremos em uma esfera de raio { "6371.0088" } km (o mesmo caminho que decide em qual célula ela se encontra) e atribuída à célula que contém o seu ponto médio.

# text
# c1: share_degraded
# c2: share_not_degraded
# c3: share_unassessed
# c4: share_not_observed
seg-cc5e2553700b = Por dia e por fonte, o relatório informa o comprimento da rota e quatro parcelas que somam { "1" }: <c1/>, <c2/>, <c3/> (célula presente, mas sem classificação) e <c4/> (célula ausente do mapa). Leia as duas últimas junto com a primeira: uma rota com baixa parcela degradada e alta parcela não observada não foi demonstrada como livre. As linhas de ADS-B e de AIS são informadas separadamente e nunca combinadas. Cada linha traz a licença e a atribuição do mapa.

# text
seg-3a087d90e317 = Funções da biblioteca

# text
# c1: kshana::interference_map::api
seg-67ea1ff00bb8 = Para chamadores que mantêm os dados em memória (bindings, o servidor MCP, a build para navegador), o módulo <c1/> expõe os mesmos métodos com texto ou bytes na entrada e JSON na saída, sem tocar em nenhum arquivo nem na rede:

# text
seg-4dbf41c0ec3b = Função

# text
seg-95f87a38a522 = Entrada

# text
seg-0fe8ff25f4a1 = Saída

# text
seg-9e99af2c1f84 = texto CSV de ADS-B

# text
seg-e144f449c5b4 = uma fatia de bytes por arquivo de rastro do readsb (gzip ou simples)

# text
seg-7effd7110c4c = texto CSV de AIS, texto GeoJSON de terra opcional

# text
# c1: YYYY-MM-DD
seg-10c5e0c0a9c8 = texto da rota, textos GeoJSON dos mapas, limites <c1/> opcionais

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
seg-20a842d675c2 = Um <c1/> tem <c2/> (<c3/>), <c4/> e <c5/> (o documento v1). <c6/> é <c7/> ou <c8/>; <c9/> é { "0.5" }. Os erros são <c10/>. As regras do conjunto de dados (predefinições aprovadas, texto de licença obrigatório, o tipo deve corresponder) aplicam-se exatamente como na linha de comando.

# text
seg-1195686de09b = Validação externa

# text
# c1: tests/interference_map_reference.rs
# c2: tests/fixtures/interference_map_ref/PREREGISTRATION.md
# c3: scripts/gen_interference_map_ref.py
seg-0de37085f544 = <c1/> compara o Kshana com implementações independentes em entradas sintéticas, com tolerâncias pré-registradas em <c2/>: os significados dos códigos NIC e NACp contra a decodificação de quadros ADS-B sintéticos pelo pyModeS, os valores "não disponível" do AIS contra a decodificação de sentenças AIVDM sintéticas pelo pyais, a atribuição de célula da grade contra o shapely, o comprimento de rota por estado de célula contra o shapely e o GeographicLib, e a máscara de terra firme contra o shapely e o pyproj. As fixtures são geradas por <c3/>; a CI não precisa de Python. Isso valida como os códigos e os valores de campo são lidos e a geometria. Não valida que uma célula sinalizada seja interferência.

# text
# c1: src/interference_map/
# c2: tests/interference_map_cli.rs
seg-56a3e955cbcc = Todos os testes usam dados sintéticos gerados e nenhuma rede: testes unitários em <c1/> e <c2/> para os comandos de ponta a ponta, incluindo que nenhum identificador chega a uma saída e que as recusas não deixam arquivos para trás.

# text
seg-212c43d1a41c = <s1>Anterior</s1>Fluxos de treinamento NMEA

# text
seg-7f13ee5d254e = <s1>Próxima</s1>Mapa de interferência: fontes de dados e licenças

# text
seg-1fc1794d9388 = Método de ADS-B (kshana-interference-map/adsb/v2)

# text
seg-a3a97ab49ed1 = Método de AIS (kshana-interference-map/ais/v2)

seg-e3949a1e6082 = Região do emissor (<c1/>)

seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

seg-4fc5a1dcc963 = <c1/> estima <b>onde pode estar uma fonte de interferência</b> a partir dos mesmos relatos abertos ADS-B ou AIS: uma região em níveis de confiança declarados, um centroide com uma elipse de incerteza e as sessões no tempo. Nunca devolve um ponto isolado. <b>MODELLED</b> (linha <c2/> do registro): a física é a linha de visada de rádio dos livros-texto, a credibilidade das regiões depende do modelo, e a única verificação externa é a comparação com o Jammertest fixada antecipadamente em <s1><c3/></s1>. A publicação de regiões de emissores no observatório público é uma decisão separada do responsável e está <b>desativada</b>: o observatório não lê este módulo, e um teste o fixa.

seg-194d573cb817 = Opções: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> (AIS), <c6/> (fundir uma solução TDOA; abaixo). Qualquer opção que difira do valor fixado antecipadamente é anunciada como "não é o método fixado antecipadamente". Os arquivos nunca são sobrescritos.

seg-5767c749117a = <b>Modelo.</b> Os relatos são agrupados em <em>unidades</em> (uma aeronave ou embarcação em um intervalo de 2 minutos), cada uma <em>afetada</em> (ADS-B: pelo menos metade de seus relatos tem NIC ou NACp baixo pela regra do próprio mapa; AIS: uma velocidade ou salto implausível, ou uma posição no interior do continente em relação à linha de costa) ou não. Uma aeronave ou embarcação só conta com pelo menos { "5" } bons relatos na entrada (a mesma proteção de linha de base de equipamento do mapa). As unidades afetadas são agrupadas em <em>sessões</em>: um intervalo de mais de { "30" } minutos separa no tempo e, dentro de um agrupamento no tempo, duas unidades pertencem ao mesmo grupo quando um único emissor poderia estar ao alcance de ambas. Para uma sessão, cada posição candidata em uma grade recebe uma verossimilhança:

seg-0e3abeb21526 = <b>Linha de visada.</b> Uma aeronave à altura <c1/> e uma antena de emissor em <c2/> veem-se mutuamente até <c3/> km em um raio terrestre de 4/3. <c4/> é marginalizada sobre { "2" } a { "100" } m ({ "8" } valores espaçados logaritmicamente).

seg-75f5afea310e = <b>Potência.</b> A potência do emissor é desconhecida, portanto um alcance efetivo de { "12" } km a { "426" } km (em passos de { "1.25" }) ou "apenas linha de visada" limita o alcance, marginalizado com peso igual. A borda do alcance é suave: uma unidade conta como ao alcance com um peso que cai linearmente ao longo de { "15" }% do alcance de cada lado (pelo menos três quartos de uma célula da grade), porque o terreno, o diagrama da antena e o trajeto não são conhecidos com precisão melhor que essa.

seg-ff9cf5fc9fbe = <b>Afetadas e não afetadas.</b> Uma aeronave ou embarcação é <em>suscetível</em> com probabilidade { "0.6" } (o equipamento receptor, a antena e o trajeto do sinal diferem), uma unidade de uma suscetível dentro do alcance é afetada com probabilidade { "0.9" }, e qualquer outra unidade é afetada com a probabilidade de fundo { "0.03" } (outras causas). A suscetibilidade é uma propriedade latente da aeronave, somada por aeronave, assim como uma falha persistente de equipamento (probabilidade { "0.03" }: todas as unidades dessa aeronave são afetadas onde quer que ela esteja), o que impede que um transponder defeituoso arraste a região. Assim, uma aeronave <b>afetada</b> puxa a posterior para posições que a alcançam, e uma <b>aeronave não afetada com linha de visada</b> empurra contra posições que a teriam alcançado no máximo com o peso de uma aeronave, por mais relatos que tenha enviado, enquanto uma aeronave não afetada sem linha de visada nada diz.

seg-51e09cf3944c = <b>Sem terreno.</b> O terreno, a formação de dutos e a difração não são modelados (o terreno só pode remover a linha de visada).

seg-b966c198786a = <b>Atenuação.</b> O logaritmo da verossimilhança é multiplicado por { "0.3" } (uma posterior de potência). A evidência do modelo é mais dependente e suas bordas menos nítidas do que a independência que a verossimilhança supõe, e em dados sintéticos com essas falhas as regiões sem atenuação continham a fonte verdadeira em proporção bem inferior à declarada; { "0.3" } foi escolhido apenas com dados sintéticos (a derivação está em <c1/>, seção { "8" }).

seg-4488bddfd8da = A posterior fornece <b>regiões de maior densidade</b> nos níveis declarados (aninhadas; polígonos com furos quando necessário), o <b>centroide</b> ponderado pela posterior e sua <b>elipse de momentos</b> (escalada a { "95" }% sob uma gaussiana; os polígonos, e não a elipse, são os níveis calibrados). A grade é grosseira (cerca de { "5" } a { "10" } km) sobre todo o domínio e toda célula grosseira que contém massa é dividida { "4" } por { "4" }. O <b>viés de cobertura</b> é tratado condicionando a onde existem relatos: uma região é larga onde havia poucas aeronaves, e uma sessão cuja região de { "95" }% ocupa mais de { "80" }% de seu domínio de busca é informada como <c1/> sem centroide.

seg-2ee93e45c01e = <b>Sessões e perfil.</b> Cada sessão publicada tem início, fim, duração, a área das células de 0,5 grau que contêm uma unidade afetada e pelo menos { "5" } aeronaves ou embarcações distintas, as contagens de afetadas e observadas distintas, e a contraevidência (distintas não afetadas com linha de visada ao centroide; retida abaixo de { "5" }). Uma sessão com menos de <c1/> aeronaves ou embarcações afetadas distintas é retida e contada. O perfil fornece, por hora UTC do dia, as aeronaves afetadas distintas (<c2/> abaixo de { "5" }) e os minutos de tempo de sessão, e as horas de tempo de sessão por dia UTC.

seg-857aad210cde = Fusão TDOA opcional.

seg-fcfc554b4f3d = <c1/> recebe <c2/> (pelo menos três receptores; <c3/> é o receptor <c4/> menos o receptor { "0" }). A posição é resolvida na superfície da Terra por Gauss-Newton sobre <c5/>, sua covariância é <c6/>, e a gaussiana é multiplicada na posterior. O limite de Cramer-Rao é um limite inferior sobre um modelo, não uma precisão medida.

seg-55c1c9c80601 = <b>Saídas</b> (<c1/>): <c2/> (região MultiPolygon por nível e sessão, o polígono da elipse, o ponto do centroide que leva sua elipse), <c3/>, <c4/>, <c5/>. Cada uma incorpora a licença do conjunto de dados, a URL da licença e a atribuição, o id do método <c6/>, todos os parâmetros, as hipóteses e os limites, e traz seu <b>rótulo de evidência</b> (nível MODELLED, ids das linhas do registro; a faixa sob a figura, linhas <c7/> na tabela, um membro <c8/> no JSON). Os arquivos de máquina são em inglês qualquer que seja o idioma; o texto da figura e as linhas da linha de comando são localizados. Há um exemplo sintético em <c9/> (<c10/>).

seg-7f93e7987855 = <b>Privacidade e redação.</b> Nenhum identificador de aeronave ou embarcação aparece em qualquer saída; nenhuma posição de relato é desenhada; uma sessão precisa de pelo menos { "5" } aeronaves ou embarcações distintas; contagens abaixo de { "5" } são <c1/>. A redação é neutra: "região estimada do emissor", "região da fonte de interferência". Uma região não é a posição de ninguém, não é uma constatação da causa e nada diz sobre quem ou o que está por trás de uma fonte; o teste de redação ampliado verifica nas saídas as palavras de atores, intenção e conflito.

seg-5298b30a7857 = <b>Limites.</b> A credibilidade depende do modelo. Em dados sintéticos (um gerador que compartilha o modelo, com bordas de alcance incertas em { "15" }% por aeronave, falhas persistentes de equipamento, potência desconhecida e altura de antena desconhecida) a região de { "95" }% continha a fonte verdadeira em { "0.99" } (geometria de aeronaves) e { "1.00" } (geometria de navios) das sessões e a região de { "50" }% em cerca de { "0.77" }: os níveis são conservadores, pelo expoente da verossimilhança de { "0.3" }, e o erro do centroide de uma sessão tem mediana de { "23" } km (aeronaves) e { "12" } km (navios). A calibração é verificada apenas com dados sintéticos; a comparação com o Jammertest foi fixada antecipadamente (<c1/>) e executada uma vez: NOT ASSESSABLE para as duas fontes (<c2/>). Uma fonte por sessão; várias fontes próximas parecem uma só. Uma causa regional (uma pane de constelação, clima espacial) dá uma região que não é uma fonte. O ADS-B fornece poucos relatos fora do espaço aéreo movimentado, e apenas cerca de um quarto dos pontos de rastro do readsb traz NIC e NACp, de modo que áreas esparsas dão regiões largas ou nenhuma ({ "31" }% das sessões de geometria de navios foram <c3/>).

seg-d8eb178ef226 = Região do emissor (interference-map locate)
