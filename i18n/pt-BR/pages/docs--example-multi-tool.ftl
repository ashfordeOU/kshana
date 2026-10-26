# docs--example-multi-tool: translations (pt-BR)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Fonte: <c1/>

# text
seg-42e93cd44e94 = Exemplo prático — o Kshana como camada de integração para análise de missão com várias ferramentas

# text
# c1: label
seg-286cf0e7bb71 = Este exemplo percorre uma trajetória pelos tipos de cenário de interoperabilidade baseada em padrões e de análise de missão, de ponta a ponta, mostrando como o Kshana se situa <em>entre</em> as ferramentas de alta fidelidade que um programa já usa, em vez de concorrer com elas: GMAT (General Mission Analysis Tool), Orekit e STK (Systems Tool Kit) para projeto de trajetória, e Basilisk ou { "42" } para simulação do sistema de controle de atitude e órbita (AOCS). Cada etapa é um tipo de cenário executável, e cada resultado traz um <c1/> que declara seu escopo e seu nível de evidência.

# text
# c1: label
seg-7198d05bece6 = Nota de honestidade: este é um pipeline <em>geométrico/analítico</em> no nível pré-Fase A / estudo de compromisso (antes da primeira fase formal de projeto de uma missão). Não é uma certificação de dinâmica de voo; veja o campo <c1/> de cada tipo de cenário.

# text
seg-70c18138497b = Outras abreviações usadas abaixo: FDS (sistema de dinâmica de voo), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, o propagador de elementos de duas linhas), TOML (o formato do arquivo de cenário) e CLI (interface de linha de comando).

# text
seg-7cc0d4d15c4a = O pipeline

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = As etapas são execuções separadas: cada uma toma suas entradas de seu próprio arquivo de cenário, de modo que você leva um número de uma para a seguinte (uma distância oblíqua de <c1/> para <c2/>, por exemplo) editando o arquivo seguinte. O tipo de cenário <c3/> pode reunir vários tipos de cenário em uma única execução sob condições compartilhadas; veja <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Cada comando abaixo é executado a partir da raiz do repositório, e o resumo sob ele é a primeira linha que o kshana { $version } imprime para o cenário distribuído.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Ingerir a trajetória produzida por um projetista (<c1/>)

# text
seg-4b732dd54291 = GMAT, Orekit e STK <em>exportam</em> todos Orbit Ephemeris Messages do CCSDS. O Kshana os importa (o outro sentido da ponte), de modo que uma análise do Kshana pode partir da órbita exata que o projetista da trajetória aprovou, e não de uma aproximação rederivada:

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = Ele informa os segmentos, objetos, referenciais e o intervalo de épocas, além de uma verificação de consistência de velocidade, mostrando que as efemérides foram ingeridas fielmente (erro de ida e volta abaixo de { "1" }×{ "10" }⁻⁶ km). Dado um arquivo externo em <c1/>, ele informa o que interpretou: alimentado com o OEM que <c2/> grava, imprime <c3/>. O <c4/> é explícito ao dizer que esta é uma verificação estrutural e física da ingestão, não uma validação da exatidão orbital da fonte.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. Quando ele é visível de uma estação terrena? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Prevê as passagens de nascer/ocaso sobre uma estação acima de uma máscara de elevação: aquisição de sinal (AOS), instante de maior aproximação (TCA), perda de sinal (LOS), elevação máxima e duração, além do tempo total de acesso. Essa é a consulta de planejamento do segmento terrestre. A órbita é um conjunto de elementos SGP4 levado ao referencial fixo à Terra pela cadeia IAU 2006/2000A, e as elevações são aparentes: refração ITU-R P.834-9 e o tempo de luz do enlace de descida, cada um com chave própria (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. O contato se fecha? (<c1/>)

# text
seg-47bdb9d4700c = Para uma passagem, coloque a distância oblíqua e os valores do terminal na equação de enlace CCSDS { "401" } / DSN 810-005 (Deep Space Network da NASA):

# text
seg-db12a99edcd2 = Informa a perda de percurso no espaço livre (FSPL), a densidade de portadora sobre ruído (C/N₀), a energia por bit sobre a densidade de ruído (Eb/N₀), a margem e se o enlace <b>se fecha</b> em relação a um Eb/N₀ exigido: a verificação de viabilidade de comunicações que transforma “ele é visível” em “podemos de fato baixar os dados”. Os números decorrem diretamente das entradas do arquivo (aqui uma EIRP de { "55" } dBW, potência isotrópica radiada efetiva, para um G/T de recepção de { "53" } dB/K, razão ganho sobre temperatura de ruído); coloque os valores do seu próprio terminal antes de ler a margem. É um cálculo determinístico, não uma folha de dados de terminal calibrada.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. Com que rapidez o ambiente a faz decair? (<c1/>)

# text
seg-8977b12fd934 = Conduz a densidade neutra termosférica a partir da atividade solar (F10.7, o fluxo de rádio de { "10.7" } cm, e sua média de 81 dias F10.7a) e geomagnética (índices Kp e ap) por meio da temperatura exosférica de Jacchia-71. Isso captura a oscilação de densidade de ~{ "5" }–{ "10" }× do ciclo solar que uma atmosfera estática omite, de modo que uma estimativa de tempo de vida orbital ou de arrasto reflete o regime de clima espacial em vez de uma atmosfera fixa. Desde a { "0.30" }, a densidade é a densidade termosférica de Jacchia { "1971" }, caracterizada em relação ao NRLMSISE-00 (Naval Research Laboratory, espectrômetro de massa e espalhamento incoerente), mas não é uma atmosfera NRLMSISE-00 validada com dados.

# text
seg-4b5bdadf3e7e = { "5" }. Devolver o resultado (exportações)

# text
# c1: orbit
# c2: --export-oem <file>
# c3: --export-sp3 <file>
# c4: --export-omm <file>
# c5: --export <czml|kml|geojson|stk|sigmf|all|list>
# c6: .e
# c7: spectrum
# c8: --export list
# c9: lunar-interop-export
seg-f4a438636ea8 = A mesma CLI grava arquivos padrão para a ferramenta seguinte. Em um cenário <c1/>, <c2/> grava uma efeméride CCSDS OEM { "2.0" } com velocidade (o arquivo que GMAT, Orekit e STK leem), <c3/> uma efeméride precisa SP3 (Standard Product { "3" }) e <c4/> um catálogo CCSDS Orbit Mean-Elements Message. <c5/> cobre os visualizadores: CZML (Cesium Language), KML (Keyhole Markup Language, para o Google Earth), GeoJSON, arquivos de efemérides do STK (<c6/>, um por satélite mais o usuário) e gravações SigMF (Signal Metadata Format) do tipo de cenário <c7/>. <c8/> informa quais se aplicam a um cenário. Para a Lua, o tipo de cenário <c9/> emite o referencial lunar, a escala de tempo e as efemérides como um CCSDS OEM com uma verificação de aderência à norma. Veja <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Por que isto é a camada de integração, e não um concorrente

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Cada etapa é um cenário pequeno, auditável e reproduzível, com um rótulo de escopo explícito. As ferramentas de alta fidelidade são donas da otimização de trajetória, do AOCS de seis graus de liberdade (6-DoF) e da entrada, descida e pouso aerotérmicos (EDL); o Kshana é dono do <b>tecido conectivo aberto, citável e executável</b>: ingerir os formatos padrão, responder às perguntas transversais de geometria e viabilidade e repassar o resultado, em um nível que qualquer parceiro pode executar sem licença. Veja também os tipos de cenário complementares de análise de missão <c1/>, <c2/>, <c3/>, <c4/> e <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Anterior</s1>{ "3" } · Quântico contra clássico

# text
seg-b0765a28b4ce = <s1>Próxima</s1>Tipos de cenário

# text
seg-dc88ec5ccc43 = { "1" }. Ingerir a trajetória produzida por um projetista (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. Quando ele é visível de uma estação terrena? (passes)

# text
seg-afa47b4283a3 = { "3" }. O contato se fecha? (link-budget)

# text
seg-e508e844bf2d = { "4" }. Com que rapidez o ambiente a faz decair? (space-weather)
