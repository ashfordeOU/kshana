# docs--claims-vs-reality: translations (pt-PT)

# text
seg-a47934361f43 = Fluxos NMEA para treino de tripulações

# text
seg-ee2e250497f9 = Exportação para test bench

# text
seg-2bd2101ce454 = Superfície

# text
seg-ad856ad710eb = Estado

# text
seg-98d0bc6b40ce = Mapeamento de compliance de referenciais públicos

# text
seg-80f3f0aae42c = Mapa de interferência

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Fonte: <c1/>

# text
seg-bf5c2811ce29 = Afirmações vs. realidade — registo de afirmações excessivas

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Uma auditoria independente de uma versão anterior do Kshana catalogou catorze <b>afirmações excessivas</b> (<c1/>…<c2/>): locais em que uma superfície pública (README, playground, etiquetas de FoM (figura de mérito), pacotes de cenários) descrevia uma capacidade de forma mais forte do que o código entregava. Esta página é o registo de encerramento: cada linha indica a afirmação excessiva original, como foi resolvida e as provas. Surgem dois tipos de resolução:

# text
seg-39250970dbbf = <b>Afirmação retirada</b> — a formulação foi corrigida para corresponder ao código (reenquadramento honesto, sem alteração de capacidade). «Zero código = zero afirmação.»

# text
seg-fb7da0f79ead = <b>Superada</b> — a capacidade real foi posteriormente construída e testada, pelo que a afirmação forte passou a ser <em>exata</em>.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Uma proteção contra regressões (<c1/>) analisa as superfícies públicas em produção (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> e as páginas iniciais do crates.io, do PyPI (Python Package Index) e do npm <c8/>, <c9/>, <c10/>) em cada execução de CI (integração contínua) e falha se alguma das expressões de afirmação excessiva retiradas voltar a aparecer sem ressalvas — de modo que uma linha não possa regredir silenciosamente de GREEN.

# text
seg-dafc6f322f34 = Todas as catorze linhas estão <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (afirmação excessiva)

# text
seg-0e01d4053d7f = Afirmação excessiva original

# text
seg-36bf87638923 = Resolução

# text
seg-70a952c4150b = «estimador conjunto de fusão de Kalman» implicava um único filtro de covariância cruzada; o código executava dois estimadores independentes

# text
seg-d5682a7fdb11 = <b>Superada</b> — foi construído um filtro de Kalman acoplado de relógio+posição com covariância cruzada real

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } testes, incluindo um ensemble de 100 ensaios acoplado-vs-desacoplado que exige que o RMS (raiz do valor quadrático médio) da posição acoplada seja inferior a { "0.6" }× o do desacoplado e que o filtro acoplado ganhe em pelo menos { "90" } dos { "100" } ensaios); CAPABILITY «Fusão de sensores» → completo

# text
seg-334fc345d501 = «RAIM (monitorização autónoma de integridade pelo recetor) de deteção de spoofing assistida por relógio» implicava um detetor RAIM multissatélite

# text
seg-cf0795c2ee02 = <b>Afirmação retirada → Superada</b> — reenquadrada como um limite de detetabilidade de spoofing por estabilidade do relógio; o RAIM/ARAIM real (HPL/VPL (HPL: nível de proteção horizontal; VPL: nível de proteção vertical)) chegou depois

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } testes — ARAIM instantâneo + de separação de soluções, HPL/VPL, FDE (deteção e exclusão de falhas), diagramas de Stanford); <c2/>

# text
seg-8b47f69dbb76 = «demonstrador de jamming» sem código de jamming por trás

# text
seg-bfff34d5a250 = <b>Superada</b> — foi construído um modelo de jamming por orçamento de ligação J/S → C/N₀ efetivo → perda de seguimento

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } testes); linha «Resiliência» do README

# text
seg-bae512770cd6 = «Modelo completo de ruído por variância de Allan de IMU (unidade de medição inercial) numa tríade de IMU» — o modelo era de eixo único

# text
seg-50c0b5855cb9 = <b>Afirmação retirada → Superada</b> — reenquadrado como um orçamento de erros de 1 DOF (DOF: grau de liberdade); passou depois a ser distribuído um INS (sistema de navegação inercial) strapdown de três eixos

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> strapdown de três eixos (atitude em quaterniões, mecanização NED (norte-este-baixo), coning/sculling); ROADMAP «Inercial»

# text
seg-ad250a99b05f = «Integração PNT (posicionamento, navegação e temporização) híbrida» implicava um filtro GNSS/INS (GNSS: sistema global de navegação por satélite) acoplado; era um orçamento de erros de navegação estimada

# text
seg-85fb58d37a5d = <b>Afirmação retirada → Superada</b> — reenquadrada como navegação estimada com uma nova aquisição configurável; passou depois a ser distribuída uma fusão GNSS/INS fortemente acoplada real

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (filtro de Kalman unscented (UKF) de 17 estados com navegação estimada quântica CAI (CAI: interferómetro de átomos frios)); CAPABILITY «Fusão de sensores» → completo

# text
seg-46a637f8e967 = «validado a ~{ "2" } %» implicava um limiar apertado e imposto

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Afirmação retirada</b> — <c1/> indica o limiar <em>imposto</em> ({ "20" }–{ "25" } % com média de sementes); «~{ "2" } %» rotulava uma observação típica, não o limiar

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = Cabeçalho «Sobre as tolerâncias» de <c1/>

# text
seg-85ec2fe9c7f7 = «determinístico entre plataformas» sem provas registadas

# text
seg-6e516f04db89 = <b>Afirmação retirada</b> — cadeia de ferramentas fixada numa versão exata; hashes de referência por cenário registados com uma verificação de reprodutibilidade. (Identidade bit a bit <em>entre</em> SO/arquitetura (SO: sistema operativo) continua a ser um ponto em aberto, declarado honestamente.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (canal <c2/>); <c3/> (valores numéricos até { "1e-6" }); <c4/> (hash da impressão digital de entrada e da forma de cada resultado, executado na matriz de CI Linux, macOS e Windows); <c5/>

# text
seg-2708139388ed = «simulador PNT híbrido quântico-clássico» implicava física quântica de primeiros princípios

# text
seg-717167714e83 = <b>Afirmação retirada → Superada</b> — reenquadrado como um simulador de resiliência PNT que usa modelos de desempenho de sensores quânticos; chegou depois a física CAI Mach–Zehnder de primeiros princípios

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } testes — fase de Mach–Zehnder, ruído de projeção <c2/>, função de transferência de vibração, sistemáticos de Coriolis + AC-Stark (AC: corrente alternada)); <c3/>

# text
seg-5c6b7d4f2029 = A FoM de «Desempenho de Integridade» implicava integridade de aviação HPL/VPL/RAIM

# text
seg-ee5487da890c = <b>Afirmação retirada + Superada (em camadas)</b> — a FoM do cenário por execução é honestamente rotulada <em>autoconsistência do filtro</em> (<b>não</b> integridade de aviação); o HPL/VPL ARAIM real é apresentado <em>em separado</em>, de modo que os dois nunca se confundam

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/>: autoconsistência, com ressalvas); <c3/> + <c4/> (ARAIM real)

# text
seg-0686fa147c96 = FoM de Segurança apresentada como sempre significativa, mesmo sem ataque

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Afirmação retirada</b> — a FoM de Segurança (<c1/>) é enquadrada no contexto do detetor de spoofing e só é significativa quando um cenário de ataque está configurado

# text
seg-8f7b211b5a0c = linha «Resiliência» do README; a FoM de Segurança é definida no ponto de especificação operacionalmente prejudicial

# text
seg-d66421174e94 = A FoM de «Desempenho de Posicionamento» implicava exatidão completa no domínio da posição

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Afirmação retirada</b> — rotulada como <c1/> de 1 DOF para os pacotes inercial/híbrido, explicitamente <b>não</b> como CEP/2DRMS 2-D (CEP: erro circular provável) nem exatidão ponderada por DOP (DOP: diluição de precisão)

# text
seg-e8115df73c10 = tabela de figuras de mérito do README (linha «Desempenho de Posicionamento»)

# text
seg-5c73759a2454 = números de FoM inercial lidos como estatísticas de ensemble a partir de sementes únicas

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Afirmação retirada</b> — uma execução única é assinalada com <c1/>; <c2/> reporta média/dispersão/IC de { "95" } % por bootstrap

# text
seg-bf737455e6f2 = tabela de FoM do README; testes de envelope de cobertura de cenários

# text
seg-aa362992b5da = o cenário «constelação GPS (Sistema de Posicionamento Global) SGP4 (Perturbações Gerais Simplificadas { "4" })» usava TLE (conjuntos de elementos de duas linhas) de substituição sintéticos

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Superada</b> — o cenário incorpora agora um instantâneo <c1/> genuíno do Celestrak, com data, e somas de verificação estritas

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (<c2/> real, <c3/>); <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = A cadeia de versão do README divergiu de <c1/>

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Afirmação retirada</b> — uma verificação de CI garante que o emblema de estado do README coincide com <c1/>

# text
seg-347fd8c1f334 = { "0.35" }: afirmações mantidas estreitas e uma correção

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = As funcionalidades de { "0.35" } foram escritas com os seus limites indicados ao lado da afirmação, e as mesmas proteções (<c1/>, e a proteção de formulação em <c2/>) analisam as páginas que as descrevem. Esta tabela não faz parte do registo de catorze linhas acima; regista, para as novas superfícies, o que se afirma e o que não se afirma.

# text
seg-6ac3f9b26aad = O que se afirma

# text
seg-6f558815da86 = O que não se afirma

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Pontuação de confiança da embarcação (<c1/>, <c2/>, gate, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = uma pontuação de 0-100 e motivos a partir do próprio NMEA de um recetor, MODELLED

# text
seg-59ff27c84fe4 = consultivo, não um equipamento de navegação homologado; uma pontuação para um registo não é uma afirmação sobre outros recetores; não torna uma solução de posição mais exata

# text
seg-8869e6a5c10b = NMEA sintético de ponte com eventos programados e um registo do instrutor

# text
seg-bc4ba77bc569 = apenas texto, sem saída de radiofrequência; nunca para os sistemas de navegação em funcionamento de uma embarcação; consultivo, não um equipamento de navegação homologado

# text
seg-9482ecbb2748 = um registo técnico assinado que pode ser verificado offline

# text
seg-20ae6dd2b780 = não é um parecer jurídico; não diz o que causou um evento, quem foi responsável, nem que o registo mostra o que o recetor realmente recebeu

# text
seg-4132fc36f1d3 = células agregadas de navegação degradada a partir de relatórios com licença aberta

# text
seg-c64960abf9fb = não é uma previsão; a exposição de uma rota é uma fração de células, não um risco

# text
seg-ed6d268e0291 = o movimento do veículo e os eventos de um cenário em ficheiros que um simulador de laboratório consegue ler

# text
seg-85c8ad22ef03 = nenhum sinal é escrito; não se afirma o desempenho de nenhum simulador ou recetor

# text
seg-1bba9a883650 = para que linhas um conjunto de execuções fornece elementos de prova em apoio, com uma lacuna em cada linha

# text
seg-f2a836780831 = nunca que um quadro de referência é satisfeito ou que um produto é aprovado; uma etiqueta de tipo de cenário, por si só, não é prova

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>Correção registada em { "0.35" }.</b> Uma versão anterior de <c1/> e dos comentários do módulo de resiliência descrevia sete «categorias de técnicas» do DHS Resilient PNT Conformance Framework. A versão { "2.0" } desse quadro de referência define funções centrais (Prevent, Respond, Recover), níveis de { "0" } a { "4" } e oito requisitos numerados, e nenhuma lista de sete categorias. Os nomes das sete subpontuações que o motor de pontuação emite são do próprio Kshana, e a correspondência passa agora a dizê-lo.

# text
seg-f70787ecb194 = Como uma linha se mantém GREEN

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = As afirmações fortes (OC-0/2/7/8 e as metades superadas de OC-1/3/4/12) estão GREEN porque a capacidade está <b>distribuída e testada</b> — e não porque a formulação tenha sido suavizada. As linhas com afirmação retirada estão GREEN porque a formulação em produção corresponde ao código. O teste de proteção torna a segunda categoria exequível: se uma expressão de afirmação excessiva retirada voltar a uma superfície pública, a CI fica vermelha. Ver <c1/>.

# text
seg-39e475441b60 = <s1>Anterior</s1>Porque é que as linhas continuam modeladas

# text
seg-07ef8e1e862e = <s1>Seguinte</s1>Proveniência
