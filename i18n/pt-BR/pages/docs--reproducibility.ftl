# docs--reproducibility: translations (pt-BR)

# text
seg-03cb5fb3dd8f = Sim

# text
seg-a7d5633dbcc0 = Reprodutibilidade e procedência

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Fonte: <c1/>

# text
seg-1c48a3edda84 = O Kshana é construído para ser reprodutível: as mesmas entradas produzem os mesmos resultados, e os artefatos de compilação podem ser rastreados até a fonte que os produziu. Este documento declara exatamente o que é garantido, o que não é e como as garantias são impostas.

# text
seg-95b0eba44abe = Garantias de determinismo

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = O motor não tem relógio de parede, não depende da thread de execução e não tem aleatoriedade sem semente. Todo processo estocástico é conduzido por um fluxo <c1/> indexado pela <c2/> do cenário, sorteado em ordem fixa. Consequências:

# text
seg-14df30025491 = Propriedade

# text
seg-f0badf8cb640 = Garantida

# text
seg-9f6678ac42f5 = Imposta por

# text
# c1: result.json
seg-cfc934af2c75 = Mesmo cenário, mesma máquina → <c1/> idêntico byte a byte

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (executa o cenário de referência duas vezes e compara o SHA-256 (SHA: Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Mesmo cenário → figuras de mérito idênticas campo a campo

# text
seg-bdeaf344acf8 = Sim, por plataforma

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> fixa toda figura de mérito (FoM) dos quatro cenários de referência

# text
# c1: scenario_hash
seg-f7c5427c88f9 = O hash de entrada do cenário (<c1/>) é independente de plataforma

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = SHA-256 endereçado por conteúdo do cenário canônico, fixado em <c1/>

# text
seg-45861afe0994 = Impressão digital da entrada + <b>forma</b> da saída idênticas entre SO (sistemas operacionais)

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> fixa um SHA-256 exato por cenário (dez cenários, um arquivo <c2/> cada um em <c3/>), verificado na matriz de CI (integração contínua) com 3 SO

# text
seg-e54b5ff80782 = Os <b>valores</b> de saída concordam entre SO (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Sim, até { "1e-6" }

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = o job de CI <c1/> executa <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) e <c4/> nos três SO

# text
seg-3876618cc821 = Um quadro de mensagem de navegação de órbita terrestre baixa (LEO) tem os mesmos bytes em todas as plataformas e em todos os perfis de compilação, inclusive na compilação WebAssembly (WASM)

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (toda transcendental e todo desvio normal do tipo de cenário <c2/> passa pelo crate <c3/> em Rust puro); <c4/> fixa um quadro inteiro sem condicionamento por plataforma

# text
seg-69750a5db756 = Sorteios de índice com semente (reamostragem bootstrap, embaralhamentos) são iguais em alvos de 32 e de 64 bits

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> sempre amostra como <c2/>; fixado em <c3/>

# text
seg-e42899fd8a4e = A mesma toolchain em todo lugar

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> fixa o canal; <c2/> faz a compilação falhar em caso de deriva; o CI e a publicação fixam a mesma versão

# text
seg-b0a3fd993614 = O mesmo conjunto de dependências

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> está versionado e <c2/> é usado para o SBOM (lista de materiais de software)

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Toda execução por linha de comando também grava um registro de reprodutibilidade em seu relatório (<c1/> e <c2/>): a versão do motor, o SHA-256 do arquivo de cenário e do documento de resultado, a semente, a plataforma e o comando exato, que <c3/> reexecuta até um resultado idêntico byte a byte. O próprio relatório é uma função pura da execução: duas execuções de <c4/> gravam o mesmo <c5/> byte a byte. Veja <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = A ressalva entre plataformas (e como os goldens lidam com ela)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Os resultados numéricos são <b>idênticos bit a bit em uma dada plataforma</b>, mas podem diferir nas últimas unidades na última casa (ULP) <b>entre</b> plataformas. A causa é a biblioteca matemática da plataforma: <c1/>, <c2/>, <c3/> e semelhantes não precisam, pelo IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers), ser corretamente arredondadas, de modo que Linux (glibc, a biblioteca C da GNU), macOS e Windows podem cada um devolver um último bit diferente. Em uma execução longa, essas diferenças de ~{ "1e-16" } se acumulam até talvez ~{ "1e-12" } relativos.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Duas coisas fazem essa diferença na última casa crescer além do ponto de partida, e ambas são medidas, não supostas. Um <b>integrador adaptativo</b> escolhe seu próximo passo a partir da estimativa de erro por meio de uma raiz quinta, de modo que uma unidade na última casa muda a sequência de passos e as duas plataformas passam então a concordar apenas até a tolerância de integração. Um <b>estimador iterativo</b> (um ajuste de mínimos quadrados, um filtro de determinação de órbita) pode seguir um caminho diferente até a convergência. Tipos de cenário baseados em qualquer um dos dois podem diferir entre plataformas em mais de { "1e-6" } em campos individuais; <c1/> registra o mesmo regime para os testes unitários.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = O <b>perfil de compilação</b> importa da mesma forma, em uma única máquina. Uma compilação otimizada no macOS funde um seno e um cosseno do mesmo argumento em uma única chamada à rotina combinada do sistema, cujo seno difere do <c1/> isolado no último bit em { "379" } de { "200 000" } argumentos; uma compilação sem otimização faz as duas chamadas. Medido em aarch64 macOS sobre os { "138" } arquivos de cenário, uma compilação de depuração e uma de lançamento da mesma fonte dão documentos de resultado idênticos byte a byte em { "102" }. Os outros { "36" } diferem nas últimas casas: { "28" } dentro de { "1e-6" }, um (<c2/>) em { "2.8e-6" } e sete campanhas apenas nos resumos de suas execuções membros; nenhum difere em um rótulo, uma contagem ou um veredito. A garantia de identidade byte a byte acima vale, portanto, para uma única compilação: o mesmo binário duas vezes.

# text
seg-ff368c627bd2 = Os <b>sorteios normais</b> com semente são uma terceira fonte, muito mais rara: o amostrador chama a exponencial e o logaritmo do host em seus ramos raros, e cerca de um sorteio em um milhão difere no último bit entre a compilação nativa e a WASM.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Onde uma saída é <b>discreta</b>, uma diferença na última casa não é aceitável de modo algum, e o tipo de cenário é calculado com <c1/> em vez da biblioteca do host. O tipo de cenário <c2/> é o primeiro: seu quadro binário é composto de inteiros transmitidos, e o mesmo cenário chegou a ser codificado em três quadros diferentes: em uma compilação de lançamento, em uma compilação de depuração da mesma fonte e no navegador. Agora são os mesmos bytes nos três.

# text
seg-1746a0ea22fe = Por isso, os testes golden <b>não</b> fixam um único hash multiplataforma da saída em ponto flutuante — isso seria frágil e faria falhar compilações honestamente corretas em outro SO. Em vez disso:

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> fixa cada figura de mérito com uma tolerância relativa de <c2/> — quatro ordens de grandeza mais estreita do que qualquer regressão real (que move um valor em percentuais inteiros), e ainda muito mais folgada do que a oscilação da biblioteca matemática (libm) entre plataformas. Campos limitados pela grade (segundos de holdover) e campos exatamente zero são fixados exatamente.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b> — um hash de conteúdo das <em>entradas</em> — é independente de plataforma e fixado exatamente.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> fixa um SHA-256 exato, versionado por cenário em <c2/>, sobre a projeção que <em>é</em> idêntica entre plataformas: a impressão digital da entrada mais a <b>forma</b> da saída (nomes de campos, aninhamento, tipos das folhas, comprimentos de matrizes — fixados por aritmética determinística de grade, nunca pelos valores em ponto flutuante). Isso captura regressões estruturais com exatidão, enquanto as tolerâncias acima captam regressões de valor.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> impõe saída idêntica byte a byte entre duas execuções <em>na mesma máquina</em> (a garantia de determinismo).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>O job de CI <c1/></b> executa os quatro testes acima (<c2/>, <c3/>, <c4/>, <c5/>) em <b>ubuntu-latest, macos-latest e windows-latest</b>, de modo que a reprodutibilidade entre plataformas é afirmada a cada push — os goldens de forma/entrada exatamente, a parte numérica até { "1e-6" } e os estados SGP4 (Simplified General Perturbations { "4" }) até { "2e-5" } km — em vez de depender de um único SO.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Se você precisar regenerar os números fixados (p. ex., após uma mudança intencional de modelo), execute cada cenário de referência e copie os valores de FoM impressos para <c1/>; depois registre a mudança em <c2/>.

# text
seg-9310a7af7ff8 = Lista de materiais de software (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> emite uma SBOM CycloneDX { "1.5" } que lista todo crate distribuído em um artefato do kshana, com sua versão exata, origem e licença. É um gerador sem dependências construído sobre <c2/> (de modo que funciona só com a toolchain) e percorre o grafo de resolução a partir do pacote kshana apenas por dependências normais e de compilação. As dependências de desenvolvimento (crates usados só em testes, como <c3/>) são excluídas porque nenhum artefato as contém.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = O grafo é a união dos conjuntos de recursos com que os artefatos distribuídos são compilados: a compilação padrão (biblioteca e CLI (interface de linha de comando)), <c1/> (o wheel do PyPI (Python Package Index), cuja cadeia <c2/> é sua fronteira de interface com código externo) e <c3/> (o pacote npm, que leva esta mesma SBOM dentro de seu tarball). As dependências condicionais por plataforma de todos os alvos são incluídas, já que os wheels são distribuídos para vários sistemas operacionais e o pacote npm visa WebAssembly. Um único documento cobre os três artefatos, de modo que, para qualquer um deles, é um superconjunto. Atualmente lista { "107" } componentes; a contagem é fixada em <c4/>. O servidor autônomo <c5/> tem seu próprio manifesto e não é descrito por esta SBOM.

# text
seg-4c8948e9ee7d = A saída é determinística — o mesmo conjunto de dependências produz um documento idêntico byte a byte, inclusive um número de série derivado da lista ordenada de pacotes, e não de um carimbo de tempo.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = O fluxo de trabalho de lançamento gera a SBOM (<c1/>) e a anexa a toda versão com tag; o fluxo de publicação também a distribui ao lado dos wheels do PyPI e dentro do pacote npm.

# text
seg-928c3c0108a1 = Procedência da compilação

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = O fluxo de trabalho de lançamento produz uma atestação de procedência de compilação SLSA (Supply-chain Levels for Software Artifacts) (<c1/>) que cobre todo arquivo que anexa à GitHub Release: os binários de linha de comando de cada plataforma, o binário do servidor <c2/>, a SBOM, o resumo de validação e <c3/>. Um consumidor pode verificar, com <c4/>, que os artefatos foram compilados pelo fluxo de trabalho de lançamento deste repositório a partir desta fonte — fechando a lacuna entre "aqui está um binário" e "aqui está um binário que posso rastrear até sua fonte". Por exemplo, para a SBOM da { "v0.28.0" }:

# text
seg-06515d230d33 = <s1>Anterior</s1>Procedência

# text
seg-c6dba4e40c76 = <s1>Próximo</s1>Mapa de capacidades
