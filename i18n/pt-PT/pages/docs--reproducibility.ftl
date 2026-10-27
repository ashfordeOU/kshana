# docs--reproducibility: translations (pt-PT)

# text
seg-03cb5fb3dd8f = Sim

# text
seg-a7d5633dbcc0 = Reprodutibilidade e proveniência

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Fonte: <c1/>

# text
seg-1c48a3edda84 = O Kshana é construído para ser reprodutível: as mesmas entradas produzem os mesmos resultados, e os artefactos de compilação podem ser rastreados até à origem que os produziu. Este documento indica exatamente o que é garantido, o que não é, e como as garantias são impostas.

# text
seg-95b0eba44abe = Garantias de determinismo

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = O motor não tem relógio de parede, nem dependência da thread de execução, nem aleatoriedade sem semente. Cada processo estocástico é conduzido por um fluxo <c1/> indexado pela <c2/> do cenário, extraído numa ordem fixa. Consequências:

# text
seg-14df30025491 = Propriedade

# text
seg-f0badf8cb640 = Garantido

# text
seg-9f6678ac42f5 = Imposto por

# text
# c1: result.json
seg-cfc934af2c75 = Mesmo cenário, mesma máquina → <c1/> idêntico ao byte

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (executa o cenário de referência duas vezes, compara o SHA-256 (SHA: Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Mesmo cenário → figuras de mérito idênticas campo a campo

# text
seg-bdeaf344acf8 = Sim, por plataforma

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> fixa cada figura de mérito (FoM) dos quatro cenários de referência

# text
# c1: scenario_hash
seg-f7c5427c88f9 = O hash de entrada do cenário (<c1/>) é independente da plataforma

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = SHA-256 endereçado por conteúdo do cenário canónico, fixado em <c1/>

# text
seg-45861afe0994 = Impressão digital de entrada + <b>forma</b> da saída idênticas entre sistemas operativos (SO)

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> fixa um SHA-256 exato por cenário (dez cenários, um ficheiro <c2/> cada em <c3/>), verificado na matriz de CI (integração contínua) de 3 SO

# text
seg-e54b5ff80782 = Os <b>valores</b> da saída concordam entre SO (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Sim, até { "1e-6" }

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = o trabalho de CI <c1/> executa <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) e <c4/> nos três SO

# text
seg-3876618cc821 = Uma trama de mensagem de navegação de órbita terrestre baixa (LEO) tem os mesmos bytes em todas as plataformas e em todos os perfis de compilação, incluindo a compilação WebAssembly (WASM)

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (toda a função transcendente e todo o desvio normal do tipo de cenário <c2/> passa pela crate <c3/> em Rust puro); <c4/> fixa uma trama completa sem condicionamento por plataforma

# text
seg-69750a5db756 = As extrações de índices com semente (reamostragem bootstrap, permutações) são iguais em alvos de 32 bits e de 64 bits

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> amostra sempre como <c2/>; fixado em <c3/>

# text
seg-e42899fd8a4e = A mesma cadeia de ferramentas em todo o lado

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> fixa o canal; <c2/> faz falhar a compilação quando há desvio; a CI e a edição fixam a mesma versão

# text
seg-b0a3fd993614 = O mesmo conjunto de dependências

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> está submetido e <c2/> é usado para o SBOM (lista de materiais de software)

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Cada execução na linha de comandos escreve também um registo de reprodutibilidade no seu relatório (<c1/> e <c2/>): a versão do motor, o SHA-256 do ficheiro de cenário e do documento de resultado, a semente, a plataforma e o comando exato, que <c3/> volta a executar até um resultado idêntico ao byte. O relatório é, ele próprio, uma função pura da execução: duas execuções de <c4/> escrevem o mesmo <c5/> byte a byte. Ver <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = A ressalva entre plataformas (e como os valores de referência a tratam)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Os resultados numéricos são <b>idênticos ao bit numa dada plataforma</b>, mas podem diferir nas últimas unidades da última casa (ULP) <b>entre</b> plataformas. A causa é a biblioteca matemática da plataforma: <c1/>, <c2/>, <c3/> e afins não são obrigadas pela IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) a ser corretamente arredondadas, pelo que o Linux (glibc, a biblioteca C da GNU), o macOS e o Windows podem devolver cada um um último bit diferente. Numa execução longa, estas diferenças de ~{ "1e-16" } acumulam-se até talvez ~{ "1e-12" } em termos relativos.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Duas coisas tornam essa diferença na última casa maior do que no início, e ambas são medidas em vez de assumidas. Um <b>integrador adaptativo</b> escolhe o passo seguinte a partir da estimativa do erro através de uma raiz quinta, pelo que uma unidade na última casa altera a sequência de passos e as duas plataformas passam então a concordar apenas até à tolerância de integração. Um <b>estimador iterativo</b> (um ajuste por mínimos quadrados, um filtro de determinação de órbita) pode seguir um caminho diferente até à convergência. Os tipos de cenário construídos sobre qualquer um deles podem diferir entre plataformas em mais de { "1e-6" } em campos individuais; <c1/> regista o mesmo regime para os testes unitários.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = O <b>perfil de compilação</b> importa da mesma forma, numa só máquina. Uma compilação otimizada no macOS funde um seno e um cosseno do mesmo argumento numa única chamada à rotina combinada do sistema, cujo seno difere do <c1/> isolado no último bit em { "379" } de { "200 000" } argumentos; uma compilação não otimizada faz as duas chamadas. Medido em aarch64 macOS sobre os { "138" } ficheiros de cenário, uma compilação de depuração e uma de edição da mesma origem dão documentos de resultado idênticos ao byte em { "102" }. Os outros { "36" } diferem nas últimas casas: { "28" } dentro de { "1e-6" }, um (<c2/>) em { "2.8e-6" }, e sete campanhas apenas nos resumos das suas execuções membros; nenhum difere numa etiqueta, numa contagem ou num veredicto. A garantia de identidade ao byte acima é, portanto, para uma compilação: o mesmo binário duas vezes.

# text
seg-ff368c627bd2 = As <b>extrações normais</b> com semente são uma terceira fonte, muito mais rara: o amostrador chama a exponencial e o logaritmo do anfitrião nos seus ramos raros, e cerca de uma extração em um milhão difere no último bit entre a compilação nativa e a WASM.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Onde uma saída é <b>discreta</b>, uma diferença na última casa não é de todo aceitável, e o tipo de cenário é calculado com <c1/> em vez da biblioteca do anfitrião. O tipo de cenário <c2/> é o primeiro: a sua trama binária são inteiros transmitidos, e o mesmo cenário chegou a ser codificado em três tramas diferentes: numa compilação de edição, numa compilação de depuração da mesma origem, e no navegador. Agora são os mesmos bytes nas três.

# text
seg-1746a0ea22fe = Por esse motivo, os testes de referência <b>não</b> fixam um único hash entre plataformas da saída em vírgula flutuante — isso seria frágil e faria falhar compilações honestamente corretas num SO diferente. Em vez disso:

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> fixa cada figura de mérito com uma tolerância relativa de <c2/> — quatro ordens de grandeza mais apertada do que qualquer regressão real (que move um valor em percentagens inteiras), mas muito mais larga do que o ruído da biblioteca matemática (libm) entre plataformas. Os campos limitados por grelha (segundos de holdover) e os campos de zero exato são fixados exatamente.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b> — um hash de conteúdo das <em>entradas</em> — é independente da plataforma e fixado exatamente.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> fixa um SHA-256 exato, submetido por cenário em <c2/>, sobre a projeção que <em>é</em> idêntica entre plataformas: a impressão digital de entrada mais a <b>forma</b> da saída (nomes de campos, aninhamento, tipos das folhas, comprimentos de matrizes — fixados por aritmética determinística de grelha, nunca os valores em vírgula flutuante). Isto apanha regressões estruturais exatamente, enquanto as tolerâncias fixadas acima apanham regressões de valores.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> impõe uma saída idêntica ao byte entre duas execuções <em>na mesma máquina</em> (a garantia de determinismo).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>O trabalho de CI <c1/></b> executa os quatro testes acima (<c2/>, <c3/>, <c4/>, <c5/>) em <b>ubuntu-latest, macos-latest e windows-latest</b>, pelo que a reprodutibilidade entre plataformas é afirmada em cada push — os valores de referência de forma/entrada exatamente, a numérica até { "1e-6" }, e os estados SGP4 (Simplified General Perturbations { "4" }) até { "2e-5" } km — em vez de depender de um único SO.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Se precisar de regenerar os números fixados (por exemplo, após uma alteração intencional do modelo), execute cada cenário de referência e copie os valores de FoM impressos para <c1/>, e depois registe a alteração em <c2/>.

# text
seg-9310a7af7ff8 = Lista de materiais de software (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> emite um SBOM CycloneDX { "1.5" } que lista todas as crates distribuídas num artefacto do Kshana, com a sua versão exata, origem e licença. É um gerador sem dependências construído sobre <c2/> (pelo que funciona apenas com a cadeia de ferramentas), e percorre o grafo de resolução a partir do pacote kshana apenas através das dependências normais e de compilação. As dependências de desenvolvimento (crates apenas de teste, como <c3/>) são excluídas porque nenhum artefacto as contém.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = O grafo é a união dos conjuntos de funcionalidades com que os artefactos distribuídos são compilados: a compilação predefinida (biblioteca e CLI (interface de linha de comandos)), <c1/> (a wheel do PyPI (Python Package Index), cuja cadeia <c2/> é a sua fronteira de interface com código externo) e <c3/> (o pacote npm, que leva este mesmo SBOM dentro do seu tarball). As dependências condicionadas à plataforma para todos os alvos estão incluídas, uma vez que as wheels são distribuídas para vários sistemas operativos e o pacote npm tem como alvo o WebAssembly. Um único documento abrange os três artefactos, pelo que, para qualquer um deles, é um superconjunto. Atualmente lista { "107" } componentes; a contagem está fixada em <c4/>. O servidor autónomo <c5/> tem o seu próprio manifesto e não é descrito por este SBOM.

# text
seg-4c8948e9ee7d = A saída é determinística — o mesmo conjunto de dependências produz um documento idêntico ao byte, incluindo um número de série derivado da lista de pacotes ordenada e não de uma marca temporal.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = O fluxo de trabalho de edição gera o SBOM (<c1/>) e anexa-o a cada edição etiquetada; o fluxo de trabalho de publicação distribui-o também junto das wheels do PyPI e dentro do pacote npm.

# text
seg-928c3c0108a1 = Proveniência da compilação

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = O fluxo de trabalho de edição produz uma atestação de proveniência de compilação SLSA (Supply-chain Levels for Software Artifacts) (<c1/>) que abrange todos os ficheiros que anexa à edição do GitHub: os binários de linha de comandos de cada plataforma, o binário do servidor <c2/>, o SBOM, o resumo de validação e <c3/>. Um consumidor pode verificar, com <c4/>, que os artefactos foram compilados pelo fluxo de trabalho de edição deste repositório a partir desta origem — fechando a lacuna entre "aqui está um binário" e "aqui está um binário que posso rastrear até à sua origem". Por exemplo, para o SBOM de { "v0.28.0" }:

# text
seg-06515d230d33 = <s1>Anterior</s1>Proveniência

# text
seg-c6dba4e40c76 = <s1>Seguinte</s1>Mapa de capacidades
