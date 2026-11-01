# docs--trust-telemetry: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-d4e48c972084 = Rótulos

# text
seg-ca448daf5ec7 = nominal

# text
seg-a129b9e613d0 = Tipo

# text
seg-2672b7f55371 = degraded

# attr:alt
seg-c711c7fecbfc = Um resultado de confiança em três formatos de exportação, a partir de execuções reais do motor v{ $version } (`kshana trust-telemetry`) sobre examples/maritime-trust: exposição em texto Prometheus (a pontuação de confiança mais recente é { "5.9" } e a faixa não confiável é a que está ativada) e as últimas mensagens CEF e LEEF. O comando não publica nada a menos que receba um destino, não guarda credenciais e não transmite nenhum sinal de rádio. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Fonte: <c1/>

# text
seg-05919ac6cf31 = Confiança no GNSS como telemetria de segurança

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> transforma o fluxo de confiança no GNSS por época (pontuação 0-100, faixa, motivos) em sinais que um centro de operações ou de segurança já ingere: métricas Prometheus, eventos syslog em CEF ou LEEF para um SIEM e, opcionalmente, OpenTelemetry. Ele lê o fluxo; nunca altera a avaliação de confiança e não transmite nada além de telemetria.

# text
# c1: docs/MARITIME-TRUST.md
# c2: t_s
# c3: state
# c4: calibrating|nominal|degraded|untrusted
# c5: score
# c6: time
# c7: gate
# c8: off|passed|withheld
# c9: position
# c10: lat_deg
# c11: lon_deg
# c12: height_m
# c13: deductions
# c14: alarms
# c15: geometry
# c16: status
# c17: hdop
# c18: pdop
# c19: n_used
# c20: class
# c21: kshana_trust_input_errors_total
# c22: src/telemetry/sample.rs
seg-14ad6b7911d6 = A entrada é o esquema JSON-lines ao vivo v1.1 documentado em <c1/>. Lê: <c2/>; <c3/> (<c4/>, a faixa); <c5/> (0-100 ou nulo); <c6/> (o tempo da época como declarado); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/>, ou nulo); os motivos são os monitores em <c13/>, depois quaisquer outros em <c14/>; a partir do esquema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) e o <c20/> de cada dedução. Outras chaves são ignoradas, já que o esquema só cresce por chaves acrescentadas. Uma linha que não é interpretada é contada em <c21/> e descartada; pontuações fora de 0-100 são rejeitadas, não truncadas, para que uma mudança de formato seja notada. O único código que conhece esse formato é <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> é servido sem autenticação e tem por padrão <c2/>. Vincular a outro endereço imprime um aviso; coloque-o atrás do seu próprio controle de acesso. O endpoint atende uma conexão por vez com limite de leitura de { "2" } s, de modo que um cliente ocioso pode atrasar uma coleta em até esse tempo; destina-se a um único coletor, não à rede aberta.

# text
seg-7e66e43f15a8 = Home Assistant e dispositivos NTP (MQTT)

# text
# c1: --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: homeassistant/...
# c4: untrusted
# c5: <prefix>/state
# c6: kshana/trust/state
# c7: state
# c8: score
# c9: untrusted
# c10: t_s
# c11: time
# c12: reasons
# c13: gate
# c14: --mqtt-prefix
# c15: --mqtt-node
# c16: --mqtt-discovery
seg-fbe56ff7f1ed = <c1/> imprime, e <c2/> publica, um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant. A descoberta (retida, sob <c3/>) cria três entidades: pontuação de confiança, faixa de confiança (com os motivos como atributos) e um sensor de problema <c4/>. O documento de estado vai para <c5/> (padrão <c6/>, retido): <c7/>, <c8/> (nulo enquanto não há), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> e a declaração consultiva; a posição nunca é incluída. Opções: <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = O publicador fala MQTT { "3.1.1" } com QoS { "0" } e lê apenas o CONNACK do broker. Não tem credenciais nem TLS, portanto use um broker na rede local (ou um retransmissor local que as acrescente). A entrega roda em sua própria thread, atrás de uma fila de { "1024" }: um broker morto descarta mensagens, contadas e informadas no final, e nunca trava o fluxo. Um dispositivo NTP ou qualquer outro consumidor que queira JSON simples pode ler a mesma linha de estado. Nada é escrito em um receptor ou em um relógio. Python, WebAssembly e MCP recebem <c1/> e devolvem as mesmas linhas <c2/> (nada é publicado ali).

# text
seg-ed95ebb0ba1b = Pelo Python, WebAssembly e MCP

# text
# c1: kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False, syslog_all=False, unix_nano=0)
# c2: trust_telemetry(input, format, host, input_kind, options_json)
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: format
# c6: prometheus
# c7: cef
# c8: leef
# c9: otlp
# c10: input_kind
# c11: jsonl
# c12: result
# c13: --print-metrics
# c14: --print-syslog
# c15: host
# c16: syslog_all
seg-93be007cdfda = Os codificadores também estão disponíveis como chamadas de texto de entrada e texto de saída, sem processo, soquete ou relógio: Python <c1/>, a exportação WebAssembly <c2/> e a ferramenta MCP <c3/> (comando de plugin <c4/>). <c5/> é <c6/>, <c7/>, <c8/> ou <c9/>; <c10/> é <c11/> (o fluxo) ou <c12/> (um resultado em lote). Devolvem o mesmo texto que a linha de comando imprime (<c13/>, <c14/>), com os mesmos limites: as linhas syslog não trazem marca de tempo, <c15/> tem no máximo { "255" } caracteres ASCII imprimíveis sem espaços (recusado caso contrário, aqui e na linha de comando), e uma resposta maior que o limite da superfície ({ "4" } MiB no MCP) é recusada, porque CEF e LEEF com <c16/> escrevem um evento por época. Nada é enviado, servido ou gravado; os exportadores em execução continuam sendo um processo na linha de comando.

# text
seg-f8c367611a9e = A entrega nunca trava a avaliação

# text
# c1: /metrics
seg-3853bb63c7ad = A entrega por syslog e OpenTelemetry roda em threads próprias. O laço de ingestão apenas lhes entrega uma mensagem ou um instantâneo e nunca espera, de modo que um coletor morto, lento ou que não lê não consegue pressionar o fluxo ao vivo nem congelar <c1/>:

# text
seg-589d02c31dfe = toda conexão e toda escrita têm um limite de { "2" } s; uma conexão que falha é descartada e refeita de forma preguiçosa, com recuo exponencial de { "1" } s até { "60" } s;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = uma mensagem que não pode ser entregue (coletor fora do ar, escrita expirou, fila de { "1024" } cheia) é descartada e contada em <c1/>; alerte sobre sua taxa;

# text
seg-4a7cd2065731 = o exportador OpenTelemetry recebe uma cópia do registro, de modo que nenhum bloqueio é mantido durante a E/S de rede; se uma exportação ainda estiver em andamento, o novo instantâneo é ignorado (o seguinte traz os mesmos totais cumulativos).

# text
seg-57c3bbe405c8 = No fim da entrada, as threads de envio recebem seus limites de tempo restantes para terminar.

# text
seg-14c13ed8c509 = Métricas Prometheus

# text
seg-d060b2163513 = Métrica

# text
seg-45c41bf74eb8 = gauge

# text
seg-e43a6814d13c = constante { "1" }

# text
seg-3662d2b8a789 = pontuação mais recente 0-100; ausente se a fonte não fornece

# text
seg-1c50874472fc = { "1" } para a faixa atual, { "0" } para as demais

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para o estado atual, { "0" } para os demais; ausente sem uma comporta (gate)

# text
# c1: --expose-position
seg-3e01cab63c59 = posição informada pelo receptor; <b>somente com <c1/></b> (o endpoint não tem autenticação e uma posição pode identificar um local ou embarcação)

# text
seg-280a5ca2e5d9 = { "1" } se presente na época mais recente

# text
seg-22ded4fe7f29 = contador

# text
seg-800b23c30e2f = épocas recebidas

# text
seg-be11849d8a9b = épocas em que o motivo estava presente

# text
seg-0475fe7b26ba = linhas de entrada não interpretáveis

# text
# c1: reason="other"
seg-65f1db183cbc = ocorrências de motivo reunidas em <c1/> (veja abaixo)

# text
seg-e756633e7d5c = eventos syslog não entregues

# text
seg-2de3258f83ee = deslocamento da época mais recente em relação ao início do fluxo

# text
seg-c02fe207663e = hora de recebimento no relógio de parede; alerte sobre sua idade

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = geometria dos satélites na época mais recente, <c1/>, <c2/>, <c3/>: { "1" } para a atual <em>(entradas do esquema { "1.3" })</em>

# text
seg-4878afc243e3 = { "1" } degradada, { "0" } boa; ausente quando a geometria é desconhecida

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" } quando satélites à vista não são rastreados embora sua geometria seja boa (o sinal foi perdido, não o céu; <c1/> ainda indica { "1" }), senão { "0" }; ausente quando a geometria é desconhecida ou a entrada não informa

# text
seg-db29584bb51c = HDOP, PDOP e satélites usados na época mais recente; cada um ausente quando não há

# text
seg-c60ca4530e92 = épocas por status de geometria

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = rótulo de geometria na época mais recente, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para o atual; nunca pontuado (a pontuação deduz apenas por <c5/>); a partir de entradas que trazem o rótulo ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP na época mais recente; ausente quando não há

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>O rótulo de geometria é o destaque.</b> Faça gráficos e alertas sobre <c1/> (OTLP <c2/>, CEF o terceiro campo <c3/>, LEEF <c4/>): <c5/> é o único rótulo pelo qual a pontuação deduz. O status de geometria é descritivo: <c6/> inclui o caso informativo <c7/>, que pode vir com DOP bom ou razoável, portanto não acione plantão só por <c8/>.

# text
# c1: kshana_trust_reason_active
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
# c6: geometry
# c7: unknown
# c8: kshana_trust_reason_active{class="inconsistency"}
# c9: geometry
# c10: docs/RECEIVER-TRUST.md
seg-70343708da03 = A partir de entradas do esquema { "1.3" }, <c1/> também traz um rótulo <c2/> (<c3/>, <c4/>, <c5/>) em cada motivo que veio com um: a classe da dedução na época mais recente. As séries de geometria vêm depois de todas as outras e somente quando uma época de entrada traz <c6/> (esquema ao vivo { "1.3" }, um resultado do mecanismo { "0.36" } ou posterior), de modo que um fluxo ou resultado { "0.35" } é renderizado byte a byte como antes. Os valores dos rótulos são conjuntos fixos (um status desconhecido aparece como <c7/>; uma classe desconhecida é descartada). Alerte sobre <c8/> e não apenas sobre a faixa, para que um céu ruim não dispare plantão como se fosse um ataque; uma classe <c9/> é uma afirmação sobre o céu, não uma constatação de que nenhum ataque ocorreu (veja <c10/>).

# text
# c1: class
# c2: loss-of-lock
# c3: environment
# c4: geometry
# c5: geometry
# c6: inconsistency
# c7: reason
# c8: max by (reason)
# c9: class
seg-3f45b21003d5 = O rótulo <c1/> faz parte da identidade de uma série: quando a classe de um motivo muda entre épocas (<c2/> de <c3/> para <c4/> quando os satélites perdidos eram baixos, ou <c5/> para <c6/> quando o HDOP declarado discorda do céu declarado), a série antiga deixa de ser exportada e uma nova começa. Consulte por <c7/> com <c8/> quando a classe não importa, e espere que essa troca pareça uma série terminando e outra começando. As séries do esquema { "1.3" }, o rótulo <c9/> e os campos de geometria de CEF/LEEF são verificados pelos testes do próprio mecanismo e pelas referências independentes de CEF (pycef, Logstash); as referências independentes externas de Prometheus e OTLP ainda não têm fluxo { "1.3" }.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Os nomes de motivo são cortados em { "128" } caracteres, e no máximo { "64" } motivos distintos recebem série própria; os posteriores são contados em <c1/> e em <c2/>, de modo que uma entrada hostil ou com defeito não consegue criar cardinalidade ilimitada de rótulos.

# text
# c1: band
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: unknown
# c7: kinematic
# c8: heading-course
# c9: cn0-drop
# c10: agc
# c11: raim
seg-35f3faf39d1c = <c1/> é um entre <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Os nomes de motivo são os nomes dos monitores do fluxo (<c7/>, <c8/>, ...; para o resultado em lote, <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Um painel de exemplo está em <c1/> (importe-o e escolha sua fonte de dados Prometheus).

# text
seg-208f33eda580 = Syslog: CEF and LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Os eventos são enviados em um envelope RFC { "5424" } (facility local0, app <c1/>, id de mensagem <c2/>) sobre UDP (um datagrama cada; IPv4 ou IPv6) ou TCP, terminados em nova linha por padrão ou, com <c3/>, com enquadramento <c4/> como na RFC { "6587" }. Por padrão um evento é enviado a cada mudança de faixa; <c5/> envia um por época. O fornecedor é escrito <c6/> (ASCII) para que nenhum SIEM o decodifique errado.

# text
seg-9cb6e1b9fec0 = Conceito

# text
seg-9e4ce52ac5d9 = Severidade do syslog

# text
seg-084d2e726d3f = Severidade do CEF

# text
# c1: sev
seg-60fa1c602748 = LEEF <c1/>

# text
seg-7948fbcf87cb = calibrating

# text
seg-453691777f9d = { "6" } info

# text
seg-2ac57280bf6a = { "4" } warning

# text
seg-f757a767bd4a = untrusted

# text
seg-8e4e2d9142f9 = { "2" } critical

# text
seg-4c5b832482cb = unknown

# text
seg-5e4f3b0222cd = { "5" } notice

# text
# c1: gnss-trust.<band>
seg-b07ec4ccabf7 = Mapeamento de campos (o id do evento é <c1/>):

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (delimitador <c1/>)

# text
seg-18a4ca402cd9 = categoria

# text
seg-d3bc36a445cb = host de envio

# text
seg-521cea5013c8 = faixa

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (rótulo <c2/>)

# text
seg-f1be6ef87011 = motivos, separados por vírgula

# text
seg-e77a9847bc7b = faixa anterior

# text
seg-87b7f1652b0c = pontuação

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), omitido se não houver

# text
seg-fc2aebb988bf = deslocamento da época, s

# text
seg-9f9d0d551742 = rótulo de tempo do registro

# text
seg-57ed10b00272 = estado da comporta (gate)

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = status de geometria, depois <c1/> e as classes das deduções da época, separadas por vírgula (por exemplo <c2/>) <em>(entradas { "1.3" })</em>; a partir de entradas que trazem o rótulo ({ "0.36" }), um terceiro campo, <c3/> e o rótulo, com o campo de classes então sempre presente (por exemplo <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (somente status), <c2/> (classes) e <c3/> (rótulo)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, com o rótulo)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, com o rótulo)</em>

# text
seg-42273c09a591 = não transportado: os quatro campos personalizados de ponto flutuante já estão ocupados

# text
seg-292efe9557d6 = satélites usados <em>({ "0.36" }, com o rótulo)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), um inteiro

# text
seg-f69551c20173 = perda de sinal: satélites à vista não rastreados enquanto sua geometria é boa

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = não transportado como campo (nenhuma chave do dicionário CEF está livre para isso): o status aparece como <c1/> e a classe da dedução de geometria <c2/> em <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, somente enquanto vale

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = Em CEF, a geometria usa apenas campos personalizados do dicionário (sem chaves inventadas); o rótulo viaja em <c1/> em vez de <c2/> porque o codec CEF do Logstash não mapeia os campos <c3/>. Os eventos de geometria { "1.3" }, inclusive os casos de rótulo, fazem parte da linha CEF VALIDATED: ambos os analisadores usados como referência independente os leem de volta como foram escritos (<c4/>, emendas { "4" } e { "5" }, cada uma registrada antes de qualquer analisador ser executado em seus casos). Os campos de rótulo, VDOP e contagem de satélites são acrescentados após todo campo e série anteriores, e somente para entradas que trazem o rótulo, de modo que uma entrada sem rótulo é renderizada exatamente como antes.

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Campos vazios são omitidos (sem <c1/> quando não há motivos). O nome do host é cortado em { "255" } caracteres. Os valores de cabeçalho CEF escapam <c2/> e <c3/>; os valores de extensão escapam <c4/>, <c5/> e quebras de linha. Nos valores LEEF, <c6/> e quebras de linha são substituídos por espaços.

# text
seg-a3b77e9593eb = OpenTelemetry (desativado por padrão)

# text
# c1: --features otlp
# c2: --otlp http://host:4318/v1/metrics
# c3: kshana.trust.score
# c4: kshana.trust.band
# c5: kshana.trust.epochs
# c6: kshana.trust.reason.epochs
# c7: kshana.geometry.status
# c8: kshana.geometry.degraded
# c9: kshana.geometry.signal_loss
# c10: kshana.geometry.hdop
# c11: kshana.geometry.pdop
# c12: kshana.geometry.used_satellites
# c13: kshana.geometry.label
# c14: label
# c15: kshana.geometry.vdop
# c16: startTimeUnixNano
# c17: --otlp-every
# c18: https://
seg-396c34d29783 = Compile com <c1/> e passe <c2/>. O exportador envia por POST JSON OTLP/HTTP (<c3/>, <c4/>, <c5/>, <c6/>, e para entradas do esquema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> e, a partir de entradas que trazem o rótulo ({ "0.36" }), <c13/> (atributo <c14/>) e <c15/>; as somas cumulativas trazem <c16/>) a cada <c17/> épocas (padrão { "10" }) e no fim da entrada. Não acrescenta dependência e não tem TLS: envie a um coletor no mesmo host ou em um segmento confiável, que repassa adiante por TLS. Endpoints <c18/> são recusados.

# text
seg-c3111d73a8b0 = <s1>Anterior</s1>Geometria do céu e linhas de horizonte

# text
seg-4c539b667a05 = <s1>Próximo</s1>Verificação Galileo OSNMA
