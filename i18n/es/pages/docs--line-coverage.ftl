# docs--line-coverage: translations (es)

# text
seg-31d58f23c0a2 = Ejecutar

# text
seg-08994a4765be = Ámbito

# text
# c1: docs/COVERAGE.md
seg-a6eaa5a5d095 = Fuente: <c1/>

# text
seg-d4e29eac0ab3 = Cobertura de líneas: la medición de referencia

# text
# c1: tests/coverage_figure_doc_sync.rs
seg-931a2a7e9022 = La "cobertura de líneas de ~{ "95" } %" de la insignia del README, de la tabla de CI (integración continua) del README, de las portadas de crates.io y PyPI (Python Package Index), de la página de cobertura de líneas de kshana.dev y del informe técnico es <b>esta</b> medición, redondeada al porcentaje entero más próximo. <c1/> falla si alguna de esas seis superficies indica una cifra distinta de la registrada abajo, de modo que la siguiente nueva medición las mueve todas juntas o ninguna.

# text
seg-f3526b0d95f8 = Medido

# text
seg-6f8d24ecb89f = — { "55,970" } de { "58,697" } líneas

# text
seg-03065c20d4d8 = Commit

# text
# c1: db796dd
# c2: v0.29.0
seg-d734cdb77d70 = <c1/> (motor { "0.29.0" }, la etiqueta <c2/>)

# text
# c1: ci.yml
# c2: coverage
seg-a2af6144b6a0 = GitHub Actions, <c1/> trabajo <c2/>, ejecución { "36809850252" }, 2026-10-01

# text
seg-b88a2a9497c2 = Herramienta

# text
# c1: cargo tarpaulin --engine llvm
seg-f2f07088027a = <c1/> (instrumentación basada en código fuente de LLVM)

# text
# c1: src/
# c2: src/*_data.rs
# c3: src/main.rs
# c4: tests/
# c5: web/
seg-a3223ee99178 = <c1/>, excluidas las tablas de datos generadas <c2/> y el punto de entrada delgado de la CLI (interfaz de línea de comandos) <c3/>; <c4/> y <c5/> no se miden

# text
seg-894b740fd381 = Artefacto

# text
# c1: coverage-lcov
# c2: lcov.info
seg-1d6c540fd916 = <c1/> (<c2/>, { "290" } archivos fuente) adjunto a esa ejecución

# text
seg-17f916216c92 = Mínimo

# text
# c1: 85 %
# c2: --fail-under 85
seg-32861ca47b0c = el mismo trabajo falla por debajo de <c1/> (<c2/>): el mínimo se aplica en cada push; la cifra de arriba es un registro, no una barrera

# text
# c1: .github/workflows/ci.yml
seg-63b9b152cde7 = El comando, textual de <c1/>:

# text
# c1: main
# c2: lcov.info
seg-121c43cf260f = Cada push a <c1/> vuelve a ejecutar el trabajo y adjunta un <c2/> nuevo. Para mover la cifra publicada, descargue el artefacto de una ejecución en verde y súmelo:

# text
seg-b566e95a74ab = después actualice la tabla de arriba y las seis superficies en el mismo commit; la prueba de sincronización de documentos nombra las que se le pasen por alto.

# text
seg-6935c9c381b3 = Historial

# text
# c1: b1d350d
# c2: 1daa012
# c3: CHANGELOG.md
# c4: paper/kshana-technical-report.md
seg-daa9ae1913cd = La cifra se ha vuelto a medir, no a teclear: { "95.63" } % en el commit <c1/> (motor { "0.27.2" } + sin publicar, ejecución { "35934579709" }, 2026-09-24, { "37,697" } de { "39,419" } líneas, publicado como ~{ "96" } %), revisada a { "95.35" } % en { "0.29.0" } (arriba), que se redondea a ~{ "95" } %: el código creció en { "19,278" } líneas medidas y las líneas nuevas están cubiertas algo menos que las antiguas; { "95.85" } % en { "v0.17.0" } (commit <c2/>, 2026-06-14, publicado como ~{ "96" } %), y ~{ "97" } % en dos notas de versión anteriores (<c3/>, que se dejan como historia). <c4/> decía "cerca del { "97" } %" hasta que se ajustó a este registro; ahora es la sexta superficie que fija la prueba.

# text
seg-b2dbaf3a3b68 = <s1>Anterior</s1>Normas e interoperabilidad

# text
seg-508de3808e04 = <s1>Siguiente</s1>Paquetes de evidencias
