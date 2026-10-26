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
