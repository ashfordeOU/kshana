# docs--reports: translations (pt-BR)

# text
seg-3ea93ae372ca = O que contém

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campanhas

# text
seg-aa5482ac34ff = Limites, declarados com clareza

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Fonte: <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Toda execução da interface de linha de comando (CLI) grava um relatório ao lado de seu resultado: uma página HyperText Markup Language (HTML) imprimível, <c1/>, e um documento JavaScript Object Notation (JSON) legível por máquina, <c2/>, com o mesmo conteúdo. O relatório funciona para qualquer tipo de cenário e para campanhas.

# text
seg-e26b1a83a86d = O documento de resultado responde a <em>o que o motor calculou</em>. O relatório acrescenta o que um leitor precisa antes de agir com base nele: o que entrou, em que os números se apoiam, o que foi deixado de fora e como obter os mesmos bytes de novo. Ele não inventa nada disso. Cada seção é lida de uma fonte que o motor já mantém e nomeia a fonte ao lado do que cita.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = O construtor é <c1/> (<c2/>). É uma função pura da saída da execução, dos bytes do arquivo de cenário e da linha de comando: não lê relógio, arquivo nem rede, e compila para WebAssembly.

# text
seg-bed0af192da5 = Seções

# text
seg-fca842769048 = Seção

# text
seg-2654051d8292 = Lida de

# text
seg-5790851a4a5f = Resumo executivo

# text
seg-3d34b2ef5988 = o que o tipo de cenário faz, o resumo de uma linha da execução, os valores principais, o rótulo de honestidade no nível da execução, a contagem de capacidades VALIDATED / MODELLED / PARTNER usadas

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = o catálogo de tipos de cenário (<c1/>), o <c2/> do resultado, seu bloco <c3/> ou bloco de figuras de mérito, os percentis de uma campanha Monte Carlo

# text
seg-e1ce0e8d5c61 = todo campo que o arquivo de cenário define, achatado até seu caminho, com sua unidade e a origem da unidade

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = o arquivo de cenário; unidades do bloco <c1/> do resultado (o esquema de unidades de campo, <c2/>), senão o sufixo do nome do campo (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); uma unidade que nenhum dos dois declara é impressa como <b>não declarada</b>

# text
seg-88ccaef6fc49 = o gráfico da execução, todo escalar do documento de resultado com sua unidade, e um resumo de contagem / mínimo / máximo / primeiro / último de toda coluna numérica

# text
# c1: units
seg-42a82485f8c8 = o documento de resultado e seu bloco <c1/>

# text
seg-f554fbcdd85c = Agregação (campanhas e varreduras)

# text
seg-7c0466805f54 = a tabela de nós de uma varredura; a média, o desvio padrão, os percentis 5 / 50 / 95 e o intervalo de confiança de { "95" }% da média de uma execução Monte Carlo, com um histograma por métrica; a tabela de fases de uma cadeia; as condições compartilhadas, os membros e o resumo combinado de uma composição

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = a seção <c1/>, <c2/>, <c3/> ou <c4/> do resultado da campanha; a grade de um resultado <c5/> ou <c6/>

# text
seg-3bf44008fc65 = Animação e exportações

# text
# c1: --animate svg
seg-64d1073dfadc = o desenho animado da execução (a saída <c1/>) incorporado como imagem inerte, ou o motivo de não haver; links para os arquivos de animação e de interoperabilidade que o mesmo comando gravou ao lado do relatório; todo formato de exportação, com a indicação de se se aplica ao cenário, o motivo de não se aplicar e sua especificação

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = o exportador de animação (<c1/>), <c2/> e os arquivos que a linha de comando gravou (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Linha do tempo de eventos

# text
seg-f29f1b90edbd = janelas temporizadas e eventos pontuais, desenhados e tabulados no eixo de tempo da execução

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = tabelas de cenário com <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> ou um tempo de início; o intervalo da execução <c7/>; qualquer matriz <c8/> no resultado; as fases e transferências de uma campanha

# text
seg-00bee96167aa = Rótulos de verificação

# text
seg-6dea392111a6 = toda linha da matriz de verificação que os tipos de cenário da execução exercitam, com seu rótulo, sua referência independente e sua evidência de teste, e os níveis por figura que o resultado declara

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = a matriz de verificação (<c1/>, <c2/>), pela correspondência entre tipo de cenário e linha <c3/>

# text
seg-c19ae28a2355 = Não modelado, e premissas

# text
seg-aff7a016c7e2 = cada limitação, citada

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = os blocos <c1/>, <c2/> e <c3/> do resultado; cláusulas MODELLED do catálogo de tipos de cenário; comentários do cenário e textos de entrada que dizem "not modelled"; o motivo pelo qual cada linha MODELLED da matriz permanece modelada (<c4/>)

# text
seg-a3ee5ba71183 = Registro de reprodutibilidade

# text
seg-a9746c2f1881 = versão do motor, commit de origem, resumos Secure Hash Algorithm 256-bit (SHA-256) do arquivo de cenário e do documento de resultado, semente, plataforma, o comando exato, a regra do diretório de trabalho, o resumo de cada arquivo de entrada adicional

# text
seg-ec1f62f6bbd1 = a compilação, os arquivos, a linha de comando

# text
seg-ea460048debd = Uma seção sem nada a listar diz o motivo em uma frase (por exemplo, "Nenhum evento temporizado: o cenário não programa nenhuma janela ou tempo de início e o resultado não informa nenhum evento"). Nenhuma seção fica vazia e em silêncio.

# text
seg-b99234469953 = O que significa um rótulo no relatório

# text
seg-f9060b1e8077 = Um rótulo de verificação avalia a <b>capacidade</b> nomeada em uma linha da matriz, tal como a matriz a registra. Ele não avalia a configuração do cenário, e uma linha VALIDATED não faz com que as entradas de uma execução sejam medidas. Uma linha PARTNER é uma disciplina em que a execução se apoia e que o Kshana não fornece (hardware de antena para os tipos de cenário de radiofrequência, a carga útil quântica para os tipos de cenário quânticos, o barramento da espaçonave para o orçamento de atitude); o relatório a mostra como <em>dependida, não fornecida</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = A correspondência entre tipo de cenário e linhas é uma tabela de strings <c1/> da matriz. O rótulo, a referência independente e a evidência são relidos da matriz quando o relatório é construído, de modo que mover uma linha entre VALIDATED e MODELLED move com ela todo relatório. Uma campanha traz a linha de seu modo (cadeia, varredura ou Monte Carlo, composição) mais toda linha de cada tipo de cenário membro que executou; <c2/> traz as linhas do tipo de cenário que varreu. Toda execução também traz a linha "Reproducibility & software assurance", em que o registro de reprodutibilidade se apoia.

# text
# c1: advanced_report::PATH_GATED_CAPABILITIES
# c2: orbit
# c3: ephemeris
# c4: tle
# c5: slot-timing
# c6: oscillator.record
# c7: spectrum
# c8: [[panels]]
# c9: leo-pass
# c10: leo-pnt-chain
# c11: leo-navmsg
# c12: leo-pvt
# c13: terrain-nav
# c14: terrain-slam
seg-f38434695c28 = Uma linha que avalia apenas um caminho de entrada de um tipo de cenário só é listada quando a execução seguiu esse caminho (<c1/>): <c2/> e <c3/> trazem a linha "Orbit propagation & determination" apenas com um <c4/> (o caminho Simplified General Perturbations { "4" } (SGP4); uma órbita analítica é uma propagação de dois corpos), e <c5/> traz a linha de registro medido apenas com um <c6/>. A mesma tabela condiciona a linha multibanda de <c7/> a que a execução desenhe <c8/>, e as linhas dos tipos de cenário de órbita terrestre baixa (LEO) ao caminho que cada execução seguiu: uma linha de chuva, de entrada em edifício, de baixa energia ou de spoofer em <c9/> ou <c10/> apenas quando o cenário define esse termo, a linha de cintilação a menos que o cenário a desligue, uma linha de posicionamento por ponto preciso em <c11/>, <c12/> ou em cadeia apenas para a análise ou o modo que o resultado traz, e a linha de predefinição de sistema LEO apenas quando uma predefinição nomeada é usada. A linha do leitor da Shuttle Radar Topography Mission (SRTM) não é trazida por nenhum tipo de cenário: <c13/> e <c14/> rodam em um modelo digital de elevação (DEM) sintético, e nenhum campo de cenário lê um ladrilho SRTM. Uma linha VALIDATED que a execução nunca tocou alegaria, de outro modo, uma evidência que a execução não tem.

# text
seg-29efeadac5c7 = Reproduzir uma execução a partir de seu relatório

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> contém tudo o que é necessário:

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Verifique o arquivo de cenário em relação a <c1/>, e qualquer arquivo em <c2/> (um arquivo de orientação da Terra <c3/>) em relação ao seu resumo.

# text
# c1: command
seg-5b3c59266451 = Execute <c1/> a partir do diretório em que a execução original foi iniciada. O caminho do cenário e qualquer caminho relativo de dados dentro do cenário são resolvidos em relação a ele.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = O novo <c1/> tem o SHA-256 de <c2/>, e o novo <c3/> e o novo <c4/> são idênticos byte a byte aos antigos.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> faz exatamente isso para um cenário de relógio, uma campanha em cadeia, uma campanha de varredura e uma execução de órbita com um arquivo <c2/>: lê o comando do relatório, executa-o em um diretório novo que contém apenas as entradas registradas e compara os bytes.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> é o resumo dos bytes exatos do arquivo. O <c2/> do próprio resultado é outra coisa: a impressão digital do tipo de cenário para o cenário (muitas vezes de uma forma canônica), e o relatório imprime ambos, rotulados.

# text
# c1: seed
seg-3d72d2059a6c = <b>Semente.</b> A semente é o <c1/> do cenário, senão a que o resultado declara. Para um tipo de cenário que não usa semente, o relatório diz isso, e diz que apenas o arquivo de cenário e a compilação do motor fixam o resultado.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Commit de origem.</b> O motor registra o commit apenas se foi compilado com a variável de ambiente <c1/> definida, lida em tempo de compilação:

# text
seg-3c7ed74729d3 = Uma compilação sem ela informa o commit como não registrado, e a versão do motor identifica a versão publicada. Nada é adivinhado.

# text
seg-86ff67531a0e = <b>Plataforma.</b> Sistema operacional, arquitetura e família da compilação. Os resultados são idênticos byte a byte em uma mesma plataforma; entre plataformas, os resultados em ponto flutuante podem diferir nos últimos dígitos (veja <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Determinismo e o único carimbo de tempo

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = O mesmo conteúdo de cenário, a mesma semente e a mesma compilação do motor dão <c1/> e <c2/> idênticos byte a byte. O relatório não traz carimbo de tempo. A única leitura de relógio em todo o crate é a que <c3/> faz, que grava <c4/> no documento de resultado; o relatório então mostra esse carimbo e diz que é o único campo que uma reprodução não vai igualar. Para evitá-lo, execute sem <c5/>. <c6/> constrói o relatório de todo arquivo de cenário em <c7/> (exceto o manifesto da suíte) duas vezes e reexecuta seis cenários (entre eles uma campanha de cada um dos modos cadeia, varredura e composição) para verificar isso de ponta a ponta.

# text
seg-8a3fc60a5b54 = Impressão em PDF

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = O motor não grava arquivos Portable Document Format (PDF). Um gerador de PDF que renderizasse os gráficos exigiria uma dependência nova e pesada, de modo que não há opção <c1/>. Em vez disso, <c2/> traz uma folha de estilo de impressão: abra-o em um navegador, imprima e escolha "Salvar como PDF".

# text
seg-13f1f294ede1 = A folha de estilo é escrita para A4 e para US Letter. Ela não define tamanho de papel (vale a escolha da caixa de diálogo de impressão), mantém margens de { "15" } mm / { "14" } mm que servem em qualquer das folhas, muda para preto sobre branco, repete os cabeçalhos de tabela em cada página, impede que linhas de tabela, figuras e cartões sejam divididos entre páginas, mantém os títulos junto ao texto que os segue e começa as seções de entradas, resultados, rótulos de verificação e reprodutibilidade em uma nova página. A barra de navegação fica oculta na impressão.

# text
seg-a25bb320665d = O documento JSON

# text
# c1: report.json
# c2: report_schema = "kshana-report"
# c3: report_schema_version = "1.0"
# c4: kind
# c5: title
# c6: executive_summary
# c7: inputs
# c8: results
# c9: aggregation
# c10: events
# c11: capabilities
# c12: not_modelled
# c13: companions
# c14: animation
# c15: exports
# c16: export_command
# c17: reproducibility
# c18: items
# c19: omitted
# c20: items
# c21: statement
# c22: value
# c23: display
# c24: null
# c25: value
# c26: display
seg-9d9af39942a7 = <c1/> tem <c2/> e <c3/>, depois <c4/> e <c5/> e uma chave por seção: <c6/>, <c7/>, <c8/>, <c9/> (apenas campanhas e varreduras), <c10/>, <c11/>, <c12/>, <c13/> (seção 3b: <c14/>, <c15/> e <c16/>) e <c17/>. Uma seção de lista tem <c18/>, <c19/> (as linhas que o limite da página deixou de fora; o documento de resultado traz todos os valores) e, quando <c20/> está vazio, uma <c21/> dizendo o motivo. Um valor mantém sua forma JSON bruta em <c22/> e o texto que a página mostra em <c23/>; um valor ausente é <c24/> em <c25/> e "sem valor" em <c26/>.

# text
seg-06cc70ca3601 = <b>Unidades.</b> Onde nem o esquema de unidades de campo nem o nome do campo dão uma unidade, o relatório diz "não declarada" em vez de adivinhar. As entradas aninhadas nos cenários membros de uma campanha são resolvidas apenas em relação ao bloco de unidades da própria campanha e ao sufixo do nome do campo, de modo que mais delas aparecem como "não declarada" do que em uma execução isolada.

# text
seg-023d5a1fbffc = <b>Julgamento da correspondência.</b> Quais linhas da matriz um tipo de cenário exercita é uma tabela curada, verificada por um teste para nomear exatamente uma linha existente por entrada e para cobrir todo tipo de cenário embutido. Se cada mapeamento é o correto é um julgamento humano, como a própria escolha da referência independente da matriz.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Limites.</b> A página lista no máximo { "400" } entradas, { "150" } resultados escalares, { "60" } colunas numéricas e { "200" } eventos; <c1/> conta o restante. Uma tabela com mais de { "24" } linhas dentro de um cenário (uma série ingerida) é resumida por coluna.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> mantém seus próprios <c2/> e <c3/>; não grava este relatório.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Bindings.</b> Os bindings de Python e WebAssembly mantêm <c1/>, o painel de resultados de uma página; o relatório baixável do playground é sua própria página (<c2/>). Este relatório é gravado pela CLI, e chamadores em Rust podem construí-lo com <c3/>. O servidor do Model Context Protocol (MCP) o devolve a partir de sua ferramenta <c4/>, como JSON ou como página HTML; o nome do arquivo de cenário em seu comando de reprodução é o que o chamador passa (padrão <c5/>), e ele não lista nenhum arquivo acompanhante, já que o servidor não grava nenhum.

# text
seg-c8ab7b4605cf = <s1>Próximo</s1>Exportação de animação
