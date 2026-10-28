# docs--kind-leo-pnt-chain: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14, secção { "2.4.1" }, passos { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do trajeto, fator de média da antena, profundidade do desvanecimento para { "0.01" } % a { "50" } % do tem. Referência independente (ExternalDataset): exemplos de validação do Grupo de Estudo { "3" } da ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação da P.618-14, com o N_wet da P.453-14 de cada local retirado dos mesmos exemplos; guardados em tests/fixtures/leo_link/p618_14_scintillation.csv com os URL e a data de obtenção. A expressão da refratividade húmida a partir da temperatura e da humidade não é abrangida por esta linha

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes sem ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação do ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referência independente (ExternalDataset): IS-GPS-200, secção { "20.3.3.3.3.2" }, que indica a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } decorrente do escalonamento de primeira ordem em 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escalonamento, não um TEC oblíquo

# text
seg-ae15d15bf151 = Página do tema: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Fonte: <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (tipo de cenário)

# text
seg-81d1604171a5 = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir da órbita terrestre baixa) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal indicado por signal_design (uma predefinição pública ou um projeto [signal] em linha) define o centro, a largura de banda, a taxa de chips e a repartição da EIRP de uma banda [pass], o orçamento de ligação leo-pass fornece o C/N0 seguido e o jitter de código limitado em banda ao longo da passagem, uma reta de C/N0 em sin(elevação) e o SISRE de difusão da mensagem [navmsg] (ajustado à altitude do satélite da passagem) alimentam todos os sistemas LEO da solução de posição conjunta leo-pvt de [fusion] e, opcionalmente, os casos leo-ppp de [ppp]; cada transferência é listada com o seu valor e unidade. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Uma execução de <c1/> resume-se assim: LEO-PNT de ponta a ponta, constelação genérica de { "1080" } km sinal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), piloto seguido a { "10.230" } Mchip/s, desvio de C/N0 de -2.57 dB passagem LEO-1 { "1080" } km: C/N0 seguido máximo de { "58.2" } dB-Hz, jitter de código mediano de { "0.050" } m; reta de C/N0 { "35.6" } + { "24.3" } sin(el) dB-Hz mensagem kepler-rac ajuste de { "300" } s / atualização de { "300" } s: SISRE de representação de { "0.907" } mm RMS (órbita { "0.005" } mm), com determinação de órbita de { "0.250" } m: { "0.250" } m transmitidos solução fundida: só GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m convergência PPP: só GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } valores transmitidos entre fases. MODELLED.

# text
# c1: signal_design
# c2: pass
# c3: fusion
seg-21babf07292a = Campos obrigatórios: <c1/>, <c2/>, <c3/>

# text
# c1: name
# c2: description
# c3: seed
# c4: signal
# c5: navmsg
# c6: od_sisre_m
# c7: ppp
seg-f7bd59312f9b = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-585a1b0d5950 = O exemplo <c1/> define, entre outros:

# text
seg-be21370c2446 = joint

# text
seg-f9c560b3c318 = Galileo

# text
seg-28b34c8ae7c5 = galileo

# text
seg-0093705edf63 = Etiqueta do resultado (a do motor): MODELLED — a cadeia transmite o resultado de cada fase à seguinte; as fases mantêm as suas próprias etiquetas (linhas leo-signal, leo-pass, leo-navmsg, leo-pvt e leo-ppp da matriz de verificação).

# attr:alt
seg-abe0599498c9 = O gráfico que o motor escreve para scenarios/leo-pnt-end-to-end.toml, tipo de cenário leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> O tipo de cenário <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chips e a repartição da EIRP de uma banda leo-pass; a passagem fornece o C/N0 da componente seguida e o jitter de código limitado em banda por época; um C/ de mínimos quadrados Ensaios: <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: o integral seno (sine_integral), a fração de potência BPSK-R dentro de uma banda de dois lados em forma fechada (bpsk_power_in_band_closed_form), a banda-. Referência independente (ExternalDataset): Fixados externamente: { "90.3" } por cento de potência no lóbulo principal, o jitter coerente early-late no ponto de funcionamento indicado, os valores tabelados do integral seno e o coeficiente de separação espetral própria BPSK 2/({ "3" } R_c) com desvio nulo. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor BPSK limitada em banda e a sua assíntota, e o coeficiente de separação espetral BPSK com desvio, para desvios não nulos, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, atribuição da ITU; componentes de aquisição, de dados e piloto com BPSK(n), BOC(m,n), MB. Referência independente (InternalConsistency): As formas fechadas validadas das duas linhas anteriores, a identidade de falso alarme da lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos propriamente ditos são entradas: as predefinições assinaladas como REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espetros QPSK de Feher melhorado, de modulação por deslocamento de código e OFDM são aproximados, e a forma

# text
# c1: limitations[0]
seg-752b6d88fc9c = A fase de posicionamento modela o C/N0 como uma reta no seno da elevação entre a máscara e o zénite; a cadeia ajusta essa reta ao C/N0 seguido da passagem, pelo que uma forma específica da passagem (um patamar isofluxo, uma orla do feixe) fica reduzida a dois números. (resultado <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = O SISRE transmitido às fases de posicionamento é o erro de representação da mensagem de navegação face a uma órbita verdadeira integrada pelo Kshana, mais o od_sisre_m indicado no cenário, em soma quadrática; a própria fase da mensagem não modela determinação nem previsão de órbita. (resultado <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = A fase de posicionamento calcula o seu próprio jitter do laço de bloqueio de atraso a partir do C/N0 transmitido, com uma fórmula de largura de banda ilimitada; a passagem apresenta, a par, o jitter limitado em banda do projeto real. (resultado <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = A fase de posicionamento pontual preciso toma o SISRE da mensagem como o erro de órbita e relógio do LEO; o seu ruído de código e de fase continua a ser uma entrada própria da fase. (resultado <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Um satélite, o primeiro cuja banda transporta o projeto, representa todo o sistema LEO nas fases da passagem e da mensagem. (resultado <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED — a cadeia transmite o resultado de cada fase à seguinte; as fases mantêm as suas próprias etiquetas (linhas leo-signal, leo-pass, leo-navmsg, leo-pvt e leo-ppp da matriz de verificação). (resultado <c1/>)

# text
seg-bf452e9ae07f = MODELLED: cada fase mantém a sua própria etiqueta; a cadeia não acrescenta física. (comentário do ficheiro de cenário, linha { "25" })

# text
seg-0bff72185f12 = <s1>Anterior</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Seguinte</s1>leo-ppp
