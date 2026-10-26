# docs--compliance-mapping: translations (pt-PT)

# attr:aria-label, text
seg-6555ff9a6d8e = Saída

# text
seg-2247a2344710 = Significado

# text
seg-d6476863f862 = Capacidade

# text
seg-ad856ad710eb = Estado

# text
seg-8d216d42c776 = Avaliação de confiança do registo de recetor

# text
seg-ff808ce8ec48 = Fontes PNT alternativas e diversas

# text
seg-3621a68a508c = Proveniência reprodutível de execuções

# text
seg-50fe2a3ff712 = Monitorização de integridade e níveis de proteção

# text
# c1: docs/compliance/README.md
seg-554a16dc7965 = Fonte: <c1/>

# text
# c1: kshana compliance-report
seg-76db63e8d2de = Os compradores e os fabricantes de recetores respondem perante quadros públicos de resiliência. Esta pasta mapeia o que o Kshana calcula e regista para esses quadros, linha a linha, e <c1/> preenche o mapeamento a partir das execuções que realmente tem.

# text
seg-e22a3aca9550 = <b>Formulação.</b> As saídas do Kshana <em>fornecem elementos de prova em apoio de</em> um requisito. Não são uma classificação nem uma aprovação de nenhum produto, e nenhum destes ficheiros é uma declaração de um organismo de avaliação; o Kshana não o é. O texto dos requisitos é parafraseado, nunca reproduzido.

# text
seg-2602c3f5aff6 = Quadro de referência

# text
seg-245fe1f87b08 = Ficheiro

# text
seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

# text
seg-0f7279ffb619 = Orientações da IMO sobre interferência GNSS para navios

# text
seg-f318176b86de = Orientações da EASA sobre interferência GNSS para a aviação

# text
seg-7939ac1eea3b = Diretiva NIS2 da UE, Artigo { "21" }

# text
seg-f2eccc9b815f = EN { "16803" } (norma paga; apenas por parte e por números de cláusulas visíveis no catálogo)

# text
seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (janeiro de { "2023" })

# text
# c1: kshana standards-pack list
seg-499fc17fb83a = Os <b>pacotes de normas</b> ({ "0.38" }) transformam um quadro de referência em cenários pontuados: cada pacote tem cenários, limiares fixados antes da execução e linhas em apoio das quais fornece elementos de prova. <c1/> mostra-os.

# text
seg-9c0eb89a2fbe = Pacote

# text
seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, perfis de teste para os níveis { "1" } a { "4" }

# text
seg-13e63b993f26 = IMO MSC.1/Circ.1575, processamento de dados PNT de bordo: níveis de exatidão e integridade

# text
seg-aa77ffe0acbf = ICAO Doc { "9849" } Apêndice F, monitorizar, avaliar e mitigar a interferência GNSS

# text
seg-b9387be0e4f1 = Cada ficheiro lista os seus documentos de origem com versão, URL, data de leitura e o que foi e não foi verificado. As fontes foram lidas em 2026-10-09 (o perfil do NIST em 2026-10-18; o boletim da EASA e as páginas do catálogo da EN { "16803" } foram verificados de novo em 2026-10-10). Quando uma fonte só pôde ser lida através de um espelho ou de uma página de catálogo, o ficheiro di-lo.

# attr:alt
seg-e98e25897176 = Todos os testes dos três pacotes de normas pontuados, a partir de execuções reais do motor v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } atingidos, { "1" } não atingido, { "2" } precisam de uma entrada; imo-circ-1575: { "1" } atingido, { "4" } não atingidos, { "2" } precisam de uma entrada; icao-doc9849-appf: { "6" } atingidos, { "0" } não atingidos, { "2" } precisam de uma entrada. No total, { "13" } atingidos, { "5" } não atingidos e { "6" } precisam de uma entrada que o motor não tem (um registo de recetor ou documentação do equipamento). Cada limiar foi fixado antes da execução; uma falha é mantida como falha. Um limiar atingido indica que um cenário modelado atingiu um limiar fixado, nada sobre um produto. Os pacotes fornecem elementos de prova em apoio das linhas que citam; não são uma avaliação. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de salvaguarda da vida humana; não deve ser a única base de nenhuma decisão de navegação ou de segurança.

# text
seg-092dd691ca17 = O relatório

# text
# c1: compliance-report.compliance.md
# c2: compliance-report.compliance.json
# c3: --out <base>
# c4: <name>.result.json
# c5: <name>.toml
# c6: kshana receiver-trust
# c7: kind
# c8: kind
# c9: scenario_hash
seg-10fac3e641e0 = escreve <c1/> e <c2/> (<c3/> muda o nome). As entradas são ficheiros de resultados de execuções anteriores: uma execução de cenário escreve <c4/> junto de <c5/>, e <c6/> escreve o seu próprio. O tipo de cenário de cada execução é lido do ficheiro de cenário junto do resultado, do conteúdo de um resultado receiver-trust ou de um <c7/> de nível superior, e tem de ser um tipo de cenário que o motor conheça. Um resultado é listado como não usado, com o motivo, e não conta para nada quando o seu tipo de cenário não pode ser encontrado, não é um tipo de cenário conhecido, ou o cenário vizinho e o <c8/> do próprio resultado discordam. (O <c9/> do resultado e um hash do ficheiro de cenário não são comparados: o motor calcula o primeiro sobre o seu cenário analisado e um hash de ficheiro incide sobre o texto, pelo que são grandezas diferentes.)

# text
# c1: jamming
# c2: integrity
# c3: src/compliance/mapping.rs
# c4: KIND_FIELDS
seg-464351dcdcc3 = <b>Uma etiqueta de tipo de cenário, por si só, não é prova.</b> Uma execução só conta para uma capacidade quando o seu resultado transporta também os campos que esse tipo de cenário escreve (por exemplo, um resultado <c1/> precisa das suas figuras de mérito e das linhas por época; um resultado <c2/> precisa das suas contagens de amostras). Os campos estão listados em <c3/> (<c4/>) e um resultado a que falte um deles não é contado. Um hash que não seja hexadecimal não é reportado como hash. Um resultado receiver-trust cujas contagens não são números inteiros, ou cuja contagem de detetados ou concordantes excede a sua contagem de avaliáveis, é excluído e listado como não usado.

# text
seg-5a316d97f37b = Para cada linha, o relatório indica uma de:

# text
seg-2243532bd26b = todas as capacidades que a linha nomeia têm pelo menos uma execução no conjunto

# text
seg-e905ae20cec1 = algumas têm

# text
seg-e23d6dfc4a00 = nenhuma tem

# text
seg-cf223ce076ce = nenhuma saída do Kshana diz respeito à linha

# text
# c1: --mapping
# c2: --sources
seg-ec76997fb4d4 = A coluna de lacunas é impressa para todas as linhas, incluindo as que têm provas: uma execução que fornece elementos de prova em apoio de uma capacidade deixa ainda a maior parte de um requisito para outras provas. O relatório repete a regra de formulação no seu início. <c1/> imprime as tabelas estáticas e <c2/> a lista de fontes.

# text
seg-f1c508a908ad = As execuções receiver-trust contribuem também com as contagens que declaram (eventos detetados dos avaliáveis, previsões concordantes dos avaliáveis). Essas contagens descrevem esse registo, pontuado face a eventos e tolerâncias fixados antes da execução, e são reportadas tal como a execução as declara.

# text
seg-662b717575e0 = Tipos de cenário das execuções

# text
seg-4377e24c36f5 = estado de confiança por época do próprio registo de um recetor real, instantes de alarme e concordância com eventos fixados antes da execução

# text
seg-766182e85848 = Efeitos do orçamento de ligação de jamming

# text
seg-6bee09017be6 = densidade portadora-ruído e estado de bloqueio por satélite sob uma geometria de jammer indicada

# text
seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

# text
seg-48fb757a45fc = Deteção de spoofing e meaconing

# text
seg-2e4a3355a936 = decisões do detetor e discriminação do detetor sob um ataque de spoofing indicado

# text
seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

# text
seg-e9a55e5a015b = níveis de proteção, disponibilidade face a limites de alerta e resultados de deteção de falhas

# text
seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

# text
seg-6344bf03463c = Holdover e marcha livre

# text
seg-a643345646c3 = crescimento do erro de posição ou de tempo enquanto o GNSS está negado, face a um limiar indicado

# text
seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

# text
seg-97e06c8a9b7f = desempenho de navegação ou de temporização a partir de fontes independentes da banda GNSS primária

# text
seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

# text
seg-25291db2798d = Pontuação de resiliência sobre ensembles de ameaças

# text
seg-9eef8dd0d9b9 = taxas de sobrevivência e de resiliência por vetor de ameaça sobre um ensemble indicado, com os pressupostos declarados

# text
seg-bdaa039247bd = conflict-resilience, campaign

# text
seg-e4be26a0cc63 = hash do cenário, versão do motor e semente transportados em cada resultado para que uma execução possa ser repetida

# text
# c1: scenario_hash
seg-89edc36c3560 = qualquer execução cujo resultado transporte um <c1/>

# text
seg-488aeabdc552 = <s1>Anterior</s1>Executar um recetor contra um cenário

# text
seg-53a872636d5a = <s1>Seguinte</s1>Quadro PNT resiliente do DHS dos EUA
