# docs--observatory-results: translations (pt-PT)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Fonte: <c1/>

# text
seg-df5b53307f50 = Resultados do observatório: catálogo retrospetivo de 30 dias do Báltico e estudo de sensibilidade

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Versão <c1/> sobre <c2/> (parâmetros pré-registados no método de base, inalterados). MODELLED: não há referência independente externa, nem verdade de referência, nem atribuição de causa. Uma célula degradada significa que uma elevada proporção das aeronaves amostradas aí comunicou baixa exatidão de navegação nesse dia; não diz porquê. Uma célula que não é observada, ou que está ausente, não foi avaliada, o que não é o mesmo que estar livre.

# text
seg-0d1eeedcab3a = O que foi executado

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Fonte:</b> histórico readsb do adsb.lol (ODbL { "1.0" }), versão <c1/> do GitHub de <c2/>, obtida por <c3/> uma parte de cada vez (cerca de { "3.4" } GB por dia, { "2" } partes). O editor não indica somas de verificação, pelo que o SHA-256 de cada parte fica registado em <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Região e dias:</b> a caixa { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (sul, oeste, norte, este: o mar Báltico e as suas costas), { "30" } dias UTC de 2026-09-15 a 2026-10-14, células de { "0.5" } grau, por <c1/> (um dia de cada vez, ficheiros em bruto eliminados após cada dia).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Regras de publicação:</b> o dia mais recente (2026-10-14) tinha mais de { "24" } h decorridas desde o seu fim quando foi produzido; caso contrário, o comando recusa. As execuções regionais calculam a linha de base do equipamento e o fundo do dia apenas a partir das comunicações da caixa (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Ficheiros:</b> os { "120" } ficheiros de produto (GeoJSON, PNG, JSON de incidentes, manifesto por dia) <b>não estão no git</b>. O hash de cada ficheiro está em <c1/>, e um dia pode ser reconstruído a partir do seu arquivo e comparado.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Exemplo do que um dia lê: em 2026-09-15 o arquivo continha { "110,619,797" } linhas de posição em { "79,826" } ficheiros de trajetória; { "103.0" } milhões estavam fora da caixa, { "5.6" } milhões não eram ADS-B, { "1.2" } milhões estavam no solo ou abaixo de { "5,000" } ft, { "0.6" } milhões não tinham campo de exatidão, e { "212,426" } foram agregadas (contadores de entrada de <c1/>).

# text
seg-cc590aa74075 = Três dias (2026-09-18, 2026-09-26, 2026-10-03) foram obtidos de novo do arquivo e executados uma segunda vez: o GeoJSON, o PNG e o ficheiro de incidentes são <b>idênticos byte a byte</b> aos da primeira execução (SHA-256 igual), pelo que o produto é determinista, embora o sal do hash do identificador seja aleatório em cada execução.

# text
seg-3532be519183 = Resumo do catálogo retrospetivo

# text
seg-56aae646318e = Dia UTC

# text
seg-42784010b115 = células publicadas

# text
seg-2672b7f55371 = degradadas

# text
seg-378ee89e4bd3 = não degradadas

# text
seg-14783d89f2fe = não observadas (publicadas)

# text
seg-711d143678ae = incidentes

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } dias: { "96" } células degradadas no total, { "28" } dos { "30" } dias com pelo menos uma, { "70" } incidentes (grupos de células degradadas contíguas), nenhum dia com um efeito em todo o dia. A proporção mediana de aeronaves afetadas por célula (o fundo do dia) é { "0" } em { "29" } dias e { "0.006" } num, pelo que a salvaguarda do fundo (uma célula tem de exceder o fundo em { "0.15" }) nunca alterou uma decisão nesta região. O número de células degradadas por dia vai de { "0" } a { "8" } (média { "3.2" }). Cerca de um terço das células publicadas em cada dia é <c1/> (poucas aeronaves amostradas): a cobertura é o limite deste produto, não o céu.

# text
seg-606aed861c95 = O que isto não diz: os dias com mais células degradadas não são "piores" em nenhum sentido físico, uma área afetada persistente seria subestimada (as aeronaves que voam apenas dentro dela durante todo o dia não têm linha de base fora dela e não são contadas), e nada aqui diz quem ou o que causou a baixa exatidão.

# text
seg-ef37626a4c47 = Estudo de sensibilidade (três dias)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> reexecuta as comunicações registadas de um dia sob alterações, uma de cada vez, dos parâmetros registados (dois valores cada, mais uma grelha de { "1.0" } grau). Dias: 2026-09-18 (o maior número de células degradadas, { "8" }), 2026-09-26 ({ "1" } célula degradada) e 2026-10-03 ({ "0" }). Relatórios completos: <c2/> ({ "23" } variantes cada; { "2.2" }, { "1.7" } e { "1.7" } milhões de linhas reexecutadas). Células degradadas em cada variante (valor registado entre parênteses; o resultado registado é { "8" }, { "1" } e { "0" } células degradadas):

# text
seg-dfced7e594d2 = parâmetro (registado)

# text
seg-2ac3e771679d = valor

# text
seg-0953dbfd76db = grelha de { "0.5" } graus

# text
seg-bf5746d1a110 = { "2" } (células maiores)

# text
seg-e4016df2fcd3 = A leitura, sem escolher um vencedor:

# text
seg-81cfcbf0de89 = As decisões são sensíveis aos limiares dos códigos de exatidão e às regras de amostragem, e as contagens pequenas variam muito.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> e <c3/> alteram cada um o número de células degradadas por um fator de dois ou mais em todos os dias; relaxar <c4/> para { "6" } transforma { "1" } célula degradada em { "12" } em 09-26 (Jaccard com o conjunto registado { "0.08" }). Em 09-18, subir <c5/> para { "0.4" } mantém { "1" } das { "8" } (Jaccard { "0.125" }). Uma decisão sobre uma célula próxima dos limiares é uma afirmação sobre os limiares tanto quanto sobre os dados.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> move sobretudo células entre não degradadas e não observadas</b>: em 09-18 deixa o número de degradadas em { "8" } enquanto { "21" } a { "56" } células mudam de estado.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Três salvaguardas estão inativas aqui</b>: <c1/>, <c2/> e <c3/> não alteram nada em nenhum dos três dias (a proporção do fundo é { "0" }), pelo que esta região e este período nada dizem sobre o seu bom funcionamento. Seriam relevantes onde um efeito regional eleve o fundo.

# text
seg-7ba403b84fbd = <b>Uma grelha mais grosseira ({ "1.0" } grau) altera o quadro</b> ({ "2" }, { "3" } e { "1" } células degradadas; as células publicadas descem para cerca de um terço, { "226" } contra { "694" } em 09-18, porque cada célula é quatro vezes maior): o tamanho da célula é uma escolha de método, e o observatório fixa-o em { "0.5" } graus.

# text
# c1: low_nic_max
seg-4db2f5313410 = Um dia sem nenhuma célula degradada registada (10-03) tem células degradadas em { "9" } das { "22" } variantes sem grelha (até { "8" } com <c1/> { "6" }): "nenhuma célula degradada" é também uma afirmação dependente de limiares.

# text
seg-a818be844f3a = Nenhuma variante é uma alternativa validada, e a regra registada não é alterada por este estudo. O estudo não diz quais são os valores certos dos parâmetros.

# text
seg-98c799bfbc25 = <s1>Anterior</s1>Observatório de interferência: método

# text
seg-5d0c003e73dc = <s1>Seguinte</s1>kshana-bench
