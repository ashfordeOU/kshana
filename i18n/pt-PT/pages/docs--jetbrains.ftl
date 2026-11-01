# docs--jetbrains: translations (pt-PT)

# text
# c1: ide/jetbrains/README.md
seg-f8a0fe9968c4 = Fonte: <c1/>

# text
seg-c55e49fd2a72 = Kshana para IDEs JetBrains

# text
seg-d7280bb554bf = <a1><b>Kshana — simulador PNT</b> no JetBrains Marketplace</a1> — ou, em qualquer IDE JetBrains, <em>Settings → Plugins → Marketplace → pesquisar "Kshana"</em>.

# text
# c1: .toml
seg-959ab829762c = Um plugin nativo que executa o simulador de resiliência PNT <b>Kshana</b> a partir de dentro de qualquer IDE JetBrains (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Clique com o botão direito num cenário <c1/> → <b>Run Kshana Scenario</b>; as figuras de mérito e o JSON do resultado são enviados em fluxo para a janela de ferramentas <b>Kshana</b>.

# text
seg-594199d2ce06 = Complementa o <a1>servidor MCP</a1> (que dá ao <em>AI Assistant</em> da JetBrains acesso ao Kshana): este plugin é o caminho <em>humano</em>, de apontar e clicar.

# text
# c1: .toml
# c2: kshana <file>
seg-a356f2c30afb = Ação <b>Run Kshana Scenario</b> em qualquer <c1/> (menus de contexto do editor e da vista de projeto) — executa <c2/> e mostra a saída na janela de ferramentas Kshana.

# text
# c1: receiver-trust
# c2: .toml
# c3: kshana receiver-trust
seg-116d04ae5538 = <b>Assess Receiver Trust</b> num cenário <c1/> <c2/> (<c3/>): a cronologia de confiança, com uma pontuação de 0-100 e motivos para uma embarcação. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável pela navegação da embarcação.

# text
# c1: nmea-scenario
# c2: .toml
# c3: kshana nmea-scenario
seg-726d88d0dea7 = <b>Generate Training NMEA</b> num <c1/> <c2/> (<c3/>): NMEA de ponte sintético e um registo de instrutor, escritos junto do cenário. Apenas texto; para formação, nunca para os sistemas de navegação em funcionamento de uma embarcação.

# text
# c1: .csv
seg-99510426a384 = <b>Build Interference Map</b> num <c1/> ADS-B ou AIS (vista de projeto; pergunta de que conjunto de dados aceite se trata) e <b>Route Exposure</b> num ficheiro de rota (pede a pasta de mapas). Uma célula degradada não identifica a interferência como causa; não é uma previsão.

# text
# c1: .toml
# c2: kshana bench-export
seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> num cenário <c1/> (<c2/>): movimento do veículo, NMEA e eventos etiquetados para um simulador GNSS de laboratório, escritos junto do cenário. Não escreve nenhum sinal; utilize um simulador apenas com a devida autorização.

# text
# c1: .json
# c2: kshana compliance-report
# c3: kshana compliance-report --mapping
seg-79c553c303c5 = <b>Build Compliance Report</b> num resultado de execução <c1/> (<c2/>) e <b>Tools → Show Compliance Mapping</b> (<c3/>): o mapeamento do quadro público, apresentado com a própria declaração do motor palavra por palavra.

# text
# c1: kshana evidence verify
# c2: .pub
seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> numa pasta de pacote de evidências (vista de projeto; <c1/>): pede a chave pública do signatário ({ "64" } dígitos hexadecimais ou um ficheiro <c2/>; sempre fixada, o plugin nunca aceita um signatário não fixado) e, opcionalmente, o registo completo da sessão. Apenas um resultado verificado surge como verificado; um pacote intacto com um signatário não fixado surge como "NOT VERIFIED".

# text
# c1: receiver-trust
# c2: .json
# c3: kshana trust-telemetry --result
seg-253d5b7f94ce = <b>Render Trust Telemetry</b> num resultado <c1/> <c2/> (<c3/>): texto Prometheus, eventos syslog CEF/LEEF ou linhas MQTT do Home Assistant impressos na janela do Kshana. Nada é enviado nem servido; os exportadores em execução permanecem na linha de comandos.

# text
# c1: .csv
# c2: kshana imu-fit
# c3: hybrid
# c4: fusion
# c5: [accel_classical]
seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> num <c1/> de IMU estacionária (<c2/>): os parâmetros do acelerómetro e do giroscópio dos cenários <c3/> e <c4/> ajustados por desvio de Allan, impressos na janela do Kshana como uma tabela <c5/>. Nada é escrito; o ajuste é MODELLED.

# text
# c1: kshana --validate
# c2: kshana kinds
# c3: .toml
# c4: kshana receiver-trust live --file
seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menu Tools; <c2/>) e <b>Assess Receiver Stream</b> (uma sessão de embarcação <c3/> mais um registo NMEA guardado à sua escolha; <c4/>, pontuado uma vez, sem socket e sem gate).

# text
# c1: kshana example
# c2: .toml
# c3: .toml
# c4: .geojson
seg-38037d36639c = <b>Insert Example Scenario</b> (pasta da vista de projeto ou menu Tools; <c1/>): escolha um cenário incluído e é escrito como um novo <c2/> (nunca sobre um ficheiro). <b>Export Scenario</b> num <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; apenas saída simulada), <b>Animate Scenario</b> (HTML ou SVG, aberto no navegador) e <b>Import Route</b> numa rota <c4/> (pergunta a que cenário).

# text
# c1: .toml
# c2: kshana receiver-trust evidence
# c3: kshana evidence keygen
# c4: kshana evidence attach-timestamp
# c5: openssl ts -verify
seg-1f1b18f8e102 = <b>Create Evidence Pack</b> numa sessão receiver-trust <c1/> (<c2/>): pede a janela, um ficheiro de chave de assinatura que já tenha e a pasta de saída. O plugin nunca cria, lê nem guarda uma chave (<c3/> permanece na linha de comandos). <b>Attach Timestamp</b> numa pasta de pacote (<c4/>): o Kshana não verifica a assinatura da autoridade de marcação temporal; execute <c5/> por si.

# text
# c1: evidence keygen
# c2: receiver-trust live
seg-f4f6605d3db9 = Continuam apenas na linha de comandos: os comandos IQ, <c1/> e <c2/>.

# text
seg-63efd04104f1 = Uma janela de ferramentas <b>Kshana</b> na parte inferior que aloja a consola de execução.

# text
# c1: kshana receiver-trust live
# c2: kshana trust-telemetry
# c3: docs/MARITIME-TRUST.md
seg-decda07aa7eb = Não está no plugin: <c1/> (um processo de fluxo de longa duração com um gate e um recetor TCP opcional) e <c2/> permanecem na linha de comandos, porque uma ação do IDE executa um comando até ao fim e mostra a sua saída; ver <c3/>.

# text
# c1: kshana
# c2: PATH
# c3: cargo install kshana
seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> para apontar para o binário <c1/> (em branco → resolvido a partir de <c2/>; instale com <c3/>).

# text
seg-44dfdd65bd0a = O plugin é puramente de plataforma (sem dependências específicas de linguagem), pelo que carrega em todos os IDE JetBrains na compilação { "243" } ({ "2024.3" }) e posteriores.

# text
seg-453bd42c23fa = Compilar e executar

# text
seg-b5328f8c7a8a = Requer JDK { "17" }+ (a compilação fixa o JDK { "21" }) e o wrapper Gradle incluído.

# text
# c1: verifyPlugin
# c2: TYPE:VERSION
seg-758124ceb1c7 = <c1/> verifica por predefinição o since-build, { "2024.3" }. Para verificar outras linhas, enumere-as como <c2/> (cada IDE é uma descarga de cerca de { "1" } GB):

# text
# c1: KshanaChooser
# c2: Messages.showChooseDialog
seg-15d175aaeb59 = O plugin não usa nenhuma API de plataforma obsoleta ou prevista para remoção em nenhuma dessas versões; é para manter assim (uma caixa de diálogo de escolha passa por <c1/>, não por <c2/>).

# text
seg-39cfd740d9b3 = Instale o zip compilado através de <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

# text
seg-87aff08f344c = Estrutura

# text
seg-73b3f55b7208 = Isolamento

# text
# c1: mcp/
# c2: xval/
# c3: kshana
# c4: /ide
# c5: exclude
seg-a14db8de576a = Tal como <c1/> e <c2/>, este é um projeto Gradle autónomo, excluído do crate <c3/> publicado (<c4/> no <c5/> do pacote); o seu resultado de compilação é ignorado pelo git.

# text
# c1: LICENSING.md
seg-b38914a430b9 = Licença: AGPL-3.0-only (ou uma licença comercial da Ashforde OÜ — ver <c1/> do repositório).

# text
seg-bb286e3ce9c9 = <s1>Anterior</s1>Onde cada capacidade está acessível

# text
seg-e62586b5f58c = <s1>Seguinte</s1>Onde o Kshana funciona
