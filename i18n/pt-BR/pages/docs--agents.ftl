# docs--agents: translations (pt-BR)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Fonte: <c1/>

# text
seg-d0e198572cfe = Uso do Kshana a partir de um agente de IA

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Para um agente (ou a pessoa que o dirige): qual ferramenta chamar para qual pergunta, o que as ferramentas farão e não farão, e o que manter com cada resposta. Superfícies e as células que não estão disponíveis em uma dada superfície: <a1><c1/></a1>.

# text
seg-a0354cacda4c = Conectar

# text
seg-337d23a873f5 = Um trecho que nomeia clientes de IA de terceiros foi omitido aqui; ele está em <a1>docs/AGENTS.md</a1> no GitHub.

# text
seg-01a862ed86e6 = A regra para toda resposta

# text
seg-0adf5e5ad79a = Execute o motor; não adivinhe os números. Informe o que uma ferramenta retornou com sua unidade e seu nível de evidência (VALIDATED contra uma referência independente externa, ou MODELLED), o cenário, a semente e a versão do motor, para que a execução possa ser repetida. Mantenha as ressalvas próprias de cada resultado junto dele.

# text
seg-f67845b891c5 = Qual ferramenta para qual pergunta

# text
seg-6f4bb4962340 = A pergunta

# text
seg-8efda304925b = Ferramenta (MCP)

# text
seg-83d609ff5cc7 = Comando de barra

# text
seg-9b937d3cbf88 = Executar ou explicar um cenário PNT (órbitas, GNSS, temporização, fusão, lunar, enlaces ópticos, ...)

# text
seg-ba8b3824bba2 = Este log de receptor, ou o NMEA desta embarcação, era confiável, e quando deixou de ser?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (qualquer formato de log), <c2/> (NMEA de embarcação, em lote), <c3/> (trecho limitado)

# text
seg-aa194fda4300 = Preciso de NMEA sintético com um evento de jamming, arrasto de posição, falsificação de tempo ou replay para treinamento

# text
seg-0211b49536df = Mostrar a pontuação de confiança de uma embarcação em formatos de monitoramento ou SIEM (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Pontuar um log de receptor contra o cronograma publicado do Jammertest (latência de detecção, alarmes perdidos, alarmes falsos, tempo de recuperação), ou transformar esse plano em eventos

# text
seg-d1c81008d5f8 = Criar um registro com evidência de adulteração do que o motor informou sobre uma janela do log de uma embarcação, ou verificar um

# text
seg-b7892674ac60 = Dados de navegação de quais satélites Galileo este fluxo de receptor autentica (OSNMA)?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>nenhuma: não está no MCP.</b> Use <c1/> (CLI), <c2/> (Python) ou <c3/> (WASM, o cartão OSNMA do Studio)

# text
seg-4fc021a0a145 = não é um comando de barra

# text
seg-0f5db62071e9 = Preciso do movimento do veículo e dos horários de eventos de um cenário para reproduzir em um simulador GNSS de laboratório

# text
seg-919946a95002 = Para quais linhas de requisitos de referenciais públicos estas execuções fornecem evidências em apoio, e qual é a lacuna?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (a partir do texto de resultado), <c2/> (as tabelas, sem execuções)

# text
seg-ff6556a46025 = Executar um pacote de normas pontuado (perfis de teste do DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Apêndice F) contra limiares declarados antes da execução?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (passe o relatório a <c3/> para obter as linhas)

# text
seg-1745cce01677 = Verificar o LunaNet Augmented Forward Signal (códigos, SB1, formato de quadro) contra o LNIS V5 / LSIS-AFS V1.0, ou verificar um fluxo de símbolos?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols ou generate); o LDPC e o CRC-24Q dos subquadros { "2" } a { "4" } não são verificados

# text
seg-86c207c3996e = Vincular uma execução de laboratório (cenário, condições de teste declaradas, log de receptor, pontuação) em um único pacote assinado?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> após <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = Pontuar uma submissão de detecção ou de holdover contra um arquivo de verdade do kshana-bench, ou renderizar arquivos de resultado como a página do leaderboard?

# text
seg-87e686c064ce = Preciso de um cenário que percorra uma rota GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = Quais satélites um usuário em uma rua, um porto, um fiorde ou um terminal de contêineres enxerga, e quais são o DOP e a elipse de erro?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (uma requisição, ou um <c2/>); a seção <c3/> de um cenário por meio de <c4/> (<c5/> e <c6/> precisam de <c7/>)

# text
seg-bd7f9d7e8e27 = Onde o GNSS apareceu degradado, e quanto desta rota está nessa condição?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, depois <c2/>

# text
seg-1f715d5e0c4f = Gravações IQ GNSS (cena, aquisição, rastreamento, front-end, campanhas)

# text
# c1: iq_signals
# c2: iq_*
seg-5569efd18c6b = <c1/> primeiro, depois as ferramentas <c2/>

# text
# c1: vessel-receiver-trust
# c2: training-nmea-scenario
# c3: trust-telemetry
# c4: compliance-mapping
# c5: test-bench-export
# c6: gnss-iq
# c7: interference-map-route-exposure
seg-d44650438742 = As skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> e <c7/> trazem as regras abaixo para agentes que carregam skills.

# text
seg-a4de5a40b743 = O que cada ferramenta não fará

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Ler ou gravar arquivos.</b> O conteúdo é embutido: as entradas são texto na requisição, limitado a { "4" } MiB, e um campo de cenário que nomeia um arquivo é recusado. Apenas as ferramentas <c1/> tocam uma pasta, e somente a nomeada por <c2/>, com todo caminho confinado a ela.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>Verificar o OSNMA.</b> Não há ferramenta MCP: a entrada é um fluxo bruto longo de receptor (páginas I/NAV ou uma captura UBX), que convém à CLI e ao Python, e uma ferramenta que a recebesse acrescentaria uma grande superfície de entrada sem benefício. Encaminhe o usuário a <c1/> (ou ao <c2/> do Python). Seja qual for a saída, mantenha o aviso consultivo literalmente: apenas estado de autenticação, não um serviço de integridade de navegação, não um equipamento de navegação homologado, e sem nenhuma afirmação de desempenho antispoofing; um resultado só tem significado com uma raiz de Merkle ou chave pública que o usuário obteve por outra via.

# text
seg-b13a75d08152 = Executar um processo.

# text
# c1: receiver-trust live
# c2: --listen
# c3: trust-telemetry
# c4: assess_vessel_stream
# c5: advisory
# c6: geometry
# c7: class
# c8: #
# c9: --udp
# c10: --listen tcp:
seg-9dfcbee6fdb8 = <c1/> como fluxo em execução (com um portão e <c2/>), os exportadores de telemetria (<c3/>: Prometheus, syslog, OTLP) e o envio em fluxo de NMEA de treinamento a um endereço existem apenas na linha de comando. <c4/> pontua um trecho com o mesmo motor e não grava em nenhuma porta. As ferramentas de trecho retornam o esquema JSON-lines live { "1.3" } (uma declaração <c5/> e a <c6/> de satélites em cada época, uma <c7/> em cada dedução); o CSV de uma execução de embarcação começa com uma linha de comentário <c8/> que traz a mesma declaração, de modo que se deve lê-lo com uma opção de comentário. <c9/> e <c10/> usam o endereço de loopback, a menos que se determine outro.

# text
seg-ac51aad84893 = Gravar um sinal.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> retorna o movimento do veículo e intervalos de eventos rotulados como texto; nada do que retorna é, modela ou comanda um sinal de radiofrequência ou de banda base, e um evento não é uma receita para produzir interferência. Forneça seu <c2/> junto com os arquivos; o simulador e seu operador são responsáveis por executá-los apenas onde for permitido.

# text
seg-39f3aae1143a = Dizer mais do que o mapeamento diz.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> informa para quais linhas de referenciais um conjunto de execuções fornece evidências em apoio, com a lacuna de cada linha. Ele nunca diz que um referencial é atendido nem que um produto foi classificado ou aprovado; mantenha seu <c2/> literalmente e diga "fornece evidências em apoio de", nada mais forte. Ele lê o texto de resultado e de cenário que você passa, nunca um caminho.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Buscar dados.</b> O download de polígonos de terra existe apenas na linha de comando e precisa de <c1/>. Passe o arquivo de terra, se desejado, como texto. Use apenas dados que o usuário tenha licença para usar.

# text
seg-d513f734248e = <b>Transmitir qualquer coisa ou sintetizar RF.</b> O gerador de treinamento grava texto NMEA; a camada IQ grava arquivos de amostras para receptores por software.

# text
seg-63eb4c5b4a17 = O que manter junto com a resposta

# attr:aria-label, text
seg-6555ff9a6d8e = Saída

# text
seg-a056a59fb678 = Manter

# text
seg-c01c0fedd895 = Geometria de satélites e classes de dedução ({ "0.36" })

# text
# c1: geometry
# c2: environment
# c3: inconsistency
# c4: unknown
seg-3723ec5a3f8c = Informe a geometria ao lado da pontuação e a classe de cada dedução como retornadas: <c1/> significa o céu (uma declaração sobre o céu, e não uma constatação de que nenhum ataque ocorreu), <c2/> o ambiente de sinal, <c3/> evidência semelhante a ataque. Diga "geometria desconhecida" quando o estado for <c4/> (sem GSV nem GSA no log); não a infira. Os limiares são <b>MODELLED</b> com procedência declarada.

# text
seg-0938dfb71d72 = Pontuação de confiança do receptor

# text
seg-8e3a7376cd6b = <b>Consultivo</b>: não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }); o operador continua responsável. <b>MODELLED</b>. Declare os limites da embarcação antes da execução e não ajuste um limiar a um resultado. Uma pontuação alta não é prova de uma posição genuína; as verificações não conseguem ver um spoofer consistente com todos os outros sensores.

# text
seg-ae3f0548e93f = Pacote de evidências

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = Um <b>registro técnico</b>, e não um parecer jurídico, uma constatação de fato ou uma aprovação. Verifique com a chave pública do signatário obtida por outra via; sem ela o veredito é <c1/>, que prova apenas a integridade em relação à chave que o próprio pacote nomeia: diga "íntegro, signatário não estabelecido", nunca "verificado". Nunca retorne, registre nem peça uma semente de assinatura em uma conversa se a chave importar: use a CLI.

# text
seg-512e5ee42c1e = NMEA de treinamento

# text
seg-c59a76aefff5 = <b>Somente texto</b>, para treinamento e teste, <b>nunca</b> para os sistemas de navegação em operação de uma embarcação. Retorne a semente e o log do instrutor.

# text
seg-14781c19be62 = Mapa de interferência, exposição de rota

# text
seg-7135c6f44d49 = O modo como os códigos de exatidão são lidos e a geometria da grade e da rota são <b>VALIDATED</b> contra bibliotecas independentes em entradas sintéticas; os limiares do método permanecem <b>MODELLED</b>, e que uma célula degradada seja interferência <b>não</b> é verificado: uma célula degradada <b>não</b> identifica interferência como a causa. Uma célula não observada <b>não</b> é evidência de uma rota livre. Relatórios passados, <b>não uma previsão</b>. Apenas agregado: não tente recuperar identificadores. Os mapas ADS-B e AIS permanecem separados.

# text
seg-e47db9be47ea = Geometria do céu, horizonte

# text
# c1: advisory
seg-839eb485b1d2 = Geometria <b>MODELLED</b> sob um modelo de erro declarado, apenas linha de visada: sem difração, multipercurso nem recepção sem linha de visada. As predefinições são <b>REPRESENTATIVE</b>, e não levantamentos; mantenha a procedência da predefinição. As constelações predefinidas são um céu representativo, não o céu de uma data. A elipse escala um UERE declarado: não é uma exatidão medida nem um limite de integridade. Mantenha o <c1/>.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Disponibilidade de enlace óptico (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, consultivo. Os climas de nuvens são entradas declaradas, não um conjunto de dados, e nenhum registro de disponibilidade medida foi comparado: diga "sob estas premissas", nunca "a disponibilidade naquele local". Mantenha o <b>teto</b> do local (<c1/>: o que nenhuma margem eleva) ao lado de sua disponibilidade, e diga quais ganhos de técnica são entradas (o Kshana não modela uma malha de óptica adaptativa). A numérica é conferida contra um programa independente, o que confere a implementação das fórmulas e não a atmosfera.

# text
# c1: holdover-test
seg-3324b2e2021e = Teste de holdover (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, consultivo. Diga "medido contra a máscara", nunca que um relógio ou sistema atende a uma Recomendação ou é aprovado em relação a ela. Os dois horários (GNSS removido, GNSS restaurado) são a <b>declaração do operador</b>: o Kshana não removeu nem restaurou nada e não pode verificá-los, portanto cite-os como declarados. Uma máscara para a qual o registro é curto demais é <b>INCOMPLETE</b>, nunca um sucesso. Um log de servo (linuxptp, chrony) é o erro sob controle de servo, e não uma medição independente contra o UTC; diga de qual registro vêm as figuras. Veja <c1/>.

# text
seg-18d3f2b50d0a = Qualquer resultado de cenário

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = O <c1/> ou o <c2/> que ele declara, e a linha de procedência.

# text
seg-166f773b2804 = Limites

# text
seg-203a91deb52c = Use dados sintéticos ou os próprios dados do usuário. Não nomeie pessoas, embarcações nem organizações em saídas que não estavam na entrada do usuário. O Kshana é uma ferramenta de análise e treinamento, e não um produto de voo ou de navegação.

# text
seg-ec064f62f7dc = <s1>Anterior</s1>Servidor MCP: modo HTTP auto-hospedado

# text
seg-1f44dbd65ce3 = <s1>Próximo</s1>Onde cada capacidade é acessível
