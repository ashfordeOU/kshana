# docs--kind-telecom-timing: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: uma camada de análise sintática que converte um ficheiro de relógio RINEX (registos AS/AR de um relógio nomeado, versões { "2" } e { "3.00" } a { "3.04" }), um registo ASCII de fase ou frequência no estilo TimeLab, ou um registo de marcas temporais ou intervalos do TAPR TICC num pha uniforme Testes: <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> O erro máximo de intervalo de tempo e o desvio de tempo que o tipo de cenário <c1/> indica, num registo de holdover em escala de telecomunicações: uma janela deslizante O(n) de fila monótona. Referência independente (ExternalDataset): allantools { "2024.06" } — uma biblioteca independente de terceiros de estabilidade de frequência — mtie() e tdev() em tests/fixtures/telecom_timing/holdover_te_series.csv, a série analisada a partir do mesmo texto de 17 algarismos significativos em ambos os lados; a referência independente regista o SHA-256 da série e pode ser regenerada offline por tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida os ESTIMADORES neste registo, não o syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Limites transcritos da ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado e holdover do ePRTC-A (incluindo o envelope de erro de tempo da Tabela { "3" }. Referência independente (InternalConsistency): Transcrição das Recomendações indicadas (disponíveis gratuitamente em itu.int), cada limite com a sua tabela ou cláusula, listada com cada item não confirmado ou não implementado em docs/TELECOM-TIMING.md; as identidades de continuidade de pontos de quebra que as tabelas implicam são verificadas nos testes. Uma transcrição de normas com verificações de consistência interna, não um teste de aderência à norma e não uma validação externa. { "0.30" } ronda { "2" } (fixada antecipada
