# docs--example-multi-tool: translations (pt-PT)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Fonte: <c1/>

# text
seg-42e93cd44e94 = Exemplo resolvido — o Kshana como camada de ligação de análise de missão com várias ferramentas

# text
# c1: label
seg-286cf0e7bb71 = Este percurso leva uma trajetória, de ponta a ponta, pelos tipos de cenário de interoperabilidade baseada em normas e de análise de missão, mostrando como o Kshana se situa <em>entre</em> as ferramentas de alta fidelidade que um programa já utiliza, em vez de competir com elas: GMAT (General Mission Analysis Tool), Orekit e STK (Systems Tool Kit) para o projeto de trajetórias, e Basilisk ou { "42" } para a simulação do sistema de controlo de atitude e de órbita (AOCS). Cada passo é um tipo de cenário executável, e cada resultado inclui um <c1/> que indica o seu âmbito e o seu nível de evidência.

# text
# c1: label
seg-7198d05bece6 = Nota de honestidade: este é um encadeamento <em>geométrico/analítico</em> ao nível de pré-Fase A / estudo de compromissos (antes da primeira fase formal de projeto de uma missão). Não é uma certificação de dinâmica de voo; ver o campo <c1/> de cada tipo de cenário.

# text
seg-70c18138497b = Outras abreviaturas usadas abaixo: FDS (sistema de dinâmica de voo), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, o propagador de elementos de duas linhas), TOML (o formato do ficheiro de cenário) e CLI (interface de linha de comandos).

# text
seg-7cc0d4d15c4a = O encadeamento

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = Os passos são execuções separadas: cada um recebe as suas entradas do seu próprio ficheiro de cenário, pelo que transporta um número de um para o seguinte (por exemplo, uma distância oblíqua de <c1/> para <c2/>) editando o ficheiro seguinte. O tipo de cenário <c3/> pode conter vários tipos de cenário numa só execução, sob condições partilhadas; ver <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Cada comando abaixo é executado a partir da raiz do repositório, e o resumo por baixo dele é a primeira linha que o kshana { $version } imprime para o cenário fornecido.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Ingerir a trajetória que um projetista produziu (<c1/>)

# text
seg-4b732dd54291 = O GMAT, o Orekit e o STK <em>exportam</em> todos Orbit Ephemeris Messages do CCSDS. O Kshana importa-as (o outro sentido da ponte), pelo que uma análise do Kshana pode partir da órbita exata que o projetista da trajetória validou, e não de uma aproximação recalculada:

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = Comunica os segmentos, os objetos, os referenciais e o intervalo de épocas, e uma verificação de consistência da velocidade, mostrando que as efemérides foram ingeridas fielmente (erro de ida e volta inferior a { "1" }×{ "10" }⁻⁶ km). Dado, em vez disso, um ficheiro externo em <c1/>, comunica o que leu: alimentado com o OEM que <c2/> escreve, imprime <c3/>. O <c4/> é explícito quanto a ser esta uma verificação estrutural e física da ingestão, não uma validação da exatidão orbital da fonte.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. Quando é visível a partir de uma estação terrestre? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Prevê as passagens de nascimento/ocaso sobre uma estação acima de uma máscara de elevação: aquisição de sinal (AOS), momento de maior aproximação (TCA), perda de sinal (LOS), elevação máxima e duração, mais o tempo total de acesso. Essa é a consulta de planeamento do segmento terrestre. A órbita é um conjunto de elementos SGP4 levado para o referencial fixo à Terra na cadeia IAU 2006/2000A, e as elevações são aparentes: refração ITU-R P.834-9 e tempo de luz da ligação descendente, cada um comutável (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. O contacto fecha-se? (<c1/>)

# text
seg-47bdb9d4700c = Para uma passagem, introduza a distância oblíqua e os valores do terminal na equação de ligação do CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network):

# text
seg-db12a99edcd2 = Comunica a perda de percurso em espaço livre (FSPL), a densidade de portadora sobre ruído (C/N₀), a energia por bit sobre a densidade de ruído (Eb/N₀), a margem e se a ligação <b>fecha</b> face a um Eb/N₀ exigido: a verificação de viabilidade das comunicações que transforma "é visível" em "podemos de facto descarregar os dados". Os números decorrem diretamente das entradas do ficheiro (aqui uma EIRP, potência isotrópica radiada equivalente, de { "55" } dBW para um G/T de receção, razão entre ganho e temperatura de ruído, de { "53" } dB/K); introduza os valores do seu próprio terminal antes de ler a margem. É um cálculo determinista, não uma folha de especificações de um terminal calibrado.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. Com que rapidez a decai o ambiente? (<c1/>)

# text
seg-8977b12fd934 = Determina a densidade neutra termosférica a partir da atividade solar (F10.7, o fluxo rádio de { "10.7" } cm, e a sua média de 81 dias F10.7a) e geomagnética (índices Kp e ap) através da temperatura exosférica de Jacchia-71. Isso capta a oscilação de densidade do ciclo solar de ~{ "5" }–{ "10" }× que uma atmosfera estática omite, pelo que uma estimativa do tempo de vida orbital ou do arrasto reflete o regime meteorológico espacial e não uma atmosfera fixa. Desde a { "0.30" }, a densidade é a densidade termosférica de Jacchia { "1971" }, caracterizada face ao NRLMSISE-00 (Naval Research Laboratory mass-spectrometer and incoherent-scatter), mas não uma atmosfera NRLMSISE-00 validada com dados.

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
seg-f4a438636ea8 = A mesma CLI escreve ficheiros padrão para a ferramenta seguinte. Num cenário <c1/>, <c2/> escreve uma efeméride CCSDS OEM { "2.0" } com velocidade (o ficheiro que o GMAT, o Orekit e o STK leem), <c3/> uma efeméride precisa SP3 (Standard Product { "3" }) e <c4/> um catálogo CCSDS Orbit Mean-Elements Message. <c5/> abrange os visualizadores: CZML (Cesium Language), KML (Keyhole Markup Language, para o Google Earth), GeoJSON, ficheiros de efemérides STK (<c6/>, um por satélite mais o utilizador) e gravações SigMF (Signal Metadata Format) do tipo de cenário <c7/>. <c8/> indica quais se aplicam a um cenário. Para a Lua, o tipo de cenário <c9/> emite o referencial lunar, a escala de tempo e as efemérides como um CCSDS OEM com uma verificação de aderência à norma. Ver <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Porque é a ligação, e não um concorrente

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Cada passo é um cenário pequeno, auditável e reprodutível, com um rótulo de âmbito explícito. As ferramentas de alta fidelidade dominam a otimização de trajetórias, o AOCS com seis graus de liberdade (6-DoF) e a entrada, descida e aterragem (EDL) aerotérmicas; o Kshana domina o <b>tecido conjuntivo aberto, citável e executável</b>: ingerir os formatos padrão, responder às questões transversais de geometria e viabilidade e passar o resultado adiante, a um nível que qualquer parceiro pode executar sem licença. Ver também os tipos de cenário de análise de missão complementares <c1/>, <c2/>, <c3/>, <c4/> e <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Anterior</s1>{ "3" } · Quântico contra clássico

# text
seg-b0765a28b4ce = <s1>Seguinte</s1>Tipos de cenário

# text
seg-dc88ec5ccc43 = { "1" }. Ingerir a trajetória que um projetista produziu (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. Quando é visível a partir de uma estação terrestre? (passes)

# text
seg-afa47b4283a3 = { "3" }. O contacto fecha-se? (link-budget)

# text
seg-e508e844bf2d = { "4" }. Com que rapidez a decai o ambiente? (space-weather)
