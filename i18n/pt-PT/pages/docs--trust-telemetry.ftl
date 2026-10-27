# docs--trust-telemetry: translations (pt-PT)

# text
seg-2247a2344710 = Significado

# text
seg-d4e48c972084 = Etiquetas

# text
seg-ca448daf5ec7 = nominal

# text
seg-a129b9e613d0 = Tipo

# text
seg-2672b7f55371 = degradadas

# attr:alt
seg-c711c7fecbfc = Um resultado de confiança em três formatos de exportação, a partir de execuções reais do motor v{ $version } (`kshana trust-telemetry`) sobre examples/maritime-trust: exposição em texto Prometheus (a pontuação de confiança mais recente é { "5.9" } e a banda não fiável é a que está ativa), e as últimas mensagens CEF e LEEF. O comando não publica nada a menos que lhe seja dado um destino, não guarda credenciais e não transmite nenhum sinal de rádio. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Fonte: <c1/>

# text
seg-05919ac6cf31 = Confiança GNSS como telemetria de segurança

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> transforma o fluxo de confiança GNSS por época (pontuação 0-100, banda, motivos) em sinais que um centro de operações ou de segurança já ingere: métricas Prometheus, eventos syslog em CEF ou LEEF para um SIEM e, opcionalmente, OpenTelemetry. Lê o fluxo; nunca altera a avaliação de confiança e não transmite nada além de telemetria.

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
seg-14ad6b7911d6 = A entrada é o esquema JSON-lines em direto v1.1 documentado em <c1/>. Lê: <c2/>; <c3/> (<c4/>, a banda); <c5/> (0-100 ou null); <c6/> (o tempo da época tal como indicado); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/>, ou null); os motivos são os monitores em <c13/>, depois quaisquer outros em <c14/>; a partir do esquema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) e o <c20/> de cada dedução. As outras chaves são ignoradas, uma vez que o esquema só cresce por chaves acrescentadas. Uma linha que não é analisada é contada em <c21/> e saltada; as pontuações fora de 0-100 são rejeitadas, não limitadas, para que uma alteração de formato seja notada. O único código que conhece este formato é <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> é servido sem autenticação e usa por predefinição <c2/>. Associá-lo a outro endereço imprime um aviso; coloque-o atrás do seu próprio controlo de acesso. O ponto de acesso trata uma ligação de cada vez com um limite de leitura de { "2" } s, pelo que um cliente inativo pode atrasar uma recolha até esse tempo; destina-se a um único coletor, não à rede aberta.

# text
seg-7e66e43f15a8 = Home Assistant e equipamentos NTP (MQTT)

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
seg-fbe56ff7f1ed = <c1/> imprime, e <c2/> publica, um documento de estado JSON e mensagens de descoberta MQTT do Home Assistant. A descoberta (retida, sob <c3/>) cria três entidades: pontuação de confiança, banda de confiança (com os motivos como atributos) e um sensor de problema <c4/>. O documento de estado vai para <c5/> (por predefinição <c6/>, retido): <c7/>, <c8/> (null enquanto não houver), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> e a declaração consultiva; a posição nunca é incluída. Opções: <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = O publicador fala MQTT { "3.1.1" } com QoS { "0" } e lê apenas o CONNACK do broker. Não tem credenciais nem TLS, pelo que se deve usar um broker na rede local (ou um relé local que as acrescente). A entrega corre na sua própria thread, atrás de uma fila de { "1024" }: um broker inativo descarta mensagens, contadas e comunicadas no fim, e nunca bloqueia o fluxo. Um equipamento NTP ou qualquer outro consumidor que queira JSON simples pode ler a mesma linha de estado. Nada é escrito num recetor ou num relógio. Python, WebAssembly e MCP aceitam <c1/> e devolvem as mesmas linhas <c2/> (nada é aí publicado).

# text
seg-ed95ebb0ba1b = A partir de Python, WebAssembly e MCP

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
seg-93be007cdfda = Os codificadores estão também disponíveis como chamadas de texto à entrada e texto à saída, sem processo, socket nem relógio: Python <c1/>, a exportação WebAssembly <c2/> e a ferramenta MCP <c3/> (comando de plugin <c4/>). <c5/> é <c6/>, <c7/>, <c8/> ou <c9/>; <c10/> é <c11/> (o fluxo) ou <c12/> (um resultado em lote). Devolvem o mesmo texto que a linha de comandos imprime (<c13/>, <c14/>), com os mesmos limites: as linhas syslog não levam marca temporal, <c15/> tem no máximo { "255" } carateres ASCII imprimíveis sem espaços (refused caso contrário, aqui e na linha de comandos), e uma resposta maior do que o limite da superfície ({ "4" } MiB no MCP) é refused, porque o CEF e o LEEF com <c16/> escrevem um evento por época. Nada é enviado, servido ou escrito; os exportadores em execução continuam a ser um processo na linha de comandos.

# text
seg-f8c367611a9e = A entrega nunca bloqueia a avaliação

# text
# c1: /metrics
seg-3853bb63c7ad = A entrega por syslog e por OpenTelemetry corre nas suas próprias threads. O ciclo de ingestão limita-se a entregar-lhes uma mensagem ou um instantâneo e nunca espera, pelo que um coletor inativo, lento ou que não leia não pode exercer contrapressão sobre o fluxo em direto nem congelar <c1/>:

# text
seg-589d02c31dfe = cada ligação e escrita tem um limite de { "2" } s; uma ligação falhada é descartada e restabelecida de forma lazy, com recuo exponencial de { "1" } s até { "60" } s;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = uma mensagem que não pode ser entregue (coletor inativo, escrita expirada, fila de { "1024" } cheia) é descartada e contada em <c1/>; defina alertas sobre a sua taxa;

# text
seg-4a7cd2065731 = o exportador OpenTelemetry recebe uma cópia do registo, pelo que nenhum bloqueio é mantido durante a E/S de rede; se uma exportação ainda estiver em curso, o novo instantâneo é saltado (o seguinte traz os mesmos totais acumulados).

# text
seg-57c3bbe405c8 = No fim da entrada, as threads de envio recebem os seus limites de tempo restantes para terminar.

# text
seg-14c13ed8c509 = Métricas Prometheus

# text
seg-d060b2163513 = Métrica

# text
seg-45c41bf74eb8 = gauge

# text
seg-e43a6814d13c = constante { "1" }

# text
seg-3662d2b8a789 = última pontuação 0-100; ausente se a fonte não fornecer nenhuma

# text
seg-1c50874472fc = { "1" } para a banda atual, { "0" } para as outras

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para o estado atual, { "0" } para os outros; ausente sem gate

# text
# c1: --expose-position
seg-3e01cab63c59 = posição comunicada pelo recetor; <b>apenas com <c1/></b> (o ponto de acesso não tem autenticação e uma posição pode identificar um local ou uma embarcação)

# text
seg-280a5ca2e5d9 = { "1" } se presente na última época

# text
seg-22ded4fe7f29 = contador

# text
seg-800b23c30e2f = épocas recebidas

# text
seg-be11849d8a9b = épocas em que o motivo esteve presente

# text
seg-0475fe7b26ba = linhas de entrada não analisáveis

# text
# c1: reason="other"
seg-65f1db183cbc = ocorrências de motivos agrupadas em <c1/> (ver abaixo)

# text
seg-e756633e7d5c = eventos syslog não entregues

# text
seg-2de3258f83ee = desvio da última época face ao início do fluxo

# text
seg-c02fe207663e = hora de relógio da receção; defina alertas sobre a sua idade

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = geometria dos satélites na última época, <c1/>, <c2/>, <c3/>: { "1" } para a atual <em>(entradas do esquema { "1.3" })</em>

# text
seg-4878afc243e3 = { "1" } degraded, { "0" } good; ausente quando a geometria é desconhecida

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" } quando os satélites à vista não são seguidos embora a sua geometria seja boa (perdeu-se o sinal, não o céu; <c1/> continua a indicar { "1" }), caso contrário { "0" }; ausente quando a geometria é desconhecida ou a entrada não o indica

# text
seg-db29584bb51c = HDOP, PDOP e satélites utilizados na última época; cada um ausente quando não existe

# text
seg-c60ca4530e92 = épocas por estado da geometria

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = etiqueta da geometria na última época, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } para a atual; nunca pontuada (a pontuação só deduz por <c5/>); a partir de entradas que trazem a etiqueta ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP na última época; ausente quando não existe

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>A etiqueta da geometria é o destaque.</b> Represente graficamente e defina alertas sobre <c1/> (OTLP <c2/>, CEF o terceiro campo <c3/>, LEEF <c4/>): <c5/> é a única etiqueta pela qual a pontuação deduz. O estado da geometria é descritivo: <c6/> inclui o caso informativo <c7/>, que pode surgir com DOP bom ou razoável, pelo que não se deve acionar alarmes só com <c8/>.

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
seg-70343708da03 = A partir de entradas do esquema { "1.3" }, <c1/> traz também uma etiqueta <c2/> (<c3/>, <c4/>, <c5/>) em cada motivo que a tenha: a classe da dedução na última época. As séries de geometria vêm depois de todas as outras e só quando uma época de entrada traz <c6/> (esquema em direto { "1.3" }, um resultado do motor { "0.36" } ou posterior), pelo que um fluxo ou resultado { "0.35" } é apresentado byte a byte como antes. Os valores das etiquetas são conjuntos fixos (um estado desconhecido lê-se <c7/>; uma classe desconhecida é descartada). Defina alertas sobre <c8/> em vez de apenas sobre a banda, para que um céu mau não acione alarmes como se fosse um ataque; uma classe <c9/> é uma afirmação sobre o céu, não uma conclusão de que não ocorreu nenhum ataque (ver <c10/>).

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
seg-3f45b21003d5 = A etiqueta <c1/> faz parte da identidade de uma série: quando a classe de um motivo muda entre épocas (<c2/> de <c3/> para <c4/> quando os satélites perdidos eram de baixa elevação, ou de <c5/> para <c6/> quando o HDOP indicado discorda do céu indicado), a série antiga deixa de ser exportada e começa uma nova. Consulte por <c7/> com <c8/> quando a classe não interessa, e conte com que uma tal mudança se pareça com o fim de uma série e o início de outra. As séries do esquema { "1.3" }, a etiqueta <c9/> e os campos de geometria CEF/LEEF são verificados pelos próprios testes do motor e pelas referências independentes de CEF (pycef, Logstash); as referências independentes externas de Prometheus e OTLP ainda não têm fluxo { "1.3" }.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Os nomes dos motivos são cortados a { "128" } carateres, e no máximo { "64" } motivos distintos têm série própria; os seguintes são contados em <c1/> e em <c2/>, pelo que uma entrada hostil ou com erros não pode criar cardinalidade de etiquetas ilimitada.

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
seg-35f3faf39d1c = <c1/> é um de <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Os nomes dos motivos são os nomes dos monitores do fluxo (<c7/>, <c8/>, ...; para o resultado em lote, <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Existe um painel de exemplo em <c1/> (importe-o e escolha a sua origem de dados Prometheus).

# text
seg-208f33eda580 = Syslog: CEF e LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Os eventos são enviados num envelope RFC { "5424" } (facility local0, aplicação <c1/>, identificador de mensagem <c2/>) por UDP (um datagrama cada; IPv4 ou IPv6) ou TCP, terminados por nova linha por predefinição ou, com <c3/>, enquadrados como <c4/>, como na RFC { "6587" }. Por predefinição é enviado um evento por mudança de banda; <c5/> envia um por época. O fabricante é escrito <c6/> (ASCII) para que nenhum SIEM o descodifique mal.

# text
seg-9cb6e1b9fec0 = Conceito

# text
seg-9e4ce52ac5d9 = Severidade syslog

# text
seg-084d2e726d3f = Severidade CEF

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
seg-b07ec4ccabf7 = Mapeamento de campos (o identificador do evento é <c1/>):

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (delimitador <c1/>)

# text
seg-18a4ca402cd9 = categoria

# text
seg-d3bc36a445cb = anfitrião emissor

# text
seg-521cea5013c8 = banda

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (etiqueta <c2/>)

# text
seg-f1be6ef87011 = motivos, separados por vírgulas

# text
seg-e77a9847bc7b = banda anterior

# text
seg-87b7f1652b0c = pontuação

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), omitido se não existir

# text
seg-fc2aebb988bf = desvio da época, s

# text
seg-9f9d0d551742 = etiqueta da hora do registo

# text
seg-57ed10b00272 = estado do gate

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = estado da geometria, depois <c1/> e as classes das deduções da época, separadas por vírgulas (por exemplo <c2/>) <em>(entradas { "1.3" })</em>; a partir de entradas que trazem a etiqueta ({ "0.36" }) um terceiro campo, <c3/> e a etiqueta, estando o campo das classes sempre presente (por exemplo <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (apenas o estado), <c2/> (classes) e <c3/> (etiqueta)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, com a etiqueta)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, com a etiqueta)</em>

# text
seg-42273c09a591 = não transportado: são utilizados os quatro campos personalizados de vírgula flutuante

# text
seg-292efe9557d6 = satélites utilizados <em>({ "0.36" }, com a etiqueta)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), um inteiro

# text
seg-f69551c20173 = perda de sinal: satélites à vista não seguidos enquanto a sua geometria é boa

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = não transportado como campo (nenhuma chave do dicionário CEF está livre para isso): o estado lê-se <c1/> e a classe da dedução de geometria <c2/> em <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, apenas enquanto se verifica

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = Em CEF, a geometria usa apenas campos personalizados do dicionário (nenhuma chave inventada); a etiqueta segue em <c1/> e não em <c2/> porque o codec CEF do Logstash não mapeia os campos <c3/>. Os eventos de geometria { "1.3" }, incluindo os casos de etiqueta, fazem parte da linha CEF VALIDATED: ambos os analisadores de referência independente os releem tal como foram escritos (<c4/>, emendas { "4" } e { "5" }, cada uma registada antes de qualquer dos analisadores ter sido executado sobre os seus casos). Os campos de etiqueta, VDOP e número de satélites são acrescentados depois de todos os campos e séries anteriores, e apenas para entradas que trazem a etiqueta, pelo que uma entrada sem ela é apresentada exatamente como antes.

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Os campos vazios são omitidos (nenhum <c1/> sem motivos). O nome do anfitrião é cortado a { "255" } carateres. Os valores do cabeçalho CEF escapam <c2/> e <c3/>; os valores de extensão escapam <c4/>, <c5/> e quebras de linha. Nos valores LEEF, <c6/> e as quebras de linha são substituídos por espaços.

# text
seg-a3b77e9593eb = OpenTelemetry (desativado por predefinição)

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
seg-396c34d29783 = Compile com <c1/> e passe <c2/>. O exportador envia por POST JSON OTLP/HTTP (<c3/>, <c4/>, <c5/>, <c6/>, e para entradas do esquema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> e, a partir de entradas que trazem a etiqueta ({ "0.36" }), <c13/> (atributo <c14/>) e <c15/>; as somas acumuladas trazem <c16/>) a cada <c17/> épocas (por predefinição { "10" }) e no fim da entrada. Não acrescenta nenhuma dependência e não tem TLS: envie para um coletor no mesmo anfitrião ou num segmento fiável, que reencaminha por TLS. Os pontos de acesso <c18/> são refused.

# text
seg-c3111d73a8b0 = <s1>Anterior</s1>Geometria do céu e linhas de horizonte

# text
seg-4c539b667a05 = <s1>Seguinte</s1>Verificação Galileo OSNMA
