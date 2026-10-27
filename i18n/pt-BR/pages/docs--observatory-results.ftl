# docs--observatory-results: translations (pt-BR)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Fonte: <c1/>

# text
seg-df5b53307f50 = Resultados do observatório: catálogo retrospectivo de 30 dias no Báltico e estudo de sensibilidade

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Versão <c1/> sobre <c2/> (parâmetros pré-registrados no método básico, inalterados). MODELLED: não há referência independente externa, nem verdade de referência, nem atribuição de causa. Uma célula degraded significa que uma parcela alta das aeronaves amostradas ali relatou baixa precisão de navegação naquele dia; isso não diz por quê. Uma célula not observed, ou ausente, não foi avaliada, o que não é o mesmo que limpa.

# text
seg-0d1eeedcab3a = O que foi executado

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Fonte:</b> histórico readsb do adsb.lol (ODbL { "1.0" }), release do GitHub <c1/> de <c2/>, obtido por <c3/> uma parte por vez (cerca de { "3.4" } GB por dia, { "2" } partes). O publicador não informa checksums, de modo que o SHA-256 de cada parte é registrado em <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Região e dias:</b> a caixa { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (sul, oeste, norte, leste: o mar Báltico e suas costas), { "30" } dias UTC de 2026-09-15 a 2026-10-14, células de { "0.5" } grau, por <c1/> (um dia por vez, arquivos brutos apagados após cada dia).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Regras de liberação:</b> o dia mais recente (2026-10-14) estava a mais de { "24" } h do seu fim quando foi produzido; o comando recusa caso contrário. As execuções regionais calculam a linha de base do equipamento e o fundo do dia somente a partir dos relatos da caixa (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Arquivos:</b> os { "120" } arquivos de produto (GeoJSON, PNG, JSON de incidentes, manifesto por dia) <b>não estão no git</b>. O hash de cada arquivo está em <c1/>, e um dia pode ser reconstruído a partir de seu arquivo de origem e comparado.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Exemplo do que um dia mostra: em 2026-09-15 o arquivo continha { "110,619,797" } linhas de posição em { "79,826" } arquivos de trajetória; { "103.0" } milhões estavam fora da caixa, { "5.6" } milhões não eram ADS-B, { "1.2" } milhão estavam no solo ou abaixo de { "5,000" } ft, { "0.6" } milhão não traziam campo de precisão, e { "212,426" } foram agregadas (contadores de entrada de <c1/>).

# text
seg-cc590aa74075 = Três dias (2026-09-18, 2026-09-26, 2026-10-03) foram obtidos novamente do arquivo de origem e executados uma segunda vez: o GeoJSON, o PNG e o arquivo de incidentes são <b>idênticos byte a byte</b> aos da primeira execução (SHA-256 igual), de modo que o produto é determinístico, embora o salt do hash de identificadores seja aleatório a cada execução.

# text
seg-3532be519183 = Resumo do catálogo retrospectivo

# text
seg-56aae646318e = dia UTC

# text
seg-42784010b115 = células publicadas

# text
seg-2672b7f55371 = degraded

# text
seg-378ee89e4bd3 = not degraded

# text
seg-14783d89f2fe = not observed (publicadas)

# text
seg-711d143678ae = incidentes

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } dias: { "96" } células degraded no total, { "28" } dos { "30" } dias com pelo menos uma, { "70" } incidentes (grupos de células degraded contíguas), nenhum dia com efeito em todo o dia. A parcela mediana de aeronaves afetadas por célula (o fundo do dia) é { "0" } em { "29" } dias e { "0.006" } em um, de modo que a salvaguarda do fundo (uma célula deve superar o fundo em { "0.15" }) nunca alterou um veredito nesta região. A contagem de células degraded por dia vai de { "0" } a { "8" } (média { "3.2" }). Cerca de um terço das células publicadas a cada dia são <c1/> (poucas aeronaves amostradas): a cobertura é o limite deste produto, não o céu.

# text
seg-606aed861c95 = O que isto não diz: os dias com mais células degraded não são "piores" em nenhum sentido físico, uma área afetada persistente seria subestimada (aeronaves que voam só dentro dela o dia todo não têm linha de base fora dela e não são contadas), e nada aqui diz quem ou o que causou a baixa precisão.

# text
seg-ef37626a4c47 = Estudo de sensibilidade (três dias)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> reexecuta os relatos gravados de um dia sob alterações, uma de cada vez, dos parâmetros registrados (dois valores cada, mais uma grade de { "1.0" } grau). Dias: 2026-09-18 (o maior número de células degraded, { "8" }), 2026-09-26 ({ "1" } célula degraded) e 2026-10-03 ({ "0" }). Relatórios completos: <c2/> ({ "23" } variantes cada; { "2.2" }, { "1.7" } e { "1.7" } milhão de linhas reexecutadas). Células degraded sob cada variante (valor registrado entre parênteses; o resultado registrado é { "8" }, { "1" } e { "0" } células degraded):

# text
seg-dfced7e594d2 = parâmetro (registrado)

# text
seg-2ac3e771679d = valor

# text
seg-0953dbfd76db = grade de { "0.5" } grau

# text
seg-bf5746d1a110 = { "2" } (células mais grosseiras)

# text
seg-e4016df2fcd3 = Lendo isso, sem escolher um vencedor:

# text
seg-81cfcbf0de89 = Os vereditos são sensíveis aos limiares dos códigos de precisão e às regras de amostragem, e as contagens pequenas variam muito.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> e <c3/> alteram cada um o número de células degraded por um fator de dois ou mais em todos os dias; relaxar <c4/> para { "6" } transforma { "1" } célula degraded em { "12" } em 09-26 (Jaccard com o conjunto registrado { "0.08" }). Em 09-18, elevar <c5/> a { "0.4" } mantém { "1" } das { "8" } (Jaccard { "0.125" }). Um veredito de célula próximo dos limiares é uma afirmação sobre os limiares tanto quanto sobre os dados.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> move principalmente células entre not degraded e not observed</b>: em 09-18 mantém a contagem de degraded em { "8" } enquanto { "21" } a { "56" } células mudam de estado.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Três salvaguardas estão inativas aqui</b>: <c1/>, <c2/> e <c3/> não alteram nada em nenhum dos três dias (a parcela do fundo é { "0" }), de modo que esta região e este período nada dizem sobre o quão bem elas funcionam. Elas importariam onde um efeito regional eleva o fundo.

# text
seg-7ba403b84fbd = <b>Uma grade mais grosseira ({ "1.0" } grau) muda o quadro</b> ({ "2" }, { "3" } e { "1" } células degraded; as células publicadas caem para cerca de um terço, { "226" } contra { "694" } em 09-18, porque cada célula é quatro vezes maior): o tamanho da célula é uma escolha de método, e o observatório o fixa em { "0.5" } grau.

# text
# c1: low_nic_max
seg-4db2f5313410 = Um dia sem célula degraded registrada (10-03) tem células degraded em { "9" } das { "22" } variantes que não são de grade (até { "8" } com <c1/> { "6" }): "nenhuma célula degraded" também é uma afirmação dependente de limiar.

# text
seg-a818be844f3a = Nenhuma variante é uma alternativa validada, e a regra registrada não é alterada por este estudo. O estudo não diz quais valores de parâmetro estão certos.

# text
seg-98c799bfbc25 = <s1>Anterior</s1>Observatório de interferência: método

# text
seg-5d0c003e73dc = <s1>Próximo</s1>kshana-bench
