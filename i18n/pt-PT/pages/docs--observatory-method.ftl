# docs--observatory-method: translations (pt-PT)

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
seg-d0e1d6cadc10 = Versão <c1/>, construída sobre <c2/>. Apenas consultivo: isto é uma descrição do aspeto que os relatórios de posição publicados tinham em dias passados, não uma medição de nenhum recetor, uma previsão, uma confirmação de interferência nem uma atribuição da sua causa.

# text
seg-c5eab49b8d6f = O que o observatório publica

# text
seg-165ae7646608 = Um produto por dia UTC e região, a partir de um arquivo aberto de posições de aeronaves. Cada célula de uma grelha fixa de latitude-longitude de 0.5 graus está num de <b>três estados</b>:

# text
seg-cc07647eb12e = Uma proporção elevada das aeronaves amostradas na célula comunicou baixa exatidão de navegação nesse dia, claramente acima do fundo desse dia.

# text
seg-3e1dd7caaee6 = Foram amostradas aeronaves suficientes e a proporção não satisfez a regra.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Os dados não permitiram uma decisão. Isto <b>não</b> é «livre». Cada célula publicada deste tipo traz um motivo de dados: <c1/>, <c2/> ou <c3/>. Uma célula sem nenhuma entrada foi vista por menos de { "5" } aeronaves distintas e é retida.

# text
seg-e49e05b47061 = Mais nada é publicado: nenhuma causa, nenhum agente, nenhum registo por aeronave. Os motivos descrevem se os dados do dia foram suficientes, nunca por que razão a exatidão foi baixa.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Três ficheiros por dia (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: as células, com <c2/> <c3/>, o método e os seus parâmetros pré-registados, a licença e a atribuição, a regra de divulgação e um aviso.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: as mesmas células como imagem (degradada, não degradada, não observada a tracejado; as células vazias não foram observadas). Blocos de texto no ficheiro repetem o aviso e a licença.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. As células degradadas contíguas (diagonais incluídas) formam um incidente com uma caixa delimitadora e as suas células. <c4/> é o texto fixo <c5/>. O ficheiro é uma entrada para um ciclo de comunicar, confirmar e notificar (o ciclo de comunicação da aviação que termina num NOTAM); não é uma confirmação e não é um NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = e um <c1/> com a contagem de bytes e o SHA-256 dos três ficheiros, o identificador do método, os contadores de entrada (linhas lidas e excluídas) e o bloco do conjunto de dados, de modo que um produto possa ser verificado e reproduzido.

# text
seg-d7bb390fb986 = Regras de divulgação (impostas pelo comando)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Pelo menos { "24" } h de atraso.</b> O produto de um dia é divulgado o mais cedo no fim desse dia UTC mais <c1/> ({ "24" } ou mais; um valor menor é recusado). O comando recusa um dia que ainda não seja publicável e indica a hora mais cedo possível. Não existe nenhum interruptor para o encurtar.

# text
seg-43960c3f9b6c = Células grosseiras.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> abaixo de { "0.5" } é recusado.

# text
# c1: null
seg-e70d8d7f9980 = <b>Supressão.</b> Uma célula vista por menos de { "5" } aeronaves distintas não é publicada; uma contagem abaixo de { "5" } é <c1/> (zero incluído), como no método de base.

# text
seg-ab75582c5032 = <b>Sem atribuição de causa.</b> O vocabulário de estados e motivos não tem causa; um teste afirma-o.

# text
seg-0e7d76d7efd0 = <b>Fontes.</b> Apenas adsb.lol (ODbL { "1.0" }), ou um conjunto de dados do utilizador com a sua própria licença. <b>Os dados da OpenSky Network são recusados</b> (a sua licença não permite a utilização comercial nem a redistribuição de mapas derivados). ADS-B e AIS nunca são combinados.

# text
seg-dc28848046ac = <b>Licença do produto.</b> Um ficheiro ADS-B por célula feito a partir de adsb.lol é uma Derived Database e inclui a ODbL { "1.0" } e a atribuição a adsb.lol no ficheiro. O código do Kshana continua a ser AGPL-3.0.

# text
seg-9eeba6648fec = A observável e o método de base

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Uma aeronave ADS-B comunica a exatidão com que considera que a sua própria posição GNSS é conhecida: <b>NACp</b> (Navigation Accuracy Category for Position, um limite horizontal a { "95" } % de { "10" } NM até menos de { "3" } m) e <b>NIC</b> (Navigation Integrity Category, um raio de contenção). O método de base (<c1/>, <c2/>) conta, por célula e por dia, a proporção de <b>aeronaves distintas</b> cujas comunicações dentro da célula tiveram maioritariamente baixa exatidão, com salvaguardas: apenas acima de { "5,000" } ft de altitude; uma aeronave só conta se tiver comunicado boa exatidão noutro local no mesmo dia (uma linha de base do equipamento); a proporção da célula tem de exceder a proporção mediana das células desse dia por uma margem; um dia cuja mediana seja ela própria elevada é marcado como confundido e nenhuma célula é declarada degradada. Os parâmetros foram fixados a partir das definições dos campos e da regra de privacidade antes de qualquer dado ser examinado, e estão escritos em todos os ficheiros de saída. O observatório acrescenta o vocabulário de três estados, as regras de publicação e os ficheiros acima, e não altera nenhum parâmetro.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Execuções regionais.</b> Com <c1/>, apenas são lidas as comunicações dentro da caixa. A linha de base do equipamento e o fundo do dia são então calculados apenas a partir das comunicações da caixa, e o ficheiro di-lo (<c2/>). Um produto regional é, por isso, um produto dos dados dessa região, e não um recorte de um produto global.

# text
seg-2e7007b56a44 = Relação com o método NACp versus HDOP do almanaque

# text
seg-4892485e534b = Pleninger, Topkova e Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } a { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, comparam o erro de posição implícito no NACp de uma aeronave com o HDOP (horizontal dilution of precision) da constelação GPS a partir de dados do almanaque, e assinalam uma aeronave como afetada quando os dois discordam; o artigo avalia o método em experiências deliberadas de jamming de GPS.

# text
seg-74ec1aca8a22 = <b>O que utilizámos.</b> Apenas o resumo publicado e o registo bibliográfico. O texto integral não estava disponível para nós (acesso pago), pelo que não conhecemos nem o seu mapeamento de NACp para uma estimativa de erro, nem o seu cálculo do HDOP, nem os seus limiares, e não afirmamos reproduzi-los.

# text
seg-4f8471649a07 = <b>O que o observatório faz em alternativa.</b> A pergunta a que a comparação com o almanaque responde é "poderá a geometria da constelação, por si só, explicar esta baixa exatidão?". O método de base responde a uma pergunta relacionada sem almanaque: uma proporção baixa tem de se destacar do fundo do mesmo dia em toda a região e das boas comunicações da própria aeronave noutros locais. É um substituto diferente e mais fraco: não consegue dizer que uma hora de geometria tranquila esteve degradada quando o fundo do dia também é baixo. Um avaliador de HDOP do almanaque <b>não está implementado</b>. É um ponto em aberto, a construir a partir do texto integral do artigo e do almanaque GPS público e a pré-registar antes de ser executado; até lá, é citado, não afirmado.

# text
seg-e9b9902633af = Reproduzir um produto

# text
seg-95e48f0286d9 = O pipeline é determinista em tudo o que publica (o sal do identificador, por execução, apenas altera hashes internos que nunca são escritos). Os valores SHA-256 do manifesto permitem comparar uma segunda execução byte a byte.

# text
seg-65236a42e316 = Estudo de sensibilidade

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> reexecuta as comunicações de um dia sob alterações, uma de cada vez, de todos os parâmetros pré-registados (dois valores cada, mais uma grelha de { "1.0" } grau) e indica, por variante, o número de células degradadas, não degradadas e não observadas, o índice de Jaccard do conjunto degradado com o registado, as células cujo estado mudou e a área degradada. Não altera nada na regra registada: uma variante não é uma alternativa validada, e uma grande alteração sob um parâmetro indica o quanto a decisão depende desse parâmetro, não qual é o valor certo. Os resultados do catálogo retrospetivo estão em <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Cobertura.</b> O adsb.lol depende de recetores voluntários; o mar aberto e o espaço aéreo pouco coberto são esparsos, e <c1/> é frequente aí. Um mapa mostra a cobertura da sua fonte.

# text
seg-e3921e1eb177 = <b>O que significa baixa exatidão.</b> O NACp e o NIC descem por razões que não a interferência: falhas de satélites ou de aumentação, meteorologia espacial, avarias de recetores ou de transponders, e geometria. Nenhum estado implica uma causa.

# text
seg-e5ad0dc456c0 = <b>As aeronaves que permanecem durante todo o dia numa região afetada</b> não têm linha de base fora dela e não são contadas, pelo que o método subestima um efeito regional persistente. O estudo de sensibilidade mostra o efeito da salvaguarda da linha de base.

# text
seg-a2d41becc19b = <b>Os limites do dia</b> são em UTC; um evento que atravesse a meia-noite é dividido entre dois dias.

# text
seg-436af9f16feb = <b>Sem verdade de referência.</b> O observatório não tem nenhuma referência independente externa: todos os valores são MODELLED, e nenhuma linha da matriz de verificação assenta nele.

# text
seg-5c4966f0166d = <b>Sensibilidade do tema.</b> Os mapas deste tipo são politicamente sensíveis. O observatório enuncia um método, um atraso e um vocabulário, e nada mais; não nomeia Estados nem atores, e não publica em tempo real.

# text
seg-874f46a80c8b = <s1>Anterior</s1>Protocolos de recetor lidos

# text
seg-3137b7595e59 = <s1>Seguinte</s1>Observatório de interferência: resultados
