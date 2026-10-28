# docs--glossary: translations (pt-BR)

# attr:aria-label, text
seg-daf25c6479c1 = Normas

# attr:title, text
seg-c851aa23ea42 = valores separados por vírgula

# text
seg-366c59b03b4f = CSV

# text
seg-cb273d6705c6 = SVG

# text
seg-49a994d77d2f = oscilador de cristal com compensação de temperatura

# text
seg-1bac97ee312a = padrão de frequência atômico de rubídio

# text
seg-b09ffb8a9095 = Monte Carlo

# text
seg-9939da5da283 = JSON

# text
seg-5907283b71da = Abreviação

# text
seg-900c7c7e99cd = GMAT

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = viés entre sistemas

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = ruído de projeção quântica

# text
seg-430b3c681347 = RTKLIB

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-e464509f3abb = razão entre a potência da portadora e a densidade de ruído

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = identificador digital de objeto

# text
seg-d41af8f18aed = GLONASS

# text
seg-1df73b95ae4d = IAU

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Estação Espacial Internacional

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8104773e1484 = STK

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = frequência ultra-alta

# text
# c1: docs/GLOSSARY.md
seg-6ce4c2164aee = Fonte: <c1/>

# text
seg-bee5d056ef03 = Definições em linguagem simples dos termos usados no Kshana. Cada verbete começa com uma linha “em termos simples” e depois acrescenta o significado preciso quando isso ajuda. As abreviações não definidas em uma seção estão na tabela de A a Z perto do final, <a1>Todas as outras abreviações, de A a Z</a1>.

# text
seg-f8c5433d1026 = Navegação e temporização

# text
seg-2a42d84608ea = <b>PNT — Positioning, Navigation, and Timing (posicionamento, navegação e temporização).</b> Saber <em>onde</em> você está, <em>para onde</em> está indo e <em>que horas são</em> — com precisão. O PNT moderno vem em sua maior parte de sinais de satélite (GNSS, os sistemas globais de navegação por satélite definidos a seguir); o Kshana estuda o que acontece com o <em>tempo</em> e a <em>posição</em> quando esses sinais se perdem.

# text
seg-6227db2c94e1 = <b>GNSS — Global Navigation Satellite System (sistema global de navegação por satélite).</b> As constelações de satélites que fornecem PNT: GPS (Global Positioning System, EUA (Estados Unidos da América)), Galileo (UE), GLONASS (Global Navigation Satellite System da Rússia), BeiDou (China). Um receptor que enxerga ≥ { "4" } satélites pode calcular uma posição 3D e um ajuste de tempo completos.

# text
seg-f8eda357e640 = <b>Interrupção / negação / degradação / bloqueio do GNSS.</b> Quando os sinais de satélite estão indisponíveis (obstruídos, bloqueados por jamming ou fora de vista). Durante uma interrupção, o sistema precisa “navegar por inércia” com seus próprios sensores de bordo. Todo o propósito do Kshana é medir quão bem ele faz isso.

# text
seg-a3ade199f465 = <b>Holdover.</b> Em termos simples: <em>por quanto tempo o relógio consegue manter a hora certa sozinho depois de perder o GNSS.</em> Um relógio melhor aguenta mais tempo antes que seu erro ultrapasse o limite permitido.

# text
seg-83b33c15312f = <b>Navegação estimada (dead-reckoning).</b> Em termos simples: <em>estimar onde você está somando o movimento medido, sem nenhuma referência externa.</em> Os erros se acumulam, de modo que um sensor inercial melhor deriva mais lentamente.

# text
seg-da9bcc994b9c = <b>Especificação / limiar.</b> O erro máximo permitido antes de a solução ser considerada “fora da especificação” — por exemplo, “a temporização deve permanecer dentro de { "20" } ns” ou “a posição dentro de { "100" } m”.

# text
seg-6f37a60a30c7 = Os sensores que o Kshana compara

# text
seg-308b59d89586 = <b>Relógio (relógio atômico).</b> Um dispositivo que mantém o tempo contando a oscilação natural de um átomo. Dois exemplos aqui:

# text
seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock (relógio atômico em escala de chip).</b> Um relógio pequeno, implantado e comercial (a referência “clássica”). Bom, mas deriva de forma perceptível em uma interrupção longa.

# text
seg-3e121d8e6400 = <b>Relógio de rede óptica (por exemplo, estrôncio).</b> Um relógio “quântico” bem mais estável; o estado da arte em laboratórios, ainda não levado ao espaço.

# text
seg-4daa6cdf8ae2 = <b>Acelerômetro.</b> Mede a aceleração (variação do movimento). Integrado duas vezes, dá a posição — de modo que qualquer erro cresce rapidamente. O <b>acelerômetro de átomos frios</b> é a versão quântica, com estabilidade de longo prazo muito melhor; o de <b>grau de navegação</b> é o clássico.

# text
seg-91793676c57c = <b>Giroscópio.</b> Mede a rotação. Um pequeno erro de rotação inclina a plataforma, o que faz a gravidade vazar para a direção horizontal e corrompe a estimativa de posição.

# text
seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit (unidade de medição inercial).</b> O próprio conjunto de acelerômetro e giroscópio: três eixos de cada, informando força específica e taxa angular. Ela mede movimento; sozinha, não sabe onde está.

# text
seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System (sistema de navegação inercial).</b> Uma IMU mais a “mecanização” que integra sua saída em atitude, velocidade e posição. O INS é o que faz a navegação estimada durante uma interrupção do GNSS, e sua exatidão é determinada pelos processos de erro da IMU listados abaixo.

# text
seg-a618ff7ee429 = <b>Transferência de tempo.</b> Enviar um sinal de tempo preciso entre dois lugares (por exemplo, de satélite para satélite). Os enlaces <b>ópticos</b> são muito mais precisos que os enlaces <b>RF</b> (radiofrequência).

# text
seg-847fbbeecfae = Como os erros são modelados (ruído do relógio)

# text
seg-5cf197bdbbad = O erro do relógio é construído a partir de “tipos de ruído” padrão, cada um com uma assinatura conhecida:

# text
# c1: q_wf
seg-3806d1b1cb50 = <b>FM branca (modulação de frequência branca).</b> Em termos simples: <em>jitter rápido e aleatório na taxa do relógio.</em> Tirar a média o reduz com o tempo. Parâmetro <c1/>.

# text
# c1: q_rw
seg-0793fdd3abab = <b>FM de passeio aleatório.</b> Em termos simples: <em>a taxa do relógio vagueia lentamente.</em> Isso domina as interrupções longas. Parâmetro <c1/>.

# text
# c1: flicker_floor
seg-42b74c8b88ff = <b>FM flicker (ruído 1/f).</b> Em termos simples: <em>um piso de ruído persistente abaixo do qual o relógio nunca consegue chegar por média.</em> Ele é plano ao longo dos tempos de média. Parâmetro <c1/>.

# text
# c1: drift
seg-b3bd841a5a2d = <b>Envelhecimento / deriva.</b> Uma variação lenta e <em>previsível</em> da taxa ao longo do tempo; por ser previsível, o estimador do Kshana a remove. Parâmetro <c1/>.

# text
# c1: q_va
seg-d929960492e4 = <b>VRW — Velocity Random Walk (passeio aleatório de velocidade).</b> O equivalente do ruído branco para o acelerômetro: chutes aleatórios na velocidade que se acumulam em erro de posição. Parâmetro <c1/>.

# text
# c1: q_arw
seg-4a97f8d14174 = <b>ARW — Angular Random Walk (passeio aleatório angular).</b> O equivalente para o giroscópio: chutes aleatórios na orientação. Parâmetro <c1/>.

# text
seg-dcd03b326110 = Como a estabilidade é medida

# text
# c1: σ_y(τ)
# c2: τ
# c3: σ_y(1 s) = 3×10⁻¹⁰
seg-2181832c6253 = <b>Desvio de Allan (<c1/>).</b> Em termos simples: <em>a forma padrão de declarar quão estável um relógio é ao longo de um tempo de média <c2/> dado.</em> A folha de dados de um relógio cita, por exemplo, <c3/>. O Kshana valida seu modelo de relógio calculando o desvio de Allan de sua própria saída e verificando que ele coincide com o número publicado. (Referência: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

# text
seg-11cbe561e633 = <b>PSD — Power Spectral Density (densidade espectral de potência).</b> Como a potência de um ruído se distribui entre as frequências; a forma formal de especificar ruído branco / de passeio aleatório / flicker.

# text
seg-0737d620eb5f = As figuras de mérito (como uma execução é pontuada)

# text
seg-20b66e0d4809 = As seis figuras de mérito operacionais de PNT que o Kshana informa (veja a tabela “Output” do README):

# text
seg-b17d08246e49 = <b>FoM — Figure of Merit (figura de mérito).</b> Um número que pontua um aspecto de uma execução, informado com sua unidade e com a indicação de se é validado ou modelado. As seis abaixo são as FoMs operacionais do Kshana.

# text
seg-b229a69fb4ac = <b>Desempenho de posicionamento / temporização</b> — o tamanho do erro, como RMS (raiz do valor quadrático médio, a média quadrática) e como o percentil 95.

# text
seg-ba3ed5a28518 = <b>Autonomia</b> — a duração do holdover (por quanto tempo ele permanece dentro da especificação sem GNSS).

# text
seg-13ecdd037098 = <b>Resiliência</b> — com que rapidez o erro cresce depois que o GNSS é perdido.

# text
seg-be0168f24d6e = <b>Disponibilidade</b> — a fração da execução que tem uma solução dentro da especificação.

# text
seg-44ef500b371d = <b>Integridade</b> — <em>você pode confiar na própria estimativa de erro do sistema?</em> O Kshana informa a fração das amostras de interrupção cujo erro verdadeiro permanece dentro do limite de proteção do filtro.

# text
seg-d1cc3819cde9 = <b>Segurança</b> — robustez contra spoofing: uma pontuação de detectabilidade de spoofing baseada na estabilidade do relógio (desde a { "v0.3.0" }), significativa apenas quando um cenário de ataque de spoofing está configurado. Ela <em>não</em> é integridade de nível aeronáutico: não calcula nenhum nível de proteção horizontal ou vertical (HPL/VPL) e não executa nenhum monitoramento autônomo de integridade pelo receptor (RAIM), avançado ou não. Esses vêm dos tipos de cenário separados de integridade e ARAIM (RAIM avançado) e são definidos em “Integridade e aumentação” abaixo. Sujeito a controle de exportação.

# text
seg-5cae59204d9e = Termos usados junto com as figuras de mérito:

# text
seg-7adc0e49a981 = <b>Spoofing.</b> Em termos simples: <em>um sinal de satélite falso que mente sobre a posição ou o tempo.</em> Um spoofer entrega ao receptor uma resposta plausível, mas errada, o que é pior que jamming porque o receptor pode não perceber.

# text
seg-2d2e6cbeade6 = <b>1-DOF — um grau de liberdade.</b> Um único eixo. O erro de posição do pacote de cenários do Kshana é de eixo único; uma resposta 3-D completa exige o modelo de três eixos.

# text
seg-14a32d281c4b = <b>Conjunto de Monte Carlo.</b> Executar o mesmo cenário muitas vezes com sementes aleatórias diferentes e informar a dispersão dos resultados, em vez de uma única execução.

# text
seg-fcbea49a3592 = <b>CI — intervalo de confiança.</b> A faixa em que se espera que uma estatística caia com uma probabilidade declarada (por exemplo, { "95" } %). Nas tabelas e nos selos do README, “CI” muitas vezes significa <b>integração contínua</b> — a execução automatizada de build e testes a cada alteração; o contexto indica qual.

# text
seg-310abfd6a64c = <b>Limite de k sigma.</b> Um limite fixado em <em>k</em> desvios padrão da própria incerteza do filtro; a figura de mérito de Integridade conta com que frequência o erro verdadeiro permanece dentro dele.

# text
# c1: src/fom.rs
seg-ad26afbaa7b4 = <b>CEP / 2DRMS — erro circular provável / duas vezes a raiz do valor quadrático médio da distância.</b> Duas formas padrão de declarar a exatidão horizontal 2-D: CEP é o raio que contém { "50" } % das correções; 2DRMS é o dobro do erro horizontal quadrático médio. A biblioteca pode calcular ambos a partir de uma covariância de posição (<c1/>), mas nenhum tipo de cenário os informa ainda.

# text
seg-fd93c1effba8 = Lendo um resultado: os termos da saída

# text
seg-3432498093cf = Estes são os nomes que você encontra em um arquivo de resultado ou no resumo do playground, primeiro em termos simples.

# text
# c1: holdover_s
seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Em termos simples: <em>quantos segundos o sistema permaneceu dentro de seu limite de erro depois que o GNSS foi perdido.</em> O Kshana informa o mais curto desses períodos de navegação por inércia entre todas as interrupções da execução, medido na grade de tempo da execução, de modo que é um limite inferior na resolução do passo de tempo. Um holdover igual à duração da interrupção significa que o limite nunca foi ultrapassado.

# text
# c1: timing_p95_ns
# c2: 0.0
seg-e68708a219f1 = <b>p95 (<c1/>).</b> Em termos simples: <em>em { "95" } % do tempo, o erro de temporização foi igual ou menor que este valor.</em> É o percentil 95 do erro ao longo da interrupção. Um valor muito pequeno pode aparecer como <c2/> em um resumo curto; o arquivo JSON (JavaScript Object Notation) de resultado contém o número em precisão total.

# text
# c1: integrity
# c2: INTEGRITY.md
seg-4dfaee63262d = <b>Integridade (<c1/>).</b> Em termos simples: <em>com que frequência a própria estimativa de erro do sistema foi honesta.</em> É a fração das amostras de interrupção cujo erro verdadeiro permaneceu dentro do limite de k sigma do filtro (definido abaixo). Um valor próximo de { "1" } significa que o estimador não subestimou seu erro. Não é um nível de proteção aeronáutico; veja “Integridade e aumentação” abaixo e <a1><c2/></a1>.

# text
# c1: security
# c2: P_md
# c3: security n/a (no attack)
# c4: applicable: false
# c5: figure_tiers
seg-5af09f5129e0 = <b>Pontuação de segurança (<c1/>).</b> Em termos simples: <em>qual a probabilidade de um ataque de spoofing ser detectado.</em> É a probabilidade de que o ataque configurado seja detectado — um menos a probabilidade de falha de detecção <c2/> — derivada da estabilidade do relógio. Só tem significado quando o cenário configura um ataque de spoofing. Sem ataque configurado, o resumo de uma linha imprime <c3/> e o resultado marca a figura como <c4/> em seu bloco <c5/>; o valor permanece no documento e significa “não aplicável”, não “segurança zero”.

# text
# c1: pdop_min
seg-70113d509997 = <b>PDOP — diluição de precisão de posição (chaves como <c1/>).</b> Em termos simples: <em>quanto a geometria dos satélites amplifica o erro de medição de distância em erro de posição.</em> O erro de posição é aproximadamente o PDOP vezes o erro de medição de distância, portanto menor é melhor. Veja <b>DOP</b> em “Estimação e geometria”.

# text
# c1: σ_y(τ)
# c2: τ
# c3: sigma_y(1 s) = 3e-10
seg-a445bf9a3c5f = <b>sigma_y (<c1/>, o desvio de Allan).</b> Em termos simples: <em>quanto a taxa de um relógio oscila quando tirada a média ao longo de um tempo <c2/>.</em> Uma linha de folha de dados como <c3/> significa que a taxa, com média de um segundo, varia cerca de { "3" } partes em 10¹⁰. Menor é um relógio mais estável. Veja “Como a estabilidade é medida” acima.

# text
# c1: σ_y²(τ) = q_wf / τ
# c2: q_wf = sigma_y(1 s)²
# c3: q_rw
# c4: drift
seg-03b4bb05148d = <b>q_wf — intensidade do ruído de frequência branco.</b> Em termos simples: <em>a intensidade do jitter rápido e aleatório na taxa de um relógio.</em> É o coeficiente em <c1/> para ruído de frequência branco, de modo que um cenário define <c2/> a partir do desvio de Allan de um segundo da folha de dados. Seus companheiros são <c3/> (ruído de frequência de passeio aleatório) e <c4/> (envelhecimento); veja “Como os erros são modelados” acima.

# text
seg-074a1337ed99 = Termos de temporização de telecomunicações

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-9f61398628e4 = As redes de telecomunicações distribuem o tempo por redes de pacotes (Precision Time Protocol) a partir de um relógio de referência alimentado por GNSS, e o Setor de Normalização das Telecomunicações da União Internacional de Telecomunicações (ITU-T) estabelece limites para o erro de tempo que cada relógio pode acrescentar. Estes termos aparecem no tipo de cenário <c1/>; veja <a1><c2/></a1>.

# text
seg-f48712300b30 = <b>TE — time error (erro de tempo).</b> Em termos simples: <em>quão longe o tempo de um relógio está do tempo de referência, em um instante.</em> Positivo ou negativo, geralmente em nanossegundos.

# text
seg-ceda70656c6a = <b>max|TE| — erro de tempo absoluto máximo.</b> Em termos simples: <em>o pior erro de tempo visto durante a medição, ignorando o sinal.</em> É o limite principal que a maioria das máscaras estabelece.

# text
seg-38d2922cd91d = <b>cTE — constant time error (erro de tempo constante).</b> Em termos simples: <em>a parte de deslocamento estável do erro de tempo</em> — o erro médio que não muda ao longo da medição.

# text
seg-a4a61df332cd = <b>dTE — dynamic time error (erro de tempo dinâmico).</b> Em termos simples: <em>a parte oscilante do erro de tempo</em> — o que resta depois de removido o deslocamento constante. É avaliado com MTIE e TDEV.

# text
seg-31c0a85788b1 = <b>MTIE — maximum time interval error (erro máximo de intervalo de tempo).</b> Em termos simples: <em>a maior oscilação do erro de tempo vista dentro de qualquer janela de um dado comprimento.</em> Para cada comprimento de janela, ele desliza uma janela ao longo do registro e toma a maior variação pico a pico; uma máscara dá o maior valor permitido para cada comprimento de janela.

# text
seg-53fa12cab0c6 = <b>TDEV — time deviation (desvio de tempo).</b> Em termos simples: <em>a divagação típica (raiz do valor quadrático médio) do erro de tempo em um dado tempo de média,</em> depois que o jitter de curto prazo é eliminado pela média. É um parente no domínio do tempo do desvio de Allan e, como o MTIE, é verificado em relação a uma máscara.

# text
seg-62b5eea14f6c = <b>PRTC — primary reference time clock (relógio de tempo de referência primário).</b> O relógio no topo de uma cadeia de temporização de telecomunicações, normalmente guiado por GNSS. Seus limites de desempenho estão na Recomendação ITU-T G.8272.

# text
seg-8d6d4538981b = <b>ePRTC — enhanced primary reference time clock (relógio de tempo de referência primário aprimorado).</b> Um PRTC com limite de erro de tempo mais estreito, sustentado por um relógio atômico local altamente estável, para poder manter o tempo durante uma longa perda de GNSS. Recomendação ITU-T G.8272.1.

# text
seg-93fa4ac7c6fa = <b>T-BC — telecom boundary clock (relógio de fronteira de telecomunicações).</b> Um relógio de rede que recebe o tempo de cima e o repassa para baixo, acrescentando um pequeno erro de tempo próprio. Recomendação ITU-T G.8273.2.

# text
seg-52d32a5db6b8 = <b>T-TSC — telecom time slave clock (relógio escravo de tempo de telecomunicações).</b> O relógio no fim da cadeia que recebe o tempo e o fornece ao equipamento que precisa dele (por exemplo, uma estação rádio base). Também coberto pela Recomendação ITU-T G.8273.2.

# text
seg-04d8ed12ca88 = <b>OCXO — oven-controlled crystal oscillator (oscilador a cristal controlado por forno).</b> Um oscilador de quartzo mantido em temperatura constante dentro de um pequeno forno, o que o torna muito mais estável que um oscilador de quartzo comum. Um relógio de holdover comum em equipamentos de rede; envelhece (deriva) de forma perceptível ao longo de dias.

# text
seg-6742f7ba35ac = <b>CSAC — chip-scale atomic clock (relógio atômico em escala de chip).</b> Um relógio atômico muito pequeno (veja “Os sensores que o Kshana compara” acima). Mais estável que um OCXO em holdovers longos, com maior custo e consumo de energia.

# text
seg-c0e0c18bd867 = Níveis de evidência: VALIDATED, MODELLED, PARTNER

# text
# c1: VERIFICATION-MATRIX.md
seg-61c0aa107fd9 = Cada capacidade da matriz de verificação verificada por máquina (<a1><c1/></a1>) traz um de três níveis.

# text
seg-13fb20435df3 = <b>VALIDATED.</b> Em termos simples: <em>conferido com a resposta de outra pessoa.</em> A saída da capacidade foi comparada com uma referência independente externa — dados reais medidos, uma biblioteca independente escrita por outra pessoa ou valores de referência publicados — e concordou dentro de uma tolerância declarada. Uma verificação de integração contínua recusa uma linha VALIDATED que não nomeie nenhuma referência independente externa.

# text
# c1: MODELLED-RATIONALE.md
seg-a5dfb48e4dcb = <b>MODELLED.</b> Em termos simples: <em>construído a partir de física sólida e verificado quanto à consistência interna, mas ainda não comparado com uma resposta externa.</em> Os valores são significativos para comparação e estudos de projeto; não são evidência de que um dispositivo real terá esse desempenho. <a1><c1/></a1> explica por que cada uma dessas linhas é modelada.

# text
seg-0512b2d2145a = <b>PARTNER.</b> Em termos simples: <em>esta parte pertence a um parceiro de hardware ou de garantia do produto, e o Kshana não afirma nada sobre ela.</em> A linha existe para que a lacuna fique visível em vez de silenciosa.

# text
seg-278dee6d3d4c = Termos de espectro e interferência

# text
# c1: spectrum
# c2: SPECTRUM.md
seg-285a240c9958 = Estes termos aparecem no tipo de cenário <c1/>; veja <a1><c2/></a1>.

# text
seg-db4fdef1c562 = <b>BPSK(n) — binary phase-shift keying (modulação por deslocamento de fase binária) a n × { "1.023" } Mchip/s.</b> A modulação de chip retangular do GPS L1 coarse/acquisition (C/A) e L2 civil (L2C) (n = { "1" }) e do GPS L5 e Galileo E5a (n = { "10" }). Seu espectro é um sinc² com nulos a cada n × { "1.023" } MHz.

# text
seg-cdd0f4194f42 = <b>BOC(m, n) — binary offset carrier (portadora com deslocamento binário).</b> Um código de espalhamento a n × { "1.023" } Mchip/s multiplicado por uma subportadora de onda quadrada a m × { "1.023" } MHz, o que divide o espectro em dois lóbulos, um de cada lado da portadora.

# text
seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexed binary offset carrier (portadora com deslocamento binário multiplexada).</b> A densidade espectral de potência 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), acordada para o serviço aberto Galileo E1 e o GPS L1C; o Galileo a transmite como BOC composto (CBOC).

# text
seg-7423f94e3018 = <b>CW — continuous wave (onda contínua).</b> Uma portadora não modulada: um único tom.

# text
seg-55d03dd4af03 = <b>J/S — razão entre jammer e sinal.</b> Potência recebida do jammer sobre a potência recebida do sinal, em decibéis.

# text
seg-b0f2974647d4 = <b>SSC — spectral separation coefficient (coeficiente de separação espectral).</b> κ = ∫ G_s(f) G_j(f) df sobre a banda do receptor: quanto do espectro de um interferente de potência unitária cai onde cai o do sinal. A densidade de portadora sobre ruído efetiva é [1/(C/N₀) + (J/S)·κ]⁻¹.

# text
seg-c5affeee5269 = <b>Figura de ruído.</b> Quanto um receptor acrescenta ao ruído térmico, como uma razão F em decibéis; a temperatura de ruído do sistema é T_ant + { "290" } K × (F − { "1" }).

# text
seg-5307c38d3036 = <b>Waterfall (cascata).</b> Uma imagem tempo-frequência de um espectro: frequência na horizontal, tempo para baixo, cor para a potência.

# text
seg-3b1ac094fdc5 = <b>Estimativa de Welch.</b> Uma densidade espectral de potência estimada pela média de periodogramas com janela e sobrepostos (Welch { "1967" }).

# text
# c1: .sigmf-meta
# c2: .sigmf-data
# c3: cf32_le
# c4: ci16_le
# c5: ci8
seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Um formato aberto de gravação: um arquivo JSON <c1/> que descreve um arquivo bruto <c2/> de amostras (aqui complexas <c3/>, <c4/> ou <c5/>).

# text
seg-83041671f422 = <b>IQ — in-phase and quadrature (em fase e em quadratura).</b> As duas componentes de uma amostra complexa em banda base.

# text
seg-39e6ea8506b3 = Termos de sinal LEO-PNT

# text
# c1: leo-signal
# c2: spectrum
# c3: LEO-SIGNAL.md
seg-36452ee3f5cc = Estes termos aparecem no tipo de cenário <c1/> e nos cenários <c2/> multibanda; veja <a1><c3/></a1>.

# text
seg-8363a15f3c5a = <b>LEO-PNT — posicionamento, navegação e temporização em órbita terrestre baixa.</b> Sinais de navegação transmitidos por satélites a algumas centenas até cerca de { "1200" } km de altitude: mais fortes e de movimento mais rápido que o GNSS de órbita terrestre média.

# text
seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> Alocações de serviço da ITU (União Internacional de Telecomunicações) em que uma banda pode se enquadrar.

# text
seg-d1e494623341 = <b>Componentes piloto, de dados e de aquisição.</b> As partes de um sinal: um piloto sem dados para medição de distância, um componente de dados que carrega a mensagem de navegação e um componente de aquisição curto e de baixa taxa, fácil de encontrar.

# text
seg-cce232b7cd6a = <b>FDMA — frequency-division multiple access (acesso múltiplo por divisão de frequência).</b> Componentes ou satélites separados pela frequência da portadora em vez de pelo código.

# text
seg-9d9476ee62b1 = <b>Largura de banda de Gabor (RMS).</b> β = √(∫ f² G df / ∫ G df) sobre a banda do receptor: a dispersão da potência de um sinal em frequência, que determina com que finura ele pode medir distância.

# text
seg-6febe9c2e506 = <b>DLL — delay lock loop (malha de captura de atraso).</b> A malha de rastreamento de código; o espaçamento do correlador adiantado-atrasado e a largura de banda de ruído determinam o jitter de medição de distância por ruído térmico.

# text
seg-5a55da97daf9 = <b>EFQPSK — enhanced Feher quadrature phase-shift keying.</b> Uma modulação de envoltória constante (Xona Pulsar); aproximada aqui por um espectro de chip retangular.

# text
seg-6dcbf1de9904 = <b>OFDM — orthogonal frequency-division multiplexing (multiplexação por divisão de frequência ortogonal).</b> Uma forma de onda multiportadora (o enlace de descida do Starlink); desenhada aqui como uma banda plana.

# text
seg-548b285c7c8e = <b>TEC — total electron content (conteúdo total de elétrons).</b> Elétrons por metro quadrado ao longo do percurso; { "1" } TECU = 10¹⁶ el/m². O atraso ionosférico de primeira ordem é { "40.3" }·TEC/f² metros.

# text
seg-dd7e0743f364 = <b>EIRP — effective isotropic radiated power (potência isotrópica radiada efetiva).</b> Potência de transmissão vezes o ganho da antena na direção do receptor.

# text
seg-aba3b3eaba85 = Integridade e aumentação

# text
seg-eab1b2c6728e = A integridade é a pergunta de <em>confiança</em>: não “quão grande é o meu erro?”, mas “consigo limitá-lo, e serei avisado quando o limite for rompido?”. Estes são os termos da aviação para isso.

# text
# c1: src/raim.rs
seg-696a73449c49 = <b>RAIM — Receiver Autonomous Integrity Monitoring (monitoramento autônomo de integridade pelo receptor).</b> Em termos simples: <em>o receptor confere os satélites uns contra os outros.</em> Com mais satélites que os quatro necessários para uma correção, as sobras (os resíduos) devem ser pequenas; um resíduo grande significa que um satélite está mentindo, e o receptor pode dizê-lo sem ajuda do solo. Implementado em <a1><c1/></a1>.

# text
# c1: ARAIM_REFERENCE.md
seg-89237433f01a = <b>ARAIM — Advanced Receiver Autonomous Integrity Monitoring (monitoramento autônomo avançado de integridade pelo receptor).</b> A forma moderna do RAIM, de dupla frequência e multiconstelação. Ele recebe uma mensagem de suporte à integridade que declara o erro assumido e a probabilidade de falha de cada satélite, e devolve níveis de proteção em vez de um indicador de sucesso/falha. O tratamento completo, com cada suposição, está em <a1><c1/></a1>.

# text
# c1: leo-navmsg
seg-4cc13de05193 = <b>SISRE — Signal-in-Space Range Error (erro de distância no sinal no espaço).</b> Em termos simples: <em>quanto a órbita e o relógio transmitidos por um satélite afastam a distância que um usuário típico mede.</em> O erro de órbita é dividido em partes radial, ao longo da trajetória e transversal, ponderadas pelo quanto cada uma aparece ao longo de uma linha de visada média, e então combinado com o erro de relógio (Montenbruck et al. { "2018" }). Para um satélite de órbita terrestre baixa, as partes ao longo da trajetória e transversal pesam muito mais que para o GPS, porque os usuários o veem muito longe do nadir. Usado pelo tipo de cenário <c1/>.

# text
# c1: leo-navmsg
# c2: kepler-rac
seg-847e40a033e1 = <b>RAC — Radial, Along-track, Cross-track (radial, ao longo da trajetória, transversal).</b> As três direções em que um erro de órbita é decomposto: para fora do centro da Terra, ao longo da direção de voo e perpendicular ao plano orbital. O modelo <c2/> do tipo de cenário <c1/> acrescenta um polinômio de correção em cada uma.

# text
seg-b725d23c839e = <b>SVID — Space-Vehicle Identifier (identificador de veículo espacial).</b> O número que uma mensagem de navegação usa para nomear o satélite que a enviou.

# text
seg-b0f850eb04b1 = <b>IOD — Issue of Data (emissão de dados).</b> Um contador que muda sempre que o conteúdo da mensagem de navegação de um satélite muda, para que um receptor possa distinguir uma mensagem nova de uma repetição. (Não confundir com uma demonstração em órbita, também abreviada IOD, como no Celeste IOD da ESA.)

# text
seg-985a5e9c9ce9 = <b>TOW — Time of Week (hora da semana).</b> Segundos desde o início da semana GNSS atual (domingo { "00" }:{ "00" }).

# text
# c1: 0x1864CFB
seg-1fc62dca46d6 = <b>CRC-24Q — verificação de redundância cíclica de 24 bits (polinômio Qualcomm).</b> A verificação de detecção de erros que as mensagens RTCM { "10403" } e Galileo carregam: um resto de 24 bits dos bits da mensagem divididos pelo polinômio <c1/>. Um receptor a recalcula e descarta uma mensagem que não coincida.

# text
# c1: sigma_ure_m
# c2: src/raim.rs
seg-abb4679dab23 = <b>URE — User Range Error (erro de distância do usuário).</b> Em termos simples: <em>quanto a órbita e o relógio transmitidos pelo próprio satélite erram cada distância até ele.</em> Também chamado de erro de sinal no espaço (SISE); é o orçamento de erro por satélite com que o ARAIM e o RAIM são alimentados (<c1/> em <a1><c2/></a1>).

# text
seg-158c210fd3fe = <b>MHSS — Multiple Hypothesis Solution Separation (separação de soluções por múltiplas hipóteses).</b> O método que o ARAIM usa. Para cada forma como a constelação poderia estar em falha, ele forma uma solução que exclui os satélites suspeitos e limita o quanto essa subsolução pode se afastar da solução com todos os satélites em vista.

# text
seg-671711003a6f = <b>HPL / VPL — Horizontal / Vertical Protection Level (nível de proteção horizontal / vertical).</b> Em termos simples: <em>o raio dentro do qual o sistema promete que o erro verdadeiro está, a um risco de integridade declarado.</em> É um limite que o algoritmo calcula, não um erro medido. Uma execução está disponível quando o nível de proteção fica abaixo do limite de alerta que a operação admite (VAL, o limite de alerta vertical; HAL, o horizontal).

# text
# c1: src/sbas.rs
seg-5bbd2d664862 = <b>SBAS — Satellite-Based Augmentation System (sistema de aumentação baseado em satélites).</b> Uma rede em solo que observa o GNSS, calcula correções e limites de integridade e os transmite a partir de satélites geoestacionários. O <b>WAAS — Wide Area Augmentation System</b> é o dos Estados Unidos; o EGNOS (European Geostationary Navigation Overlay Service) é o equivalente europeu. O Kshana calcula níveis de proteção na forma de mínimos quadrados ponderados da DO-229E (a DO-229E é o padrão de desempenho operacional mínimo da RTCA para receptores SBAS; a RTCA era antigamente a Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

# text
seg-ba8b448582af = Estimação e geometria

# text
seg-2eb6e72496b8 = <b>Estimador.</b> O algoritmo que prevê a posição/hora verdadeira durante uma interrupção a partir do modelo do sensor. O Kshana tem um preditor analítico de holdover e um <b>filtro de Kalman</b>.

# text
seg-9b4aa612c5a9 = <b>Filtro de Kalman.</b> Em termos simples: <em>um algoritmo que rastreia uma grandeza e também rastreia quão incerta ela é.</em> O Kshana usa seu limite de incerteza para calcular a Integridade.

# text
seg-8fda81dfccc9 = <b>EKF — Extended Kalman Filter (filtro de Kalman estendido).</b> Um filtro de Kalman para um problema não linear: ele lineariza o modelo em torno da estimativa atual a cada passo. A escolha padrão para acoplar o GNSS a um INS.

# text
seg-9bc2c6f74b29 = <b>Filtro de Kalman unscented (UKF).</b> A mesma tarefa sem linearizar: ele passa um pequeno conjunto de pontos de amostra escolhidos deterministicamente pelo modelo não linear verdadeiro e reconstrói a média e a covariância a partir de onde eles caem. Comporta-se melhor quando a não linearidade é forte, e é por isso que a determinação de órbita o usa.

# text
seg-a1e52820e3a0 = <b>DOP — Dilution Of Precision (diluição de precisão).</b> Em termos simples: <em>quanto a geometria dos satélites amplifica o erro de medição de distância em erro de posição ou de tempo.</em> Erro de posição ≈ PDOP × erro de medição de distância, de modo que um número baixo é boa geometria. A família: <b>GDOP</b> (geométrico — posição e tempo juntos), <b>PDOP</b> (posição), <b>HDOP</b> (horizontal), <b>VDOP</b> (vertical), <b>TDOP</b> (tempo).

# text
seg-e769a91a3e4b = <b>Constelação Walker.</b> Uma forma padrão de descrever uma constelação de satélites por seu número de planos orbitais e de satélites por plano (o GPS é aproximadamente uma camada Walker 24/6).

# text
seg-b557933a4e4d = <b>Máscara de elevação.</b> O ângulo mínimo acima do horizonte local em que um satélite é considerado utilizável; sinais muito baixos são excluídos.

# text
seg-3ac8e11c3e33 = <b>Ocultação.</b> Quando a Terra bloqueia fisicamente a linha de visada até um satélite.

# text
# c1: max(elevation mask, skyline)
# c2: SKYLINE.md
seg-249bf472cb00 = <b>Skyline (máscara de horizonte urbano).</b> Em termos simples: <em>o contorno de edifícios, guindastes ou morros contra o céu, como uma elevação para cada azimute.</em> Um satélite conta como em vista apenas acima de <c1/> em seu azimute, e um acima da máscara, mas atrás do skyline, é “mascarado pelo skyline”. O Kshana constrói um a partir de uma tabela, um cânion urbano, setores e terreno (o máximo ponto a ponto deles) ou uma predefinição REPRESENTATIVE; apenas linha de visada, sem reflexão nem difração (<a1><c2/></a1>).

# text
# c1: SKYLINE.md
seg-620a88820a2d = <b>Geometria do céu.</b> Quais satélites um local enxerga sob um skyline e o que isso faz com a solução: os fatores DOP, a covariância leste-norte-cima da correção de mínimos quadrados e sua <b>elipse de erro</b>, a região horizontal que contém a parcela declarada das correções ({ "95" } % por padrão) para erros de distância gaussianos independentes e iguais. Geometria MODELLED sob um modelo de erro declarado, não o erro real de um receptor (<a1><c1/></a1>).

# text
# c1: src/integrity/mod.rs
seg-f0e610122425 = <b>CTI — Composed Timing Integrity (integridade de temporização composta).</b> Níveis de proteção para o <em>tempo</em> em vez da posição, calculados ao longo de uma transferência entre diferentes fontes de tempo — por exemplo, de um relógio verificado por satélite (com RAIM disponível) para um em funcionamento livre em holdover — de modo que o limite permaneça válido durante a transição (<a1><c1/></a1>).

# text
# c1: src/benchmark/mod.rs
seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark.</b> Uma régua para os monitores de temporização <em>de outras pessoas</em>: ele injeta um cardápio de falhas e verifica se o nível de proteção declarado do monitor de fato limitou seu erro. Ele não faz nenhuma afirmação de exatidão própria, de modo que não pode exagerar uma (<a1><c1/></a1>).

# text
seg-8b89f8b913b9 = Órbitas e cislunar

# text
# c1: src/cr3bp.rs
seg-ba6b669eb8ba = <b>CR3BP — Circular Restricted Three-Body Problem (problema restrito circular de três corpos).</b> O sistema Terra–Lua tratado como dois corpos em órbitas circulares em torno de seu centro de massa comum, mais uma espaçonave leve demais para puxar de volta. Perto da Lua, uma elipse de Kepler de dois corpos simplesmente tem a forma errada; o CR3BP é a dinâmica mais barata que está certa (<a1><c1/></a1>).

# text
seg-2726a22bf14c = <b>NRHO — Near-Rectilinear Halo Orbit (órbita halo quase retilínea).</b> Uma órbita periódica do CR3BP que passa perto sobre um polo lunar e longe sobre o outro, de modo que, vista de ponta, é quase uma linha reta — daí “quase retilínea”. É a órbita escolhida para o Gateway lunar e mantém uma linha de visada quase contínua com a Terra.

# text
seg-2b2e6d04376c = <b>DRO — Distant Retrograde Orbit (órbita retrógrada distante).</b> Outra família do CR3BP: uma órbita grande e estável que circunda a Lua para trás, vista no referencial rotativo.

# text
# c1: finals2000A
# c2: --eop
seg-6bb9229aee5c = <b>EOP — Earth Orientation Parameters (parâmetros de orientação da Terra).</b> A oscilação e a rotação medidas, levemente irregulares, da Terra (movimento polar, UT1 (Tempo Universal { "1" }, tempo de rotação da Terra)−UTC — tempo de rotação da Terra menos o Tempo Universal Coordenado — e duração do dia) que são necessárias para converter uma posição fixa à Terra em uma inercial com melhor que metros de precisão. O IERS (International Earth Rotation and Reference Systems Service) as publica; o Kshana lê seu arquivo <c1/> por meio de <c2/>.

# text
seg-7f1e7e523e5b = Padrões, formatos e organizações

# text
seg-5d8d6144c13a = As abreviações que o README e as páginas de pacotes usam para padrões, formatos de arquivo, escalas de tempo, referenciais e os órgãos por trás deles. Cada uma também é escrita por extenso no primeiro uso nessas páginas.

# text
seg-800d42de0777 = Órbitas, referenciais e tempo

# text
seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Os propagadores analíticos padrão para órbitas de satélites publicadas.

# text
seg-87a098568846 = <b>TLE — two-line element set (conjunto de elementos de duas linhas).</b> O formato público de órbita que o SGP4 lê.

# text
seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — órbita terrestre baixa / órbita terrestre média / órbita de transferência geoestacionária / órbita geossíncrona inclinada.</b> Regimes orbitais; a maioria dos satélites GNSS voa em MEO.

# text
seg-1ec323dbd7a6 = LMO — órbita baixa de Marte.

# text
seg-d0be640282af = <b>ECI / ECEF — Earth-centred inertial / Earth-centred, Earth-fixed (inercial centrado na Terra / centrado e fixo na Terra).</b> Um referencial que não gira com a Terra e outro que gira.

# text
seg-09a937adc1db = <b>TEME — true equator, mean equinox (equador verdadeiro, equinócio médio).</b> O referencial em que o SGP4 produz sua saída.

# text
seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / sua realização, o International Terrestrial Reference Frame.</b> Os referenciais inercial e fixo à Terra modernos.

# text
seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin (origem intermediária celeste).</b> O ponto de referência da cadeia moderna de rotação da Terra, livre de equinócio.

# text
seg-a23b05c85a63 = <b>LVLH — local vertical, local horizontal (vertical local, horizontal local).</b> Um referencial que se move com a espaçonave.

# text
seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> O elipsoide da Terra que o GPS usa.

# text
seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — Tempo Universal Coordenado / Tempo Atômico Internacional / Tempo Terrestre / Tempo Universal { "1" } (tempo de rotação da Terra) / Tempo Dinâmico Baricêntrico.

# text
seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> A escala de tempo proposta para a Lua.

# text
seg-c6e5976d9dff = <b>OD — determinação de órbita.</b> Recuperar uma órbita a partir de medições de rastreamento.

# text
seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> e <b>DRO</b> são definidos em “Órbitas e cislunar” acima.

# text
seg-2e6ba9069396 = Formatos de arquivo e mensagens

# text
seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> O formato de arquivo de órbita precisa do International GNSS Service (IGS), nas versões c e d.

# text
seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> O formato de arquivo padrão para observações GNSS e efemérides transmitidas.

# text
seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format.

# text
seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Mensagens padrão para órbitas e dados de rastreamento do Consultative Committee for Space Data Systems (CCSDS).

# text
seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> O formato de texto simples dos cenários do Kshana.

# text
seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> O envelope de resultado versionado e autodescritivo do Kshana.

# text
seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Padrões de desempenho operacional mínimo da RTCA para receptores SBAS e para equipamentos aerotransportados GPS com aumentação baseada na aeronave.

# text
seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> As especificações de interface do GPS (a segunda cobre o sinal L5).

# text
seg-2230000aa30b = <b>NIST SP { "1065" }.</b> O <em>Handbook of Frequency Stability Analysis</em> do National Institute of Standards and Technology.

# text
seg-8b89719c1859 = <b>TRL — nível de maturidade tecnológica.</b> Uma escala de 1 a 9 da maturidade do hardware.

# text
seg-16c972f4ea0a = Organizações

# text
seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — a Agência Espacial Europeia, seu Centro Europeu de Operações Espaciais e sua rede europeia de rastreamento espacial.

# text
seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — a National Aeronautics and Space Administration dos EUA, seu Jet Propulsion Laboratory, sua Navigation and Ancillary Information Facility (que publica o kit de ferramentas SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) e sua Deep Space Network.

# text
seg-eaa5a2a51169 = <b>IGS</b> — o International GNSS Service. <b>IERS</b> — o International Earth Rotation and Reference Systems Service. <b>IAU</b> — a União Astronômica Internacional (cuja biblioteca SOFA, Standards of Fundamental Astronomy, e seu port aberto ERFA, Essential Routines for Fundamental Astronomy, são as referências de referenciais do Kshana).

# text
seg-81af4c0f4c48 = <b>CCSDS</b> — o Consultative Committee for Space Data Systems. <b>AIAA</b> — o American Institute of Aeronautics and Astronautics. <b>RTCA</b> — antigamente a Radio Technical Commission for Aeronautics.

# text
seg-aa0b395df17f = Software e cadeia de suprimentos

# text
seg-b42188d3a6f4 = CLI — interface de linha de comando.

# text
seg-198c591514ab = <b>MCP — Model Context Protocol</b>, o protocolo que o servidor de agentes do Kshana fala. <b>IDE — ambiente de desenvolvimento integrado.</b>

# text
seg-287bf61a1a16 = SBOM — lista de materiais de software.

# text
seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, o framework de proveniência de build sob o qual as versões do Kshana são atestadas.

# text
seg-7487c6f9ed18 = Todas as outras abreviações, de A a Z

# text
# c1: docs/
seg-56f6039bb38a = Toda abreviação usada na documentação do repositório (<c1/> e os quatro READMEs) que nenhuma seção acima define, mais algumas que uma define, repetidas para consulta. Cada página também escreve suas abreviações por extenso no primeiro uso; esta tabela é o único lugar para consultá-las todas. Algumas entradas são identificadores ou nomes em vez de abreviações, e dizem isso.

# text
seg-c0dfa446e523 = Significa

# text
seg-f272d28225ae = Onde aparece

# text
seg-ffb0596f134b = Third Generation Partnership Project

# text
seg-77c1b4478387 = o órgão que escreve os padrões 5G, incluindo redes não terrestres

# text
seg-eaf19768b977 = rede móvel de quinta geração

# text
seg-692ddc163c55 = incluindo seu posicionamento em redes não terrestres (NTN)

# text
seg-9524be916f07 = ABI

# text
seg-0e8332db764b = interface binária de aplicação

# text
seg-762ea76708dc = tags de wheel do Python

# text
seg-d419d06ed622 = ABMF

# text
seg-b294c714487d = a estação IGS em Le Moule, Guadalupe

# text
seg-586a8ea87638 = um identificador de estação de quatro caracteres

# text
seg-4cc9a09495e6 = AC

# text
seg-620e2dc5e4ca = corrente alternada

# text
seg-9cfb5dc4b4bc = como no efeito AC-Stark (deslocamento de luz)

# text
seg-90308009c536 = ADD

# text
seg-49d97c65662d = Algorithm Description Document (documento de descrição do algoritmo)

# text
seg-493b5ceaa0fb = o algoritmo aerotransportado de referência ARAIM do WG-C

# text
seg-3fe5d7f41dcd = ADEV / OADEV

# text
seg-089ac7d5ac94 = desvio de Allan / desvio de Allan sobreposto

# text
seg-23c38ecbc543 = veja desvio de Allan acima

# text
seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

# text
seg-4b642742f2d4 = números de peça de sensores inerciais (Analog Devices; Safran Sensonor; MicroStrain)

# text
seg-c4c0a93477a8 = identificadores, não abreviações

# text
seg-36743c7fe98e = AEM

# text
seg-142ca108a070 = Attitude Ephemeris Message (mensagem de efemérides de atitude)

# text
seg-c34185a83d8e = uma mensagem do CCSDS

# text
seg-dd89e1deb663 = AESS

# text
seg-898b29aaef84 = Aerospace and Electronic Systems Society

# text
seg-78692bf5addf = do IEEE

# text
seg-f429be16014e = AF

# text
seg-afa04bc28b42 = fator de média

# text
seg-b3db60632b92 = o múltiplo inteiro do intervalo de amostragem em um estimador do tipo Allan

# text
seg-6097c4709542 = AFS

# text
seg-7043ab3fe32b = Augmented Forward Signal

# text
seg-20380d29d286 = o sinal de navegação lunar do LunaNet

# text
seg-b33d60fa5832 = AGC

# text
seg-98c9c2809bd6 = controle automático de ganho

# text
seg-750b8717220b = um indicador de jamming no front end de um receptor

# text
seg-31b864b910d5 = AHP

# text
seg-f956cbe86552 = Processo de Análise Hierárquica (Analytic Hierarchy Process)

# text
seg-c2b63847e2dc = um método de ponderação multicritério (Saaty)

# text
seg-0e00edd7e222 = AI / ML

# text
seg-6d804a116a08 = inteligência artificial / aprendizado de máquina

# text
seg-079020f86d22 = AL / HAL / VAL

# text
seg-1981b764715b = limite de alerta / limite de alerta horizontal / limite de alerta vertical

# text
seg-1e52f04eb047 = o erro que um monitor de integridade precisa limitar

# text
seg-c7ce4d3299b8 = AltBOC

# text
seg-f630bcd1d523 = alternative binary offset carrier (portadora com deslocamento binário alternativo)

# text
seg-e3acb231cf4d = a modulação Galileo E5

# text
seg-79b130764f97 = média aritmética–média harmônica (desigualdade)

# text
seg-190b782b70ce = AOCS

# text
seg-6459d9bce282 = sistema de controle de atitude e órbita

# text
seg-14ec3e19c990 = AOS / TCA / LOS

# text
seg-7cdb4a7e6df4 = aquisição de sinal / instante de maior aproximação / perda de sinal

# text
seg-8b73e2c51498 = os eventos de uma passagem sobre uma estação terrena (LOS também significa linha de visada; o contexto indica qual)

# text
seg-27ceb7163571 = API

# text
seg-7903f5ff4027 = interface de programação de aplicações

# text
seg-d6bea5dea0dc = APID

# text
seg-d468b4555dbf = identificador de processo de aplicação

# text
seg-55730824c8cf = o campo de cabeçalho do Space Packet do CCSDS

# text
seg-611cd7a0d378 = APS

# text
seg-55842a648c47 = American Physical Society

# text
seg-07dcfba8a3c9 = APV

# text
seg-1a7fbb0deef2 = aproximação com guiamento vertical

# text
seg-69a6cc8a532a = APV-I: limites de alerta de { "40" } m na horizontal e { "50" } m na vertical

# text
seg-f357a0a03c60 = ARL

# text
seg-b4ce3803afa6 = comprimento médio de execução

# text
seg-08a5d53f813c = o tempo médio que um detector de mudança leva para disparar o alarme

# text
seg-519e65f68c85 = ARM / ARM64

# text
seg-1db3bdee5f76 = a arquitetura de processadores Arm / sua forma de 64 bits

# text
seg-33f6dff869b2 = ASD

# text
seg-dd98c69872e0 = densidade espectral de amplitude

# text
seg-9fb629e35a25 = a raiz quadrada de uma densidade espectral de potência

# text
seg-a020de5e94e5 = AU

# text
seg-2342680bc7a6 = unidade astronômica

# text
seg-894bf4353ce3 = { "149 597 870.7" } km

# text
seg-611aec9d1dce = AUC / ROC

# text
seg-a11aa1d8f433 = área sob a curva / característica de operação do receptor

# text
seg-4d65dbf47a5c = avaliação de detectores

# text
seg-25dc893d746a = AWS

# text
seg-20979dc817ba = Amazon Web Services

# text
seg-569160c6e52d = hospeda um espelho aberto dos ladrilhos de elevação SRTM

# text
seg-298c6a00085d = BEL

# text
seg-c7ce8fa2c544 = perda de entrada em edificações

# text
seg-b714453f9b2c = ITU-R P.2109

# text
seg-b9aec1857aa9 = BI

# text
seg-40ea7b7e321e = instabilidade de viés

# text
seg-ff2ba8692cbc = o mínimo plano do desvio de Allan de um sensor inercial

# text
seg-e7c1cfecd45e = BIPM

# text
seg-dc138478d882 = Bureau International des Poids et Mesures (Bureau Internacional de Pesos e Medidas)

# text
seg-6ec98084ac58 = publica a Circular T

# text
seg-4ff08facda60 = BKG

# text
seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Agência Federal Alemã de Cartografia e Geodésia)

# text
seg-ac4765a77015 = mantém um espelho de dados do IGS

# text
seg-a85954d9176e = BSD

# text
seg-eb42c5807e5a = Berkeley Software Distribution

# text
seg-a332a259125a = como nas licenças BSD

# text
seg-97764c651815 = BSP

# text
seg-8f85848ee08a = SPK binário

# text
seg-6e01dca47581 = um arquivo de kernel binário de efemérides SPICE

# text
seg-0157bbd7a064 = BSTAR

# text
seg-23772d56a24c = o termo de arrasto de um conjunto de elementos de duas linhas

# text
seg-628e6c686508 = CAI

# text
seg-a2418a88886c = interferômetro de átomos frios

# text
seg-273a3b8d5385 = veja QUANTUM.md

# text
seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

# text
seg-fa257dda6d45 = CC / CC BY

# text
seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

# text
seg-a1f55ee72524 = uma licença de dados ou de texto

# text
seg-1b8df20680a0 = CDDIS

# text
seg-0a158229f571 = Crustal Dynamics Data Information System

# text
seg-5b3f50bed1f6 = o arquivo de geodésia espacial da NASA

# text
seg-ee2ac06a3023 = CDF

# text
seg-0a54599e470d = função de distribuição acumulada

# text
seg-6100157bdc02 = CFAR

# text
seg-43ef1f6cd71d = taxa de falsos alarmes constante

# text
seg-b38b56b63da6 = uma regra de limiar de detector de aquisição

# text
seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

# text
seg-4dab086e5c3d = o datum do BeiDou

# text
seg-8f7751d39781 = CIP

# text
seg-e34a194da574 = Celestial Intermediate Pole (polo intermediário celeste)

# text
seg-c9b37d94f70b = CIRS

# text
seg-29e69d7f32aa = Celestial Intermediate Reference System (sistema de referência intermediário celeste)

# text
seg-a543c4d02ace = CISA

# text
seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

# text
seg-59c481cb5741 = do DHS dos EUA

# text
seg-4f7ba1fd1f4c = CM / CL

# text
seg-4fb8507eb747 = civil moderado / civil longo

# text
seg-cc0c8f1524f8 = os dois códigos GPS L2C multiplexados no tempo

# text
seg-2ea49f6a1ae9 = CMPL

# text
seg-68b147628ea1 = nível de proteção de modo comum

# text
seg-d469cd44d9d4 = o limite dos erros que um teste de resíduos não consegue ver

# text
seg-4e25d07b13c9 = CN

# text
seg-e775ec496f2b = Newtoniano convergido

# text
seg-5d679a981a34 = a correção de aberração de tempo de luz do SPICE

# text
seg-3da9a2841b6c = C/N0 (C/N₀)

# text
seg-cf60da0631b4 = em dB-Hz

# text
seg-f4488db8194d = COPRAS

# text
seg-6379891c1750 = COmplex PRoportional ASsessment

# text
seg-b99fe66bd09c = um método de classificação multicritério

# text
seg-a562dbafa35f = COSPAR

# text
seg-c09ea7bc49b0 = Committee on Space Research (Comitê de Pesquisa Espacial)

# text
seg-235850ad0d1f = emite designadores internacionais de satélites

# text
seg-dbc3e7c90fe0 = CPR

# text
seg-1fd5b461cc3d = ciclo por revolução

# text
seg-a1d4080ce019 = uma aceleração orbital empírica na frequência orbital

# text
seg-96cd47b07b44 = CPU / GPU / NPU

# text
seg-10ad2f10bec0 = unidade de processamento central / gráfica / neural

# text
seg-93621c1a1e37 = CRB / CRLB

# text
seg-70b6a0b19705 = limite de Cramér–Rao / limite inferior de Cramér–Rao

# text
seg-6eb684e34f56 = a menor variância que um estimador não viesado pode atingir

# text
seg-93c4fe0f2990 = CRD

# text
seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

# text
seg-eb95135f849c = arquivos de pontos normais do ILRS

# text
seg-f23ff835b9b0 = CRPA

# text
seg-b5c26297e11b = antena de padrão de recepção controlado

# text
seg-7111b9c4d382 = um arranjo de antenas anti-jam

# text
seg-404133a74afc = CR / RI

# text
seg-d35896b2bb24 = razão de consistência / índice aleatório

# text
seg-cfa91dc02138 = a verificação de consistência do AHP (aceitar CR < { "0.10" })

# text
seg-8572a3faf46a = CS GROUP

# text
seg-5e00428ed929 = a empresa francesa que mantém o Orekit

# text
seg-58d5f143ff3b = o nome de uma empresa, não uma abreviação a expandir

# text
seg-be388831a3e1 = CSK

# text
seg-9cf6cad11f64 = code shift keying (modulação por deslocamento de código)

# text
seg-a3bd162146d6 = CSS

# text
seg-75ddcc97f9e2 = Cascading Style Sheets

# text
seg-0d5c127b2ee5 = CUSUM

# text
seg-d40da5f47035 = soma cumulativa

# text
seg-66f752e15abc = um detector sequencial de mudança

# text
seg-92ac0357d01e = CV

# text
seg-28f75c073917 = (visada comum em transferência de tempo; o contexto indica qual)

# text
seg-507b8c235614 = CZML

# text
seg-0b76641dee1a = Cesium Language

# text
seg-fd0a7af2ebeb = o formato de cena JSON do CesiumJS

# text
seg-1aefbc0b799d = dB / dBW / dB-Hz

# text
seg-8a0d954bd13b = decibel / decibel-watt / decibel-hertz

# text
seg-c485de5bcd85 = razão de potência, potência absoluta e uma unidade de C/N0

# text
seg-6c0cbce59df5 = DC

# text
seg-ddd7d412fce7 = corrente contínua

# text
seg-0ea7fccee332 = o limite de frequência zero

# text
seg-521e2abbe12d = DCM

# text
seg-3db4487dc2a4 = matriz de cossenos diretores

# text
seg-9d3d9ca79a9d = uma matriz de rotação

# text
seg-364a2fcec10b = DCO

# text
seg-110b1eb4f532 = Developer Certificate of Origin

# text
seg-1545bd59f5ef = DCT

# text
seg-8b6866288bea = tabela de controle de projeto

# text
seg-80d95f099e9a = uma tabela de orçamento de enlace (o exemplo da banda X do Galileo do JPL DESCANSO)

# text
seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

# text
seg-ed8d5c361e79 = JPL Development Ephemeris (versões { "421" }, { "430" }, { "440" }, { "441" })

# text
seg-748af19e3f0b = efemérides planetárias e lunares; “DE-grade” significa exatidão dessa classe

# text
seg-6f880928ce0c = DEM

# text
seg-eed6ad669d4c = modelo digital de elevação

# text
seg-920f5ff86fa2 = DESCANSO

# text
seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

# text
seg-2e11a1976171 = série de monografias do JPL

# text
seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Instituto Alemão de Pesquisa Geodésica da Universidade Técnica de Munique)

# text
seg-e7cedd55549e = hospeda o EUROLAS Data Center

# text
seg-4389ecd5c81a = DGNSS

# text
seg-fb8c5992354b = GNSS diferencial

# text
seg-3fed847ae9ec = DHS

# text
seg-2845322fad33 = Department of Homeland Security

# text
seg-6b487421c547 = EUA

# text
seg-9e06c8655623 = DoD

# text
seg-7a7ea4a3f0d5 = Department of Defense

# text
seg-1f6c4757bee5 = DOF / DoF

# text
seg-e1daefad0696 = grau de liberdade

# text
seg-bf5bc69cb873 = veja 1-DOF acima

# text
seg-3b5c7c9b324d = DOR / Δ-DOR

# text
seg-3e0b6392f4d9 = differential one-way ranging / delta differential one-way ranging

# text
seg-6ba2d3b5b724 = rastreamento angular em espaço profundo

# text
seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

# text
seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

# text
seg-00ecc6de9912 = integradores numéricos

# text
seg-16c4bf2faef3 = DRMS

# text
seg-8128cc0c1482 = raiz do valor quadrático médio da distância

# text
seg-a8ed04890ded = veja 2DRMS

# text
seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

# text
seg-371644e70b75 = números de documento de folhas de dados da Microchip

# text
seg-f25e5c4de1e5 = DSAC

# text
seg-aa0d8d4b3a3b = Deep Space Atomic Clock

# text
seg-e80350ed521f = o relógio de íons de mercúrio aprisionados da NASA

# text
seg-52e838301c0b = UT1 menos UTC

# text
seg-fbce3b3b7b80 = a correção de rotação da Terra

# text
seg-8aa996f34920 = energia por bit sobre a densidade de ruído

# text
seg-463b21c0b791 = o referencial inercial alinhado ao referencial fixo à Terra no início de uma execução

# text
seg-4dc987bd9dbf = usado pelas exportações de interoperabilidade leo-pass

# text
seg-61f975df5e21 = ECMAScript / ES

# text
seg-c66e728cd2fa = o padrão por trás do JavaScript / um módulo ES

# text
seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

# text
seg-2967e958f353 = um modelo de pressão solar para GNSS (CODE: Center for Orbit Determination in Europe)

# text
seg-244af4062ccc = ECSS

# text
seg-b74029376aba = European Cooperation for Space Standardization

# text
seg-d452e23d503a = ECSS-E-ST-10-02 é o seu padrão de verificação

# text
seg-becb6685ff13 = ED

# text
seg-b6448e14a567 = documento da EUROCAE

# text
seg-ee4ada9c4c6e = como em ED-259A

# text
seg-8a57ce8403b1 = EDL

# text
seg-0f065f2290f3 = entrada, descida e pouso

# text
seg-69f37001de44 = EEE

# text
seg-18a1b66286ee = componentes elétricos, eletrônicos e eletromecânicos

# text
seg-f814c1301059 = garantia de produto espacial

# text
seg-08e455b17435 = EGM / EGM2008

# text
seg-1ed72a253035 = Earth Gravitational Model (a versão { "2008" })

# text
seg-074e3ceb394e = NGA

# text
seg-69ba7307ea4c = EIGEN

# text
seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

# text
seg-a49ce7809382 = ELECTRE

# text
seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminação e escolha que expressam a realidade)

# text
seg-efb2f919955a = um método multicritério de sobreclassificação

# text
seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, a versão MPP02 (Chapront)

# text
seg-b1d699d70339 = uma teoria lunar analítica

# text
seg-aee5eeb23064 = equador médio e equinócio médio da Terra em J2000

# text
seg-16d9b8eac95d = um referencial inercial

# text
seg-e676d5eec6e3 = EML

# text
seg-f4bba0abbda7 = um discriminador de código

# text
seg-0e4110d33849 = EMT

# text
seg-103c6de62575 = limiar efetivo do monitor

# text
seg-4b2101113387 = uma saída do ARAIM

# text
seg-0e2817aec74a = ENU / NED

# text
seg-56d5cf1544d9 = leste-norte-cima / norte-leste-baixo

# text
seg-aae7610833a7 = referenciais de nível local

# text
seg-c7d5c5d5c5b2 = EO

# text
seg-24907930c730 = observação da Terra

# text
seg-38f9c209c4ac = EPM / EPM2021

# text
seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (a versão { "2021" })

# text
seg-bd2a27a17f6d = efeméride do IAA RAS

# text
seg-01a8e43fb6c7 = ERA

# text
seg-eb78ffaf7e1d = ângulo de rotação da Terra

# text
seg-966ed500f705 = ESKF

# text
seg-e79112a3132a = filtro de Kalman de estado de erro

# text
seg-25c6b6b19d75 = ESS

# text
seg-fe2b7be913f0 = tamanho efetivo da amostra

# text
seg-57ce1c1b617b = de um filtro de partículas

# text
seg-f529300f944b = ESSR

# text
seg-869be8388d26 = European Space Software Repository

# text
seg-536d66d208e4 = ESA

# text
seg-27be9c1d7090 = ET

# text
seg-7cc2ef5b0748 = tempo de efemérides

# text
seg-e0c49639649e = o nome do TDB no SPICE

# text
seg-80de6914a5ec = EUROCAE

# text
seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

# text
seg-b4f12b7813dd = EUROLAS

# text
seg-857527c69d6e = European Laser Network

# text
seg-fa7025d88c88 = medição de distância a laser de satélites e da Lua

# text
seg-13fc009b947c = FAQ

# text
seg-f5581b33ae89 = perguntas frequentes

# text
seg-67d10fd4a4e0 = FCC

# text
seg-0a558c281968 = Federal Communications Commission

# text
seg-f6ade8c24d27 = FCNN

# text
seg-6098513947b8 = rede neural totalmente conectada

# text
seg-1de7b4410369 = FD

# text
seg-4e73ff36d37f = diferença finita

# text
seg-e43312a5fbbe = FDE

# text
seg-d6c9fb239b59 = detecção e exclusão de falhas

# text
seg-8f9d11564223 = FES / FES2004

# text
seg-1a1cf1501056 = Finite Element Solution (a versão { "2004" })

# text
seg-878b4a645ae9 = um modelo de marés oceânicas

# text
seg-55c14f474a10 = FIM

# text
seg-b68c86e68570 = matriz de informação de Fisher

# text
seg-d39671724dfc = hash Fowler–Noll–Vo, variante 1a

# text
seg-3354ad42f7dd = usado para fixar saídas de referência

# text
seg-efca4decfec0 = FOC / IOV

# text
seg-793d96ab9856 = capacidade operacional plena / validação em órbita

# text
seg-ce13cca7f222 = gerações de satélites (Galileo, Xona Pulsar)

# text
seg-58df7305e218 = FOV / IFOV

# text
seg-cafe1f8733ec = campo de visão / campo de visão instantâneo

# text
seg-4f7168e895d2 = FPGA / MCU / RTOS

# text
seg-abde801ec70b = field-programmable gate array / unidade microcontroladora / sistema operacional de tempo real

# text
seg-a082e4570309 = FSL / FSPL

# text
seg-3a8ee2932a46 = perda no espaço livre / perda de percurso no espaço livre

# text
seg-4535dadf79df = ITU-R P.525

# text
seg-c0209066dc76 = GB / KB / MB

# text
seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

# text
seg-8094e61fdd76 = GCRF

# text
seg-6c6337c7a855 = Geocentric Celestial Reference Frame

# text
seg-f050f2b8dee1 = GDAL

# text
seg-98b12fcceb01 = Geospatial Data Abstraction Library

# text
seg-1cef8718c772 = GEO

# text
seg-6131e4ea7858 = órbita geoestacionária

# text
seg-bf09433a7342 = GeoJSON

# text
seg-f8654e88af67 = Geographic JavaScript Object Notation

# text
seg-70dc52cd5059 = IETF RFC { "7946" }

# text
seg-bb8fbd2ebc28 = GG

# text
seg-b93ed4ab2b79 = gradiente de gravidade

# text
seg-d8ef4d361e86 = como em torque de gradiente de gravidade

# text
seg-12fd4eb15c4d = GHz / kHz

# text
seg-0769cc8be024 = gigahertz / quilohertz

# text
seg-3946b69535e4 = GIM

# text
seg-ef5fc608b0e5 = mapa global da ionosfera

# text
seg-8cbbff1bc1d1 = GINS / KF-GINS

# text
seg-fbe37a571772 = integração GNSS/INS / o conjunto de dados e código de filtro de Kalman GNSS/INS da Universidade de Wuhan

# text
seg-deca3cbe41ac = GIS

# text
seg-36275ece527d = sistema de informação geográfica

# text
seg-ebe8194d12b3 = GIVE

# text
seg-6a99c12984b5 = grid ionospheric vertical error (erro vertical ionosférico em grade)

# text
seg-20a40777d78a = um termo de mensagem SBAS

# text
seg-6fbfc5108833 = gLAB

# text
seg-1be22ebbedc3 = GNSS-Lab Tool

# text
seg-93b2c5b68af0 = um conjunto de processamento de dados GNSS distribuído pela ESA

# text
seg-2aa0f3147ad5 = GLIBC

# text
seg-096e00cb9d9b = a biblioteca C do GNU

# text
seg-2630ae5f0bc5 = o Global Navigation Satellite System da Rússia (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

# text
seg-361f1f18d454 = GLS

# text
seg-397d58b727ee = mínimos quadrados generalizados

# text
seg-9bb2492e5d5d = GM

# text
seg-6bd8e46e9131 = parâmetro gravitacional

# text
seg-e3a296392ac0 = a constante gravitacional vezes a massa de um corpo

# text
seg-45a8f50bce06 = General Mission Analysis Tool

# text
seg-60d33e61b446 = NASA

# text
seg-1edd65c52f46 = Goddard Mars Model { "3" }

# text
seg-45abee95253b = um campo gravitacional de Marte

# text
seg-558ea1e07042 = GMST

# text
seg-d3c4914f0d13 = tempo sideral médio de Greenwich

# text
seg-d853b1084a52 = GNC

# text
seg-34a9ddce3d5f = guiamento, navegação e controle

# text
seg-d33e343f6635 = GPOD

# text
seg-2ef6bb5a52fc = Grid Processing On Demand

# text
seg-14782f821cde = GR

# text
seg-762f364a05f3 = relatividade geral

# text
seg-3e3f45ad1178 = GRGM / GRGM660PRIM

# text
seg-948167f5f1c3 = os modelos gravitacionais lunares GRAIL do NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

# text
seg-220fae5cfc61 = Geodetic Reference System { "1980" }

# text
seg-bb3c2a337ae8 = GSD

# text
seg-691791646eb3 = distância de amostragem no solo

# text
seg-448d7036fefe = GSE

# text
seg-d05b88e7d5c5 = equipamento de apoio em solo

# text
seg-95d29f8138f9 = GSFC

# text
seg-2e1460089fed = Goddard Space Flight Center

# text
seg-7680e0663a5b = HDEV / OHDEV

# text
seg-1fd1e3322c86 = desvio de Hadamard / desvio de Hadamard sobreposto

# text
seg-bb846135ceb4 = uma medida de estabilidade insensível à deriva

# text
seg-0edc4eed2775 = HIL

# text
seg-956a26e1ff6d = hardware in the loop

# text
seg-48523cdbbbf5 = HMI / MI

# text
seg-d77e079194df = informação perigosamente enganosa / informação enganosa

# text
seg-1cbf9d6f135d = regiões do diagrama de Stanford

# text
seg-b320746fafa5 = HP

# text
seg-465a952272f3 = HTML

# text
seg-45a46390d3ba = HyperText Markup Language

# text
seg-25206f1161f0 = IAA RAS

# text
seg-1a4f063e3583 = Institute of Applied Astronomy of the Russian Academy of Sciences

# text
seg-9f434fdc21f2 = IAG

# text
seg-08fb84d2e01a = Associação Internacional de Geodesia

# text
seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

# text
seg-01880debd7e0 = Associação Internacional de Geomagnetismo e Aeronomia / seu Grupo de Trabalho V-MOD (modelagem do campo geomagnético)

# text
seg-28805f15bae8 = mantém o IGRF

# text
seg-d4ce72152bf2 = IC

# text
seg-fa95c4e7fdc2 = condição inicial

# text
seg-e4c4373d0c76 = ICAO

# text
seg-2fccffbaf4dc = Organização da Aviação Civil Internacional

# text
seg-c2d2d459177d = ICD

# text
seg-a018300615e2 = documento de controle de interface

# text
seg-433b45040abd = como no Galileo OS SIS ICD

# text
seg-5e1e49c5000e = ICGEM

# text
seg-c17be0db9e83 = International Centre for Global Earth Models

# text
seg-e9650a618b38 = ID

# text
seg-e40875ab1090 = identificador (ou identificação, como em ID de tipo de ruído)

# text
seg-c643488ba1ea = IEEE

# text
seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

# text
seg-91966e2931d4 = IETF / RFC

# text
seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

# text
seg-ce9375732735 = IF

# text
seg-746eae5ce367 = frequência intermediária

# text
seg-ed568f55aa8f = amostras do receptor

# text
seg-cb4aaa2581bb = a realização do IGS do ITRF2014

# text
seg-bfa8e6d5d0d1 = IGRF / IGRF14

# text
seg-55fed0afea05 = International Geomagnetic Reference Field

# text
seg-669611e731d0 = IGRF-14 (arquivo IGRF14.shc) é a 14ª geração

# text
seg-f7cf8ff44256 = IGSO

# text
seg-4833bd1e9c03 = órbita geossíncrona inclinada

# text
seg-2080ff6f98fd = IIF

# text
seg-cf7a31e569cd = GPS Block II Follow-on

# text
seg-8a19be8033a9 = uma geração de satélites GPS

# text
seg-68cc1c937ce9 = ILRS

# text
seg-53cc8d1f6824 = International Laser Ranging Service

# text
seg-fb5255ba4bc1 = ILS

# text
seg-b8af4d02e031 = mínimos quadrados inteiros

# text
seg-a214c483b8a8 = resolução de ambiguidades

# text
seg-4740fb9ef0b9 = IMCCE

# text
seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

# text
seg-22048a770612 = Observatório de Paris; publica o INPOP

# text
seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versão 21a

# text
seg-577acd29f11b = uma efeméride planetária

# text
seg-cdb9ea77f5a6 = IOAG

# text
seg-87f308314cd4 = Interagency Operations Advisory Group

# text
seg-690414990ad8 = ION / ITM

# text
seg-b2fbe0c3507a = Institute of Navigation / seu International Technical Meeting

# text
seg-53abad80634c = IoT

# text
seg-9b766d557bd1 = Internet das Coisas

# text
seg-1b41d114662e = IR

# text
seg-ff2d89b32d07 = risco de integridade

# text
seg-2dc9fcadccd6 = a probabilidade de informação perigosamente enganosa

# text
seg-02aeac5e2435 = IRE

# text
seg-9c9c0011de8c = Institute of Radio Engineers

# text
seg-3fbae7e11fca = um predecessor do IEEE

# text
seg-9e3d84279d56 = o deslocamento de relógio entre dois GNSS

# text
seg-2ffee4396fbd = ISL

# text
seg-505dee046f7a = enlace entre satélites

# text
seg-010ea5a76e2e = ISM

# text
seg-330b25f923db = mensagem de suporte à integridade

# text
seg-1f5a14efd417 = ARAIM

# text
seg-0ee7fcdaf5a9 = ISO

# text
seg-8c1341375f17 = Organização Internacional de Normalização

# text
seg-8291ac1ccba6 = ISO { "8601" } é o seu formato de data e hora

# text
seg-5b4dee02dccc = ITRF93 / ITRF2020

# text
seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

# text
seg-14dc2a58e2c3 = Setor de Radiocomunicações da União Internacional de Telecomunicações

# text
seg-0e8094e4d45c = suas Recomendações da série P modelam a propagação

# text
seg-3e325d97365e = IVS

# text
seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

# text
seg-2dd00d470e14 = JD / MJD

# text
seg-107e6683f70d = data juliana / data juliana modificada

# text
seg-996d4952554f = JMLR

# text
seg-a1ef35b98931 = Journal of Machine Learning Research

# text
seg-d370f89393c7 = JOSA

# text
seg-12c154fcd073 = Journal of the Optical Society of America

# text
seg-58fb16c8a046 = JRC / JRC122785

# text
seg-82f85268028f = Joint Research Centre da Comissão Europeia / um de seus números de relatório

# text
seg-23f5be8ff49e = JS

# text
seg-516ee91e60c5 = JavaScript

# text
seg-02d421e784cd = JavaScript Object Notation

# text
seg-4da0210abab0 = JSTSP

# text
seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

# text
seg-919a951f3d02 = KF

# text
seg-436a208697f1 = filtro de Kalman

# text
seg-9c92e0bc42aa = KML

# text
seg-caf09d501881 = Keyhole Markup Language

# text
seg-ffe25881cef6 = um padrão do OGC lido pelo Google Earth

# text
seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

# text
seg-e1552da90a21 = rótulos de tipo de registro do formato de texto de mensagem de navegação LEO próprio do Kshana

# text
seg-3269a4e6b3e3 = uma extensão do Kshana, não um padrão

# text
seg-b7f0168b6037 = KPI

# text
seg-a5ff89f0923d = indicador-chave de desempenho

# text
seg-1c4a7ccef434 = KSC

# text
seg-73a4bf4da46f = Kennedy Space Center

# text
seg-e401e5d923f0 = KVN

# text
seg-09f93b4d4d0b = Keyword = Value Notation

# text
seg-7379ade4ee0e = a forma de texto das mensagens do CCSDS

# text
seg-a24cf86216d0 = LANS

# text
seg-2ee81a2bc69b = Lunar Augmented Navigation Service

# text
seg-849e3161b64b = LAPACK

# text
seg-3b4f3c08a5ba = Linear Algebra PACKage

# text
seg-69cd99d2f937 = LCG

# text
seg-bcddea3df96d = gerador congruencial linear

# text
seg-8927ca404e64 = o gerador da série de testes do NIST SP { "1065" }

# text
seg-0b9b908055cf = LCNS

# text
seg-f9200a1b7246 = Lunar Communications and Navigation Services

# text
seg-5253cae4b05b = o serviço Moonlight da ESA

# text
seg-2361aef1e2e3 = LCRNS

# text
seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

# text
seg-8fc87d3026e5 = LFSR

# text
seg-bfecf2f88f17 = registrador de deslocamento com realimentação linear

# text
seg-5b09c8e3f127 = geração de códigos de espalhamento

# text
seg-944b45f65820 = LGPL

# text
seg-1e1bf7d7dc79 = GNU Lesser General Public License

# text
seg-0d4d5316b1d8 = LIL

# text
seg-6d040101c6fa = lei do logaritmo iterado

# text
seg-e48d4b1feeaf = LLI / SSI

# text
seg-81ace10136b6 = indicador de perda de travamento / indicador de intensidade de sinal

# text
seg-7d95179a5a1f = sinalizadores de observação do RINEX

# text
seg-2ac0ebb389e7 = LLR

# text
seg-29bcbb78931b = medição de distância a laser até a Lua

# text
seg-20deda97c876 = LLVM

# text
seg-5a84a3219546 = a infraestrutura de compilação LLVM (originalmente Low Level Virtual Machine)

# text
seg-277ed5c4cbcc = LNAV

# text
seg-d2fa9c420999 = mensagem de navegação legada

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-6379745571a9 = LNCSS

# text
seg-b8c48f2bfaf0 = sistema de satélites de navegação e comunicação lunar

# text
seg-4ce3c0ea7a31 = os estudos de caso de constelação em NAVIGATION { "70" }({ "4" }), navi.613

# text
seg-b13c5776e35b = LNIS

# text
seg-7c67c5753d20 = LunaNet Interoperability Specification

# text
seg-881578d31056 = LNSS

# text
seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

# text
seg-97ff1706b4bd = uma constelação lunar proposta

# text
seg-ec733de1adc5 = LPV / LPV-200

# text
seg-40d72ae4bc9a = desempenho do localizador com guiamento vertical / sua categoria de altura de decisão de { "200" } ft

# text
seg-090ba62634a8 = aproximação de aviação

# text
seg-b4921e83ddc9 = LRO

# text
seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

# text
seg-8f782bde5659 = LS

# text
seg-c5bc49526464 = segundos intercalares

# text
seg-54ea05b82cb4 = como em Δt_LS

# text
seg-15111a93c6d7 = LT

# text
seg-35231d8b9b39 = tempo de luz

# text
seg-4729314afd46 = LTE

# text
seg-1a7e158f020f = Long-Term Evolution

# text
seg-3c1b3acc46d9 = o padrão celular 4G

# text
seg-3530cdaca137 = LU

# text
seg-58ad64b9d450 = decomposição inferior–superior

# text
seg-ef1a45eba6aa = LuGRE

# text
seg-72ec36312101 = Lunar GNSS Receiver Experiment

# text
seg-84874825a5d1 = voou para a Lua em { "2025" }

# text
seg-e6719690faa2 = LuPNT

# text
seg-be19fb902b36 = a biblioteca de PNT lunar de Stanford

# text
seg-893ba320da76 = um nome

# text
seg-fc68b2fb9529 = MAAST

# text
seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

# text
seg-a24b3840d248 = Stanford

# text
seg-71063143c8be = MAIT

# text
seg-2d7aa60c26ba = fabricação, montagem, integração e teste

# text
seg-0397322eae11 = MAR099 / JUP365 / SAT441

# text
seg-bd57191f860b = soluções de efemérides de satélites do JPL para as luas de Marte, Júpiter e Saturno

# text
seg-9b0688bfc31e = identificadores

# text
seg-a8748c38de15 = MASPS

# text
seg-e25a3738b952 = padrões mínimos de desempenho de sistemas de aviação

# text
seg-16a3c8f74c1c = MATLAB

# text
seg-bebc110fded7 = MATrix LABoratory

# text
seg-e722ea781fdf = um produto de computação numérica

# text
seg-7c03fb6e56f6 = MAUT

# text
seg-e409f72ac9ab = teoria da utilidade multiatributo

# text
seg-4a29ddd9b24e = MC

# text
seg-19a7ad528cf3 = MCD

# text
seg-202b82bfefcf = Mars Climate Database

# text
seg-371da1e857e8 = MCDA

# text
seg-17d89019fd4a = análise de decisão multicritério

# text
seg-b522fc3d6c82 = MCI / MCMF

# text
seg-f5544acf642a = inercial centrado na Lua / centrado e fixo na Lua

# text
seg-f7b59f61da60 = MDB

# text
seg-0c674a59d087 = viés mínimo detectável

# text
seg-c769430226c3 = MDEV

# text
seg-33a4628c6e67 = desvio de Allan modificado

# text
seg-bde3f0e5dfa7 = MEMS

# text
seg-8b08f307de8a = sistemas microeletromecânicos

# text
seg-c960c0e048b7 = MeO / MLRO

# text
seg-48623f76be86 = MéO (Métrologie Optique), a estação a laser de Grasse / Matera Laser Ranging Observatory

# text
seg-a8fcbefbbf4c = estações de medição de distância a laser até a Lua

# text
seg-8b597c678c3f = ME / PA

# text
seg-cb56efe2fb70 = Terra média / eixos principais

# text
seg-f30f1a2778cf = os dois referenciais lunares fixos ao corpo (MOON_ME, MOON_PA)

# text
seg-308d4c93a8a3 = MGEX

# text
seg-b2b632cd52d2 = Multi-GNSS Experiment

# text
seg-86fd2d84ed21 = IGS

# text
seg-79f8412f30f2 = MIT

# text
seg-70012b81c998 = Massachusetts Institute of Technology

# text
seg-e9d7062835a9 = como na licença MIT

# text
seg-a0b70e8c4c38 = MLP

# text
seg-77abd5634603 = perceptron de múltiplas camadas

# text
seg-6975432180f6 = uma pequena rede neural

# text
seg-a4be7b1d83e3 = MOD / TOD

# text
seg-421b9611e897 = médio da data / verdadeiro da data

# text
seg-1af66f9b771d = referenciais de equador e equinócio

# text
seg-b5db821f8008 = MOORA

# text
seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

# text
seg-d26a24b5d9f0 = MOPS

# text
seg-e8707522cf5f = padrões mínimos de desempenho operacional

# text
seg-cd0720a78dbb = MPL

# text
seg-bcdaf8567381 = Mozilla Public License

# text
seg-0f45b55420be = MRO110 / MRO110B2

# text
seg-61415a003e40 = modelos gravitacionais do Mars Reconnaissance Orbiter { "110" } e 110B2

# text
seg-8404f70361e7 = MSRV

# text
seg-26a6a79755f9 = versão mínima suportada do Rust

# text
seg-959fe8ad53df = MTF

# text
seg-70d61ab4eb42 = função de transferência de modulação

# text
seg-7f60d1ac40ad = imageamento óptico

# text
seg-8598e499c145 = MVDR

# text
seg-c767dc9ae21a = resposta sem distorção de variância mínima

# text
seg-83f57219e5b7 = beamforming adaptativo

# text
seg-e1ee50b3ea0a = MWL

# text
seg-12d9510328d2 = enlace de micro-ondas

# text
seg-639266912f59 = o enlace de transferência de tempo do ACES

# text
seg-5ac07401e4f8 = NaN

# text
seg-722d679807ee = not a number (não é um número)

# text
seg-0e4abc653325 = NavIC

# text
seg-355821380384 = Navigation with Indian Constellation

# text
seg-fc13b86a8365 = NAVISP

# text
seg-2eb6cc573946 = Navigation Innovation and Support Programme

# text
seg-b518d44847fa = NAV / OBS

# text
seg-c6965d4d7202 = navegação (mensagem) / observação

# text
seg-1729ddf0eafa = os dois tipos de arquivo RINEX; o Stanford NAV Lab é o Navigation and Autonomous Vehicles Laboratory

# text
seg-f239334e4928 = NBS / NBS14

# text
seg-c8e5edff04d7 = o antigo National Bureau of Standards dos EUA / o conjunto de dados de referência de estabilidade de frequência NBS14

# text
seg-3d1ac5146fea = usado para verificar estimadores de Allan

# text
seg-37879f5ad9e0 = NEES / NIS

# text
seg-9610f0449fb2 = erro de estimação normalizado ao quadrado / inovação normalizada ao quadrado

# text
seg-af167a77a1dc = testes de consistência de filtro

# text
seg-beb7a86721ec = National Geospatial-Intelligence Agency

# text
seg-7aa223cbfe13 = NGS / NOAA

# text
seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

# text
seg-4a1040c5f2fa = NIMA / TR8350

# text
seg-4cf62b739fc6 = National Imagery and Mapping Agency / seu relatório técnico TR8350.2 (a definição do WGS { "84" })

# text
seg-ffa6025b5a70 = NIMA é o antigo nome da NGA

# text
seg-af4be907e56c = NLOS

# text
seg-22ab7d58324b = um sinal apenas refletido

# text
seg-9887902c13a1 = NNLS

# text
seg-b4cb6d6bfce4 = mínimos quadrados não negativos

# text
seg-af8ca8550600 = NORAD

# text
seg-07428e7224cf = North American Aerospace Defense Command

# text
seg-4edb033e3432 = mantém o catálogo público de satélites

# text
seg-dd984e16dbcd = NP

# text
seg-f92816d7c936 = Neyman–Pearson

# text
seg-fc214695fa83 = teoria da detecção

# text
seg-3ef8006482bb = NPA

# text
seg-81a072ee0520 = aproximação de não precisão

# text
seg-b9fd2cf6a2b9 = aviação

# text
seg-e6cb557ee6d1 = NPB

# text
seg-18510a95b308 = nutação–precessão–viés

# text
seg-b4562efbafdf = a matriz IAU 2006/2000A

# text
seg-c5d8932f6956 = NRL / NRLMSISE-00

# text
seg-9c9f5eac83b2 = Naval Research Laboratory / seu modelo de atmosfera estendido de espectrômetro de massa e radar de espalhamento incoerente, { "2000" }

# text
seg-bf373b9cd0c6 = NTN

# text
seg-0ae939342934 = rede não terrestre

# text
seg-1ae0305d8455 = 5G a partir de satélites

# text
seg-20b98c32226f = NTRS

# text
seg-1470d2af037a = NASA Technical Reports Server

# text
seg-243d375db224 = OC-0 … OC-13

# text
seg-d36b43dd505c = identificadores de afirmações excessivas

# text
seg-47ba87f3730b = linhas de CLAIMS-VS-REALITY.md

# text
seg-e0689f1fc932 = OCI

# text
seg-1a3377171d89 = Open Container Initiative

# text
seg-b5bf07ed6c8c = formato de imagem de contêiner

# text
seg-7b56c21cca93 = ODE / SDE

# text
seg-722bdf2ca73a = equação diferencial ordinária / estocástica

# text
seg-a4da10cb1150 = ODM

# text
seg-b1c25bfe0612 = mensagens de dados de órbita

# text
seg-35fe6a2f3de3 = a família do CCSDS que inclui OEM e OMM

# text
seg-c06d6aa8ba3a = OGC

# text
seg-eb1feb23de1c = Open Geospatial Consortium

# text
seg-9737495b035c = OLS / WLS

# text
seg-63bf35c31a6a = mínimos quadrados ordinários / ponderados

# text
seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

# text
seg-4be3f4155fc8 = o satélite-laboratório de software em órbita da ESA / seu conjunto de dados de detecção de anomalias

# text
seg-14b642ea59e1 = OSIP

# text
seg-4871060090a0 = Open Space Innovation Platform

# text
seg-251b3ff3eb9b = OSNMA / TESLA

# text
seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

# text
seg-95b6b14facf1 = autenticação de sinal do Galileo

# text
seg-501a89e8b32b = OS / OSes

# text
seg-5a526cda4166 = Open Service (Galileo, BeiDou), ou sistema(s) operacional(is)

# text
seg-6db10af375e3 = o contexto indica qual

# text
seg-584a7e7d4f5e = OU

# text
seg-937187abcdf6 = Ornstein–Uhlenbeck

# text
seg-9be9042ec983 = um processo de ruído com reversão à média

# text
seg-08c583f40405 = PA

# text
seg-9a24d9f45aa4 = garantia de produto (também aproximação de precisão, como em K_H,PA)

# text
seg-65ad442b3faa = PCK

# text
seg-c788fe80678e = kernel de constantes planetárias

# text
seg-46a00fdc9d5b = SPICE

# text
seg-417a52c9c154 = PDF

# text
seg-c462c83b47df = Portable Document Format

# text
seg-98aa544ec4de = Pd / Pfa

# text
seg-0c89f304435e = probabilidade de detecção / probabilidade de falso alarme

# text
seg-5bde4fd55ead = PEF

# text
seg-eb11dcb816ff = o referencial entre TEME e ITRF

# text
seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

# text
seg-47cc346307a6 = identificadores de satélites: um rótulo de satélite GPS do SP3, um número de ruído pseudoaleatório do SBAS, um nome de satélite Galileo

# text
seg-6ad2383f8545 = PHARAO

# text
seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

# text
seg-302c8cb738ac = o relógio de césio do ACES

# text
seg-2e823cd9d9a6 = PL

# text
seg-099bd07ef3cf = nível de proteção

# text
seg-7d7eaa5eb223 = PLL

# text
seg-9272ad22c094 = malha de captura de fase

# text
seg-80e051b734dd = PMC / PMC10301026

# text
seg-1f2a21c5e09f = PubMed Central / um de seus identificadores de artigo

# text
seg-3e4617444a63 = PM / FM

# text
seg-c79b1246fb61 = modulação de fase / modulação de frequência

# text
seg-279251adb2eb = ruído na fase de um relógio ou em sua frequência

# text
seg-685fc49957e2 = PN

# text
seg-209dacf76ff3 = como em medição de distância PN

# text
seg-f9cfe4e70f9a = PNG

# text
seg-bde68df8ee7e = Portable Network Graphics

# text
seg-06998de7b6be = POD

# text
seg-178f55858efb = determinação precisa de órbita

# text
seg-b7919977bf20 = PPN

# text
seg-ed81960f1282 = pós-newtoniano parametrizado

# text
seg-9683f98bec2d = PPP / RTK / SPP

# text
seg-73d777100ecd = posicionamento preciso por ponto / cinemático em tempo real / posicionamento de ponto único

# text
seg-edb97cd7ef8b = PPS

# text
seg-197b06571b4d = pulso por segundo

# text
seg-2619e854281a = PR

# text
seg-66c53cdfc3d9 = pull request

# text
seg-e4dd8a3101cb = PRN

# text
seg-6fb1378e889a = ruído pseudoaleatório (número de código)

# text
seg-6f384580af80 = como os satélites GNSS são nomeados nos sinais

# text
seg-e8ca48eb958b = PROMETHEE

# text
seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

# text
seg-d92234e26d53 = PRX

# text
seg-c5774fede0a9 = Physical Review X

# text
seg-8687e6badb6b = um periódico

# text
seg-78a947083d45 = PSD

# text
seg-6eb799bd1582 = densidade espectral de potência

# text
seg-ab1af8b3d968 = veja acima

# text
seg-f7c4f1cff2a4 = PS / SPS

# text
seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

# text
seg-2800b3a8cd2e = o PS do SPS do GPS

# text
seg-c8aa5ca0a4ea = PTB

# text
seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

# text
seg-611e7e4a34f4 = o instituto nacional de metrologia da Alemanha

# text
seg-2d4bc9f59158 = PTP

# text
seg-6291d09d3a93 = Precision Time Protocol

# text
seg-44a14eeae3dd = IEEE { "1588" }

# text
seg-bc4ad791804e = PVT

# text
seg-1939c4e19702 = posição, velocidade e tempo

# text
seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

# text
seg-95cead42b0d0 = a biblioteca de vínculo Rust–Python / Python Packaging Authority / Python Package Index

# text
seg-96b2c707a6b8 = Parametry Zemli { "1990" }

# text
seg-3d5012a62544 = o datum geodésico do GLONASS

# text
seg-9d14fb150c09 = QA

# text
seg-582cb8ea13ac = garantia da qualidade

# text
seg-7025be647972 = QEMU

# text
seg-d2209c7eea42 = Quick Emulator

# text
seg-d23b9bd48594 = QPSK

# text
seg-45db179e8e49 = quadrature phase-shift keying (modulação por deslocamento de fase em quadratura)

# text
seg-b6d487bd53ed = QZSS

# text
seg-c0484340bc52 = Quasi-Zenith Satellite System

# text
seg-531943b17837 = Japão

# text
seg-697c55525b36 = RAAN

# text
seg-85cd6997e07e = ascensão reta do nó ascendente

# text
seg-79e641db1aae = RAFS

# text
seg-9fa6a6b0e193 = RDRR

# text
seg-19b00c5b9270 = Resist–Detect–Respond–Recover (resistir, detectar, responder, recuperar)

# text
seg-76da7c5bf39a = o modelo de resiliência RethinkPNT/Firesmith

# text
seg-7bb5ed20c788 = RF

# text
seg-35b036272c8e = radiofrequência

# text
seg-404104795160 = RHEL

# text
seg-dd1bb2300eb5 = Red Hat Enterprise Linux

# text
seg-34b1e77b1ff0 = RHS

# text
seg-0b4bdbcd1476 = lado direito

# text
seg-f801cff658be = RMS / RSS

# text
seg-6b758beecbfc = raiz do valor quadrático médio / raiz da soma dos quadrados

# text
seg-8b2bd83256f1 = RNG

# text
seg-b90957003307 = gerador de números aleatórios

# text
seg-354b42e3a5d0 = RNTF

# text
seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

# text
seg-43d17f884c69 = ROI

# text
seg-597432415e53 = retorno sobre o investimento

# text
seg-7abb945359d0 = RPCF

# text
seg-8c71df162ddd = Resilient PNT Conformance Framework

# text
seg-2f030c1d70c1 = DHS dos EUA

# text
seg-82b81c1e28d6 = RTCM

# text
seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

# text
seg-4a7703f1b605 = seu padrão de mensagens carrega o CRC-24Q

# text
seg-520c91fa0ef0 = uma biblioteca de código aberto de posicionamento GNSS (biblioteca cinemática em tempo real)

# text
seg-a8b2e577e381 = RTN

# text
seg-6ddf35119d08 = radial, transversal, normal

# text
seg-b1b635ff08e4 = um referencial fixo à órbita

# text
seg-04f4b26e9283 = RW

# text
seg-b8b1a31739aa = passeio aleatório

# text
seg-8b593d7d5dbd = como em passeio aleatório do viés

# text
seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

# text
seg-928fe3abcd5b = modulação de frequência de passeio aleatório, branca e flicker / modulação de fase branca e flicker

# text
seg-7fced178bcc5 = os tipos de ruído de relógio em lei de potência

# text
seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

# text
seg-0c397d845610 = nomes de produtos da Microchip (dois relógios atômicos em escala de chip, um oscilador a cristal controlado por forno)

# text
seg-8a1ae00c4a52 = nomes, não abreviações

# text
seg-a58426a850fd = SD

# text
seg-d46cb77d53f6 = desvio padrão

# text
seg-e29dd726165f = SDD

# text
seg-0ebb68e4b6fd = Service Definition Document

# text
seg-9415da7a79ab = como no Galileo OS SDD

# text
seg-1022626b788c = SDK

# text
seg-2076da4dd4dd = kit de desenvolvimento de software

# text
seg-9fb492bced01 = SDR

# text
seg-1a1082059103 = rádio definido por software

# text
seg-0a647acd4355 = SDS

# text
seg-d0f6ae60b687 = Space Defense Squadron

# text
seg-c3f6fc1456ed = o 18º SDS mantém o catálogo de satélites dos EUA

# text
seg-cf28e3e14401 = SEP

# text
seg-a67fb04e0911 = ângulo Sol–Terra–sonda (também erro esférico provável)

# text
seg-0c7631f367e8 = SGD

# text
seg-d58ce1e25c08 = descida do gradiente estocástica

# text
seg-2f25205204e4 = SHM

# text
seg-f2e2253a31b3 = movimento harmônico simples

# text
seg-b0973ab206ed = SI

# text
seg-35624e5e4630 = Sistema Internacional de Unidades

# text
seg-02aa435dc884 = SIB

# text
seg-262a811c8b69 = Safety Information Bulletin

# text
seg-b9ee445609f5 = EASA; EASA é a Agência da União Europeia para a Segurança da Aviação

# text
seg-8d6d4fe3d155 = SINEX

# text
seg-e5c071685532 = Solution INdependent EXchange format

# text
seg-3466519e4c62 = soluções geodésicas

# text
seg-b21a3d7fb59d = SIR

# text
seg-303809c700e2 = reamostragem por importância

# text
seg-7a2e0e9cac08 = um filtro de partículas

# text
seg-6da637028ef8 = SIS / SISA

# text
seg-9779a20e50d2 = sinal no espaço / exatidão do sinal no espaço

# text
seg-c0e9f44b333d = SITAN

# text
seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

# text
seg-ceee87dd4b5e = SLR

# text
seg-c8e722f1609c = medição de distância a laser de satélites

# text
seg-76d80b0d2deb = SMAD

# text
seg-7fbda47e3858 = Space Mission Analysis and Design

# text
seg-dfc105c0178b = o livro-texto

# text
seg-5278559437c5 = SNR

# text
seg-b97c29ce3b37 = relação sinal-ruído

# text
seg-ff2faf259a15 = SOS / SSE

# text
seg-5a2e327af384 = soma dos quadrados / soma dos quadrados dos resíduos

# text
seg-453c4506fd59 = SOTA

# text
seg-7eaa0caa6916 = estado da arte

# text
seg-127e73a3610b = NIST Special Publication { "1065" }

# text
seg-bedc9a3d8d9f = o mesmo documento que o NIST SP { "1065" }

# text
seg-cf2491c1a488 = SPD / PD

# text
seg-eade81634bf5 = simétrica definida positiva / definida positiva

# text
seg-5fedf0f7b5c0 = SPDX

# text
seg-3aba3c5a5c19 = Software Package Data Exchange

# text
seg-c10b1f20f37e = os identificadores de licença nos cabeçalhos de arquivo

# text
seg-b377a91a047f = SPK

# text
seg-5603642c612d = kernel SPICE para efemérides de espaçonaves e planetas

# text
seg-cf18ba9c86d8 = SPOF

# text
seg-cfab8d8a2cdf = ponto único de falha

# text
seg-c06f64211c40 = SQM

# text
seg-7e58d6a4a92c = monitoramento da qualidade do sinal

# text
seg-a4e75468e6f9 = verificações de spoofing pela forma do correlador

# text
seg-0bb7a4875914 = SRIF

# text
seg-82da1a1f1be4 = filtro de informação de raiz quadrada

# text
seg-970edb8ec42f = SRP

# text
seg-ae097fbdabf9 = pressão de radiação solar

# text
seg-edc814ba451b = SRTM / SRTMHGT

# text
seg-b756bc93d2ea = Shuttle Radar Topography Mission / seu formato de arquivo de altura

# text
seg-4692354a98de = os ladrilhos são nomeados por seu canto sudoeste, por exemplo N36W117

# text
seg-00f36f1678d6 = SSD

# text
seg-532285d8e6ce = Solar System Dynamics

# text
seg-1d8167212f57 = o grupo do JPL

# text
seg-d21315ea8c52 = STEC

# text
seg-84689b829867 = conteúdo total de elétrons oblíquo

# text
seg-eabee4bfb30e = Systems Tool Kit

# text
seg-a7ff60ab0bd9 = um produto de análise de missão

# text
seg-17d792c12885 = o serviço de posicionamento e temporização da Iridium

# text
seg-3efaadad9c96 = STM

# text
seg-da395fa674ec = matriz de transição de estado

# text
seg-d116578b987b = SV

# text
seg-caa37a1e7d12 = veículo espacial (um satélite)

# text
seg-845e6f3a37ec = SVD

# text
seg-e775c436db4b = decomposição em valores singulares

# text
seg-3e5561868a7f = Scalable Vector Graphics

# text
seg-4c48f567e37c = TAES

# text
seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

# text
seg-39b93d9b401a = TC / TM

# text
seg-b0df03cff98a = telecomando / telemetria

# text
seg-fafb84a9796a = TDD

# text
seg-ec3b92ad43c3 = desenvolvimento orientado a testes

# text
seg-40defa915d0d = TDOA / FDOA

# text
seg-e7db8768b023 = diferença de tempo / de frequência de chegada

# text
seg-aecac9c9d2d0 = localização passiva de emissores

# text
seg-01861b3d63bf = TERCOM

# text
seg-9ef3f9cbbe77 = correspondência de contorno de terreno

# text
seg-5da9ae904ae0 = TEXBAT

# text
seg-e90183a6fc69 = Texas Spoofing Test Battery

# text
seg-941eccec7400 = dados gravados de spoofing de GNSS (OAKBAT é um conjunto de dados da mesma classe)

# text
seg-e71c15afe44e = TIE

# text
seg-19bfea0d5c88 = erro de intervalo de tempo

# text
seg-eb12660210bd = TIES

# text
seg-9335f08b6381 = Telecommunication Information Exchange Service

# text
seg-12f4af2b48c1 = contas de membros da ITU

# text
seg-c05ba396ac1e = ToA

# text
seg-78a41e672189 = tempo de chegada

# text
seg-7d821e75fdf7 = TOL

# text
seg-4c7600f40479 = tolerância

# text
seg-1f8b3be77dcc = TOPSIS

# text
seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

# text
seg-c9a6058c9715 = TOTDEV / TOTVAR

# text
seg-53a19d838c2d = desvio total / variância total

# text
seg-7350da5c5c30 = estimadores de estabilidade de alcance estendido

# text
seg-91d2f49dc7c0 = TPAMI

# text
seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

# text
seg-85692b01a12d = TPL

# text
seg-123ed92776a3 = nível de proteção de temporização

# text
seg-10c9563602b7 = veja SLOT-TIMING.md

# text
seg-d1e3f93bc0aa = TPS

# text
seg-579b1467ca5f = sistema de proteção térmica

# text
seg-3b7fe44cc552 = TRN

# text
seg-5239a432b919 = navegação referenciada ao terreno

# text
seg-1df3bcf7eb97 = TR / TN

# text
seg-ef0ff09dc412 = relatório técnico / nota técnica

# text
seg-643fa447bcee = TU Delft

# text
seg-5c5492ecd86f = Universidade de Tecnologia de Delft

# text
seg-f3f22590bc57 = TWSTFT / TWTFT

# text
seg-28c80c27a136 = transferência bidirecional de tempo e frequência por satélite / transferência bidirecional de tempo e frequência

# text
seg-e1a149ff6c43 = UBX

# text
seg-fa0e9838530e = o protocolo binário de receptor da u-blox

# text
seg-9555546fed38 = UDRE

# text
seg-5fd7aec5beda = erro diferencial de distância do usuário

# text
seg-a3f5dda611b0 = SBAS

# text
seg-b6f0baa6e478 = UERE

# text
seg-4d1cb1c3ade9 = erro de distância equivalente do usuário

# text
seg-7d87e82154ed = UFFC

# text
seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

# text
seg-f4da31f92a79 = um IEEE Transactions

# text
seg-573db7b5995b = { "300" } MHz a { "3" } GHz

# text
seg-3688c8d84cdc = UI / UX

# text
seg-42162760360f = interface de usuário / experiência de usuário

# text
seg-7a56f7e38c5a = ULA

# text
seg-4f4d9da7855c = arranjo linear uniforme

# text
seg-db65f4a7586d = ULP

# text
seg-ae7458813685 = unidade na última casa

# text
seg-d7f4df5a9d13 = precisão de ponto flutuante

# text
seg-81dc0f4f1b2c = URA / URE

# text
seg-c92cbc3e3954 = exatidão de distância do usuário / erro de distância do usuário

# text
seg-17e8fb142c6c = a URA limita para fins de integridade; a URE é a exatidão RMS

# text
seg-1e02dfc0a52b = URL

# text
seg-f726bcd9d4ad = localizador uniforme de recursos

# text
seg-088e05d67af1 = USGS

# text
seg-ffed8eca324d = United States Geological Survey

# text
seg-1ded2eb40061 = USNO

# text
seg-2b5f7bbe22e9 = United States Naval Observatory

# text
seg-39ed84639c60 = USO

# text
seg-f9f684640e53 = oscilador ultraestável

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-ba97a4005ee8 = VIKOR

# text
seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (otimização multicritério e solução de compromisso)

# text
seg-7fe170288e4e = interferometria de linha de base muito longa

# text
seg-2e95d53160df = WAAS / EGNOS

# text
seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

# text
seg-1746693259e0 = SBAS; veja acima

# text
seg-98f4f946a7ac = WASM

# text
seg-257c477dc510 = WebAssembly

# text
seg-eaf260aa0e21 = WASPAS

# text
seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

# text
seg-c9710476b8b5 = Grupo de Trabalho C da cooperação União Europeia–Estados Unidos em navegação por satélite

# text
seg-79f0e87410bf = publica os documentos de referência do ARAIM

# text
seg-199e55106e0f = WGCCRE

# text
seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

# text
seg-d1939d914701 = WGN

# text
seg-6bbc3adc6a53 = ruído gaussiano branco

# text
seg-1e422c9001d4 = WGS72 / WGS84

# text
seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

# text
seg-5964aa61f847 = o SGP4 usa constantes do WGS72

# text
seg-f4ea25131d04 = WHU

# text
seg-7d30c759d92f = Universidade de Wuhan

# text
seg-5d028f5e2120 = WSM / WPM

# text
seg-ce407535733f = modelo de soma ponderada / modelo de produto ponderado

# text
seg-cc68c85bb2b9 = agregação multicritério (WPM também significa modulação de fase branca; o contexto indica qual)

# text
seg-9041c866d202 = XML

# text
seg-0e55c3adc568 = Extensible Markup Language

# text
seg-93e0e8702167 = XOR

# text
seg-cfa3197f8c1d = ou exclusivo

# text
seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

# text
seg-195082605699 = as componentes do campo geomagnético: norte, leste, para baixo, intensidade total; declinação, inclinação

# text
seg-94835748fcbb = YAGNI

# text
seg-76430d755d74 = you aren't gonna need it (você não vai precisar disso)

# text
seg-e4e177088376 = um princípio de projeto

# text
seg-565c1908393c = ZHD

# text
seg-77a0948bc15d = atraso hidrostático zenital

# text
seg-749be52554c5 = Reprodutibilidade e licenciamento

# text
# c1: scenario + seed + version → identical result
seg-d78d9bbb905c = <b>Reprodutível (determinístico).</b> A mesma entrada sempre dá uma saída idêntica bit a bit — <c1/>. Nenhuma aleatoriedade oculta.

# text
seg-1412347e2298 = <b>Semente.</b> O número que inicializa o gerador aleatório (determinístico), de modo que as execuções sejam repetíveis.

# text
seg-3a35740e04a8 = <b>Open core.</b> O modelo de negócio: o motor é livre e de código aberto (AGPL-3.0, a GNU Affero General Public License definida abaixo; com licenciamento duplo comercial); o negócio que sustenta o projeto é suporte, integração, licenças comerciais e extensões proprietárias — não taxas por assento sobre o motor aberto.

# text
seg-8ea21ebded3c = <b>AGPL-3.0.</b> A GNU Affero General Public License v3 — uma licença de código aberto com copyleft forte, reconhecida pela OSI (Open Source Initiative). Como a GPL (GNU General Public License), mas com uma cláusula extra (§{ "13" }) que cobre software oferecido a usuários <b>por uma rede</b>: uma versão modificada acessada por uma rede deve oferecer a esses usuários o seu código-fonte correspondente. A licença aberta do Kshana.

# text
# c1: LICENSING.md
seg-f87860d8197d = <b>Licenciamento duplo.</b> Oferecer o mesmo código sob duas licenças para que os usuários escolham: aqui, a AGPL-3.0 (aberta, copyleft) <b>ou</b> uma licença comercial da Ashforde OÜ (uma sociedade limitada privada estoniana; OÜ = osaühing) para uso proprietário/fechado ao qual a AGPL não serve. Veja <c1/>.

# text
seg-dd5f4a1bbbf5 = Também usadas em kshana.dev

# text
seg-9d0c42560a90 = Abreviações que o site usa e que não estão no glossário do repositório acima.

# text
seg-67a54ce8c89e = Global Positioning System (Sistema de Posicionamento Global)

# text
seg-814b0d29bbb2 = densidade de portadora sobre ruído, em dB-Hz

# text
seg-f22a269bc575 = a banda de rádio de { "1" } a { "2" } GHz que o GNSS usa

# text
seg-1f4360a0405c = código coarse/acquisition do GPS L1

# text
seg-6f7910207534 = augmented forward signal (lunar)

# text
seg-74f02864ce32 = sistemas microeletromecânicos

# text
seg-0f931242ecc0 = UAS

# text
seg-dddfd223a3b1 = sistema de aeronave não tripulada

# text
seg-7091aabf8b6d = PL · AL

# text
seg-12d88ab45197 = nível de proteção · limite de alerta

# text
seg-78134bcc48da = aproximação com guiamento vertical, nível I

# text
seg-27328b36b476 = LEO · GEO

# text
seg-b1ae7014a663 = órbita terrestre baixa · órbita geoestacionária

# text
seg-c1d933dd3965 = OEM · OMM · TDM

# text
seg-5d0ebe2bc51c = mensagens do CCSDS de efemérides de órbita, de elementos médios de órbita e de dados de rastreamento

# text
seg-fa9240660ec4 = IGRF

# text
seg-c19fd59fdca0 = DSN

# text
seg-7979317c75d2 = Deep Space Network

# text
seg-c194401c2039 = TCXO · OCXO

# text
seg-5c9d0b4c561d = oscilador a cristal compensado em temperatura · controlado por forno

# text
seg-f3a7cc221b63 = PHM

# text
seg-08d5cfc5b460 = maser de hidrogênio passivo

# text
seg-5ed928b1c6d0 = USO · DSAC

# text
seg-b77f2ea4a521 = oscilador ultraestável · relógio atômico de espaço profundo

# text
seg-553814463110 = MTIE · TDEV

# text
seg-2d9b8af50414 = erro máximo de intervalo de tempo · desvio de tempo

# text
seg-5b155b60152f = PRTC · ePRTC

# text
seg-93d590e6408d = relógio de tempo de referência primário · PRTC aprimorado

# text
seg-8541a73eef89 = ADEV · σy(τ)

# text
seg-a2ae4a40f486 = desvio de Allan no tempo de média τ

# text
seg-96fae3b4fb8e = União Internacional de Telecomunicações, Setor de Normalização das Telecomunicações

# text
seg-24cab92c0fd3 = NIS · NEES

# text
seg-7e82e2927d59 = inovação normalizada ao quadrado · erro de estimação normalizado ao quadrado

# text
seg-7175ab55e707 = JSON · CSV · SVG

# text
seg-a9a2906d15de = JavaScript Object Notation · valores separados por vírgula · Scalable Vector Graphics

# text
seg-d3a9009a35c0 = CLI · API · IDE

# text
seg-c6418e1f785d = interface de linha de comando · interface de programação de aplicações · ambiente de desenvolvimento integrado

# text
seg-8df86177107a = SBOM · SLSA

# text
seg-e54326c78ab0 = lista de materiais de software · Supply-chain Levels for Software Artifacts

# text
seg-347b23148b8f = NDA

# text
seg-969d2489de28 = acordo de confidencialidade

# text
seg-564cfa0d3084 = Digital Object Identifier

# text
seg-5cbd99859d90 = waterfall de C/N₀

# text
seg-ed4a9e041a83 = um gráfico da densidade de portadora sobre ruído por satélite ao longo do tempo

# text
seg-1cb49c7e6c7f = HPL · VPL

# text
seg-ccdc7d672c8f = nível de proteção horizontal · vertical

# text
seg-c7a40ebac7e1 = LROC

# text
seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

# text
seg-c5da9d350518 = <s1>Anterior</s1>Introdução aos conceitos

# text
seg-670504be0531 = <s1>Próxima</s1>Guia do Studio

seg-6c10aaedf2fc = <s1>Próximo</s1>Idiomas
