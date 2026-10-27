# docs--jammertest: translations (pt-BR)

# text
seg-f8cf777c0caa = Superfícies

# text
seg-45425f378b61 = significado

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Fonte: <c1/>

# text
seg-c2a40cd73d0e = Pontuação do Jammertest: o plano publicado como verdade agendada

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> lê o catálogo de testes e o plano de transmissão do Jammertest e transforma os slots de uma área de teste em <c2/> de confiança do receptor. <c3/> passa um log de receptor pelos monitores de confiança e o pontua contra esse cronograma, teste a teste. Todo resultado é <b>MODELLED</b>: o cronograma diz quando um teste foi <em>planejado</em>, não quando um transmissor estava ligado.

# text
seg-bc4e7285c38a = Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação. Nada aqui é endossado pela Norwegian Public Roads Administration, pela Nkom ou pelos organizadores do evento; nenhum acordo com eles é alegado.

# attr:alt
seg-af0edceb1503 = Pontuação de um log de receptor sintético contra um cronograma de três testes, a partir de uma execução real do motor v{ $version } (`kshana jammertest score`). O log é inventado: { "1800" } s de NMEA com uma queda de { "20" } dB em C/N0 durante dois intervalos. O cronograma lista três slots; o slot do meio não tem jammer no log. A pontuação marca { "2" } de { "3" } testes detectados (latência mediana de { "0" } s) e { "1" } perdido, com { "0" } execuções de falso alarme em { "0.25" } h de tempo limpo. Nada aqui diz coisa alguma sobre um receptor real. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua responsável pela navegação da embarcação.

# text
seg-ceaa46bdcb7e = O plano e o catálogo

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Fonte: o repositório <c1/> da Norwegian Public Roads Administration (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>licença MIT</b> (copyright { "2024" } Norwegian Public Roads Administration; o texto da licença é verificado em <c2/>). Os arquivos são baixados, nunca incorporados ao repositório:

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = Ele baixa os catálogos e os arquivos do plano de { "2025" } no commit fixado <c1/> e recusa qualquer arquivo cujo SHA-256 difira de <c2/>.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Um teste do catálogo tem um id com pontos, <c1/> (por exemplo <c2/>: tipo { "1" } jamming, grupo { "2" }, teste { "5" }). O plano lista, por área de teste e slot de tempo, qual id está agendado. Os tipos { "1" } (jamming), { "2" } (spoofing) e { "3" } (meaconing) transmitem; o tipo { "0" } (briefings, período de tolerância, reservas e slots ad hoc) não transmite e é ignorado. Os horários do plano são o horário local de parede; <c3/> (padrão { "2" }, CEST) diz o quanto diferem do UTC. Os arquivos do plano trazem um campo de contato do teste com o nome de uma pessoa: ele nunca é lido, e nada derivado dele é gravado.

# text
seg-3eab33a0c38f = Importação

# text
# c1: --log-start <UTC time>
# c2: --log
# c3: --format
# c4: [[events]]
# c5: scheduled truth:
# c6: --attack-log <scenario.json>
# c7: attack_log
# c8: --time-shift-h
# c9: Z
seg-91fddde78691 = <c1/> substitui <c2/>/<c3/> quando o log não informa o seu início. A saída é TOML <c4/> para anexar a um cenário de confiança do receptor; cada rótulo começa com <c5/> e traz o ano da edição, o id do catálogo e a área, e o cabeçalho registra o SHA-256 de cada arquivo de origem. <c6/> lê, em vez disso, a verdade de eventos de uma pasta do conjunto de dados JammerTest { "2024" } (o seu <c7/>, com carimbos deslocados por <c8/>, padrão -2: eles dizem <c9/>, mas são horário local).

# text
seg-6ed6415a6f52 = Pontuação

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> é um cenário de confiança do receptor (<c2/>, <c3/> e <c4/> opcionais). Os seus próprios <c5/> são substituídos pelo cronograma importado. Por teste agendado:

# text
seg-99427ab75a03 = campo

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (um alarme dentro de <c2/>, padrão { "10" } s, do início planejado), <c3/> (depois, dentro do slot), <c4/> (nenhum), <c5/>

# text
seg-01a977f18700 = primeiro alarme menos o início planejado

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = do fim do slot até o início do primeiro trecho de pelo menos <c1/> ({ "10" } s) sem alarme, antes do teste seguinte

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Um teste só é pontuável se começar pelo menos <c1/> depois do início do log; um log com um teste anterior é sinalizado como <c2/> (a linha de base pode ter sido formada sob interferência). Os <b>falsos alarmes</b> são épocas de alarme pós-calibração fora de todos os slots estendidos por <c3/> ({ "60" } s) antes e depois (ou depois do ponto de recuperação), contados como épocas e como execuções, com execuções por hora de tempo limpo. Com <c4/> e <c5/>, a execução é gravada como um pacote de evidências assinado (<c6/>): o placar e o cronograma importado ficam dentro de <c7/>, portanto dentro da cadeia de hashes e da assinatura. Um pacote é um registro técnico, não uma opinião jurídica.

# text
seg-382613112d5d = O que um resultado não diz

# text
seg-f1cb12a89001 = Um slot planejado não é um registro de transmissão no ar. Um transmissor pode ter começado tarde, parado cedo ou nunca ter funcionado; um teste "missed" pode ser um teste que não transmitiu, e uma latência é medida a partir do início planejado.

# text
seg-32baa4a4b9f0 = Uma época "limpa" é "fora dos slots planejados", não "comprovadamente livre de interferência".

# text
seg-95cc22bbacc5 = A detecção por monitores no domínio da medição não diz nada sobre a detecção de um spoofer coerente de baixa potência.

# text
seg-2e91813cf9d7 = Nenhuma referência independente externa informa os horários reais no ar, de modo que nada aqui é VALIDATED.

# text
seg-cfdf09e38e6e = A execução do conjunto de dados de { "2024" } (pré-registrada)

# text
# c1: xval/jammertest-score/PREREGISTRATION.md
# c2: xval/jammertest-score/RESULTS.md
# c3: .ubx
# c4: PREREGISTRATION-v2.md
# c5: RESULTS-v2.md
# c6: 7
# c7: xval/oracles/setup.sh
# c8: tests/jammertest_score_2024.rs
# c9: KSHANA_JAMMERTEST_DIR
seg-473ed6ca71e5 = <c1/> fixou a população, as definições e os limiares antes da primeira execução pontuada; <c2/> registra essa execução. Resultado: <b>a regra registrada de dados mínimos falhou</b> ({ "4" } janelas de jamming pontuáveis vindas de { "4" } das { "12" } pastas <c3/>: { "5" } pastas foram descartadas pela regra da linha de base e { "3" } logs UBX informam o seu início apenas como tempo da semana GPS), de modo que <b>nenhum limiar é avaliável</b>. Nada foi afrouxado nem reexecutado. A <b>v2</b> (<c4/>, versionada isoladamente antes da sua execução; apenas tratamento de dados, os mesmos limiares e a mesma regra de dados mínimos) posicionou os logs só com tempo GPS a partir da data da pasta, pontuou as { "12" } pastas somente com CSV e usou uma sessão de plataforma móvel para os rovers em movimento. Resultado (<c5/>): { "14" } de { "24" } pastas mantidas, mas apenas <c6/> janelas de jamming pontuáveis, de modo que a regra de dados mínimos falhou de novo e <b>nenhum limiar é avaliável</b>. O resultado da v1 permanece inalterado. Apenas descritivo: { "3" } de { "7" } janelas de jamming deram alarme em até { "10" } s, { "4" } depois, nenhuma perdida; latência mediana de { "18" } s; taxa de alarme limpo de { "0.089" }. O limite determinante agora é a regra da linha de base, que remove { "10" } pastas; um novo registro exigiria uma regra diferente para as janelas iniciais. O conjunto de dados (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) é baixado por <c7/> e nunca incorporado ao repositório; o teste <c8/> fixa a execução registrada quando <c9/> aponta para o conjunto de dados extraído.

# text
seg-cd75b60bd0db = O conjunto de dados NMEA SimulaMet de { "2025" }

# text
seg-87bc2544154b = O conjunto de dados derivado de NMEA do SimulaMet Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>não</b> é adaptado na { "0.38" }. A sua página não indica nenhuma licença e diz "This dataset requires an IEEE DataPort Subscription to access": os termos não permitem claramente a redistribuição nem um download automatizado, de modo que nenhum adaptador ou script de download foi escrito. Usá-lo exige a decisão do proprietário e, idealmente, o acordo escrito dos autores.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (os mesmos nomes), ferramentas MCP com os mesmos nomes, e o comando <c4/> e a skill <c5/>. O pacote assinado existe apenas na linha de comando (exige uma chave de assinatura). Veja <c6/>.

# text
seg-82aab597103a = <s1>Anterior</s1>Sinal direto aumentado LunaNet

# text
seg-fb9e48a04566 = <s1>Próxima</s1>Entradas de máquina e de sensor
