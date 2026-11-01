# docs--ssv: translations (pt-BR)

# text
seg-0857a94a948e = Limites

# text
seg-75c8da01c0f1 = MET

# text
seg-069a652c402e = limiar

# attr:alt
seg-1f79a5aae6c5 = Disponibilidade de sinal para um usuário em uma esfera a { "36000" } km de altitude com antena hemisférica, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-shell.toml (uma execução reduzida: { "162" } usuários, { "3" } dias, passos de { "10" } min), com limiar de { "20" } dB-Hz. Para cada constelação e banda, duas barras: a parcela dos pares (usuário, época) com pelo menos um sinal e com pelo menos quatro. Combinado, L1: { "99.4" } % com pelo menos um, { "73.2" } % com pelo menos quatro, interrupção mais longa abaixo de quatro sinais { "160" } min. Combinado, L5: { "100.0" } % com pelo menos um, { "99.9" } % com pelo menos quatro, interrupção mais longa abaixo de quatro sinais { "20" } min. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. O tamanho reduzido não é a comparação com o livreto. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-92ef8e0b78de = Sinais ao longo de uma órbita terrestre alta (perigeu { "497" } km, apogeu { "58622" } km, período { "18.8" } h), a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-heo.toml, banda L1. Em cima: a melhor densidade portadora-ruído entre os sinais à vista, contra o limiar de { "20" } dB-Hz. No meio: o número de sinais à vista de todas as constelações, de { "4" } a { "55" } ao longo dos pontos amostrados. Dos enlaces recebidos, { "2252" } vieram por um lóbulo principal e { "696" } por lóbulos laterais, usando um padrão paramétrico substituto rotulado, não o padrão medido de nenhum sistema. PDOP mediano { "67" }, percentil 95 { "358" }. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-902c5c7da9aa = Um filtro de bordo de nove estados em uma transferência de órbita baixa em direção à Lua, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-nav-lunar.toml ({ "289" } épocas, { "13" } pontos desenhados). Em eixo logarítmico, o erro verdadeiro de posição e o limite de um sigma do próprio filtro contra o tempo desde o início. Dentro das órbitas GNSS o RMS de posição é { "1.4" } m; acima delas é { "90" } m, com o erro final de { "184" } m a { "193,330" } km de altitude com { "1" } medição. O erro de estimação quadrático normalizado médio ao longo de toda a execução é { "4.4" } (cerca de { "3" } para um bloco de posição consistente). A verdade e o filtro compartilham seus substitutos de Sol e Lua. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-9a947b61a4cb = Navegação relativa de { "2" } satélites secundários em torno de um principal em uma órbita alta, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-formation-heo.toml ({ "401" } épocas). Para cada satélite secundário, duas barras: o RMS de posição relativa obtido subtraindo as duas estimativas absolutas independentes, e o obtido do filtro relativo sobre pseudodistâncias de diferença simples. Linha de base { "0.8" } km: { "5.1" } m e { "1.2" } m. Linha de base { "2.0" } km: { "4.1" } m e { "2.1" } m. O filtro absoluto não é consistente aqui: erro de estimação quadrático normalizado médio { "187" } contra cerca de { "3" } para um filtro consistente, de modo que sua incerteza declarada é pequena demais. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# attr:alt
seg-d76123040989 = A comparação registrada do modelo de disponibilidade para usuários espaciais com o livreto público do Volume de Serviço Espacial, a partir dos resultados registrados da execução pré-registrada (xval/gnss-ssv/results-run1.json, escrito pelo exemplo ssv_booklet_check do motor v{ $version }). Limiar a limiar, as células dentro da tolerância: S0 { "13" } de { "13" } (MET); S1 { "43" } de { "52" } (NOT MET); S2 { "48" } de { "52" } (NOT MET); S3 { "122" } de { "155" } (NOT MET); S4 { "132" } de { "156" } (NOT MET); S5 { "18" } de { "26" } (NOT MET); S6 { "26" } de { "26" } (MET); S7 { "0" } de { "20" } padrões de painel (NOT MET). Apenas S0 e S6 são atingidos sob a leitura pré-registrada. Uma variante diagnóstica que usa os outros ângulos do GLONASS do livreto leva S1, S2 e S4 a todas as células, mas não substitui a execução de registro. Nenhuma linha do registro é VALIDATED. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana.

# text
# c1: docs/SSV.md
seg-74675df154dc = Fonte: <c1/>

# text
# c1: gnss-ssv
seg-ce7ea32e67f1 = O GNSS além da constelação: o tipo <c1/>

# text
seg-389cb131fd77 = Apenas consultivo. Resultados modelados a partir de entradas declaradas e de uma verdade simulada; não é uma certificação, um valor qualificado para voo nem uma alegação de volume de serviço para nenhum sistema. O Kshana não transmite nada.

# text
# c1: gnss-ssv
# c2: [shell]
# c3: [trajectory]
# c4: [navigation]
# c5: [formation]
seg-a0011b278269 = O tipo <c1/> responde: para uma espaçonave acima, em torno ou muito além das órbitas GNSS, quantos sinais GNSS ela consegue usar, qual a intensidade deles, qual a qualidade da geometria e o que um filtro de bordo pode fazer com eles? Ele tem três modos, escolhidos pela tabela que o cenário possui: <c2/>, <c3/> ou <c4/> (com um <c5/> opcional).

# text
seg-2e4ac6b7a883 = Situação: <b>MODELLED</b>. Os varrimentos de disponibilidade são comparados com o folheto do Space Service Volume do ICG sob um pré-registro; veja <a1>o que a comparação mostra</a1> antes de confiar em qualquer número.

# text
seg-a0ff58bccaa8 = Fontes públicas

# text
# c1: xval/gnss-ssv/fetch.sh
seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } de novembro de { "2018" }), preparado pelo International Committee on GNSS (ICG), Working Group B: o método (anexo B), os elementos orbitais de cada constelação (anexo C), as larguras de feixe e potências de transmissão (tabelas B2, B6, B8, { "4.2" }), as antenas de usuário (tabela B10) e as tabelas de disponibilidade publicadas. Ele próprio é uma simulação. Obtido por <c1/> (SHA-256 fixado), nunca incorporado ao repositório.

# text
seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, diagramas dos painéis de antena do GPS Block IIR e IIR-M (Marquis, { "2014" }): os diagramas medidos do painel L1, usados apenas para julgar o substituto paramétrico (limiar S7). Obtidos, nunca incorporados ao repositório, sem nenhum dado de diagrama versionado.

# text
# c1: src/ssv/limb.rs
seg-0a002dc0df64 = As constantes do modelo (gravidade, rotação da Terra, perda em espaço livre, densidade de ruído) são padrão; a lei de densidade da plasmasfera de Gallagher, a camada de Chapman e o perfil de refratividade de rádio são formas publicadas, usadas com parâmetros simples declarados (veja <c1/>).

# text
seg-c3c3f63df966 = Modo shell: a métrica global do folheto

# text
# c1: [shell]
seg-f1e153c95b13 = <c1/> coloca um usuário sobre uma esfera (padrão de { "36,000" } km de altitude com uma antena hemisférica apontada para o nadir, o SSV superior; ou { "8,000" } km com uma antena omnidirecional, o SSV inferior) em uma grade icosférica de 2,562 pontos e conta, ao longo de { "14" } dias em passos de 1 minuto, a parcela de pares (usuário, época) com pelo menos um e pelo menos quatro sinais, por constelação e combinados, e a maior interrupção no pior usuário. O varrimento usa o intervalo de visibilidade de forma fechada em ângulo central (um cone de feixe, o bloqueio da Terra pela esfera de { "6378" } km mais { "50" } km, o hemisfério do usuário e o limite de alcance de RF) e roda em segundos em um build de release; um teste de propriedade o confere com o predicado geométrico geral.

# text
seg-3fb4c06c8b3f = Modo de trajetória: ao longo de uma órbita

# text
# c1: [trajectory]
# c2: leo
# c3: meo
# c4: geo
# c5: heo
# c6: lunar-transfer
seg-632fedc95af5 = <c1/> faz o usuário voar em uma órbita kepleriana (uma predefinição: <c2/>, <c3/>, <c4/>, <c5/> (a tabela { "5.10" } do folheto) ou <c6/>, ou elementos) e informa, por banda e constelação, a disponibilidade de um e de quatro sinais, as durações das interrupções, os sinais em visada, o melhor C/N0, a diluição da precisão (mediana, percentil 95, pior caso), os enlaces recebidos pelo lóbulo principal e pelos lóbulos laterais, e uma série temporal e um CSV opcionais.

# text
# c1: [transmit] pattern
# c2: booklet
# c3: parametric
# c4: table
# c5: pattern_csv
# c6: pattern_text
# c7: xval/gnss-ssv/extract_patterns.py
seg-7bfd301cd789 = <b>Diagrama de transmissão</b> (<c1/>): <c2/> (potência constante dentro do ângulo de referência fora do eixo), <c3/> (um substituto rotulado: { "3" } dB por grau além do ângulo de referência até um piso { "25" } dB abaixo do lóbulo principal; <b>não</b> é o diagrama medido de nenhum sistema) ou <c4/> (um diagrama medido que você fornece: <c5/> ou <c6/> em linha; os diagramas de painel do Block IIR/IIR-M podem ser extraídos com <c7/>).

# text
seg-c1390929d9f2 = <b>Antenas de recepção</b>: omni, hemisfério, ou as antenas de alto ganho e patch da tabela B10 do folheto, nadir ou zênite; cada enlace usa a antena de maior ganho.

# text
# c1: [atmosphere]
seg-fe56ab7a2cac = <b>Meio de raio no limbo</b> (<c1/>): uma ionosfera de Chapman, uma plasmasfera (forma de Gallagher de { "1988" }, plasmapausa em L = { "4.5" }, afunilada abaixo de { "1,500" } km) e uma atmosfera neutra (curvatura de cerca de { "1.33" } graus na superfície, absorção por oxigênio, desfocalização) integrados ao longo do raio reto. Informa o TEC oblíquo, a parte plasmasférica, o atraso excedente, a altitude tangente e os enlaces perdidos por rasante. Integração por raio reto: a curvatura é informada, não iterada.

# text
# c1: [receiver] weak_signal
seg-1bad91204f6a = <b>Receptor de sinal fraco</b> (<c1/>): integração coerente e não coerente, limite de bits de dados, canais de auxílio e piloto, busca Doppler; o limiar de aquisição nas probabilidades de detecção e de falso alarme declaradas e os limiares de rastreamento de portadora e de código substituem o limiar fixo de C/N0 (faixa de { "10" } a { "25" } dB-Hz). Reutiliza os modelos de aquisição e de laço de rastreamento do motor.

# text
seg-497126fe23e9 = Modo de navegação: um filtro de bordo

# text
# c1: [navigation]
# c2: [atmosphere]
seg-af7919ae046e = <c1/> faz voar uma nave em órbita alta ou de transferência lunar e executa um filtro de Kalman estendido de nove estados (posição, velocidade, viés e deriva do relógio do receptor, uma escala de pressão de radiação solar) sobre pseudodistâncias. A verdade é integrada com gravidade de massa pontual, J2, terceiros corpos Sol e Lua e pressão de radiação com uma sombra cilíndrica da Terra; o filtro modela a gravidade, o J2 e os terceiros corpos e estima a pressão de radiação. As pseudodistâncias vêm da mesma geometria de enlace e do mesmo limiar de C/N0 dos varrimentos; seu ruído cresce à medida que o C/N0 cai; o atraso excedente do meio (com <c2/>) é adicionado e não é modelado pelo filtro. O relatório separa a parte da execução dentro das órbitas GNSS (abaixo de { "20,000" } km de altitude) da parte acima, fornece a maior lacuna sem medição e o erro de estimativa normalizado quadrático médio (cerca de { "3" } para um bloco de posição consistente). O Sol e a Lua são substitutos circulares de baixa precisão.

# text
seg-a515950c13d6 = Modo de formação: navegação relativa

# text
# c1: [formation]
# c2: [navigation]
seg-8d2b72ca56d9 = <c1/> (precisa de <c2/> para o chefe) acrescenta deputies deslocados em anomalia verdadeira. Cada nave executa o filtro absoluto; a posição do deputy em relação ao chefe é estimada subtraindo as estimativas absolutas independentes e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambas as naves rastreiam. O relatório fornece ambas, a linha de base e o número de sinais rastreados em comum.

# text
seg-dc78efcb8bcb = O que a comparação com o folheto mostra

# text
# c1: xval/gnss-ssv/PREREGISTRATION.md
# c2: xval/gnss-ssv/RESULTS.md
# c3: results-*.json
# c4: tests/ssv_booklet_results.rs
seg-643bcfcea515 = Os limiares foram pré-registrados (<c1/>, adendos { "1" } a { "5" }) antes da execução em tamanho completo; os resultados estão em <c2/>, as células em <c3/>, fixados por <c4/>, inclusive os casos em que o limiar não foi atingido.

# text
seg-5498636f8d07 = o quê

# text
seg-32c0ea7929e2 = execução { "1" } (leitura pré-registrada)

# text
seg-abe521171d2f = variante de ângulo do GLONASS (diagnóstico)

# text
seg-9489ef691574 = potência irradiada mínima, { "13" } sinais, dentro de { "0.1" } dB

# text
seg-4b7e0252355c = geometria do SSV superior (tabela B4)

# text
seg-e3c870085a6c = NOT MET ({ "43" } de { "52" } células)

# text
seg-b57b1f9b0b43 = todas as { "52" } células dentro da tolerância

# text
seg-6bf57763d120 = SSV inferior (tabela { "5.2" })

# text
seg-c9349a3a0185 = NOT MET ({ "48" } de { "52" })

# text
seg-056eae8e55d1 = todas as { "52" }

# text
seg-805e4402f556 = SSV superior com 15/20/25 dB-Hz (tabela B9)

# text
seg-a8d9a1f66989 = NOT MET ({ "122" } de { "155" })

# text
seg-7a6fd0eb8f77 = { "153" } de { "155" }

# text
seg-cb1a6f558a09 = seis missões GEO

# text
seg-e4759e8d2baa = NOT MET ({ "132" } de { "156" })

# text
seg-3e59e79791e2 = todas as { "156" }

# text
seg-76d88834ab69 = missão HEO

# text
seg-1c06414304a0 = NOT MET ({ "18" } de { "26" })

# text
seg-b1656692859b = { "21" } de { "26" }

# text
seg-d4cedd711485 = missão lunar

# text
seg-b52333886109 = NOT MET ({ "23" } de { "26" })

# text
seg-479a041e2b62 = diagrama paramétrico em relação aos diagramas medidos do painel L1 do GPS

# text
seg-b514bc035c86 = NOT MET (RMS de { "6.3" } a { "8.8" } dB contra { "3" } dB)

# text
seg-dd703fdea949 = O folheto é internamente inconsistente quanto ao ângulo de referência fora do eixo do GLONASS: as tabelas B2 e B6 trazem { "20" } e { "28" } graus, a tabela { "4.2" } traz { "26" } e { "34" }. A execução { "1" } usou o primeiro par (o que o pré-registro nomeava); quase toda falha em S1 a S5 é do GLONASS. A variante, assumida como diagnóstico antes de ser executada, usa o segundo par; então, as missões do SSV superior, do SSV inferior e GEO concordam célula a célula, inclusive as interrupções. A variante não substitui a execução { "1" }. <b>Nenhuma linha é VALIDATED</b>: o folheto é uma simulação, a regra do veredito exige S0 a S3 sob a leitura pré-registrada, e as falhas restantes (GPS L1 a { "20" } dB-Hz, Galileo em HEO, QZSS e NavIC, as linhas lunares do GLONASS) não são explicadas.

# text
seg-6eecf686159b = Como executar

# text
# c1: kshana.run
# c2: run_scenario
# c3: pattern_csv
# c4: pattern_text
seg-adbb9c22de1c = Todo cenário incluído é reduzido para rodar em segundos; a comparação em tamanho completo é o exemplo acima. O mesmo tipo roda a partir do Python (<c1/>), do navegador (WebAssembly), do servidor MCP (<c2/>, somente texto em linha: <c3/> é uma fonte de arquivo e é recusada; use <c4/>) e dos plugins.

# text
seg-8fa10c8e7ab7 = MODELLED: nada aqui foi comparado com recepção GNSS em órbita medida. O folheto é uma simulação.

# text
seg-b34e9acebec0 = Órbitas keplerianas de dois corpos para as constelações GNSS e para o usuário nos varrimentos; a transferência lunar é uma elipse de dois corpos, não uma trajetória propagada.

# text
seg-76aa617ba828 = O meio é um modelo simples declarado, com integração por raio reto; não é uma previsão de clima espacial.

# text
seg-3114c4249988 = O filtro de navegação é um estudo de projeto: sem manobras, sem atitude, sem multipercurso, e a verdade compartilha com o filtro as suas efemérides do Sol e da Lua.

# text
seg-2deafc0f9534 = <s1>Anterior</s1>Estação de referência lunar

# text
seg-23386861eebf = <s1>Próximo</s1>Órbita e superfície lunares como infraestrutura
