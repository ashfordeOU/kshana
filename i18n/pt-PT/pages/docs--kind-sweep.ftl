# docs--kind-sweep: translations (pt-PT)

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Uma execução recebe um plano de contactos (uma lista de janelas aos_s/los_s, cada uma a pedir à abertura navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), um número de aberturas

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> O varrimento do tipo de cenário <c1/> (uma a três chaves com pontos de qualquer tipo de cenário, sobre os valores de eixo do varrimento genérico, opcionalmente um conjunto em cada nó) e a secção monte_carlo. Referência independente (InternalConsistency): A forma fechada do passeio aleatório de fase sob ruído de frequência branco, variância q_wf tau (NIST Technical Note { "1337" }), para a maquinaria estatística, e a igualdade byte a byte com as execuções isoladas para a semeadura. Ela verifica a aritmética do conjunto sobre o próprio modelo de relógio do motor, não um conjunto de dados externo

# text
seg-d1c11e493795 = As varreduras de parâmetros e os conjuntos de Monte Carlo com semente sobre qualquer tipo de cenário são MODELLED, não validados: verificados contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a8d92406e428 = Relógio ótico de rede de estrôncio, meta para uso espacial sigma_y

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crescimento do erro em inércia de forma fechada + holdover até ao limiar; classes de relógios quânticos. Referência independente (ReferenceImpl): Recursão de covariância multipasso de clock_state (conferência cruzada na mesma base de código); o núcleo subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com patamar de ruído vermelho permanecem MODELLED

# text
seg-e12f672ae71d = O holdover do relógio sem GNSS é MODELLED, não validado: conferido contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Os varrimentos de disponibilidade do tipo de cenário <c1/>: por constelação (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) e combinadas, a fração de pares (utilizador, época) com pelo menos um e pelo menos quatro sinais e a interrupção mais longa, para um utilizador numa esfera

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep.md
seg-de72ae48731d = Fonte: <c1/>

# text
# c1: sweep
seg-81c2da4650c9 = <c1/> (tipo de cenário)

# text
seg-e7ab7b55c969 = Varrimento 1-D de estudo de compromissos sobre um parâmetro de um pacote de relógio.

# text
# c1: scenarios/sweep-clock-stability.toml
seg-0412c0dbfb75 = Uma execução de <c1/> resume-se assim: varrimento de holdover_s sobre classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } pts, escala logarítmica) | quântico 6600.000->{ "6600.000" } | clássico 2610.000->{ "250.000" }

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
seg-d2a441254bcd = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scale
seg-2b8d8159bdaf = Campos opcionais: <c1/>

# text
# c1: scenarios/sweep-clock-stability.toml
seg-73c2e732b0c1 = O exemplo <c1/> define, entre outros:

# text
seg-f8a627a78bdb = Ficha técnica do CSAC Microchip SA.45s sigma_y(1s)={ "3e-10" }; q_wf é s

# attr:alt
seg-c784b8f22f12 = O gráfico que o motor escreve para scenarios/sweep-clock-stability.toml, tipo sweep

# text
# c1: campaign
seg-cb00aca0268d = <b>MODELLED</b> As secções sweep (uma a três chaves com pontos de qualquer tipo, sobre os valores de eixo do varrimento genérico, opcionalmente um ensemble em cada nó) e monte_carlo do tipo <c1/>: a realização k é executada em base_seed + k; cada métrica indica média, desvio-padrão Ensaios: <a1>campaign_composition_reference.rs</a1>.

# text
seg-1750fbfc4a99 = <s1>Anterior</s1>sweep-nd

# text
seg-de5468ac32fc = <s1>Seguinte</s1>telecom-timing

# text
# c1: tli-and-cruise
seg-795e0409fa5a = <b>MODELLED</b> A fase <c1/>: o estado médio pelo propagador de Cowell do motor (massa pontual da Terra e J2, o Sol e a Lua como terceiros corpos, a Lua a partir do kernel DE440 da cadeia onde ele cobre o segmento e o Sol a partir da série analít
