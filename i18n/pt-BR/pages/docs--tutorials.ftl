# docs--tutorials: translations (pt-BR)

# text
seg-501402fc366f = Holdover do relógio

# text
seg-cae10fb9bff8 = Cenário

# text
seg-a0b63210b807 = Ler mais

# text
seg-a7cfe6f135f1 = Órbita e geometria

# text
seg-835df2d05f2a = Domínio de medição do GNSS

# text
seg-3a0e724a8a2b = Nível

# text
seg-28e87f407a10 = Domínio

# text
seg-d6476863f862 = Capacidade

# text
seg-029de6b99be0 = Navegação inercial por estima

# text
seg-9ef8f99ca6e4 = Transferência de tempo

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT por fusão de sensores com filtro de Kalman conjunto sobre as mesmas entradas híbridas.

# text
seg-4f19d4fb1341 = Varredura genérica N-D sobre qualquer pacote por meio de chaves TOML pontuadas / caminhos de métricas JSON.

# text
seg-e7ab7b55c969 = Varredura 1-D de estudo de compromissos sobre um parâmetro do pacote de relógio.

# text
seg-e43910de5fd8 = Notebooks

# text
seg-d78822583c64 = Notebook

# text
# c1: docs/tutorials/README.md
seg-3959aefa12be = Fonte: <c1/>

# text
# c1: tests/tutorials.rs
seg-a5ebe4befda8 = Exercícios práticos resolvidos que levam você de “executar um cenário fornecido” a “quantificar e defender um resultado”. Todo número citado nos três tutoriais é uma saída real do mecanismo, ancorada em uma referência independente externa (não circular) de autoridade reconhecida, e <b>fixado por um teste de integração</b> (<c1/>), de modo que um tutorial nunca pode se afastar em silêncio do que o mecanismo realmente faz. Se um tutorial diz que o relógio óptico mantém { "6600" } s, o teste derruba o build no dia em que isso deixar de ser verdade.

# text
seg-1c045624a6be = O Kshana é um simulador de posicionamento, navegação e temporização (PNT). Os tutoriais usam algumas outras abreviações, cada uma explicada onde aparece pela primeira vez: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (interface de linha de comando) e TOML (Tom's Obvious Minimal Language, o formato de arquivo de cenário).

# text
seg-7a84a80b57d5 = Novo no projeto? Leia antes o <a1>guia de conceitos</a1> e o <a2>glossário</a2> e depois volte aqui.

# text
seg-b4cd44590347 = Os três exemplos práticos

# text
seg-eebeab9693b2 = Tutorial

# text
seg-a0bc6e585d71 = O que você aprende

# text
seg-b6cc01b76947 = Tipo de cenário

# text
seg-429bab0a0e05 = Dificuldade

# text
seg-0e188f9c0f65 = ~Tempo

# text
seg-bcf40448e55d = Minha primeira órbita: onde estão os satélites GPS

# text
seg-de1032024a69 = propagar uma constelação GPS real, ler a disponibilidade, a diluição da precisão de posição (PDOP) e a exatidão de posição, e exportar onde os satélites realmente estão (formato de órbita precisa SP3)

# text
seg-e7b6c262333e = iniciante

# text
seg-d6042fb74a5f = { "15" } min

# text
seg-07a8d6cfc1ae = Holdover de relógio: por quanto tempo você consegue seguir sozinho

# text
seg-0e9c77468fb2 = executar um holdover de relógio sem GNSS, ler a figura de mérito de temporização e entender a lei de crescimento √(q_wf·T) por trás dela

# text
seg-0f6fba31626a = { "20" } min

# text
seg-7973e9c54366 = Resiliência quântica contra clássica do GNSS

# text
# c1: spoof
# c2: hybrid
seg-4d8036091b37 = o capstone: um detector de spoofing (<c1/>) e uma suíte PNT fundida completa (<c2/>), e como ler segurança / integridade / navegação por estima em conjunto

# text
seg-1b39d4927602 = intermediário

# text
seg-ea37ac575235 = { "35" } min

# text
# c1: notebooks/
seg-1d56222dfd25 = Notebooks Jupyter executáveis, com dados sintéticos e conjuntos de elementos públicos mantidos apenas no repositório, estão em <a1><c1/></a1>:

# text
seg-9aae3a4e10dc = Confiança em embarcações e treinamento

# text
seg-1d680d635c6d = gerar um fluxo NMEA sintético de ponte com um evento roteirizado e depois pontuá-lo com os monitores de confiança de embarcação (consultivo, não um equipamento de navegação homologado)

# text
seg-739f8f5a9082 = onde os dados de navegação pareceram degradados e quanto de uma rota eles afetam

# text
seg-443c908ff49b = Mapeamento de compliance e exportação para test-bench

# text
seg-0d639065192a = em quais linhas de referenciais públicos um conjunto de execuções fornece evidências em apoio de (nunca que um referencial é satisfeito), e o movimento e os eventos de um cenário exportados como texto para um simulador GNSS de laboratório (nenhum sinal é gravado)

# text
seg-981a3238794d = GDOP quântico contra clássico

# text
seg-228ce150ee80 = a mesma geometria de constelação com um sensor quântico e um clássico, comparados pela diluição da precisão

# text
seg-4b82b5edd4ff = Geometria do céu sob uma linha de horizonte

# text
seg-1186b6cd6149 = os satélites que um local enxerga sob a linha de horizonte de uma rua ou cais, seu DOP e elipse de erro, um céu datado a partir de conjuntos de elementos e um Monte Carlo com seed contra a covariância (MODELLED)

# text
seg-d9d06cb8e237 = Como executar um tutorial

# text
seg-ffc4ddfc9426 = Todo tutorial executa o mesmo cenário de três maneiras; escolha a que lhe convier. Todas chamam o <em>mesmo</em> mecanismo, portanto os números são idênticos (espelha a seção <a1>Uso</a1> do README).

# text
# c1: kind
# c2: <scenario>.result.json
# c3: <scenario>.chart.svg
# c4: <scenario>.report.html
# c5: <scenario>.report.json
# c6: <scenario>.table.csv
# c7: realtime-frame-eop
# c8: lunar-time-budget
# c9: lunar-jamming
# c10: leo-navmsg
# c11: telecom-timing
# c12: moonlight-service-volume
seg-e7ba76a06aa6 = <b>Linha de comando.</b> A CLI despacha pelo campo <c1/> do cenário e grava <c2/>, <c3/>, <c4/> e <c5/> ao lado da entrada (JSON é JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Alguns tipos de cenário também publicam uma tabela de reprodutibilidade como <c6/> (valores separados por vírgula): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> e <c12/> quando um local de exportação é definido. Nenhum dos três tutoriais é um deles, de modo que você não verá esse arquivo aqui.

# text
# c1: cargo run --
# c2: cargo install kshana
# c3: kshana scenarios/orbit-sgp4-gps.toml
# c4: kshana example
# c5: kshana example orbit-sgp4-gps > orbit-sgp4-gps.toml
# c6: scenarios/orbit-sgp4-gps.toml
seg-5ee6f15d3b08 = <c1/> compila a CLI a partir deste checkout. Com um binário instalado (<c2/>), o mesmo comando é <c3/>. Sem um checkout, a maioria dos cenários fornecidos está embutida no binário: <c4/> os lista (e nomeia os poucos que não estão embutidos, com o motivo), e <c5/> grava um: a cópia de <c6/> com que o binário foi compilado.

# text
# c1: kshana.run
seg-1b7e851749d5 = <b>Python.</b> Compile a extensão a partir deste checkout uma vez com maturin, dentro de um ambiente virtual ativo, e então chame <c1/>:

# text
# c1: pip install kshana
# c2: json.loads(kshana.list_kinds())
seg-3aa10d551694 = <c1/> instala o wheel publicado. Ele pode estar defasado em relação a este checkout: <c2/> informa quais tipos de cenário sua compilação tem.

# text
seg-333b7956b06b = <b>Playground no navegador.</b> Sem instalação: abra o <a1>Studio</a1>, escolha um cenário, edite os parâmetros e leia o resultado. Nada é enviado; o mecanismo roda no cliente como WebAssembly.

# text
# c1: scenario + seed + engine version
seg-2cd8bbd1e7f0 = Os tutoriais citam a <b>CLI</b>, mas todo comando tem o equivalente em Python e no playground acima. Cada resultado é reprodutível a partir de <c1/>: execute duas vezes e você obtém uma saída idêntica bit a bit.

# text
seg-d497caeb889a = Cenários didáticos anotados

# text
# c1: .toml
# c2: scenarios/
# c3: # expected:
# c4: scenarios/
# c5: tests/tutorials.rs
seg-c966709a600d = Para cada domínio de capacidade há um <c1/> bastante comentado em <a1><c2/></a1>: uma <em>cópia didática</em> de um cenário canônico, com cada campo explicado em linha, a referência independente citada nomeada e o resumo esperado de uma linha registrado como comentário <c3/>. Os valores dos campos são idênticos aos do original no diretório <c4/> de nível superior do repositório (<c5/> compara o TOML interpretado), de modo que a saída documentada continua verdadeira. Os hashes de referência (golden) também ficam intocados: um comentário nunca altera o hash de um cenário.

# text
seg-871fcecc5ee1 = Arquivo didático

# text
seg-4e852a6a1581 = Derivado de

# text
seg-e74e1c9b387e = Integridade (RAIM, monitoramento autônomo de integridade pelo receptor)

# text
seg-95b6cceb76e6 = Segurança (spoofing)

# text
seg-dab48471c270 = PNT híbrido

# text
# c1: kind = "spoof"
# c2: 1 − P_md
# c3: kind
seg-c889e5e77121 = O arquivo didático de <b>segurança</b> usa <c1/> internamente: a figura de mérito de Segurança (<c2/>, um menos a probabilidade de detecção perdida) é produzida pelo pacote spoof. O nome do arquivo segue a <em>capacidade</em> (segurança); o <c3/> segue o <em>pacote</em> (spoof). O cabeçalho desse arquivo destaca isso.

# text
seg-89fef83a9d54 = O catálogo completo de tipos de cenário

# text
# c1: runs > 1
seg-0f744a3a7193 = Holdover de relógio contra a especificação; conjunto Monte-Carlo opcional (<c1/>).

# text
seg-9a2564fdc86a = Navegação por estima inercial de 1-DOF (um grau de liberdade) durante uma interrupção de GNSS.

# text
seg-62f0400581b3 = Disponibilidade de GNSS + diluição da precisão (DOP) a partir de uma constelação (Walker / elementos de duas linhas / RINEX, o Receiver Independent Exchange format).

# text
seg-59fc8330ba12 = Snapshot / separação de soluções / ARAIM (RAIM avançado) com níveis de proteção horizontal e vertical (HPL/VPL) + diagrama de Stanford.

# text
seg-22c598d57e77 = Passagem de níveis de proteção ARAIM no polo sul lunar contra um conjunto de relays LunaNet.

# text
seg-f97d8fb3b6fa = Transferência bidirecional de tempo/frequência óptica contra radiofrequência (RF).

# text
seg-8af1c652d854 = Capstone de PNT híbrido: relógio + unidade de medição inercial (IMU) + auxílio por transferência de tempo.

# text
seg-d24a9596f53e = Filtro de Kalman estendido de estado de erro GNSS/INS (sistema de navegação inercial) com acoplamento fraco e forte.

# text
seg-3c915870476a = Simulação de pseudodistância no domínio da medição (ionosfera Klobuchar, troposfera Saastamoinen/Niell) + RAIM.

# text
seg-72284bad54e4 = Jamming por orçamento de enlace: razão jammer-sinal (J/S) → densidade efetiva de portadora-ruído (C/N₀) → perda de sincronismo (loss of lock).

# text
seg-2ead4d42b427 = Detector estocástico de spoofing de tempo (Neyman–Pearson / χ²₁) com probabilidades de falso alarme e de detecção perdida (P_fa/P_md) por Monte-Carlo.

# text
seg-5f2f9e63093a = Além dos tutoriais: capacidades mais novas

# text
# c1: cargo run -- <file>
# c2: kshana <file>
# c3: tests/tutorials.rs
# c4: label
seg-3d6a8fd31402 = Os três tutoriais ficam nos pacotes clássicos de relógio, órbita e segurança. O mecanismo cresceu muito além deles. Cada linha abaixo é um cenário fornecido que você pode executar como está (<c1/> ou <c2/>); o resumo é a primeira linha que o kshana { "0.35.0" } imprimiu para ele em 2026-10-10. Ao contrário das figuras dos tutoriais, essas linhas são o registro de uma execução, não fixadas por <c3/>: execute o cenário de novo para obter o valor atual. Os resultados declaram seu próprio escopo (a maioria traz um <c4/>), e a <a1>matriz de verificação</a1> declara quais capacidades são VALIDATED contra uma referência independente externa e quais são MODELLED.

# text
seg-2dc1d8680abb = Primeira linha do resumo

# text
seg-abd799395f27 = Espectro da banda L e cascata de jamming

# text
seg-33453b2cfdf3 = O sistema solar em uma época

# text
seg-23bc4ff7f741 = Posicionamento em torno de outro corpo

# text
seg-c135b151e469 = Projeto de constelação em escala

# text
seg-065995e9bd5e = Campanhas: tipos de cenário encadeados em uma linha do tempo

# text
seg-dbae357e7e34 = Um sistema LEO-PNT de ponta a ponta

# text
seg-9d3d72ea03df = Posicionamento MEO + LEO fundido

# text
seg-acc2793d1721 = Sinais, passagens e mensagens de navegação LEO

# text
# c1: LEO pass link budget, air user at 50.00, -30.00; 1 LEO satellite(s), 900 s window
seg-db2626e54a24 = <c1/> (a passagem)

# text
seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

# text
seg-aa93235e8c6d = Convergência de PPP com uma camada LEO; posicionamento 5G

# text
seg-01160980ce50 = Resiliência: GNSS sob jamming, LEO carrega o usuário

# text
seg-adf8453bc035 = Verticais: ferrovia, marítimo, telecom, veículos, Ártico

# text
# c1: scenarios/leo-vertical-rail-maritime.toml
# c2: leo-vertical-*
seg-15a5098b5045 = <c1/> (e os demais arquivos <c2/>)

# text
seg-e6494ed83ee3 = Holdover de telecom contra os limites de relógio G.8272 da ITU-T (União Internacional de Telecomunicações, Setor de Normalização das Telecomunicações)

# text
seg-dfc04f1abe82 = LEO é órbita terrestre baixa e MEO órbita terrestre média; PVT é posição, velocidade e tempo; PPP é posicionamento preciso de ponto; 5G é o padrão móvel de quinta geração; TDB é o Tempo Dinâmico Baricêntrico; JD é a Data Juliana; TE é o erro de tempo.

# text
seg-1d45d94f2e5b = A CLI acrescenta três saídas a qualquer execução:

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
# c3: kshana --study <suite.toml>
# c4: .study.json
# c5: .study.html
# c6: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml
seg-893276648fec = <b>Relatórios.</b> Toda execução grava <c1/> e <c2/> (veja <a1>REPORTS.md</a1>). <c3/> executa uma suíte de cenários em um <c4/> e <c5/>, por exemplo <c6/>.

# text
# c1: kshana <scenario.toml> --animate <svg|html|frames|all>
# c2: --animate html
# c3: scenarios/orbit-sgp4-gps.toml
# c4: orbit-sgp4-gps.animation.html
# c5: solar-system
seg-e9f06d47c82c = <c1/> renderiza as séries temporais da execução, por exemplo <c2/> em <c3/> grava <c4/>. Um tipo de cenário sem eixo de tempo amostrado (como <c5/>) é recusado com um erro; veja <a1>ANIMATION.md</a1>.

# text
seg-f037fe5d7ffa = Exportações de interoperabilidade.

# text
# c1: --export <czml|kml|geojson|stk|sigmf|all|list>
# c2: --export list
# c3: spectrum
# c4: --export-sp3
# c5: --export-omm
# c6: --export-oem
seg-3977722b8517 = <c1/> grava o resultado para outras ferramentas: CZML (Cesium Language), KML (Keyhole Markup Language, para o Google Earth), GeoJSON (JSON geográfico), efemérides STK (Systems Tool Kit) ou uma gravação SigMF (Signal Metadata Format). <c2/> informa quais formatos se aplicam a um cenário; o SigMF se aplica somente a <c3/>. O pacote de órbita também exporta <c4/>, <c5/> e <c6/> (mensagens de órbita do CCSDS, Consultative Committee for Space Data Systems). Veja <a1>INTEROP.md</a1>.

# text
seg-3abd51182cc0 = Exercícios graduados

# text
# c1: exercises/
seg-9513af4fb862 = Percorra a escada. Cada nível é mais difícil e mais defensável que o anterior; as soluções de referência estão em <a1><c1/></a1>.

# text
seg-89ad8eb64a54 = Objetivo

# text
seg-0a824838ef57 = O que você faz

# text
seg-2463a86470b8 = Solução de referência

# text
seg-7ce3ac2347b9 = Nível { "1" } — executar e ler

# text
seg-e1dee35aedff = executar um cenário fornecido sem alterações e ler uma figura de mérito

# text
# c1: scenarios/clock-holdover.toml
# c2: holdover_s
seg-296694716b3b = Execute <c1/>; imprima <c2/> quântico contra clássico. CLI, playground ou uma chamada Python de uma linha.

# text
seg-bad6d3afb6a0 = Nível { "2" } — editar e varrer

# text
seg-c18da238e470 = alterar um parâmetro e observar um efeito monótono

# text
# c1: threshold_ns
# c2: kind = "sweep"
# c3: "sweep-nd"
seg-598ca8efea83 = Aperte a especificação do relógio (<c1/>) ou alongue a interrupção e veja o holdover cair; ou use <c2/>/<c3/> para tabulá-lo.

# text
seg-1d9dfecce6fa = Nível { "3" } — quantificar e defender

# text
seg-5b57f2c8ffb9 = Monte-Carlo, faixas de confiança, reprodutibilidade e um nível de proteção

# text
# c1: runs = N
# c2: scenario_hash
seg-0fac2036b289 = Execute um conjunto de relógios (<c1/>), leia a faixa [p05–p95], confirme que duas execuções dão um <c2/> idêntico e leia um resultado de integridade / Stanford.

# text
# c1: maturin develop --features python
# c2: tier2_sweep.py
seg-45dc753da682 = As soluções de referência usam a extensão Python (<c1/> primeiro). Executado a partir da raiz do repositório, <c2/> imprime o holdover do relógio atômico em escala de chip caindo de { "2610" } s com especificação de { "20" } ns para { "1140" } s a { "5" } ns.

# text
seg-e59b1beadb98 = Quer dados novos?

# text
seg-530db2e609d0 = Os números de destaque nestes tutoriais rodam inteiramente a partir de cenários já presentes no repositório. Nada é baixado, o que os mantém reprodutíveis e seguros para rodar em integração contínua (CI). Para os exercícios de “estenda”, você pode puxar dados ao vivo:

# text
# c1: scripts/fetch_tles.sh
seg-6a20ec96cb92 = <b>Elementos de duas linhas (TLEs) do GPS</b> (atualizar a constelação de órbita): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, conjuntos de elementos de 3 linhas em texto simples (nome + linha { "1" } + linha { "2" }). Auxiliar: <c1/>. Dados abertos (catálogo do 18th Space Defense Squadron da US Space Force, redistribuído pelo Celestrak, Dr T. S. Kelso).

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
seg-9bcea1d9eb12 = <b>Referência independente de verificação do SGP4 (Simplified General Perturbations { "4" })</b> (já incluída, não baixe de novo): vetores de teste AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 “Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, usados por <c1/>; veja <a2><c2/></a2>.

# text
seg-d33aa34b2762 = <b>Referência independente das relações de estabilidade de relógio</b>: Publicação Especial { "1065" } do NIST (National Institute of Standards and Technology) (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, as relações σ_y(τ)↔fase por trás do Tutorial { "2" }.

# text
seg-36be39f17e35 = <s1>Anterior</s1>Guia do Studio

# text
seg-6f6204737a87 = <s1>Próximo</s1>{ "1" } · Sua primeira órbita

seg-2fa9e002b3a2 = O mecanismo despacha pelo <c1/> do cenário. A tabela abaixo lista os tipos de cenário mais usados (os oito domínios de tutorial acima mais seus vizinhos mais próximos). Ela <b>não</b> é o conjunto completo: <c2/> devolve todos os <c3/> tipos de cenário embutidos. Essa função (exposta como <c4/> nos bindings Python e WebAssembly (WASM), e como <c5/> na linha de comando) é o catálogo autoritativo e sempre atual, e <a1><c6/></a1> é sua enumeração gerada, uma seção por tipo de cenário com os campos TOML obrigatórios e opcionais. <c7/> garante que todo tipo de cenário que um tutorial documenta é um tipo de despacho real, de modo que nada nesta tabela pode nomear um tipo de cenário que não existe.
