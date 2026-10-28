# docs--kind-holdover-test: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: docs/kinds/by-kind/holdover-test.md
seg-73929aeded02 = Fonte: <c1/>

# text
# c1: holdover-test
seg-218f00012d0e = <c1/> (tipo de cenário)

# text
seg-c0924aa36e64 = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registo de erro de tempo que o OPERADOR fornece (um log do ptp4l, phc2sys ou ts2phc do linuxptp, um log de tracking ou statistics do chrony, um log de relógio TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns). O teste tem quatro etapas e o Kshana não executa nenhuma delas: uma LINHA DE BASE bloqueada, GNSS REMOVIDO pelo operador (o cabo da antena ou a saída do simulador; o Kshana não transmite nem aciona nada) num instante declarado, HOLDOVER no oscilador próprio do sistema e RECUPERAÇÃO depois de o operador restabelecer o GNSS num segundo instante declarado. O registo é dividido nesses dois instantes. Linha de base: estatísticas de erro de tempo e as máscaras da ITU-T escritas para um relógio bloqueado. Holdover: estatísticas, o desvio fracionário de frequência que o sistema manteve (uma reta de mínimos quadrados), as máscaras escritas para holdover ou para um relógio autónomo, o envelope de holdover do ePRTC-A a partir da duração bloqueada declarada e o tempo para exceder cada orçamento de erro de tempo. Recuperação: se e quando |TE| entrou numa banda declarada e permaneceu nela, o pico e o maior degrau. Cada limite é transcrito de uma tabela pública da ITU-T (as máscaras de temporização de telecomunicações); as palavras são 'medido em relação à máscara', e os dois instantes são uma declaração do operador, não verificada. Um registo curto demais para uma máscara é INCOMPLETE, nunca extrapolado. Ver docs/TIMING-HIL.md.

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-cd6d840a1382 = Uma execução de <c1/> resume-se assim: holdover-test: holdover { "1795" } s, máx.|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recuperado { "0" } s após o retorno do GNSS (MODELLED, medido em relação à máscara)

# text
# c1: test
# c2: series
seg-6a3dc8804be5 = Campos obrigatórios: <c1/>, <c2/>

# text
# c1: masks
# c2: budgets
seg-4792040e4773 = Campos opcionais: <c1/>, <c2/>

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-ad4f9c40e317 = O exemplo <c1/> define, entre outros:

# text
seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

# text
seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

# text
seg-a0f9749e9ca1 = master

# text
seg-cd857523297f = phase

# text
seg-29a012ae4735 = refuse

# text
seg-d578fc8e6052 = Rótulo do resultado (o do motor): MODELLED — um teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador. Cada limite é transcrito da Recomendação pública da ITU-T indicada e o resultado é medido em relação à máscara; ele nada diz sobre se algum relógio ou sistema atinge uma Recomendação, e ninguém o classificou nem aprov

# attr:alt
seg-8ce93392747b = O gráfico que o motor gera para scenarios/holdover-test-ptp4l.toml, tipo de cenário holdover-test

# text
# c1: holdover-test
seg-3361819ae321 = <b>MODELLED</b> O tipo de cenário <c1/>: um registo de erro de tempo (um log de relógio linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes que o operador declara para a remoção e o restabelecimento do GNSS numa linha de base, um holdover e

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> indica, num registo de holdover em escala de telecomunicações: uma janela deslizante O(n) de fila monótona. Referência independente (ExternalDataset): allantools { "2024.06" } — uma biblioteca independente de terceiros de estabilidade de frequência — mtie() e tdev() em tests/fixtures/telecom_timing/holdover_te_series.csv, a série analisada a partir do mesmo texto de 17 algarismos significativos em ambos os lados; a referência independente regista o SHA-256 da série e pode ser regenerada offline por tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida os ESTIMADORES neste registo, não o syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado e holdover do ePRTC-A (incluindo o envelope de erro de tempo da Tabela { "3" }. Referência independente (InternalConsistency): Transcrição das Recomendações indicadas (disponíveis gratuitamente em itu.int), cada limite com a sua tabela ou cláusula, listada com cada item não confirmado ou não implementado em docs/TELECOM-TIMING.md; as identidades de continuidade de pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de normas com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } ronda { "2" } (fixada antecipada

# text
# c1: holdover-test
seg-142528f34e66 = <b>MODELLED</b> O tipo de cenário <c1/>: um registo de erro de tempo (um log de relógio linuxptp, chrony, TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns) é dividido nos dois instantes. Referência independente (InternalConsistency): Cálculo manual em registos construídos a partir de fórmulas cuja inclinação, degrau, extremo e tempo de recuperação são conhecidos antes da execução (os testes os declaram), e as máscaras, o envelope e os orçamentos das linhas de telecom-timing acima. Nenhuma medição de laboratório de um holdover real foi pontuada e nenhuma referência independente externa foi comparada, de modo que o tipo de cenário não faz nenhuma afirmação sobre nenhum relógio ou sistema; é preciso um parceiro de laboratório de temporização antes de qualquer fi

# text
# c1: label
seg-59ff0b0e3d2d = MODELLED — um teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador. Cada limite é transcrito da Recomendação pública da ITU-T indicada e o resultado é medido em relação à máscara; ele nada diz sobre se algum relógio ou sistema atinge uma Recomendação, e ninguém o classificou nem aprovou. Os instantes em que o GNSS foi removido e restabelecido são uma declaração do operador e não são verificados. Software de caráter consultivo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-daeb4ad7aa35 = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registo de erro de tempo que o OPERADOR fornece (um log do ptp4l, phc2sys ou ts2phc do linuxptp, um log de tracking ou statistics do chrony, um log de relógio TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns). (catálogo de tipos de cenário (<c1/>))

# text
seg-ff3008c250cc = As máscaras de sincronização de telecomunicações da ITU-T com PASS/FAIL e margem são MODELLED, não validadas: conferidas contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8ccd0f911626 = O teste de holdover pontuado a partir de um registo de erro de tempo fornecido pelo operador é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-72bad5444282 = Página do tópico: <a1>TIMING-HIL.md</a1>

# text
seg-3b3a24664dae = Página do tópico: <a1>HARDWARE-SAFETY.md</a1>

# text
seg-b754be35fb52 = <s1>Anterior</s1>gravity-map

# text
seg-e7665ee5e30e = <s1>Seguinte</s1>hybrid-optical-rf
