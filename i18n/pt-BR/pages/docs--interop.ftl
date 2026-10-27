# docs--interop: translations (pt-BR)

# text
seg-f917e7fcac09 = O que é

# text
seg-cae10fb9bff8 = Cenário

# text
seg-f2ce7fc60cdf = Formato

# text
seg-8c718f7f9f5d = SigMF

# text
seg-507b8c235614 = CZML

# text
seg-bf09433a7342 = GeoJSON

# text
seg-9c92e0bc42aa = KML

# text
seg-b03d56f501c3 = Tipo

# text
seg-357c2320b43a = sim

# text
# c1: docs/INTEROP.md
seg-c8c964a11462 = Fonte: <c1/>

# text
# c1: --export
seg-881ec6f8fbe0 = Uma execução grava um documento de resultado, um gráfico e um relatório. <c1/> também grava a geometria do cenário, ou o seu sinal sintetizado, nos formatos que outras ferramentas já leem: um visualizador de globo, um mapa de desktop, um sistema de informação geográfica (GIS), um pacote de análise de missão ou uma ferramenta de rádio definido por software (SDR). Nada aqui lê um relógio ou a rede, e nenhuma exportação traz carimbo de data e hora de geração; assim, o mesmo cenário gera arquivos idênticos byte a byte a cada execução.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Os arquivos são gravados ao lado do cenário, com nomes iguais ao do documento de resultado: <c1/>, <c2/>, <c3/>, um <c4/> por objeto em movimento (ou <c5/> quando há apenas um) e o par <c6/> / <c7/>. Com <c8/>, eles tomam o nome do estudo, como as outras saídas.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Um formato nomeado explicitamente que não se aplica ao cenário é um erro que imprime o motivo; com <c1/>, o motivo é impresso e o formato é ignorado. Os pontos de entrada da biblioteca são <c2/>, <c3/> e <c4/>; eles recebem o texto do cenário e devolvem bytes, sem tocar em nenhum arquivo, de modo que rodam também na build WebAssembly. O servidor do Model Context Protocol (MCP) oferece os mesmos três como as ferramentas <c5/>, <c6/> e <c7/> (veja <c8/>).

# text
# c1: src/interop/
# c2: scene.rs
# c3: czml.rs
# c4: kml.rs
# c5: geojson.rs
# c6: stk.rs
# c7: src/sigmf.rs
# c8: src/spectrum.rs
# c9: tests/interop_formats.rs
seg-77200201db88 = Código: <c1/> (<c2/> constrói uma descrição geométrica do cenário; <c3/>, <c4/>, <c5/> e <c6/> a gravam), <c7/> e <c8/> para o sinal. Testes: <c9/>.

# text
seg-f13ab6bb2e47 = Formatos

# text
seg-fc52229b569c = Especificação seguida

# text
seg-3f237c8956eb = Cesium Language: um array JSON (JavaScript Object Notation) de pacotes com marcação de tempo, lido pelo CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, um padrão do Open Geospatial Consortium (OGC), lido pelo Google Earth e pela maioria das ferramentas de GIS; as trilhas com marcação de tempo usam a extensão do Google <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (namespace do esquema <c1/>; namespace da extensão <c2/>)

# text
seg-4cfac7667dbc = JSON geográfico, Request for Comments (RFC) { "7946" } da Internet Engineering Task Force (IETF)

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = o arquivo de efemérides do Ansys Systems Tool Kit (STK), na forma tempo-posição-velocidade <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format: um arquivo de metadados JSON e um arquivo bruto de amostras complexas em fase e em quadratura (IQ)

# text
seg-b38ee3ebd012 = O que cada arquivo contém

# text
seg-7d873bc11593 = Todo formato geoespacial é gravado a partir da mesma cena, de modo que não podem divergir quanto à posição de qualquer coisa. Uma cena tem até quatro tipos de objeto:

# text
seg-1fc686f6a7ea = <b>Objetos em movimento</b> — satélites e uma plataforma de usuário quando se move — amostrados na própria grade de tempo do cenário, com os propagadores que a execução do tipo de cenário usa.

# text
seg-3db28cb6adc5 = <b>Locais fixos</b> — um receptor, uma estação terrestre, um jammer ou a origem de um referencial de navegação local.

# text
seg-0def04909935 = <b>Trilhas sem tempo</b> — os pontos de passagem que um tipo de cenário de posicionamento, navegação e temporização (PNT) alternativo de terreno, gravidade ou combinado percorre. Esses tipos de cenário não têm eixo de tempo, portanto as trilhas não carregam nenhum.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Áreas de cobertura do jammer</b> — para o tipo de cenário <c1/>, dois círculos em torno do jammer: o alcance no solo dentro do qual um satélite no zênite (o mais forte) cai abaixo do limiar de rastreamento, de modo que todos os satélites são perdidos, e o alcance dentro do qual um satélite na máscara de elevação (o mais fraco) cai, de modo que o rastreamento começa a falhar. Ambos vêm das equações de enlace do próprio tipo de cenário (Kaplan e Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3ª ed., §{ "9.4" }), com o jammer no horizonte do receptor e perda no espaço livre, e o conjunto de testes verifica que a relação portadora/densidade de ruído efetiva em cada raio é igual ao limiar com precisão de { "1e-6" } dB. O círculo é desenhado em uma esfera com o raio médio da Terra.

# text
# c1: "id": "document"
# c2: "version": "1.0"
# c3: position
# c4: epoch
# c5: referenceFrame
# c6: "INERTIAL"
# c7: cartesian
# c8: [t, x, y, z, ...]
# c9: INERTIAL
# c10: cartesian
# c11: referenceFrame
# c12: "FIXED"
# c13: ellipse
# c14: polyline
# c15: description
seg-e1dd97c47993 = O primeiro pacote é o pacote do documento (<c1/>, <c2/>), com um relógio que abrange a grade de tempo. Cada objeto em movimento é um pacote cujo <c3/> tem uma <c4/> ISO { "8601" } (formato de data e hora da Organização Internacional de Normalização) UTC (Tempo Universal Coordenado), <c5/> <c6/> e amostras <c7/> <c8/>: segundos após a época, metros no Geocentric Celestial Reference System (GCRS). O CesiumJS toma <c9/> como o International Celestial Reference Frame (ICRF), cujos eixos o GCRS compartilha. Os locais fixos e os centros das áreas de cobertura são posições <c10/> constantes, fixas à Terra, com <c11/> <c12/>. Uma área de cobertura é uma <c13/> com ambos os semieixos iguais ao seu raio; uma trilha sem tempo é uma <c14/> fixada ao solo. A <c15/> de cada pacote declara o referencial novamente em palavras.

# text
# c1: <Document>
# c2: <Folder>
# c3: <Placemark>
# c4: <gx:Track>
# c5: <when>
# c6: <gx:coord>
# c7: <Point>
# c8: <Polygon>
# c9: <LineString>
# c10: altitudeMode
# c11: absolute
# c12: absolute
seg-be6362f4c7e7 = Um <c1/> com uma <c2/> por classe de objeto. Um objeto em movimento é um <c3/> que contém um <c4/>: um <c5/> por amostra (ISO { "8601" } UTC) e depois um <c6/> por amostra (longitude, latitude, altura). Os locais são <c7/>, as áreas de cobertura são <c8/> cujo anel é fechado e anti-horário, e as trilhas sem tempo são <c9/>. As coordenadas são longitude e latitude do World Geodetic System { "1984" } (WGS { "84" }) em graus decimais e altura em metros acima do elipsoide WGS { "84" }, gravadas com <c10/> <c11/>. O KML lê <c12/> como altura acima do nível médio do mar; a diferença, a ondulação do geoide, fica dentro de cerca de ±{ "110" } m e não é aplicada. A descrição do documento informa isso.

# text
# c1: FeatureCollection
# c2: [longitude, latitude]
# c3: [longitude, latitude, height]
# c4: LineString
# c5: times_utc
# c6: MultiLineString
# c7: times_utc
# c8: Point
# c9: Polygon
# c10: LineString
# c11: units
seg-37dc14626a6c = Uma <c1/>. As posições são <c2/> ou <c3/> — longitude primeiro, como a RFC { "7946" } exige — em graus WGS { "84" }, com altura em metros acima do elipsoide. Um objeto em movimento é um <c4/> com uma propriedade <c5/> que contém um horário ISO { "8601" } por posição; uma trilha que cruza o meridiano de { "180" }° é gravada como um <c6/> cortado ali, como a RFC { "7946" } §{ "3.1.9" } pede (o ponto de cruzamento é interpolado, e <c7/> lista então apenas as amostras originais). Os locais são <c8/>, as áreas de cobertura são <c9/> com anel exterior fechado e anti-horário (§{ "3.1.6" }), e as trilhas sem tempo são <c10/>. Cada feature tem uma propriedade <c11/> que nomeia a unidade de cada membro numérico.

# text
# c1: NumberOfEphemerisPoints
# c2: ScenarioEpoch
# c3: d Mon yyyy hh:mm:ss.ssssss
# c4: InterpolationMethod Lagrange
# c5: InterpolationSamplesM1 5
# c6: CentralBody Earth
# c7: CoordinateSystem ICRF
# c8: DistanceUnit Meters
# c9: EphemerisTimePosVel
# c10: .e
# c11: Pulsar inclined/S1-0163
# c12: -
seg-ea28a2bd431c = Um arquivo por objeto em movimento, já que uma efeméride do STK descreve um veículo. O cabeçalho traz <c1/> (igual ao número de linhas de dados), <c2/> (UTC, <c3/>), <c4/> com <c5/>, <c6/>, <c7/> e <c8/>; as linhas sob <c9/> são segundos após a época, posição em metros e velocidade em metros por segundo, no GCRS. Uma cena com apenas locais fixos ou trilhas sem tempo não grava nenhum arquivo <c10/>: um ponto fixo é uma Facility do STK, não uma efeméride. Um id que não é uma parte simples de nome de arquivo (uma camada de constelação e um satélite, <c11/>) é gravado com cada outro caractere como <c12/>, numerado se dois ids passarem a coincidir.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = O tipo de cenário <c1/> e o tipo de cenário <c2/> (por meio do seu estágio <c3/>) exportam todos os satélites de órbita terrestre baixa (LEO) e o usuário a partir dos propagadores e da grade de tempo do próprio tipo de cenário. O tipo de cenário trabalha em ECI0, o referencial inercial centrado na Terra alinhado com o referencial fixo à Terra na época; cada amostra é convertida para o referencial fixo à Terra no seu próprio instante pela rotação da Terra do tipo de cenário e, a partir daí, para o GCRS por meio do referencial true equator, mean equinox (TEME) em que o propagador Simplified General Perturbations { "4" } (SGP4) produz a saída, naquele instante, com o UT1 (Tempo Universal, o ângulo de rotação da Terra) tomado igual ao UTC e o movimento polar desprezado, como nas outras exportações. Os outros tipos de cenário LEO informam por que um formato não se aplica (a tabela abaixo).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = Um <c1/> exporta cada cenário membro que tem geometria como seu próprio conjunto de arquivos, com o rótulo do membro inserido antes do sufixo do formato: cada execução de fase (<c2/>, ou <c3/> quando a fase tem várias execuções), o cenário-base do sweep (<c4/>), o cenário de Monte Carlo (<c5/>) e cada membro composto (o seu rótulo, com os valores compartilhados que ele vincula gravados). <c6/> grava <c7/> e <c8/>. Um membro idêntico a um anterior é gravado uma vez, e os valores que uma campanha aplica em tempo de execução (transferências, valores de sweep, sementes) não estão no membro exportado. Um formato se aplica a uma campanha quando se aplica a qualquer membro; caso contrário, o motivo é a nota { "4" } da tabela abaixo. Veja <a1>CAMPAIGNS.md</a1>.

# text
# c1: spectrum
# c2: [iq]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: iq.sigmf.meta
# c9: iq.sigmf.data_bytes
# c10: src/sigmf.rs
# c11: spectrum
seg-6579b6941d10 = O instantâneo <c2/> do tipo de cenário <c1/> — a banda L modelada, desenhada como amostras complexas em um instante — como um par <c3/> / <c4/>, no tipo de dado que <c5/> nomeia (<c6/> ou <c7/>). É a mesma gravação que a execução grava e relê para a sua própria verificação de consistência: os metadados exportados são iguais ao bloco <c8/> do documento de resultado, e o arquivo de dados tem o comprimento <c9/>. O gravador é <c10/>, o módulo que o tipo de cenário <c11/> já usava; nada é duplicado.

# text
seg-6e7c5f0e34f3 = Referenciais e tempo

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = O motor propaga em TEME (true equator, mean equinox of date), o seu referencial nativo. Os objetos em movimento são rotacionados para o GCRS pela redução <c1/> (precessão IAU { "2006" } e nutação IAU 2000B, em que IAU é a União Astronômica Internacional), que reproduz o exemplo publicado de Vallado de TEME para GCRF (Geocentric Celestial Reference Frame) com { "0.11" } m, para CZML e STK, e para o referencial fixo à Terra por <c2/> para KML e GeoJSON. A rotação fixa à Terra é o ângulo sideral médio de Greenwich, com o UT1 tomado igual ao UTC e o movimento polar não aplicado — a mesma redução que a exportação SP3 (Standard Product { "3" }) usa. Em um raio de órbita de GPS, o UT1−UTC desprezado, de até { "0.9" } s, desloca a longitude de um satélite em até cerca de { "1.7" } km; os locais em terra não são afetados, pois são dados em latitude e longitude.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = O tipo de cenário <c1/> é a exceção: a sua saída do motor já traz posições GCRS e fixas à Terra (com o UT1−UTC e o movimento polar do cenário, ou uma série real do International Earth Rotation and Reference Systems Service (IERS)), e essas são gravadas sem alteração.

# text
seg-2299da743a4c = Todo horário é UTC. Os segundos intercalares não são modelados: um deslocamento que atravessa um segundo intercalar é contado como se todo dia tivesse { "86 400" } s, como as grades de tempo do motor contam.

# text
# c1: t = 0
# c2: orbit
# c3: epoch
# c4: epoch
# c5: epoch
# c6: t
# c7: t = 0
# c8: jamming
# c9: gnss-sim
# c10: passes
# c11: epoch
# c12: ephemeris
# c13: epoch
# c14: integrity
# c15: t = 0
seg-4f7a0b8b4358 = A época de <c1/> é a que a execução do tipo de cenário usa, e cada arquivo a nomeia: a <c3/> do tipo de cenário <c2/>; quando ela está ausente, a época mais antiga que os próprios dados dos satélites trazem (uma época de conjunto de elementos de duas linhas (TLE), o tempo de referência de uma efeméride transmitida, o início de um arquivo SP3) e 2000-01-01T00:{ "00" }:00Z somente quando nenhum satélite traz uma (elementos keplerianos). As exportações SP3 e OEM (Orbit Ephemeris Message) mantêm 2000-01-01T00:{ "00" }:00Z para um cenário sem <c4/>; assim, para esse cenário, as suas datas diferem das destes arquivos. Sem <c5/> de cenário, cada satélite que traz a sua própria época é rotacionado para os referenciais GCRS e fixo à Terra no seu próprio instante (a sua época mais <c6/>), já que é essa a data a que pertence a sua posição TEME; quando as épocas dos satélites diferem, as marcas de tempo compartilhadas seguem a premissa do motor de que todo satélite começa em <c7/>, e o arquivo informa por quantas horas elas diferem. A época do elemento SGP4 das constelações Walker dos tipos de cenário <c8/> e <c9/> (2018-06-12T00:{ "00" }:00Z), que as suas execuções também usam para a rotação da Terra; a <c11/> do tipo de cenário <c10/>; a <c13/> do tipo de cenário <c12/> ou a época do TLE. O tipo de cenário <c14/> não tem época de calendário; a sua exportação data <c15/> como para um cenário de órbita sem ela.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Os satélites mantêm os identificadores posicionais <c1/>, <c2/>, ... que as exportações SP3 e OEM lhes dão, porque os propagadores não carregam as linhas de nome do TLE.

# text
seg-0491624c5f12 = Importações

# text
seg-798f3ae1b77d = Rota GeoJSON.

# text
# c1: --import-route <file>
# c2: interop::geojson::apply_route
# c3: LineString
# c4: Feature
# c5: FeatureCollection
# c6: terrain-nav
# c7: terrain-slam
# c8: gravity-map
# c9: combined-altpnt
# c10: start_lat_deg
# c11: start_lon_deg
# c12: step_lat_deg
# c13: step_lon_deg
# c14: waypoints
# c15: start + i·step
# c16: waypoints
seg-2a04d7d4bafc = <c1/> (biblioteca: <c2/>) lê o primeiro <c3/> de um documento GeoJSON — uma geometria simples, uma <c4/> ou uma <c5/> — e o grava nas entradas de trilha de <c6/>, <c7/>, <c8/> e <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) antes da execução. Esses tipos de cenário percorrem <c15/>; por isso uma rota é aceita quando é exatamente isso: os seus dois extremos (a contagem de <c16/> do cenário é mantida), ou três ou mais posições igualmente espaçadas em uma reta em latitude e longitude, com precisão de { "1e-7" } grau (cerca de { "1" } cm). Qualquer outra rota é recusada e o erro nomeia a posição mais afastada da reta. Uma rota para um tipo de cenário sem entrada de trajetória é recusada com esse motivo. Longitude e latitude têm o intervalo verificado, o que detecta um arquivo com latitude primeiro.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>Gravação SigMF.</b> O bloco <c2/> do tipo de cenário <c1/> lê um par <c3/> / <c4/> por meio de <c5/> e plota a sua estimativa de Welch ao lado do modelo (veja <a1>SPECTRUM.md</a1>). Ler arquivos é um recurso da build nativa; a build WebAssembly recebe os bytes por meio de <c6/>.

# text
seg-f1ca9cee1065 = Como as exportações são verificadas

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> analisa cada exportação com um validador escrito a partir da especificação do formato, e não com o código do próprio gravador:

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML: um array JSON cujo primeiro pacote é o pacote do documento com um <c1/>; identificadores de pacote únicos; toda posição declara <c2/> <c3/> ou <c4/>; as posições amostradas são <c5/> com uma época ISO { "8601" } e tempos crescentes.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML: um documento XML (Extensible Markup Language) bem formado no namespace OGC KML { "2.2" }, com uma feature raiz; a ordem dos elementos do esquema dentro de um Placemark; no máximo uma geometria por Placemark; anéis lineares fechados de quatro ou mais posições; tuplas <c1/> dentro do intervalo; valores <c2/> válidos; <c3/> que se resolvem; um <c4/> com tantos <c5/> quantos <c6/>, e o namespace da extensão declarado.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON: longitude primeiro e dentro do intervalo, latitude dentro do intervalo, dois ou três números por posição, linhas de duas ou mais posições, anéis exteriores fechados e anti-horários, nenhum segmento cruzando o meridiano de { "180" }°, nenhum membro <c1/>, uma propriedade <c2/> em cada feature.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK: a linha de versão <c1/>, um bloco <c2/> / <c3/> com as palavras-chave exigidas, <c4/>, <c5/> igual ao número de linhas de dados, sete números por linha, tempos crescentes.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF: <c1/> e <c2/> em <c3/>, arrays <c4/> e <c5/>, <c6/> em cada captura e um arquivo de dados com amostras inteiras.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Além da estrutura, um satélite exportado para CZML e para STK é comparado com o próprio estado do motor após a mesma redução de referencial, e concorda a { "1" } mm em posição (os arquivos trazem { "0.1" } mm): contra a própria saída GCRS do tipo de cenário <c1/> e contra uma propagação TEME para GCRS independente da constelação <c2/>, cada satélite datado pela sua própria época de TLE lida do texto do cenário. Duas verificações saem do motor: as posições CZML do primeiro satélite <c3/> concordam a { "0.1" } m (medido { "2.3" } cm) com o mesmo TLE propagado pelo pacote Python <c4/> e reduzido ao GCRS pelo ERFA (Essential Routines for Fundamental Astronomy, a implementação aberta da biblioteca SOFA da IAU), e as posições fixas à Terra dos satélites <c5/> são iguais às posições da efeméride transmitida da especificação de interface do Global Positioning System a { "1" } mm. As posições fixas à Terra da exportação <c6/> são comparadas com as posições que a execução de jamming avalia, a { "5" } mm. A rota GeoJSON faz ida e volta por um cenário de trilha, o par SigMF é relido para os mesmos bytes e toda exportação é determinística byte a byte.

# text
seg-20fbf9a3fba7 = Estas são verificações contra as especificações publicadas e contra o próprio motor. Os arquivos não foram carregados no CesiumJS, no Google Earth, no Ansys STK nem em uma ferramenta SDR como parte do conjunto de testes; portanto, a aceitação por uma versão específica dessas ferramentas não é testada aqui.

# text
seg-7349c09206ac = Intercâmbio de órbita, atitude e kernels (biblioteca, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Ao lado dos formatos <c1/>, a { "0.36" } acrescentou leitores e gravadores de biblioteca para os arquivos padrão que as ferramentas de análise de missão trocam. Eles recebem e devolvem texto ou bytes e não tocam em nenhum arquivo. Cada um é uma linha VALIDATED da <a1>matriz de verificação</a1>, contra a implementação independente nomeada ali:

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>Orbit Data Messages do CCSDS</b> (<c1/>, com <c2/> para a forma XML): OPM, OMM e OCM em notação de palavra-chave e valor (KVN) e NDM/XML, segundo o CCSDS 502.0-B-3 (OPM e OMM nas versões { "3.0" } e { "2.0" }, OCM { "3.0" }). Verificadas nos dois sentidos contra o Orekit: o Orekit lê os arquivos do Kshana e o Kshana lê os do Orekit. Os achados que permanecem são fixados por testes.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>Attitude Data Messages do CCSDS</b> (<c1/>, com <c2/>): AEM e APM segundo o CCSDS 504.0-B-2, em KVN e NDM/XML. Verificadas contra o Orekit do mesmo modo, e as rotações de registro contra as do Orekit.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): gravadores e leitores de segmentos SPK do NAIF dos tipos { "9" } e { "13" } (com a exportação de um OEM do CCSDS para um kernel SPK) e dos tipos { "3" } e { "21" } (polinômios de Chebyshev e linhas de diferenças estendidas), verificados contra os próprios leitores do toolkit NAIF SPICE, até a identidade byte a byte. O Kshana grava os segmentos a partir de registros que lhe são dados: não ajusta coeficientes de Chebyshev nem produz linhas de diferenças.

# text
seg-bb97cbb1ab9f = O importador e gravador de OEM do CCSDS, e o bloco de covariância do OEM, são mais antigos e estão descritos nas importações acima e na matriz.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Somente os tipos de cenário da tabela abaixo exportam geometria. Os tipos de cenário cuja geometria é centrada na Lua, em Marte ou em outro corpo não são exportados: CZML, KML e GeoJSON descrevem posições em torno da Terra, e esta versão grava arquivos STK somente com <c1/>, embora o próprio formato STK permita outros corpos centrais.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = <c1/>, <c2/> e <c3/> têm geometria referenciada à Terra que esta versão não exporta; a tabela indica o motivo de cada um.

# text
# c1: gnss-ins
seg-2bb9237839f3 = O tipo de cenário <c1/> percorre a sua trajetória em um plano tangente local plano; por isso, apenas a origem do plano é exportada, não a trajetória.

# text
seg-6049ab4ca3c9 = As posições dos satélites fixas à Terra desprezam o UT1−UTC e o movimento polar (veja Referenciais e tempo); as alturas do KML são elipsoidais, não acima do nível médio do mar.

# text
seg-4dda05aefd2b = As áreas de cobertura supõem propagação no espaço livre, um jammer no horizonte do receptor e uma Terra esférica para o círculo.

# text
seg-2dd0656c518f = Todos os arquivos de cenário

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = O que <c1/> faz com cada arquivo em <c2/> (o manifesto da suíte não é um cenário e fica de fora). "yes" significa que o formato é gravado e passa pelo seu validador; caso contrário, o número aponta para o motivo. Gerada por <c3/>; <c4/> falha quando ela está desatualizada.

# text
seg-c27f67dfbb37 = não [{ "1" }]

# text
seg-3468244e2385 = não [{ "2" }]

# text
seg-d0cf3f74cd10 = não [{ "3" }]

# text
seg-62c880979169 = não [{ "4" }]

# text
seg-9229b499c702 = não [{ "5" }]

# text
seg-d9d6561c9e5b = não [{ "6" }]

# text
seg-7d4a6538c638 = não [{ "7" }]

# text
seg-f170ed4d8dca = não [{ "8" }]

# text
seg-1c5eb5dca942 = não [{ "9" }]

# text
seg-a930bb0d2e42 = não [{ "10" }]

# text
seg-236853169f42 = não [{ "11" }]

# text
seg-411e4f3aeae7 = não [{ "12" }]

# text
seg-34fabcbb82f2 = não [{ "13" }]

# text
seg-772bd344bbce = não [{ "14" }]

# text
seg-460fd74c7c7e = não [{ "15" }]

# text
seg-e1d91ce54b8b = não [{ "16" }]

# text
seg-f3e0486f02e3 = não [{ "17" }]

# text
seg-884160b0ed12 = não [{ "18" }]

# text
seg-8202f4a426b0 = não [{ "19" }]

# text
seg-a4e9a36289e5 = não [{ "20" }]

# text
seg-034364e38105 = não [{ "21" }]

# text
seg-3e3b6ecc7b43 = Por que um formato não se aplica:

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = os tipos de cenário <c1/> e <c2/> planejam contatos de downlink e codificação; exporte um cenário <c3/> para o mesmo satélite e a mesma estação para ver a geometria

# text
# c1: spectrum
seg-f587b4df1635 = o SigMF contém amostras complexas em banda base, que apenas o tipo de cenário <c1/> sintetiza

# text
# c1: aocs
seg-d102fb18ce8d = o tipo de cenário <c1/> simula a atitude em torno do centro de massa, sem órbita nem posição no solo, de modo que não há nada a posicionar na Terra

# text
seg-ecc0e31b0369 = a entrada do cenário não traz posição horizontal (nem latitude e longitude, nem coordenadas centradas na Terra, nem elementos orbitais além, no máximo, de uma altitude), de modo que não há nada a posicionar na Terra

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = os tipos de cenário <c1/> e <c2/> calculam orçamentos sem posição na Terra

# text
seg-1f17b963c7a6 = uma efeméride do STK descreve a posição e a velocidade de um veículo em função do tempo; esta cena tem apenas pontos fixos ou trilhas sem tempo (um ponto fixo é uma Facility do STK, não uma efeméride)

# text
seg-f79d0ce7b945 = nenhum cenário membro da campanha tem algo que este formato descreva; exporte um membro isoladamente para ver o seu motivo

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = o tipo de cenário <c1/> analisa projetos de sinal (espectros, rastreamento, aquisição, compatibilidade) sem posição de satélite ou de usuário; exporte o cenário <c2/> ou <c3/> que percorre o projeto

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = não exportado nesta versão: os tipos de cenário de posicionamento fundido colocam seus satélites em um referencial fixo à Terra relativo a uma época que nunca nomeiam, de modo que uma exportação com marcação de tempo teria de inventar a data de calendário (exporte, em vez disso, o cenário <c1/> ou <c2/>)

# text
seg-3c57b084f0d7 = a geometria do tipo de cenário é centrada na Lua, em Marte ou em outro corpo do sistema solar; CZML, KML e GeoJSON descrevem posições na Terra ou em torno dela, e esta versão grava efemérides STK somente com CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = não exportado nesta versão: <c1/> coloca seus satélites em um referencial fixo ao corpo relativo a uma época que nunca nomeia, de modo que uma exportação com marcação de tempo teria de inventar a data de calendário

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = não exportado nesta versão: a constelação do Global Navigation Satellite System (GNSS) da Terra de <c1/> é vista de um receptor à distância lunar, cuja trajetória o tipo de cenário não expõe como série temporal

# text
# c1: entry-heating
seg-3cf7f7460c55 = não exportado nesta versão: o tipo de cenário <c1/> informa cargas e aquecimento de pico e não mantém nenhuma trilha no solo com marcação de tempo

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = o tipo de cenário <c1/> varre a disponibilidade e a intensidade do enlace para um usuário em uma camada ou em uma trajetória kepleriana; não tem uma única posição a colocar em um mapa

# text
# c1: launch-window
seg-6271953188bd = o cenário <c1/> fornece a latitude do local de lançamento, mas não a longitude, de modo que o local não pode ser posicionado

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = não exportado nesta versão: a órbita verdadeira de <c1/> é uma referência de ajuste cujo ângulo de rotação da Terra na época é uma entrada (<c2/>, padrão { "0" }), não derivado da data de calendário, de modo que as suas posições fixas à Terra não estão ligadas a uma data

# text
seg-a03c2f0426db = este cenário de espectro não tem bloco [iq], de modo que nenhuma amostra é sintetizada para gravar

# text
# c1: oem-interop
seg-d75f8ad6903a = não exportado nesta versão: <c1/> lê e grava uma Orbit Ephemeris Message do CCSDS (Consultative Committee for Space Data Systems), que já é, em si, o arquivo de intercâmbio de efemérides

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = o tipo de cenário <c1/> calcula estatísticas de enlace para locais em terra, sem geometria com marcação de tempo a posicionar

# text
seg-146a2e8ee590 = o cenário varre outro cenário sobre uma grade; exporte o cenário varrido isoladamente

# text
# c1: time-transfer-budget
seg-b74484e3586b = o tipo de cenário <c1/> calcula um orçamento de enlace e estabilidades, sem geometria com marcação de tempo a posicionar

# text
seg-bcd613e62c69 = <s1>Anterior</s1>Exportação de animação

# text
seg-0525f7fbbfd2 = <s1>Próxima</s1>Situação de validação

# text
seg-53a778722c16 = STK .e
