# docs--interop: translations (pt-PT)

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
seg-881ec6f8fbe0 = Uma execução escreve um documento de resultados, um gráfico e um relatório. <c1/> escreve também a geometria do cenário, ou o seu sinal sintetizado, nos formatos que outras ferramentas já leem: um visualizador de globo, um mapa de secretária, um sistema de informação geográfica (SIG), um pacote de análise de missão ou uma ferramenta de rádio definido por software (SDR). Nada aqui lê um relógio ou a rede, e nenhuma exportação inclui uma marca temporal de geração, pelo que o mesmo cenário dá ficheiros idênticos byte a byte em todas as execuções.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Os ficheiros são escritos junto do cenário, com nomes como o do documento de resultados: <c1/>, <c2/>, <c3/>, um <c4/> por objeto em movimento (ou <c5/> quando há um só) e o par <c6/> / <c7/>. Com <c8/> adotam o nome do estudo, tal como as outras saídas.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Um formato indicado explicitamente que não se aplique ao cenário é um erro que imprime o motivo; com <c1/>, o motivo é impresso e o formato é ignorado. Os pontos de entrada da biblioteca são <c2/>, <c3/> e <c4/>; recebem o texto do cenário e devolvem bytes, sem tocar em nenhum ficheiro, pelo que também funcionam na versão WebAssembly. O servidor Model Context Protocol (MCP) disponibiliza os mesmos três como as ferramentas <c5/>, <c6/> e <c7/> (ver <c8/>).

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
seg-77200201db88 = Código: <c1/> (<c2/> constrói uma descrição geométrica do cenário; <c3/>, <c4/>, <c5/> e <c6/> escrevem-na), <c7/> e <c8/> para o sinal. Testes: <c9/>.

# text
seg-f13ab6bb2e47 = Formatos

# text
seg-fc52229b569c = Especificação seguida

# text
seg-3f237c8956eb = Cesium Language: um vetor JSON (JavaScript Object Notation) de pacotes com marcas temporais, lido pelo CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, uma norma do Open Geospatial Consortium (OGC), lida pelo Google Earth e pela maioria das ferramentas SIG; as trajetórias com marcas temporais usam a extensão da Google <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (espaço de nomes do esquema <c1/>; espaço de nomes da extensão <c2/>)

# text
seg-4cfac7667dbc = JSON geográfico, Request for Comments (RFC) { "7946" } da Internet Engineering Task Force (IETF)

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = o ficheiro de efemérides do Ansys Systems Tool Kit (STK), na forma tempo-posição-velocidade <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format: um ficheiro de metadados JSON e um ficheiro bruto de amostras complexas em fase e em quadratura (IQ)

# text
seg-b38ee3ebd012 = O que cada ficheiro contém

# text
seg-7d873bc11593 = Todos os formatos geoespaciais são escritos a partir da mesma cena, pelo que não podem divergir quanto ao local onde está cada coisa. Uma cena tem até quatro tipos de objeto:

# text
seg-1fc686f6a7ea = <b>Objetos em movimento</b> — satélites e uma plataforma de utilizador quando se move — amostrados na grelha temporal do próprio cenário com os propagadores que a execução do tipo usa.

# text
seg-3db28cb6adc5 = <b>Locais fixos</b> — um recetor, uma estação terrestre, um jammer ou a origem de um referencial de navegação local.

# text
seg-0def04909935 = <b>Trajetórias sem tempo</b> — os pontos de passagem que um tipo de posicionamento, navegação e temporização (PNT) alternativo de terreno, gravidade ou combinado percorre. Estes tipos não têm eixo temporal, pelo que as trajetórias não o têm.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Áreas de cobertura do jammer</b> — para o tipo <c1/>, dois círculos em torno do jammer: o alcance à superfície dentro do qual um satélite no zénite (o mais forte) fica abaixo do limiar de seguimento, de modo que todos os satélites se perdem, e o alcance dentro do qual um satélite na máscara de elevação (o mais fraco) o faz, de modo que o seguimento começa a falhar. Ambos provêm das equações de ligação do próprio tipo (Kaplan e Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3.ª ed., §{ "9.4" }) com o jammer no horizonte do recetor e perda em espaço livre, e o conjunto de testes verifica que a razão efetiva entre a portadora e a densidade de ruído em cada raio é igual ao limiar com { "1e-6" } dB. O círculo é desenhado numa esfera com o raio médio da Terra.

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
seg-e1dd97c47993 = O primeiro pacote é o pacote do documento (<c1/>, <c2/>) com um relógio que abrange a grelha temporal. Cada objeto em movimento é um pacote cujo <c3/> tem um <c4/> ISO { "8601" } (formato de data e hora da International Organization for Standardization) UTC (Coordinated Universal Time), <c5/> <c6/>, e amostras <c7/> <c8/>: segundos após a época, metros no Geocentric Celestial Reference System (GCRS). O CesiumJS toma <c9/> como o International Celestial Reference Frame (ICRF), cujos eixos o GCRS partilha. Os locais fixos e os centros das áreas de cobertura são posições <c10/> constantes fixas à Terra, com <c11/> <c12/>. Uma área de cobertura é uma <c13/> com ambos os semieixos iguais ao seu raio; uma trajetória sem tempo é uma <c14/> fixada ao solo. A <c15/> de cada pacote volta a indicar o referencial por palavras.

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
seg-be6362f4c7e7 = Um <c1/> com uma <c2/> por classe de objeto. Um objeto em movimento é um <c3/> que contém um <c4/>: um <c5/> por amostra (ISO { "8601" } UTC) e depois um <c6/> por amostra (longitude, latitude, altura). Os locais são <c7/>s, as áreas de cobertura <c8/>s cujo anel é fechado e no sentido anti-horário, as trajetórias sem tempo <c9/>s. As coordenadas são longitude e latitude do World Geodetic System { "1984" } (WGS { "84" }) em graus decimais e a altura em metros acima do elipsoide WGS { "84" }, escritas com <c10/> <c11/>. O KML lê <c12/> como altura acima do nível médio do mar; a diferença, a ondulação do geoide, está dentro de cerca de ±{ "110" } m e não é aplicada. A descrição do documento di-lo.

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
seg-37dc14626a6c = Uma <c1/>. As posições são <c2/> ou <c3/> — longitude primeiro, como a RFC { "7946" } exige — em graus WGS { "84" }, com a altura em metros acima do elipsoide. Um objeto em movimento é um <c4/> com uma propriedade <c5/> que contém um tempo ISO { "8601" } por posição; uma trajetória que atravesse o meridiano de { "180" }° é escrita como um <c6/> cortado aí, como a RFC { "7946" } §{ "3.1.9" } pede (o ponto de passagem é interpolado, e <c7/> lista então apenas as amostras originais). Os locais são <c8/>s, as áreas de cobertura <c9/>s com um anel exterior fechado no sentido anti-horário (§{ "3.1.6" }), as trajetórias sem tempo <c10/>s. Cada elemento tem uma propriedade <c11/> que indica a unidade de cada membro numérico.

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
seg-ea28a2bd431c = Um ficheiro por objeto em movimento, dado que umas efemérides STK descrevem um veículo. O cabeçalho indica <c1/> (igual ao número de linhas de dados), <c2/> (UTC, <c3/>), <c4/> com <c5/>, <c6/>, <c7/> e <c8/>; as linhas sob <c9/> são segundos após a época, posição em metros e velocidade em metros por segundo, no GCRS. Uma cena apenas com locais fixos ou trajetórias sem tempo não escreve nenhum ficheiro <c10/>: um ponto fixo é uma Facility do STK, não umas efemérides. Um identificador que não seja uma parte simples de nome de ficheiro (uma camada de constelação e um satélite, <c11/>) é escrito com cada outro caráter como <c12/>, numerado se dois identificadores passarem a coincidir.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = O tipo <c1/> e o tipo <c2/> (através da sua fase <c3/>) exportam cada satélite em órbita terrestre baixa (LEO) e o utilizador a partir dos propagadores e da grelha temporal do próprio tipo. O tipo trabalha em ECI0, o referencial inercial centrado na Terra alinhado com o referencial fixo à Terra na época; cada amostra é convertida para o referencial fixo à Terra no seu próprio instante pela rotação da Terra do tipo e daí para o GCRS através do referencial true equator, mean equinox (TEME) em que o propagador Simplified General Perturbations { "4" } (SGP4) produz a saída, nesse instante, com o UT1 (Universal Time, o ângulo de rotação da Terra) tomado igual ao UTC e o movimento polar desprezado, como nas outras exportações. Os outros tipos LEO indicam porque um formato não se aplica (a tabela abaixo).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = Um <c1/> exporta cada cenário membro que tenha geometria como o seu próprio conjunto de ficheiros, com a etiqueta do membro inserida antes do sufixo do formato: cada execução de fase (<c2/>, ou <c3/> quando a fase tem várias execuções), o cenário de base da varredura (<c4/>), o cenário de Monte Carlo (<c5/>) e cada membro composto (a sua etiqueta, com os valores partilhados a que se liga escritos). <c6/> escreve <c7/> e <c8/>. Um membro idêntico a um anterior é escrito uma só vez, e os valores que uma campanha aplica em tempo de execução (transferências, valores de varredura, sementes) não constam do membro exportado. Um formato aplica-se a uma campanha quando se aplica a algum membro; caso contrário, o motivo é a nota { "4" } da tabela abaixo. Ver <a1>CAMPAIGNS.md</a1>.

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
seg-6579b6941d10 = O instantâneo <c2/> do tipo <c1/> — a banda L modelada desenhada como amostras complexas num instante — como um par <c3/> / <c4/>, no tipo de dados que <c5/> indica (<c6/> ou <c7/>). É a mesma gravação que a execução escreve e volta a ler para a sua própria verificação de consistência: os metadados exportados são iguais ao bloco <c8/> do documento de resultados, e o ficheiro de dados tem o comprimento <c9/>. O escritor é <c10/>, o módulo que o tipo <c11/> já usava; nada é duplicado.

# text
seg-6e7c5f0e34f3 = Referenciais e tempo

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = O motor propaga em TEME (true equator, mean equinox of date), o seu referencial nativo. Os objetos em movimento são rodados para o GCRS pela redução <c1/> (precessão IAU { "2006" } e nutação IAU 2000B, em que IAU é a International Astronomical Union), que reproduz o exemplo publicado de Vallado de TEME para GCRF (Geocentric Celestial Reference Frame) com { "0.11" } m, para CZML e STK, e para o referencial fixo à Terra por <c2/> para KML e GeoJSON. A rotação para o referencial fixo à Terra é o ângulo sidéreo médio de Greenwich com o UT1 tomado igual ao UTC e sem aplicar o movimento polar — a mesma redução que a exportação SP3 (Standard Product { "3" }) usa. Num raio de órbita GPS, a diferença UT1−UTC desprezada, de até { "0.9" } s, desloca a longitude de um satélite até cerca de { "1.7" } km; os locais em terra não são afetados, dado serem indicados em latitude e longitude.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = O tipo <c1/> é a exceção: a sua saída do motor já contém posições GCRS e fixas à Terra (com o UT1−UTC e o movimento polar do cenário, ou uma série real do International Earth Rotation and Reference Systems Service (IERS)), e estas são escritas sem alteração.

# text
seg-2299da743a4c = Todas as horas são UTC. Os segundos intercalares não são modelados: um desvio que atravesse um segundo intercalar é contado como se cada dia tivesse { "86 400" } s, como contam as grelhas temporais do motor.

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
seg-4f7a0b8b4358 = A época de <c1/> é a que a execução do tipo usa, e cada ficheiro indica-a: o <c3/> do tipo <c2/>; quando está ausente, a época mais antiga que os dados dos próprios satélites contêm (uma época de conjunto de elementos de duas linhas (TLE), o tempo de referência de umas efemérides difundidas, o início de um ficheiro SP3), e 2000-01-01T00:{ "00" }:00Z apenas quando nenhum satélite contém uma (elementos keplerianos). As exportações SP3 e OEM (Orbit Ephemeris Message) mantêm 2000-01-01T00:{ "00" }:00Z para um cenário sem <c4/>, pelo que, para esse cenário, as suas datas diferem das destes ficheiros. Sem <c5/> de cenário, cada satélite que contenha a sua própria época é rodado para os referenciais GCRS e fixo à Terra no seu próprio instante (a sua época mais <c6/>), dado ser essa a data a que pertence a sua posição TEME; quando as épocas dos satélites diferem, as marcas temporais partilhadas seguem a premissa do motor de que cada satélite começa em <c7/>, e o ficheiro indica por quantas horas diferem. A época do elemento SGP4 das constelações Walker dos tipos <c8/> e <c9/> (2018-06-12T00:{ "00" }:00Z), que as suas execuções usam também para a rotação da Terra; a <c11/> do tipo <c10/>; a <c13/> ou a época TLE do tipo <c12/>. O tipo <c14/> não tem época de calendário; a sua exportação data <c15/> como para um cenário de órbita sem ela.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Os satélites mantêm os identificadores posicionais <c1/>, <c2/>, ... que as exportações SP3 e OEM lhes dão, porque os propagadores não transportam as linhas de nome dos TLE.

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
seg-2a04d7d4bafc = <c1/> (biblioteca: <c2/>) lê o primeiro <c3/> de um documento GeoJSON — uma geometria isolada, um <c4/> ou um <c5/> — e escreve-o nas entradas de trajetória de <c6/>, <c7/>, <c8/> e <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) antes da execução. Esses tipos percorrem <c15/>, pelo que uma rota é aceite quando é exatamente isso: os seus dois extremos (a contagem <c16/> do cenário é mantida), ou três ou mais posições uniformemente espaçadas numa linha reta em latitude e longitude, com { "1e-7" } grau de tolerância (cerca de { "1" } cm). Qualquer outra rota é recusada e o erro indica a posição mais afastada da linha. Uma rota para um tipo sem entrada de trajetória é recusada com esse motivo. A longitude e a latitude têm o intervalo verificado, o que apanha um ficheiro com a latitude primeiro.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>Gravação SigMF.</b> O bloco <c2/> do tipo <c1/> lê um par <c3/> / <c4/> através de <c5/> e traça a sua estimativa de Welch junto do modelo (ver <a1>SPECTRUM.md</a1>). Ler ficheiros é uma funcionalidade da versão nativa; a versão WebAssembly recebe os bytes através de <c6/>.

# text
seg-f1ca9cee1065 = Como as exportações são verificadas

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> analisa cada exportação com um validador escrito a partir da especificação do formato, e não com o código do próprio escritor:

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML: um vetor JSON cujo primeiro pacote é o pacote do documento com uma <c1/>; identificadores de pacote únicos; cada posição indica <c2/> <c3/> ou <c4/>; as posições amostradas são <c5/> com uma época ISO { "8601" } e tempos crescentes.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML: um documento XML (Extensible Markup Language) bem formado no espaço de nomes OGC KML { "2.2" } com um elemento raiz; a ordem dos elementos do esquema dentro de um Placemark; no máximo uma geometria por Placemark; anéis lineares fechados de quatro ou mais posições; tuplos <c1/> dentro do intervalo; valores <c2/> válidos; <c3/>s que se resolvem; um <c4/> com tantos <c5/> como <c6/>, e o espaço de nomes da extensão declarado.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON: longitude primeiro e dentro do intervalo, latitude dentro do intervalo, dois ou três números por posição, linhas de duas ou mais posições, anéis exteriores fechados no sentido anti-horário, nenhum segmento a atravessar o meridiano de { "180" }°, nenhum membro <c1/>, uma propriedade <c2/> em cada elemento.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK: a linha de versão <c1/>, um bloco <c2/> / <c3/> com as palavras-chave obrigatórias, <c4/>, <c5/> igual ao número de linhas de dados, sete números por linha, tempos crescentes.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF: <c1/> e <c2/> em <c3/>, vetores <c4/> e <c5/>, <c6/> em cada captura, e um ficheiro de dados de amostras inteiras.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Para além da estrutura, um satélite exportado para CZML e para STK é comparado com o estado do próprio motor após a mesma redução de referencial, e concorda com { "1" } mm na posição (os ficheiros contêm { "0.1" } mm): face à saída GCRS do próprio tipo <c1/>, e face a uma propagação independente de TEME para GCRS da constelação <c2/>, cada satélite datado pela sua própria época TLE lida do texto do cenário. Duas verificações saem do motor: as posições CZML do primeiro satélite de <c3/> concordam com { "0.1" } m (medido { "2.3" } cm) com o mesmo TLE propagado pelo pacote Python <c4/> e reduzido para o GCRS pelo ERFA (Essential Routines for Fundamental Astronomy, a implementação aberta da biblioteca SOFA da IAU), e as posições fixas à Terra dos satélites de <c5/> são iguais às posições de efemérides difundidas da especificação de interface do Global Positioning System com { "1" } mm. As posições fixas à Terra da exportação <c6/> são comparadas com as posições que a execução de jamming pontua, com { "5" } mm. A rota GeoJSON faz ida e volta através de um cenário de trajetória, o par SigMF volta a ser lido com os mesmos bytes, e toda a exportação é determinista byte a byte.

# text
seg-20fbf9a3fba7 = Estas são verificações face às especificações publicadas e face ao próprio motor. Os ficheiros não foram carregados no CesiumJS, no Google Earth, no Ansys STK nem numa ferramenta SDR como parte do conjunto de testes, pelo que a aceitação por uma versão concreta dessas ferramentas não é testada aqui.

# text
seg-7349c09206ac = Intercâmbio de órbitas, atitude e kernels (biblioteca, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Para além dos formatos de <c1/>, a { "0.36" } acrescentou leitores e escritores de biblioteca para os ficheiros normalizados que as ferramentas de análise de missão trocam. Recebem e devolvem texto ou bytes e não tocam em nenhum ficheiro. Cada um é uma linha VALIDATED da <a1>matriz de verificação</a1>, face à implementação independente aí indicada:

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, com <c2/> para a forma XML): OPM, OMM e OCM em notação de palavra-chave e valor (KVN) e NDM/XML, segundo a CCSDS 502.0-B-3 (OPM e OMM versões { "3.0" } e { "2.0" }, OCM { "3.0" }). Verificados nos dois sentidos face ao Orekit: o Orekit lê os ficheiros do Kshana e o Kshana lê os do Orekit. As conclusões que permanecem estão fixadas por testes.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, com <c2/>): AEM e APM segundo a CCSDS 504.0-B-2, em KVN e NDM/XML. Verificados face ao Orekit da mesma forma, e as rotações dos registos face às do Orekit.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): escritores e leitores de segmentos NAIF SPK dos tipos { "9" } e { "13" } (com a exportação de um CCSDS OEM para um kernel SPK) e dos tipos { "3" } e { "21" } (polinómios de Chebyshev e linhas de diferenças estendidas), verificados face aos leitores do próprio NAIF SPICE toolkit, até à identidade byte a byte. O Kshana escreve os segmentos a partir de registos que lhe são fornecidos: não ajusta coeficientes de Chebyshev nem produz linhas de diferenças.

# text
seg-bb97cbb1ab9f = O importador e escritor de CCSDS OEM, e o bloco de covariância do OEM, são mais antigos e estão descritos nas importações acima e na matriz.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Apenas os tipos da tabela abaixo exportam geometria. Os tipos cuja geometria está centrada na Lua, em Marte ou noutro corpo não são exportados: CZML, KML e GeoJSON descrevem posições em torno da Terra, e esta versão escreve ficheiros STK apenas com <c1/>, embora o próprio formato STK permita outros corpos centrais.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = <c1/>, <c2/> e <c3/> têm geometria referida à Terra que esta versão não exporta; a tabela indica o motivo de cada um.

# text
# c1: gnss-ins
seg-2bb9237839f3 = O tipo <c1/> percorre a sua trajetória num plano tangente local plano, pelo que apenas a origem do plano é exportada, não a trajetória.

# text
seg-6049ab4ca3c9 = As posições de satélites fixas à Terra desprezam o UT1−UTC e o movimento polar (ver Referenciais e tempo); as alturas KML são elipsoidais, não acima do nível médio do mar.

# text
seg-4dda05aefd2b = As áreas de cobertura assumem propagação em espaço livre, um jammer no horizonte do recetor e uma Terra esférica para o círculo.

# text
seg-2dd0656c518f = Todos os ficheiros de cenário

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = O que <c1/> faz para cada ficheiro em <c2/> (o manifesto do conjunto não é um cenário e fica de fora). "sim" significa que o formato é escrito e passa o seu validador; caso contrário, o número remete para o motivo. Gerado por <c3/>; <c4/> falha quando está desatualizado.

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
seg-3e3b6ecc7b43 = Porque é que um formato não se aplica:

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = os tipos <c1/> e <c2/> planeiam contactos de descida e codificação; exporte um cenário <c3/> para o mesmo satélite e a mesma estação para ver a geometria

# text
# c1: spectrum
seg-f587b4df1635 = o SigMF contém amostras complexas em banda base, que apenas o tipo <c1/> sintetiza

# text
# c1: aocs
seg-d102fb18ce8d = o tipo <c1/> simula a atitude em torno do centro de massa sem órbita nem posição no solo, pelo que não há nada a colocar na Terra

# text
seg-ecc0e31b0369 = a entrada do cenário não contém nenhuma posição horizontal (nem latitude e longitude, nem coordenadas centradas na Terra, nem elementos orbitais para além, no máximo, de uma altitude), pelo que não há nada a colocar na Terra

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = os tipos <c1/> e <c2/> calculam balanços sem posição na Terra

# text
seg-1f17b963c7a6 = umas efemérides STK descrevem a posição e a velocidade de um veículo em função do tempo; esta cena tem apenas pontos fixos ou trajetórias sem tempo (um ponto fixo é uma Facility do STK, não umas efemérides)

# text
seg-f79d0ce7b945 = nenhum cenário membro da campanha tem algo que este formato descreva; exporte um membro isoladamente para ver o seu motivo

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = o tipo <c1/> analisa projetos de sinal (espectros, seguimento, aquisição, compatibilidade) sem posição de satélite nem de utilizador; exporte o cenário <c2/> ou <c3/> que percorre o projeto

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = não exportado nesta versão: os tipos de posicionamento fundido colocam os seus satélites num referencial fixo à Terra relativo a uma época que nunca nomeiam, pelo que uma exportação com marcas temporais teria de inventar a data de calendário (exporte antes o cenário <c1/> ou <c2/>)

# text
seg-3c57b084f0d7 = a geometria do tipo está centrada na Lua, em Marte ou noutro corpo do sistema solar; CZML, KML e GeoJSON descrevem posições na Terra ou em torno dela, e esta versão escreve efemérides STK apenas com CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = não exportado nesta versão: <c1/> coloca os seus satélites num referencial fixo ao corpo relativo a uma época que nunca nomeia, pelo que uma exportação com marcas temporais teria de inventar a data de calendário

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = não exportado nesta versão: a constelação Global Navigation Satellite System (GNSS) da Terra de <c1/> é vista a partir de um recetor à distância lunar, cuja trajetória o tipo não expõe como série temporal

# text
# c1: entry-heating
seg-3cf7f7460c55 = não exportado nesta versão: o tipo <c1/> comunica cargas e aquecimentos máximos, e não guarda nenhuma projeção no solo com marcas temporais

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = o tipo <c1/> varre a disponibilidade e a intensidade da ligação para um utilizador numa camada ou numa trajetória kepleriana; não tem uma posição única para colocar num mapa

# text
# c1: launch-window
seg-6271953188bd = o cenário <c1/> indica a latitude do local de lançamento mas não a longitude, pelo que o local não pode ser colocado

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = não exportado nesta versão: a órbita de referência de <c1/> é uma referência de ajuste cujo ângulo de rotação da Terra na época é uma entrada (<c2/>, por predefinição { "0" }), não derivado da data de calendário, pelo que as suas posições fixas à Terra não estão ligadas a uma data

# text
seg-a03c2f0426db = este cenário de espectro não tem bloco [iq], pelo que não são sintetizadas amostras para gravar

# text
# c1: oem-interop
seg-d75f8ad6903a = não exportado nesta versão: <c1/> lê e escreve uma Orbit Ephemeris Message do CCSDS (Consultative Committee for Space Data Systems), que é ela própria o ficheiro de intercâmbio de efemérides

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = o tipo <c1/> calcula estatísticas de ligação para locais em terra sem geometria com marcas temporais para colocar

# text
seg-146a2e8ee590 = o cenário varre outro cenário numa grelha; exporte o cenário varrido isoladamente

# text
# c1: time-transfer-budget
seg-b74484e3586b = o tipo <c1/> calcula um balanço de ligação e estabilidades, sem geometria com marcas temporais para colocar

# text
seg-bcd613e62c69 = <s1>Anterior</s1>Exportação de animação

# text
seg-0525f7fbbfd2 = <s1>Seguinte</s1>Estado de validação

# text
seg-53a778722c16 = STK .e
