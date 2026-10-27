# docs--osnma: translations (pt-PT)

# text
seg-fcd0ebea49bc = Linha de comandos

# attr:aria-label, text
seg-6816f4e1a0a0 = Versão

# text
seg-94058315dfe4 = Entrada

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Fonte: <c1/>

# text
seg-1e9c104231db = Verificador de OSNMA do Galileo do lado do recetor

# text
seg-17fd702f5997 = Um verificador do lado do recetor para a Autenticação de Mensagens de Navegação do Serviço Aberto (OSNMA) do Galileo, em Rust puro. Lê páginas I/NAV e indica, por satélite e por época, se os dados de navegação estão autenticados criptograficamente, e porque falhou uma verificação.

# text
seg-ae081f55c4f1 = <b>Consultivo.</b> Isto é uma saída de análise e de monitorização e não um equipamento de navegação homologado. O estado de autenticação aqui indicado não é um serviço de integridade da navegação e não deve ser a única base de qualquer decisão de navegação ou de segurança.

# text
seg-84d7260098b1 = AVISO: propriedade intelectual na interface OSNMA do Galileo

# text
seg-6d78ccef53d5 = O Kshana não concede quaisquer direitos ao abrigo da propriedade intelectual da União Europeia no Documento de Controlo de Interface do Sinal no Espaço (ICD) da OSNMA do Galileo (os "ICD IPRs"). O ICD tem a sua própria autorização (o seu Anexo E), que é não exclusiva e isenta de royalties e tem os seus próprios termos, âmbito e limites. Quem utilizar, construir ou distribuir software baseado neste módulo apoia-se diretamente nessa autorização e tem de ler e aceitar os seus termos por si próprio. A licença do Kshana (AGPL-3.0-only, ou a licença comercial) abrange apenas o código do próprio Kshana.

# text
seg-c13ad334bf9a = Este módulo implementa os algoritmos que os documentos abaixo descrevem. O texto do ICD não é reproduzido; os valores numéricos (disposições de campos, enumerações, a tabela de consulta de MAC) são reexpressos na notação própria do Kshana, com a fonte citada no código. O ICD e as Receiver Guidelines são © União Europeia; a fonte é aqui reconhecida. O Kshana não é desenvolvido, utilizado, aprovado nem apoiado pela União Europeia, pela Comissão Europeia, pela EUSPA ou por qualquer outro organismo.

# text
seg-860096b04999 = Documentos de referência

# text
seg-04c1e1a6278d = Publicados pelo Centro de Serviços GNSS Europeu.

# text
seg-278dd0f9df58 = Documento

# text
seg-3427e40d7bee = Data

# text
seg-54d15cb428d3 = ICD do Sinal no Espaço da OSNMA do Galileo ("SIS ICD")

# text
seg-f63fbc1175cf = Edição { "1.1" }

# text
seg-fa85e4db2c93 = outubro de { "2023" }

# text
seg-b89aa2b88558 = Orientações para Recetores da OSNMA do Galileo

# text
seg-907e4e46056c = Edição { "1.3" }

# text
seg-a9b75bc7f063 = janeiro de { "2024" }

# text
seg-530ae6421157 = Os números de secção e de tabela citados no código e aqui referem-se a essas versões.

# text
seg-143726cc3d5f = O que é verificado

# text
seg-029a9bb7608f = A cadeia de confiança, da raiz até aos dados:

# text
seg-886f1b6556ce = <b>Chave pública (ICD { "3.2.2" }, { "6.2" }).</b> Uma DSM-PKR é reassemblada a partir dos seus blocos e o seu caminho de Merkle é percorrido até uma raiz de Merkle de confiança (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Uma DSM-KROOT é reassemblada; a sua assinatura ECDSA (P-256/SHA-256 ou P-521/SHA-512) é verificada face à chave pública que nomeia, sobre o cabeçalho NMA e os parâmetros da cadeia.

# text
seg-acc1f06cf63a = <b>Chaves TESLA (ICD { "5.5" }, { "6.4" }).</b> Cada chave numa mensagem MACK é percorrida de volta até à KROOT ou a uma chave verificada anterior, com a função de hash da cadeia.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Os campos flexíveis de Tag-Info são verificados face ao MACSEQ com a chave que abre esse MACK.

# text
seg-41ba810d7c8d = <b>Etiquetas (ICD { "4.2" }, { "6.7" }).</b> Cada etiqueta é recalculada (HMAC-SHA-256 ou CMAC-AES, truncada ao comprimento de etiqueta da cadeia) sobre as identidades dos satélites, a hora da subtrama, a posição da etiqueta, o estado NMA e os dados de navegação que abrange, e comparada. São tratados o ADKD { "0" } (efemérides, relógio e estado), o ADKD { "4" } (parâmetros de temporização) e o ADKD { "12" } (MAC lento, chave publicada dez subtramas depois), com autenticação cruzada de satélites que não transportam eles próprios OSNMA, e etiquetas fictícias (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Uma etiqueta que nomeie um valor reservado, ou cujo ADKD não corresponda à posição da tabela de consulta de MAC, é posta de parte (as Receiver Guidelines dizem para a descartar) e comunicada como <c1/>, não como uma falha.

# text
# c1: bad_crc
seg-eb993b3a0d17 = As páginas são verificadas face ao seu CRC (o CRC-24Q do Galileo) antes de mais nada; uma página que falhe é descartada e comunicada (<c1/>).

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
seg-268f61b565b9 = Por etiqueta: <c1/>, <c2/> com um motivo (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> com um motivo (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), ou <c15/>. Uma etiqueta fictícia (COP { "0" }) surge como <c16/> ao nível da etiqueta, uma vez que prova a chave, mas não abrange dados de navegação e nunca conta para um satélite.

# text
seg-331a6ab821f3 = Por satélite, na forma que o monitor de confiança do recetor consome:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> apenas enquanto os dados de efemérides e de relógio verificados mais recentes (ADKD { "0" } ou

# text
# c1: Unavailable
seg-38e7f56293e7 = desse satélite forem recentes (dentro de { "600" } s da hora do verificador, por predefinição) e continuarem a ser os dados em uso. A verificação incide sobre os dados, não sobre o IODnav: o verificador guarda o SHA-256 da cadeia de bits autenticada (Word Types { "1" } a { "5" }, tal como o ADKD { "0" } os abrange) e da mais recente dessas cadeias que o satélite envia, e têm de ser iguais. Um IODnav copiado sobre outras palavras, ou bits alterados do Word Type { "5" } (que não transportam IODnav), dá <c1/> até os novos dados serem autenticados. Uma subtrama que transporte palavras de efemérides mas não um conjunto completo de Word Types { "1" } a { "5" } sob um só IODnav retira o estado da mesma forma (toda a subtrama E1-B genuína transporta os cinco); uma sem quaisquer palavras de efemérides não diz nada. As etiquetas de outro satélite (autenticação cruzada) contam para o satélite cujos dados abrangem.

# text
# c1: Failed
seg-233109ef4428 = <c1/> quando uma verificação dos dados do satélite falhou dentro da memória de falhas ({ "600" } s, por predefinição, da hora do verificador), mesmo que dados posteriores sejam verificados. Uma divergência é imputada ao satélite cujos dados a etiqueta abrange e ao satélite que transmitiu a etiqueta, uma vez que qualquer um poderia estar em falta; uma divergência de MACSEQ é imputada ao satélite transmissor.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> nos restantes casos, e para todos os satélites após uma mensagem de alerta verificada, com o estado NMA "don't use" ou um estado reservado, e até a primeira chave ser verificada.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = O valor global é <c1/> se algum satélite falhou, <c2/> se pelo menos um está autenticado e nenhum falhou, e <c3/> nos restantes casos. <c4/> é a frase correspondente; <c5/> constrói-a.

# text
seg-446a3218ccbb = Hora

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = A cadeia de chaves mostra que uma chave pertence a uma dada subtrama, não que a subtrama seja a atual. O verificador nunca toma, por isso, o "agora" de uma página não verificada. A sua hora é a mais tardia entre a hora de referência dada com <c1/> (<c2/>) e a subtrama da última chave TESLA que foi verificada (uma chave não pode ser conhecida antes do seu intervalo, pelo que prova que a hora não é anterior). A memória de falhas, a janela de validade de uma autenticação e a remoção de dados antigos funcionam com essa hora. Uma subtrama marcada com mais de três subtramas para além da última chave verificada é posta de parte, a menos que a sua própria chave prove a sua hora; as mensagens de chave e de alerta nela contidas continuam a ser processadas, uma vez que transportam a sua própria prova (uma assinatura ou a raiz de Merkle).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = O relógio fica parado quando a OSNMA para, uma vez que só as chaves o fazem avançar. Um chamador em tempo real tem de chamar <c1/> com a hora do anfitrião a cada subtrama; a autenticação expira então por si própria, e <c2/> (também executado a cada subtrama) devolve um evento <c3/> quando nenhuma chave é verificada há mais do que a janela de autenticação.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = O que isto não dá é atualidade. Sem uma hora de referência de uma fonte que um atacante não possa mover, uma repetição de dados antigos autênticos sob marcas de tempo antigas é autenticada e as marcas das páginas valem apenas o que vale a sua fonte: a CLI di-lo (<c1/>) sempre que não é dada nenhuma hora de referência. Com uma hora de referência, a tolerância é inferior a uma subtrama (por predefinição { "29" } s; valores maiores são recusados). Uma hora de referência é um único instante: as subtramas mais afastadas dela do que a tolerância são postas de parte e contadas, pelo que serve para dados em tempo real ou acabados de gravar, não para uma gravação longa. Para uma gravação, omita-se a hora de referência e leia-se o resultado como "autêntico, não necessariamente atual". As Receiver Guidelines indicam o requisito formal.

# text
seg-aa37ce329914 = As marcas das páginas de um fluxo u-blox provêm dos próprios dados não autenticados (ver Entrada), pelo que também não oferecem qualquer proteção de atualidade.

# text
seg-a33d72076025 = Cadeias, chaves e alertas

# text
# c1: chain_mismatch
seg-be2d9588df65 = As cadeias verificadas são mantidas por identificador de cadeia (CID); as etiquetas são verificadas com a cadeia que o cabeçalho NMA nomeia, e um cabeçalho que nomeie uma cadeia que não foi verificada deixa as etiquetas da subtrama por verificar (<c1/>). Uma segunda KROOT de uma cadeia em vigor acrescenta uma âncora; uma KROOT de outra cadeia é mantida em paralelo, pelo que anunciar de novo a cadeia antiga após uma renovação não desfaz a nova.

# text
# c1: stale
seg-bbb6574fa258 = O cabeçalho NMA não é autenticado, pelo que o que anuncia só conta quando é confirmado: quando mais do que um satélite envia o mesmo cabeçalho numa subtrama, ou quando a mensagem assinada de uma KROOT verificada o transporta (o cabeçalho faz parte dessa mensagem). Os dois casos não são iguais. A concordância de mais do que um satélite protege contra uma anomalia de um único satélite, não contra um spoofer: um spoofer pode falsificar dois identificadores de satélite. O que isso lhe dá é negação de serviço, e nada mais, uma vez que um "don't use" confirmado limpa os dados autenticados de todos os satélites: levantá-lo, forjado ou genuíno, não restaura nada até que novas etiquetas sejam verificadas sob subtramas operacionais genuínas. (Antes dessa limpeza, um levantamento forjado poderia repor, durante até à janela de autenticação, dados que já tinham sido autenticados.) A verdadeira confirmação é o cabeçalho assinado pela KROOT, que também levanta de novo um "don't use" quando transporta um estado operacional. O cabeçalho de um único satélite não altera nada além da verificação das etiquetas da sua própria subtrama. Uma KROOT cujo tempo de aplicabilidade não seja posterior ao da cadeia mantida para o mesmo identificador (uma repetição de uma mais antiga) é recusada (<c1/>); uma KROOT da mesma cadeia acrescenta uma âncora.

# text
seg-5c08dbaa8d43 = O estado e o valor CPKS do cabeçalho confirmado determinam a revogação. Com o estado NMA "don't use", o CPKS "chain revoked" elimina a cadeia que o cabeçalho nomeia e recusa a sua KROOT a partir daí; o CPKS "public key revoked" elimina a chave pública que assinou essa cadeia, e todas as cadeias assinadas com ela. Se a cadeia de substituição para esse identificador foi adotada antes de o cabeçalho ser confirmado, por maior que seja o intervalo, a chave revogada é a da cadeia anterior, não a da nova; essa memória é mantida até a revogação ser executada ou o cabeçalho de outro procedimento ser confirmado, e um cabeçalho de revogação repetido a cada subtrama é executado uma só vez. Os mesmos valores CPKS com o estado operational marcam a transição para a substituição e não revogam nada. O cabeçalho não é ele próprio autenticado, pelo que uma revogação forjada só pode retirar a autenticação, e é definitiva até o verificador ser reiniciado. Essa definitividade abrange também a chave em uso: uma revogação forjada de chave pública repõe a memória da chave substituída e revoga a chave em uso, e só um reinício a desfaz.

# text
# c1: Unavailable
seg-e7d43eb18c24 = Uma DSM-PKR com NPKT { "4" } é a mensagem de alerta; é verificada através da árvore de Merkle como uma chave, sendo o seu campo NPK aleatório parte da folha. Um alerta verificado limpa todas as cadeias e chaves públicas, recusa todas as KROOT e chaves públicas posteriores, e põe todos os satélites em <c1/>, como as Receiver Guidelines determinam, até o verificador ser reiniciado.

# text
seg-4068e9bda7c1 = O campo de preenchimento de uma DSM-KROOT é um hash da mensagem assinada e da assinatura. É verificado antes da assinatura, e indica também com que cabeçalho NMA a mensagem assinada foi construída quando o cabeçalho mudou durante a montagem da mensagem.

# text
seg-8ea31bf25ef0 = O que não é verificado, ou não é exercitado

# text
seg-3d0808cab632 = <b>Atualidade.</b> Ver Hora acima: precisa de uma hora de referência vinda do exterior.

# text
seg-b3d63950baa4 = <b>Renovação e revogação.</b> As cadeias e as chaves são seguidas como os fluxos dos vetores publicados as exercitam (renovação, fim de cadeia, revogação de cadeia e de chave, nova chave pública, nova árvore de Merkle, alerta), e não todos os casos que o ICD permite. Uma revogação anunciada pelo cabeçalho não autenticado é tomada à letra e é definitiva durante a sessão. Uma nova árvore de Merkle só é adotada através da raiz de Merkle que é dada ao verificador.

# text
seg-f01d90a44585 = <b>Hash da árvore de Merkle.</b> As mensagens DSM-PKR são verificadas com uma árvore SHA-256. Uma árvore SHA3-256, que o ICD permite no futuro, não é suportada. A função de hash da cadeia pode ser SHA-256 ou SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Listas de estado de chaves.</b> A revogação é seguida através do cabeçalho NMA e das mensagens do fluxo; as listas de revogação de certificados não são lidas.

# text
seg-73e0b16d03c7 = <b>Cobertura dos dados autenticados.</b> O ADKD { "4" } com COP { "1" } enviado numa subtrama ímpar não pode autenticar (o Word Type { "10" } pode ser enviado uma ou duas subtramas antes); isto custa apenas disponibilidade, nunca correção.

# text
seg-acc28dcced83 = <b>Operação em tempo constante.</b> Não é fornecida e não é necessária: o verificador não guarda segredos (apenas chaves públicas, chaves de cadeia publicadas e dados recebidos).

# text
seg-b2f8ec90ae39 = <b>Qualidade do sinal e dos dados.</b> As páginas são verificadas por CRC e as páginas de alerta descartadas, mas nada se sabe do sinal em que chegaram. A recuperação Reed-Solomon das palavras I/NAV { "1" } a { "4" } não é utilizada: os dados têm de ser recebidos diretamente.

# text
seg-97313ba2bf88 = <b>Não é um serviço de integridade de posição.</b> A autenticação diz que os dados vieram do sistema. Não diz nada sobre o sinal em que chegaram nem sobre a qualidade da solução de posição.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Formato de página simples.</b> Um par de páginas por linha: <c1/>, comentários <c2/> permitidos. <c3/> é o GST em segundos (<c4/>) no início da página; o hexadecimal são os { "240" } bits das metades par e ímpar (caudas incluídas), com o bit mais significativo primeiro.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>CSV de vetores de teste.</b> A disposição dos vetores publicados (<c1/>). A hora de início vem de <c2/> ou de um nome de ficheiro datado.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Um fluxo de bytes UBX em bruto (<c1/>, detetado automaticamente). As mensagens I/NAV E1-B do Galileo são reconstruídas em pares de páginas (<c2/>); outros sistemas, E5b, páginas de alerta e tramas com uma soma de verificação errada são ignorados. O SFRBX não transporta hora, pelo que cada página é marcada a partir da hora contida nos seus próprios dados (tipos de palavra { "5" } e { "0" }) e só é aceite se as páginas consecutivas com hora concordarem com o número de páginas recebidas entre elas; as páginas que não podem ser colocadas são descartadas, nunca adivinhadas. Essa hora provém dos próprios dados e não dá proteção de atualidade (ver Hora acima). O identificador de sinal { "0" } (E1-C) não transporta dados, pelo que aceitá-lo a par do E1-B é inofensivo. Um par de sincronização perdido com um comprimento absurdo não retém o leitor. O código de enquadramento é uma terceira cópia do enquadramento UBX existente na árvore (<c3/>, a ingestão de receiver-trust); é mantido à parte para que o comportamento de receiver-trust fique inalterado, e os três poderiam partilhar mais tarde um só leitor. A disposição das palavras de uma mensagem SFRBX é tirada de descrições públicas e verificada apenas em tramas sintéticas, não num recetor em tempo real.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = A saída de texto dá o estado por satélite e, com <c1/>, por etiqueta e por época; <c2/> dá o mesmo com a lista de etiquetas. O estado de saída { "3" } significa que uma verificação dos dados de algum satélite falhou, { "2" } significa um erro de utilização ou de entrada. O aviso consultivo acima é impresso primeiro em todos os caminhos, incluindo erros e utilização.

# text
seg-e2af23b756f5 = A partir de Python e de WebAssembly

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) e <c2/> (WebAssembly) executam o mesmo verificador sobre bytes em memória e devolvem o JSON que <c3/> imprime, incluindo o aviso consultivo. O servidor MCP não o inclui: a entrada é um longo fluxo de recetor em bruto mais bem servido pela linha de comandos e por Python, e uma ferramenta de agente acrescentaria uma grande superfície de entrada sem benefício. Aplicam-se o mesmo aviso consultivo e os mesmos limites; o estado não é um serviço de integridade da navegação.

# text
seg-0987c3b00a14 = Testes e dados de teste

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Os dados de teste são sintéticos e gerados pelo código e pelos testes do próprio Kshana. Não são guardados neste repositório vetores do ICD ou das Guidelines, exemplos resolvidos nem material de chaves. Os testes predefinidos (<c1/> e os testes unitários) constroem uma cadeia, páginas e etiquetas a partir das equações e verificam a consistência e que a corrupção deliberada é detetada: um bit de navegação invertido, um bit de chave invertido, etiquetas repetidas, marcas de tempo erradas, uma hora fora da referência, dados em falta, e os ataques que a revisão encontrou (uma subtrama spoofed num futuro distante que não deve apagar uma falha, uma autenticação que deve expirar e acompanhar o IODnav, um alerta, o estado NMA "don't use", etiquetas fictícias, divergência de MACSEQ, chaves em conflito, revogação e renovação de cadeia, um preenchimento ou uma assinatura inválidos), com CMAC-AES, uma cadeia SHA3-256 e uma assinatura P-521 transportadas através do verificador. Uma vez que esses dados provêm da nossa própria leitura do ICD, mostram autoconsistência, não aderência à norma.

# text
seg-4906b14a33a3 = As primitivas são verificadas face a testes de resposta conhecida publicados, nenhum retirado do ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) e RFC { "6979" } (ECDSA P-256). As assinaturas P-521 são verificadas quanto à codificação e à seleção do hash com uma chave descartável criada no teste; a aritmética da curva é a da biblioteca.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = A aderência à norma é verificada por <c1/>, que é facultativo: lê uma cópia do arquivo oficial de vetores de teste que o próprio utilizador descarrega, a partir do diretório nomeado por <c2/>, e não faz nada quando a variável não está definida. Não guarda nem redistribui nada, e as execuções de testes predefinidas não utilizam rede. Dá ao verificador apenas uma raiz de Merkle e as chaves públicas de uma árvore, como um recetor teria, pelo que as cadeias são estabelecidas a partir da DSM-KROOT assinada no fluxo e todo o percurso é executado: Merkle, assinatura, cadeia de chaves, MACSEQ e etiquetas. Afirma, por conjunto de vetores, um mínimo de etiquetas autenticadas, nenhuma falhada, que cadeias e chaves o fluxo anuncia, etiquetas autenticadas de ADKD { "0" }, { "4" } e { "12" }, que a autenticação é retomada após fim de cadeia, revogação de cadeia, revogação de chave e nova chave pública, que a mensagem de alerta é verificada e não deixa nada autenticado, e que todos os vetores usam apenas HMAC-SHA-256, uma cadeia SHA-256, chaves de 128 bits, etiquetas de 40 bits e as entradas de consulta { "33" } e { "34" }. As outras escolhas de algoritmo e de parâmetros do ICD ficam, por isso, cobertas apenas pelos testes de resposta conhecida e sintéticos acima.

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
seg-00a3dd901039 = Crates RustCrypto, em Rust puro, MIT OR Apache-2.0, compiladas sem funcionalidades predefinidas: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> e <c6/> (a funcionalidade <c7/>, usada apenas para verificação), a par de <c8/>, já presente na árvore. Compilam para <c9/> e passam em <c10/>.

# text
seg-7ab62b91d469 = <s1>Anterior</s1>Confiança como telemetria de segurança

# text
seg-5dc48294fbb2 = <s1>Seguinte</s1>Sinal direto aumentado LunaNet
