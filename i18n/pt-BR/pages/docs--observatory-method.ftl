# docs--observatory-method: translations (pt-BR)

# text
seg-0857a94a948e = Limites

# text
seg-2247a2344710 = Significado

# text
seg-b652b86e6b8e = Estado

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Fonte: <c1/>

# text
seg-48e063b567d0 = Observatório de interferência: nota de método

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Versão <c1/>, construída sobre <c2/>. Apenas consultivo: esta é uma descrição de como os relatos de posição publicados se mostravam em dias passados, não uma medição de qualquer receptor, uma previsão, uma confirmação de interferência nem uma atribuição de sua causa.

# text
seg-c5eab49b8d6f = O que o observatório publica

# text
seg-165ae7646608 = Um produto por dia UTC e por região, a partir de um único arquivo aberto de posições de aeronaves. Cada célula de uma grade fixa de latitude-longitude de 0,5 grau está em um de <b>três estados</b>:

# text
seg-cc07647eb12e = Uma parcela alta das aeronaves amostradas na célula relatou baixa precisão de navegação naquele dia, claramente acima do fundo daquele dia.

# text
seg-3e1dd7caaee6 = Houve aeronaves amostradas em número suficiente e a parcela não atingiu a regra.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Os dados não permitiram um veredito. Isto <b>não</b> é "limpo". Cada célula publicada nessa situação traz um motivo de dados: <c1/>, <c2/> ou <c3/>. Uma célula sem nenhuma entrada foi vista por menos de { "5" } aeronaves distintas e é omitida.

# text
seg-e49e05b47061 = Nada mais é publicado: nenhuma causa, nenhum ator, nenhum registro por aeronave. Os motivos descrevem se os dados do dia eram suficientes, nunca por que a precisão estava baixa.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Três arquivos por dia (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: as células, com <c2/> <c3/>, o método e seus parâmetros de pré-registro, a licença e a atribuição, a regra de liberação e um aviso.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: as mesmas células como imagem (degraded, not degraded, not observed hachurado; células vazias não foram observadas). Blocos de texto no arquivo repetem o aviso e a licença.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Células degraded contíguas (diagonais incluídas) formam um incidente, com uma caixa delimitadora e suas células. <c4/> é o texto fixo <c5/>. O arquivo é uma entrada para um ciclo de relatar, confirmar e notificar (o ciclo de notificação da aviação que termina em um NOTAM); não é uma confirmação e não é um NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = e um <c1/> com a contagem de bytes e o SHA-256 dos três arquivos, o id do método, os contadores de entrada (linhas lidas e excluídas) e o bloco do conjunto de dados, de modo que um produto possa ser verificado e reproduzido.

# text
seg-d7bb390fb986 = Regras de liberação (impostas pelo comando)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Atraso de pelo menos { "24" } h.</b> O produto de um dia é liberado no mínimo ao fim desse dia UTC mais <c1/> ({ "24" } ou mais; um valor menor é recusado). O comando recusa um dia que ainda não pode ser publicado e informa o horário mais cedo possível. Não há opção para encurtar esse prazo.

# text
seg-43960c3f9b6c = Células grosseiras.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> abaixo de { "0.5" } é recusado.

# text
# c1: null
seg-e70d8d7f9980 = <b>Supressão.</b> Uma célula vista por menos de { "5" } aeronaves distintas não é publicada; uma contagem abaixo de { "5" } é <c1/> (zero incluído), como no método básico.

# text
seg-ab75582c5032 = <b>Sem atribuição.</b> O vocabulário de estados e motivos não tem causa; um teste afirma isso.

# text
seg-0e7d76d7efd0 = <b>Fontes.</b> Apenas adsb.lol (ODbL { "1.0" }) ou um conjunto de dados do usuário com licença própria. <b>Dados da OpenSky Network são recusados</b> (sua licença não permite uso comercial nem redistribuição de mapas derivados). ADS-B e AIS nunca são combinados.

# text
seg-dc28848046ac = <b>Licença do produto.</b> Um arquivo ADS-B por célula feito a partir do adsb.lol é um Derived Database e traz a ODbL { "1.0" } e a atribuição ao adsb.lol no arquivo. O código do Kshana continua AGPL-3.0.

# text
seg-9eeba6648fec = O observável e o método básico

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Uma aeronave ADS-B informa o quão precisa ela acredita ser sua própria posição GNSS: <b>NACp</b> (Navigation Accuracy Category for Position, um limite horizontal de { "95" } % de { "10" } NM até menos de { "3" } m) e <b>NIC</b> (Navigation Integrity Category, um raio de contenção). O método básico (<c1/>, <c2/>) conta, por célula e dia, a parcela de <b>aeronaves distintas</b> cujos relatos dentro da célula foram em sua maioria de baixa precisão, com salvaguardas: apenas altitude acima de { "5,000" } ft; uma aeronave só conta se tiver relatado boa precisão em outro lugar no mesmo dia (uma linha de base do equipamento); a parcela da célula deve superar a mediana das parcelas das células do dia por uma margem; um dia cuja mediana já é alta é marcado como confundido e nenhuma célula é declarada degraded. Os parâmetros foram fixados a partir das definições dos campos e da regra de privacidade antes de qualquer dado ser examinado, e estão gravados em todo arquivo de saída. O observatório acrescenta o vocabulário de três estados, as regras de liberação e os arquivos acima, e não altera nenhum parâmetro.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Execuções regionais.</b> Com <c1/>, apenas os relatos dentro da caixa são lidos. A linha de base do equipamento e o fundo do dia são então calculados somente a partir dos relatos da caixa, e o arquivo informa isso (<c2/>). Um produto regional é, portanto, um produto dos dados daquela região, não um recorte de um produto global.

# text
seg-2e7007b56a44 = Relação com o método NACp versus HDOP do almanaque

# text
seg-4892485e534b = Pleninger, Topkova e Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } a { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, comparam o erro de posição implícito no NACp de uma aeronave com o HDOP (horizontal dilution of precision, diluição horizontal da precisão) da constelação GPS obtido de dados de almanaque, e sinalizam uma aeronave como afetada quando os dois divergem; o artigo avalia o método em experimentos de jamming deliberado de GPS.

# text
seg-74ec1aca8a22 = <b>O que usamos.</b> Apenas o resumo publicado e o registro bibliográfico. O texto completo não estava disponível para nós (acesso pago), de modo que não conhecemos nem seu mapeamento de NACp para uma estimativa de erro, nem seu cálculo de HDOP, nem seus limiares, e não afirmamos reproduzi-los.

# text
seg-4f8471649a07 = <b>O que o observatório faz em vez disso.</b> A pergunta que a comparação com o almanaque responde é "a geometria da constelação, por si só, poderia explicar essa baixa precisão?". O método básico responde a uma pergunta relacionada sem almanaque: uma parcela baixa deve se destacar em relação ao fundo do mesmo dia na região e em relação aos próprios bons relatos da aeronave em outros lugares. Esse é um substituto diferente e mais fraco: ele não pode dizer que uma hora de geometria tranquila foi degraded onde o fundo do dia também é baixo. Um avaliador de HDOP por almanaque <b>não está implementado</b>. É um item em aberto, a ser construído a partir do texto completo do artigo e do almanaque GPS público e pré-registrado antes de ser executado; até lá ele é citado, não afirmado.

# text
seg-e9b9902633af = Reproduzindo um produto

# text
seg-95e48f0286d9 = O pipeline é determinístico em tudo o que publica (o salt do identificador por execução altera apenas hashes internos, que nunca são gravados). Os valores SHA-256 do manifesto permitem comparar uma segunda execução byte a byte.

# text
seg-65236a42e316 = Estudo de sensibilidade

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> reexecuta os relatos de um dia sob alterações, uma de cada vez, de cada parâmetro pré-registrado (dois valores cada, mais uma grade de { "1.0" } grau) e informa, por variante, o número de células degraded, not degraded e not observed, o índice de Jaccard do conjunto degraded com o conjunto registrado, as células cujo estado mudou e a área degraded. Ele não altera nada na regra registrada: uma variante não é uma alternativa validada, e uma grande mudança sob um parâmetro mostra o quanto o veredito depende desse parâmetro, não qual valor está certo. Os resultados do catálogo retrospectivo estão em <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Cobertura.</b> O adsb.lol segue receptores voluntários; o mar aberto e o espaço aéreo pouco coberto são esparsos, e <c1/> é comum ali. Um mapa mostra a cobertura da sua fonte.

# text
seg-e3921e1eb177 = <b>O que significa baixa precisão.</b> NACp e NIC caem por razões que não são interferência: falhas de satélite ou de aumentação, clima espacial, falhas de receptor ou de transponder e geometria. Nenhum estado implica uma causa.

# text
seg-e5ad0dc456c0 = <b>Aeronaves que permanecem o dia todo em uma região afetada</b> não têm linha de base fora dela e não são contadas, de modo que o método subestima um efeito regional persistente. O estudo de sensibilidade mostra o efeito da salvaguarda da linha de base.

# text
seg-a2d41becc19b = <b>Os limites do dia</b> são em UTC; um evento que cruza a meia-noite é dividido entre dois dias.

# text
seg-436af9f16feb = <b>Sem verdade de referência.</b> O observatório não tem referência independente externa: toda cifra é MODELLED, e nenhuma linha da matriz de verificação se apoia nele.

# text
seg-5c4966f0166d = <b>Sensibilidade do tema.</b> Mapas desse tipo são políticos. O observatório declara um método, um atraso e um vocabulário, e nada mais; não nomeia Estados nem atores, e não publica em tempo real.

# text
seg-874f46a80c8b = <s1>Anterior</s1>Protocolos de receptor lidos

# text
seg-3137b7595e59 = <s1>Próximo</s1>Observatório de interferência: resultados
