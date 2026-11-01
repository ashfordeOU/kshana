# docs--kind-ntn-positioning: translations (pt-BR)

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Fonte: <c1/>

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (tipo de cenário)

# text
seg-4f0edb786a35 = Posicionamento a partir de um enlace de descida de rede não terrestre (NTN) 5G no serviço móvel por satélite (MSS) na banda S (banda 3GPP n256, enlace de descida de { "2170" } a { "2200" } MHz; portadora padrão de { "2172.5" } MHz): o limite de Cramér-Rao (CRB) do tempo de chegada, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), com beta a largura de banda quadrática média (de Gabor) do espectro OFDM plano (B/sqrt({ "12" })), e do Doppler de um tom complexo, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), para cada sinal (por padrão um canal New Radio de { "5" } MHz com { "4.5" } MHz ocupados e um canal de banda estreita de { "200" } kHz com { "180" } kHz ocupados); depois, sobre qualquer constelação LEO, soluções de tempo de chegada no enlace de descida com um relógio de receptor desconhecido (com semente, com o limite mais um erro de sincronização da rede como sigma), o seu PDOP e o sigma 3D formal, e uma solução Doppler de um único satélite na passagem mais longa com a altura mantida. MODELLED: o passo de largura de banda para limite é a forma fechada de manual, verificada contra a integração numérica dos espectros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a precisão de posicionamento é um limite em um canal sem multipercurso com um erro de sincronização declarado, não um resultado alcançado.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Uma execução de <c1/> resume-se assim: 5G NTN positioning at { "2172.5" } MHz, C/N0 { "38" } to { "50" } dB-Hz, { "324" } satellites ({ "10.0" } in view) NR { "5" } MHz: { "4500" } kHz, CRB range { "0.26" } to { "1.03" } m; median formal 3D { "2.09" } m, RMS error { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB range { "6.49" } to { "25.85" } m; median formal 3D { "25.94" } m, RMS error { "26.73" } m one-satellite Doppler pass: { "53" } samples over { "520" } s, horizontal error { "1.9" } m

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-145582d62c8c = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-7ff965e77d23 = O exemplo <c1/> define, entre outros:

# text
seg-409755afa2dd = NR { "5" } MHz

# text
seg-a99a71f7178a = NB { "200" } kHz

# text
seg-d04c7f65307d = índice

# text
seg-3a0cde9988c3 = Rótulo do resultado (o do motor): posicionamento MODELLED a partir de limites de Cramér-Rao: o passo de largura de banda para limite é uma forma fechada de manual (verificada contra integração numérica, não contra um valor trabalhado publicado); a precisão é um limite em um canal sem multipercurso com um erro de sincronização declarado, não um resultado alcançado

# attr:alt
seg-c200240dd65e = O gráfico que o motor escreve para scenarios/ntn-5g-positioning.toml, tipo de cenário ntn-positioning

# text
seg-056b5f3c8201 = <b>VALIDATED</b> O limite de Cramér-Rao do tempo de chegada a partir da largura de banda quadrática média (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espectro OFDM plano (beta = B/sqrt({ "12" })), um espectro BPSK limitado em banda (numerador de forma fechada) ou qualquer espectro por quadr Testes: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> O limite de Cramér-Rao do tempo de chegada a partir da largura de banda quadrática média (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espectro OFDM plano (beta = B/sqrt({ "12" }). Referência independente (ExternalDataset): valores trabalhados publicados (P1): Bachl, Lei and Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), limites de SSB único do NR NTN reproduzidos a partir do mapa de SSB da 3GPP TS { "38.211" } pelas próprias funções numéricas do Kshana (W_rms { "1.9616" } vs { "1.96" } MHz, sigma_t { "38.755" } vs { "39" } us, sigma_f 100.79/87.28 vs 101/87 Hz, sigma_rho 0.5970/0.5831 vs 0.60/0.58 m, cada um a menos de meia unidade do último dígito impresso); larguras de banda RMS do BPSK-R da Tabela { "1" } de Betz { "2001" } (1.128/3.477 vs

# text
# c1: label
seg-baa462153341 = Posicionamento MODELLED a partir de limites de Cramér-Rao: o passo de largura de banda para limite é uma forma fechada de manual (verificada contra integração numérica, não contra um valor trabalhado publicado); a precisão é um limite em um canal sem multipercurso com um erro de sincronização declarado, não um resultado alcançado (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED: o passo de largura de banda para limite é a forma fechada de manual, verificada contra a integração numérica dos espectros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a precisão de posicionamento é um limite em um canal sem multipercurso com um erro de sincronização declarado, não um resultado alcançado. (catálogo de tipos de cenário (<c1/>))

# text
seg-e23e35aa1203 = O passo de largura de banda para limite é uma forma fechada de manual; a precisão de posicionamento é MODELLED (um limite em um canal sem multipercurso, não um resultado alcançado). (comentário do arquivo de cenário, linhas { "12" } a { "13" })

# text
seg-ccb921bf73b5 = <s1>Anterior</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Próximo</s1>oem-interop
