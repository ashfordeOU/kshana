# docs--kind-leo-pnt-chain: translations (pt-BR)

# text
seg-f42465f7d066 = ns

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-49964654d5f4 = Tipo de cenário do motor v{ $version }, família <a1>Navegação em órbita terrestre baixa</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-c5478f572d21 = Página da família: <a1>Navegação em órbita terrestre baixa</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 seção { "2.4.1" } etapas { "3" } a { "9" } (sigma de referência a partir de N_wet, comprimento efetivo do percurso, fator de média da antena, profundidade de desvanecimento para { "0.01" } % a { "50" } % do tem. Referência independente (ExternalDataset): Exemplos de validação do Grupo de Estudos { "3" } da ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) para a cintilação da P.618-14, com o N_wet da P.453-14 de cada local dos mesmos exemplos; registrados em tests/fixtures/leo_link/p618_14_scintillation.csv com os URLs e a data de obtenção. A expressão de refratividade úmida a partir de temperatura e umidade não é coberta por esta linha

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Atraso de grupo { "40.3" } STEC/f^{ "2" } por banda; os coeficientes livres de ionosfera f1^2/(f1^{ "2" } - f2^{ "2" }) e -f2^2/(f1^{ "2" } - f2^{ "2" }) e a amplificação de ruído sqrt(a1^{ "2" } s1^{ "2" } + a2^. Referência independente (ExternalDataset): IS-GPS-200 seção { "20.3.3.3.3.2" }, que declara a razão de atraso de grupo L1/L2 gamma = (77/60)^{ "2" } decorrente do escalonamento de primeira ordem em 1/f^{ "2" }, e a fórmula de transmissão de Friis (Proc. IRE, { "1946" }). Valida as leis de escalonamento, não um TEC oblíquo

# text
seg-ae15d15bf151 = Página do tópico: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Fonte: <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (tipo de cenário)

# text
seg-81d1604171a5 = Um sistema LEO-PNT (posicionamento, navegação e temporização a partir de órbita terrestre baixa) de ponta a ponta, para qualquer constelação e sinal: o projeto leo-signal nomeado por signal_design (uma predefinição pública ou um projeto [signal] em linha) define o centro, a largura de banda, a taxa de chips e a divisão de EIRP de uma banda de [pass], o balanço de enlace do leo-pass fornece o C/N0 rastreado e o jitter de código limitado em banda ao longo da passagem, e uma reta de C/N0 em sin(elevação) e o SISRE de transmissão da mensagem [navmsg] (ajustado na altitude do satélite da passagem) alimentam todo sistema LEO da solução conjunta leo-pvt de [fusion] e, opcionalmente, os casos leo-ppp de [ppp]; cada transferência é listada com o seu valor e a sua unidade. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Uma execução de <c1/> resume-se assim: LEO-PNT de ponta a ponta, constelação genérica de { "1080" } km sinal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), piloto rastreado a { "10.230" } Mchip/s, deslocamento de C/N0 -2.57 dB passagem LEO-1 { "1080" } km: pico de C/N0 rastreado { "58.2" } dB-Hz, jitter de código mediano { "0.050" } m; reta de C/N0 { "35.6" } + { "24.3" } sin(el) dB-Hz mensagem kepler-rac ajuste de { "300" } s / atualização de { "300" } s: SISRE de representação { "0.907" } mm RMS (órbita { "0.005" } mm), com determinação de órbita de { "0.250" } m: { "0.250" } m repassados solução fundida: apenas GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m convergência do PPP: apenas GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } valores repassados entre etapas. MODELLED.

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
seg-0093705edf63 = Rótulo do resultado (o do motor): MODELLED — a cadeia repassa a saída de cada etapa à seguinte; as etapas mantêm os seus próprios rótulos (linhas leo-signal, leo-pass, leo-navmsg, leo-pvt e leo-ppp da matriz de verificação).

# attr:alt
seg-abe0599498c9 = O gráfico que o motor gera para scenarios/leo-pnt-end-to-end.toml, tipo de cenário leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> O tipo de cenário <c1/>: um projeto leo-signal (predefinição pública ou em linha) define o centro, a largura de banda, a taxa de chips e a divisão de EIRP de uma banda de leo-pass; a passagem fornece o C/N0 do componente rastreado e o jitter de código limitado em banda por época; um C/ de mínimos quadrados Testes: <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: a integral seno (sine_integral), a fração de potência de BPSK-R dentro de uma banda bilateral em forma fechada (bpsk_power_in_band_closed_form), a banda. Referência independente (ExternalDataset): Fixados externamente: { "90.3" } por cento de potência do lóbulo principal, o jitter coerente early-late no ponto de operação declarado, os valores tabelados da integral seno e o coeficiente de separação espectral própria de BPSK 2/({ "3" } R_c) em deslocamento zero. Apenas verificações cruzadas internas, não validação externa: a forma fechada da largura de banda de Gabor de BPSK limitada em banda e a sua assíntota, e o coeficiente de separação espectral de BPSK com deslocamento em deslocamentos não nulos, ambos

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> O tipo de cenário <c1/>: projetos de sinal parametrizados (banda, largura de banda de transmissão, alocação da ITU; componentes de aquisição, de dados e piloto com BPSK(n), BOC(m,n), MB. Referência independente (InternalConsistency): As formas fechadas validadas das duas linhas acima, a identidade de falso alarme de lei quadrática P_d(snr = { "0" }) = P_fa e o tempo médio de aquisição de Holmes, e a redução à própria cadeia SSC do tipo de cenário spectrum (o mesmo código Jammer::ssc). Os projetos em si são entradas: as predefinições marcadas REPRESENTATIVE ou WORKSHOP não são especificações publicadas, os espectros de QPSK de Feher aprimorado, de code shift keying e de OFDM são aproximados, e a forma

# text
# c1: limitations[0]
seg-752b6d88fc9c = A etapa de posicionamento modela o C/N0 como uma reta no seno da elevação entre a máscara e o zênite; a cadeia ajusta essa reta ao C/N0 rastreado da passagem, de modo que uma forma específica da passagem (um patamar isofluxo, a borda de um feixe) é reduzida a dois números. (resultado <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = O SISRE repassado às etapas de posicionamento é o erro de representação da mensagem de navegação contra uma órbita-verdade integrada pelo Kshana, mais o od_sisre_m declarado do cenário em raiz da soma dos quadrados; a própria etapa da mensagem não modela determinação nem predição de órbita. (resultado <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = A etapa de posicionamento calcula o seu próprio jitter de malha de captura de atraso a partir do C/N0 repassado com uma fórmula de largura de banda ilimitada; a passagem informa ao lado o jitter limitado em banda do projeto real. (resultado <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = A etapa de posicionamento preciso por ponto toma o SISRE da mensagem como o erro de órbita e de relógio LEO; o seu ruído de código e de fase permanece entrada própria da etapa. (resultado <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Um satélite, o primeiro cuja banda traz o projeto, representa todo o sistema LEO nas etapas de passagem e de mensagem. (resultado <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED — a cadeia repassa a saída de cada etapa à seguinte; as etapas mantêm os seus próprios rótulos (linhas leo-signal, leo-pass, leo-navmsg, leo-pvt e leo-ppp da matriz de verificação). (resultado <c1/>)

# text
seg-bf452e9ae07f = MODELLED: cada etapa mantém o seu próprio rótulo; a cadeia não acrescenta física. (comentário do arquivo de cenário, linha { "25" })

# text
seg-0bff72185f12 = <s1>Anterior</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Próximo</s1>leo-ppp
