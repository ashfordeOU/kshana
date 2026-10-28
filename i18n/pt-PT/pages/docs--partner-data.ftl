# docs--partner-data: translations (pt-PT)

# text
seg-2247a2344710 = Significado

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-a349aa76b0ed = PARTNER

# attr:title
seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
seg-7338b6210228 = Linha

# text
seg-c5ce76c91ff7 = Etiqueta

# text
# c1: docs/PARTNER-DATA.md
seg-3a04afee76ec = Fonte: <c1/>

# text
seg-e6d8549f24b9 = Dados de parceiros: o que os dados medidos poderiam promover numa linha MODELLED

# text
seg-7b9ff34db2c4 = O Kshana etiqueta cada capacidade num registo verificado por máquina (<a1>matriz de verificação</a1>). A maioria das linhas de temporização e de sensores é <b>MODELLED</b>: apoia-se em modelos declarados, folhas de dados publicadas e verificações internas, e nenhum registo medido da classe de dispositivo foi comparado com elas. Quem tem esse registo pode mudar isso. Esta página diz quais linhas, o que enviar, como um envio é verificado, como é pontuado e como é creditado. Foi escrita para um laboratório, um fabricante ou um grupo universitário; não é uma oferta de trabalho e não alega aval de ninguém. Apenas consultivo: o Kshana é um instrumento de estudo, não um equipamento de navegação ou de temporização homologado.

# text
seg-1cf5536037d4 = O que significam as etiquetas

# text
seg-5f43f341fa27 = uma referência independente externa concorda com a capacidade sob um limiar fixado antes da comparação. Um registo medido de um parceiro pode ser essa referência para a subafirmação que ele cobre; os invariantes da matriz proíbem a etiqueta sem uma

# text
seg-0d182b8c7430 = internamente consistente e dito em voz alta; nenhuma referência independente externa cobre a afirmação. Uma linha MODELLED que é comparada com dados medidos e não atinge o limiar permanece MODELLED, e a falha é publicada

# text
seg-8a45367544a0 = uma disciplina de que a execução depende, que um parceiro de hardware possui e que o Kshana não fornece, por exemplo os valores que descrevem o relógio ou o interferómetro do próprio parceiro. O Kshana modela o que tal dispositivo faria a uma cadeia de navegação ou de temporização; não dá garantias sobre o dispositivo

# text
seg-553a1db0e11d = Um envio pode mover uma linha para VALIDATED apenas para a afirmação que os dados de facto testam, e apenas se a comparação atingir o seu limiar. Não pode tornar os valores próprios de um dispositivo algo de que o Kshana possa dar garantia: esses permanecem do parceiro (PARTNER). Se a etiqueta de uma linha muda é decisão do responsável, registada no commit que a altera, com o texto da referência independente a dizer exatamente o que foi comparado com o quê.

# text
seg-bac61cc47097 = Linhas que os dados de um parceiro poderiam promover

# text
# c1: requirement
seg-bd4f5d3f9399 = Cada linha abaixo é o texto <c1/> exato de uma linha MODELLED da matriz (um teste mantém esta página e a matriz em sincronia). "Poderia mudar" diz o que uma comparação fixada antecipadamente com dados medidos apoiaria se o limiar for atingido; nunca é uma promessa.

# text
seg-fb5ceb1d62f0 = Dados que a testariam

# text
seg-812eae6bbea9 = Poderia mudar

# text
seg-f46d009d9380 = um registo de dias de um relógio de uma classe nomeada, em funcionamento livre após a sua última disciplina, comparado com uma referência melhor, com intervalo de amostragem de um minuto ou menos

# text
seg-2a73fc59a03d = os pisos de ruído vermelho por classe que limitam os valores de holdover permanecem MODELLED hoje; uma estabilidade medida em tempos de média longos poderia ser comparada com o piso dessa classe, apenas para essa classe

# text
seg-abe6b657ce1b = o desvio de Allan medido, como tabela ou como registo de fase, do relógio ou do interferómetro atómico de um parceiro

# text
seg-6ba2b7faa909 = os valores do estudo de compromisso quantificam (nunca validam) o dispositivo do parceiro, de modo que seriam etiquetados como valores do parceiro (PARTNER); a ingestão de dados de Allan medidos num modelo de ruído já está confrontada com um resolvedor independente

# text
seg-ad537759d084 = um registo de fase de um oscilador de um dos quatro modelos predefinidos, ao longo de pelo menos um dia

# text
seg-44a55f6ebef6 = se o modelo de ruído derivado da folha de dados da predefinição reproduz a estabilidade de uma unidade medida nos próprios tempos de média da folha de dados

# text
seg-3da5a93abde6 = um registo de fase de uma classe de relógio ainda sem cartão (um OCXO, um rubídio, um césio, um maser, um relógio ótico)

# text
seg-72f248aa4438 = um cartão ajustado no primeiro terço e que prevê o desvio de Allan do restante dentro do fator fixado antecipadamente, como já feito para relógios de satélites GNSS e um recetor

# text
seg-54971e473811 = um registo de uma instalação real (qualquer versão do daemon) com as próprias linhas de resumo do daemon

# text
seg-bccf188b7636 = os leitores foram construídos a partir de layouts de linha e ficheiros de teste públicos; um registo real comparado com um leitor independente seria a primeira verificação externa

# text
seg-e83b73ab2d5d = uma exportação de um contador real ou de um software de análise

# text
seg-80b69f559ea5 = o mesmo, para esses formatos

# text
seg-0c279732d132 = um teste real de holdover: o registo, os momentos em que o operador retirou e restaurou a referência, e os próprios veredictos de MTIE, TDEV e máscara do laboratório a partir do seu software de análise

# text
seg-cfad71161af0 = um cálculo independente das mesmas grandezas para comparar com o do motor

# text
seg-97c65b646eae = um registo estacionário de uma unidade inercial cujos parâmetros de ruído são publicados ou medidos por outra pessoa

# text
seg-77f9d22ec624 = o ajuste recuperado dentro de um fator declarado dos parâmetros independentes

# text
seg-c9544eadc55d = um registo estático ou os parâmetros de ruído do sensor inercial de átomos frios de um parceiro

# text
seg-062dd193ab20 = os valores do dispositivo são do parceiro (PARTNER); o orçamento de erro de posição que os compõe permanece um modelo do Kshana

# text
seg-078be7f5769f = Comece pelas duas primeiras: elas decidem se os pisos de holdover por classe e o estudo de compromisso quântico versus clássico assentam em algum dado medido próprio.

# text
seg-c325655738e0 = O que enviar

# text
# c1: kshana.partner-submission/1
# c2: examples/partner-submission/submission.toml
seg-ca24fa511ffe = Um envio são dois ficheiros numa pasta: os dados e uma pequena descrição deles, um ficheiro TOML (<c1/>; um exemplo prático, inventado, é <c2/>).

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-a3e30cf27adb = <b>Dados de relógio.</b> Um dos formatos que o Kshana lê (veja os <a1>formatos de registo de relógio</a1>): registos TICC da TAPR, fase ou frequência ASCII no estilo TimeLab, RINEX clock, registos <c1/>, <c2/> e <c3/> do linuxptp, registos de seguimento e de estatísticas do chrony. A fase é preferida à frequência; declare as unidades e o intervalo de amostragem. Forneça o registo ininterrupto mais longo que tiver: a estabilidade em tempos de média longos precisa de dias, e um registo com menos de um dia é aceito, mas com aviso.

# text
# c1: t_s, gx, gy, gz, ax, ay, az
seg-a14b0c961637 = <b>Dados inerciais.</b> Um CSV de colunas nomeadas (<c1/>, rad/s e m/s^{ "2" }) ou o layout EuRoC, de um dispositivo estacionário, longo o bastante para o ajuste (pelo menos { "2000" } amostras; horas é melhor).

# text
seg-a1f2cd79bcc0 = <b>A descrição</b> diz, e o verificador confere onde pode:

# text
seg-cfeee5da56d7 = o tipo de organização (um tipo como "um laboratório nacional de temporização", não um nome; um nome é opcional e apenas para crédito);

# text
# c1: other
seg-4bd30d68101c = o dispositivo (tipo, classe e um modelo para a classe <c1/>);

# text
seg-e8222178a0ee = como os dados foram obtidos: com o que foram comparados, o instante inicial (UTC), o ambiente, e se são brutos ou processados (e o que foi feito com eles);

# text
seg-7ac28bd566f2 = o SHA-256 do ficheiro de dados, de modo que o ficheiro pontuado é o ficheiro descrito;

# text
seg-0eba30c3a5b8 = as linhas MODELLED às quais é oferecido, pelo texto exato do requisito acima;

# text
# c1: public
# c2: hash-only
# c3: private
seg-dd694deec626 = a licença (um identificador SPDX ou palavras) e como os dados podem ser usados no repositório: <c1/> (incluídos, com atribuição), <c2/> (apenas o hash e as pontuações são publicados) ou <c3/> (a pontuação é partilhada somente com quem enviou);

# text
seg-7cea4b7c1df8 = três declarações: é uma medição e não uma simulação, quem envia pode licenciá-la para este uso, e os ficheiros não contêm dados pessoais.

# text
seg-caa6696f3f5f = <b>O que não enviar.</b> Qualquer coisa pessoal ou com dados de contacto (o verificador recusa um endereço de e-mail ou número de telefone na descrição), qualquer coisa sob controlo de exportação ou restrita por acordo, e qualquer dado simulado apresentado como medido.

# text
seg-a2f0067b6da5 = Como um envio é verificado

# text
seg-f1d4c097691e = Formato e metadados, por si ou por nós, antes de qualquer execução.

# text
seg-c3cd90222eaa = Confirma o esquema, os campos obrigatórios, o hash, as regras de licença e atribuição, que as linhas de destino existem e são MODELLED, que os dados são lidos pelo leitor do próprio motor, e indica o que leu (amostras, intervalo, duração, lacunas) e avisa sobre registos curtos. O estado de saída { "0" } significa completo e legível; { "1" } lista o que corrigir. <b>Não pontua os dados, não valida uma linha nem promete que serão usados.</b>

# text
# c1: xval/<name>/
seg-7dd95552a6fb = <b>Um pré-registo, antes de qualquer execução pontuada.</b> Para cada linha, um documento em <c1/> fixa, e é versionado antes de os dados serem executados: a linha, o SHA-256 do ficheiro de dados, qual parte dos dados é reservada (nada ajustado pode vê-la), a métrica e o limiar. Para cartões de relógio, o modelo existente é a predição reservada usada para os registos do IGS e de recetores: ajustar no primeiro terço do registo, prever o desvio de Allan do restante e exigir que a razão entre previsto e medido esteja dentro de um fator declarado em todo tempo de média ajustado. Um limiar nunca é relaxado após uma execução.

# text
seg-10dc9f8cf394 = <b>Uma execução pontuada.</b> O resultado, com todos os números e todas as falhas, é publicado com o comando e o commit, e um teste fixa-o. Uma falha é uma constatação, não um fracasso a esconder: a linha permanece MODELLED e a página di-lo.

# text
seg-e5704c43a6b8 = <b>A decisão sobre o registo é do responsável</b>, por escrito, no commit que altera a linha. O texto da referência independente de uma linha promovida nomeia o conjunto de dados, a sua licença e crédito, o que foi comparado e o que não foi.

# text
seg-6d467ffb4199 = Crédito e direitos

# text
# c1: hash-only
# c2: private
seg-e82f31e7d9cc = Os dados continuam a ser seus, sob a licença que declarar. <c1/> e <c2/> mantêm o ficheiro fora do repositório.

# text
# c1: public
seg-156499ebc142 = Um envio <c1/> é creditado pela linha de atribuição que fornecer, no texto da referência independente da linha e no ficheiro de resultado.

# text
seg-a5c01115d23a = Nada é publicado em seu nome sem o seu consentimento por escrito; uma organização nomeada como fonte é citada como fonte, nunca como quem dá aval. Nenhuma alegação de aprovação ou de aval é feita por um parceiro ou a seu respeito.

# text
seg-6c9ed423e51d = Pode retirar um envio antes de o seu resultado ser publicado. Depois disso o resultado permanece como registado; se o utilizador retirar a licença dos dados, o ficheiro é removido do repositório e o hash e as pontuações permanecem.

# text
seg-2cc3c091ba0f = O Kshana não transmite nada e não aciona nenhum hardware. Um envio são ficheiros que entram e um relatório que sai.

# text
seg-01b0ee9973dc = Divulgação

# text
# c1: docs/drafts/PARTNER-OUTREACH.md
seg-b5cb4dc0493f = Uma nota de uma página para um laboratório está redigida para o responsável em <s1><c1/></s1>. É um rascunho: nada é enviado e ninguém é contactado até que o responsável decida.

# text
seg-83b30e1ca261 = <s1>Anterior</s1>Pacotes de evidências

# text
seg-09c0b5fa6e52 = <s1>Seguinte</s1>Enlaces óticos através da atmosfera
