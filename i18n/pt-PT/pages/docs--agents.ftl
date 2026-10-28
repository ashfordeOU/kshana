# docs--agents: translations (pt-PT)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Fonte: <c1/>

# text
seg-d0e198572cfe = Usar o Kshana a partir de um agente de IA

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Para um agente (ou a pessoa que o dirige): que ferramenta chamar para que pergunta, o que as ferramentas farão e não farão, e o que manter com cada resposta. As superfícies e as células que não estão disponíveis numa dada superfície: <a1><c1/></a1>.

# text
seg-a0354cacda4c = Ligar

# text
seg-337d23a873f5 = Uma passagem que nomeia clientes de IA de terceiros é omitida aqui; está em <a1>docs/AGENTS.md</a1> no GitHub.

# text
seg-01a862ed86e6 = A regra para cada resposta

# text
seg-0adf5e5ad79a = Execute o motor; não adivinhe os números. Reporte o que uma ferramenta devolveu com a sua unidade e o seu nível de evidência (VALIDATED face a uma referência independente externa, ou MODELLED), o cenário, a semente e a versão do motor, para que a execução possa ser repetida. Mantenha com cada resultado as suas próprias ressalvas.

# text
seg-f67845b891c5 = Que ferramenta para que pergunta

# text
seg-6f4bb4962340 = A pergunta

# text
seg-8efda304925b = Ferramenta (MCP)

# text
seg-83d609ff5cc7 = Comando de barra

# text
seg-9b937d3cbf88 = Executar ou explicar um cenário PNT (órbitas, GNSS, temporização, fusão, lunar, ligações óticas, ...)

# text
seg-ba8b3824bba2 = Este registo de recetor, ou o NMEA desta embarcação, era fiável, e quando deixou de o ser?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (qualquer formato de registo), <c2/> (NMEA de embarcação, em lote), <c3/> (excerto limitado)

# text
seg-aa194fda4300 = Preciso de NMEA sintético com um evento de jamming, arrastamento de posição, spoofing de hora ou repetição para formação

# text
seg-0211b49536df = Mostrar a pontuação de confiança de uma embarcação em formatos de monitorização ou SIEM (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Pontuar um registo de recetor face ao calendário publicado do Jammertest (latência de deteção, alarmes em falta, falsos alarmes, tempo de recuperação), ou transformar esse plano em eventos

# text
seg-d1c81008d5f8 = Criar um registo com deteção de adulteração do que o motor disse sobre uma janela do registo de uma embarcação, ou verificar um

# text
seg-b7892674ac60 = Os dados de navegação de que satélites Galileo é que este fluxo do recetor autentica (OSNMA)?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>nenhuma: não está no MCP.</b> Use <c1/> (CLI), <c2/> (Python) ou <c3/> (WASM, o cartão OSNMA do Studio)

# text
seg-4fc021a0a145 = não é um comando de barra

# text
seg-0f5db62071e9 = Preciso do movimento do veículo e dos instantes dos eventos de um cenário para os repetir através de um simulador GNSS de laboratório

# text
seg-919946a95002 = Para que linhas de exigências de referenciais públicos estas execuções fornecem elementos de prova em apoio, e qual é a lacuna?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (a partir do texto de resultados), <c2/> (as tabelas, sem execuções)

# text
seg-ff6556a46025 = Executar um pacote de normas pontuado (perfis de ensaio DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Apêndice F) face a limiares declarados antes da execução?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (entregue o relatório a <c3/> para obter as linhas)

# text
seg-1745cce01677 = Verificar o LunaNet Augmented Forward Signal (códigos, SB1, formato de trama) face à LNIS V5 / LSIS-AFS V1.0, ou verificar um fluxo de símbolos?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols ou generate); o LDPC e o CRC-24Q das subtramas { "2" } a { "4" } não são verificados

# text
seg-86c207c3996e = Ligar uma execução de laboratório (cenário, condições de ensaio declaradas, registo do recetor, pontuação) num único pacote assinado?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> após <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = Pontuar uma submissão de deteção ou de holdover face a um ficheiro de referência do kshana-bench, ou gerar ficheiros de resultados como a página de classificação?

# text
seg-87e686c064ce = Preciso de um cenário que percorra uma rota GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = Que satélites vê um utilizador numa rua, num porto, num fiorde ou num terminal de contentores, e quais são o DOP e a elipse de erro?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (um pedido, ou um <c2/>); a secção <c3/> de um cenário através de <c4/> (<c5/> e <c6/> precisam de <c7/>)

# text
seg-bd7f9d7e8e27 = Onde o GNSS tem aparecido degradado, e que parte desta rota está nessas zonas?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, depois <c2/>

# text
seg-1f715d5e0c4f = Gravações IQ GNSS (cena, aquisição, seguimento, front-end, campanhas)

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
seg-d44650438742 = As competências <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> e <c7/> trazem as regras abaixo para agentes que carregam competências.

# text
seg-a4de5a40b743 = O que cada ferramenta não fará

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Ler ou escrever ficheiros.</b> O conteúdo é em linha: as entradas são texto no pedido, limitado a { "4" } MiB, e um campo de cenário que indique um ficheiro é recusado. Só as ferramentas <c1/> tocam numa pasta, e apenas na indicada por <c2/>, com todos os caminhos confinados a ela.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>Verificar OSNMA.</b> Não existe nenhuma ferramenta MCP: a entrada é um fluxo bruto longo de recetor (páginas I/NAV ou uma captura UBX), que se adequa à CLI e ao Python, e uma ferramenta que a recebesse acrescentaria uma superfície de entradas grandes sem benefício. Envie o utilizador para <c1/> (ou para o <c2/> do Python). Seja qual for o resultado, leve o aviso consultivo textualmente: apenas estado de autenticação, não é um serviço de integridade de navegação, não é um equipamento de navegação homologado e não é uma alegação de desempenho anti-spoofing; um resultado só é significativo com uma raiz de Merkle ou uma chave pública que o utilizador tenha obtido por outra via.

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
seg-9dfcbee6fdb8 = <c1/> como fluxo em execução (com um gate e <c2/>), os exportadores de telemetria (<c3/>: Prometheus, syslog, OTLP) e a transmissão de NMEA de formação para um endereço existem apenas na linha de comandos. <c4/> pontua um excerto com o mesmo motor e não escreve em nenhuma porta. As ferramentas de excertos devolvem o esquema JSON-lines em tempo real { "1.3" } (uma declaração <c5/> e a <c6/> de satélites em cada época, uma <c7/> em cada dedução); o CSV de uma execução de embarcação começa com uma linha de comentário <c8/> que leva a mesma declaração, pelo que deve lê-lo com uma opção de comentário. <c9/> e <c10/> ligam ao endereço de loopback, salvo indicação em contrário.

# text
seg-ac51aad84893 = Escrever um sinal.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> devolve o movimento do veículo e intervalos de eventos rotulados como texto; nada do que devolve é, modela ou comanda um sinal de radiofrequência ou de banda de base, e um evento não é uma receita para produzir interferência. Indique o seu <c2/> com os ficheiros; o simulador e o seu operador são responsáveis por os executar apenas onde for permitido.

# text
seg-39f3aae1143a = Dizer mais do que o mapeamento diz.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> indica para que linhas de referenciais um conjunto de execuções fornece elementos de prova em apoio, com a lacuna de cada linha. Nunca diz que um referencial é satisfeito nem que um produto é classificado ou aprovado; leve o seu <c2/> textualmente e diga "fornece elementos de prova em apoio de", nada mais forte. Lê texto de resultados e de cenários que lhe passe, nunca um caminho.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Obter dados.</b> A transferência dos polígonos de terra existe apenas na linha de comandos e precisa de <c1/>. Passe o ficheiro de terra, se desejado, como texto. Use apenas dados que o utilizador tenha licença para usar.

# text
seg-d513f734248e = <b>Transmitir seja o que for ou sintetizar RF.</b> O gerador de formação escreve texto NMEA; a camada IQ escreve ficheiros de amostras para recetores de software.

# text
seg-63eb4c5b4a17 = O que manter com a resposta

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
seg-3723ec5a3f8c = Reporte a geometria junto da pontuação e a classe de cada dedução tal como devolvidas: <c1/> significa o céu (uma declaração sobre o céu, e não uma conclusão de que não ocorreu nenhum ataque), <c2/> o ambiente de sinal, <c3/> indícios semelhantes a um ataque. Diga "geometria desconhecida" quando o estado é <c4/> (sem GSV nem GSA no registo); não infira uma. Os limiares são <b>MODELLED</b> com proveniência declarada.

# text
seg-0938dfb71d72 = Pontuação de confiança do recetor

# text
seg-8e3a7376cd6b = <b>Consultivo</b>: não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }); o operador continua a ser responsável. <b>MODELLED</b>. Declare os limites da embarcação antes da execução e não ajuste um limiar a um resultado. Uma pontuação elevada não é prova de uma posição genuína; as verificações não conseguem ver um spoofer coerente com todos os outros sensores.

# text
seg-ae3f0548e93f = Pacote de evidências

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = Um <b>registo técnico</b>, que não é um parecer jurídico, uma constatação de facto nem uma aprovação. Verifique com a chave pública do signatário obtida por outra via; sem ela o veredicto é <c1/>, que prova apenas a integridade face à chave que o próprio pacote indica: diga "íntegro, signatário não estabelecido", nunca "verificado". Nunca devolva, registe nem peça uma semente de assinatura numa conversa se a chave importar: use a CLI.

# text
seg-512e5ee42c1e = NMEA de formação

# text
seg-c59a76aefff5 = <b>Apenas texto</b>, para formação e ensaio, <b>nunca</b> para os sistemas de navegação em funcionamento de uma embarcação. Devolva a semente e o registo do instrutor.

# text
seg-14781c19be62 = Mapa de interferência, exposição da rota

# text
seg-7135c6f44d49 = O modo como os códigos de exatidão são lidos e a geometria da grelha e da rota são <b>VALIDATED</b> face a bibliotecas independentes com entradas sintéticas; os limiares do método continuam <b>MODELLED</b>, e que uma célula degradada seja interferência <b>não</b> é verificado: uma célula degradada <b>não</b> identifica a interferência como causa. Uma célula não observada <b>não</b> é prova de uma rota limpa. Relatórios passados, <b>não uma previsão</b>. Apenas agregado: não tente recuperar identificadores. Os mapas ADS-B e AIS mantêm-se separados.

# text
seg-e47db9be47ea = Geometria do céu, linha de horizonte

# text
# c1: advisory
seg-839eb485b1d2 = Geometria <b>MODELLED</b> sob um modelo de erro declarado, apenas com linha de vista: sem difração, multipercurso nem receção sem linha de vista. As predefinições são <b>REPRESENTATIVE</b>, não levantamentos; leve a proveniência da predefinição. As constelações predefinidas são um céu representativo, não o céu de uma data. A elipse escala um UERE declarado: não é uma exatidão medida nem um limite de integridade. Mantenha o <c1/>.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Disponibilidade de ligações óticas (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, consultivo. Os climas de nuvens são entradas declaradas, não um conjunto de dados, e não foi comparado nenhum registo de disponibilidade medida: diga "sob estes pressupostos", nunca "a disponibilidade nesse local". Mantenha o <b>teto</b> do local (<c1/>: o que nenhuma margem eleva) junto da sua disponibilidade, e diga quais os ganhos de técnica que são entradas (o Kshana não modela uma malha de ótica adaptativa). Os cálculos são verificados face a um programa independente, o que verifica a implementação das fórmulas e não a atmosfera.

# text
# c1: holdover-test
seg-3324b2e2021e = Teste de holdover (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, consultivo. Diga "medido face à máscara", nunca que um relógio ou sistema satisfaz ou é aprovado face a uma Recomendação. Os dois instantes (GNSS removido, GNSS restaurado) são a <b>declaração do operador</b>: o Kshana não removeu nem restaurou nada e não os pode verificar, pelo que os cite como declarados. Uma máscara para a qual o registo é demasiado curto é <b>INCOMPLETE</b>, nunca um resultado positivo. Um registo de servo (linuxptp, chrony) é o erro sob controlo do servo, não uma medição independente face ao UTC; diga de que registo provêm os valores. Ver <c1/>.

# text
seg-18d3f2b50d0a = Qualquer resultado de cenário

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = O <c1/> ou <c2/> que declara, e a linha de proveniência.

# text
seg-166f773b2804 = Limites

# text
seg-203a91deb52c = Use dados sintéticos ou do próprio utilizador. Não nomeie pessoas, embarcações ou organizações nas saídas que não constassem da entrada do utilizador. O Kshana é uma ferramenta de análise e formação, não um produto de voo ou de navegação.

# text
seg-ec064f62f7dc = <s1>Anterior</s1>Servidor MCP: modo HTTP alojado pelo próprio utilizador

# text
seg-1f44dbd65ce3 = <s1>Seguinte</s1>Onde cada capacidade é acessível

# text
# c1: interference-map locate
seg-e3949a1e6082 = Região do emissor (<c1/>)

# text
# c1: unconstrained
seg-46b2efcb9bec = <b>MODELLED</b>: uma região viável sob linha de vista de rádio, não uma posição determinada. Indique a região no nível de confiança declarado, com o centroide e a respetiva elipse, nunca o centroide isolado; diga <c1/> quando os dados não a restringem; diga que ela depende do modelo (verificada apenas com dados sintéticos; a comparação com o Jammertest, fixada antecipadamente, foi executada uma vez e foi não avaliável para as duas fontes, portanto nada foi testado externamente). Formulação neutra: "região estimada do emissor"; nunca nomeie nem insinue quem ou o que está por trás de uma fonte, um Estado, uma força ou uma intenção. Apenas agregados; não tente recuperar identificadores. A publicação de regiões de emissores no observatório público está desativada.
