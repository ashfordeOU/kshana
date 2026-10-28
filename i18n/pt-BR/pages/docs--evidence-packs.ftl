# docs--evidence-packs: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-ade1d7072512 = veja abaixo

# text
seg-245fe1f87b08 = Arquivo

# text
# c1: docs/EVIDENCE-PACKS.md
seg-802d8b6f3afd = Fonte: <c1/>

# text
seg-710e7e630acb = Pacotes de evidências: um registro assinado de um evento de confiança do GNSS

# text
seg-dbc796deac2a = <b>Um pacote é um registro técnico, não um parecer jurídico.</b> Ele declara o que o motor do Kshana calculou a partir de um log de receptor declarado, sob uma configuração declarada, e permite que qualquer pessoa verifique que nada nele foi alterado depois. Ele não diz o que causou um evento, quem foi responsável, se alguma obrigação foi atendida, nem que o log mostra o que o receptor de fato recebeu. O manifesto e o resumo dizem isso.

# text
seg-d99cb540310c = Um pacote de evidências serve para um relatório de incidente, uma seguradora ou uma pergunta de um regulador: "o que o seu sistema disse sobre o sinal GNSS entre estes dois instantes, e podemos confiar nesse registro?"

# text
seg-2fa31fe443b4 = Gerar um pacote

# text
# c1: --lab-attestation lab.toml
# c2: HARDWARE-SAFETY.md
seg-983924cb2eea = Para um pacote gerado a partir de uma sessão de laboratório, <c1/> registra no manifesto assinado a declaração do operador sobre a montagem (conduzida ou blindada, atenuação ou invólucro, o que emitiu qualquer RF); veja <a1><c2/></a1>. Ela é registrada como foi dada e nunca é verificada.

# text
# c1: --from
# c2: --to
# c3: --out
# c4: --created-utc
# c5: 2026-01-02T03:04:05Z
# c6: none
seg-f01e59c876a3 = <c1/> e <c2/> são segundos desde a primeira época do log, ou um horário UTC ISO-8601 quando o log informa o próprio horário de início. <c3/> não pode já conter arquivos. <c4/> aceita um horário UTC real, como <c5/> (qualquer outra coisa é recusada) ou <c6/>, que omite o horário de criação e torna o pacote reproduzível byte a byte. O horário de criação é o que o signatário declara; nada o confronta com um relógio, e é para isso que serve o token de carimbo de tempo opcional.

# text
# c1: keygen
# c2: kshana
# c3: .gitignore
# c4: *.evidence-key
seg-c72ddd97ad0b = O arquivo de chave contém uma semente Ed25519 de 32 bytes como { "64" } dígitos hexadecimais; forneça a sua (por exemplo, uma mantida em seu sistema de gestão de chaves) ou deixe que <c1/> gere uma. <c2/> avisa se o arquivo pode ser lido por outros usuários. <c3/> exclui <c4/>; nomeie sua chave dessa forma se ela estiver em um checkout.

# text
seg-077cbd944c5d = O que há em um pacote

# attr:alt
seg-7cf2608b2b2f = A estrutura de um pacote de evidências. Um log de receptor (NMEA, u-blox UBX, RINEX { "3" } ou um log do Android) e uma janela de tempo entram em kshana receiver-trust evidence, que grava sete arquivos: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig e um timestamp.tsr opcional. O manifesto registra o SHA-256 do log inteiro e de cada arquivo, além de uma cadeia de hashes sobre os arquivos; a assinatura cobre o manifesto. kshana evidence verify verifica a assinatura, o hash de cada arquivo, a cadeia e que nenhum arquivo não listado esteja presente, e termina com { "0" } quando verificado, { "1" } quando algo falhou e { "3" } quando o signatário não estava fixado. Um pacote é um registro técnico, não um parecer jurídico.

# text
seg-e305279d5b11 = Conteúdo

# text
seg-05107c0bd3c8 = os bytes brutos do log do receptor para a janela

# text
# c1: geometry_model
# c2: [geometry]
seg-b19ce12544a5 = o cenário como executado (cada limiar de monitor, evento e regra de comparação), os monitores que rodaram, a linha de base de calibração e o hash do cenário; para uma embarcação, também a declaração consultiva que toda saída de embarcação traz (software de caráter consultivo, não um equipamento de navegação homologado); a partir da { "0.36" }, o <c1/> (a tabela <c2/> efetivamente usada, o peso do monitor de geometria, cada proveniência e as regras de classe). Nomes de diretórios e cargas embutidas são removidos.

# text
# c1: geometry
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
seg-e3c2457161bc = cada época na janela com as estatísticas do motor, os alarmes (os motivos) e o estado de confiança; a partir da { "0.36" }, também sua <c1/> de satélites (boa, degradada com motivos, ou desconhecida quando o log não traz geometria de satélites) e uma <c2/> em cada dedução (<c3/>, <c4/>, <c5/>)

# text
seg-2e309765271f = um resumo autocontido e sem scripts: identificação, hashes, resultados, motivos, uma faixa de geometria (épocas por estado de geometria) separada das classes das deduções ({ "0.36" }), cada limiar, a tabela por época e os limites do registro

# text
seg-467277f816d2 = versão do motor, janela, horário de criação, o formato e o nome do log, <b>o SHA-256 do log completo</b>, o intervalo e o SHA-256 da fatia, a chave pública e a impressão digital do signatário, o tamanho e o SHA-256 de cada arquivo e uma cadeia de hashes sobre os arquivos

# text
# c1: manifest.json
seg-7a92ff70ed7f = assinatura Ed25519 sobre os bytes exatos de <c1/>

# text
seg-b517814b077d = token de carimbo de tempo RFC { "3161" } opcional

# text
# c1: byte-range
# c2: whole-log
seg-6ad4c5f3afbe = <b>Fatia do log.</b> O leitor informa o intervalo de bytes de origem de cada época, de modo que a fatia é o menor intervalo de bytes que contém todas as épocas da janela (<c1/>): NMEA, u-blox UBX, observações RINEX { "3" } e logs do Android. Ela recebe hash como bytes brutos, nunca como texto decodificado. Para um feed ao vivo ou RINEX { "2" } não há intervalo; o log inteiro é então incluído e o manifesto diz <c2/> (a janela limita quais épocas são informadas, não quais bytes são incluídos). O resumo declara qual caso se aplica. Uma fatia é um registro dos bytes da janela, não um log autônomo: por exemplo, uma fatia RINEX não tem cabeçalho de arquivo.

# text
# c1: link₀ = SHA-256("kshana- evidence-chain/1")
# c2: linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖ name)
# c3: chain_head
seg-c4c81cbd4981 = <b>Cadeia de hashes.</b> O manifesto lista os arquivos em uma ordem fixa. <c1/>; para cada arquivo, <c2/> (comprimento como { "4" } bytes, big-endian). O último elo é <c3/>. Reordenar, remover ou substituir um arquivo altera a cadeia; a assinatura cobre a cadeia.

# text
seg-1147c5b0d348 = Verificar um pacote

# text
seg-e716ddf7bcc9 = O código de saída { "0" } significa verificado; { "1" } significa que algo falhou; { "2" } significa erro de uso; { "3" } significa que o pacote está íntegro, mas seu signatário não estava fixado (veja abaixo). Cada verificação informa êxito, falha ou omissão, e cada falha é nomeada:

# text
seg-f6f2cebd9cb0 = Código de falha

# text
seg-312a5d784f42 = o manifesto não pode ser lido

# text
# c1: manifest.json
seg-6f1b5d9d6711 = sem assinatura, não é uma assinatura hexadecimal minúscula de 64 bytes, ou ela não é verificada sobre <c1/>

# text
seg-129b78f142f1 = a chave não é válida ou difere da que você forneceu

# text
seg-c86b25543d55 = um arquivo listado está ausente ou difere do manifesto; o arquivo é nomeado

# text
seg-f98d26abf045 = um arquivo está no pacote, mas não no manifesto

# text
seg-842bac6a9e69 = um elo não é o que suas entradas resultam; o arquivo é nomeado

# text
# c1: epochs.json
seg-413034467a64 = o manifesto contradiz a si mesmo ou <c1/>

# text
# c1: --log
seg-ef4bfbedca33 = com <c1/>: o log que você tem não é o registrado, ou a fatia não é esse intervalo dele

# text
seg-dcd686ac77f7 = Alterar um byte de qualquer arquivo faz a verificação falhar com o motivo correspondente: um artefato alterado é informado como divergência de hash daquele arquivo e nada mais; um manifesto alterado faz a assinatura falhar. Recalcular os hashes e a cadeia após editar um arquivo não ajuda sem a chave de assinatura; então falha apenas a assinatura.

# text
# c1: --pubkey
# c2: --allow-unpinned
# c3: --pubkey
# c4: .pub
seg-066fe7c07bf6 = <b>Fixe a chave.</b> Sem <c1/>, um pacote prova apenas que está íntegro em relação à chave que ele mesmo nomeia, a qual qualquer pessoa pode gerar. Por isso a verificação termina com { "3" } e diz "INTACT, BUT THE SIGNER IS NOT PINNED" em vez de "VERIFIED"; <c2/> aceita conscientemente a chave do próprio pacote e imprime "VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)". Obtenha a chave pública do signatário junto ao próprio signatário por um meio em que você confie (não a partir do pacote) e passe-a com <c3/>: { "64" } dígitos hexadecimais ou o arquivo <c4/>. Passar a chave privada por engano é reconhecido e recusado. A impressão digital (os primeiros { "128" } bits do SHA-256 da chave, { "32" } dígitos hexadecimais) é impressa para comparação visual; fixar a chave completa é o caminho confiável.

# text
seg-a01c7ba606c9 = Formato do pacote e procedimento de verificação (normativo)

# text
seg-fa43e16b6aba = Esta seção é a especificação a partir da qual se escreve um verificador independente. Palavras em maiúsculas são requisitos. Um pacote é um diretório (ou qualquer mapa de nome de arquivo para bytes) de arquivos com os nomes exatamente como abaixo; um verificador trabalha com os bytes de cada arquivo como armazenados e nunca reserializa nada.

# text
# c1: log-slice.bin
# c2: config.json
# c3: epochs.json
# c4: summary.html
# c5: manifest.json
# c6: manifest.sig
# c7: timestamp.tsr
seg-1fbabb3f1092 = <b>Arquivos.</b> Os arquivos de artefato, nesta ordem fixa, são <c1/>, <c2/>, <c3/>, <c4/>. Um pacote também tem <c5/> e <c6/>, e PODE ter <c7/>. Qualquer outro nome é um <em>arquivo não listado</em>.

# text
# c1: 0-9a-f
seg-3ed6e38ad2ee = <b>Hexadecimal.</b> Toda cadeia hexadecimal usa apenas <c1/> minúsculos, sem espaços; maiúsculas não são aceitas. Os valores SHA-256 têm { "64" } dígitos, a chave pública tem { "64" } dígitos, a assinatura tem { "128" } dígitos.

# text
# c1: manifest.sig
# c2: manifest.json
# c3: \n
seg-6609210d003a = <b><c1/>.</b> O hexadecimal minúsculo de 128 dígitos da assinatura Ed25519 de 64 bytes (RFC { "8032" }, o esquema Ed25519 puro) sobre os bytes exatos de <c2/>, seguido de exatamente um <c3/> e nada mais. A assinatura DEVE ser verificada de forma estrita: uma assinatura cujo valor S não seja menor que a ordem do grupo L é inválida.

# text
# c1: manifest.json
seg-b163e9f5db66 = <b><c1/>.</b> Um objeto JSON em UTF-8. Seus membros (um verificador DEVE encontrar cada um com o tipo JSON indicado; membros adicionais são ignorados):

# text
seg-ace92bcbfd8a = membro

# text
seg-04f69a0edb2f = tipo

# text
seg-45425f378b61 = significado

# text
seg-6940543aa3c0 = string

# text
# c1: kshana-evidence/1
seg-48d303baac62 = DEVE ser igual a <c1/>

# text
seg-6e57561e7f01 = descritivo

# text
seg-abec93a4a488 = string ou nulo

# text
seg-7d059c0b6372 = horário de criação, descritivo

# text
# c1: {from_s, to_s}
seg-507d53a53380 = objeto <c1/>

# text
seg-bb2bcbbf404a = números, segundos

# text
seg-64572c65426f = inteiro não negativo

# text
# c1: epochs.json
seg-14d421e391dd = o número de entradas do array JSON em <c1/>

# text
seg-f5e7215e6835 = objeto

# text
# c1: format
# c2: file_name
# c3: full_sha256
# c4: full_bytes
# c5: start_label
# c6: slice
seg-a4117217030c = <c1/> string, <c2/> string, <c3/> hexadecimal, <c4/> inteiro não negativo, <c5/> string ou nulo, e <c6/>

# text
# c1: kind
# c2: byte-range
# c3: whole-log
# c4: start
# c5: end
# c6: sha256
seg-02389e71a339 = <c1/> (exatamente <c2/> ou <c3/>; qualquer outro valor torna o manifesto malformado), <c4/> e <c5/> inteiros não negativos (deslocamentos em bytes, fim exclusivo), <c6/> hexadecimal

# text
# c1: algorithm
# c2: ed25519
# c3: public_key
# c4: fingerprint
seg-6c9176965aae = <c1/> string (<c2/>), <c3/> hexadecimal ({ "32" } bytes), <c4/> string

# text
seg-dcba59304030 = array de objetos

# text
# c1: name
# c2: role
# c3: bytes
# c4: sha256
# c5: link
seg-e42ed5e07430 = um por arquivo de artefato, na ordem fixa: <c1/> string, <c2/> string, <c3/> inteiro não negativo, <c4/> hexadecimal, <c5/> hexadecimal

# text
seg-b79c9500b744 = hexadecimal

# text
seg-697592bd3757 = o último elo

# text
seg-9da5d92757bd = objeto, opcional

# text
# c1: --lab-attestation
# c2: operator
# c3: organisation
# c4: date
# c5: setup
# c6: conducted
# c7: shielded
# c8: attenuation_db
# c9: enclosure
# c10: emitter
# c11: statement
# c12: signature
seg-2032c208038d = presente apenas em um pacote gerado a partir de uma sessão de laboratório (<c1/>): a declaração do operador <c2/>, <c3/>, <c4/>, <c5/> (<c6/> ou <c7/>), <c8/> ou <c9/>, <c10/>, <c11/> e, opcionalmente, <c12/>, registrada como foi dada. Ela é coberta pela assinatura do manifesto e nunca é verificada; um verificador a informa como "attested by the named operator; not verified by Kshana". Ausente nos demais casos, e um pacote sem ela permanece inalterado

# text
# c1: signer.fingerprint
seg-9411be425a80 = <c1/> são os primeiros { "32" } dígitos hexadecimais do SHA-256 sobre os { "32" } bytes da chave pública.

# text
seg-80e55f2d3496 = Cadeia de hashes.

# text
# c1: link0
# c2: kshana-evidence-chain/1
# c3: link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file) (32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )
# c4: SHA-256(file)
# c5: sha256
seg-9346fe50efac = <c1/> é o SHA-256 dos { "23" } bytes ASCII <c2/>. Para cada artefato, em ordem, <c3/>, onde <c4/> é tomado do <c5/> registrado no manifesto para aquele artefato (assim a cadeia é uma propriedade do manifesto e é verificada em relação a ele, não aos arquivos).

# text
# c1: code
# c2: name
# c3: pin
seg-9dd985d8cb03 = <b>Procedimento.</b> Um verificador executa estas etapas em ordem e coleta todas as falhas; o resultado é o <em>conjunto</em> de falhas, cada uma com um <c1/> e, quando indicado, o <c2/> do arquivo. Ele NÃO DEVE parar na primeira falha, exceto onde indicado. <c3/> é a chave pública em que o verificador foi instruído a confiar, se houver.

# text
# c1: manifest.json
# c2: manifest-missing
seg-abb1d2635143 = Sem <c1/>: falha <c2/>; pare.

# text
# c1: manifest.json
# c2: artifacts
# c3: log.slice
# c4: manifest-malformed
# c5: format
# c6: unsupported-format
seg-73a4aeb463e8 = Se <c1/> não é um objeto JSON com todos os membros acima nos tipos indicados (incluindo as entradas de <c2/> com todos os membros, e <c3/>): falha <c4/>. Caso contrário, se <c5/> não é o valor acima: <c6/>.

# text
# c1: signer.public_key
# c2: public-key-malformed
# c3: signer.fingerprint
# c4: public-key-malformed
# c5: pin
# c6: public-key-mismatch
# c7: pin
# c8: pin
# c9: manifest.sig
# c10: signature-missing
# c11: \n
# c12: signature-malformed
# c13: public-key-malformed
# c14: manifest.json
# c15: signature-invalid
seg-36c9df2abf34 = Fase da assinatura. Esta fase é executada quer o manifesto tenha sido legível ou não. Se o manifesto era legível, a <em>chave nomeada</em> é <c1/>; se não forem { "64" } dígitos hexadecimais minúsculos, falha <c2/> (sem chave nomeada); caso contrário, se <c3/> não é a impressão digital dela, falha <c4/> (a chave continua utilizável). Se existem tanto uma <c5/> quanto uma chave nomeada e elas diferem: falha <c6/>. A <em>chave de verificação</em> é <c7/>, se uma foi fornecida; do contrário, a chave nomeada, se houver; com nenhuma das duas, não há chave de verificação (isso inclui todos os casos em que o manifesto não era legível e nenhuma <c8/> foi fornecida). Se não há <c9/>: <c10/>. Senão, se o arquivo não tem exatamente { "128" } dígitos hexadecimais minúsculos mais um <c11/>: <c12/>. Senão, se há uma chave de verificação que não é uma codificação válida de chave pública Ed25519: <c13/>. Senão, se há uma chave de verificação e a assinatura não é verificada de forma estrita sobre os bytes de <c14/> (sejam quais forem): <c15/>. (Sem chave de verificação, a assinatura não é verificada e nenhuma falha é levantada por isso.)

# text
# c1: manifest-malformed
seg-3dbe07af8fa8 = Se o manifesto não era legível (a etapa { "2" } deu <c1/>): pare aqui.

# text
# c1: artifacts
# c2: artifact-list-malformed
# c3: file-missing
# c4: bytes
# c5: file-size-mismatch
# c6: sha256
# c7: file-hash-mismatch
seg-b7e03ef2dea5 = Artefatos. Se os nomes em <c1/> não são exatamente os quatro acima, em ordem: <c2/>. Depois, para cada entrada do manifesto, em ordem: se o pacote não tem arquivo com esse nome, <c3/> (nome); senão, se seu comprimento difere de <c4/>, <c5/> (nome); e, independentemente, se o SHA-256 do arquivo difere de <c6/>, <c7/> (nome).

# text
# c1: manifest.json
# c2: manifest.sig
# c3: timestamp.tsr
# c4: artifacts
# c5: unlisted-file
seg-24cda5a1d9d8 = Arquivos não listados: para cada arquivo do pacote que não seja <c1/>, <c2/>, <c3/> nem os nomes em <c4/> do manifesto: <c5/> (nome).

# text
# c1: artifacts
# c2: link0
# c3: sha256
# c4: manifest-malformed
# c5: link
# c6: chain-mismatch
# c7: chain_head
# c8: chain-head-mismatch
seg-d103ade9a7c7 = Cadeia. Percorra <c1/> do manifesto em ordem, a partir de <c2/>. Se o <c3/> de uma entrada não tem { "64" } dígitos hexadecimais minúsculos: <c4/> e a cadeia é abandonada (sem verificação do cabeçalho). Caso contrário, calcule o elo; se ele difere do <c5/> da entrada: <c6/> (nome). Após o percurso, se a cadeia não foi abandonada e o último elo difere de <c7/>: <c8/>.

# text
# c1: slice-record-inconsistent
# c2: start > end
# c3: end > full_bytes
# c4: log-slice.bin
# c5: sha256
# c6: slice.sha256
# c7: bytes
# c8: end - start
# c9: kind
# c10: whole-log
# c11: start != 0
# c12: end != full_bytes
# c13: slice.sha256 != full_sha256
# c14: epochs.json
# c15: epochs_in_window
# c16: epoch-count-mismatch
seg-be9fade3f879 = Fatia e épocas. Levante <c1/> (no máximo uma vez por motivo, e um verificador informa o código uma única vez, não importa quantos motivos se apliquem) se ocorrer qualquer um de: <c2/>; <c3/>; o <c5/> da entrada <c4/> difere de <c6/>; o <c7/> dessa entrada difere de <c8/>; ou <c9/> é <c10/> e qualquer um de <c11/>, <c12/>, <c13/>. Se <c14/> existe e é interpretado como um array JSON cujo comprimento difere de <c15/>: <c16/>.

# text
# c1: log.full_sha256
# c2: full-log-hash-mismatch
# c3: start..end
# c4: log-slice.bin
# c5: slice-not-from-full-log
seg-0dc49ed14c1f = Log completo. Somente se o verificador recebeu os bytes do log original: se o SHA-256 deles difere de <c1/>, <c2/>; caso contrário, se o intervalo <c3/> não está dentro do log ou os bytes do log ali diferem de <c4/>, <c5/>.

# text
# c1: timestamp.tsr
# c2: timestamp-missing
# c3: timestamp-malformed
# c4: manifest.json
# c5: timestamp-imprint-mismatch
seg-a7f787d6e6df = Carimbo de tempo. Sem <c1/>: se o verificador foi instruído a exigir um, <c2/>; caso contrário, nada. Com um: se ele não pode ser lido como um token ou resposta RFC { "3161" } (veja abaixo), <c3/>; caso contrário, se a impressão da mensagem não é o hash, no algoritmo da própria impressão (SHA-256, SHA-384 ou SHA-512), dos bytes de <c4/>: <c5/>.

# text
seg-f7d908c6bf38 = O pacote é verificado exatamente quando o conjunto de falhas está vazio. Se o signatário estava fixado é informado separadamente e não altera o conjunto de falhas.

# text
# c1: ContentInfo
# c2: id-ct-TSTInfo
# c3: TimeStampResp
# c4: PKIStatusInfo
# c5: TSTInfo
# c6: genTime
# c7: --tsa-ca
seg-b0d74519122d = <b>Token de carimbo de tempo.</b> Um token é um <c1/> DER cujo tipo de conteúdo é CMS SignedData ({ "1.2.840.113549.1.7.2" }) e cujo tipo de conteúdo encapsulado é <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); uma resposta é um <c3/> DER (um <c4/> seguido do token) cujo status é { "0" } ou { "1" }. O algoritmo da impressão da mensagem de <c5/> deve ser SHA-256, SHA-384 ou SHA-512, com um digest do comprimento desse algoritmo, e seu <c6/> um horário de calendário UTC real. BER de comprimento indefinido não é aceito. A assinatura e a cadeia de certificados da autoridade só são verificadas quando âncoras de confiança são fornecidas (<c7/>, abaixo).

# text
seg-2156bf4dabb3 = Carimbo de tempo RFC { "3161" } (opcional)

# text
# c1: manifest.json
# c2: create_bundle
seg-27a71ea73d7d = Um token de carimbo de tempo de uma autoridade de carimbo de tempo mostra que o manifesto existia em um instante que a autoridade atesta. O token é sobre <c1/>, por isso é solicitado depois que o pacote é gerado (não há como fornecer um na criação do pacote, e <c2/> recusa um token que não seja sobre exatamente esse manifesto):

# text
# c1: kshana evidence verify
# c2: manifest.json
# c3: authority_signature_verified: false
# c4: openssl ts -verify
seg-7ae6e0326b65 = <c1/> lê o token (um token simples ou uma resposta completa), verifica que ele foi concedido e que a impressão da mensagem é igual ao hash de <c2/>, e imprime o horário que ele declara. Sem âncoras de confiança, acrescenta "timestamp authority signature not verified by Kshana" e informa <c3/>; execute a linha <c4/> acima para essa parte. Um token cuja impressão difere, ou que não é interpretado, é uma falha. Os tipos de conteúdo, o comprimento da impressão e o horário de geração do token são verificados quanto à coerência.

# text
# c1: --tsa-ca authority-ca.pem
# c2: verify
# c3: openssl ts -verify
# c4: genTime
# c5: timestamp-authority-invalid
# c6: authority_signature_verified
# c7: tests/fixtures/evidence_tsa/PREREGISTRATION.md
seg-88359c107bf1 = Com <c1/> (um ou mais certificados PEM, todos confiáveis), <c2/> também verifica a autoridade, offline, como faz <c3/>: o digest da mensagem dos atributos assinados, a assinatura (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 ou P-384), a vinculação ESS do certificado de assinatura, o uso estendido de chave timeStamping crítico do signatário e a cadeia até uma âncora autoemitida, com todos os certificados válidos no <c4/> do token. Uma falha é informada como <c5/> com a primeira verificação que falhou, e <c6/> é verdadeiro somente quando tudo passou. A revogação (CRL ou OCSP) não é verificada. Este verificador concorda com o OpenSSL { "3.0.13" } em { "27" } casos autogerados (<c7/>).

# text
# c1: verify
# c2: --require-timestamp
# c3: timestamp-missing
# c4: attach-timestamp
# c5: --replace
seg-f534ae37f10c = <b>O token fica ao lado do manifesto assinado, não dentro dele.</b> Nada na assinatura ou na cadeia o cobre, de modo que um token pode ser removido, ou um outro token válido substituído, sem que a assinatura falhe. Por isso <c1/> observa quando um pacote não tem nenhum, e <c2/> torna a ausência de token uma falha (<c3/>); um token substituído só é detectado se não corresponder ao manifesto. <c4/> recusa sobrescrever um token existente, a menos que você passe <c5/>. Se um carimbo de tempo importa para você, guarde o token e o resultado da verificação junto a seus próprios registros, e exija-o.

# text
seg-b993ef559bd0 = A partir do código

# text
# c1: kshana::evidence::build_receiver_trust_pack
# c2: create_bundle
# c3: verify_bundle
# c4: EvidenceInput
# c5: BTreeMap<String, Vec<u8>>
# c6: Files
# c7: VerifyReport
# c8: wasm32
seg-de24fd02c7c2 = <c1/> é o único ponto de entrada que a linha de comando e todas as outras superfícies chamam para gerar um pacote: entram um cenário, os bytes do log (e os do arquivo de navegação, para RINEX), a janela como texto, um título e um horário de criação opcional, além da semente de assinatura; saem os arquivos, o número de épocas, a fatia, o hash do manifesto e a impressão digital do signatário. Ele não lê arquivos nem relógio, de modo que as mesmas entradas dão os mesmos bytes. Abaixo dele, <c2/> e <c3/> são funções puras: bytes entram (<c4/>, uma semente de 32 bytes, um <c5/> de arquivos), resultados serializáveis saem (<c6/>, <c7/>). Não usam arquivos, relógio nem estado de processo, e compilam para <c8/>, de modo que as superfícies Python, WebAssembly e de servidor as chamam sem alteração. A linha de comando é um invólucro fino sobre elas.

# text
seg-292a5bc48548 = O que um pacote não faz

# text
# c1: config.json
# c2: kshana receiver-trust
# c3: epochs.json
seg-852aca7fc407 = Ele não reexecuta a avaliação. Qualquer pessoa com o log completo e <c1/> pode reexecutar <c2/> e comparar com <c3/>; o pacote prova o que foi registrado, não que o motor estava certo.

# text
seg-91639deac47d = Ele não prova que o log é genuíno ou completo. O hash do log completo vincula o registro a um único arquivo; a origem desse arquivo cabe ao operador estabelecer.

# text
seg-0f721c314fa1 = Ele não traz nenhuma afirmação de desempenho sobre detecção ou rejeição de interferência.

# text
seg-9c361736bf27 = É um registro técnico e não um parecer jurídico nem uma certificação.

# text
seg-68bcf43b4e27 = <s1>Anterior</s1>Cobertura de linhas

# text
seg-09c0b5fa6e52 = <s1>Próxima</s1>Enlaces ópticos através da atmosfera

seg-bd3169455cd0 = O rótulo de evidência ({ "0.40" })

seg-6fe796d2b15f = Um pacote criado pela { "0.40" } ou posterior traz, dentro de <c1/>, uma entrada <c2/> (o nível, <c3/>, <c4/> ou <c5/>, que é o estado mais fraco entre suas linhas, e os ids e requisitos das linhas da matriz de verificação em que o conteúdo do pacote se apoia: a linha de integridade do pacote, as linhas de receiver-trust e as linhas de pontuação do jammertest ou de ida e volta para esses pacotes) e <c6/> <c7/>. Está dentro de <c8/>, de modo que o hash do arquivo do manifesto, a cadeia de hashes e a assinatura o cobrem: alterá-lo faz a verificação falhar. <c9/> informa o nível e os ids das linhas.

seg-15b4e784361a = A mudança é aditiva e apenas para frente. O <c1/> do manifesto permanece <c2/>: o texto normativo acima diz que um verificador DEVE encontrar esse valor, e o verificador de sala limpa em <c3/> o encontra. A versão menor é portanto carregada por <c4/> (ausente em um pacote feito antes da { "0.40" }, significando { "1.0" }), e não por uma nova cadeia <c5/>. Um pacote feito antes da { "0.40" } não tem rótulo e é verificado sem alteração; <c6/> diz "no evidence label (pre-0.40 pack)". Os testes são <c7/> (incluindo os pacotes de referência independente pré-0.40 versionados) e <c8/>.

seg-218641620d3e = <s1>Próximo</s1>Parceiros de dados e linhas promovidas
