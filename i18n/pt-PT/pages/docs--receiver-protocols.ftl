# docs--receiver-protocols: translations (pt-PT)

# text
seg-99427ab75a03 = campo

# text
# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Fonte: <c1/>

# text
seg-4540630d4859 = Protocolos de recetor lidos pelo receiver-trust ({ "0.38" })

# text
seg-906a5f9e6cd9 = Apenas leitura, em todo o lado: nada aqui escreve um byte num recetor, e não existe qualquer via de transmissão. Software de caráter consultivo, não um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }): o operador continua a ser responsável.

# text
seg-a44353d98d6c = Os indicadores de spoofing e jamming do próprio recetor (UBX)

# text
seg-b58d3a8f292c = mensagem

# text
seg-24c57b65b8f7 = lido como

# text
seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

# text
# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = byte <c1/> no desvio { "7" }, bits { "4" }..3: <c2/>

# text
seg-54d4cf306b49 = { "0" } desconhecido ou desativado, { "1" } sem indicação de spoofing, { "2" } spoofing indicado, { "3" } várias indicações de spoofing (protocolo { "18" } e posterior; descrição da interface u-blox F9 HPG { "1.32" }, secção { "3.15.20" })

# text
seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versão { "1" }, { "12" } bytes

# text
# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> em { "4" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState); <c2/> em { "8" } (bit { "0" } spfDetEnabled, bits { "3" }..1 spoofingState)

# text
seg-3e117e319518 = os estados são lidos apenas quando o detetor está ativado; { "0" } desconhecido, { "1" } nenhum, { "2" } aviso ou indicado, { "3" } crítico ou confirmado

# text
seg-8a5a59761cd0 = UBX-SEC-SIG versão { "2" }

# text
# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> em { "1" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bits { "6" }..4 spoofingState); <c2/> em { "3" } e esse número de grupos de 4 bytes (não utilizados)

# text
seg-e0eb14018b2c = como acima

# text
# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>Fonte da estrutura do SEC-SIG.</b> As descrições de interface do u-blox F9 HPG { "1.32" } e M10 SPG { "5.10" } que puderam ser descarregadas quando isto foi escrito mencionam o UBX-SEC-SIG, mas não o definem. As estruturas acima são as das descrições de interface u-blox posteriores, tal como transcritas na biblioteca pyubx2 (BSD-3-Clause, <c1/> e <c2/>); os testes de ficheiros de teste em <c3/> são construídos a partir dessa estrutura, não a partir da saída de um recetor real. Estrutura obtida de uma transcrição aberta, não verificada face ao guia atual do fabricante: verifique-a face à descrição de interface u-blox atual antes de confiar no SEC-SIG.

# text
seg-6af7d45be34d = Um SEC-SIG não tem tempo da semana; pertence à época de navegação atual. Um estado já lido numa época é mantido, a menos que um posterior seja pior.

# text
# c1: receiver-self-report
seg-f1cf7ee27cb1 = A comparação <c1/>

# text
# c1: self_report
# c2: agreement
# c3: both
# c4: receiver-only
# c5: kshana-only
# c6: neither
# c7: calibrating
# c8: receiver_self_report
# c9: epochs[].self_report
seg-f30ddb83bf99 = Quando um registo contém estes indicadores, cada época do resultado tem <c1/> (os dois estados, se o recetor assinala, se algum monitor do Kshana deu alarme, e <c2/>: <c3/>, <c4/>, <c5/>, <c6/> ou <c7/>), e o resultado tem <c8/> com as contagens e a primeira época de cada uma. O recetor "assinala" num estado igual ou superior a { "2" }. <b>Não emite nenhum alarme nem altera nenhuma pontuação</b>, e nenhuma das partes é a verdade de referência: a concordância não é validação, e uma discordância indica que um detetor viu algo que o outro não viu, nada sobre qual tinha razão. A faixa do Studio lê <c9/>.

# text
# c1: format = "sbf"
seg-49ae6094c06a = Septentrio SBF (<c1/>)

# text
# c1: receiver_trust::ingest::read_sbf
# c2: sbf-tools
# c3: thiserror
# c4: deny.toml
# c5: band
# c6: L1CA
# c7: Info
# c8: rf_bands_reported
# c9: 2024-09-05T00:00:00.000 GPST
seg-4d6365d9ffd1 = <c1/> descodifica com a crate <c2/> ({ "0.4" }, <b>MIT</b>; a sua única dependência é <c3/>; uma licença permissiva que <c4/> permite). Blocos lidos: PVTGeodetic ({ "4007" }) para a solução de posição, MeasEpoch ({ "4027" }) para o C/N0 por satélite e sinal (<c5/> é o nome do sinal, como <c6/>), e RFStatus ({ "4092" }) para o número de bandas de RF cujo byte <c7/> é diferente de zero (<c8/>, transportado e <b>não interpretado</b>: nunca conta como indicador). As épocas são identificadas pelo tempo da semana e pelo número da semana e etiquetadas em tempo GPS (<c9/>). Um bloco que falhe o CRC ou a análise conta como registo ignorado. Este leitor não lê o AGC nem um indicador de jamming, pelo que os monitores de queda de C/N0 e de perda de bloqueio funcionam e os monitores de AGC e de indicador de jamming não.

# text
# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Fonte das estruturas.</b> O guia de referência da Septentrio não pôde ser descarregado quando isto foi escrito (o servidor recusou o pedido), pelo que as estruturas foram retiradas do código-fonte de <c1/>, que cita o guia, e os ficheiros de teste em <c2/> são blocos sintéticos construídos segundo essa estrutura e o seu CRC-16-CCITT. Não foi utilizado nenhum registo SBF real. Estrutura obtida da crate de código aberto, não verificada face ao guia atual do fabricante: verifique-a face ao guia de referência da Septentrio antes de confiar nela.

# text
# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Entrada direta por série e USB (<c1/>)

# text
# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Apenas em Unix. Abre o dispositivo para leitura, coloca a linha <b>local</b> em modo bruto a <c1/> (predefinição { "4800" }, a taxa NMEA { "0183" }) e lê linhas NMEA como qualquer outra fonte. Nunca escreve no recetor. <c2/> é recusado com uma explicação: o Kshana não configura recetores; configure o recetor para emitir NMEA com a ferramenta do próprio fabricante e depois leia-o. O fluxo é NMEA, como em todas as fontes <c3/> (UBX e SBF são lidos a partir de ficheiros). Um dispositivo que desapareça termina o comando como falha (saída { "1" }), para que um supervisor o reinicie; a camada não volta a ligar-se. Testado num ciclo de retorno por pseudoterminal (<c4/>), incluindo que o lado mestre não recebe nenhum byte do comando.

# text
seg-97e1ea47c2be = <s1>Anterior</s1>Entradas de máquina e de sensor

# text
seg-55ad3fc908be = <s1>Seguinte</s1>Observatório de interferência: método

# text
seg-17c3203ee615 = A comparação com o autorrelato do recetor

# text
seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

# text
seg-8444127e7ee6 = Entrada direta por série e USB (receiver-trust live --serial)
