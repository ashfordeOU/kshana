# docs--line-coverage: translations (pt-PT)

# text
seg-31d58f23c0a2 = Executar

# text
seg-08994a4765be = Âmbito

# text
# c1: docs/COVERAGE.md
seg-a6eaa5a5d095 = Fonte: <c1/>

# text
seg-d4e29eac0ab3 = Cobertura de linhas — a medição de referência

# text
# c1: tests/coverage_figure_doc_sync.rs
seg-931a2a7e9022 = A "cobertura de linhas de ~{ "95" } %" no emblema do README, na tabela de CI (integração contínua) do README, nas páginas iniciais do crates.io e do PyPI (Python Package Index), na página de cobertura de linhas do kshana.dev e no relatório técnico é <b>esta</b> medição, arredondada à percentagem inteira mais próxima. <c1/> falha se qualquer uma dessas seis superfícies indicar um valor diferente do registado abaixo, pelo que a próxima nova medição move todas em conjunto ou nenhuma.

# text
seg-f3526b0d95f8 = Medido

# text
seg-6f8d24ecb89f = — { "55,970" } de { "58,697" } linhas

# text
seg-03065c20d4d8 = Commit

# text
# c1: db796dd
# c2: v0.29.0
seg-d734cdb77d70 = <c1/> (motor { "0.29.0" }, a etiqueta <c2/>)

# text
# c1: ci.yml
# c2: coverage
seg-a2af6144b6a0 = GitHub Actions, tarefa <c1/> <c2/>, execução { "36809850252" }, 2026-10-01

# text
seg-b88a2a9497c2 = Ferramenta

# text
# c1: cargo tarpaulin --engine llvm
seg-f2f07088027a = <c1/> (instrumentação baseada em código-fonte do LLVM)

# text
# c1: src/
# c2: src/*_data.rs
# c3: src/main.rs
# c4: tests/
# c5: web/
seg-a3223ee99178 = <c1/>, excluindo as tabelas de dados geradas <c2/> e o ponto de entrada fino da CLI (interface de linha de comandos) <c3/>; <c4/> e <c5/> não são medidos

# text
seg-894b740fd381 = Artefacto

# text
# c1: coverage-lcov
# c2: lcov.info
seg-1d6c540fd916 = <c1/> (<c2/>, { "290" } ficheiros de código-fonte) anexado a essa execução

# text
seg-17f916216c92 = Limite mínimo

# text
# c1: 85 %
# c2: --fail-under 85
seg-32861ca47b0c = a mesma tarefa falha abaixo de <c1/> (<c2/>) — o limite mínimo é imposto em cada push; o valor acima é um registo, não uma barreira

# text
# c1: .github/workflows/ci.yml
seg-63b9b152cde7 = O comando, literal a partir de <c1/>:

# text
# c1: main
# c2: lcov.info
seg-121c43cf260f = Cada push para <c1/> volta a executar a tarefa e anexa um novo <c2/>. Para alterar o valor publicado, descarregue o artefacto de uma execução verde e some-o:

# text
seg-b566e95a74ab = depois atualize a tabela acima e as seis superfícies no mesmo commit; o teste de sincronização da documentação nomeia as que falhar.

# text
seg-6935c9c381b3 = Histórico

# text
# c1: b1d350d
# c2: 1daa012
# c3: CHANGELOG.md
# c4: paper/kshana-technical-report.md
seg-daa9ae1913cd = O valor foi voltado a medir, não voltado a escrever: { "95.63" } % no commit <c1/> (motor { "0.27.2" } + não lançado, execução { "35934579709" }, 2026-09-24, { "37,697" } de { "39,419" } linhas, publicado como ~{ "96" } %), revisto para { "95.35" } % na { "0.29.0" } (acima), que arredonda para ~{ "95" } %: o código cresceu { "19,278" } linhas medidas e as novas linhas estão ligeiramente menos cobertas do que as antigas; { "95.85" } % na { "v0.17.0" } (commit <c2/>, 2026-06-14, publicado como ~{ "96" } %), e ~{ "97" } % em duas notas de versão anteriores (<c3/>, deixadas como histórico). <c4/> dizia "cerca de { "97" } %" até ser levado a este registo; é agora a sexta superfície que o teste fixa.

# text
seg-b2dbaf3a3b68 = <s1>Anterior</s1>Normas e interoperabilidade

# text
seg-508de3808e04 = <s1>Seguinte</s1>Pacotes de evidências
