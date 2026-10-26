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
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
