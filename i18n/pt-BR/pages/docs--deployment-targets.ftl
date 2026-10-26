# docs--deployment-targets: translations (pt-BR)

# text
seg-9c1e7fd8f838 = Como

# text
seg-5ad814c7ef9e = Observações

# attr:aria-label, text
seg-9d3ee6a5613e = Execuções

# text
# c1: docs/DEPLOYMENT-TARGETS.md
seg-e8eefc84e748 = Fonte: <c1/>

# text
seg-3e1eb98b38df = Onde o Kshana roda e onde não roda

# text
seg-1a203c4736f1 = Uma fronteira de escopo, registrada por escrito para que ninguém a descubra como um compromisso em uma reunião.

# text
seg-d6c92d17a3dd = Abreviações: CPU, unidade central de processamento; GPU, unidade de processamento gráfico; NPU, unidade de processamento neural; FPGA, matriz de portas programável em campo; MCU, unidade de microcontrolador; RTOS, sistema operacional de tempo real; OPS-SAT, o satélite-laboratório de software em órbita da Agência Espacial Europeia; PyPI, o Python Package Index; MCP, o Model Context Protocol; AI, inteligência artificial; JSON, JavaScript Object Notation.

# text
seg-9376bb5b192e = Alvo

# text
seg-95e7da118089 = Estações de trabalho e servidores Linux, macOS e Windows, x86-64 e ARM de 64 bits

# text
# c1: kshana
seg-b6ef382a73ef = o binário <c1/>, ou o crate Rust

# text
# c1: cargo install kshana
seg-b8af20715cea = binários de versão para Linux x86-64, macOS (Apple silicon e Intel) e Windows x86-64; nos demais alvos, <c1/> o compila

# text
seg-3dc7d08f5729 = Python { "3.9" } ou mais recente

# text
# c1: kshana
# c2: --features python
seg-b1f1009faa44 = o wheel <c1/> no PyPI (<c2/>)

# text
seg-45b4e1bd8b18 = wheels para Linux, macOS e Windows, x86-64 e ARM de 64 bits

# text
seg-79f04380d254 = Clientes MCP (agentes de IA)

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
seg-4163955ed77a = o servidor <c1/>: <c2/>, ou a imagem de contêiner

# text
seg-c5a32580b7bc = imagem para linux/amd64 e linux/arm64

# text
seg-ec575e06d439 = Navegadores e runtimes de JavaScript

# text
# c1: --features wasm
seg-a8238abc55bd = o pacote WebAssembly no npm (<c1/>)

# text
seg-c7789c7f4429 = o mesmo motor, compilado para WebAssembly

# text
seg-488c2b62d246 = Um pequeno computador em um barco, ao lado do receptor

# text
# c1: deploy/reference-build/
# c2: kshana receiver-trust live
seg-69a58e13b706 = a compilação de referência em <c1/>: <c2/> com o gate, publicando no Signal K e, por adesão voluntária, no OpenCPN

# text
# c1: MARINE-INTEGRATIONS.md
seg-df530583c13c = consultivo, não um equipamento de navegação homologado; não testado em embarcação pelo projeto; veja <a1><c1/></a1>

# text
seg-cf83dbb55f99 = Servidores Signal K

# text
# c1: integrations/signalk/
seg-88ddbefb95dd = o plugin em <c1/>

# text
seg-5f436c952149 = distribuído e testado por testes unitários em saída sintética gravada; não publicado no npm

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-026115eafe9b = NMEA { "0183" } em modo gate via TCP a partir do monitor

# text
# c1: MARINE-INTEGRATIONS.md
seg-8e101a661cbc = por adesão voluntária; veja <a1><c1/></a1>

# text
seg-cea294c412f0 = Computadores de carga útil de classe Linux

# text
seg-bf74da1c1262 = o crate Rust ou o binário, compilado de forma cruzada

# text
seg-868f121e5909 = computadores de carga útil de classe OPS-SAT e similares

# text
seg-53c8be810679 = Nós de borda com GPU, NPU ou FPGA ao lado de uma CPU Linux

# text
seg-70b2c22bf453 = na CPU Linux

# text
seg-977842cb0f86 = O Kshana não usa nenhum dos aceleradores; ele roda ao lado deles

# text
seg-3e15446b6efb = Não roda

# text
# c1: std
# c2: no_std
seg-205144220741 = <b>Uma MCU de voo bare-metal ou um pequeno RTOS sem a biblioteca padrão do Rust.</b> O Kshana é um crate <c1/> em toda a sua extensão: aloca memória no heap, lê arquivos, formata JSON e usa as funções de ponto flutuante da biblioteca padrão. Não existe uma compilação <c2/> nem um recurso que produza uma.

# text
# c1: no_std
seg-46ccad7b96e8 = <b>Decisão: não oferecemos um núcleo de voo <c1/>.</b> Construir um seria um produto separado, com seu próprio ônus de verificação, e colocaria o Kshana em software de voo, onde a qualificação é um programa à parte, para o qual não temos caminho.

# text
seg-63bc696bc66a = O que fazer em vez disso

# text
# c1: slot-timing
seg-07fff123aed3 = <b>Execute o Kshana em solo ou em um computador de carga útil e envie os resultados.</b> O tipo de cenário <c1/> produz exatamente os números de que um computador de voo precisa: uma cadência de correções, um instante de violação, uma guarda. Uma tabela com eles ocupa poucos bytes.

# text
# c1: SLOT-TIMING.md
seg-c2752c281cd3 = <b>Porte uma forma fechada, se for só o que se precisa.</b> A inversão do holdover é uma busca de raiz monótona e curta sobre uma variância polinomial, documentada com suas equações em <a1><c1/></a1>. Reimplementá-la em código de voo é simples; o código derivado do Kshana permanece sob a licença do Kshana.

# text
seg-b484e9426ab0 = Também fora do escopo

# text
seg-7bcd90c9ef31 = Garantias de tempo real estrito (o Kshana aloca memória e não faz nenhuma afirmação sobre o tempo de execução no pior caso); qualificação de voo de qualquer coisa; e um protocolo de sincronização, um controlador ou uma pilha de roteamento. O Kshana fornece a evidência de temporização contra a qual esses sistemas são projetados. Ele não é um deles.

# text
seg-542e51fbb35a = <s1>Anterior</s1>Plugin do JetBrains

# text
seg-52a455f4c409 = <s1>Próxima</s1>Arquitetura
