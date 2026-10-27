# docs--mcp-http: translations (pt-BR)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Fonte: <c1/>

# text
seg-4bd138b7d28a = Executando o kshana-mcp por HTTP (hospedagem própria)

# text
seg-7ca89d6e0201 = Uma passagem que nomeia clientes de IA de terceiros fica de fora aqui; ela está em <a1>docs/deploy/mcp-http.md</a1> no GitHub.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>O Kshana não hospeda um endpoint.</b> Não existe um servidor <c1/> compartilhado para onde apontar um cliente. Você o executa em sua própria máquina, contêiner ou projeto de nuvem, e é dono do seu controle de acesso e do seu custo. O servidor { $version } é o que está neste repositório: seus valores trazem os rótulos VALIDATED ou MODELLED exatamente como por stdio.

# text
seg-113a79ece785 = Os padrões seguros

# text
seg-2bdbe06123c8 = Controle

# text
seg-640f28207e8a = Comportamento

# text
seg-9bc8fe53a948 = Endereço de bind

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Somente loopback (<c1/>, <c2/>). Uma porta sozinha (<c3/>) significa <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Exige <c1/> <b>e</b> um token de portador (bearer) na variável de ambiente <c2/> ({ "16" } caracteres ou mais). Sem os dois, o servidor se recusa a iniciar. Com os dois, imprime um aviso de que está escutando além desta máquina.

# text
seg-6fbe07565c36 = Autenticação

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> em toda requisição quando um token está definido (pode ser definido também em loopback). Comparado em tempo constante. Ausente ou errado: <c2/>.

# text
seg-1962f434458b = Sistema de arquivos

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Nenhum. As ferramentas de arquivo IQ (<c1/>) ficam desligadas no modo HTTP, seja qual for o valor de <c2/>; toda outra ferramenta recebe seu cenário em linha e recusa um que nomeie um arquivo. Nenhum argumento de ferramenta lê ou grava um caminho.

# text
seg-19261cdd2ef0 = Tamanho do corpo

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, padrão { "5" } MiB (o limite do cenário é { "4" } MiB). Acima disso: <c2/>, quer o comprimento seja declarado, quer o corpo seja fragmentado.

# text
seg-da9103d627dd = Tempo de resposta

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, padrão { "120" }. Acima disso: <c2/>. <b>Isso limita quanto tempo um chamador espera, não o trabalho</b>: uma execução já em andamento não pode ser interrompida, de modo que continua depois do <c3/> e termina em segundo plano.

# text
seg-a588b12596b7 = Concorrência

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, padrão { "8" }. Além disso, uma requisição recebe <c2/> com <c3/> de imediato; nenhuma entra em fila.

# text
seg-87576ded5272 = Pool de trabalho

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Toda chamada de ferramenta roda em uma thread bloqueante dentro de um pool de <c1/> vagas, nunca nos trabalhadores assíncronos, de modo que uma execução longa não pode impedir o servidor de responder. Uma vaga só é liberada quando a própria execução termina, não quando o chamador desiste: execuções abandonadas, portanto, não podem se acumular além do tamanho do pool, e uma chamada que encontra o pool cheio é recusada como ocupada.

# text
seg-4a97b035483c = Orçamento de trabalho

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Um cenário que pede muito mais que os exemplos incluídos é recusado antes de rodar: mais de { "1000" } realizações de Monte Carlo (<c1/>), uma grade de parâmetros com mais de { "1000" } nós, mais de { "5000" } execuções-membro (nós da grade vezes realizações) ou uma grade de tempo com mais de { "2" } milhões de épocas. O erro nomeia o campo a reduzir. O mesmo orçamento vale por stdio; a linha de comando <c2/> não tem nenhum.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Nenhum cabeçalho <c1/> é jamais enviado. Uma requisição com um cabeçalho <c2/> é recusada (<c3/>) a menos que seja nomeada com <c4/>; <c5/> não é aceito.

# text
seg-d7f157fdf003 = Cabeçalho Host

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Conferido contra nomes de loopback, ou o endereço de bind mais cada <c1/>. Atrás de um proxy ou em uma URL de plataforma, passe <c2/>. Qualquer outra coisa: <c3/>.

# text
seg-12d5cf72f363 = Sessões

# text
seg-58dfe5665877 = Nenhuma. Todo POST recebe uma resposta JSON; nenhuma tabela de sessões e nenhum fluxo de eventos enviados pelo servidor é mantido aberto.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = O TLS não é terminado por <c1/>. Quando ele é alcançável além de uma máquina, ponha HTTPS à frente dele (o TLS da sua plataforma, ou um proxy reverso) e mantenha o token em segredo; um token de portador sobre HTTP simples pode ser lido na rede.

# text
seg-1b21740b9c63 = Local

# text
seg-a6194f5a52f8 = Configuração do cliente (um cliente por URL; acrescente o cabeçalho apenas quando um token estiver definido):

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = Dentro do contêiner o servidor precisa escutar em <c1/>, de modo que precisa de <c2/> e do token. Publicar a porta como <c3/> a mantém em sua máquina; retire o <c4/> apenas quando pretender expô-la e, nesse caso, termine o TLS à frente dela. <c5/> e modelos para Fly.io e Cloud Run estão em <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Modelos (você os implanta; o Kshana não executa nenhum)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1>: defina o token com <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1>: obtenha o token do Secret Manager

# text
# c1: --allowed-host
seg-b86ddb72b916 = Cada um executa a imagem publicada, define <c1/> como o nome de host da plataforma que você substitui no arquivo e conta com a plataforma para o HTTPS.

# text
seg-ce3a5326cb95 = Defina um limite de CPU e de memória na plataforma

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = O tempo limite, o pool e o orçamento limitam quanto trabalho é admitido, mas uma chamada admitida ainda pode usar um núcleo por muito tempo e um resultado grande pode usar centenas de megabytes. Ponha também um limite rígido no contêiner: os modelos pedem { "2" } CPUs e { "1" } GiB (<c1/> e <c2/> no Compose, <c3/> no Fly, <c4/> no Cloud Run). Mantenha <c5/> igual ou abaixo do número de CPUs.

# text
seg-058781b052c4 = O que ele não é

# text
seg-90edc7ff2a55 = Não é um serviço multi-inquilino. Quem tiver o token executa simulações em seu hardware; não há cotas por usuário além dos limites acima.

# text
seg-5b3b9c610f31 = Consultivo, não um equipamento de navegação homologado: o operador continua responsável pela navegação. As saídas do simulador são valores modelados ou validados para análise, como em todo o resto do Kshana.

# text
seg-c33947d44b06 = <s1>Anterior</s1>Servidor MCP: todos os canais de instalação

# text
seg-a9d67efe493a = <s1>Próxima</s1>Usando o Kshana a partir de um agente
