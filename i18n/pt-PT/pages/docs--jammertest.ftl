# docs--jammertest: translations (pt-PT)

# text
seg-f8cf777c0caa = Superfícies

# text
seg-45425f378b61 = significado

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Fonte: <c1/>

# text
seg-c2a40cd73d0e = Pontuação do Jammertest: o plano publicado como referência calendarizada

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> lê o catálogo de testes e o plano de transmissão do Jammertest e transforma os slots de uma área de teste em <c2/> de receiver-trust. <c3/> passa um registo de recetor pelos monitores de confiança e pontua-o face a esse calendário, teste a teste. Todos os resultados são <b>MODELLED</b>: o calendário indica quando um teste estava <em>planeado</em>, não quando um transmissor esteve ligado.

# text
seg-bc4e7285c38a = Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação. Nada aqui é avalizado pela Norwegian Public Roads Administration, pela Nkom nem pelos organizadores do evento; não se alega nenhum acordo com eles.

# attr:alt
seg-af0edceb1503 = Pontuação de um registo sintético de recetor face a um calendário de três testes, a partir de uma execução real do motor v{ $version } (`kshana jammertest score`). O registo é inventado: { "1800" } s de NMEA com uma queda de C/N0 de { "20" } dB em dois intervalos. O calendário enumera três slots; o slot do meio não tem jammer no registo. A pontuação marca { "2" } de { "3" } testes detetados (latência mediana de { "0" } s) e { "1" } falhado, com { "0" } execuções de falso alarme ao longo de { "0.25" } h de tempo limpo. Nada aqui diz seja o que for sobre um recetor real. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
seg-ceaa46bdcb7e = O plano e o catálogo

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Fonte: o repositório <c1/> da Norwegian Public Roads Administration (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>licença MIT</b> (direitos de autor { "2024" } Norwegian Public Roads Administration; o texto da licença é verificado em <c2/>). Os ficheiros são obtidos, nunca incluídos no repositório:

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = Descarrega os catálogos e os ficheiros do plano de { "2025" } no commit fixado <c1/> e recusa qualquer ficheiro cujo SHA-256 difira do de <c2/>.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Um teste do catálogo tem um identificador com pontos, <c1/> (por exemplo <c2/>: tipo { "1" } jamming, grupo { "2" }, teste { "5" }). O plano indica, por área de teste e por slot de tempo, que identificador está agendado. Os tipos { "1" } (jamming), { "2" } (spoofing) e { "3" } (meaconing) transmitem; o tipo { "0" } (sessões informativas, período de tolerância, reservas e slots ad hoc) não transmite e é ignorado. As horas do plano são horas locais de relógio; <c3/> (por predefinição { "2" }, CEST) indica quanto distam do UTC. Os ficheiros do plano contêm um campo de contacto de teste com o nome de uma pessoa: nunca é lido, e nada derivado dele é escrito.

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
seg-91fddde78691 = <c1/> substitui <c2/>/<c3/> quando o registo não indica o seu início. A saída é TOML <c4/> para acrescentar a um cenário receiver-trust; cada etiqueta começa por <c5/> e inclui o ano da edição, o identificador do catálogo e a área, e o cabeçalho regista o SHA-256 de cada ficheiro de origem. <c6/> lê antes a referência de eventos de uma pasta do conjunto de dados JammerTest { "2024" } (o seu <c7/>, com marcas temporais deslocadas por <c8/>, por predefinição -2: dizem <c9/> mas são hora local).

# text
seg-6ed6415a6f52 = Pontuação

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> é um cenário receiver-trust (<c2/>, <c3/> e <c4/> opcionais). Os seus próprios <c5/> são substituídos pelo calendário importado. Por teste agendado:

# text
seg-99427ab75a03 = campo

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (um alarme dentro de <c2/>, por predefinição { "10" } s, do início planeado), <c3/> (mais tarde, dentro do slot), <c4/> (nenhum), <c5/>

# text
seg-01a977f18700 = primeiro alarme menos início planeado

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = do fim do slot ao início do primeiro período de pelo menos <c1/> ({ "10" } s) sem alarme, antes do teste seguinte

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Um teste só é pontuável se começar pelo menos <c1/> depois de o registo ter começado; um registo com um teste anterior é assinalado como <c2/> (a linha de base pode ter-se formado sob interferência). Os <b>falsos alarmes</b> são épocas em alarme após a calibração fora de cada slot, prolongado por <c3/> ({ "60" } s) antes e depois (ou depois do ponto de recuperação), contados como épocas e como execuções, com execuções por hora de tempo limpo. Com <c4/> e <c5/>, a execução é escrita como um pacote de evidências assinado (<c6/>): a folha de pontuação e o calendário importado ficam dentro de <c7/>, logo dentro da cadeia de hashes e da assinatura. Um pacote é um registo técnico, não um parecer jurídico.

# text
seg-382613112d5d = O que um resultado não diz

# text
seg-f1cb12a89001 = Um slot planeado não é um registo de emissão. Um transmissor pode ter começado tarde, parado cedo ou nunca ter funcionado; um teste "falhado" pode ser um teste que não transmitiu, e uma latência conta-se a partir do início planeado.

# text
seg-32baa4a4b9f0 = Uma época "limpa" é uma época "fora dos slots planeados", não "comprovadamente sem interferência".

# text
seg-95cc22bbacc5 = A deteção por monitores no domínio da medição não diz nada sobre a deteção de um spoofer coerente de baixa potência.

# text
seg-2e91813cf9d7 = Nenhuma referência independente externa indica as horas reais de emissão, pelo que nada aqui é VALIDATED.

# text
seg-cfdf09e38e6e = A execução do conjunto de dados de { "2024" } (pré-registada)

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
seg-473ed6ca71e5 = <c1/> fixou a população, as definições e os limiares antes da primeira execução pontuada; <c2/> regista essa execução. Resultado: <b>a regra registada de dados mínimos falhou</b> ({ "4" } janelas de jamming pontuáveis de { "4" } das { "12" } pastas <c3/>: { "5" } pastas foram descartadas pela regra da linha de base e { "3" } registos UBX indicam o seu início apenas como tempo GPS da semana), pelo que <b>nenhum limiar é avaliável</b>. Nada foi afrouxado nem voltou a ser executado. A <b>v2</b> (<c4/>, submetida sozinha antes da sua execução; apenas tratamento de dados, mesmos limiares e mesma regra de dados mínimos) colocou os registos só com tempo GPS a partir da data da pasta, pontuou as { "12" } pastas só com CSV e usou uma sessão de plataforma em movimento para os rovers em movimento. Resultado (<c5/>): { "14" } de { "24" } pastas mantidas mas apenas <c6/> janelas de jamming pontuáveis, pelo que a regra de dados mínimos voltou a falhar e <b>nenhum limiar é avaliável</b>. O resultado da v1 não se altera. Apenas descritivo: { "3" } de { "7" } janelas de jamming deram alarme em { "10" } s, { "4" } mais tarde, nenhuma falhada; latência mediana de { "18" } s; taxa de alarmes em tempo limpo de { "0.089" }. O limite determinante é agora a regra da linha de base, que remove { "10" } pastas; um novo registo exigiria uma regra diferente para as janelas iniciais. O conjunto de dados (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) é obtido por <c7/> e nunca incluído no repositório; o teste <c8/> fixa a execução registada quando <c9/> aponta para o conjunto de dados extraído.

# text
seg-cd75b60bd0db = O conjunto de dados NMEA da SimulaMet de { "2025" }

# text
seg-87bc2544154b = O conjunto de dados derivado de NMEA do Jammertest { "2025" } da SimulaMet (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>não</b> é adaptado na { "0.38" }. A sua página não indica nenhuma licença e diz "This dataset requires an IEEE DataPort Subscription to access": os termos não permitem claramente a redistribuição nem uma obtenção automática, pelo que não foi escrito nenhum adaptador nem script de obtenção. A sua utilização exige a decisão do titular e, idealmente, o acordo escrito dos autores.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (os mesmos nomes), ferramentas MCP com os mesmos nomes, e o comando <c4/> e a skill <c5/>. O pacote assinado é só de linha de comandos (precisa de uma chave de assinatura). Ver <c6/>.

# text
seg-82aab597103a = <s1>Anterior</s1>Sinal avançado LunaNet

# text
seg-fb9e48a04566 = <s1>Seguinte</s1>Entradas de máquinas e sensores
