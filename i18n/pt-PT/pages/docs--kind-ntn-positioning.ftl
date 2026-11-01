# docs--kind-ntn-positioning: translations (pt-PT)

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Página do tópico: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Fonte: <c1/>

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (tipo de cenário)

# text
seg-4f0edb786a35 = Posicionamento a partir de uma ligação descendente de uma rede não terrestre (NTN) 5G na banda S do serviço móvel por satélite (MSS) (banda 3GPP n256, ligação descendente de { "2170" } a { "2200" } MHz; portadora predefinida de { "2172.5" } MHz): o limite de Cramér-Rao (CRB) para o tempo de chegada, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), com beta a largura de banda quadrática média (de Gabor) do espetro OFDM plano (B/sqrt({ "12" })), e para o Doppler de um tom complexo, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), para cada sinal (por predefinição, um canal New Radio de { "5" } MHz com { "4.5" } MHz ocupados e um canal de banda estreita de { "200" } kHz com { "180" } kHz ocupados); depois, sobre qualquer constelação LEO, soluções de posição por tempo de chegada na ligação descendente com um relógio do recetor desconhecido (de semente fixa, com o limite mais um erro de sincronização da rede como sigma), o seu PDOP e o sigma 3D formal, e uma solução de posição por Doppler com um único satélite sobre a passagem mais longa com a altura mantida. MODELLED: o passo da largura de banda para o limite é a forma fechada dos manuais, verificada face à integração numérica dos espetros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a exatidão do posicionamento é um limite num canal sem multipercurso com um erro de sincronização indicado, não um resultado alcançado.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Uma execução de <c1/> resume-se assim: posicionamento 5G NTN a { "2172.5" } MHz, C/N0 de { "38" } a { "50" } dB-Hz, { "324" } satélites ({ "10.0" } à vista) NR { "5" } MHz: { "4500" } kHz, CRB de distância de { "0.26" } a { "1.03" } m; 3D formal mediano de { "2.09" } m, erro RMS de { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB de distância de { "6.49" } a { "25.85" } m; 3D formal mediano de { "25.94" } m, erro RMS de { "26.73" } m passagem Doppler com um satélite: { "53" } amostras ao longo de { "520" } s, erro horizontal de { "1.9" } m

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
seg-3a0cde9988c3 = Etiqueta do resultado (a do motor): posicionamento MODELLED a partir de limites de Cramér-Rao: o passo da largura de banda para o limite é uma forma fechada dos manuais (verificada face à integração numérica, não face a um valor trabalhado publicado); a exatidão é um limite num canal sem multipercurso com um erro de sincronização indicado, não um resultado alcançado

# attr:alt
seg-c200240dd65e = O gráfico que o motor escreve para scenarios/ntn-5g-positioning.toml, tipo de cenário ntn-positioning

# text
seg-056b5f3c8201 = <b>VALIDATED</b> O limite de Cramér-Rao para o tempo de chegada a partir da largura de banda quadrática média (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espetro OFDM plano (beta = B/sqrt({ "12" })), um espetro BPSK limitado em banda (numerador de forma fechada) ou qualquer espetro por quadr Ensaios: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> O limite de Cramér-Rao para o tempo de chegada a partir da largura de banda quadrática média (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para um espetro OFDM plano (beta = B/sqrt({ "12" }). Referência independente (ExternalDataset): Valores trabalhados publicados (P1): Bachl, Lei e Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), limites de SSB único do NR NTN reproduzidos a partir do mapa SSB da 3GPP TS { "38.211" } através das próprias funções numéricas do Kshana (W_rms { "1.9616" } vs { "1.96" } MHz, sigma_t { "38.755" } vs { "39" } us, sigma_f 100.79/87.28 vs 101/87 Hz, sigma_rho 0.5970/0.5831 vs 0.60/0.58 m, cada um a menos de meia unidade do último dígito impresso); larguras de banda RMS BPSK-R da Tabela { "1" } de Betz { "2001" } (1.128/3.477 vs

# text
# c1: label
seg-baa462153341 = Posicionamento MODELLED a partir de limites de Cramér-Rao: o passo da largura de banda para o limite é uma forma fechada dos manuais (verificada face à integração numérica, não face a um valor trabalhado publicado); a exatidão é um limite num canal sem multipercurso com um erro de sincronização indicado, não um resultado alcançado (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED: o passo da largura de banda para o limite é a forma fechada dos manuais, verificada face à integração numérica dos espetros BPSK plano e limitado em banda (consistência interna, sem nenhum valor trabalhado publicado fixado), e a exatidão do posicionamento é um limite num canal sem multipercurso com um erro de sincronização indicado, não um resultado alcançado. (catálogo de tipos de cenário (<c1/>))

# text
seg-e23e35aa1203 = O passo da largura de banda para o limite é uma forma fechada dos manuais; a exatidão do posicionamento é MODELLED (um limite num canal sem multipercurso, não um resultado alcançado). (comentário do ficheiro de cenário, linhas { "12" } a { "13" })

# text
seg-ccb921bf73b5 = <s1>Anterior</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Seguinte</s1>oem-interop
