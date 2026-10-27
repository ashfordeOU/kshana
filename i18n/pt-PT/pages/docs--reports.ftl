# docs--reports: translations (pt-PT)

# text
seg-3ea93ae372ca = O que contém

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campanhas

# text
seg-aa5482ac34ff = Limites, indicados com clareza

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Fonte: <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Cada execução da interface de linha de comandos (CLI) escreve um relatório ao lado do seu resultado: uma página HyperText Markup Language (HTML) imprimível, <c1/>, e um documento JavaScript Object Notation (JSON) legível por máquina, <c2/>, com o mesmo conteúdo. O relatório funciona para qualquer tipo de cenário e para campanhas.

# text
seg-e26b1a83a86d = O documento de resultado responde a <em>o que o motor calculou</em>. O relatório acrescenta o que um leitor precisa antes de agir com base nele: o que entrou, em que assentam os números, o que ficou de fora, e como obter novamente os mesmos bytes. Não inventa nada disso. Cada secção é lida de uma fonte que o motor já mantém, e nomeia a fonte junto ao que cita.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = O construtor é <c1/> (<c2/>). É uma função pura da saída da execução, dos bytes do ficheiro de cenário e da linha de comandos: não lê nenhum relógio, nenhum ficheiro e nenhuma rede, e compila para WebAssembly.

# text
seg-bed0af192da5 = Secções

# text
seg-fca842769048 = Secção

# text
seg-2654051d8292 = Lido de

# text
seg-5790851a4a5f = Resumo executivo

# text
seg-3d34b2ef5988 = o que o tipo de cenário faz, o resumo de uma linha da execução, valores principais, a etiqueta de honestidade ao nível da execução, a contagem de capacidades VALIDATED / MODELLED / PARTNER usadas

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = o catálogo de tipos de cenário (<c1/>), o <c2/> do resultado, o seu bloco <c3/> ou bloco de figuras de mérito, os percentis de uma campanha Monte Carlo

# text
seg-e1ce0e8d5c61 = todos os campos que o ficheiro de cenário define, aplanados até ao seu caminho, com a sua unidade e a origem da unidade

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = o ficheiro de cenário; unidades do bloco <c1/> do resultado (o esquema de unidades de campo, <c2/>), senão o sufixo do nome do campo (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); uma unidade que nenhum dos dois indica é impressa como <b>não indicada</b>

# text
seg-88ccaef6fc49 = o gráfico da execução, todos os escalares do documento de resultado com a sua unidade, e um resumo de contagem / mínimo / máximo / primeiro / último de cada coluna numérica

# text
# c1: units
seg-42a82485f8c8 = o documento de resultado e o seu bloco <c1/>

# text
seg-f554fbcdd85c = Agregação (campanhas e varrimentos)

# text
seg-7c0466805f54 = a tabela de nós de um varrimento; a média, o desvio-padrão, os percentis 5 / 50 / 95 e o intervalo de confiança de { "95" }% da média de uma execução Monte Carlo, com um histograma por métrica; a tabela de fases de uma cadeia; as condições partilhadas, os membros e o resumo combinado de uma composição

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = a secção <c1/>, <c2/>, <c3/> ou <c4/> do resultado da campanha; a grelha de um resultado <c5/> ou <c6/>

# text
seg-3bf44008fc65 = Animação e exportações

# text
# c1: --animate svg
seg-64d1073dfadc = o desenho animado da execução (a saída <c1/>) incorporado como imagem inerte, ou a razão de não existir; ligações aos ficheiros de animação e de interoperabilidade que o mesmo comando escreveu junto ao relatório; cada formato de exportação, com a indicação de se se aplica ao cenário, porque não, e a sua especificação

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = o exportador de animação (<c1/>), <c2/> e os ficheiros que a linha de comandos escreveu (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Cronologia de eventos

# text
seg-f29f1b90edbd = janelas temporizadas e eventos pontuais, desenhados e tabelados no eixo temporal da execução

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = tabelas de cenário com <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> ou um instante de início; o intervalo da execução <c7/>; qualquer matriz <c8/> no resultado; as fases e transferências de uma campanha

# text
seg-00bee96167aa = Etiquetas de verificação

# text
seg-6dea392111a6 = cada linha da matriz de verificação que os tipos de cenário da execução exercitam, com a sua etiqueta, referência independente e evidência de testes, e os níveis por valor que o resultado indica

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = a matriz de verificação (<c1/>, <c2/>), através da correspondência entre tipo de cenário e linhas <c3/>

# text
seg-c19ae28a2355 = Não modelado, e pressupostos

# text
seg-aff7a016c7e2 = cada limitação, citada

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = os blocos <c1/>, <c2/> e <c3/> do resultado; as cláusulas MODELLED do catálogo de tipos de cenário; os comentários do cenário e o texto de entrada que dizem "not modelled"; a razão por que cada linha MODELLED da matriz continua modelada (<c4/>)

# text
seg-a3ee5ba71183 = Registo de reprodutibilidade

# text
seg-a9746c2f1881 = versão do motor, commit de origem, resumos Secure Hash Algorithm de 256 bits (SHA-256) do ficheiro de cenário e do documento de resultado, semente, plataforma, o comando exato, a regra do diretório de trabalho, o resumo de cada outro ficheiro de entrada

# text
seg-ec1f62f6bbd1 = a compilação, os ficheiros, a linha de comandos

# text
seg-ea460048debd = Uma secção sem nada para listar diz porquê numa frase (por exemplo, "No timed event: the scenario scripts no window or onset time and the result reports no event"). Nenhuma secção fica alguma vez vazia e muda.

# text
seg-b99234469953 = O que significa uma etiqueta no relatório

# text
seg-f9060b1e8077 = Uma etiqueta de verificação classifica a <b>capacidade</b> indicada numa linha da matriz, tal como a matriz a regista. Não classifica a configuração do cenário, e uma linha VALIDATED não torna medidas as entradas de uma execução. Uma linha PARTNER é uma disciplina em que a execução se apoia e que o Kshana não fornece (hardware de antena para os tipos de cenário de radiofrequência, a carga útil quântica para os tipos de cenário quânticos, a plataforma da nave para o orçamento de atitude); o relatório mostra-a como <em>assumida, não fornecida</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = A correspondência de tipo de cenário para linhas é uma tabela de cadeias <c1/> da matriz. A etiqueta, a referência independente e a evidência são lidas de novo da matriz quando o relatório é construído, pelo que mover uma linha entre VALIDATED e MODELLED move com ela todos os relatórios. Uma campanha traz a linha do seu modo (cadeia, varrimento ou Monte Carlo, composição) mais todas as linhas de todos os tipos de cenário membros que executou; <c2/> traz as linhas do tipo de cenário que varreu. Cada execução traz também a linha "Reproducibility & software assurance", em que assenta o registo de reprodutibilidade.

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
seg-f38434695c28 = Uma linha que classifica apenas um caminho de entrada de um tipo de cenário só é listada quando a execução seguiu esse caminho (<c1/>): <c2/> e <c3/> trazem a linha "Orbit propagation & determination" apenas com um <c4/> (o caminho Simplified General Perturbations { "4" } (SGP4); uma órbita analítica é uma propagação de dois corpos), e <c5/> traz a linha do registo medido apenas com um <c6/>. A mesma tabela condiciona a linha multibanda de <c7/> à execução que desenha <c8/>, e as linhas dos tipos de cenário de órbita terrestre baixa (LEO) ao caminho que cada execução seguiu: uma linha de chuva, entrada em edifícios, baixa energia ou spoofer de <c9/> ou <c10/> só quando o cenário define esse termo, a linha de cintilação a menos que o cenário a desligue, uma linha de <c11/>, <c12/> ou de posicionamento de ponto preciso em cadeia só para a análise ou o modo que o resultado traz, e a linha de predefinição de sistema LEO só quando é usada uma predefinição com nome. A linha do leitor da Shuttle Radar Topography Mission (SRTM) não é trazida por nenhum tipo de cenário: <c13/> e <c14/> executam-se sobre um modelo digital de elevação (DEM) sintético, e nenhum campo de cenário lê um mosaico SRTM. Uma linha VALIDATED em que a execução nunca tocou reivindicaria, de outro modo, evidência que a execução não tem.

# text
seg-29efeadac5c7 = Reproduzir uma execução a partir do seu relatório

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> contém tudo o que é necessário:

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Verifique o ficheiro de cenário face a <c1/>, e qualquer ficheiro em <c2/> (um ficheiro de orientação da Terra <c3/>) face ao seu resumo.

# text
# c1: command
seg-5b3c59266451 = Execute <c1/> a partir do diretório em que a execução original foi iniciada. O caminho do cenário, e qualquer caminho de dados relativo dentro do cenário, são resolvidos a partir dele.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = O novo <c1/> tem o SHA-256 de <c2/>, e o novo <c3/> e o novo <c4/> são idênticos ao byte aos antigos.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> faz exatamente isto para um cenário de relógio, uma campanha encadeada, uma campanha de varrimento e uma execução de órbita com um ficheiro <c2/>: lê o comando do relatório, executa-o num diretório novo que contém apenas as entradas registadas, e compara bytes.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> é o resumo dos bytes exatos do ficheiro. O <c2/> do próprio resultado é outra coisa, a impressão digital do cenário feita pelo tipo de cenário (muitas vezes de uma forma canónica), e o relatório imprime ambos, etiquetados.

# text
# c1: seed
seg-3d72d2059a6c = <b>Semente.</b> A semente é a <c1/> do cenário, ou então a que o resultado indica. Para um tipo de cenário que não usa semente, o relatório di-lo, e diz que só o ficheiro de cenário e a compilação do motor fixam o resultado.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Commit de origem.</b> O motor só regista o commit se tiver sido compilado com a variável de ambiente <c1/> definida, lida em tempo de compilação:

# text
seg-3c7ed74729d3 = Uma compilação sem ela comunica o commit como não registado, e a versão do motor identifica a edição. Nada é adivinhado.

# text
seg-86ff67531a0e = <b>Plataforma.</b> Sistema operativo, arquitetura e família da compilação. Os resultados são idênticos ao byte numa mesma plataforma; entre plataformas, os resultados de vírgula flutuante podem diferir nos últimos algarismos (ver <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Determinismo e a única marca temporal

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = O mesmo conjunto de bytes de cenário, semente e compilação do motor dá um <c1/> e um <c2/> idênticos ao byte. O relatório não traz nenhuma marca temporal. A única leitura de relógio em toda a crate é a que <c3/> faz, que carimba <c4/> no documento de resultado; o relatório mostra então esse carimbo e diz que é o único campo que uma reprodução não irá igualar. Para o evitar, execute sem <c5/>. <c6/> constrói duas vezes o relatório de cada ficheiro de cenário em <c7/> (exceto o manifesto da suite), e volta a executar seis cenários (entre eles uma campanha de cada um dos modos cadeia, varrimento e composição) para verificar isto de ponta a ponta.

# text
seg-8a3fc60a5b54 = Imprimir para PDF

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = O motor não escreve ficheiros Portable Document Format (PDF). Um escritor de PDF que desenhasse os gráficos significaria uma dependência nova e pesada, pelo que não existe a opção <c1/>. Em vez disso, <c2/> traz uma folha de estilos de impressão: abra-o num navegador, imprima e escolha "Guardar como PDF".

# text
seg-13f1f294ede1 = A folha de estilos é escrita tanto para A4 como para US Letter. Não define nenhum tamanho de papel (aplica-se a escolha da caixa de diálogo de impressão), mantém margens de { "15" } mm / { "14" } mm que servem em qualquer das folhas, passa a preto sobre branco, repete os cabeçalhos das tabelas em todas as páginas, impede que linhas de tabela, figuras e cartões se dividam entre páginas, mantém os títulos com o texto que se segue, e inicia as secções de entradas, resultados, etiquetas de verificação e reprodutibilidade numa página nova. A barra de navegação fica oculta na impressão.

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
seg-9d9af39942a7 = <c1/> tem <c2/> e <c3/>, depois <c4/> e <c5/> e uma chave por secção: <c6/>, <c7/>, <c8/>, <c9/> (apenas campanhas e varrimentos), <c10/>, <c11/>, <c12/>, <c13/> (secção 3b: <c14/>, <c15/> e <c16/>) e <c17/>. Uma secção de lista tem <c18/>, <c19/> (as linhas que o limite da página deixou de fora; o documento de resultado traz todos os valores) e, quando <c20/> está vazio, uma <c21/> que diz porquê. Um valor mantém a sua forma JSON em bruto em <c22/> e o texto que a página mostra em <c23/>; um valor em falta é <c24/> em <c25/> e "no value" em <c26/>.

# text
seg-06cc70ca3601 = <b>Unidades.</b> Quando nem o esquema de unidades de campo nem o nome do campo dão uma unidade, o relatório diz "not stated" em vez de adivinhar. As entradas aninhadas nos cenários membros de uma campanha são resolvidas apenas face ao bloco de unidades da própria campanha e ao sufixo do nome do campo, pelo que mais delas surgem como "not stated" do que numa execução autónoma.

# text
seg-023d5a1fbffc = <b>Juízo sobre a correspondência.</b> As linhas da matriz que um tipo de cenário exercita são uma tabela curada, verificada por um teste para nomear exatamente uma linha existente por entrada e para cobrir todos os tipos de cenário incorporados. Se cada correspondência é a certa é um juízo humano, como a escolha da própria matriz quanto à referência independente.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Limites.</b> A página lista no máximo { "400" } entradas, { "150" } resultados escalares, { "60" } colunas numéricas e { "200" } eventos; <c1/> conta os restantes. Uma tabela com mais de { "24" } linhas dentro de um cenário (uma série ingerida) é resumida por coluna.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> mantém os seus próprios <c2/> e <c3/>; não escreve este relatório.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Ligações.</b> As ligações (bindings) de Python e WebAssembly mantêm <c1/>, o painel de resultados de uma página; o relatório descarregável do espaço de experimentação é uma página própria (<c2/>). Este relatório é escrito pela CLI, e os chamadores em Rust podem construí-lo com <c3/>. O servidor Model Context Protocol (MCP) devolve-o a partir da sua ferramenta <c4/>, como JSON ou como página HTML; o nome do ficheiro de cenário no seu comando de reprodução é o que o chamador passa (predefinição <c5/>), e não lista nenhum ficheiro acompanhante, porque o servidor não escreve nenhum.

# text
seg-c8ab7b4605cf = <s1>Seguinte</s1>Exportação de animação
