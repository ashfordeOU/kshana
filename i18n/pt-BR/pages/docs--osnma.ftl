# docs--osnma: translations (pt-BR)

# text
seg-fcd0ebea49bc = Linha de comando

# attr:aria-label, text
seg-6816f4e1a0a0 = Versão

# text
seg-94058315dfe4 = Entrada

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Fonte: <c1/>

# text
seg-1e9c104231db = Verificador OSNMA do Galileo no lado do receptor

# text
seg-17fd702f5997 = Um verificador, no lado do receptor, da Autenticação de Mensagem de Navegação do Serviço Aberto do Galileo (OSNMA), em Rust puro. Ele lê páginas I/NAV e informa, por satélite e por época, se os dados de navegação estão autenticados criptograficamente e por que uma verificação falhou.

# text
seg-ae081f55c4f1 = <b>Consultivo.</b> Esta é uma saída de análise e monitoramento, e não um equipamento de navegação homologado. O estado de autenticação informado aqui não é um serviço de integridade de navegação e não deve ser a única base de nenhuma decisão de navegação ou de segurança.

# text
seg-84d7260098b1 = AVISO: propriedade intelectual na interface OSNMA do Galileo

# text
seg-6d78ccef53d5 = O Kshana não concede nenhum direito sob a propriedade intelectual da União Europeia no Documento de Controle de Interface do Signal-in-Space do OSNMA do Galileo (os "ICD IPRs"). O ICD traz sua própria autorização (seu Anexo E), que é não exclusiva e isenta de royalties e tem seus próprios termos, alcance e limites. Quem usa, constrói ou distribui software baseado neste módulo apoia-se diretamente nessa autorização e deve ler e aceitar seus termos por conta própria. A licença do Kshana (AGPL-3.0-only, ou a licença comercial) cobre apenas o código do próprio Kshana.

# text
seg-c13ad334bf9a = Este módulo implementa os algoritmos que os documentos abaixo descrevem. O texto do ICD não é reproduzido; valores numéricos (layouts de campos, enumerações, a tabela de consulta de MAC) são reexpressos na notação própria do Kshana, com a fonte citada no código. O ICD e as Receiver Guidelines são © União Europeia; a fonte é reconhecida aqui. O Kshana não é desenvolvido, usado, aprovado nem endossado pela União Europeia, pela Comissão Europeia, pela EUSPA nem por qualquer outro órgão.

# text
seg-860096b04999 = Documentos de referência

# text
seg-04c1e1a6278d = Publicados pelo European GNSS Service Centre.

# text
seg-278dd0f9df58 = Documento

# text
seg-3427e40d7bee = Data

# text
seg-54d15cb428d3 = ICD do Signal-in-Space do OSNMA do Galileo ("SIS ICD")

# text
seg-f63fbc1175cf = Edição { "1.1" }

# text
seg-fa85e4db2c93 = outubro de { "2023" }

# text
seg-b89aa2b88558 = Receiver Guidelines do OSNMA do Galileo

# text
seg-907e4e46056c = Edição { "1.3" }

# text
seg-a9b75bc7f063 = janeiro de { "2024" }

# text
seg-530ae6421157 = Os números de seções e tabelas citados no código e aqui referem-se a essas versões.

# text
seg-143726cc3d5f = O que é verificado

# text
seg-029a9bb7608f = A cadeia de confiança, da raiz até os dados:

# text
seg-886f1b6556ce = <b>Chave pública (ICD { "3.2.2" }, { "6.2" }).</b> Um DSM-PKR é remontado a partir de seus blocos e seu caminho de Merkle é percorrido até uma raiz de Merkle confiável (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Um DSM-KROOT é remontado; sua assinatura ECDSA (P-256/SHA-256 ou P-521/SHA-512) é verificada contra a chave pública que ele nomeia, sobre o cabeçalho NMA e os parâmetros da cadeia.

# text
seg-acc1f06cf63a = <b>Chaves TESLA (ICD { "5.5" }, { "6.4" }).</b> Cada chave em uma mensagem MACK é percorrida de volta até a KROOT ou até uma chave verificada anterior, com a função de hash da cadeia.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Os campos flexíveis de Tag-Info são verificados contra o MACSEQ com a chave que abre aquele MACK.

# text
seg-41ba810d7c8d = <b>Tags (ICD { "4.2" }, { "6.7" }).</b> Cada tag é recalculada (HMAC-SHA-256 ou CMAC-AES, truncada ao comprimento de tag da cadeia) sobre as identidades dos satélites, o tempo do subquadro, a posição da tag, o estado NMA e os dados de navegação que ela cobre, e comparada. ADKD { "0" } (efemérides, relógio e estado), ADKD { "4" } (parâmetros de temporização) e ADKD { "12" } (MAC lento, chave publicada dez subquadros depois) são tratados, com autenticação cruzada de satélites que não transportam OSNMA por si mesmos, e tags fictícias (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Uma tag que nomeia um valor reservado, ou cujo ADKD não corresponde ao slot da tabela de consulta de MAC, é posta de lado (as Receiver Guidelines dizem para descartá-la) e informada como <c1/>, não como falha.

# text
# c1: bad_crc
seg-eb993b3a0d17 = As páginas são verificadas contra seu CRC (o CRC-24Q do Galileo) antes de qualquer outra coisa; uma página que falha é descartada e informada (<c1/>).

# text
seg-c414a30d0840 = Valores de estado

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Por tag: <c1/>, <c2/> com um motivo (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> com um motivo (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) ou <c15/>. Uma tag fictícia (COP { "0" }) aparece como <c16/> no nível da tag, já que comprova a chave, mas não cobre nenhum dado de navegação e nunca conta para um satélite.

# text
seg-331a6ab821f3 = Por satélite, na forma que o monitor receiver-trust consome:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> somente enquanto os dados mais recentes de efemérides e relógio verificados (ADKD { "0" } ou

# text
# c1: Unavailable
seg-38e7f56293e7 = daquele satélite forem recentes (dentro de { "600" } s do tempo do verificador por padrão) e ainda forem os dados em uso. A verificação é sobre os dados, não sobre o IODnav: o verificador guarda o SHA-256 da cadeia de bits autenticada (Word Types { "1" } a { "5" }, na medida em que o ADKD { "0" } os cobre) e o da cadeia mais recente desse tipo que o satélite envia, e eles devem ser iguais. Um IODnav copiado sobre outras palavras, ou bits alterados do Word Type { "5" } (que não carregam IODnav), aparece como <c1/> até que os novos dados sejam autenticados. Um subquadro que traz palavras de efemérides mas não um conjunto completo de Word Types { "1" } a { "5" } sob um único IODnav retira o estado da mesma forma (todo subquadro E1-B genuíno traz todos os cinco); um sem nenhuma palavra de efemérides nada diz. Tags de outro satélite (autenticação cruzada) contam para o satélite cujos dados elas cobrem.

# text
# c1: Failed
seg-233109ef4428 = <c1/> quando uma verificação sobre os dados do satélite falhou dentro da memória de falhas ({ "600" } s por padrão do tempo do verificador), mesmo que dados posteriores sejam verificados. Uma divergência é atribuída ao satélite cujos dados a tag cobre e ao satélite que transmitiu a tag, já que qualquer um dos dois poderia estar errado; uma divergência de MACSEQ é atribuída ao satélite transmissor.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> nos demais casos, e para todo satélite após uma mensagem de alerta verificada, com estado NMA "don't use" ou um estado reservado, e até que a primeira chave tenha sido verificada.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = O valor geral é <c1/> se algum satélite falhou, <c2/> se pelo menos um está autenticado e nenhum falhou, e <c3/> nos demais casos. <c4/> é a sentença correspondente; <c5/> a constrói.

# text
seg-446a3218ccbb = Tempo

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = A cadeia de chaves mostra que uma chave pertence a um dado subquadro, não que o subquadro é o atual. O verificador, portanto, nunca toma o "agora" de uma página não autenticada. Seu tempo é o mais tardio entre o tempo de referência dado com <c1/> (<c2/>) e o subquadro da última chave TESLA verificada (uma chave não pode ser conhecida antes de seu slot, de modo que ela prova que o tempo não é anterior). A memória de falhas, a janela de validade de uma autenticação e a remoção de dados antigos funcionam com esse tempo. Um subquadro carimbado com mais de três subquadros além da última chave verificada é posto de lado, a menos que sua própria chave comprove seu tempo; mensagens de chave e de alerta nele ainda são processadas, já que trazem sua própria prova (uma assinatura ou a raiz de Merkle).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = O relógio fica parado quando o OSNMA cessa, já que somente as chaves o movem. Um chamador em tempo real deve chamar <c1/> com o tempo do host a cada subquadro; a autenticação então expira por si só, e <c2/> (também executado a cada subquadro) devolve um evento <c3/> quando nenhuma chave é verificada por mais tempo que a janela de autenticação.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = O que isto não oferece é atualidade. Sem um tempo de referência de uma fonte que um atacante não possa mover, uma repetição de dados autênticos antigos sob carimbos antigos é autenticada e os carimbos de página valem tanto quanto sua fonte: a CLI informa isso (<c1/>) sempre que nenhum tempo de referência é dado. Com um tempo de referência, a tolerância é inferior a um subquadro (padrão { "29" } s; valores maiores são recusados). Um tempo de referência é um único instante: subquadros mais distantes dele que a tolerância são postos de lado e contados, de modo que ele serve para dados ao vivo ou recém-gravados, não para uma gravação longa. Para uma gravação, omita o tempo de referência e leia o resultado como "autêntico, não necessariamente atual". As Receiver Guidelines dão o requisito formal.

# text
seg-aa37ce329914 = Os carimbos de página de um fluxo u-blox vêm dos próprios dados não autenticados (veja Entrada), de modo que também não oferecem proteção de atualidade.

# text
seg-a33d72076025 = Cadeias, chaves e alertas

# text
# c1: chain_mismatch
seg-be2d9588df65 = As cadeias verificadas são mantidas por id de cadeia (CID); as tags são verificadas com a cadeia que o cabeçalho NMA nomeia, e um cabeçalho que nomeia uma cadeia que não foi verificada deixa as tags do subquadro sem verificação (<c1/>). Uma segunda KROOT de uma cadeia em vigor acrescenta uma âncora; uma KROOT de outra cadeia é mantida ao lado, de modo que anunciar de novo a cadeia antiga após uma renovação não desfaz a nova.

# text
# c1: stale
seg-bbb6574fa258 = O cabeçalho NMA não é autenticado, de modo que o que ele anuncia só conta quando confirmado: quando mais de um satélite envia o mesmo cabeçalho em um subquadro, ou quando a mensagem assinada de uma KROOT verificada o carrega (o cabeçalho faz parte dessa mensagem). Os dois não são equivalentes. A concordância de mais de um satélite protege contra uma anomalia de um único satélite, não contra um spoofer: um spoofer pode forjar dois ids de satélite. O que isso lhe dá é negação de serviço, e nada mais, já que um "don't use" confirmado limpa os dados autenticados de todos os satélites: suspendê-lo, forjado ou genuíno, não restaura nada até que novas tags sejam verificadas sob subquadros operacionais genuínos. (Antes dessa limpeza, uma suspensão forjada podia trazer de volta, por até a janela de autenticação, dados que já haviam sido autenticados.) A confirmação real é o cabeçalho assinado pela KROOT, que também suspende de novo um "don't use" quando traz um estado operacional. O cabeçalho de um único satélite não altera nada além da verificação de tags do seu próprio subquadro. Uma KROOT cujo tempo de aplicabilidade não é posterior ao da cadeia mantida para o mesmo id (uma repetição de uma mais antiga) é recusada (<c1/>); uma KROOT da mesma cadeia acrescenta uma âncora.

# text
seg-5c08dbaa8d43 = O estado do cabeçalho confirmado e o valor de CPKS conduzem a revogação. Com estado NMA "don't use", CPKS "chain revoked" descarta a cadeia que o cabeçalho nomeia e recusa sua KROOT daí em diante; CPKS "public key revoked" descarta a chave pública que assinou aquela cadeia, e toda cadeia assinada com ela. Se a cadeia substituta daquele id foi adotada antes de o cabeçalho ser confirmado, não importa quanto antes, a chave revogada é a da cadeia anterior, não a da nova; essa memória é mantida até que a revogação seja executada ou o cabeçalho de outro procedimento seja confirmado, e um cabeçalho de revogação repetido a cada subquadro é executado uma só vez. Os mesmos valores de CPKS com estado operacional marcam a transição para a substituta e não revogam nada. O cabeçalho não é autenticado em si, de modo que uma revogação forjada só pode retirar a autenticação, e é definitiva até que o verificador seja reiniciado. Essa definitividade cobre também a chave em uso: uma revogação forjada de chave pública zera a memória da chave substituída e revoga a chave em uso, e somente uma reinicialização a desfaz.

# text
# c1: Unavailable
seg-e7d43eb18c24 = Um DSM-PKR com NPKT { "4" } é a mensagem de alerta; ele é verificado pela árvore de Merkle como uma chave, e seu campo NPK aleatório faz parte da folha. Um alerta verificado limpa todas as cadeias e chaves públicas, recusa toda KROOT e chave pública posteriores e torna todo satélite <c1/>, como as Receiver Guidelines determinam, até que o verificador seja reiniciado.

# text
seg-4068e9bda7c1 = O campo de preenchimento de um DSM-KROOT é um hash da mensagem assinada e da assinatura. Ele é verificado antes da assinatura e também diz com qual cabeçalho NMA a mensagem assinada foi construída quando o cabeçalho mudou enquanto a mensagem era montada.

# text
seg-8ea31bf25ef0 = O que não é verificado, ou não é exercitado

# text
seg-3d0808cab632 = <b>Atualidade.</b> Veja Tempo acima: ela exige um tempo de referência vindo de fora.

# text
seg-b3d63950baa4 = <b>Renovação e revogação.</b> As cadeias e chaves são acompanhadas como os fluxos dos vetores publicados as exercitam (renovação, fim de cadeia, revogação de cadeia e de chave, nova chave pública, nova árvore de Merkle, alerta), não todo caso que o ICD permite. Uma revogação anunciada pelo cabeçalho não autenticado é aceita pelo que diz e é definitiva para a sessão. Uma nova árvore de Merkle só é reconhecida por meio da raiz de Merkle fornecida ao verificador.

# text
seg-f01d90a44585 = <b>Hash da árvore de Merkle.</b> As mensagens DSM-PKR são verificadas com uma árvore SHA-256. Uma árvore SHA3-256, que o ICD permite no futuro, não é suportada. A função de hash da cadeia pode ser SHA-256 ou SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Listas de estado de chaves.</b> A revogação é acompanhada pelo cabeçalho NMA e pelas mensagens do fluxo; listas de revogação de certificados não são lidas.

# text
seg-73e0b16d03c7 = <b>Cobertura de dados autenticados.</b> O ADKD { "4" } com COP { "1" } enviado em um subquadro ímpar não pode autenticar (o Word Type { "10" } pode ser enviado um ou dois subquadros antes); isso custa apenas disponibilidade, nunca correção.

# text
seg-acc28dcced83 = <b>Operação em tempo constante.</b> Não fornecida e não necessária: o verificador não guarda segredos (apenas chaves públicas, chaves de cadeia publicadas e dados recebidos).

# text
seg-b2f8ec90ae39 = <b>Qualidade do sinal e dos dados.</b> As páginas são verificadas por CRC e as páginas de alerta descartadas, mas nada se sabe do sinal em que chegaram. A recuperação Reed-Solomon das palavras I/NAV { "1" } a { "4" } não é usada: os dados devem ser recebidos diretamente.

# text
seg-97313ba2bf88 = <b>Não é um serviço de integridade de posição.</b> A autenticação diz que os dados vieram do sistema. Ela nada diz sobre o sinal em que chegaram nem sobre a qualidade da solução de posição.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Formato de página simples.</b> Um par de páginas por linha: <c1/>, comentários <c2/> permitidos. <c3/> é o GST em segundos (<c4/>) no início da página; o hexadecimal são os { "240" } bits das metades par e ímpar (caudas incluídas), bit mais significativo primeiro.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>CSV de vetores de teste.</b> O layout dos vetores publicados (<c1/>). O tempo inicial vem de <c2/> ou de um nome de arquivo datado.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Um fluxo de bytes UBX bruto (<c1/>, detectado automaticamente). As mensagens I/NAV E1-B do Galileo são reconstruídas em pares de páginas (<c2/>); outros sistemas, E5b, páginas de alerta e quadros com checksum inválido são ignorados. O SFRBX não traz tempo, de modo que cada página é carimbada com o tempo contido em seus próprios dados (word types { "5" } e { "0" }) e aceita somente se páginas consecutivas que trazem tempo concordarem com o número de páginas recebidas entre elas; páginas que não podem ser posicionadas são descartadas, nunca adivinhadas. Esse tempo vem dos próprios dados e não oferece proteção de atualidade (veja Tempo acima). O id de sinal { "0" } (E1-C) não traz dados, de modo que aceitá-lo junto com o E1-B é inofensivo. Um par de sincronização perdido com um comprimento absurdo não trava o leitor. O código de enquadramento é uma terceira cópia do enquadramento UBX na árvore (<c3/>, a ingestão do receiver-trust); é mantido separado para que o comportamento do receiver-trust não mude, e os três poderiam compartilhar um único leitor depois. O layout de palavras de uma mensagem SFRBX é tirado de descrições públicas e verificado apenas em quadros sintéticos, não em um receptor ao vivo.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = A saída em texto dá o estado por satélite e, com <c1/>, por tag e época; <c2/> dá o mesmo com a lista de tags. O status de saída { "3" } significa que uma verificação sobre os dados de algum satélite falhou, { "2" } significa um erro de uso ou de entrada. O aviso consultivo acima é impresso primeiro em todos os caminhos, erros e uso incluídos.

# text
seg-e2af23b756f5 = A partir de Python e WebAssembly

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) e <c2/> (WebAssembly) executam o mesmo verificador sobre bytes em memória e devolvem o JSON que <c3/> imprime, aviso consultivo incluído. O servidor MCP não o oferece: a entrada é um longo fluxo bruto de receptor mais bem atendido pela linha de comando e pelo Python, e uma ferramenta de agente acrescentaria uma grande superfície de entrada sem benefício. O mesmo aviso consultivo e os mesmos limites se aplicam; o estado não é um serviço de integridade de navegação.

# text
seg-0987c3b00a14 = Testes e dados de teste

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Os dados de teste são sintéticos e gerados pelo próprio código e pelos testes do Kshana. Nenhum vetor do ICD ou das Guidelines, exemplo resolvido ou material de chave é armazenado neste repositório. Os testes padrão (<c1/> e os testes unitários) constroem uma cadeia, páginas e tags a partir das equações e verificam a consistência e que a corrupção deliberada é detectada: um bit de navegação invertido, um bit de chave invertido, tags repetidas, carimbos de tempo errados, um tempo fora da referência, dados ausentes e os ataques que a revisão encontrou (um subquadro de futuro distante falsificado que não deve apagar uma falha, uma autenticação que deve expirar e acompanhar o IODnav, um alerta, estado NMA "don't use", tags fictícias, divergência de MACSEQ, chaves conflitantes, revogação e renovação de cadeia, um preenchimento ou uma assinatura inválidos), com CMAC-AES, uma cadeia SHA3-256 e uma assinatura P-521 levadas pelo verificador. Como esses dados vêm de nossa própria leitura do ICD, eles mostram autoconsistência, não aderência à norma.

# text
seg-4906b14a33a3 = As primitivas são verificadas contra testes de resposta conhecida publicados, nenhum tirado do ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) e RFC { "6979" } (ECDSA P-256). As assinaturas P-521 são verificadas quanto à codificação e à seleção de hash com uma chave descartável criada no teste; a aritmética da curva é a da biblioteca.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = A aderência à norma é verificada por <c1/>, que é opcional: ele lê uma cópia do arquivo oficial de vetores de teste que você mesmo baixa, do diretório nomeado por <c2/>, e não faz nada quando a variável não está definida. Não armazena nem redistribui nada, e as execuções de teste padrão não usam rede. Ele dá ao verificador apenas uma raiz de Merkle e as chaves públicas de uma árvore, como um receptor teria, de modo que as cadeias são estabelecidas a partir do DSM-KROOT assinado no fluxo e todo o caminho é executado: Merkle, assinatura, cadeia de chaves, MACSEQ e tags. Ele afirma, por conjunto de vetores, um piso de tags autenticadas, nenhuma com falha, quais cadeias e chaves o fluxo anuncia, tags autenticadas de ADKD { "0" }, { "4" } e { "12" }, que a autenticação é retomada após fim de cadeia, revogação de cadeia, revogação de chave e nova chave pública, que a mensagem de alerta é verificada e não deixa nada autenticado, e que todo vetor usa somente HMAC-SHA-256, uma cadeia SHA-256, chaves de 128 bits, tags de 40 bits e entradas de consulta { "33" } e { "34" }. Outras escolhas de algoritmo e de parâmetros do ICD são, portanto, cobertas apenas pelos testes de resposta conhecida e sintéticos acima.

# text
seg-70bb026ce655 = Dependências

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = Crates RustCrypto, Rust puro, MIT OR Apache-2.0, construídos sem funcionalidades padrão: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> e <c6/> (a funcionalidade <c7/>, usada apenas para verificação), ao lado de <c8/>, já presente na árvore. Elas compilam para <c9/> e passam em <c10/>.

# text
seg-7ab62b91d469 = <s1>Anterior</s1>Confiança como telemetria de segurança

# text
seg-5dc48294fbb2 = <s1>Próximo</s1>Sinal direto aumentado do LunaNet
