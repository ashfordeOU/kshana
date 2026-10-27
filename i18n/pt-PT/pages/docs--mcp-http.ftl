# docs--mcp-http: translations (pt-PT)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Fonte: <c1/>

# text
seg-4bd138b7d28a = Execução do kshana-mcp sobre HTTP (alojamento próprio)

# text
seg-7ca89d6e0201 = Uma passagem que menciona clientes de IA de terceiros é omitida aqui; consta de <a1>docs/deploy/mcp-http.md</a1> no GitHub.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>O Kshana não aloja um ponto de acesso.</b> Não existe nenhum servidor <c1/> partilhado a que um cliente se possa ligar. Executa-o na sua própria máquina, contentor ou projeto na nuvem, e é o utilizador quem controla o seu acesso e o seu custo. O servidor { $version } é o que consta deste repositório: os seus valores trazem as suas etiquetas VALIDATED ou MODELLED exatamente como em stdio.

# text
seg-113a79ece785 = As predefinições seguras

# text
seg-2bdbe06123c8 = Controlo

# text
seg-640f28207e8a = Comportamento

# text
seg-9bc8fe53a948 = Endereço de ligação

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Apenas loopback (<c1/>, <c2/>). Uma porta isolada (<c3/>) significa <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Precisa de <c1/> <b>e</b> de um token de portador na variável de ambiente <c2/> ({ "16" } carateres ou mais). Sem ambos, o servidor recusa-se a arrancar. Com ambos, imprime um aviso de que está a escutar para além desta máquina.

# text
seg-6fbe07565c36 = Autenticação

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> em cada pedido quando é definido um token (pode ser definido também em loopback). Comparado em tempo constante. Em falta ou errado: <c2/>.

# text
seg-1962f434458b = Sistema de ficheiros

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Nenhum. As ferramentas de ficheiros IQ (<c1/>) ficam desligadas no modo HTTP seja o que for que <c2/> indique; todas as outras ferramentas recebem o seu cenário em linha e recusam um que indique um ficheiro. Nenhum argumento de ferramenta lê ou escreve um caminho.

# text
seg-19261cdd2ef0 = Tamanho do corpo

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, predefinição { "5" } MiB (o limite do cenário é { "4" } MiB). Acima dele: <c2/>, quer o comprimento seja declarado quer o corpo seja fragmentado.

# text
seg-da9103d627dd = Tempo de resposta

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, predefinição { "120" }. Acima dele: <c2/>. <b>Isto limita quanto tempo um chamador espera, não o trabalho</b>: uma execução já em curso não pode ser interrompida, pelo que continua depois do <c3/> e termina em segundo plano.

# text
seg-a588b12596b7 = Concorrência

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, predefinição { "8" }. Além dele, um pedido recebe <c2/> com <c3/> de imediato; nenhum fica em fila.

# text
seg-87576ded5272 = Conjunto de trabalho

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Cada chamada de ferramenta corre numa thread bloqueante dentro de um conjunto de <c1/> posições, nunca nos trabalhadores assíncronos, pelo que uma execução longa não impede o servidor de responder. Uma posição só é libertada quando a própria execução termina, não quando o chamador desiste: as execuções abandonadas não se podem, por isso, acumular para além do tamanho do conjunto, e uma chamada que encontre o conjunto cheio é recusada por ocupação.

# text
seg-4a97b035483c = Orçamento de trabalho

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Um cenário que peça muito mais do que os exemplos incluídos é recusado antes de ser executado: mais de { "1000" } realizações de Monte Carlo (<c1/>), uma grelha de parâmetros com mais de { "1000" } nós, mais de { "5000" } execuções-membro (nós da grelha vezes realizações) ou uma grelha de tempo com mais de { "2" } milhões de épocas. O erro indica o campo a reduzir. O mesmo orçamento aplica-se em stdio; a linha de comandos <c2/> não tem nenhum.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Nunca é enviado nenhum cabeçalho <c1/>. Um pedido que traga um cabeçalho <c2/> é recusado (<c3/>), a menos que seja indicado com <c4/>; <c5/> não é aceite.

# text
seg-d7f157fdf003 = Cabeçalho Host

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Verificado face aos nomes de loopback, ou ao endereço de ligação mais cada <c1/>. Por trás de um proxy ou num URL de plataforma, passe <c2/>. Qualquer outra coisa: <c3/>.

# text
seg-12d5cf72f363 = Sessões

# text
seg-58dfe5665877 = Nenhuma. Cada POST recebe uma resposta JSON; não é mantida nenhuma tabela de sessões nem nenhum fluxo de eventos enviados pelo servidor aberto.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = O TLS não é terminado por <c1/>. Quando for acessível para além de uma só máquina, coloque HTTPS à sua frente (o TLS da sua plataforma, ou um proxy inverso) e mantenha o token secreto; um token de portador sobre HTTP simples pode ser lido na rede.

# text
seg-1b21740b9c63 = Local

# text
seg-a6194f5a52f8 = Configuração do cliente (um cliente de URL; acrescente o cabeçalho só quando é definido um token):

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = Dentro do contentor, o servidor tem de escutar em <c1/>, pelo que precisa de <c2/> e do token. Publicar a porta como <c3/> mantém-na na sua máquina; retire o <c4/> apenas quando pretender expô-la e, nesse caso, termine o TLS à sua frente. Os modelos de <c5/>, Fly.io e Cloud Run constam de <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Modelos (é o utilizador quem os implanta; o Kshana não executa nenhum)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1>: defina o token com <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1>: obtenha o token do Secret Manager

# text
# c1: --allowed-host
seg-b86ddb72b916 = Cada um executa a imagem publicada, define <c1/> com o nome de anfitrião da plataforma que substitui no ficheiro e depende da plataforma para o HTTPS.

# text
seg-ce3a5326cb95 = Defina um limite de CPU e de memória na plataforma

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = O tempo limite, o conjunto e o orçamento limitam quanto trabalho é admitido, mas uma chamada admitida pode ainda usar um núcleo durante muito tempo e um resultado grande pode usar centenas de megabytes. Coloque também um limite rígido no contentor: os modelos pedem { "2" } CPU e { "1" } GiB (<c1/> e <c2/> no Compose, <c3/> no Fly, <c4/> no Cloud Run). Mantenha <c5/> igual ou inferior ao número de CPU.

# text
seg-058781b052c4 = O que não é

# text
seg-90edc7ff2a55 = Não é um serviço multi-inquilino. Qualquer pessoa com o token executa simulações no seu equipamento; não há quotas por utilizador para além dos limites acima.

# text
seg-5b3b9c610f31 = Consultivo, não um equipamento de navegação homologado: o operador continua a ser responsável pela navegação. As saídas do simulador são valores modelados ou validados para análise, como em todo o lado no Kshana.

# text
seg-c33947d44b06 = <s1>Anterior</s1>Servidor MCP: todos os canais de instalação

# text
seg-a9d67efe493a = <s1>Seguinte</s1>Utilizar o Kshana a partir de um agente
