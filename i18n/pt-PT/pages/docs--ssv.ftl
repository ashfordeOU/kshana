# docs--ssv: translations (pt-PT)

# text
seg-0857a94a948e = Limites

# text
seg-75c8da01c0f1 = MET

# text
seg-069a652c402e = limiar

# attr:alt
seg-1f79a5aae6c5 = Disponibilidade de sinal para um utilizador numa esfera a { "36000" } km de altitude com uma antena hemisférica, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-shell.toml (uma execução reduzida: { "162" } utilizadores, { "3" } dias, passos de { "10" } min), com um limiar de { "20" } dB-Hz. Para cada constelação e banda, duas barras: a proporção de pares (utilizador, época) com pelo menos um sinal e com pelo menos quatro. Combinado, L1: { "99.4" } % com pelo menos um, { "73.2" } % com pelo menos quatro, interrupção mais longa abaixo de quatro sinais { "160" } min. Combinado, L5: { "100.0" } % com pelo menos um, { "99.9" } % com pelo menos quatro, interrupção mais longa abaixo de quatro sinais { "20" } min. MODELLED: um estudo modelado a partir de entradas indicadas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. A dimensão reduzida não é a comparação com o livrete. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-92ef8e0b78de = Sinais ao longo de uma órbita terrestre alta (perigeu { "497" } km, apogeu { "58622" } km, período { "18.8" } h), a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-heo.toml, banda L1. Em cima: a melhor densidade de potência portadora-ruído entre os sinais à vista, face ao limiar de { "20" } dB-Hz. No meio: o número de sinais à vista de todas as constelações, de { "4" } a { "55" } ao longo dos pontos amostrados. Das ligações recebidas, { "2252" } chegaram por um lóbulo principal e { "696" } por lóbulos laterais, usando um diagrama paramétrico de substituição, identificado como tal, e não o diagrama medido de qualquer sistema. PDOP mediano { "67" }, percentil 95 { "358" }. MODELLED: um estudo modelado a partir de entradas indicadas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-902c5c7da9aa = Um filtro de bordo de nove estados numa transferência da órbita baixa para a Lua, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-nav-lunar.toml ({ "289" } épocas, { "13" } pontos desenhados). Num eixo logarítmico, o erro de posição verdadeiro e o limite de um sigma do próprio filtro face ao tempo desde o início. Dentro das órbitas GNSS o RMS da posição é { "1.4" } m; acima delas é { "90" } m, com o erro final { "184" } m a { "193,330" } km de altitude com { "1" } medição. O erro de estimação normalizado ao quadrado médio ao longo de toda a execução é { "4.4" } (cerca de { "3" } para um bloco de posição consistente). A verdade de referência e o filtro partilham as suas aproximações do Sol e da Lua. MODELLED: um estudo modelado a partir de entradas indicadas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-9a947b61a4cb = Navegação relativa de { "2" } adjuntos em torno de um principal numa órbita alta, a partir de uma execução real do motor v{ $version } sobre scenarios/gnss-ssv-formation-heo.toml ({ "401" } épocas). Para cada adjunto, duas barras: o RMS da posição relativa obtido por subtração das duas estimativas absolutas independentes, e o do filtro relativo sobre pseudodistâncias de diferença simples. Linha de base { "0.8" } km: { "5.1" } m e { "1.2" } m. Linha de base { "2.0" } km: { "4.1" } m e { "2.1" } m. O filtro absoluto não é consistente aqui: erro de estimação normalizado ao quadrado médio { "187" } face a cerca de { "3" } para um filtro consistente, pelo que a sua incerteza indicada é muito pequena. MODELLED: um estudo modelado a partir de entradas indicadas, não uma medição e não uma afirmação de volume de serviço para nenhum sistema. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# attr:alt
seg-d76123040989 = A comparação registada do modelo de disponibilidade de utilizadores espaciais com o livrete público do Volume de Serviço Espacial, a partir dos resultados registados no repositório da execução pré-registada (xval/gnss-ssv/results-run1.json, escrito pelo exemplo ssv_booklet_check do motor v{ $version }). Limiar a limiar, as células dentro da tolerância: S0 { "13" } de { "13" } (MET); S1 { "43" } de { "52" } (NOT MET); S2 { "48" } de { "52" } (NOT MET); S3 { "122" } de { "155" } (NOT MET); S4 { "132" } de { "156" } (NOT MET); S5 { "18" } de { "26" } (NOT MET); S6 { "26" } de { "26" } (MET); S7 { "0" } de { "20" } diagramas de painel (NOT MET). Apenas S0 e S6 são atingidos na leitura pré-registada. Uma variante de diagnóstico que usa os outros ângulos GLONASS do livrete leva S1, S2 e S4 a todas as células, mas não substitui a execução de referência. Nenhuma linha do registo é VALIDATED. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de salvaguarda da vida humana.

# text
# c1: docs/SSV.md
seg-74675df154dc = Fonte: <c1/>

# text
# c1: gnss-ssv
seg-ce7ea32e67f1 = O GNSS para além da constelação: o tipo de cenário <c1/>

# text
seg-389cb131fd77 = Apenas consultivo. Resultados modelados a partir de entradas declaradas e de uma referência simulada; não é uma certificação, um valor qualificado para voo nem uma afirmação de volume de serviço para qualquer sistema. O Kshana não transmite nada.

# text
# c1: gnss-ssv
# c2: [shell]
# c3: [trajectory]
# c4: [navigation]
# c5: [formation]
seg-a0011b278269 = O tipo de cenário <c1/> responde: para uma nave acima, em torno ou muito para além das órbitas GNSS, quantos sinais GNSS consegue usar, quão fortes são, quão boa é a geometria e o que pode um filtro a bordo fazer com eles? Tem três modos, escolhidos pela tabela que o cenário tem: <c2/>, <c3/> ou <c4/> (com um <c5/> opcional).

# text
seg-2e4ac6b7a883 = Estado: <b>MODELLED</b>. Os varrimentos de disponibilidade são comparados com o caderno ICG Space Service Volume ao abrigo de um pré-registo; veja <a1>o que a comparação mostra</a1> antes de confiar em qualquer número.

# text
seg-a0ff58bccaa8 = Fontes públicas

# text
# c1: xval/gnss-ssv/fetch.sh
seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } de novembro de { "2018" }), preparado pelo International Committee on GNSS (ICG), Working Group B: o método (anexo B), os elementos orbitais de cada constelação (anexo C), as larguras de feixe e potências de transmissão (tabelas B2, B6, B8, { "4.2" }), as antenas de utilizador (tabela B10) e as tabelas de disponibilidade publicadas. É, ele próprio, uma simulação. Descarregado por <c1/> (SHA-256 fixado), nunca incorporado.

# text
seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, GPS Block IIR and IIR-M antenna panel patterns (Marquis, { "2014" }): os diagramas medidos dos painéis L1, usados apenas para avaliar o substituto paramétrico (limiar S7). Descarregados, nunca incorporados, sem dados de diagramas registados.

# text
# c1: src/ssv/limb.rs
seg-0a002dc0df64 = As constantes do modelo (gravidade, rotação da Terra, perda em espaço livre, densidade de ruído) são normalizadas; a lei de densidade da plasmasfera de Gallagher, a camada de Chapman e o perfil de refratividade rádio são formas publicadas, usadas com parâmetros simples declarados (ver <c1/>).

# text
seg-c3c3f63df966 = Modo shell: a métrica global do caderno

# text
# c1: [shell]
seg-f1e153c95b13 = <c1/> coloca um utilizador numa esfera (por predefinição, a { "36,000" } km de altitude com uma antena hemisférica apontada ao nadir, o SSV superior; ou a { "8,000" } km com uma antena omnidirecional, o SSV inferior) numa grelha de icosfera de 2,562 pontos e conta, ao longo de { "14" } dias em passos de 1 minuto, a proporção de pares (utilizador, época) com pelo menos um e pelo menos quatro sinais, por constelação e combinados, e a interrupção mais longa no pior utilizador. O varrimento usa o intervalo de visibilidade em forma fechada em ângulo central (um cone de feixe, o bloqueio da Terra pela esfera de { "6378" } km mais { "50" } km, o hemisfério do utilizador e o limite de alcance de RF) e executa-se em segundos numa compilação de lançamento; um teste de propriedade verifica-o face ao predicado geométrico geral.

# text
seg-3fb4c06c8b3f = Modo de trajetória: ao longo de uma órbita

# text
# c1: [trajectory]
# c2: leo
# c3: meo
# c4: geo
# c5: heo
# c6: lunar-transfer
seg-632fedc95af5 = <c1/> faz voar o utilizador numa órbita kepleriana (uma predefinição: <c2/>, <c3/>, <c4/>, <c5/> (a tabela { "5.10" } do caderno) ou <c6/>, ou elementos) e reporta, por banda e constelação, a disponibilidade de um e de quatro sinais, as durações das interrupções, os sinais em vista, o melhor C/N0, a diluição da precisão (mediana, percentil 95, pior caso), as ligações recebidas pelo lóbulo principal e pelos lóbulos laterais, e uma série temporal e CSV opcionais.

# text
# c1: [transmit] pattern
# c2: booklet
# c3: parametric
# c4: table
# c5: pattern_csv
# c6: pattern_text
# c7: xval/gnss-ssv/extract_patterns.py
seg-7bfd301cd789 = <b>Diagrama de transmissão</b> (<c1/>): <c2/> (potência constante dentro do ângulo de referência fora do eixo), <c3/> (um substituto etiquetado: { "3" } dB por grau para além do ângulo de referência até um patamar { "25" } dB abaixo do lóbulo principal; <b>não</b> é o diagrama medido de nenhum sistema) ou <c4/> (um diagrama medido que o utilizador fornece: <c5/> ou <c6/> em linha; os diagramas de painel dos Block IIR/IIR-M podem ser extraídos com <c7/>).

# text
seg-c1390929d9f2 = <b>Antenas de receção</b>: omnidirecional, hemisférica, ou as antenas de alto ganho e de patch da tabela B10 do caderno, para nadir ou zénite; cada ligação usa a antena de maior ganho.

# text
# c1: [atmosphere]
seg-fe56ab7a2cac = <b>Meio do raio rasante</b> (<c1/>): uma ionosfera de Chapman, uma plasmasfera (forma de Gallagher { "1988" }, plasmapausa em L = { "4.5" }, afunilada abaixo de { "1,500" } km) e uma atmosfera neutra (curvatura de cerca de { "1.33" } graus à superfície, absorção do oxigénio, desfocagem) integrados ao longo do raio reto. Reporta o TEC oblíquo, a parte plasmasférica, o atraso em excesso, a altitude tangente e as ligações perdidas por rasância. Integração em raio reto: a curvatura é reportada, não iterada.

# text
# c1: [receiver] weak_signal
seg-1bad91204f6a = <b>Recetor de sinal fraco</b> (<c1/>): integração coerente e não coerente, limite de bits de dados, canais de auxílio e de piloto, pesquisa de Doppler; o limiar de aquisição às probabilidades de deteção e de falso alarme declaradas e os limiares de seguimento da portadora e do código substituem o limiar fixo de C/N0 (intervalo de { "10" } a { "25" } dB-Hz). Reutiliza os modelos de aquisição e de ciclo de seguimento do motor.

# text
seg-497126fe23e9 = Modo de navegação: um filtro a bordo

# text
# c1: [navigation]
# c2: [atmosphere]
seg-af7919ae046e = <c1/> faz voar uma nave de órbita alta ou de transferência lunar e executa um filtro de Kalman estendido de nove estados (posição, velocidade, desvio e deriva do relógio do recetor, uma escala da pressão de radiação solar) sobre pseudodistâncias. A referência é integrada com gravidade de massa pontual, J2, terceiros corpos Sol e Lua e pressão de radiação, com sombra cilíndrica da Terra; o filtro modela a gravidade, o J2 e os terceiros corpos e estima a pressão de radiação. As pseudodistâncias provêm da mesma geometria de ligação e do mesmo limiar de C/N0 dos varrimentos; o seu ruído aumenta à medida que o C/N0 diminui; o atraso em excesso do meio (com <c2/>) é acrescentado e não é modelado pelo filtro. O relatório separa a parte da execução dentro das órbitas GNSS (abaixo de { "20,000" } km de altitude) da parte acima, indica a maior lacuna sem medições e o erro de estimação normalizado quadrático médio (cerca de { "3" } para um bloco de posição consistente). O Sol e a Lua são substitutos circulares de baixa precisão.

# text
seg-a515950c13d6 = Modo de formação: navegação relativa

# text
# c1: [formation]
# c2: [navigation]
seg-8d2b72ca56d9 = <c1/> (precisa de <c2/> para a nave principal) acrescenta naves adjuntas desfasadas em anomalia verdadeira. Cada nave executa o filtro absoluto; a posição da nave adjunta relativamente à principal é estimada subtraindo as estimativas absolutas independentes e por um filtro relativo sobre pseudodistâncias de diferença simples dos sinais que ambas as naves seguem. O relatório dá ambas, a linha de base e o número de sinais seguidos em comum.

# text
seg-dc78efcb8bcb = O que a comparação com o caderno mostra

# text
# c1: xval/gnss-ssv/PREREGISTRATION.md
# c2: xval/gnss-ssv/RESULTS.md
# c3: results-*.json
# c4: tests/ssv_booklet_results.rs
seg-643bcfcea515 = Os limiares foram fixados antecipadamente (<c1/>, adendas { "1" } a { "5" }) antes da execução em tamanho real; resultados em <c2/>, células em <c3/>, fixados por <c4/>, incluindo as falhas.

# text
seg-5498636f8d07 = o quê

# text
seg-32c0ea7929e2 = execução { "1" } (leitura pré-registada)

# text
seg-abe521171d2f = variante com ângulo GLONASS (diagnóstico)

# text
seg-9489ef691574 = potência radiada mínima, { "13" } sinais, a menos de { "0.1" } dB

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
seg-479a041e2b62 = diagrama paramétrico face aos diagramas medidos dos painéis GPS L1

# text
seg-b514bc035c86 = NOT MET (RMS de { "6.3" } a { "8.8" } dB face a { "3" } dB)

# text
seg-dd703fdea949 = O caderno é internamente inconsistente quanto ao ângulo de referência fora do eixo do GLONASS: as tabelas B2 e B6 indicam { "20" } e { "28" } graus, a tabela { "4.2" } indica { "26" } e { "34" }. A execução { "1" } usou o primeiro (o que o pré-registo nomeou); quase todas as falhas de S1 a S5 são do GLONASS. A variante, assumida como diagnóstico antes de ser executada, usa o segundo e, nesse caso, o SSV superior, o SSV inferior e as missões GEO concordam célula a célula, incluindo as interrupções. A variante não substitui a execução { "1" }. <b>Nenhuma linha é VALIDATED</b>: o caderno é uma simulação, a regra do veredicto exige S0 a S3 segundo a leitura pré-registada, e as falhas restantes (GPS L1 a { "20" } dB-Hz, Galileo em HEO, QZSS e NavIC, as linhas lunares do GLONASS) não estão explicadas.

# text
seg-6eecf686159b = Execução

# text
# c1: kshana.run
# c2: run_scenario
# c3: pattern_csv
# c4: pattern_text
seg-adbb9c22de1c = Todos os cenários incluídos são reduzidos para correr em segundos; a comparação em tamanho real é o exemplo acima. O mesmo tipo de cenário corre a partir de Python (<c1/>), do navegador (WebAssembly), do servidor MCP (<c2/>, apenas texto em linha: <c3/> é uma fonte em ficheiro e é recusada, utilize <c4/>) e dos plugins.

# text
seg-8fa10c8e7ab7 = MODELLED: nada aqui foi comparado com a receção GNSS medida em órbita. O caderno é uma simulação.

# text
seg-b34e9acebec0 = Órbitas keplerianas de dois corpos para as constelações GNSS e para o utilizador nos varrimentos; a transferência lunar é uma elipse de dois corpos, e não uma trajetória propagada.

# text
seg-76aa617ba828 = O meio é um modelo simples declarado, com integração em raio reto; não é uma previsão de meteorologia espacial.

# text
seg-3114c4249988 = O filtro de navegação é um estudo de projeto: sem manobras, sem atitude, sem multipercurso, e a referência partilha com o filtro as suas efemérides do Sol e da Lua.

# text
seg-2deafc0f9534 = <s1>Anterior</s1>Estação de referência lunar

# text
seg-23386861eebf = <s1>Seguinte</s1>Órbita e superfície lunares como infraestrutura
