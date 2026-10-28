# docs--partner-data: translations (pt-BR)

seg-2247a2344710 = Significado

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

seg-f942b36a11c4 = Ainda não está no GitHub

seg-7338b6210228 = Linha

seg-c5ce76c91ff7 = Rótulo

seg-3a04afee76ec = Fonte: <c1/>

seg-e6d8549f24b9 = Dados de parceiros: o que dados medidos poderiam promover em uma linha MODELLED

seg-7b9ff34db2c4 = O Kshana rotula cada capacidade em um registro verificado por máquina (<a1>matriz de verificação</a1>). A maioria das linhas de temporização e de sensores é <b>MODELLED</b>: apoia-se em modelos declarados, folhas de dados publicadas e verificações internas, e nenhum registro medido da classe de dispositivo foi comparado com elas. Quem tem esse registro pode mudar isso. Esta página diz quais linhas, o que enviar, como um envio é verificado, como é pontuado e como é creditado. Foi escrita para um laboratório, um fabricante ou um grupo universitário; não é uma oferta de trabalho e não alega aval de ninguém. Apenas consultivo: o Kshana é um instrumento de estudo, não um equipamento de navegação ou de temporização homologado.

seg-1cf5536037d4 = O que significam os rótulos

seg-5f43f341fa27 = uma referência independente externa concorda com a capacidade sob um limiar fixado antes da comparação. Um registro medido de um parceiro pode ser essa referência para a subafirmação que ele cobre; os invariantes da matriz proíbem o rótulo sem uma

seg-0d182b8c7430 = internamente consistente e dito em voz alta; nenhuma referência independente externa cobre a afirmação. Uma linha MODELLED que é comparada com dados medidos e não atinge o limiar permanece MODELLED, e a falha é publicada

seg-8a45367544a0 = uma disciplina de que a execução depende, que um parceiro de hardware possui e que o Kshana não fornece, por exemplo os valores que descrevem o relógio ou o interferômetro do próprio parceiro. O Kshana modela o que tal dispositivo faria a uma cadeia de navegação ou de temporização; não dá garantias sobre o dispositivo

seg-553a1db0e11d = Um envio pode mover uma linha para VALIDATED apenas para a afirmação que os dados de fato testam, e apenas se a comparação atingir o seu limiar. Não pode tornar os valores próprios de um dispositivo algo de que o Kshana possa dar garantia: esses permanecem do parceiro (PARTNER). Se o rótulo de uma linha muda é decisão do responsável, registrada no commit que a altera, com o texto da referência independente dizendo exatamente o que foi comparado com o quê.

seg-bac61cc47097 = Linhas que os dados de um parceiro poderiam promover

seg-bd4f5d3f9399 = Cada linha abaixo é o texto <c1/> exato de uma linha MODELLED da matriz (um teste mantém esta página e a matriz em sincronia). "Poderia mudar" diz o que uma comparação fixada antecipadamente com dados medidos apoiaria se o limiar for atingido; nunca é uma promessa.

seg-fb5ceb1d62f0 = Dados que a testariam

seg-812eae6bbea9 = Poderia mudar

seg-f46d009d9380 = um registro de dias de um relógio de uma classe nomeada, em funcionamento livre após sua última disciplina, comparado com uma referência melhor, com intervalo de amostragem de um minuto ou menos

seg-2a73fc59a03d = os pisos de ruído vermelho por classe que limitam os valores de holdover permanecem MODELLED hoje; uma estabilidade medida em tempos de média longos poderia ser comparada com o piso dessa classe, apenas para essa classe

seg-abe6b657ce1b = o desvio de Allan medido, como tabela ou como registro de fase, do relógio ou do interferômetro atômico de um parceiro

seg-6ba2b7faa909 = os valores do estudo de compromisso quantificam (nunca validam) o dispositivo do parceiro, de modo que seriam rotulados como valores do parceiro (PARTNER); a ingestão de dados de Allan medidos em um modelo de ruído já está confrontada com um solucionador independente

seg-ad537759d084 = um registro de fase de um oscilador de um dos quatro modelos predefinidos, ao longo de pelo menos um dia

seg-44a55f6ebef6 = se o modelo de ruído derivado da folha de dados da predefinição reproduz a estabilidade de uma unidade medida nos próprios tempos de média da folha de dados

seg-3da5a93abde6 = um registro de fase de uma classe de relógio ainda sem cartão (um OCXO, um rubídio, um césio, um maser, um relógio óptico)

seg-72f248aa4438 = um cartão ajustado no primeiro terço e que prevê o desvio de Allan do restante dentro do fator fixado antecipadamente, como já feito para relógios de satélites GNSS e um receptor

seg-54971e473811 = um registro de uma instalação real (qualquer versão do daemon) com as próprias linhas de resumo do daemon

seg-bccf188b7636 = os leitores foram construídos a partir de layouts de linha e arquivos de teste públicos; um registro real comparado com um leitor independente seria a primeira verificação externa

seg-e83b73ab2d5d = uma exportação de um contador real ou de um software de análise

seg-80b69f559ea5 = o mesmo, para esses formatos

seg-0c279732d132 = um teste real de holdover: o registro, os momentos em que o operador retirou e restaurou a referência, e os próprios veredictos de MTIE, TDEV e máscara do laboratório a partir do seu software de análise

seg-cfad71161af0 = um cálculo independente das mesmas grandezas para comparar com o do motor

seg-97c65b646eae = um registro estacionário de uma unidade inercial cujos parâmetros de ruído são publicados ou medidos por outra pessoa

seg-77f9d22ec624 = o ajuste recuperado dentro de um fator declarado dos parâmetros independentes

seg-c9544eadc55d = um registro estático ou os parâmetros de ruído do sensor inercial de átomos frios de um parceiro

seg-062dd193ab20 = os valores do dispositivo são do parceiro (PARTNER); o orçamento de erro de posição que os compõe permanece um modelo do Kshana

seg-078be7f5769f = Comece pelas duas primeiras: elas decidem se os pisos de holdover por classe e o estudo de compromisso quântico versus clássico se apoiam em algum dado medido próprio.

seg-c325655738e0 = O que enviar

seg-ca24fa511ffe = Um envio são dois arquivos em uma pasta: os dados e uma pequena descrição deles, um arquivo TOML (<c1/>; um exemplo prático, inventado, é <c2/>).

seg-a3e30cf27adb = <b>Dados de relógio.</b> Um dos formatos que o Kshana lê (veja os <a1>formatos de registro de relógio</a1>): registros TICC da TAPR, fase ou frequência ASCII no estilo TimeLab, RINEX clock, registros <c1/>, <c2/> e <c3/> do linuxptp, registros de rastreamento e de estatísticas do chrony. A fase é preferida à frequência; declare as unidades e o intervalo de amostragem. Forneça o registro ininterrupto mais longo que tiver: a estabilidade em tempos de média longos precisa de dias, e um registro com menos de um dia é aceito, mas com aviso.

seg-a14b0c961637 = <b>Dados inerciais.</b> Um CSV de colunas nomeadas (<c1/>, rad/s e m/s^{ "2" }) ou o layout EuRoC, de um dispositivo estacionário, longo o bastante para o ajuste (pelo menos { "2000" } amostras; horas é melhor).

seg-a1f2cd79bcc0 = <b>A descrição</b> diz, e o verificador confere onde pode:

seg-cfeee5da56d7 = o tipo de organização (um tipo como "um laboratório nacional de temporização", não um nome; um nome é opcional e apenas para crédito);

seg-4bd30d68101c = o dispositivo (tipo, classe e um modelo para a classe <c1/>);

seg-e8222178a0ee = como os dados foram obtidos: com o que foram comparados, o instante inicial (UTC), o ambiente, e se são brutos ou processados (e o que foi feito com eles);

seg-7ac28bd566f2 = o SHA-256 do arquivo de dados, de modo que o arquivo pontuado é o arquivo descrito;

seg-0eba30c3a5b8 = as linhas MODELLED às quais é oferecido, pelo texto exato do requisito acima;

seg-dd694deec626 = a licença (um identificador SPDX ou palavras) e como os dados podem ser usados no repositório: <c1/> (incluídos, com atribuição), <c2/> (apenas o hash e as pontuações são publicados) ou <c3/> (a pontuação é compartilhada somente com quem enviou);

seg-7cea4b7c1df8 = três declarações: é uma medição e não uma simulação, quem envia pode licenciá-la para este uso, e os arquivos não contêm dados pessoais.

seg-caa6696f3f5f = <b>O que não enviar.</b> Qualquer coisa pessoal ou com dados de contato (o verificador recusa um endereço de e-mail ou número de telefone na descrição), qualquer coisa sob controle de exportação ou restrita por acordo, e qualquer dado simulado apresentado como medido.

seg-a2f0067b6da5 = Como um envio é verificado

seg-f1d4c097691e = Formato e metadados, por você ou por nós, antes de qualquer execução.

seg-c3cd90222eaa = Ele confirma o esquema, os campos obrigatórios, o hash, as regras de licença e atribuição, que as linhas de destino existem e são MODELLED, que os dados são lidos pelo leitor do próprio motor, e informa o que leu (amostras, intervalo, duração, lacunas) e avisa sobre registros curtos. O status de saída { "0" } significa completo e legível; { "1" } lista o que corrigir. <b>Não pontua os dados, não valida uma linha nem promete que serão usados.</b>

seg-7dd95552a6fb = <b>Um pré-registro, antes de qualquer execução pontuada.</b> Para cada linha, um documento em <c1/> fixa, e é versionado antes de os dados serem executados: a linha, o SHA-256 do arquivo de dados, qual parte dos dados é reservada (nada ajustado pode vê-la), a métrica e o limiar. Para cartões de relógio, o modelo existente é a predição reservada usada para os registros do IGS e de receptores: ajustar no primeiro terço do registro, prever o desvio de Allan do restante e exigir que a razão entre previsto e medido esteja dentro de um fator declarado em todo tempo de média ajustado. Um limiar nunca é afrouxado após uma execução.

seg-10dc9f8cf394 = <b>Uma execução pontuada.</b> O resultado, com todos os números e todas as falhas, é publicado com o comando e o commit, e um teste o fixa. Uma falha é uma constatação, não um fracasso a esconder: a linha permanece MODELLED e a página o diz.

seg-e5704c43a6b8 = <b>A decisão sobre o registro é do responsável</b>, por escrito, no commit que altera a linha. O texto da referência independente de uma linha promovida nomeia o conjunto de dados, sua licença e crédito, o que foi comparado e o que não foi.

seg-6d467ffb4199 = Crédito e direitos

seg-e82f31e7d9cc = Os dados continuam sendo seus sob a licença que você declarar. <c1/> e <c2/> mantêm o arquivo fora do repositório.

seg-156499ebc142 = Um envio <c1/> é creditado pela linha de atribuição que você fornecer, no texto da referência independente da linha e no arquivo de resultado.

seg-a5c01115d23a = Nada é publicado em seu nome sem o seu consentimento por escrito; uma organização nomeada como fonte é citada como fonte, nunca como quem dá aval. Nenhuma alegação de aprovação ou de aval é feita por um parceiro ou a seu respeito.

seg-6c9ed423e51d = Você pode retirar um envio antes de seu resultado ser publicado. Depois disso o resultado permanece como registrado; se você retirar a licença dos dados, o arquivo é removido do repositório e o hash e as pontuações permanecem.

seg-2cc3c091ba0f = O Kshana não transmite nada e não aciona nenhum hardware. Um envio são arquivos que entram e um relatório que sai.

seg-01b0ee9973dc = Divulgação

seg-b5cb4dc0493f = Uma nota de uma página para um laboratório está redigida para o responsável em <s1><c1/></s1>. É um rascunho: nada é enviado e ninguém é contatado até que o responsável decida.

seg-83b30e1ca261 = <s1>Anterior</s1>Pacotes de evidências

seg-09c0b5fa6e52 = <s1>Próximo</s1>Enlaces ópticos através da atmosfera
